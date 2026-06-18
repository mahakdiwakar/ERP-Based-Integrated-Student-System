// Use relative path for API calls in production
const API_BASE = '/api';
const FASTAPI_BASE = '/api';

async function api(path, options = {}, useFastAPI = false) {
  let token = sessionStorage.getItem('erp_token') || localStorage.getItem('erp_token') || localStorage.getItem('token') || sessionStorage.getItem('token');
  const headers = { 'Content-Type': 'application/json', ...(options.headers || {}) };
  if (token) headers.Authorization = `Bearer ${token}`;

  const base = useFastAPI ? FASTAPI_BASE : API_BASE;
  let res = await fetch(`${base}${path}`, { ...options, headers });

  if (res.status === 401) {
    const refreshToken = sessionStorage.getItem('erp_refresh_token') || localStorage.getItem('erp_refresh_token');
    if (refreshToken) {
      try {
        const refreshRes = await fetch(`${FASTAPI_BASE}/auth/refresh`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ refresh_token: refreshToken })
        });

        if (refreshRes.ok) {
          const refreshData = await refreshRes.json();
          const remember = !!localStorage.getItem('erp_refresh_token');
          saveSession(refreshData, remember);

          headers.Authorization = `Bearer ${refreshData.accessToken}`;
          res = await fetch(`${base}${path}`, { ...options, headers });
        } else {
          clearSession();
          window.location.href = 'hostel-login.html?expired=true';
          throw new Error('Session expired. Please log in again.');
        }
      } catch (err) {
        clearSession();
        window.location.href = 'hostel-login.html?expired=true';
        throw err;
      }
    }
  }

  const data = await res.json().catch(() => ({}));

  if (!res.ok) {
    throw new Error(data.detail || data.error || `Request failed (${res.status})`);
  }
  return data;
}

const AuthAPI = {
  studentLogin: (enrollment_number, password) =>
    api('/student/login', { method: 'POST', body: JSON.stringify({ enrollment_number, password }) }),
  teacherLogin: (teacher_id, password) =>
    api('/teacher/login', { method: 'POST', body: JSON.stringify({ teacher_id, password }) }),
  adminLogin: (username, password) =>
    api('/admin/login', { method: 'POST', body: JSON.stringify({ username, password }) })
};

const StudentAPI = {
  dashboard: () => api('/student/dashboard'),
  dashboardSummary: () => api('/student/dashboard-summary'),
  attendance: () => api('/student/attendance'),
  payFees: (amount) => api('/student/fees/pay', { method: 'POST', body: JSON.stringify({ amount }) }),
  getFees: () => api('/student/fees'),
  createOrder: (amount) => api('/payment/create-order', { method: 'POST', body: JSON.stringify({ amount }) }),
  verifyPayment: (payload) => api('/payment/verify', { method: 'POST', body: JSON.stringify(payload) })
};

const TeacherAPI = {
  classes: () => api('/teacher/classes'),
  students: (classId, date = '') => api(`/teacher/classes/${classId}/students${date ? '?date=' + date : ''}`),
  saveAttendance: (payload) =>
    api('/attendance/save', { method: 'POST', body: JSON.stringify(payload) }),
  subjects: (classId) => api(`/teacher/classes/${classId}/subjects`),
  marks: (classId, subjectId) => api(`/teacher/classes/${classId}/marks?subject_id=${subjectId}`),
  saveMarks: (class_id, subject_id, records) =>
    api('/teacher/marks', { method: 'POST', body: JSON.stringify({ class_id, subject_id, records }) })
};

const AdminAPI = {
  users: () => api('/admin/users'),
  departments: () => api('/admin/departments'),
  classes: () => api('/admin/classes'),
  createStudent: (body) => api('/admin/users/student', { method: 'POST', body: JSON.stringify(body) }),
  createTeacher: (body) => api('/admin/users/teacher', { method: 'POST', body: JSON.stringify(body) }),
  updateUser: (type, id, body) => api(`/admin/users/${type}/${id}`, { method: 'PUT', body: JSON.stringify(body) }),
  deleteUser: (type, id) => api(`/admin/users/${type}/${id}`, { method: 'DELETE' }),
  analytics: () => api('/admin/analytics'),
  feeAnalytics: () => api('/admin/fee-analytics'),
  attendanceAnalytics: () => api('/admin/analytics/attendance'),
  generateDemoStudents: () => api('/admin/generate-demo-students', { method: 'POST', body: '{}' })
};

const HostelAPI = {
  hostels: () => api('/hostels', {}, true),
  createHostel: (body) => api('/hostels', { method: 'POST', body: JSON.stringify(body) }, true),
  rooms: (hostelId = '') => api(`/rooms${hostelId ? '?hostel_id=' + hostelId : ''}`, {}, true),
  createRoom: (body) => api('/rooms', { method: 'POST', body: JSON.stringify(body) }, true),
  allocations: () => api('/hostel/allocations', {}, true),
  allocate: (body) => api('/hostel/allocate', { method: 'POST', body: JSON.stringify(body) }, true),
  changeRoom: (body) => api('/hostel/change-room', { method: 'PUT', body: JSON.stringify(body) }, true),
  removeAllocation: (id) => api(`/hostel/remove-allocation/${id}`, { method: 'DELETE' }, true),
  analytics: () => api('/hostel/analytics', {}, true),
  studentHostel: () => api('/student/hostel', {}, true),
  payFee: (amount) => api('/student/hostel/pay', { method: 'POST', body: JSON.stringify({ amount }) }, true)
};

function saveSession(data, remember = false) {
  const storage = remember ? localStorage : sessionStorage;
  
  if (remember) {
    sessionStorage.removeItem('erp_token');
    sessionStorage.removeItem('erp_refresh_token');
    sessionStorage.removeItem('erp_user');
  } else {
    localStorage.removeItem('erp_token');
    localStorage.removeItem('erp_refresh_token');
    localStorage.removeItem('erp_user');
  }

  storage.setItem('erp_token', data.accessToken || data.token);
  storage.setItem('erp_refresh_token', data.refreshToken || '');
  const user = data.user || { role: data.role, name: data.username || 'User' };
  storage.setItem('erp_user', JSON.stringify(user));
}

function getUser() {
  try {
    return JSON.parse(sessionStorage.getItem('erp_user') || localStorage.getItem('erp_user'));
  } catch {
    return null;
  }
}

function clearSession() {
  localStorage.removeItem('erp_token');
  localStorage.removeItem('erp_refresh_token');
  localStorage.removeItem('erp_user');
  localStorage.removeItem('token');
  sessionStorage.removeItem('erp_token');
  sessionStorage.removeItem('erp_refresh_token');
  sessionStorage.removeItem('erp_user');
  sessionStorage.removeItem('token');
}

function requireRole(role, redirect) {
  const user = getUser();
  if (!user) {
    window.location.href = redirect;
    return null;
  }
  
  let authorized = false;
  if (role === 'admin') {
    authorized = ['admin', 'super_admin', 'college_admin', 'hostel_admin', 'warden'].includes(user.role);
  } else {
    authorized = user.role === role;
  }

  if (!authorized) {
    window.location.href = redirect;
    return null;
  }
  return user;
}

function logout(loginPage) {
  clearSession();
  // Trigger storage event for tab synchronization
  localStorage.setItem('erp_logout_event', Date.now().toString());
  window.location.href = loginPage;
}

function attColor(pct) {
  if (pct > 75) return 'green';
  if (pct >= 60) return 'yellow';
  return 'red';
}
