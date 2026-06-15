// Use Express backend on :3001 or FastAPI on :8000
const API_BASE = (() => {
  const { protocol, hostname, port } = window.location;
  if (port === '8000') return '/api';
  if (!port || port === '3001') return '/api';
  return `${protocol}//${hostname}:3001/api`;
})();

const FASTAPI_BASE = (() => {
  const { protocol, hostname } = window.location;
  if (hostname === 'localhost' || hostname === '127.0.0.1') {
    return `${protocol}//${hostname}:8000/api`;
  }
  return 'https://college-erp-system-t5s0.onrender.com';
})();

async function api(path, options = {}, useFastAPI = false) {
  const token = localStorage.getItem('erp_token');
  const headers = { 'Content-Type': 'application/json', ...(options.headers || {}) };
  if (token) headers.Authorization = `Bearer ${token}`;

  const base = useFastAPI ? FASTAPI_BASE : API_BASE;
  const res = await fetch(`${base}${path}`, { ...options, headers });
  const data = await res.json().catch(() => ({}));

  if (!res.ok) {
    throw new Error(data.error || `Request failed (${res.status})`);
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

function saveSession(data) {
  localStorage.setItem('erp_token', data.token);
  const user = data.user || { role: data.role, name: data.username || 'User' };
  localStorage.setItem('erp_user', JSON.stringify(user));
}

function getUser() {
  try { return JSON.parse(localStorage.getItem('erp_user')); } catch { return null; }
}

function clearSession() {
  localStorage.removeItem('erp_token');
  localStorage.removeItem('erp_user');
}

function requireRole(role, redirect) {
  const user = getUser();
  if (!user || user.role !== role) {
    window.location.href = redirect;
    return null;
  }
  return user;
}

function logout(loginPage) {
  clearSession();
  window.location.href = loginPage;
}

function attColor(pct) {
  if (pct > 75) return 'green';
  if (pct >= 60) return 'yellow';
  return 'red';
}
