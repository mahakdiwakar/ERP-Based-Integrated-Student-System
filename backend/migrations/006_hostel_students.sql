-- Migration to create the hostel_students table for Hostel Management Portal

CREATE TABLE IF NOT EXISTS hostel_students (
  id SERIAL PRIMARY KEY,
  student_name TEXT NOT NULL,
  enrollment_no TEXT NOT NULL UNIQUE,
  department TEXT,
  class_name TEXT,
  hostel_name TEXT,
  room_number TEXT,
  bed_number TEXT,
  phone TEXT,
  allocation_status TEXT DEFAULT 'allocated',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seed some initial sample records for testing CRUD and dashboard
INSERT INTO hostel_students (student_name, enrollment_no, department, class_name, hostel_name, room_number, bed_number, phone, allocation_status)
VALUES 
  ('Arjun Mehta', 'AIML2024001', 'AIML', 'AIML-A', 'Luxury Male Residency', '101', '1', '9876543210', 'allocated'),
  ('Sneha Reddy', 'AIML2024002', 'AIML', 'AIML-B', 'Golden Female Suites', '102', '2', '9876543211', 'allocated'),
  ('Rahul Verma', 'CYB2024001', 'CYBER', 'CYBER-A', 'Luxury Male Residency', '103', '1', '9876543212', 'waiting')
ON CONFLICT (enrollment_no) DO NOTHING;
