(function () {
  'use strict';

  requireRole('teacher', 'teacher-login.html');

  const params = new URLSearchParams(location.search);
  const classId = Number(params.get('class'));
  const className = params.get('name') || 'Class';

  document.getElementById('title').textContent = 'Marks Management — ' + className;
  document.getElementById('subtitle').textContent = className + ' · Mid Semester · Max 20 marks per subject';

  const subjectSelect = document.getElementById('subject');
  const subjectValue = document.getElementById('subjectValue');
  const subjectMenu = document.getElementById('subjectMenu');
  const subjectTrigger = document.getElementById('subjectTrigger');
  const selectWrap = document.getElementById('subjectSelect');
  const tbody = document.getElementById('tbody');
  const tablePanel = document.getElementById('tablePanel');
  const errorEl = document.getElementById('error');

  let subjects = [];
  let originalMarks = {};

  function openDropdown() {
    subjectTrigger.setAttribute('aria-expanded', 'true');
    subjectMenu.hidden = false;
    selectWrap.classList.add('open');
  }

  function closeDropdown() {
    subjectTrigger.setAttribute('aria-expanded', 'false');
    subjectMenu.hidden = true;
    selectWrap.classList.remove('open');
  }

  function buildCustomDropdown() {
    subjectSelect.innerHTML = subjects.map(s =>
      `<option value="${s.id}">${s.name}</option>`
    ).join('');

    subjectMenu.innerHTML = subjects.map((s, i) =>
      `<li role="option" data-value="${s.id}" class="custom-select-option${i === 0 ? ' selected' : ''}">${s.name}</li>`
    ).join('');

    if (subjects.length) {
      subjectSelect.value = subjects[0].id;
      subjectValue.textContent = subjects[0].name;
    }

    subjectMenu.querySelectorAll('.custom-select-option').forEach(opt => {
      opt.addEventListener('click', () => {
        const val = opt.dataset.value;
        subjectSelect.value = val;
        subjectValue.textContent = opt.textContent;
        subjectMenu.querySelectorAll('.custom-select-option').forEach(o => o.classList.remove('selected'));
        opt.classList.add('selected');
        closeDropdown();
        loadMarks();
      });
    });
  }

  subjectTrigger.addEventListener('click', (e) => {
    e.stopPropagation();
    if (selectWrap.classList.contains('open')) closeDropdown();
    else openDropdown();
  });

  document.addEventListener('click', () => closeDropdown());

  async function loadSubjects() {
    const res = await TeacherAPI.subjects(classId);
    subjects = res.subjects || [];
    if (!subjects.length) {
      subjectValue.textContent = 'No subjects available';
      tbody.innerHTML = '<tr class="marks-empty-row"><td colspan="3">No subjects for this class</td></tr>';
      return;
    }
    buildCustomDropdown();
    await loadMarks();
  }

  function renderRows(students) {
    if (!students.length) {
      tbody.innerHTML = '<tr class="marks-empty-row"><td colspan="3">No students in this class</td></tr>';
      return;
    }

    originalMarks = {};
    tbody.innerHTML = students.map((s, i) => {
      const val = s.marks_obtained ?? '';
      originalMarks[s.id] = val === '' ? '' : String(val);
      return `
        <tr class="marks-row" style="--row-delay:${i * 0.04}s">
          <td class="marks-enroll">${s.enrollment_number}</td>
          <td class="marks-name">${s.name}</td>
          <td class="marks-input-cell">
            <input type="number" class="marks-input" data-id="${s.id}" value="${val}" min="0" max="20" step="0.5" placeholder="0" aria-label="Marks for ${s.name}">
          </td>
        </tr>`;
    }).join('');

    tablePanel.classList.add('loaded');
  }

  async function loadMarks() {
    const subjectId = subjectSelect.value;
    if (!subjectId) return;

    tablePanel.classList.remove('loaded');
    tbody.innerHTML = '<tr class="marks-empty-row"><td colspan="3">Loading students…</td></tr>';

    try {
      const { students } = await TeacherAPI.marks(classId, subjectId);
      renderRows(students);
    } catch (ex) {
      tbody.innerHTML = `<tr class="marks-empty-row"><td colspan="3">${ex.message}</td></tr>`;
    }
  }

  function resetMarks() {
    document.querySelectorAll('.marks-input').forEach(inp => {
      const id = inp.dataset.id;
      inp.value = originalMarks[id] ?? '';
    });
    errorEl.classList.remove('show');
  }

  async function saveMarks() {
    errorEl.classList.remove('show');
    const saveBtn = document.getElementById('saveBtn');
    saveBtn.disabled = true;
    saveBtn.textContent = 'Saving…';

    try {
      const subject_id = Number(subjectSelect.value);
      const records = [...document.querySelectorAll('.marks-input')]
        .filter(inp => inp.value !== '')
        .map(inp => ({
          student_id: Number(inp.dataset.id),
          marks_obtained: Number(inp.value),
          max_marks: 20
        }))
        .filter(r => !isNaN(r.marks_obtained) && r.marks_obtained >= 0 && r.marks_obtained <= 20);

      if (!records.length) {
        throw new Error('Enter at least one valid mark (0–20)');
      }

      await TeacherAPI.saveMarks(classId, subject_id, records);
      alert('Marks saved successfully!');
      location.href = 'teacher-dashboard.html';
    } catch (ex) {
      errorEl.textContent = ex.message;
      errorEl.classList.add('show');
      saveBtn.disabled = false;
      saveBtn.textContent = 'Save Marks';
    }
  }

  document.getElementById('resetBtn').addEventListener('click', resetMarks);
  document.getElementById('saveBtn').addEventListener('click', saveMarks);

  loadSubjects();
})();
