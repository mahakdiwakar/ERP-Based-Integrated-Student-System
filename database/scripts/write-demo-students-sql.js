/**
 * Generates backend/migrations/003_bulk_demo_students.sql
 * Run: node backend/scripts/write-demo-students-sql.js
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import {
  generateDemoStudentRecords,
  hashDemoPassword,
  DEMO_PASSWORD
} from '../lib/demoStudents.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const outPath = path.join(__dirname, '../migrations/003_bulk_demo_students.sql');

const hash = hashDemoPassword();
const records = generateDemoStudentRecords();

const lines = [
  '-- Auto-generated bulk demo students (300 accounts)',
  '-- Password for all: student123',
  `-- Bcrypt hash: ${hash}`,
  '-- Run 003_bulk_students_setup.sql first',
  '',
  'BEGIN;',
  ''
];

const sample = records.slice(0, 6);
lines.push('-- Sample rows (one per class):');
for (const r of sample) {
  lines.push(`-- ${r.enrollment_number} | ${r.name} | ${r.department_code} | ${r.class_name} | ${r.email}`);
}
lines.push('');

for (const r of records) {
  const deptSubquery = `(SELECT id FROM college_departments WHERE code = '${r.department_code}')`;
  const classSubquery = `(SELECT id FROM college_classes WHERE name = '${r.class_name}')`;
  lines.push(`INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)`);
  lines.push(`VALUES ('${r.enrollment_number}', '${hash}', '${DEMO_PASSWORD}', '${r.name.replace(/'/g, "''")}', '${r.email}', ${deptSubquery}, ${classSubquery})`);
  lines.push(`ON CONFLICT (enrollment_number) DO NOTHING;`);
  lines.push('');
}

lines.push(`INSERT INTO college_system_meta (key, value) VALUES ('demo_students_300', 'true')`);
lines.push(`ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;`);
lines.push('');
lines.push(`-- Fee records for newly inserted students`);
lines.push(`INSERT INTO college_fees (student_id, total_fee, paid_amount, pending_amount, status)`);
lines.push(`SELECT s.id, 50000, 0, 50000, 'pending'`);
lines.push(`FROM college_students s`);
lines.push(`WHERE s.enrollment_number LIKE 'AIML2024%' OR s.enrollment_number LIKE 'CYBER2024%'`);
lines.push(`ON CONFLICT (student_id) DO NOTHING;`);
lines.push('');
lines.push('COMMIT;');
lines.push('');

fs.writeFileSync(outPath, lines.join('\n'), 'utf8');
console.log(`Wrote ${records.length} student INSERTs to ${outPath}`);
