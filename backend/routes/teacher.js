import express from 'express';
import { from } from '../lib/db.js';
import { authMiddleware } from '../lib/auth.js';

const router = express.Router();
router.use(authMiddleware(['teacher']));

async function getAssignedClasses(teacherId) {
  const { data: links } = await from('college_teacher_classes')
    .select('class_id')
    .eq('teacher_id', teacherId);

  if (!links?.length) return [];

  const classIds = links.map((l) => l.class_id);
  const { data: classes } = await from('college_classes').select('id, name, department_id').in('id', classIds);
  const { data: depts } = await from('college_departments').select('id, name');
  const deptMap = Object.fromEntries((depts || []).map((d) => [d.id, d.name]));

  return (classes || []).map((c) => ({
    id: c.id,
    name: c.name,
    department: deptMap[c.department_id]
  }));
}

const classAccessCache = new Map();

async function verifyClassAccess(teacherId, classId) {
  const key = `${teacherId}-${classId}`;
  const now = Date.now();
  const cached = classAccessCache.get(key);

  if (cached && cached.expiry > now) {
    console.log(`[PERF] verifyClassAccess cache hit for ${key}`);
    return cached.hasAccess;
  }

  console.log(`[PERF] verifyClassAccess cache miss for ${key}, querying DB`);
  const { data: link } = await from('college_teacher_classes')
    .select('id')
    .eq('teacher_id', teacherId)
    .eq('class_id', Number(classId))
    .maybeSingle();

  const hasAccess = !!link;
  classAccessCache.set(key, {
    hasAccess,
    expiry: now + 60000 // 60 seconds TTL
  });

  return hasAccess;
}

router.get('/classes', async (req, res) => {
  try {
    const classes = await getAssignedClasses(req.user.id);
    res.json({ classes });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.get('/classes/:classId/students', async (req, res) => {
  try {
    const classId = Number(req.params.classId);
    if (!(await verifyClassAccess(req.user.id, classId))) {
      return res.status(403).json({ error: 'You are not assigned to this class' });
    }

    const { data: students } = await from('college_students')
      .select('id, enrollment_number, name')
      .eq('class_id', classId)
      .order('name');

    const targetDate = req.query.date || new Date().toISOString().slice(0, 10);
    const { data: todayAttendance } = await from('college_attendance')
      .select('student_id, status')
      .eq('class_id', classId)
      .eq('attendance_date', targetDate);

    const attMap = Object.fromEntries((todayAttendance || []).map((a) => [a.student_id, a.status]));

    res.json({
      students: (students || []).map((s) => ({
        ...s,
        status: attMap[s.id] || null
      }))
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.post('/attendance', async (req, res) => {
  try {
    const { class_id, records } = req.body;
    if (!(await verifyClassAccess(req.user.id, class_id))) {
      return res.status(403).json({ error: 'You are not assigned to this class' });
    }

    const today = new Date().toISOString().slice(0, 10);
    const results = [];

    for (const rec of records) {
      const { data: existing } = await from('college_attendance')
        .select('id')
        .eq('student_id', rec.student_id)
        .eq('attendance_date', today)
        .maybeSingle();

      if (existing) {
        await from('college_attendance')
          .update({ status: rec.status, marked_by: req.user.id, class_id })
          .eq('id', existing.id);
      } else {
        await from('college_attendance').insert([{
          student_id: rec.student_id,
          class_id,
          attendance_date: today,
          status: rec.status,
          marked_by: req.user.id
        }]);
      }
      results.push(rec);
    }

    res.json({ success: true, saved: results.length, date: today });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.get('/classes/:classId/subjects', async (req, res) => {
  try {
    const classId = Number(req.params.classId);
    const cls = await verifyClassAccess(req.user.id, classId);
    if (!cls) return res.status(403).json({ error: 'You are not assigned to this class' });

    const { data: classRow } = await from('college_classes')
      .select('department_id')
      .eq('id', classId)
      .single();

    const { data: subjects } = await from('college_subjects')
      .select('id, name, max_marks')
      .eq('department_id', classRow.department_id);

    res.json({ subjects: subjects || [] });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.get('/classes/:classId/marks', async (req, res) => {
  try {
    const classId = Number(req.params.classId);
    const subjectId = Number(req.query.subject_id);
    if (!(await verifyClassAccess(req.user.id, classId))) {
      return res.status(403).json({ error: 'You are not assigned to this class' });
    }

    const { data: students } = await from('college_students')
      .select('id, enrollment_number, name')
      .eq('class_id', classId);

    const { data: marks } = await from('college_marks')
      .select('student_id, marks_obtained, max_marks')
      .eq('class_id', classId)
      .eq('subject_id', subjectId)
      .eq('exam_type', 'mid_sem');

    const markMap = Object.fromEntries((marks || []).map((m) => [m.student_id, m]));

    res.json({
      students: (students || []).map((s) => ({
        ...s,
        marks_obtained: markMap[s.id]?.marks_obtained ?? null,
        max_marks: markMap[s.id]?.max_marks ?? 20
      }))
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.post('/marks', async (req, res) => {
  try {
    const { class_id, subject_id, records } = req.body;
    if (!(await verifyClassAccess(req.user.id, class_id))) {
      return res.status(403).json({ error: 'You are not assigned to this class' });
    }

    for (const rec of records) {
      const { data: existing } = await from('college_marks')
        .select('id')
        .eq('student_id', rec.student_id)
        .eq('subject_id', subject_id)
        .eq('exam_type', 'mid_sem')
        .maybeSingle();

      const payload = {
        marks_obtained: rec.marks_obtained,
        max_marks: rec.max_marks || 20,
        updated_by: req.user.id,
        updated_at: new Date().toISOString()
      };

      if (existing) {
        await from('college_marks').update(payload).eq('id', existing.id);
      } else {
        await from('college_marks').insert([{
          student_id: rec.student_id,
          subject_id,
          class_id,
          exam_type: 'mid_sem',
          ...payload
        }]);
      }
    }

    res.json({ success: true, saved: records.length });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

export async function saveAttendanceHandler(req, res) {
  const start = Date.now();
  try {
    const { teacher_id, class_id, attendance_date, attendance } = req.body;
    console.log(`[PERF] saveAttendanceHandler started for teacher ${teacher_id}, class ${class_id}`);

    if (req.user.id !== Number(teacher_id)) {
      return res.status(403).json({ error: 'Teacher ID mismatch' });
    }

    const verifyStart = Date.now();
    const hasAccess = await verifyClassAccess(req.user.id, class_id);
    console.log(`[PERF] verifyClassAccess took ${Date.now() - verifyStart}ms`);
    if (!hasAccess) {
      return res.status(403).json({ error: 'You are not assigned to this class' });
    }

    const tDate = new Date(attendance_date);
    const today = new Date();
    today.setHours(23, 59, 59, 999);

    if (tDate > today) {
      return res.status(400).json({ error: 'Cannot mark attendance for future dates' });
    }

    const diffTime = Math.abs(today - tDate);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    if (diffDays > 30) {
      return res.status(400).json({ error: 'Cannot edit attendance older than 30 days' });
    }

    const records = attendance.map((rec) => ({
      student_id: rec.student_id,
      class_id: Number(class_id),
      attendance_date,
      status: rec.status,
      marked_by: Number(teacher_id),
      updated_at: new Date().toISOString()
    }));

    const dbStart = Date.now();
    const { error } = await from('college_attendance').upsert(records, { onConflict: 'student_id,attendance_date' });
    const dbDuration = Date.now() - dbStart;
    console.log(`[PERF] DB upsert took ${dbDuration}ms for ${records.length} records`);

    if (error) {
      console.error(`[PERF] DB upsert error:`, error);
      return res.status(500).json({ error: error.message });
    }

    const totalDuration = Date.now() - start;
    console.log(`[PERF] saveAttendanceHandler finished in ${totalDuration}ms`);

    res.json({ success: true, message: 'Attendance saved successfully', saved: records.length });
  } catch (e) {
    console.error(`[PERF] saveAttendanceHandler failed after ${Date.now() - start}ms:`, e);
    res.status(500).json({ error: e.message });
  }
}

export default router;
