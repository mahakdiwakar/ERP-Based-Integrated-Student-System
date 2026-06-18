import os
import jwt
import logging
from datetime import datetime, timedelta
from fastapi import HTTPException, Security, Depends, Request
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from pathlib import Path
from dotenv import load_dotenv
import bcrypt

# ---------------------------------------------------------------------------
# Logging
# ---------------------------------------------------------------------------
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Load env variables
env_path = Path(__file__).resolve().parent.parent / '.env.local'
load_dotenv(dotenv_path=env_path)

JWT_SECRET = os.getenv("JWT_SECRET", "college-erp-dev-secret-change-in-production")
JWT_ALGORITHM = "HS256"

ACCESS_TOKEN_EXPIRE_MINUTES = 15
REFRESH_TOKEN_EXPIRE_DAYS = 7

# ---------------------------------------------------------------------------
# Role constants
# ---------------------------------------------------------------------------
# All roles considered "admin-level" for admin-panel endpoints.
# hostel_admin is assigned by /api/hostel/login and MUST be included here.
ADMIN_ROLES = {"admin", "super_admin", "college_admin", "hostel_admin", "warden"}

security = HTTPBearer()


# ---------------------------------------------------------------------------
# Password helpers
# ---------------------------------------------------------------------------

def hash_password(password: str) -> str:
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(password.encode('utf-8'), salt).decode('utf-8')


def verify_password(plain_password: str, hashed_password: str) -> bool:
    try:
        return bcrypt.checkpw(plain_password.encode('utf-8'), hashed_password.encode('utf-8'))
    except Exception:
        return False


# ---------------------------------------------------------------------------
# Token generation
# ---------------------------------------------------------------------------

def sign_token(payload: dict) -> str:
    """Legacy compatibility alias for sign_access_token."""
    return sign_access_token(payload)


def sign_access_token(payload: dict) -> str:
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode = payload.copy()
    to_encode.update({"exp": expire, "type": "access"})
    return jwt.encode(to_encode, JWT_SECRET, algorithm=JWT_ALGORITHM)


def sign_refresh_token(payload: dict) -> str:
    expire = datetime.utcnow() + timedelta(days=REFRESH_TOKEN_EXPIRE_DAYS)
    to_encode = payload.copy()
    to_encode.update({"exp": expire, "type": "refresh"})
    return jwt.encode(to_encode, JWT_SECRET, algorithm=JWT_ALGORITHM)


# ---------------------------------------------------------------------------
# Token verification
# ---------------------------------------------------------------------------

def verify_token(token: str) -> dict:
    try:
        payload = jwt.decode(token, JWT_SECRET, algorithms=[JWT_ALGORITHM])
        if payload.get("type") != "access":
            logger.warning(
                "[AUTH] 401 — Invalid token type: expected 'access', got '%s'",
                payload.get("type")
            )
            raise HTTPException(status_code=401, detail="Invalid token type")
        logger.info(
            "[AUTH] Token OK — user_id=%s role='%s' loginId='%s'",
            payload.get("id"), payload.get("role"), payload.get("loginId")
        )
        return payload
    except jwt.ExpiredSignatureError as exc:
        logger.warning("[AUTH-DEBUG] 401 — Access token has expired (ExpiredSignatureError): %s", exc)
        raise HTTPException(status_code=401, detail="Token has expired")
    except jwt.InvalidTokenError as exc:
        logger.warning("[AUTH-DEBUG] 401 — Invalid token: %s (%s)", exc, type(exc).__name__)
        raise HTTPException(status_code=401, detail=f"Invalid token: {str(exc)}")


def verify_refresh_token(token: str) -> dict:
    try:
        payload = jwt.decode(token, JWT_SECRET, algorithms=[JWT_ALGORITHM])
        if payload.get("type") != "refresh":
            logger.warning(
                "[AUTH] 401 — Invalid refresh token type: expected 'refresh', got '%s'",
                payload.get("type")
            )
            raise HTTPException(status_code=401, detail="Invalid refresh token type")
        return payload
    except jwt.ExpiredSignatureError:
        logger.warning("[AUTH] 401 — Refresh token has expired")
        raise HTTPException(status_code=401, detail="Refresh token has expired")
    except jwt.InvalidTokenError as exc:
        logger.warning("[AUTH] 401 — Invalid refresh token: %s", exc)
        raise HTTPException(status_code=401, detail="Invalid refresh token")


# ---------------------------------------------------------------------------
# FastAPI dependencies
# ---------------------------------------------------------------------------

def get_current_user(
    request: Request,
    credentials: HTTPAuthorizationCredentials = Security(security)
) -> dict:
    """Validates the Bearer token and returns the decoded JWT payload."""
    raw_auth = request.headers.get("Authorization", "")
    logger.info("[AUTH-DEBUG] Raw Authorization Header: '%s'", raw_auth)
    logger.info("[AUTH-DEBUG] Extracted Credentials: '%s'", credentials.credentials)
    try:
        payload = verify_token(credentials.credentials)
        logger.info("[AUTH-DEBUG] Successfully Decoded JWT Payload: %s", payload)
        return payload
    except HTTPException as exc:
        logger.error("[AUTH-DEBUG] Authentication failed with HTTPException: %s", exc.detail)
        raise exc
    except Exception as exc:
        logger.error("[AUTH-DEBUG] Unexpected error in get_current_user: %s (%s)", exc, type(exc).__name__)
        raise HTTPException(status_code=401, detail="Authentication failed")


def get_current_admin(user: dict = Depends(get_current_user)) -> dict:
    """
    Dependency that accepts ANY admin-level role.
    Accepted: admin, super_admin, college_admin, hostel_admin, warden.
    Use this on admin-panel endpoints instead of require_role(['admin']).
    """
    role = user.get("role", "")
    if role not in ADMIN_ROLES:
        logger.warning(
            "[AUTH] 403 — user_id=%s role='%s' is NOT in ADMIN_ROLES %s",
            user.get("id"), role, sorted(ADMIN_ROLES)
        )
        raise HTTPException(
            status_code=403,
            detail=f"Access denied: role '{role}' does not have admin privileges"
        )
    logger.info(
        "[AUTH] Admin access granted — user_id=%s role='%s'",
        user.get("id"), role
    )
    return user


def require_role(roles: list):
    """
    Returns a FastAPI dependency that enforces role-based access.

    Special expansion rule:
      If 'admin' appears in `roles`, the full ADMIN_ROLES set is also accepted.
      This means hostel_admin, super_admin, college_admin, and warden all pass
      when an endpoint declares require_role(['admin']).

    Example:
        require_role(['admin'])        # accepts all ADMIN_ROLES
        require_role(['teacher'])      # accepts only 'teacher'
        require_role(['student'])      # accepts only 'student'
    """
    # Build the effective accepted role set, expanding "admin" if present
    effective_roles: set = set(roles)
    if "admin" in effective_roles:
        effective_roles |= ADMIN_ROLES   # include all admin variants

    def dependency(user: dict = Depends(get_current_user)) -> dict:
        role = user.get("role", "")
        if role not in effective_roles:
            logger.warning(
                "[AUTH] 403 — user_id=%s role='%s' not in allowed roles=%s",
                user.get("id"), role, sorted(effective_roles)
            )
            raise HTTPException(
                status_code=403,
                detail=(
                    f"Access denied: role '{role}' is not permitted for this endpoint. "
                    f"Required one of: {sorted(effective_roles)}"
                )
            )
        logger.info(
            "[AUTH] Role check passed — user_id=%s role='%s' endpoint_roles=%s",
            user.get("id"), role, sorted(effective_roles)
        )
        return user

    return dependency
