-- Auto-generated bulk demo students (300 accounts)
-- Password for all: student123
-- Bcrypt hash: $2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK
-- Run 003_bulk_students_setup.sql first

BEGIN;

-- Sample rows (one per class):
-- AIML2024001 | Aarav Sharma | AIML | AIML-A | aiml2024001@snapclass.edu
-- AIML2024002 | Aarav Verma | AIML | AIML-A | aiml2024002@snapclass.edu
-- AIML2024003 | Aarav Patel | AIML | AIML-A | aiml2024003@snapclass.edu
-- AIML2024004 | Aarav Singh | AIML | AIML-A | aiml2024004@snapclass.edu
-- AIML2024005 | Aarav Kumar | AIML | AIML-A | aiml2024005@snapclass.edu
-- AIML2024006 | Aarav Reddy | AIML | AIML-A | aiml2024006@snapclass.edu

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024001', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Sharma', 'aiml2024001@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024002', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Verma', 'aiml2024002@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024003', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Patel', 'aiml2024003@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024004', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Singh', 'aiml2024004@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024005', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Kumar', 'aiml2024005@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024006', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Reddy', 'aiml2024006@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024007', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Nair', 'aiml2024007@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024008', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Iyer', 'aiml2024008@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024009', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Gupta', 'aiml2024009@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024010', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Joshi', 'aiml2024010@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024011', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Mehta', 'aiml2024011@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024012', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Shah', 'aiml2024012@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024013', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Rao', 'aiml2024013@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024014', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Menon', 'aiml2024014@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024015', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Pillai', 'aiml2024015@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024016', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Choudhary', 'aiml2024016@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024017', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Agarwal', 'aiml2024017@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024018', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Banerjee', 'aiml2024018@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024019', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Das', 'aiml2024019@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024020', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Ghosh', 'aiml2024020@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024021', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Kulkarni', 'aiml2024021@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024022', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Desai', 'aiml2024022@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024023', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Hegde', 'aiml2024023@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024024', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Malhotra', 'aiml2024024@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024025', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Kapoor', 'aiml2024025@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024026', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Saxena', 'aiml2024026@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024027', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Trivedi', 'aiml2024027@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024028', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Mishra', 'aiml2024028@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024029', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Pandey', 'aiml2024029@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024030', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Sinha', 'aiml2024030@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024031', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Bhat', 'aiml2024031@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024032', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Shetty', 'aiml2024032@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024033', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Gowda', 'aiml2024033@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024034', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Chopra', 'aiml2024034@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024035', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Bose', 'aiml2024035@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024036', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Mukherjee', 'aiml2024036@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024037', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Thakur', 'aiml2024037@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024038', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Yadav', 'aiml2024038@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024039', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Jain', 'aiml2024039@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024040', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aarav Srivastava', 'aiml2024040@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024041', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Sharma', 'aiml2024041@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024042', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Verma', 'aiml2024042@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024043', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Patel', 'aiml2024043@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024044', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Singh', 'aiml2024044@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024045', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Kumar', 'aiml2024045@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024046', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Reddy', 'aiml2024046@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024047', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Nair', 'aiml2024047@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024048', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Iyer', 'aiml2024048@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024049', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Gupta', 'aiml2024049@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024050', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Joshi', 'aiml2024050@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024051', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Mehta', 'aiml2024051@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024052', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Shah', 'aiml2024052@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024053', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Rao', 'aiml2024053@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024054', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Menon', 'aiml2024054@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024055', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Pillai', 'aiml2024055@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024056', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Choudhary', 'aiml2024056@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024057', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Agarwal', 'aiml2024057@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024058', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Banerjee', 'aiml2024058@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024059', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Das', 'aiml2024059@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024060', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Ghosh', 'aiml2024060@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024061', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Kulkarni', 'aiml2024061@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024062', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Desai', 'aiml2024062@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024063', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Hegde', 'aiml2024063@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024064', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Malhotra', 'aiml2024064@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024065', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Kapoor', 'aiml2024065@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024066', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Saxena', 'aiml2024066@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024067', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Trivedi', 'aiml2024067@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024068', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Mishra', 'aiml2024068@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024069', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Pandey', 'aiml2024069@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024070', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Sinha', 'aiml2024070@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024071', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Bhat', 'aiml2024071@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024072', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Shetty', 'aiml2024072@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024073', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Gowda', 'aiml2024073@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024074', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Chopra', 'aiml2024074@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024075', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Bose', 'aiml2024075@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024076', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Mukherjee', 'aiml2024076@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024077', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Thakur', 'aiml2024077@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024078', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Yadav', 'aiml2024078@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024079', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Jain', 'aiml2024079@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024080', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Vihaan Srivastava', 'aiml2024080@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024081', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Sharma', 'aiml2024081@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024082', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Verma', 'aiml2024082@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024083', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Patel', 'aiml2024083@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024084', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Singh', 'aiml2024084@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024085', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Kumar', 'aiml2024085@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024086', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Reddy', 'aiml2024086@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024087', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Nair', 'aiml2024087@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024088', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Iyer', 'aiml2024088@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024089', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Gupta', 'aiml2024089@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024090', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Joshi', 'aiml2024090@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024091', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Mehta', 'aiml2024091@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024092', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Shah', 'aiml2024092@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024093', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Rao', 'aiml2024093@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024094', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Menon', 'aiml2024094@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024095', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Pillai', 'aiml2024095@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024096', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Choudhary', 'aiml2024096@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024097', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Agarwal', 'aiml2024097@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024098', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Banerjee', 'aiml2024098@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024099', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Das', 'aiml2024099@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024100', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Ghosh', 'aiml2024100@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024101', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Kulkarni', 'aiml2024101@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024102', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Desai', 'aiml2024102@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024103', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Hegde', 'aiml2024103@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024104', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Malhotra', 'aiml2024104@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024105', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Kapoor', 'aiml2024105@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024106', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Saxena', 'aiml2024106@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024107', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Trivedi', 'aiml2024107@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024108', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Mishra', 'aiml2024108@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024109', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Pandey', 'aiml2024109@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024110', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Sinha', 'aiml2024110@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024111', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Bhat', 'aiml2024111@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024112', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Shetty', 'aiml2024112@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024113', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Gowda', 'aiml2024113@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024114', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Chopra', 'aiml2024114@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024115', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Bose', 'aiml2024115@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024116', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Mukherjee', 'aiml2024116@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024117', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Thakur', 'aiml2024117@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024118', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Yadav', 'aiml2024118@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024119', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Jain', 'aiml2024119@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024120', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Aditya Srivastava', 'aiml2024120@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024121', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Sharma', 'aiml2024121@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024122', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Verma', 'aiml2024122@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024123', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Patel', 'aiml2024123@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024124', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Singh', 'aiml2024124@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024125', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Kumar', 'aiml2024125@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024126', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Reddy', 'aiml2024126@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024127', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Nair', 'aiml2024127@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024128', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Iyer', 'aiml2024128@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024129', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Gupta', 'aiml2024129@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024130', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Joshi', 'aiml2024130@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024131', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Mehta', 'aiml2024131@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024132', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Shah', 'aiml2024132@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024133', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Rao', 'aiml2024133@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024134', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Menon', 'aiml2024134@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024135', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Pillai', 'aiml2024135@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024136', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Choudhary', 'aiml2024136@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024137', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Agarwal', 'aiml2024137@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024138', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Banerjee', 'aiml2024138@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024139', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Das', 'aiml2024139@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024140', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Ghosh', 'aiml2024140@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024141', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Kulkarni', 'aiml2024141@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024142', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Desai', 'aiml2024142@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024143', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Hegde', 'aiml2024143@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024144', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Malhotra', 'aiml2024144@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024145', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Kapoor', 'aiml2024145@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024146', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Saxena', 'aiml2024146@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024147', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Trivedi', 'aiml2024147@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024148', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Mishra', 'aiml2024148@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024149', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Pandey', 'aiml2024149@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024150', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Sinha', 'aiml2024150@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024001', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Bhat', 'cyber2024001@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024002', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Shetty', 'cyber2024002@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024003', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Gowda', 'cyber2024003@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024004', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Chopra', 'cyber2024004@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024005', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Bose', 'cyber2024005@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024006', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Mukherjee', 'cyber2024006@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024007', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Thakur', 'cyber2024007@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024008', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Yadav', 'cyber2024008@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024009', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Jain', 'cyber2024009@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024010', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arjun Srivastava', 'cyber2024010@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024011', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Sharma', 'cyber2024011@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024012', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Verma', 'cyber2024012@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024013', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Patel', 'cyber2024013@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024014', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Singh', 'cyber2024014@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024015', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Kumar', 'cyber2024015@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024016', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Reddy', 'cyber2024016@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024017', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Nair', 'cyber2024017@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024018', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Iyer', 'cyber2024018@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024019', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Gupta', 'cyber2024019@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024020', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Joshi', 'cyber2024020@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024021', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Mehta', 'cyber2024021@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024022', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Shah', 'cyber2024022@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024023', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Rao', 'cyber2024023@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024024', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Menon', 'cyber2024024@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024025', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Pillai', 'cyber2024025@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024026', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Choudhary', 'cyber2024026@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024027', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Agarwal', 'cyber2024027@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024028', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Banerjee', 'cyber2024028@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024029', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Das', 'cyber2024029@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024030', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Ghosh', 'cyber2024030@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024031', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Kulkarni', 'cyber2024031@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024032', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Desai', 'cyber2024032@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024033', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Hegde', 'cyber2024033@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024034', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Malhotra', 'cyber2024034@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024035', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Kapoor', 'cyber2024035@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024036', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Saxena', 'cyber2024036@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024037', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Trivedi', 'cyber2024037@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024038', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Mishra', 'cyber2024038@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024039', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Pandey', 'cyber2024039@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024040', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Sinha', 'cyber2024040@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024041', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Bhat', 'cyber2024041@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024042', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Shetty', 'cyber2024042@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024043', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Gowda', 'cyber2024043@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024044', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Chopra', 'cyber2024044@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024045', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Bose', 'cyber2024045@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024046', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Mukherjee', 'cyber2024046@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024047', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Thakur', 'cyber2024047@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024048', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Yadav', 'cyber2024048@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024049', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Jain', 'cyber2024049@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024050', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Reyansh Srivastava', 'cyber2024050@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024051', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Sharma', 'cyber2024051@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024052', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Verma', 'cyber2024052@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024053', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Patel', 'cyber2024053@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024054', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Singh', 'cyber2024054@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024055', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Kumar', 'cyber2024055@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024056', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Reddy', 'cyber2024056@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024057', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Nair', 'cyber2024057@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024058', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Iyer', 'cyber2024058@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024059', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Gupta', 'cyber2024059@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024060', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Joshi', 'cyber2024060@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024061', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Mehta', 'cyber2024061@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024062', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Shah', 'cyber2024062@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024063', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Rao', 'cyber2024063@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024064', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Menon', 'cyber2024064@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024065', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Pillai', 'cyber2024065@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024066', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Choudhary', 'cyber2024066@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024067', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Agarwal', 'cyber2024067@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024068', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Banerjee', 'cyber2024068@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024069', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Das', 'cyber2024069@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024070', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Ghosh', 'cyber2024070@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024071', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Kulkarni', 'cyber2024071@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024072', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Desai', 'cyber2024072@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024073', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Hegde', 'cyber2024073@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024074', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Malhotra', 'cyber2024074@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024075', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Kapoor', 'cyber2024075@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024076', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Saxena', 'cyber2024076@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024077', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Trivedi', 'cyber2024077@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024078', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Mishra', 'cyber2024078@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024079', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Pandey', 'cyber2024079@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024080', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Sinha', 'cyber2024080@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024081', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Bhat', 'cyber2024081@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024082', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Shetty', 'cyber2024082@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024083', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Gowda', 'cyber2024083@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024084', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Chopra', 'cyber2024084@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024085', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Bose', 'cyber2024085@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024086', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Mukherjee', 'cyber2024086@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024087', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Thakur', 'cyber2024087@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024088', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Yadav', 'cyber2024088@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024089', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Jain', 'cyber2024089@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024090', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Sai Srivastava', 'cyber2024090@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024091', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Sharma', 'cyber2024091@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024092', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Verma', 'cyber2024092@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024093', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Patel', 'cyber2024093@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024094', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Singh', 'cyber2024094@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024095', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Kumar', 'cyber2024095@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024096', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Reddy', 'cyber2024096@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024097', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Nair', 'cyber2024097@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024098', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Iyer', 'cyber2024098@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024099', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Gupta', 'cyber2024099@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024100', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Joshi', 'cyber2024100@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024101', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Mehta', 'cyber2024101@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024102', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Shah', 'cyber2024102@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024103', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Rao', 'cyber2024103@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024104', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Menon', 'cyber2024104@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024105', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Pillai', 'cyber2024105@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024106', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Choudhary', 'cyber2024106@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024107', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Agarwal', 'cyber2024107@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024108', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Banerjee', 'cyber2024108@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024109', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Das', 'cyber2024109@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024110', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Ghosh', 'cyber2024110@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024111', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Kulkarni', 'cyber2024111@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024112', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Desai', 'cyber2024112@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024113', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Hegde', 'cyber2024113@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024114', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Malhotra', 'cyber2024114@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024115', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Kapoor', 'cyber2024115@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024116', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Saxena', 'cyber2024116@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024117', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Trivedi', 'cyber2024117@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024118', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Mishra', 'cyber2024118@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024119', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Pandey', 'cyber2024119@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024120', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Sinha', 'cyber2024120@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024121', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Bhat', 'cyber2024121@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024122', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Shetty', 'cyber2024122@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024123', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Gowda', 'cyber2024123@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024124', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Chopra', 'cyber2024124@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024125', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Bose', 'cyber2024125@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024126', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Mukherjee', 'cyber2024126@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024127', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Thakur', 'cyber2024127@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024128', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Yadav', 'cyber2024128@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024129', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Jain', 'cyber2024129@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024130', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Arnav Srivastava', 'cyber2024130@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024131', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Sharma', 'cyber2024131@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024132', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Verma', 'cyber2024132@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024133', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Patel', 'cyber2024133@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024134', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Singh', 'cyber2024134@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024135', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Kumar', 'cyber2024135@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024136', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Reddy', 'cyber2024136@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024137', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Nair', 'cyber2024137@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024138', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Iyer', 'cyber2024138@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024139', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Gupta', 'cyber2024139@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024140', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Joshi', 'cyber2024140@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024141', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Mehta', 'cyber2024141@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024142', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Shah', 'cyber2024142@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024143', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Rao', 'cyber2024143@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024144', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Menon', 'cyber2024144@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024145', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Pillai', 'cyber2024145@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024146', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Choudhary', 'cyber2024146@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024147', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Agarwal', 'cyber2024147@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024148', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Banerjee', 'cyber2024148@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024149', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Das', 'cyber2024149@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024150', '$2a$10$ccX67LAHX8YVL3uVgubSVOv.8qncnhdPyBXmmeQjo0Ce8CitzNdYK', 'student123', 'Ayaan Ghosh', 'cyber2024150@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_system_meta (key, value) VALUES ('demo_students_300', 'true')
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;

-- Fee records for newly inserted students
INSERT INTO college_fees (student_id, total_fee, paid_amount, pending_amount, status)
SELECT s.id, 50000, 0, 50000, 'pending'
FROM college_students s
WHERE s.enrollment_number LIKE 'AIML2024%' OR s.enrollment_number LIKE 'CYBER2024%'
ON CONFLICT (student_id) DO NOTHING;

COMMIT;
