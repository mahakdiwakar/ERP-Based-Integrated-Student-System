-- College ERP Schema (AIML + Cyber Security)
-- Tables map to: departments, subjects, students, teachers, attendance, marks, fees

CREATE TABLE IF NOT EXISTS college_departments (
  id SERIAL PRIMARY KEY,
  code TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS college_classes (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  department_id INTEGER NOT NULL REFERENCES college_departments(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS college_subjects (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  department_id INTEGER NOT NULL REFERENCES college_departments(id) ON DELETE CASCADE,
  max_marks NUMERIC(5,2) DEFAULT 20,
  UNIQUE(name, department_id)
);

CREATE TABLE IF NOT EXISTS college_students (
  id SERIAL PRIMARY KEY,
  enrollment_number TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  password_plain TEXT NOT NULL,
  name TEXT NOT NULL,
  department_id INTEGER NOT NULL REFERENCES college_departments(id),
  class_id INTEGER NOT NULL REFERENCES college_classes(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS college_teachers (
  id SERIAL PRIMARY KEY,
  teacher_id TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  password_plain TEXT NOT NULL,
  name TEXT NOT NULL,
  department_id INTEGER NOT NULL REFERENCES college_departments(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS college_admins (
  id SERIAL PRIMARY KEY,
  username TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  password_plain TEXT NOT NULL,
  name TEXT DEFAULT 'Administrator',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS college_teacher_classes (
  id SERIAL PRIMARY KEY,
  teacher_id INTEGER NOT NULL REFERENCES college_teachers(id) ON DELETE CASCADE,
  class_id INTEGER NOT NULL REFERENCES college_classes(id) ON DELETE CASCADE,
  UNIQUE(teacher_id, class_id)
);

CREATE TABLE IF NOT EXISTS college_attendance (
  id SERIAL PRIMARY KEY,
  student_id INTEGER NOT NULL REFERENCES college_students(id) ON DELETE CASCADE,
  class_id INTEGER NOT NULL REFERENCES college_classes(id) ON DELETE CASCADE,
  attendance_date DATE NOT NULL DEFAULT CURRENT_DATE,
  status TEXT NOT NULL CHECK (status IN ('present', 'absent')),
  marked_by INTEGER REFERENCES college_teachers(id),
  UNIQUE(student_id, attendance_date)
);

CREATE TABLE IF NOT EXISTS college_marks (
  id SERIAL PRIMARY KEY,
  student_id INTEGER NOT NULL REFERENCES college_students(id) ON DELETE CASCADE,
  subject_id INTEGER NOT NULL REFERENCES college_subjects(id) ON DELETE CASCADE,
  class_id INTEGER NOT NULL REFERENCES college_classes(id) ON DELETE CASCADE,
  marks_obtained NUMERIC(5,2) NOT NULL,
  max_marks NUMERIC(5,2) DEFAULT 20,
  exam_type TEXT DEFAULT 'mid_sem',
  updated_by INTEGER REFERENCES college_teachers(id),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(student_id, subject_id, exam_type)
);

CREATE TABLE IF NOT EXISTS college_fees (
  id SERIAL PRIMARY KEY,
  student_id INTEGER UNIQUE NOT NULL REFERENCES college_students(id) ON DELETE CASCADE,
  total_fees NUMERIC(10,2) NOT NULL DEFAULT 50000,
  paid_amount NUMERIC(10,2) NOT NULL DEFAULT 0,
  due_date DATE DEFAULT (CURRENT_DATE + INTERVAL '30 days'),
  status TEXT DEFAULT 'pending' CHECK (status IN ('paid', 'pending', 'overdue')),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seed departments
INSERT INTO college_departments (code, name) VALUES
  ('AIML', 'AIML'),
  ('CYBER', 'CYBER SECURITY')
ON CONFLICT (code) DO NOTHING;

-- Seed classes
INSERT INTO college_classes (name, department_id)
SELECT v.name, d.id
FROM (VALUES
  ('AIML-A', 'AIML'),
  ('AIML-B', 'AIML'),
  ('AIML-C', 'AIML'),
  ('CYBER-A', 'CYBER'),
  ('CYBER-B', 'CYBER')
) AS v(name, dept_code)
JOIN college_departments d ON d.code = v.dept_code
ON CONFLICT (name) DO NOTHING;

-- Seed subjects
INSERT INTO college_subjects (name, department_id, max_marks)
SELECT v.name, d.id, 20
FROM (VALUES
  ('Python', 'AIML'),
  ('Machine Learning', 'AIML'),
  ('Data Structures', 'AIML'),
  ('Cyber Security', 'CYBER'),
  ('Network Security', 'CYBER'),
  ('Ethical Hacking', 'CYBER')
) AS v(name, dept_code)
JOIN college_departments d ON d.code = v.dept_code
ON CONFLICT (name, department_id) DO NOTHING;
