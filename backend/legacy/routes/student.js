import express from 'express';
import { from } from '../lib/db.js';
import { authMiddleware } from '../lib/auth.js';
import { normalizeFees } from '../lib/fees.js';

const router = express.Router();
router.use(authMiddleware(['student']));

router.get('/dashboard', async (req, res) => {
  try {
    const studentId = req.user.id;

    const { data: student } = await from('college_students')
      .select('*')
      .eq('id', studentId)
      .single();

    const { data: dept } = await from('college_departments').select('name, code').eq('id', student.department_id).single();
    const { data: cls } = await from('college_classes').select('name').eq('id', student.class_id).single();

    const { data: attendance } = await from('college_attendance')
      .select('status')
      .eq('student_id', studentId);

    const total = attendance?.length || 0;
    const present = attendance?.filter((a) => a.status === 'present').length || 0;
    const percentage = total ? Math.round((present / total) * 100) : 0;

    const { data: marks } = await from('college_marks')
      .select('marks_obtained, max_marks, subject_id')
      .eq('student_id', studentId)
      .eq('exam_type', 'mid_sem');

    const { data: allSubjects } = await from('college_subjects').select('id, name');
    const subMap = Object.fromEntries((allSubjects || []).map((s) => [s.id, s.name]));

    const marksList = (marks || []).map((m) => ({
      subject: subMap[m.subject_id] || 'Subject',
      obtained: Number(m.marks_obtained),
      max: Number(m.max_marks)
    }));

    const avgMarks = marksList.length
      ? Math.round(marksList.reduce((s, m) => s + (m.obtained / m.max) * 100, 0) / marksList.length)
      : 0;

    const { data: fees } = await from('college_fees')
      .select('*')
      .eq('student_id', studentId)
      .maybeSingle();

    res.json({
      student: {
        name: student.name,
        enrollment: student.enrollment_number,
        department: dept?.name,
        class: cls?.name
      },
      attendance: { total, present, percentage },
      marks: { subjects: marksList, average: avgMarks },
      fees: normalizeFees(fees)
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.get('/attendance', async (req, res) => {
  try {
    const studentId = req.user.id;

    // Fetch all attendance records for student directly from database
    const { data: attendance, error } = await from('college_attendance')
      .select('status, attendance_date, marked_by')
      .eq('student_id', studentId);

    if (error) {
      return res.status(500).json({ error: error.message });
    }

    const recordsRaw = attendance || [];
    
    // Get unique teacher IDs to fetch names
    const teacherIds = [...new Set(recordsRaw.map((r) => r.marked_by).filter(Boolean))];
    let teacherMap = {};
    if (teacherIds.length) {
      const { data: teachers } = await from('college_teachers')
        .select('id, name')
        .in('id', teacherIds);
      teacherMap = Object.fromEntries((teachers || []).map((t) => [t.id, t.name]));
    }

    const records = recordsRaw.map((r) => ({
      date: r.attendance_date,
      status: r.status,
      teacher: teacherMap[r.marked_by] || 'Unknown'
    }));

    const present_days = records.filter((r) => r.status === 'present').length;
    const absent_days = records.filter((r) => r.status === 'absent').length;
    const total = records.length;
    const attendance_percentage = total ? Math.round((present_days / total) * 100) : 0;

    res.json({
      student_id: studentId,
      attendance_percentage,
      present_days,
      absent_days,
      records
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.post('/fees/pay', async (req, res) => {
  try {
    const studentId = req.user.id;
    const { amount } = req.body;

    const { data: fees } = await from('college_fees')
      .select('*')
      .eq('student_id', studentId)
      .single();

    const normalized = normalizeFees(fees);
    const payAmount = Number(amount) || normalized.pending;

    if (payAmount <= 0 || payAmount > normalized.pending) {
      return res.status(400).json({ error: 'Invalid payment amount' });
    }

    const newPaid = normalized.paid + payAmount;
    const newPending = Math.max(0, normalized.total - newPaid);
    const status = newPending <= 0 ? 'paid' : 'pending';

    const { data: updated } = await from('college_fees')
      .update({
        paid_amount: newPaid,
        pending_amount: newPending,
        status,
        updated_at: new Date().toISOString()
      })
      .eq('student_id', studentId)
      .select();

    res.json({ success: true, fees: updated[0] });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

export default router;
