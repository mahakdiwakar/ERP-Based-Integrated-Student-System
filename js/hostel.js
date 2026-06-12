/**
 * HOSTEL MANAGEMENT MODULE — Client Logic
 */

(function () {
  'use strict';

  const user = getUser();
  if (!user) { window.location.href = 'hostel-login.html'; return; }

  // Role detection: warden (admin role), student
  const isAdmin = user.role === 'admin';
  const isStudent = user.role === 'student';

  // If query param role is present, honour it (set from login page)
  const urlRole = new URLSearchParams(window.location.search).get('role');
  if (urlRole === 'warden' && !isAdmin) {
    window.location.href = 'hostel-login.html';
    return;
  }
  if (urlRole === 'student' && !isStudent) {
    window.location.href = 'hostel-login.html';
    return;
  }

  document.getElementById('userName').textContent = user.name;
  document.getElementById('userMeta').textContent = isAdmin ? 'Warden / Admin' : user.loginId;
  document.getElementById('logoutBtn').onclick = () => logout('hostel-login.html');

  if (isAdmin) {
    document.getElementById('adminView').style.display = 'block';
    initAdmin();
  } else if (isStudent) {
    document.getElementById('studentView').style.display = 'block';
    initStudent();
  }

  // --- TAB SYSTEM ---
  document.querySelectorAll('.erp-tab').forEach(tab => {
    tab.addEventListener('click', () => {
      const parent = tab.parentElement;
      parent.querySelectorAll('.erp-tab').forEach(t => t.classList.remove('active'));
      tab.classList.add('active');

      const target = tab.dataset.tab;
      document.querySelectorAll('.erp-panel').forEach(p => {
        p.classList.toggle('active', p.id === `panel-${target}`);
      });
    });
  });

  // --- MODAL HELPERS ---
  window.showModal = (id) => {
    const el = document.getElementById(id);
    if (el) {
      el.classList.add('show');
      if (id === 'modalAllocate') {
        console.log("Allocate modal opened: triggering fresh load of hostels, rooms, and students.");
        loadHostelsAndRooms();
        loadStudents();
      }
    }
  };
  window.hideModal = (id) => {
    const el = document.getElementById(id);
    if (el) el.classList.remove('show');
  };

  // ============================================
  // ADMIN LOGIC
  // ============================================

  async function initAdmin() {
    loadAnalytics();
    loadAllocations();
    loadHostelsAndRooms();
    loadStudents();

    // Form: Create Hostel
    document.getElementById('formHostel').onsubmit = async (e) => {
      e.preventDefault();
      const formData = new FormData(e.target);
      const body = Object.fromEntries(formData.entries());
      try {
        await HostelAPI.createHostel(body);
        e.target.reset();
        loadHostelsAndRooms();
        loadAnalytics();
        alert('Hostel created successfully');
      } catch (err) { alert(err.message); }
    };

    // Form: Create Room
    document.getElementById('formRoom').onsubmit = async (e) => {
      e.preventDefault();
      const formData = new FormData(e.target);
      const body = {
        hostel_id: parseInt(formData.get('hostel_id')),
        room_number: formData.get('room_number'),
        floor: parseInt(formData.get('floor')),
        capacity: parseInt(formData.get('capacity'))
      };
      try {
        await HostelAPI.createRoom(body);
        e.target.reset();
        loadAnalytics();
        alert('Room created successfully');
      } catch (err) { alert(err.message); }
    };

    // Form: Allocate Room
    document.getElementById('formAllocate').onsubmit = async (e) => {
      e.preventDefault();
      const formData = new FormData(e.target);
      const body = {
        student_id: parseInt(formData.get('student_id')),
        hostel_id: formData.get('hostel_id') ? parseInt(formData.get('hostel_id')) : null,
        room_id: formData.get('room_id') ? parseInt(formData.get('room_id')) : null
      };
      try {
        const res = await HostelAPI.allocate(body);
        hideModal('modalAllocate');
        loadAllocations();
        loadAnalytics();
        alert(res.message || 'Allocation successful');
      } catch (err) { alert(err.message); }
    };

    // Form: Change Room
    document.getElementById('formChangeRoom').onsubmit = async (e) => {
      e.preventDefault();
      const formData = new FormData(e.target);
      const body = {
        allocation_id: parseInt(formData.get('allocation_id')),
        new_room_id: parseInt(formData.get('new_room_id'))
      };
      try {
        await HostelAPI.changeRoom(body);
        hideModal('modalChangeRoom');
        loadAllocations();
        loadAnalytics();
        alert('Room changed successfully');
      } catch (err) { alert(err.message); }
    };

    // Search Allocations
    document.getElementById('searchAllocations').oninput = (e) => {
      const q = e.target.value.toLowerCase();
      const rows = document.querySelectorAll('#allocTable tr');
      rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(q) ? '' : 'none';
      });
    };
  }

  async function loadAnalytics() {
    try {
      const d = await HostelAPI.analytics();
      document.getElementById('statHostels').textContent = d.totalHostels;
      document.getElementById('statRooms').textContent = d.totalRooms;
      document.getElementById('statOccupied').textContent = d.occupiedRooms;
      document.getElementById('statAvailable').textContent = d.availableRooms;

      const totalCap = d.occupiedRooms + d.availableRooms;
      const pct = totalCap ? Math.round((d.occupiedRooms / totalCap) * 100) : 0;
      document.getElementById('statBedPct').textContent = pct + '%';

      const charts = document.getElementById('hostelCharts');
      charts.innerHTML = d.hostelStats.map(h => `
        <div style="margin-bottom: 20px;">
          <div class="erp-stat-row"><span>${h.name}</span><span>${h.occupancy}% Occupied</span></div>
          <div class="erp-progress"><div class="erp-progress-fill gold" style="width: ${h.occupancy}%; background: var(--gold);"></div></div>
          <div style="font-size: 0.8rem; color: var(--muted); text-align: right;">${h.available} beds available</div>
        </div>
      `).join('');
    } catch (err) { console.error(err); }
  }

  async function loadAllocations() {
    try {
      const { allocations } = await HostelAPI.allocations();
      const table = document.getElementById('allocTable');
      const waitTable = document.getElementById('waitingTable');
      
      const active = allocations.filter(a => a.status === 'Allocated');
      const waiting = allocations.filter(a => a.status === 'Waiting');

      table.innerHTML = active.map(a => `
        <tr>
          <td><strong>${a.student_name}</strong></td>
          <td>${a.enrollment_no}</td>
          <td>${a.department}</td>
          <td>${a.hostel_name}</td>
          <td>${a.room_number}</td>
          <td>F${a.floor} / B${a.bed_number}</td>
          <td><span class="erp-badge paid">${a.status}</span></td>
          <td>
            <button class="erp-btn erp-btn-outline erp-btn-sm" onclick="openChangeRoom(${a.id})">Change</button>
            <button class="erp-btn erp-btn-danger erp-btn-sm" onclick="removeAlloc(${a.id})" style="margin-left: 4px;">Remove</button>
          </td>
        </tr>
      `).join('');

      waitTable.innerHTML = waiting.map(a => `
        <tr>
          <td><strong>${a.student_name}</strong></td>
          <td>${a.enrollment_no}</td>
          <td>${a.hostel_name}</td>
          <td>${new Date(a.allocation_date).toLocaleDateString()}</td>
          <td>
            <button class="erp-btn erp-btn-gold erp-btn-sm" onclick="allocateFromWait(${a.student_id}, ${a.id})">Allocate</button>
          </td>
        </tr>
      `).join('');
    } catch (err) { console.error(err); }
  }

  window.removeAlloc = async (id) => {
    if (!confirm('Are you sure you want to remove this allocation?')) return;
    try {
      await HostelAPI.removeAllocation(id);
      loadAllocations();
      loadAnalytics();
    } catch (err) { alert(err.message); }
  };

  window.openChangeRoom = async (allocId) => {
    document.getElementById('changeAllocId').value = allocId;
    const { rooms } = await HostelAPI.rooms();
    const select = document.getElementById('changeRoomSelect');
    select.innerHTML = rooms.filter(r => r.occupied_beds < r.capacity).map(r => 
      `<option value="${r.id}">Room ${r.room_number} (Floor ${r.floor}) — ${r.capacity - r.occupied_beds} beds left</option>`
    ).join('');
    showModal('modalChangeRoom');
  };

  window.allocateFromWait = (studentId, allocId) => {
    document.getElementById('studentSelect').value = studentId;
    showModal('modalAllocate');
  };

  async function loadHostelsAndRooms() {
    try {
      console.log("Calling HostelAPI.hostels()...");
      const hostelRes = await HostelAPI.hostels();
      console.log("HostelAPI.hostels() Response:", hostelRes);

      const { hostels } = hostelRes;
      const hSelects = [
        document.getElementById('roomHostelSelect'),
        document.getElementById('hostelSelect')
      ];
      const hOptions = hostels.map(h => `<option value="${h.id}">${h.hostel_name} (${h.gender})</option>`).join('');
      hSelects.forEach(s => {
        if (s) s.innerHTML = hOptions;
      });

      const hostelSelect = document.getElementById('hostelSelect');
      if (hostelSelect) {
        hostelSelect.onchange = async () => {
          const hId = hostelSelect.value;
          if (!hId) return;
          console.log(`Calling HostelAPI.rooms(${hId})...`);
          try {
            const roomsRes = await HostelAPI.rooms(hId);
            console.log(`HostelAPI.rooms(${hId}) Response:`, roomsRes);

            const { rooms } = roomsRes;
            const rSelect = document.getElementById('roomSelect');
            if (rSelect) {
              rSelect.innerHTML = '<option value="">Auto-Assign</option>' + 
                rooms.filter(r => r.occupied_beds < r.capacity).map(r => 
                  `<option value="${r.id}">Room ${r.room_number} (Available: ${r.capacity - r.occupied_beds})</option>`
                ).join('');
            }
          } catch (roomErr) {
            console.error("Failed to load rooms for selected hostel:", roomErr);
            alert("Failed to load rooms for selected hostel: " + roomErr.message);
          }
        };
        hostelSelect.onchange(); // Trigger initial load
      }

    } catch (err) {
      console.error("Failed to load hostels/rooms:", err);
      alert("Failed to load hostels: " + err.message);
    }
  }

  async function loadStudents() {
    try {
      console.log("Calling AdminAPI.users()...");
      const studentsRes = await AdminAPI.users();
      console.log("AdminAPI.users() Response:", studentsRes);

      const { students } = studentsRes;
      const select = document.getElementById('studentSelect');
      if (select) {
        select.innerHTML = students.map(s => `<option value="${s.id}">${s.name} (${s.loginId})</option>`).join('');
      }
    } catch (err) {
      console.error("Failed to load students registry for dropdown:", err);
      alert("Failed to load students for dropdown: " + err.message);
    }
  }

  // ============================================
  // STUDENT LOGIC
  // ============================================

  async function initStudent() {
    try {
      const d = await HostelAPI.studentHostel();
      if (!d.allocated) {
        document.getElementById('allocInfo').innerHTML = `
          <div class="erp-pct">None</div>
          <p style="color:var(--muted); font-size: 0.9rem;">You haven't applied for or been allocated a hostel yet.</p>
        `;
        return;
      }

      document.getElementById('stRoom').textContent = d.status === 'Allocated' ? 'Room ' + d.room_number : 'Waiting';
      document.getElementById('stHostel').textContent = d.hostel_name;
      document.getElementById('stFloor').textContent = d.floor || '—';
      document.getElementById('stBed').textContent = d.bed_number || '—';
      document.getElementById('stDate').textContent = new Date(d.allocation_date).toLocaleDateString();
      
      const badge = document.getElementById('stStatus');
      badge.textContent = d.status.toUpperCase();
      badge.className = 'erp-badge ' + (d.status === 'Allocated' ? 'paid' : 'pending');

      const mates = document.getElementById('roommatesList');
      if (d.roommates && d.roommates.length) {
        mates.innerHTML = d.roommates.map(m => `
          <div class="roommate-item">
            <div class="roommate-avatar">${m.charAt(0)}</div>
            <div style="font-size: 0.9rem;">${m}</div>
          </div>
        `).join('');
      } else {
        mates.innerHTML = `<p style="color:var(--muted); font-size: 0.9rem;">No roommates yet.</p>`;
      }

      // Fees
      document.getElementById('hFeeTotal').textContent = '₹' + d.fees.total.toLocaleString();
      document.getElementById('hFeePaid').textContent = '₹' + d.fees.paid.toLocaleString();
      document.getElementById('hFeePending').textContent = '₹' + d.fees.pending.toLocaleString();
      
      const fBadge = document.getElementById('hFeeBadge');
      fBadge.textContent = d.fees.status.toUpperCase();
      fBadge.className = 'erp-badge ' + (d.fees.status === 'paid' ? 'paid' : 'pending');

      const payBtn = document.getElementById('payHostelBtn');
      if (d.fees.pending > 0) {
        payBtn.onclick = async () => {
          if (!confirm('Pay ₹' + d.fees.pending + ' for hostel fees?')) return;
          try {
            await HostelAPI.payFee(d.fees.pending);
            alert('Payment successful');
            initStudent();
          } catch (err) { alert(err.message); }
        };
      } else {
        payBtn.style.display = 'none';
      }

    } catch (err) { console.error(err); }
  }

})();
