-- Bulk demo student generation setup
-- 6 classes × 50 students = 300 total

-- Add CYBER-C class
INSERT INTO college_classes (name, department_id)
SELECT 'CYBER-C', d.id
FROM college_departments d
WHERE d.code = 'CYBER'
ON CONFLICT (name) DO NOTHING;

-- Optional email column for student accounts
ALTER TABLE college_students
  ADD COLUMN IF NOT EXISTS email TEXT;

CREATE UNIQUE INDEX IF NOT EXISTS college_students_email_idx
  ON college_students (email)
  WHERE email IS NOT NULL;

-- System metadata (prevents duplicate bulk generation)
CREATE TABLE IF NOT EXISTS college_system_meta (
  id SERIAL PRIMARY KEY,
  key TEXT UNIQUE NOT NULL,
  value TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Readable view mapping enrollment to department/class labels
CREATE OR REPLACE VIEW college_students_view AS
SELECT
  s.id,
  s.name,
  s.enrollment_number AS enrollment_no,
  s.password_hash,
  d.code AS department,
  c.name AS class_name,
  s.email,
  s.created_at
FROM college_students s
JOIN college_departments d ON d.id = s.department_id
JOIN college_classes c ON c.id = s.class_id;
