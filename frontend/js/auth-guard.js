/**
 * Unified Auth Guard Module for SNS ERP
 * Enforces route protection, role checks, tab sync, and inactivity timeouts.
 */

'use strict';

const AuthGuard = {
  /**
   * Decodes JWT token payload.
   */
  decodeToken(token) {
    try {
      const base64Url = token.split('.')[1];
      const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
      const jsonPayload = decodeURIComponent(atob(base64).split('').map(c => {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
      }).join(''));
      return JSON.parse(jsonPayload);
    } catch (e) {
      return null;
    }
  },

  /**
   * Validates access token expiration.
   */
  validateToken(token) {
    if (!token) return false;
    const payload = this.decodeToken(token);
    if (!payload || !payload.exp) return false;
    return (payload.exp * 1000) > Date.now();
  },

  /**
   * Sync check if the user is authenticated.
   */
  checkAuth() {
    const token = sessionStorage.getItem('erp_token') || localStorage.getItem('erp_token');
    return this.validateToken(token);
  },

  /**
   * Validates if the current user has one of the allowed roles.
   */
  checkRole(allowedRoles) {
    const user = getUser();
    if (!user) return false;
    if (allowedRoles.includes(user.role)) return true;
    
    // Support general 'admin' checks matching super_admin and college_admin
    if (allowedRoles.includes('admin') && ['admin', 'super_admin', 'college_admin', 'hostel_admin', 'warden'].includes(user.role)) {
      return true;
    }
    return false;
  },

  /**
   * Asynchronously calls the refresh token endpoint.
   */
  async refreshAccessToken() {
    const refreshToken = sessionStorage.getItem('erp_refresh_token') || localStorage.getItem('erp_refresh_token');
    if (!refreshToken) return false;
    
    try {
      const res = await fetch('/api/auth/refresh', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ refresh_token: refreshToken })
      });
      
      if (res.ok) {
        const data = await res.json();
        const remember = !!localStorage.getItem('erp_refresh_token');
        saveSession(data, remember);
        return true;
      }
    } catch (e) {
      console.error("Token refresh failed:", e);
    }
    return false;
  },

  /**
   * Logs out the user, triggers tab sync, and redirects to login page.
   */
  logout(isExpired = false) {
    clearSession();
    // Trigger storage event for tab synchronization
    localStorage.setItem('erp_logout_event', Date.now().toString());
    const redirectUrl = 'hostel-login.html' + (isExpired ? '?expired=true' : '');
    window.location.replace(redirectUrl);
  },

  /**
   * Blocking protection function to run in <head>.
   */
  protect(allowedRoles) {
    // Hide page immediately before any browser paints to prevent UI flash
    document.documentElement.style.visibility = 'hidden';
    
    const token = sessionStorage.getItem('erp_token') || localStorage.getItem('erp_token');
    const refreshToken = sessionStorage.getItem('erp_refresh_token') || localStorage.getItem('erp_refresh_token');
    
    if (!token && !refreshToken) {
      this.logout(false);
      return;
    }
    
    if (this.validateToken(token)) {
      if (this.checkRole(allowedRoles)) {
        // Access granted. Reveal page when DOM is ready
        const reveal = () => {
          document.documentElement.style.visibility = '';
        };
        if (document.readyState === 'loading') {
          document.addEventListener('DOMContentLoaded', reveal);
        } else {
          reveal();
        }
        return;
      } else {
        // Access denied due to role mismatch
        this.redirectToAuthorizedDashboard();
        return;
      }
    }
    
    // Access token expired, attempt refresh
    if (refreshToken) {
      const refreshPayload = this.decodeToken(refreshToken);
      if (!refreshPayload || !refreshPayload.exp || (refreshPayload.exp * 1000) < Date.now()) {
        this.logout(true);
        return;
      }
      
      this.refreshAccessToken().then(success => {
        if (success && this.checkRole(allowedRoles)) {
          document.documentElement.style.visibility = '';
        } else if (success) {
          this.redirectToAuthorizedDashboard();
        } else {
          this.logout(true);
        }
      });
    } else {
      this.logout(true);
    }
  },

  /**
   * Redirects unauthorized users to their specific dashboard or access denied.
   */
  redirectToAuthorizedDashboard() {
    const user = getUser();
    if (!user) {
      window.location.replace('hostel-login.html');
      return;
    }
    
    const dashboardMap = {
      'super_admin': 'admin-dashboard.html',
      'college_admin': 'admin-dashboard.html',
      'admin': 'admin-dashboard.html',
      'hostel_admin': 'hostel-dashboard.html',
      'warden': 'hostel-dashboard.html',
      'student': 'student-dashboard.html',
      'teacher': 'teacher-dashboard.html'
    };
    
    const redirectPage = dashboardMap[user.role];
    if (redirectPage) {
      window.location.replace(redirectPage);
    } else {
      window.location.replace('access-denied.html');
    }
  },

  /**
   * Initiates inactivity monitoring.
   */
  startInactivityTimer() {
    let timeout;
    const INACTIVITY_TIME = 30 * 60 * 1000; // 30 minutes
    
    const resetTimer = () => {
      clearTimeout(timeout);
      timeout = setTimeout(() => {
        console.log("User inactive. Automatic logout triggered.");
        this.logout(true);
      }, INACTIVITY_TIME);
    };
    
    const events = ['mousemove', 'click', 'keypress', 'scroll', 'touchstart'];
    events.forEach(evt => {
      window.addEventListener(evt, resetTimer, { passive: true });
    });
    
    resetTimer();
  },

  /**
   * Monitors storage changes to synchronize logouts across multiple browser tabs.
   */
  syncTabs() {
    window.addEventListener('storage', (e) => {
      if (e.key === 'erp_logout_event') {
        console.log("Logout detected in another tab. Closing session.");
        window.location.replace('hostel-login.html');
      }
    });
  }
};
