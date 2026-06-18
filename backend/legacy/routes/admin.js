import express from 'express';
import { from } from '../lib/db.js';
import { authMiddleware, hashPassword } from '../lib/auth.js';
import { bulkInsertDemoStudents } from '../lib/demoStudents.js';

const router = express.Router();
router.use(authMiddleware(['admin']));

const DEPT_CODES = ['AIML', 'CYBER'];

router.get('/users', async (req, res) => {
  try {
    const { data: students } = await from('college_students')
      .select('id, enrollment_number, password_plain, name, department_id')
      .order('name');

    const { data: teachers } = await from('college_teachers')
      .select('id, teacher_id, password_plain, name, department_id')
      .order('name');

    const { data: depts } = await from('college_departments').select('id, name');
    const deptMap = Object.fromEntries((depts || []).map((d) => [d.id, d.name]));

    res.json({
      students: (students || []).map((s) => ({
        id: s.id,
        loginId: s.enrollment_number,
        password: s.password_plain,
        name: s.name,
        department: deptMap[s.department_id],
        type: 'student'
      })),
      teachers: (teachers || []).map((t) => ({
        id: t.id,
        loginId: t.teacher_id,
        password: t.password_plain,
        name: t.name,
        department: deptMap[t.department_id],
        type: 'teacher'
      }))
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.get('/departments', async (req, res) => {
  try {
    const { data } = await from('college_departments').select('id, code, name');
    res.json({ departments: data || [] });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.get('/classes', async (req, res) => {
  try {
    const { data } = await from('college_classes').select('id, name, department_id');
    res.json({ classes: data || [] });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.post('/users/student', async (req, res) => {
  try {
    const { name, department_code, enrollment_number, password, class_name } = req.body;
    if (!name || !department_code || !enrollment_number || !password || !class_name) {
      return res.status(400).json({ error: 'All fields required' });
    }
    if (!DEPT_CODES.includes(department_code)) {
      return res.status(400).json({ error: 'Department must be AIML or CYBER' });
    }

    const { data: dept } = await from('college_departments').select('id').eq('code', department_code).single();
    const { data: cls } = await from('college_classes').select('id').eq('name', class_name).single();

    const { data, error } = await from('college_students').insert([{
      enrollment_number: enrollment_number.trim().toUpperCase(),
      password_hash: hashPassword(password),
      password_plain: password,
      name,
      department_id: dept.id,
      class_id: cls.id
    }]).select();

    if (error) return res.status(400).json({ error: error.message });

    await from('college_fees').insert([{
      student_id: data[0].id,
      total_fee: 50000,
      paid_amount: 0,
      pending_amount: 50000,
      status: 'pending'
    }]);

    res.json({ success: true, student: data[0] });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.post('/users/teacher', async (req, res) => {
  try {
    const { name, department_code, teacher_id, password, class_names } = req.body;
    if (!name || !department_code || !teacher_id || !password) {
      return res.status(400).json({ error: 'All fields required' });
    }
    if (!DEPT_CODES.includes(department_code)) {
      return res.status(400).json({ error: 'Department must be AIML or CYBER' });
    }

    const assigned = class_names || [];
    if (assigned.length > 5) {
      return res.status(400).json({ error: 'Maximum 5 classes per teacher' });
    }

    const { data: dept } = await from('college_departments').select('id').eq('code', department_code).single();

    const { data, error } = await from('college_teachers').insert([{
      teacher_id: teacher_id.trim().toUpperCase(),
      password_hash: hashPassword(password),
      password_plain: password,
      name,
      department_id: dept.id
    }]).select();

    if (error) return res.status(400).json({ error: error.message });

    if (assigned.length) {
      const { data: classes } = await from('college_classes').select('id, name').in('name', assigned);
      await from('college_teacher_classes').insert(
        classes.map((c) => ({ teacher_id: data[0].id, class_id: c.id }))
      );
    }

    res.json({ success: true, teacher: data[0] });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.put('/users/:type/:id', async (req, res) => {
  try {
    const { type, id } = req.params;
    const { name, password, department_code } = req.body;
    const table = type === 'student' ? 'college_students' : 'college_teachers';
    const updates = { name };
    if (password) {
      updates.password_hash = hashPassword(password);
      updates.password_plain = password;
    }
    if (department_code) {
      const { data: dept } = await from('college_departments').select('id').eq('code', department_code).single();
      updates.department_id = dept.id;
    }
    const { data } = await from(table).update(updates).eq('id', id).select();
    res.json({ success: true, user: data[0] });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.delete('/users/:type/:id', async (req, res) => {
  try {
    const table = req.params.type === 'student' ? 'college_students' : 'college_teachers';
    await from(table).delete().eq('id', req.params.id);
    res.json({ success: true });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.post('/generate-demo-students', async (req, res) => {
  try {
    const result = await bulkInsertDemoStudents(from, hashPassword);
    res.json({
      success: true,
      message: `Created ${result.created} demo students (${result.skipped} skipped as duplicates).`,
      ...result
    });
  } catch (e) {
    res.status(e.status || 500).json({ error: e.message });
  }
});

router.get('/analytics', async (req, res) => {
  try {
    const { data: students } = await from('college_students')
      .select('id, name, enrollment_number, class_id, department_id');

    const { data: classes } = await from('college_classes').select('id, name');
    const { data: depts } = await from('college_departments').select('id, name, code');
    const { data: subjects } = await from('college_subjects').select('id, name');
    const classMap = Object.fromEntries((classes || []).map((c) => [c.id, c.name]));
    const deptMap = Object.fromEntries((depts || []).map((d) => [d.id, d.name]));
    const subMap = Object.fromEntries((subjects || []).map((s) => [s.id, s.name]));
    const studentMap = Object.fromEntries((students || []).map((s) => [s.id, s]));

    const { data: attendance } = await from('college_attendance').select('student_id, class_id, status');
    const { data: marks } = await from('college_marks')
      .select('student_id, class_id, subject_id, marks_obtained, max_marks');

    const studentStats = (students || []).map((s) => {
      const att = (attendance || []).filter((a) => a.student_id === s.id);
      const total = att.length;
      const present = att.filter((a) => a.status === 'present').length;
      const pct = total ? Math.round((present / total) * 100) : 0;
      const studentMarks = (marks || []).filter((m) => m.student_id === s.id);
      const avg = studentMarks.length
        ? studentMarks.reduce((sum, m) => sum + (Number(m.marks_obtained) / Number(m.max_marks)) * 100, 0) / studentMarks.length
        : 0;
      return {
        id: s.id,
        name: s.name,
        enrollment: s.enrollment_number,
        department: deptMap[s.department_id],
        class: classMap[s.class_id],
        attendancePct: pct,
        avgMarks: Math.round(avg * 10) / 10
      };
    });

    const deptAgg = {};
    studentStats.forEach((s) => {
      if (!deptAgg[s.department]) deptAgg[s.department] = { total: 0, count: 0, marks: 0, mCount: 0 };
      deptAgg[s.department].total += s.attendancePct;
      deptAgg[s.department].count += 1;
      if (s.avgMarks) {
        deptAgg[s.department].marks += s.avgMarks;
        deptAgg[s.department].mCount += 1;
      }
    });

    const departmentWise = Object.entries(deptAgg).map(([dept, v]) => ({
      department: dept,
      avgAttendance: Math.round(v.total / v.count),
      avgMarks: v.mCount ? Math.round((v.marks / v.mCount) * 10) / 10 : 0
    }));

    const classAgg = {};
    studentStats.forEach((s) => {
      if (!classAgg[s.class]) classAgg[s.class] = { total: 0, count: 0 };
      classAgg[s.class].total += s.attendancePct;
      classAgg[s.class].count += 1;
    });

    const classWise = Object.entries(classAgg).map(([cls, v]) => ({
      class: cls,
      avgAttendance: Math.round(v.total / v.count)
    }));

    const allPcts = studentStats.map((s) => s.avgMarks).filter(Boolean);
    const topPerformers = [...studentStats]
      .sort((a, b) => b.avgMarks - a.avgMarks)
      .slice(0, 5);

    const attPresent = (attendance || []).filter((a) => a.status === 'present').length;
    const attAbsent = (attendance || []).filter((a) => a.status === 'absent').length;

    res.json({
      studentStats,
      departmentWise,
      classWise,
      marksSummary: {
        average: allPcts.length ? Math.round(allPcts.reduce((a, b) => a + b, 0) / allPcts.length * 10) / 10 : 0,
        highest: allPcts.length ? Math.max(...allPcts) : 0,
        lowest: allPcts.length ? Math.min(...allPcts) : 0
      },
      topPerformers,
      attendanceChart: { present: attPresent, absent: attAbsent },
      marksTrend: (marks || []).slice(0, 20).map((m) => ({
        student: studentMap[m.student_id]?.name,
        subject: subMap[m.subject_id],
        percentage: Math.round((Number(m.marks_obtained) / Number(m.max_marks)) * 100)
      }))
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

export default router;
