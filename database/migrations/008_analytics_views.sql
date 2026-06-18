-- 008_analytics_views.sql
-- Drop views if they exist to allow clean migration runs
DROP VIEW IF EXISTS college_student_details_view CASCADE;
DROP VIEW IF EXISTS college_attendance_enriched CASCADE;
DROP VIEW IF EXISTS college_marks_enriched CASCADE;
DROP VIEW IF EXISTS hostel_allocations_enriched CASCADE;
DROP VIEW IF EXISTS college_student_analytics CASCADE;
DROP VIEW IF EXISTS college_dept_attendance_summary CASCADE;
DROP VIEW IF EXISTS college_class_attendance_summary CASCADE;
DROP VIEW IF EXISTS college_monthly_attendance_summary CASCADE;
DROP VIEW IF EXISTS college_fee_summary_metrics CASCADE;
DROP VIEW IF EXISTS college_dept_fee_summary CASCADE;
DROP VIEW IF EXISTS college_fee_collection_trend CASCADE;
DROP VIEW IF EXISTS hostel_summary_metrics CASCADE;
DROP VIEW IF EXISTS hostel_occupancy_stats CASCADE;

-- 1. Student Details View (joins department and class)
CREATE OR REPLACE VIEW college_student_details_view AS
SELECT 
  s.id,
  s.name,
  s.enrollment_number,
  s.class_id,
  s.department_id,
  d.name AS department_name,
  d.code AS department_code,
  c.name AS class_name
FROM college_students s
LEFT JOIN college_departments d ON s.department_id = d.id
LEFT JOIN college_classes c ON s.class_id = c.id;

-- 2. Attendance Enriched View (includes teacher name)
CREATE OR REPLACE VIEW college_attendance_enriched AS
SELECT 
  a.id,
  a.student_id,
  a.class_id,
  a.attendance_date,
  a.status,
  a.marked_by,
  t.name AS teacher_name
FROM college_attendance a
LEFT JOIN college_teachers t ON a.marked_by = t.id;

-- 3. Marks Enriched View (includes subject name)
CREATE OR REPLACE VIEW college_marks_enriched AS
SELECT 
  m.id,
  m.student_id,
  m.subject_id,
  m.class_id,
  m.marks_obtained,
  m.max_marks,
  m.exam_type,
  s.name AS subject_name
FROM college_marks m
LEFT JOIN college_subjects s ON m.subject_id = s.id;

-- 4. Hostel Allocations Enriched View (student name, dept, hostel and room details)
CREATE OR REPLACE VIEW hostel_allocations_enriched AS
SELECT
  a.id,
  a.student_id,
  a.hostel_id,
  a.room_id,
  s.name AS student_name,
  s.enrollment_number AS enrollment_no,
  d.name AS department,
  h.hostel_name,
  r.room_number,
  r.floor,
  a.bed_number,
  a.status,
  a.allocation_date,
  a.created_at
FROM hostel_allocations a
LEFT JOIN college_students s ON a.student_id = s.id
LEFT JOIN college_departments d ON s.department_id = d.id
LEFT JOIN hostels h ON a.hostel_id = h.id
LEFT JOIN rooms r ON a.room_id = r.id;

-- 5. Student Analytics View (aggregated attendance & marks)
CREATE OR REPLACE VIEW college_student_analytics AS
SELECT 
  s.id,
  s.name,
  s.enrollment_number AS enrollment,
  d.name AS department,
  c.name AS class,
  COALESCE(ROUND((COUNT(a.id) FILTER (WHERE a.status = 'present')::numeric / NULLIF(COUNT(a.id), 0)) * 100), 0) AS attendance_pct,
  COALESCE(ROUND(AVG((m.marks_obtained / m.max_marks) * 100)::numeric, 1), 0.0) AS avg_marks,
  s.class_id,
  s.department_id
FROM college_students s
LEFT JOIN college_departments d ON s.department_id = d.id
LEFT JOIN college_classes c ON s.class_id = c.id
LEFT JOIN college_attendance a ON s.id = a.student_id
LEFT JOIN college_marks m ON s.id = m.student_id AND m.exam_type = 'mid_sem'
GROUP BY s.id, s.name, s.enrollment_number, d.name, c.name, s.class_id, s.department_id;

-- 6. Department Attendance Summary View
CREATE OR REPLACE VIEW college_dept_attendance_summary AS
SELECT 
  d.name AS department,
  COALESCE(SUM(CASE WHEN a.status = 'present' THEN 1 ELSE 0 END), 0)::integer AS present,
  COUNT(a.id)::integer AS total
FROM college_departments d
LEFT JOIN college_students s ON s.department_id = d.id
LEFT JOIN college_attendance a ON a.student_id = s.id
GROUP BY d.id, d.name;

-- 7. Class Attendance Summary View
CREATE OR REPLACE VIEW college_class_attendance_summary AS
SELECT 
  c.name AS class,
  COALESCE(SUM(CASE WHEN a.status = 'present' THEN 1 ELSE 0 END), 0)::integer AS present,
  COUNT(a.id)::integer AS total
FROM college_classes c
LEFT JOIN college_students s ON s.class_id = c.id
LEFT JOIN college_attendance a ON a.student_id = s.id
GROUP BY c.id, c.name;

-- 8. Monthly Attendance Summary View
CREATE OR REPLACE VIEW college_monthly_attendance_summary AS
SELECT 
  TO_CHAR(attendance_date, 'YYYY-MM') AS month,
  COALESCE(SUM(CASE WHEN status = 'present' THEN 1 ELSE 0 END), 0)::integer AS present,
  COUNT(id)::integer AS total
FROM college_attendance
GROUP BY TO_CHAR(attendance_date, 'YYYY-MM');

-- 9. Fee Summary Metrics View
CREATE OR REPLACE VIEW college_fee_summary_metrics AS
SELECT 
  COALESCE(SUM(paid_amount), 0)::numeric AS total_collected,
  COALESCE(SUM(pending_amount), 0)::numeric AS pending_fees,
  COUNT(id) FILTER (WHERE status = 'paid')::integer AS paid_students,
  COUNT(id) FILTER (WHERE status != 'paid')::integer AS unpaid_students
FROM college_fees;

-- 10. Department Fee Summary View
CREATE OR REPLACE VIEW college_dept_fee_summary AS
SELECT 
  d.name AS department,
  COALESCE(SUM(f.paid_amount), 0)::numeric AS collected,
  COALESCE(SUM(f.pending_amount), 0)::numeric AS pending
FROM college_departments d
LEFT JOIN college_students s ON s.department_id = d.id
LEFT JOIN college_fees f ON f.student_id = s.id
GROUP BY d.id, d.name;

-- 11. Fee Collection Trend View
CREATE OR REPLACE VIEW college_fee_collection_trend AS
SELECT 
  COALESCE(TO_CHAR(updated_at, 'YYYY-MM-DD'), TO_CHAR(created_at, 'YYYY-MM-DD')) AS date,
  SUM(paid_amount)::numeric AS amount
FROM college_fees
WHERE paid_amount > 0
GROUP BY COALESCE(TO_CHAR(updated_at, 'YYYY-MM-DD'), TO_CHAR(created_at, 'YYYY-MM-DD'));

-- 12. Hostel Summary Metrics View
CREATE OR REPLACE VIEW hostel_summary_metrics AS
SELECT
  (SELECT COUNT(*)::integer FROM hostels) AS total_hostels,
  (SELECT COUNT(*)::integer FROM rooms) AS total_rooms,
  COALESCE(SUM(capacity), 0)::integer AS total_capacity,
  COALESCE(SUM(occupied_beds), 0)::integer AS occupied_beds,
  (SELECT COUNT(*)::integer FROM hostel_allocations WHERE status = 'Waiting') AS waiting_list
FROM rooms;

-- 13. Hostel Occupancy Stats View
CREATE OR REPLACE VIEW hostel_occupancy_stats AS
SELECT 
  h.hostel_name AS name,
  COALESCE(SUM(r.capacity), 0)::integer AS capacity,
  COALESCE(SUM(r.occupied_beds), 0)::integer AS occupied
FROM hostels h
LEFT JOIN rooms r ON r.hostel_id = h.id
GROUP BY h.id, h.hostel_name;
