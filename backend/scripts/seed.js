import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';
import bcrypt from 'bcryptjs';
import { from } from '../lib/db.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
dotenv.config({ path: path.join(__dirname, '../../.env.local') });

const hash = (p) => bcrypt.hashSync(p, 10);

async function seed() {
  const deptRes = await from('college_departments').select('id, code');
  if (deptRes.error) {
    throw new Error(`Failed to fetch departments: ${JSON.stringify(deptRes.error)}`);
  }
  const depts = deptRes.data;
  if (!depts) {
    throw new Error('No departments found or returned.');
  }
  const aiml = depts.find((d) => d.code === 'AIML');
  const cyber = depts.find((d) => d.code === 'CYBER');

  const { data: classes } = await from('college_classes').select('id, name');
  const classMap = Object.fromEntries(classes.map((c) => [c.name, c.id]));

  const { data: subjects } = await from('college_subjects').select('id, name, department_id');

  const { data: existingAdmin } = await from('college_admins').select('id').eq('username', 'admin').maybeSingle();
  if (!existingAdmin) {
    await from('college_admins').insert([{
      username: 'admin',
      password_hash: hash('admin123'),
      password_plain: 'admin123',
      name: 'System Administrator'
    }]);
    console.log('Admin: admin / admin123');
  } else {
    await from('college_admins').update({
      password_hash: hash('admin123'),
      password_plain: 'admin123'
    }).eq('username', 'admin');
    console.log('Admin: admin / admin123 (reset)');
  }

  const { data: existingTeacher } = await from('college_teachers').select('id').eq('teacher_id', 'TCH001').maybeSingle();
  let teacherDbId;
  if (!existingTeacher) {
    const { data: t } = await from('college_teachers').insert([{
      teacher_id: 'TCH001',
      password_hash: hash('teacher123'),
      password_plain: 'teacher123',
      name: 'Dr. Priya Sharma',
      department_id: aiml.id
    }]).select();
    teacherDbId = t[0].id;
    const assigned = ['AIML-A', 'AIML-B', 'AIML-C', 'CYBER-A', 'CYBER-B', 'CYBER-C'];
    await from('college_teacher_classes').insert(
      assigned.map((name) => ({ teacher_id: teacherDbId, class_id: classMap[name] }))
    );
    console.log('Teacher: TCH001 / teacher123');
  } else {
    await from('college_teachers').update({
      password_hash: hash('teacher123'),
      password_plain: 'teacher123'
    }).eq('teacher_id', 'TCH001');
    console.log('Teacher: TCH001 / teacher123 (reset)');
  }

  const students = [
    { enrollment_number: 'AIML2024001', password: 'student123', name: 'Arjun Mehta', dept: aiml.id, className: 'AIML-A', present: 102 },
    { enrollment_number: 'AIML2024002', password: 'student123', name: 'Sneha Reddy', dept: aiml.id, className: 'AIML-B', present: 72 },
    { enrollment_number: 'CYB2024001', password: 'student123', name: 'Rahul Verma', dept: cyber.id, className: 'CYBER-A', present: 95 }
  ];

  for (const s of students) {
    const { data: ex } = await from('college_students').select('id').eq('enrollment_number', s.enrollment_number).maybeSingle();
    if (ex) {
      await from('college_students').update({
        password_hash: hash(s.password),
        password_plain: s.password
      }).eq('enrollment_number', s.enrollment_number);
      continue;
    }

    const { data: st } = await from('college_students').insert([{
      enrollment_number: s.enrollment_number,
      password_hash: hash(s.password),
      password_plain: s.password,
      name: s.name,
      department_id: s.dept,
      class_id: classMap[s.className]
    }]).select();

    const studentId = st[0].id;
    const paidAmount = s.enrollment_number === 'AIML2024001' ? 50000 : 30000;
    await from('college_fees').insert([{
      student_id: studentId,
      total_fee: 50000,
      paid_amount: paidAmount,
      pending_amount: 50000 - paidAmount,
      status: s.enrollment_number === 'AIML2024001' ? 'paid' : 'pending'
    }]);

    const totalDays = 120;
    const batch = [];
    for (let i = 0; i < totalDays; i++) {
      const d = new Date();
      d.setDate(d.getDate() - (totalDays - i));
      batch.push({
        student_id: studentId,
        class_id: classMap[s.className],
        attendance_date: d.toISOString().slice(0, 10),
        status: i < s.present ? 'present' : 'absent'
      });
    }
    for (let i = 0; i < batch.length; i += 20) {
      await from('college_attendance').insert(batch.slice(i, i + 20));
    }

    const deptSubjects = subjects.filter((sub) => sub.department_id === s.dept).slice(0, 3);
    for (const sub of deptSubjects) {
      await from('college_marks').insert([{
        student_id: studentId,
        subject_id: sub.id,
        class_id: classMap[s.className],
        marks_obtained: 14 + Math.floor(Math.random() * 6),
        max_marks: 20,
        exam_type: 'mid_sem'
      }]);
    }
    console.log(`Student: ${s.enrollment_number} / ${s.password}`);
  }

  console.log('Seed complete.');
}

seed().catch((e) => {
  console.error(e);
  process.exit(1);
});
