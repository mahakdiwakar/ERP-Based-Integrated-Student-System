-- 007_dashboard_indexes.sql
-- Create database indexes on foreign keys, lookups, dates, and timestamps to speed up queries and joins.

-- Indexes for college_attendance
CREATE INDEX IF NOT EXISTS idx_college_attendance_student_id ON college_attendance(student_id);
CREATE INDEX IF NOT EXISTS idx_college_attendance_class_id ON college_attendance(class_id);
CREATE INDEX IF NOT EXISTS idx_college_attendance_date ON college_attendance(attendance_date);
CREATE INDEX IF NOT EXISTS idx_college_attendance_created_at ON college_attendance(created_at);

-- Indexes for college_marks
CREATE INDEX IF NOT EXISTS idx_college_marks_student_id ON college_marks(student_id);
CREATE INDEX IF NOT EXISTS idx_college_marks_class_id ON college_marks(class_id);
CREATE INDEX IF NOT EXISTS idx_college_marks_subject_id ON college_marks(subject_id);
CREATE INDEX IF NOT EXISTS idx_college_marks_updated_at ON college_marks(updated_at);

-- Indexes for college_students
CREATE INDEX IF NOT EXISTS idx_college_students_class_id ON college_students(class_id);
CREATE INDEX IF NOT EXISTS idx_college_students_department_id ON college_students(department_id);
CREATE INDEX IF NOT EXISTS idx_college_students_created_at ON college_students(created_at);

-- Indexes for college_teachers
CREATE INDEX IF NOT EXISTS idx_college_teachers_department_id ON college_teachers(department_id);

-- Indexes for college_teacher_classes
CREATE INDEX IF NOT EXISTS idx_college_teacher_classes_teacher_id ON college_teacher_classes(teacher_id);
CREATE INDEX IF NOT EXISTS idx_college_teacher_classes_class_id ON college_teacher_classes(class_id);

-- Indexes for hostel_allocations
CREATE INDEX IF NOT EXISTS idx_hostel_allocations_student_id ON hostel_allocations(student_id);
CREATE INDEX IF NOT EXISTS idx_hostel_allocations_hostel_id ON hostel_allocations(hostel_id);
CREATE INDEX IF NOT EXISTS idx_hostel_allocations_room_id ON hostel_allocations(room_id);
CREATE INDEX IF NOT EXISTS idx_hostel_allocations_created_at ON hostel_allocations(created_at);

-- Indexes for rooms
CREATE INDEX IF NOT EXISTS idx_rooms_hostel_id ON rooms(hostel_id);

-- Indexes for hostel_students
CREATE INDEX IF NOT EXISTS idx_hostel_students_created_at ON hostel_students(created_at);

-- Indexes for fees
CREATE INDEX IF NOT EXISTS idx_college_fees_created_at ON college_fees(created_at);
CREATE INDEX IF NOT EXISTS idx_college_hostel_fees_updated_at ON college_hostel_fees(updated_at);
