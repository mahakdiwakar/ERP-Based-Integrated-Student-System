import os
import uuid
import datetime
from pathlib import Path
from typing import List, Dict, Any, Optional

from fastapi import FastAPI, HTTPException, Depends, Security, Response, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse, HTMLResponse
from pydantic import BaseModel, Field

import razorpay

# Import custom helpers
from db_helper import from_table
from auth_utils import (
    hash_password, verify_password, sign_token, require_role, get_current_user,
    get_current_admin, sign_access_token, sign_refresh_token, verify_refresh_token,
    ADMIN_ROLES
)
from receipt_pdf import generate_receipt_pdf
from demo_students import bulk_insert_demo_students, generate_demo_student_records

# Setup directories
BASE_DIR = Path(__file__).resolve().parent.parent

app = FastAPI(title="SNS College ERP API", version="1.0.0")

@app.middleware("http")
async def add_security_headers(request, call_next):
    response = await call_next(request)
    path = request.url.path
    if path.endswith(".html") or path == "/" or path.startswith("/api/"):
        response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate, max-age=0"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "0"

    # Log 401/403 responses for debugging
    status = response.status_code
    if status in (401, 403):
        auth_header = request.headers.get("authorization", "<missing>")
        token_hint = auth_header[:40] + "..." if len(auth_header) > 40 else auth_header
        print(
            f"[AUTH-MIDDLEWARE] {status} on {request.method} {path} "
            f"| Authorization: {token_hint}"
        )
    return response

# Setup CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # More permissive for production behind a proxy
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Initialize Razorpay Client
RAZORPAY_KEY_ID = os.getenv("RAZORPAY_KEY_ID", "")
RAZORPAY_KEY_SECRET = os.getenv("RAZORPAY_KEY_SECRET", "")

if RAZORPAY_KEY_ID and RAZORPAY_KEY_SECRET:
    try:
        razorpay_client = razorpay.Client(auth=(RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET))
    except Exception as e:
        print(f"Error initializing Razorpay client: {e}")
        razorpay_client = None
else:
    print("Warning: Razorpay credentials not found in env. Running in Demo/Mock Mode.")
    razorpay_client = None


# --- Pydantic Models ---

class StudentLoginPayload(BaseModel):
    enrollment_number: str
    password: str

class TeacherLoginPayload(BaseModel):
    teacher_id: str
    password: str

class AdminLoginPayload(BaseModel):
    username: str
    password: str

class PayFeesPayload(BaseModel):
    amount: float

class CreateOrderPayload(BaseModel):
    amount: float
    student_id: Optional[int] = None

class VerifyPaymentPayload(BaseModel):
    razorpay_order_id: str
    razorpay_payment_id: str
    razorpay_signature: str
    amount: float

class CreateStudentPayload(BaseModel):
    name: str
    department_code: str
    enrollment_number: str
    password: str
    class_name: str

class CreateTeacherPayload(BaseModel):
    name: str
    department_code: str
    teacher_id: str
    password: str
    class_names: List[str]

class UpdateUserPayload(BaseModel):
    name: str
    password: Optional[str] = None
    department_code: Optional[str] = None

class AttendanceRecord(BaseModel):
    student_id: int
    status: str

class SaveAttendanceData(BaseModel):
    teacher_id: int
    class_id: int
    attendance_date: str
    attendance: List[AttendanceRecord]

class MarksRecord(BaseModel):
    student_id: int
    marks_obtained: float
    max_marks: Optional[float] = 20.0

class SaveMarksPayload(BaseModel):
    class_id: int
    subject_id: int
    records: List[MarksRecord]

# --- Hostel Module Pydantic Models ---

class CreateHostelPayload(BaseModel):
    hostel_name: str
    gender: str

class CreateRoomPayload(BaseModel):
    hostel_id: int
    room_number: str
    floor: int
    capacity: int

class AllocateRoomPayload(BaseModel):
    student_id: int
    hostel_id: Optional[int] = None
    room_id: Optional[int] = None
    bed_number: Optional[int] = None

class ChangeRoomPayload(BaseModel):
    allocation_id: int
    new_room_id: int
    new_bed_number: Optional[int] = None

class PayHostelFeePayload(BaseModel):
    amount: float

class HostelStudentPayload(BaseModel):
    student_name: str
    enrollment_no: str
    department: str
    class_name: str
    hostel_name: str
    room_number: str
    bed_number: str
    phone: str
    allocation_status: Optional[str] = "allocated"


# --- Helper Methods & Caching ---

import time

class ResponseCache:
    def __init__(self, ttl_seconds: float = 10.0):
        self.ttl = ttl_seconds
        self.cache = {}

    def get(self, key: str):
        if key in self.cache:
            val, expiry = self.cache[key]
            if time.time() < expiry:
                print(f"[CACHE] Hit for key '{key}'")
                return val
            else:
                print(f"[CACHE] Expired for key '{key}'")
                del self.cache[key]
        return None

    def set(self, key: str, val):
        self.cache[key] = (val, time.time() + self.ttl)
        print(f"[CACHE] Set key '{key}' with TTL {self.ttl}s")

    def clear(self):
        self.cache.clear()
        print("[CACHE] Cleared all cache entries")

# Global caches
analytics_cache = ResponseCache(ttl_seconds=10.0)


def query_user(table: str, id_field: str, id_value: str, role: str, token_fields_fn):
    res = from_table(table).select("*").eq(id_field, id_value).maybe_single().execute()
    if res["error"] or not res["data"]:
        return None
    
    user_data = res["data"]
    return user_data

# --- Auth Endpoints ---

@app.post("/api/student/login")
async def student_login(payload: StudentLoginPayload):
    enrollment = payload.enrollment_number.strip().upper()
    user_data = query_user("college_students", "enrollment_number", enrollment, "student", None)
    if not user_data or not verify_password(payload.password, user_data["password_hash"]):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    
    token_payload = {
        "role": "student",
        "id": user_data["id"],
        "loginId": user_data["enrollment_number"],
        "name": user_data["name"],
        "department_id": user_data["department_id"],
        "class_id": user_data["class_id"]
    }
    
    access_token = sign_access_token(token_payload)
    refresh_token = sign_refresh_token(token_payload)
    return {
        "success": True,
        "token": access_token,
        "accessToken": access_token,
        "refreshToken": refresh_token,
        "role": "student",
        "user": token_payload
    }

@app.post("/api/teacher/login")
async def teacher_login(payload: TeacherLoginPayload):
    teacher_id = payload.teacher_id.strip().upper()
    user_data = query_user("college_teachers", "teacher_id", teacher_id, "teacher", None)
    if not user_data or not verify_password(payload.password, user_data["password_hash"]):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    
    token_payload = {
        "role": "teacher",
        "id": user_data["id"],
        "loginId": user_data["teacher_id"],
        "name": user_data["name"],
        "department_id": user_data["department_id"]
    }
    
    access_token = sign_access_token(token_payload)
    refresh_token = sign_refresh_token(token_payload)
    return {
        "success": True,
        "token": access_token,
        "accessToken": access_token,
        "refreshToken": refresh_token,
        "role": "teacher",
        "user": token_payload
    }

@app.post("/api/admin/login")
async def admin_login(payload: AdminLoginPayload):
    username = payload.username.strip().lower()
    user_data = query_user("college_admins", "username", username, "admin", None)
    if not user_data or not verify_password(payload.password, user_data["password_hash"]):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    # Assign role: 'admin' username gets super_admin, others get college_admin.
    # Both are in ADMIN_ROLES so all /api/admin/* endpoints will accept them.
    role = "super_admin" if username == "admin" else "college_admin"
    token_payload = {
        "role": role,
        "id": user_data["id"],
        "loginId": user_data["username"],
        "name": user_data["name"]
    }

    print(f"[AUTH] Admin login OK — username='{username}' assigned role='{role}'")
    access_token = sign_access_token(token_payload)
    refresh_token = sign_refresh_token(token_payload)
    return {
        "success": True,
        "token": access_token,
        "accessToken": access_token,
        "refreshToken": refresh_token,
        "role": role,
        "user": token_payload
    }

class RefreshTokenPayload(BaseModel):
    refresh_token: str

@app.post("/api/auth/refresh")
async def refresh_token_endpoint(payload: RefreshTokenPayload):
    try:
        decoded = verify_refresh_token(payload.refresh_token)
        user_payload = {
            "role": decoded.get("role"),
            "id": decoded.get("id"),
            "loginId": decoded.get("loginId"),
            "name": decoded.get("name")
        }
        if "department_id" in decoded:
            user_payload["department_id"] = decoded["department_id"]
        if "class_id" in decoded:
            user_payload["class_id"] = decoded["class_id"]
            
        new_access = sign_access_token(user_payload)
        new_refresh = sign_refresh_token(user_payload)
        return {
            "success": True,
            "accessToken": new_access,
            "refreshToken": new_refresh,
            "role": decoded.get("role"),
            "user": user_payload
        }
    except HTTPException as he:
        raise he
    except Exception as e:
        raise HTTPException(status_code=401, detail="Invalid refresh token")

# Legacy Auth redirects
@app.post("/api/auth/student/login")
async def legacy_student_login(payload: StudentLoginPayload):
    return await student_login(payload)

@app.post("/api/auth/teacher/login")
async def legacy_teacher_login(payload: TeacherLoginPayload):
    return await teacher_login(payload)

@app.post("/api/auth/admin/login")
async def legacy_admin_login(payload: AdminLoginPayload):
    return await admin_login(payload)


# --- Student Endpoints ---

@app.get("/api/student/dashboard")
async def student_dashboard(user: dict = Depends(require_role(["student"]))):
    student_id = user["id"]
    
    # 1. Fetch Student Details via optimized view
    st_res = from_table("college_student_details_view").select("*").eq("id", student_id).single().execute()
    if st_res["error"] or not st_res["data"]:
        raise HTTPException(status_code=404, detail="Student not found")
    student = st_res["data"]
    
    # 2. Fetch Attendance via enriched view
    att_res = from_table("college_attendance_enriched").select("status, attendance_date, teacher_name").eq("student_id", student_id).execute()
    attendance_records = att_res["data"] or []
    total_att = len(attendance_records)
    present_att = sum(1 for a in attendance_records if a["status"] == "present")
    att_pct = round((present_att / total_att) * 100) if total_att > 0 else 0
    
    history = []
    for a in attendance_records:
        history.append({
            "date": a["attendance_date"],
            "status": a["status"],
            "teacher": a["teacher_name"] or "Unknown"
        })
    
    # 3. Fetch Mid Sem Marks via enriched view
    marks_res = from_table("college_marks_enriched").select("marks_obtained, max_marks, subject_name").eq("student_id", student_id).eq("exam_type", "mid_sem").execute()
    marks_records = marks_res["data"] or []
    
    marks_list = []
    for m in marks_records:
        marks_list.append({
            "subject": m["subject_name"] or "Subject",
            "obtained": float(m["marks_obtained"]),
            "max": float(m["max_marks"])
        })
        
    avg_marks = 0
    if marks_list:
        avg_marks = round(sum((m["obtained"] / m["max"]) * 100 for m in marks_list) / len(marks_list))
        
    # 4. Fetch Fee details
    fees_res = from_table("college_fees").select("*").eq("student_id", student_id).maybe_single().execute()
    fees_data = fees_res["data"]
    
    total_fees = float(fees_data["total_fee"]) if fees_data else 50000.0
    paid = float(fees_data["paid_amount"]) if fees_data else 0.0
    pending = float(fees_data["pending_amount"]) if fees_data else total_fees
    
    if pending <= 0:
        status_str = "PAID"
    elif paid > 0:
        status_str = "PARTIALLY PAID"
    else:
        status_str = "PENDING"
    
    return {
        "student": {
            "name": student["name"],
            "enrollment": student["enrollment_number"],
            "department": student["department_name"],
            "class": student["class_name"]
        },
        "attendance": {
            "total": total_att,
            "present": present_att,
            "percentage": att_pct,
            "history": history
        },
        "marks": {
            "subjects": marks_list,
            "average": avg_marks
        },
        "fees": {
            "id": fees_data["id"] if fees_data else None,
            "total": total_fees,
            "paid": paid,
            "pending": pending,
            "status": status_str
        }
    }

@app.get("/api/student/dashboard-summary")
async def student_dashboard_summary(user: dict = Depends(require_role(["student"]))):
    student_id = user["id"]
    
    # 1. Fetch main dashboard data
    dashboard_data = await student_dashboard(user)
    
    # 2. Fetch hostel details via enriched view
    alloc_res = from_table("hostel_allocations_enriched").select("*").eq("student_id", student_id).neq("status", "Removed").maybe_single().execute()
    alloc = alloc_res["data"]
    
    hostel_data = {"allocated": False}
    if alloc:
        roommates = []
        if alloc["room_id"]:
            mates_res = from_table("hostel_allocations_enriched").select("student_name").eq("room_id", alloc["room_id"]).neq("student_id", student_id).neq("status", "Removed").execute()
            roommates = [m["student_name"] for m in (mates_res["data"] or [])]
            
        fee_res = from_table("college_hostel_fees").select("*").eq("student_id", student_id).maybe_single().execute()
        fee = fee_res["data"] or {"total_fee": 30000, "paid_amount": 0, "pending_amount": 30000, "status": "pending"}
        
        hostel_data = {
            "allocated": True,
            "status": alloc["status"],
            "hostel_name": alloc["hostel_name"] or "Unknown",
            "room_number": alloc["room_number"] or "Pending",
            "floor": alloc["floor"] or 0,
            "bed_number": alloc["bed_number"],
            "allocation_date": alloc["allocation_date"],
            "roommates": roommates,
            "fees": {
                "total": float(fee["total_fee"]),
                "paid": float(fee["paid_amount"]),
                "pending": float(fee["pending_amount"]),
                "status": fee["status"]
            }
        }
        
    return {
        **dashboard_data,
        "hostel": hostel_data
    }

@app.post("/api/student/fees/pay")
async def student_pay_fees(payload: PayFeesPayload, user: dict = Depends(require_role(["student"]))):
    student_id = user["id"]
    amount = payload.amount
    
    fees_res = from_table("college_fees").select("*").eq("student_id", student_id).single().execute()
    if fees_res["error"] or not fees_res["data"]:
        raise HTTPException(status_code=404, detail="Fee record not found")
        
    fees_data = fees_res["data"]
    total_fee = float(fees_data["total_fee"])
    paid_amount = float(fees_data["paid_amount"])
    pending = float(fees_data["pending_amount"])
    
    pay_amount = amount if amount > 0 else pending
    if pay_amount <= 0 or pay_amount > pending:
        raise HTTPException(status_code=400, detail="Invalid payment amount")
        
    new_paid = paid_amount + pay_amount
    new_pending = max(0.0, total_fee - new_paid)
    
    if new_pending <= 0:
        new_status = "PAID"
    elif new_paid > 0:
        new_status = "PARTIALLY PAID"
    else:
        new_status = "PENDING"
    
    update_res = from_table("college_fees").update({
        "paid_amount": new_paid,
        "pending_amount": new_pending,
        "status": new_status,
        "updated_at": datetime.datetime.utcnow().isoformat()
    }).eq("student_id", student_id).execute()
    
    if update_res["error"]:
        raise HTTPException(status_code=500, detail=update_res["error"]["message"])
        
    analytics_cache.clear() # Invalidate analytics cache
    return {"success": True, "fees": update_res["data"][0]}

@app.get("/api/student/attendance")
async def student_get_attendance(user: dict = Depends(require_role(["student"]))):
    student_id = user["id"]
    
    att_res = from_table("college_attendance_enriched").select("status, attendance_date, teacher_name").eq("student_id", student_id).execute()
    if att_res["error"]:
        raise HTTPException(status_code=500, detail=att_res["error"]["message"])
    records_raw = att_res["data"] or []
    
    records = []
    present_days = 0
    absent_days = 0
    
    for r in records_raw:
        status = r["status"]
        if status == "present":
            present_days += 1
        elif status == "absent":
            absent_days += 1
            
        records.append({
            "date": r["attendance_date"],
            "status": status,
            "teacher": r["teacher_name"] or "Unknown"
        })
        
    total = len(records)
    attendance_percentage = round((present_days / total) * 100) if total > 0 else 0
    
    return {
        "student_id": student_id,
        "attendance_percentage": attendance_percentage,
        "present_days": present_days,
        "absent_days": absent_days,
        "records": records
    }


# --- NEW Payment API Routes ---

@app.get("/api/student/fees")
async def student_get_fees(user: dict = Depends(require_role(["student"]))):
    student_id = user["id"]
    fees_res = from_table("college_fees").select("*").eq("student_id", student_id).maybe_single().execute()
    if fees_res["error"]:
        raise HTTPException(status_code=500, detail=fees_res["error"]["message"])
    return fees_res["data"]

@app.post("/api/payment/create-order")
@app.post("/payment/create-order")
async def payment_create_order(payload: CreateOrderPayload, user: dict = Depends(require_role(["student"]))):
    if payload.student_id is not None and payload.student_id != user["id"]:
        raise HTTPException(status_code=403, detail="Student ID mismatch")
    amount = payload.amount
    if amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid payment amount")
        
    amount_in_paise = int(amount * 100)
    
    if razorpay_client:
        try:
            order = razorpay_client.order.create({
                "amount": amount_in_paise,
                "currency": "INR",
                "payment_capture": 1
            })
            # Temporarily save order_id to fee table
            from_table("college_fees").update({
                "razorpay_order_id": order["id"]
            }).eq("student_id", user["id"]).execute()
            
            return {
                "success": True,
                "order_id": order["id"],
                "amount": amount,
                "key_id": RAZORPAY_KEY_ID
            }
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Razorpay order failed: {str(e)}")
    else:
        # Mock mode
        mock_order_id = f"order_mock_{uuid.uuid4().hex[:12]}"
        from_table("college_fees").update({
            "razorpay_order_id": mock_order_id
        }).eq("student_id", user["id"]).execute()
        
        return {
            "success": True,
            "order_id": mock_order_id,
            "amount": amount,
            "key_id": "rzp_test_mockkey123"
        }

@app.post("/api/payment/verify")
@app.post("/payment/verify")
async def payment_verify(payload: VerifyPaymentPayload, user: dict = Depends(require_role(["student"]))):
    student_id = user["id"]
    order_id = payload.razorpay_order_id
    payment_id = payload.razorpay_payment_id
    signature = payload.razorpay_signature
    amount = payload.amount
    
    # Signature verification
    if razorpay_client and not order_id.startswith("order_mock_"):
        try:
            razorpay_client.utility.verify_payment_signature({
                'razorpay_order_id': order_id,
                'razorpay_payment_id': payment_id,
                'razorpay_signature': signature
            })
        except Exception:
            raise HTTPException(status_code=400, detail="Payment signature verification failed")
            
    # Update fee details in database
    fees_res = from_table("college_fees").select("*").eq("student_id", student_id).single().execute()
    if fees_res["error"] or not fees_res["data"]:
        raise HTTPException(status_code=404, detail="Fee record not found")
        
    fees_data = fees_res["data"]
    total_fee = float(fees_data["total_fee"])
    paid_amount = float(fees_data["paid_amount"])
    pending = float(fees_data["pending_amount"])
    
    new_paid = paid_amount + amount
    new_pending = max(0.0, total_fee - new_paid)
    
    if new_pending <= 0:
        new_status = "PAID"
    elif new_paid > 0:
        new_status = "PARTIALLY PAID"
    else:
        new_status = "PENDING"
    
    update_res = from_table("college_fees").update({
        "paid_amount": new_paid,
        "pending_amount": new_pending,
        "status": new_status,
        "razorpay_order_id": order_id,
        "razorpay_payment_id": payment_id,
        "transaction_id": payment_id,
        "updated_at": datetime.datetime.utcnow().isoformat()
    }).eq("student_id", student_id).execute()
    
    if update_res["error"]:
        raise HTTPException(status_code=500, detail=update_res["error"]["message"])
        
    analytics_cache.clear() # Invalidate analytics cache
    return {"success": True, "fees": update_res["data"][0]}

@app.get("/api/student/receipt/{fee_id}")
async def get_student_receipt(fee_id: int, user: dict = Depends(get_current_user)):
    # Validate authorization (either student downloads their own receipt, or an admin accesses it)
    fees_res = from_table("college_fees").select("*").eq("id", fee_id).single().execute()
    if fees_res["error"] or not fees_res["data"]:
        raise HTTPException(status_code=404, detail="Fee receipt record not found")
        
    fees = fees_res["data"]
    if user["role"] == "student" and fees["student_id"] != user["id"]:
        raise HTTPException(status_code=403, detail="Access denied")
        
    # Fetch Student details
    st_res = from_table("college_students").select("*").eq("id", fees["student_id"]).single().execute()
    student = st_res["data"]
    
    dept_res = from_table("college_departments").select("name").eq("id", student["department_id"]).single().execute()
    dept = dept_res["data"]["name"] if dept_res["data"] else "AIML"
    
    cls_res = from_table("college_classes").select("name").eq("id", student["class_id"]).single().execute()
    class_name = cls_res["data"]["name"] if cls_res["data"] else "AIML-A"
    
    # Generate receipt
    date_str = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    pdf_bytes = generate_receipt_pdf(
        student_name=student["name"],
        enrollment=student["enrollment_number"],
        department=dept,
        class_name=class_name,
        total_fee=fees["total_fee"],
        paid=fees["paid_amount"],
        pending=fees["pending_amount"],
        order_id=fees.get("razorpay_order_id"),
        payment_id=fees.get("razorpay_payment_id"),
        transaction_id=fees.get("transaction_id"),
        date_str=date_str
    )
    
    return Response(
        content=pdf_bytes,
        media_type="application/pdf",
        headers={
            "Content-Disposition": f"attachment; filename=Receipt_{student['enrollment_number']}.pdf",
            "Access-Control-Expose-Headers": "Content-Disposition"
        }
    )


# --- Teacher Endpoints ---

async def get_assigned_classes(teacher_id: int):
    links_res = from_table("college_teacher_classes").select("class_id").eq("teacher_id", teacher_id).execute()
    links = links_res["data"] or []
    if not links:
        return []
        
    class_ids = [l["class_id"] for l in links]
    classes_res = from_table("college_classes").select("id, name, department_id").in_("id", class_ids).execute()
    classes = classes_res["data"] or []
    
    depts_res = from_table("college_departments").select("id, name").execute()
    depts = depts_res["data"] or []
    dept_map = {d["id"]: d["name"] for d in depts}
    
    return [{
        "id": c["id"],
        "name": c["name"],
        "department": dept_map.get(c["department_id"], "AIML")
    } for c in classes]

class_access_cache = {}

async def verify_class_access(teacher_id: int, class_id: int):
    key = (teacher_id, class_id)
    now = datetime.datetime.now().timestamp()
    if key in class_access_cache:
        has_access, expiry = class_access_cache[key]
        if expiry > now:
            print(f"[PERF] verify_class_access cache hit for {key}")
            return has_access
            
    print(f"[PERF] verify_class_access cache miss for {key}, querying DB")
    res = from_table("college_teacher_classes").select("id").eq("teacher_id", teacher_id).eq("class_id", class_id).maybe_single().execute()
    has_access = bool(res["data"])
    
    # Cache for 60 seconds
    class_access_cache[key] = (has_access, now + 60.0)
    return has_access

@app.get("/api/teacher/classes")
async def teacher_classes(user: dict = Depends(require_role(["teacher"]))):
    classes = await get_assigned_classes(user["id"])
    return {"classes": classes}

@app.get("/api/teacher/classes/{class_id}/students")
async def teacher_class_students(class_id: int, date: Optional[str] = None, user: dict = Depends(require_role(["teacher"]))):
    if not await verify_class_access(user["id"], class_id):
        raise HTTPException(status_code=403, detail="You are not assigned to this class")
        
    students_res = from_table("college_students").select("id, enrollment_number, name").eq("class_id", class_id).order("name").execute()
    students = students_res["data"] or []
    
    target_date = date if date else datetime.date.today().isoformat()
    att_res = from_table("college_attendance").select("student_id, status").eq("class_id", class_id).eq("attendance_date", target_date).execute()
    today_att = att_res["data"] or []
    att_map = {a["student_id"]: a["status"] for a in today_att}
    
    result = []
    for s in students:
        result.append({
            "id": s["id"],
            "enrollment_number": s["enrollment_number"],
            "name": s["name"],
            "status": att_map.get(s["id"])
        })
        
    return {"students": result}

@app.post("/api/attendance/save")
async def root_save_attendance(payload: SaveAttendanceData, user: dict = Depends(require_role(["teacher"]))):
    class_id = payload.class_id
    if user["id"] != payload.teacher_id:
        raise HTTPException(status_code=403, detail="Teacher ID mismatch")
    if not await verify_class_access(payload.teacher_id, class_id):
        raise HTTPException(status_code=403, detail="You are not assigned to this class")
        
    target_date = payload.attendance_date
    t_date = datetime.date.fromisoformat(target_date)
    today = datetime.date.today()
    
    if t_date > today:
        raise HTTPException(status_code=400, detail="Cannot mark attendance for future dates")
    if (today - t_date).days > 30:
        raise HTTPException(status_code=400, detail="Cannot edit attendance older than 30 days")
        
    import time
    start_time = time.time()
    
    records = []
    for rec in payload.attendance:
        records.append({
            "student_id": rec.student_id,
            "class_id": class_id,
            "attendance_date": target_date,
            "status": rec.status,
            "marked_by": payload.teacher_id,
            "updated_at": datetime.datetime.utcnow().isoformat()
        })
        
    db_start = time.time()
    res = from_table("college_attendance").upsert(records, on_conflict="student_id,attendance_date").execute()
    db_duration = (time.time() - db_start) * 1000
    total_duration = (time.time() - start_time) * 1000
    
    print(f"[PERF] FastAPI Save Attendance DB Upsert took {db_duration:.2f}ms for {len(records)} records")
    print(f"[PERF] FastAPI Save Attendance Total Handler took {total_duration:.2f}ms")
    
    if res.get("error"):
         raise HTTPException(status_code=500, detail=res["error"]["message"])
            
    analytics_cache.clear() # Invalidate analytics cache
    return {"success": True, "message": "Attendance saved successfully"}

@app.get("/api/teacher/classes/{class_id}/subjects")
async def teacher_class_subjects(class_id: int, user: dict = Depends(require_role(["teacher"]))):
    if not await verify_class_access(user["id"], class_id):
        raise HTTPException(status_code=403, detail="You are not assigned to this class")
        
    cls_res = from_table("college_classes").select("department_id").eq("id", class_id).single().execute()
    class_row = cls_res["data"]
    if not class_row:
        raise HTTPException(status_code=404, detail="Class not found")
        
    subjects_res = from_table("college_subjects").select("id, name, max_marks").eq("department_id", class_row["department_id"]).execute()
    return {"subjects": subjects_res["data"] or []}

@app.get("/api/teacher/classes/{class_id}/marks")
async def teacher_class_marks(class_id: int, subject_id: int, user: dict = Depends(require_role(["teacher"]))):
    if not await verify_class_access(user["id"], class_id):
        raise HTTPException(status_code=403, detail="You are not assigned to this class")
        
    students_res = from_table("college_students").select("id, enrollment_number, name").eq("class_id", class_id).execute()
    students = students_res["data"] or []
    
    marks_res = from_table("college_marks").select("student_id, marks_obtained, max_marks").eq("class_id", class_id).eq("subject_id", subject_id).eq("exam_type", "mid_sem").execute()
    marks = marks_res["data"] or []
    mark_map = {m["student_id"]: m for m in marks}
    
    result = []
    for s in students:
        s_mark = mark_map.get(s["id"])
        result.append({
            "id": s["id"],
            "enrollment_number": s["enrollment_number"],
            "name": s["name"],
            "marks_obtained": float(s_mark["marks_obtained"]) if s_mark else None,
            "max_marks": float(s_mark["max_marks"]) if s_mark else 20.0
        })
        
    return {"students": result}

@app.post("/api/teacher/marks")
async def teacher_save_marks(payload: SaveMarksPayload, user: dict = Depends(require_role(["teacher"]))):
    class_id = payload.class_id
    subject_id = payload.subject_id
    if not await verify_class_access(user["id"], class_id):
        raise HTTPException(status_code=403, detail="You are not assigned to this class")
        
    for rec in payload.records:
        existing_res = from_table("college_marks").select("id").eq("student_id", rec.student_id).eq("subject_id", subject_id).eq("exam_type", "mid_sem").maybe_single().execute()
        existing = existing_res["data"]
        
        payload_data = {
            "marks_obtained": rec.marks_obtained,
            "max_marks": rec.max_marks or 20.0,
            "updated_by": user["id"],
            "updated_at": datetime.datetime.utcnow().isoformat()
        }
        
        if existing:
            from_table("college_marks").update(payload_data).eq("id", existing["id"]).execute()
        else:
            from_table("college_marks").insert({
                "student_id": rec.student_id,
                "subject_id": subject_id,
                "class_id": class_id,
                "exam_type": "mid_sem",
                **payload_data
            }).execute()
            
    return {"success": True, "saved": len(payload.records)}


# --- Admin Endpoints ---

DEPT_CODES = ["AIML", "CYBER"]

@app.get("/api/admin/users")
async def admin_get_users(user: dict = Depends(require_role(["admin"]))):
    st_res = from_table("college_students").select("id, enrollment_number, password_plain, name, department_id").order("name").execute()
    students = st_res["data"] or []
    
    tc_res = from_table("college_teachers").select("id, teacher_id, password_plain, name, department_id").order("name").execute()
    teachers = tc_res["data"] or []
    
    depts_res = from_table("college_departments").select("id, name").execute()
    depts = depts_res["data"] or []
    dept_map = {d["id"]: d["name"] for d in depts}
    
    student_list = [{
        "id": s["id"],
        "loginId": s["enrollment_number"],
        "password": s["password_plain"],
        "name": s["name"],
        "department": dept_map.get(s["department_id"]),
        "type": "student"
    } for s in students]
    
    teacher_list = [{
        "id": t["id"],
        "loginId": t["teacher_id"],
        "password": t["password_plain"],
        "name": t["name"],
        "department": dept_map.get(t["department_id"]),
        "type": "teacher"
    } for t in teachers]
    
    return {
        "students": student_list,
        "teachers": teacher_list
    }

@app.get("/api/admin/departments")
async def admin_get_departments(user: dict = Depends(require_role(["admin"]))):
    depts_res = from_table("college_departments").select("id, code, name").execute()
    return {"departments": depts_res["data"] or []}

@app.get("/api/admin/classes")
async def admin_get_classes(user: dict = Depends(require_role(["admin"]))):
    classes_res = from_table("college_classes").select("id, name, department_id").execute()
    return {"classes": classes_res["data"] or []}

@app.post("/api/admin/generate-demo-students")
async def admin_generate_demo_students(user: dict = Depends(require_role(["admin"]))):
    try:
        result = bulk_insert_demo_students()
        return {
            "success": True,
            "message": f"Created {result['created']} demo students ({result['skipped']} skipped as duplicates).",
            **result,
        }
    except ValueError as e:
        raise HTTPException(status_code=409, detail=str(e))
    except RuntimeError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/admin/users/student")
async def admin_create_student(payload: CreateStudentPayload, user: dict = Depends(require_role(["admin"]))):
    if payload.department_code not in DEPT_CODES:
        raise HTTPException(status_code=400, detail="Department must be AIML or CYBER")
        
    dept_res = from_table("college_departments").select("id").eq("code", payload.department_code).single().execute()
    dept = dept_res["data"]
    
    cls_res = from_table("college_classes").select("id").eq("name", payload.class_name).single().execute()
    cls = cls_res["data"]
    
    if not dept or not cls:
        raise HTTPException(status_code=404, detail="Department or Class not found")
        
    insert_res = from_table("college_students").insert({
        "enrollment_number": payload.enrollment_number.strip().upper(),
        "password_hash": hash_password(payload.password),
        "password_plain": payload.password,
        "name": payload.name,
        "department_id": dept["id"],
        "class_id": cls["id"]
    }).execute()
    
    if insert_res["error"]:
        raise HTTPException(status_code=400, detail=insert_res["error"]["message"])
        
    student = insert_res["data"][0]
    
    # Initialize fee record for student
    from_table("college_fees").insert({
        "student_id": student["id"],
        "total_fee": 50000.0,
        "paid_amount": 0.0,
        "pending_amount": 50000.0,
        "status": "pending"
    }).execute()
    
    return {"success": True, "student": student}

@app.post("/api/admin/users/teacher")
async def admin_create_teacher(payload: CreateTeacherPayload, user: dict = Depends(require_role(["admin"]))):
    if payload.department_code not in DEPT_CODES:
        raise HTTPException(status_code=400, detail="Department must be AIML or CYBER")
        
    if len(payload.class_names) > 5:
        raise HTTPException(status_code=400, detail="Maximum 5 classes per teacher")
        
    dept_res = from_table("college_departments").select("id").eq("code", payload.department_code).single().execute()
    dept = dept_res["data"]
    
    if not dept:
        raise HTTPException(status_code=404, detail="Department not found")
        
    insert_res = from_table("college_teachers").insert({
        "teacher_id": payload.teacher_id.strip().upper(),
        "password_hash": hash_password(payload.password),
        "password_plain": payload.password,
        "name": payload.name,
        "department_id": dept["id"]
    }).execute()
    
    if insert_res["error"]:
        raise HTTPException(status_code=400, detail=insert_res["error"]["message"])
        
    teacher = insert_res["data"][0]
    
    if payload.class_names:
        classes_res = from_table("college_classes").select("id, name").in_("name", payload.class_names).execute()
        classes = classes_res["data"] or []
        
        tc_links = [{"teacher_id": teacher["id"], "class_id": c["id"]} for c in classes]
        from_table("college_teacher_classes").insert(tc_links).execute()
        
    return {"success": True, "teacher": teacher}

@app.put("/api/admin/users/{type_str}/{user_id}")
async def admin_update_user(type_str: str, user_id: int, payload: UpdateUserPayload, user: dict = Depends(require_role(["admin"]))):
    table = "college_students" if type_str == "student" else "college_teachers"
    
    updates = {"name": payload.name}
    if payload.password:
        updates["password_hash"] = hash_password(payload.password)
        updates["password_plain"] = payload.password
        
    if payload.department_code:
        dept_res = from_table("college_departments").select("id").eq("code", payload.department_code).single().execute()
        if dept_res["data"]:
            updates["department_id"] = dept_res["data"]["id"]
            
    update_res = from_table(table).update(updates).eq("id", user_id).execute()
    if update_res["error"]:
        raise HTTPException(status_code=500, detail=update_res["error"]["message"])
        
    return {"success": True, "user": update_res["data"][0]}

@app.delete("/api/admin/users/{type_str}/{user_id}")
async def admin_delete_user(type_str: str, user_id: int, user: dict = Depends(require_role(["admin"]))):
    table = "college_students" if type_str == "student" else "college_teachers"
    delete_res = from_table(table).delete().eq("id", user_id).execute()
    if delete_res["error"]:
        raise HTTPException(status_code=500, detail=delete_res["error"]["message"])
    return {"success": True}

@app.get("/api/admin/analytics")
async def admin_analytics(user: dict = Depends(require_role(["admin"]))):
    cache_key = "admin_analytics"
    cached_res = analytics_cache.get(cache_key)
    if cached_res:
        return cached_res

    # Query the aggregated view for all students
    st_res = from_table("college_student_analytics").select("*").execute()
    student_stats_raw = st_res["data"] or []
    
    student_stats = []
    all_pcts = []
    
    for s in student_stats_raw:
        avg_m = float(s["avg_marks"])
        student_stats.append({
            "id": s["id"],
            "name": s["name"],
            "enrollment": s["enrollment"],
            "department": s["department"] or "AIML",
            "class": s["class"] or "AIML-A",
            "attendancePct": s["attendance_pct"],
            "avgMarks": avg_m
        })
        if avg_m > 0:
            all_pcts.append(avg_m)
            
    # Calculate dept average marks from student_stats in memory
    dept_marks = {}
    for s in student_stats:
        dept = s["department"]
        if s["avgMarks"] > 0:
            if dept not in dept_marks:
                dept_marks[dept] = []
            dept_marks[dept].append(s["avgMarks"])
            
    # Fetch department-wise attendance summary
    dept_res = from_table("college_dept_attendance_summary").select("*").execute()
    dept_raw = dept_res["data"] or []
    
    department_wise = []
    for d in dept_raw:
        dept_name = d["department"]
        d_marks = dept_marks.get(dept_name, [])
        avg_d_marks = round(sum(d_marks) / len(d_marks), 1) if d_marks else 0.0
        
        present = d["present"]
        total = d["total"]
        pct = round((present / total) * 100) if total > 0 else 0
        
        department_wise.append({
            "department": dept_name,
            "avgAttendance": pct,
            "avgMarks": avg_d_marks
        })
        
    # Fetch class-wise attendance summary
    class_res = from_table("college_class_attendance_summary").select("*").execute()
    class_raw = class_res["data"] or []
    class_wise = []
    for c in class_raw:
        present = c["present"]
        total = c["total"]
        pct = round((present / total) * 100) if total > 0 else 0
        class_wise.append({
            "class": c["class"],
            "avgAttendance": pct
        })
        
    # Top Performers
    top_performers = sorted(student_stats, key=lambda x: x["avgMarks"], reverse=True)[:5]
    
    # Get total present/absent from monthly summary (saves querying attendance table)
    month_res = from_table("college_monthly_attendance_summary").select("*").execute()
    monthly_data = month_res["data"] or []
    att_present = sum(m["present"] for m in monthly_data)
    att_absent = sum(m["total"] - m["present"] for m in monthly_data)
    
    # Marks Trend: Top 20 marks records via view
    marks_trend_res = from_table("college_marks_enriched").select("marks_obtained, max_marks, student_id, subject_name").limit(20).execute()
    marks_raw = marks_trend_res["data"] or []
    
    st_ids = list(set([m["student_id"] for m in marks_raw]))
    student_map = {}
    if st_ids:
        st_names_res = from_table("college_students").select("id, name").in_("id", st_ids).execute()
        student_map = {s["id"]: s["name"] for s in (st_names_res["data"] or [])}
        
    marks_trend = []
    for m in marks_raw:
        marks_trend.append({
            "student": student_map.get(m["student_id"], "Student"),
            "subject": m["subject_name"] or "Subject",
            "percentage": round((float(m["marks_obtained"]) / float(m["max_marks"])) * 100)
        })
        
    result = {
        "studentStats": student_stats,
        "departmentWise": department_wise,
        "classWise": class_wise,
        "marksSummary": {
            "average": round(sum(all_pcts) / len(all_pcts), 1) if all_pcts else 0.0,
            "highest": max(all_pcts) if all_pcts else 0.0,
            "lowest": min(all_pcts) if all_pcts else 0.0
        },
        "topPerformers": top_performers,
        "attendanceChart": {"present": att_present, "absent": att_absent},
        "marksTrend": marks_trend
    }
    
    analytics_cache.set(cache_key, result)
    return result


# --- NEW Fee Analytics Endpoint ---

@app.get("/api/admin/fee-analytics")
async def admin_fee_analytics(user: dict = Depends(require_role(["admin"]))):
    cache_key = "admin_fee_analytics"
    cached_res = analytics_cache.get(cache_key)
    if cached_res:
        return cached_res

    # 1. Summary metrics
    metrics_res = from_table("college_fee_summary_metrics").select("*").single().execute()
    metrics = metrics_res["data"] or {
        "total_collected": 0.0,
        "pending_fees": 0.0,
        "paid_students": 0,
        "unpaid_students": 0
    }
    
    # 2. Department Wise Fees
    dept_res = from_table("college_dept_fee_summary").select("*").execute()
    department_wise = dept_res["data"] or []
    
    # 3. Collection Trend
    trend_res = from_table("college_fee_collection_trend").select("*").execute()
    collection_trend = trend_res["data"] or []
    
    # Sort trend by date
    collection_trend = sorted(
        [{"date": t["date"], "amount": float(t["amount"])} for t in collection_trend],
        key=lambda x: x["date"]
    )
    
    if not collection_trend:
        today = datetime.date.today().isoformat()
        collection_trend = [{"date": today, "amount": float(metrics["total_collected"])}]
        
    result = {
        "totalCollected": float(metrics["total_collected"]),
        "pendingFees": float(metrics["pending_fees"]),
        "paidStudents": int(metrics["paid_students"]),
        "unpaidStudents": int(metrics["unpaid_students"]),
        "collectionTrend": collection_trend,
        "departmentWise": [
            {
                "department": d["department"],
                "collected": float(d["collected"]),
                "pending": float(d["pending"])
            } for d in department_wise
        ]
    }
    
    analytics_cache.set(cache_key, result)
    return result

@app.get("/api/admin/analytics/attendance")
async def admin_attendance_analytics(user: dict = Depends(require_role(["admin"]))):
    cache_key = "admin_attendance_analytics"
    cached_res = analytics_cache.get(cache_key)
    if cached_res:
        return cached_res

    # 1. Department Wise
    dept_res = from_table("college_dept_attendance_summary").select("*").execute()
    dept_raw = dept_res["data"] or []
    dept_wise = {}
    for d in dept_raw:
        dept_wise[d["department"]] = {
            "present": d["present"],
            "total": d["total"]
        }
        
    # 2. Class Wise
    class_res = from_table("college_class_attendance_summary").select("*").execute()
    class_raw = class_res["data"] or []
    class_wise = {}
    for c in class_raw:
        class_wise[c["class"]] = {
            "present": c["present"],
            "total": c["total"]
        }
        
    # 3. Monthly Trends
    month_res = from_table("college_monthly_attendance_summary").select("*").execute()
    month_raw = month_res["data"] or []
    monthly_trends = {}
    for m in month_raw:
        monthly_trends[m["month"]] = {
            "present": m["present"],
            "total": m["total"]
        }
        
    # 4. Student Wise Attendance Summary
    stud_res = from_table("college_student_attendance_summary").select("*").execute()
    student_wise = stud_res["data"] or []
    
    result = {
        "departmentWise": dept_wise,
        "classWise": class_wise,
        "monthlyTrends": monthly_trends,
        "studentWise": student_wise
    }
    
    analytics_cache.set(cache_key, result)
    return result


# --- HOSTEL MODULE ENDPOINTS ---

@app.get("/api/hostels")
async def get_hostels(user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden", "student"]))):
    res = from_table("hostels").select("*").order("hostel_name").execute()
    return {"hostels": res["data"] or []}

@app.post("/api/hostels")
async def create_hostel(payload: CreateHostelPayload, user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))):
    res = from_table("hostels").insert(payload.dict()).execute()
    if res["error"]:
        raise HTTPException(status_code=400, detail=res["error"]["message"])
    analytics_cache.clear()
    return {"success": True, "hostel": res["data"][0]}

@app.get("/api/rooms")
async def get_rooms(hostel_id: Optional[int] = None, user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden", "student"]))):
    query = from_table("rooms").select("*").order("room_number")
    if hostel_id:
        query = query.eq("hostel_id", hostel_id)
    res = query.execute()
    return {"rooms": res["data"] or []}

@app.post("/api/rooms")
async def create_room(payload: CreateRoomPayload, user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))):
    res = from_table("rooms").insert(payload.dict()).execute()
    if res["error"]:
        raise HTTPException(status_code=400, detail=res["error"]["message"])

    # Update total_rooms in hostels table
    from_table("hostels").update({
        "total_rooms": from_table("rooms").select("id", count="exact").eq("hostel_id", payload.hostel_id).execute()["count"]
    }).eq("id", payload.hostel_id).execute()

    analytics_cache.clear()
    return {"success": True, "room": res["data"][0]}

@app.get("/api/hostel/allocations")
async def get_allocations(user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))):
    res = from_table("hostel_allocations_enriched").select("*").order("created_at", ascending=False).execute()
    if res["error"]:
        raise HTTPException(status_code=500, detail=res["error"]["message"])
    
    enriched = []
    for a in (res["data"] or []):
        enriched.append({
            "id": a["id"],
            "student_name": a["student_name"] or "Unknown",
            "enrollment_no": a["enrollment_no"] or "Unknown",
            "department": a["department"] or "Unknown",
            "hostel_name": a["hostel_name"] or "Unknown",
            "room_number": a["room_number"] or "Unknown",
            "floor": a["floor"] or 0,
            "bed_number": a["bed_number"],
            "status": a["status"],
            "allocation_date": a["allocation_date"]
        })
    return {"allocations": enriched}

@app.post("/api/hostel/allocate")
async def allocate_room(payload: AllocateRoomPayload, user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))):
    # Check if student already has an active allocation
    existing = from_table("hostel_allocations").select("id").eq("student_id", payload.student_id).neq("status", "Removed").maybe_single().execute()
    if existing["data"]:
        raise HTTPException(status_code=400, detail="Student already has an active allocation")

    target_room_id = payload.room_id
    target_hostel_id = payload.hostel_id
    bed_number = payload.bed_number

    # Auto-allocation logic if no room specified
    if not target_room_id:
        if not target_hostel_id:
            raise HTTPException(status_code=400, detail="Either room_id or hostel_id must be provided")

        # Find first room with available capacity
        available_rooms = from_table("rooms").select("*").eq("hostel_id", target_hostel_id).execute()["data"] or []
        room = None
        for r in available_rooms:
            if r["occupied_beds"] < r["capacity"]:
                room = r
                break

        if not room:
            # Add to waiting list
            res = from_table("hostel_allocations").insert({
                "student_id": payload.student_id,
                "hostel_id": target_hostel_id,
                "status": "Waiting"
            }).execute()

            # Initialize hostel fee
            from_table("college_hostel_fees").insert({
                "student_id": payload.student_id,
                "total_fee": 30000,
                "paid_amount": 0,
                "pending_amount": 30000,
                "status": "pending"
            }).execute()

            analytics_cache.clear()
            return {"success": True, "status": "Waiting", "message": "Added to waiting list"}

        target_room_id = room["id"]
        bed_number = room["occupied_beds"] + 1
    else:
        # Verify room capacity
        room_res = from_table("rooms").select("*").eq("id", target_room_id).single().execute()
        room = room_res["data"]
        if room["occupied_beds"] >= room["capacity"]:
            raise HTTPException(status_code=400, detail="Room is full")
        if not bed_number:
            bed_number = room["occupied_beds"] + 1

    # Create allocation
    res = from_table("hostel_allocations").insert({
        "student_id": payload.student_id,
        "hostel_id": room["hostel_id"],
        "room_id": target_room_id,
        "bed_number": bed_number,
        "status": "Allocated"
    }).execute()

    if res["error"]:
        raise HTTPException(status_code=500, detail=res["error"]["message"])

    # Update room occupancy
    from_table("rooms").update({
        "occupied_beds": room["occupied_beds"] + 1
    }).eq("id", target_room_id).execute()

    # Initialize hostel fee
    from_table("college_hostel_fees").insert({
        "student_id": payload.student_id,
        "total_fee": 30000,
        "paid_amount": 0,
        "pending_amount": 30000,
        "status": "pending"
    }).execute()

    analytics_cache.clear()
    return {"success": True, "allocation": res["data"][0]}

@app.put("/api/hostel/change-room")
async def change_room(payload: ChangeRoomPayload, user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))):
    alloc_res = from_table("hostel_allocations").select("*").eq("id", payload.allocation_id).single().execute()
    alloc = alloc_res["data"]
    if not alloc:
        raise HTTPException(status_code=404, detail="Allocation not found")

    old_room_id = alloc["room_id"]
    new_room_id = payload.new_room_id

    # Check new room
    new_room_res = from_table("rooms").select("*").eq("id", new_room_id).single().execute()
    new_room = new_room_res["data"]
    if new_room["occupied_beds"] >= new_room["capacity"]:
        raise HTTPException(status_code=400, detail="New room is full")

    # Update old room
    if old_room_id:
        old_room_res = from_table("rooms").select("occupied_beds").eq("id", old_room_id).single().execute()
        from_table("rooms").update({
            "occupied_beds": max(0, old_room_res["data"]["occupied_beds"] - 1)
        }).eq("id", old_room_id).execute()

    # Update new room
    from_table("rooms").update({
        "occupied_beds": new_room["occupied_beds"] + 1
    }).eq("id", new_room_id).execute()

    # Update allocation
    res = from_table("hostel_allocations").update({
        "room_id": new_room_id,
        "bed_number": payload.new_bed_number or (new_room["occupied_beds"] + 1),
        "hostel_id": new_room["hostel_id"],
        "status": "Allocated"
    }).eq("id", payload.allocation_id).execute()

    analytics_cache.clear()
    return {"success": True, "allocation": res["data"][0]}

@app.delete("/api/hostel/remove-allocation/{allocation_id}")
async def remove_allocation(allocation_id: int, user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))):
    alloc_res = from_table("hostel_allocations").select("*").eq("id", allocation_id).single().execute()
    alloc = alloc_res["data"]
    if not alloc:
        raise HTTPException(status_code=404, detail="Allocation not found")

    # Update room occupancy
    if alloc["room_id"]:
        room_res = from_table("rooms").select("occupied_beds").eq("id", alloc["room_id"]).single().execute()
        from_table("rooms").update({
            "occupied_beds": max(0, room_res["data"]["occupied_beds"] - 1)
        }).eq("id", alloc["room_id"]).execute()

    # Remove allocation (soft delete)
    from_table("hostel_allocations").update({"status": "Removed"}).eq("id", allocation_id).execute()

    analytics_cache.clear()
    return {"success": True}

@app.get("/api/hostel/analytics")
async def get_hostel_analytics(user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))):
    cache_key = "hostel_analytics"
    cached_res = analytics_cache.get(cache_key)
    if cached_res:
        return cached_res

    # 1. Summary metrics
    metrics_res = from_table("hostel_summary_metrics").select("*").single().execute()
    metrics = metrics_res["data"] or {
        "total_hostels": 0,
        "total_rooms": 0,
        "total_capacity": 0,
        "occupied_beds": 0,
        "waiting_list": 0
    }
    
    # 2. Hostel stats
    stats_res = from_table("hostel_occupancy_stats").select("*").execute()
    stats_raw = stats_res["data"] or []
    
    hostel_stats = []
    for h in stats_raw:
        h_cap = h["capacity"]
        h_occ = h["occupied"]
        hostel_stats.append({
            "name": h["name"],
            "occupancy": round((h_occ / h_cap) * 100) if h_cap > 0 else 0,
            "available": h_cap - h_occ
        })

    result = {
        "totalHostels": int(metrics["total_hostels"]),
        "totalRooms": int(metrics["total_rooms"]),
        "occupiedRooms": int(metrics["occupied_beds"]),
        "availableRooms": int(metrics["total_capacity"] - metrics["occupied_beds"]),
        "waitingList": int(metrics["waiting_list"]),
        "hostelStats": hostel_stats
    }
    analytics_cache.set(cache_key, result)
    return result

@app.get("/api/student/hostel")
async def get_student_hostel(user: dict = Depends(require_role(["student"]))):
    student_id = user["id"]
    alloc_res = from_table("hostel_allocations_enriched").select("*").eq("student_id", student_id).neq("status", "Removed").maybe_single().execute()
    alloc = alloc_res["data"]

    if not alloc:
        return {"allocated": False}

    # Roommates list via enriched view
    roommates = []
    if alloc["room_id"]:
        mates_res = from_table("hostel_allocations_enriched").select("student_name").eq("room_id", alloc["room_id"]).neq("student_id", student_id).neq("status", "Removed").execute()
        roommates = [m["student_name"] for m in (mates_res["data"] or [])]

    # Fee status
    fee_res = from_table("college_hostel_fees").select("*").eq("student_id", student_id).maybe_single().execute()
    fee = fee_res["data"] or {"total_fee": 30000, "paid_amount": 0, "pending_amount": 30000, "status": "pending"}

    return {
        "allocated": True,
        "status": alloc["status"],
        "hostel_name": alloc["hostel_name"] or "Unknown",
        "room_number": alloc["room_number"] or "Pending",
        "floor": alloc["floor"] or 0,
        "bed_number": alloc["bed_number"],
        "allocation_date": alloc["allocation_date"],
        "roommates": roommates,
        "fees": {
            "total": float(fee["total_fee"]),
            "paid": float(fee["paid_amount"]),
            "pending": float(fee["pending_amount"]),
            "status": fee["status"]
        }
    }

@app.post("/api/student/hostel/pay")
async def pay_hostel_fee(payload: PayHostelFeePayload, user: dict = Depends(require_role(["student"]))):
    student_id = user["id"]
    res = from_table("college_hostel_fees").select("*").eq("student_id", student_id).single().execute()
    fee = res["data"]
    if not fee:
        raise HTTPException(status_code=404, detail="Hostel fee record not found")

    new_paid = float(fee["paid_amount"]) + payload.amount
    new_pending = max(0.0, float(fee["total_fee"]) - new_paid)
    status_str = "paid" if new_pending <= 0 else "pending"

    from_table("college_hostel_fees").update({
        "paid_amount": new_paid,
        "pending_amount": new_pending,
        "status": status_str,
        "updated_at": datetime.datetime.utcnow().isoformat()
    }).eq("student_id", student_id).execute()

    analytics_cache.clear()
    return {"success": True}


# --- HOSTEL CRUD API ENDPOINTS ---

@app.post("/hostel/login")
@app.post("/api/hostel/login")
async def hostel_login(payload: AdminLoginPayload):
    username = payload.username.strip().lower()
    user_data = query_user("college_admins", "username", username, "admin", None)
    if not user_data or not verify_password(payload.password, user_data["password_hash"]):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    # hostel_admin role is in ADMIN_ROLES, so all require_role(['admin']) endpoints
    # will accept this token automatically.
    token_payload = {
        "role": "hostel_admin",
        "id": user_data["id"],
        "loginId": user_data["username"],
        "name": user_data["name"]
    }

    print(f"[AUTH] Hostel login OK — username='{username}' assigned role='hostel_admin'")
    access_token = sign_access_token(token_payload)
    refresh_token = sign_refresh_token(token_payload)
    return {
        "success": True,
        "token": access_token,
        "accessToken": access_token,
        "refreshToken": refresh_token,
        "role": "hostel_admin",
        "user": token_payload
    }

@app.get("/hostel/students")
@app.get("/api/hostel/students")
async def get_hostel_students(
    search: Optional[str] = None,
    department: Optional[str] = None,
    class_name: Optional[str] = None,
    user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))
):
    query = from_table("hostel_students").select("*").order("created_at", False)
    if department:
        query = query.eq("department", department)
    if class_name:
        query = query.eq("class_name", class_name)
    res = query.execute()
    if res["error"]:
        raise HTTPException(status_code=500, detail=res["error"]["message"])
    
    students = res["data"] or []
    
    if search:
        q = search.lower().strip()
        students = [
            s for s in students if 
            q in (s.get("student_name") or "").lower() or
            q in (s.get("enrollment_no") or "").lower() or
            q in (s.get("room_number") or "").lower() or
            q in (s.get("class_name") or "").lower() or
            q in (s.get("department") or "").lower() or
            q in (s.get("hostel_name") or "").lower()
        ]
        
    return students

@app.post("/hostel/students")
@app.post("/api/hostel/students")
async def create_hostel_student(
    payload: HostelStudentPayload,
    user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))
):
    existing = from_table("hostel_students").select("id").eq("enrollment_no", payload.enrollment_no).maybe_single().execute()
    if existing["data"]:
        raise HTTPException(status_code=400, detail="Student with this enrollment number is already allocated")
        
    res = from_table("hostel_students").insert(payload.dict()).execute()
    if res["error"]:
        raise HTTPException(status_code=400, detail=res["error"]["message"])
        
    analytics_cache.clear()
    return res["data"][0]

@app.put("/hostel/students/{id}")
@app.put("/api/hostel/students/{id}")
async def update_hostel_student(
    id: int,
    payload: HostelStudentPayload,
    user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))
):
    existing = from_table("hostel_students").select("id").eq("id", id).maybe_single().execute()
    if not existing["data"]:
        raise HTTPException(status_code=404, detail="Allocation record not found")
        
    res = from_table("hostel_students").update(payload.dict()).eq("id", id).execute()
    if res["error"]:
        raise HTTPException(status_code=400, detail=res["error"]["message"])
        
    analytics_cache.clear()
    return res["data"][0]

@app.delete("/hostel/students/{id}")
@app.delete("/api/hostel/students/{id}")
async def delete_hostel_student(
    id: int,
    user: dict = Depends(require_role(["super_admin", "college_admin", "hostel_admin", "warden"]))
):
    existing = from_table("hostel_students").select("id").eq("id", id).maybe_single().execute()
    if not existing["data"]:
        raise HTTPException(status_code=404, detail="Allocation record not found")
        
    res = from_table("hostel_students").delete().eq("id", id).execute()
    if res["error"]:
        raise HTTPException(status_code=400, detail=res["error"]["message"])
        
    analytics_cache.clear()
    return {"success": True, "message": "Allocation removed successfully"}


    # --- Static Files / SPA Fallback Serving ---


@app.get("/api/health")
def health_check():
    return {"status": "ok", "backend": "FastAPI"}

# Mount CSS & JS folders
app.mount("/css", StaticFiles(directory=BASE_DIR / "frontend" / "css"), name="css")
app.mount("/js", StaticFiles(directory=BASE_DIR / "frontend" / "js"), name="js")

@app.get("/")
def read_root():
    return FileResponse(BASE_DIR / "frontend" / "index.html")

@app.get("/{file_name}")
def serve_static_html(file_name: str):
    file_path = BASE_DIR / "frontend" / file_name
    if file_path.is_file() and file_name.endswith((".html", ".js", ".css", ".png", ".jpg", ".svg", ".ico")):
        return FileResponse(file_path)
    # Default fallback to index.html if file doesn't exist
    return FileResponse(BASE_DIR / "frontend" / "index.html")
