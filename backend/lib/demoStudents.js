import bcrypt from 'bcryptjs';

export const DEMO_PASSWORD = 'student123';
export const STUDENTS_PER_CLASS = 50;
export const TOTAL_DEMO_STUDENTS = 300;
export const DEMO_META_KEY = 'demo_students_300';

export const CLASS_PLAN = [
  { className: 'AIML-A', deptCode: 'AIML', prefix: 'AIML', startNum: 1 },
  { className: 'AIML-B', deptCode: 'AIML', prefix: 'AIML', startNum: 51 },
  { className: 'AIML-C', deptCode: 'AIML', prefix: 'AIML', startNum: 101 },
  { className: 'CYBER-A', deptCode: 'CYBER', prefix: 'CYBER', startNum: 1 },
  { className: 'CYBER-B', deptCode: 'CYBER', prefix: 'CYBER', startNum: 51 },
  { className: 'CYBER-C', deptCode: 'CYBER', prefix: 'CYBER', startNum: 101 }
];

const FIRST_NAMES = [
  'Aarav', 'Vihaan', 'Aditya', 'Arjun', 'Reyansh', 'Sai', 'Arnav', 'Ayaan', 'Krishna', 'Ishaan',
  'Shaurya', 'Atharv', 'Advik', 'Pranav', 'Dhruv', 'Kabir', 'Ritvik', 'Aarush', 'Veer', 'Rohan',
  'Vivaan', 'Kian', 'Darsh', 'Yash', 'Dev', 'Aryan', 'Rudra', 'Om', 'Parth', 'Harsh',
  'Ananya', 'Diya', 'Aadhya', 'Pari', 'Anika', 'Navya', 'Myra', 'Ira', 'Avni', 'Riya',
  'Shanaya', 'Siya', 'Priya', 'Kavya', 'Ishita', 'Kiara', 'Nisha', 'Meera', 'Tanvi', 'Pooja',
  'Neha', 'Lakshmi', 'Sneha', 'Divya', 'Swati', 'Anjali', 'Shruti', 'Deepika', 'Kritika', 'Sakshi'
];

const LAST_NAMES = [
  'Sharma', 'Verma', 'Patel', 'Singh', 'Kumar', 'Reddy', 'Nair', 'Iyer', 'Gupta', 'Joshi',
  'Mehta', 'Shah', 'Rao', 'Menon', 'Pillai', 'Choudhary', 'Agarwal', 'Banerjee', 'Das', 'Ghosh',
  'Kulkarni', 'Desai', 'Hegde', 'Malhotra', 'Kapoor', 'Saxena', 'Trivedi', 'Mishra', 'Pandey', 'Sinha',
  'Bhat', 'Shetty', 'Gowda', 'Chopra', 'Bose', 'Mukherjee', 'Thakur', 'Yadav', 'Jain', 'Srivastava'
];

export function makeStudentName(index) {
  const last = LAST_NAMES[index % LAST_NAMES.length];
  const first = FIRST_NAMES[Math.floor(index / LAST_NAMES.length) % FIRST_NAMES.length];
  return `${first} ${last}`;
}

export function makeEnrollment(prefix, seq) {
  return `${prefix}2024${String(seq).padStart(3, '0')}`;
}

/** @returns {Array<{name, enrollment_number, password, department_code, class_name, email}>} */
export function generateDemoStudentRecords() {
  const records = [];
  let idx = 0;
  for (const plan of CLASS_PLAN) {
    for (let i = 0; i < STUDENTS_PER_CLASS; i++) {
      const seq = plan.startNum + i;
      const enrollment_number = makeEnrollment(plan.prefix, seq);
      records.push({
        name: makeStudentName(idx),
        enrollment_number,
        password: DEMO_PASSWORD,
        department_code: plan.deptCode,
        class_name: plan.className,
        email: `${enrollment_number.toLowerCase()}@snapclass.edu`
      });
      idx += 1;
    }
  }
  return records;
}

export function hashDemoPassword(password = DEMO_PASSWORD) {
  return bcrypt.hashSync(password, 10);
}

export async function isBulkDemoGenerated(from) {
  const { data } = await from('college_system_meta')
    .select('value')
    .eq('key', DEMO_META_KEY)
    .maybeSingle();
  if (data?.value === 'true') return true;

  const { data: markers } = await from('college_students')
    .select('enrollment_number')
    .in('enrollment_number', ['AIML2024150', 'CYBER2024150']);
  return (markers?.length || 0) >= 2;
}

export async function markBulkDemoGenerated(from) {
  const { data: existing } = await from('college_system_meta')
    .select('id')
    .eq('key', DEMO_META_KEY)
    .maybeSingle();

  if (existing) {
    await from('college_system_meta').update({ value: 'true' }).eq('key', DEMO_META_KEY);
  } else {
    await from('college_system_meta').insert([{ key: DEMO_META_KEY, value: 'true' }]);
  }
}

/**
 * Bulk insert 300 demo students + fee records. Skips duplicate enrollments.
 * @returns {{ created: number, skipped: number, samples: object[] }}
 */
export async function bulkInsertDemoStudents(from, hashPassword) {
  const already = await isBulkDemoGenerated(from);
  if (already) {
    const err = new Error('Demo students already generated. Bulk generation can only run once.');
    err.status = 409;
    throw err;
  }

  const { data: depts } = await from('college_departments').select('id, code');
  const deptMap = Object.fromEntries((depts || []).map((d) => [d.code, d.id]));

  const { data: classes } = await from('college_classes').select('id, name');
  const classMap = Object.fromEntries((classes || []).map((c) => [c.name, c.id]));

  for (const plan of CLASS_PLAN) {
    if (!classMap[plan.className]) {
      const err = new Error(`Class ${plan.className} not found. Run migration 003 first.`);
      err.status = 400;
      throw err;
    }
  }

  const records = generateDemoStudentRecords();
  const passwordHash = hashPassword(DEMO_PASSWORD);
  let created = 0;
  let skipped = 0;
  const samples = [];
  const BATCH = 25;

  for (let i = 0; i < records.length; i += BATCH) {
    const chunk = records.slice(i, i + BATCH);
    const toInsert = [];

    for (const r of chunk) {
      const { data: ex } = await from('college_students')
        .select('id')
        .eq('enrollment_number', r.enrollment_number)
        .maybeSingle();
      if (ex) {
        skipped += 1;
        continue;
      }

      toInsert.push({
        enrollment_number: r.enrollment_number,
        password_hash: passwordHash,
        password_plain: r.password,
        name: r.name,
        email: r.email,
        department_id: deptMap[r.department_code],
        class_id: classMap[r.class_name]
      });
    }

    if (!toInsert.length) continue;

    const { data: inserted, error } = await from('college_students').insert(toInsert).select('id, enrollment_number, name, email');
    if (error) {
      const err = new Error(error.message || 'Bulk insert failed');
      err.status = 400;
      throw err;
    }

    const feeRows = inserted.map((s) => ({
      student_id: s.id,
      total_fee: 50000,
      paid_amount: 0,
      pending_amount: 50000,
      status: 'pending'
    }));

    await from('college_fees').insert(feeRows);

    created += inserted.length;
    if (samples.length < 6) {
      for (const s of inserted) {
        const rec = chunk.find((c) => c.enrollment_number === s.enrollment_number);
        if (rec && samples.length < 6) {
          samples.push({
            name: s.name,
            enrollment_number: s.enrollment_number,
            password: DEMO_PASSWORD,
            department: rec.department_code,
            class_name: rec.class_name,
            email: s.email
          });
        }
      }
    }
  }

  const expected = TOTAL_DEMO_STUDENTS - skipped;
  if (created < expected) {
    const err = new Error(`Only ${created} students created (${skipped} skipped). Expected ${expected}.`);
    err.status = 500;
    throw err;
  }

  await markBulkDemoGenerated(from);

  return { created, skipped, total: TOTAL_DEMO_STUDENTS, samples };
}
