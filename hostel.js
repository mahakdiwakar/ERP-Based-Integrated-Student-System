/* =========================================================
   hostel.js  —  Warden Dashboard Client Side logic
   ========================================================= */

'use strict';

// ── Auth Guard ──
const user = getUser();
if (!user || user.role !== 'admin') {
  window.location.href = 'hostel-login.html';
} else {
  document.getElementById('userName').textContent = user.name;
}

// Logout hook
document.getElementById('logoutBtn').onclick = () => logout('hostel-login.html');

// ── Toast System ──
function showToast(message, type = 'info', duration = 3500) {
  const container = document.getElementById('toastContainer');
  if (!container) return;
  const icons = { success: '✅', error: '❌', info: '✨' };
  const toast = document.createElement('div');
  toast.className = `hl-toast ${type}`;
  toast.innerHTML = `<span>${icons[type] || '•'}</span><span>${message}</span>`;
  container.appendChild(toast);

  setTimeout(() => {
    toast.style.animation = 'toastOut 0.4s ease forwards';
    setTimeout(() => toast.remove(), 400);
  }, duration);
}

// ── Global Variables ──
let allAllocations = [];
let filteredAllocations = [];
let activeFilters = {
  search: '',
  dept: 'ALL',
  class: 'ALL'
};

// Rooms definition
const STATIC_ROOMS = [
  // Luxury Male Residency
  { number: '101', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '102', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '103', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '104', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '105', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '106', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '107', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '108', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '109', hostel: 'Luxury Male Residency', capacity: 4 },
  { number: '110', hostel: 'Luxury Male Residency', capacity: 4 },
  
  // Golden Female Suites
  { number: '101', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '102', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '103', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '104', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '105', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '106', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '107', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '108', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '109', hostel: 'Golden Female Suites', capacity: 4 },
  { number: '110', hostel: 'Golden Female Suites', capacity: 4 }
];

// ── Fetch & Load Data ──
async function loadDashboardData() {
  try {
    const token = localStorage.getItem('erp_token');
    
    // Fetch allocations
    let url = `${FASTAPI_BASE}/hostel/students`;
    const params = [];
    if (activeFilters.dept !== 'ALL') params.push(`department=${activeFilters.dept}`);
    if (activeFilters.class !== 'ALL') params.push(`class_name=${activeFilters.class}`);
    if (activeFilters.search) params.push(`search=${encodeURIComponent(activeFilters.search)}`);
    if (params.length > 0) url += `?${params.join('&')}`;

    const res = await fetch(url, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });

    if (!res.ok) throw new Error('Failed to load student allocations registry');
    const data = await res.json();
    allAllocations = data;
    filteredAllocations = data;

    renderTable();
    updateAnalytics();

  } catch (err) {
    showToast(err.message, 'error');
  }
}

// ── Render Allocations Table ──
function renderTable() {
  const tbody = document.getElementById('studentTableBody');
  if (filteredAllocations.length === 0) {
    tbody.innerHTML = `<tr><td colspan="10" style="text-align: center; color: var(--text-muted); padding: 30px;">No allocations found matching the criteria.</td></tr>`;
    return;
  }

  tbody.innerHTML = filteredAllocations.map(s => {
    const statusClass = s.allocation_status === 'allocated' ? 'allocated' : (s.allocation_status === 'waiting' ? 'waiting' : 'removed');
    const statusText = s.allocation_status.toUpperCase();
    
    return `
      <tr>
        <td><strong>${s.enrollment_no}</strong></td>
        <td>${s.student_name}</td>
        <td>${s.department}</td>
        <td>${s.class_name}</td>
        <td>${s.hostel_name}</td>
        <td>Room ${s.room_number}</td>
        <td>Bed ${s.bed_number}</td>
        <td>${s.phone || '—'}</td>
        <td><span class="badge badge-${statusClass}">${statusText}</span></td>
        <td style="text-align: right;">
          <div class="action-btn-group" style="justify-content: flex-end;">
            <button class="action-btn view" onclick="openViewModal(${s.id})" title="View Details">👁</button>
            <button class="action-btn edit" onclick="openEditModal(${s.id})" title="Edit Details">✏️</button>
            <button class="action-btn delete" onclick="openDeleteModal(${s.id})" title="Delete Allocation">🗑️</button>
          </div>
        </td>
      </tr>
    `;
  }).join('');
}

// ── Update Dashboard Metrics & Analytics ──
function updateAnalytics() {
  // 1. Calculate active students (allocated status)
  const activeStudents = allAllocations.filter(a => a.allocation_status === 'allocated');
  
  // 2. Count metrics matching STATIC_ROOMS
  let occupiedRoomsCount = 0;
  let availableRoomsCount = 0;
  let occupiedBedsCount = 0;
  
  const roomGridData = STATIC_ROOMS.map(room => {
    // find students in this room
    const mates = activeStudents.filter(s => s.room_number === room.number && s.hostel_name === room.hostel);
    const occupied = mates.length;
    const available = Math.max(0, room.capacity - occupied);
    
    occupiedBedsCount += occupied;
    if (occupied > 0) occupiedRoomsCount++;
    if (occupied < room.capacity) availableRoomsCount++;

    return {
      ...room,
      occupied,
      available,
      status: occupied >= room.capacity ? 'Full' : 'Available'
    };
  });

  // Render cards
  document.getElementById('cardTotalStudents').textContent = activeStudents.length;
  document.getElementById('cardTotalRooms').textContent = STATIC_ROOMS.length;
  document.getElementById('cardOccupiedBeds').textContent = occupiedRoomsCount; // "Occupied Rooms"
  document.getElementById('cardAvailableBeds').textContent = availableRoomsCount; // "Available Rooms"

  // Render Room Inventory cards
  const roomContainer = document.getElementById('roomGridContainer');
  roomContainer.innerHTML = roomGridData.map(r => {
    const isFull = r.occupied >= r.capacity;
    const barWidth = (r.occupied / r.capacity) * 100;
    
    return `
      <div class="room-card glass">
        <div class="room-header">
          <span class="room-number">Room ${r.number}</span>
          <span class="badge ${isFull ? 'badge-removed' : 'badge-allocated'}">${r.status}</span>
        </div>
        <div class="room-details">
          <div class="room-stat-row"><span>Hostel</span><span>${r.hostel === 'Luxury Male Residency' ? 'Male' : 'Female'}</span></div>
          <div class="room-stat-row"><span>Capacity</span><span>${r.capacity} Beds</span></div>
          <div class="room-stat-row"><span>Occupied</span><span>${r.occupied} Beds</span></div>
          <div class="room-stat-row"><span>Available</span><span>${r.available} Beds</span></div>
        </div>
        <div class="room-occupancy-bar">
          <div class="room-occupancy-fill ${isFull ? 'full' : ''}" style="width: ${barWidth}%"></div>
        </div>
      </div>
    `;
  }).join('');

  // 3. Analytics: Students per Class
  const classCounts = {};
  const classes = ['AIML-A', 'AIML-B', 'AIML-C', 'CYBER-A', 'CYBER-B', 'CYBER-C'];
  classes.forEach(c => classCounts[c] = 0);
  
  activeStudents.forEach(s => {
    if (classCounts[s.class_name] !== undefined) classCounts[s.class_name]++;
  });

  const maxClassCount = Math.max(...Object.values(classCounts), 1);
  const classListHTML = Object.entries(classCounts).map(([cls, count]) => {
    const pct = (count / maxClassCount) * 100;
    return `
      <div class="progress-row">
        <div class="progress-label-row">
          <span class="progress-label">${cls}</span>
          <span class="progress-value">${count} Students</span>
        </div>
        <div class="progress-bar">
          <div class="progress-fill" style="width: ${pct}%;"></div>
        </div>
      </div>
    `;
  }).join('');
  document.getElementById('classAnalyticsList').innerHTML = classListHTML;

  // 4. Analytics: Students per Hostel
  const hostelCounts = {
    'Luxury Male Residency': 0,
    'Golden Female Suites': 0
  };
  activeStudents.forEach(s => {
    if (hostelCounts[s.hostel_name] !== undefined) hostelCounts[s.hostel_name]++;
  });

  const maxHostelCount = Math.max(...Object.values(hostelCounts), 1);
  const hostelListHTML = Object.entries(hostelCounts).map(([hostel, count]) => {
    const pct = (count / maxHostelCount) * 100;
    return `
      <div class="progress-row">
        <div class="progress-label-row">
          <span class="progress-label">${hostel === 'Luxury Male Residency' ? 'Male Residency' : 'Female Suites'}</span>
          <span class="progress-value">${count} Students</span>
        </div>
        <div class="progress-bar">
          <div class="progress-fill" style="width: ${pct}%; background: var(--gold);"></div>
        </div>
      </div>
    `;
  }).join('');
  document.getElementById('hostelAnalyticsList').innerHTML = hostelListHTML;
}

// ── Search & Filter Controls ──
document.getElementById('searchInput').oninput = (e) => {
  activeFilters.search = e.target.value.toLowerCase();
  loadDashboardData();
};

document.querySelectorAll('.chip').forEach(chip => {
  chip.onclick = (e) => {
    const filterType = chip.dataset.filter;
    const filterVal = chip.dataset.value;
    
    // Deactivate sibling chips
    chip.parentElement.querySelectorAll('.chip').forEach(c => c.classList.remove('active'));
    chip.classList.add('active');
    
    activeFilters[filterType] = filterVal;
    loadDashboardData();
  };
});

// ── Modal Actions ──
window.openModal = (id) => {
  document.getElementById(id).classList.add('show');
};

window.closeModal = (id) => {
  document.getElementById(id).classList.remove('show');
};

// ADD ALLOCATION
window.openAddModal = () => {
  document.getElementById('addStudentForm').reset();
  openModal('addModal');
};

document.getElementById('addStudentForm').onsubmit = async (e) => {
  e.preventDefault();
  const token = localStorage.getItem('erp_token');
  
  const payload = {
    student_name: document.getElementById('addName').value.trim(),
    enrollment_no: document.getElementById('addEnroll').value.trim().toUpperCase(),
    department: document.getElementById('addDept').value,
    class_name: document.getElementById('addClass').value,
    hostel_name: document.getElementById('addHostel').value,
    room_number: document.getElementById('addRoom').value.trim(),
    bed_number: document.getElementById('addBed').value.trim(),
    phone: document.getElementById('addPhone').value.trim(),
    allocation_status: document.getElementById('addStatus').value
  };

  try {
    const res = await fetch(`${FASTAPI_BASE}/hostel/students`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      },
      body: JSON.stringify(payload)
    });

    const data = await res.json();
    if (!res.ok) throw new Error(data.detail || 'Failed to create student allocation');

    closeModal('addModal');
    showToast('Allocation added successfully!', 'success');
    loadDashboardData();

  } catch (err) {
    showToast(err.message, 'error');
  }
};

// VIEW DETAILS
window.openViewModal = (id) => {
  const student = allAllocations.find(s => s.id === id);
  if (!student) return;

  document.getElementById('viewName').textContent = student.student_name;
  document.getElementById('viewEnroll').textContent = student.enrollment_no;
  document.getElementById('viewDept').textContent = student.department;
  document.getElementById('viewClass').textContent = student.class_name;
  document.getElementById('viewHostel').textContent = student.hostel_name;
  document.getElementById('viewRoomBed').textContent = `Room ${student.room_number} / Bed ${student.bed_number}`;
  document.getElementById('viewPhone').textContent = student.phone || '—';
  
  const statusClass = student.allocation_status === 'allocated' ? 'allocated' : (student.allocation_status === 'waiting' ? 'waiting' : 'removed');
  document.getElementById('viewStatusBadge').innerHTML = `<span class="badge badge-${statusClass}">${student.allocation_status.toUpperCase()}</span>`;
  
  const dateStr = student.created_at ? new Date(student.created_at).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' }) : '—';
  document.getElementById('viewDate').textContent = dateStr;

  openModal('viewModal');
};

// EDIT DETAILS
window.openEditModal = (id) => {
  const student = allAllocations.find(s => s.id === id);
  if (!student) return;

  document.getElementById('editStudentId').value = student.id;
  document.getElementById('editNameDisplay').value = student.student_name;
  document.getElementById('editEnrollDisplay').value = student.enrollment_no;
  document.getElementById('editDept').value = student.department;
  document.getElementById('editClass').value = student.class_name;
  document.getElementById('editHostel').value = student.hostel_name;
  document.getElementById('editRoom').value = student.room_number;
  document.getElementById('editBed').value = student.bed_number;
  document.getElementById('editPhone').value = student.phone || '';
  document.getElementById('editStatus').value = student.allocation_status;

  openModal('editModal');
};

document.getElementById('editStudentForm').onsubmit = async (e) => {
  e.preventDefault();
  const token = localStorage.getItem('erp_token');
  const id = document.getElementById('editStudentId').value;
  
  const payload = {
    student_name: document.getElementById('editNameDisplay').value,
    enrollment_no: document.getElementById('editEnrollDisplay').value,
    department: document.getElementById('editDept').value,
    class_name: document.getElementById('editClass').value,
    hostel_name: document.getElementById('editHostel').value,
    room_number: document.getElementById('editRoom').value.trim(),
    bed_number: document.getElementById('editBed').value.trim(),
    phone: document.getElementById('editPhone').value.trim(),
    allocation_status: document.getElementById('editStatus').value
  };

  try {
    const res = await fetch(`${FASTAPI_BASE}/hostel/students/${id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      },
      body: JSON.stringify(payload)
    });

    const data = await res.json();
    if (!res.ok) throw new Error(data.detail || 'Failed to update student allocation details');

    closeModal('editModal');
    showToast('Allocation updated successfully!', 'success');
    loadDashboardData();

  } catch (err) {
    showToast(err.message, 'error');
  }
};

// DELETE ALLOCATION
window.openDeleteModal = (id) => {
  document.getElementById('deleteStudentId').value = id;
  openModal('deleteModal');
};

window.confirmDeleteAllocation = async () => {
  const token = localStorage.getItem('erp_token');
  const id = document.getElementById('deleteStudentId').value;

  try {
    const res = await fetch(`${FASTAPI_BASE}/hostel/students/${id}`, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });

    const data = await res.json();
    if (!res.ok) throw new Error(data.detail || 'Failed to delete student allocation');

    closeModal('deleteModal');
    showToast('Allocation deleted successfully!', 'success');
    loadDashboardData();

  } catch (err) {
    showToast(err.message, 'error');
  }
};

// Close modal when clicking outside content
document.querySelectorAll('.modal-overlay').forEach(modal => {
  modal.onclick = (e) => {
    if (e.target === modal) {
      closeModal(modal.id);
    }
  };
});

// ── Initial Boot ──
loadDashboardData();
