-- Auto-generated bulk demo students (300 accounts)
-- Password for all: student123
-- Bcrypt hash: $2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC
-- Run 003_bulk_students_setup.sql first

BEGIN;

-- Sample rows (one per class):
-- AIML2024001 | Aarav Sharma | AIML | AIML-A | aiml2024001@snapclass.edu
-- AIML2024002 | Vihaan Sharma | AIML | AIML-A | aiml2024002@snapclass.edu
-- AIML2024003 | Aditya Sharma | AIML | AIML-A | aiml2024003@snapclass.edu
-- AIML2024004 | Arjun Sharma | AIML | AIML-A | aiml2024004@snapclass.edu
-- AIML2024005 | Reyansh Sharma | AIML | AIML-A | aiml2024005@snapclass.edu
-- AIML2024006 | Sai Sharma | AIML | AIML-A | aiml2024006@snapclass.edu

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024001', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarav Sharma', 'aiml2024001@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024002', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vihaan Sharma', 'aiml2024002@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024003', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aditya Sharma', 'aiml2024003@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024004', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arjun Sharma', 'aiml2024004@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024005', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Reyansh Sharma', 'aiml2024005@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024006', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sai Sharma', 'aiml2024006@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024007', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arnav Sharma', 'aiml2024007@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024008', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ayaan Sharma', 'aiml2024008@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024009', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Krishna Sharma', 'aiml2024009@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024010', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishaan Sharma', 'aiml2024010@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024011', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shaurya Sharma', 'aiml2024011@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024012', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Atharv Sharma', 'aiml2024012@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024013', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Advik Sharma', 'aiml2024013@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024014', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pranav Sharma', 'aiml2024014@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024015', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dhruv Sharma', 'aiml2024015@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024016', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kabir Sharma', 'aiml2024016@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024017', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ritvik Sharma', 'aiml2024017@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024018', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarush Sharma', 'aiml2024018@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024019', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Veer Sharma', 'aiml2024019@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024020', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rohan Sharma', 'aiml2024020@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024021', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vivaan Sharma', 'aiml2024021@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024022', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kian Sharma', 'aiml2024022@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024023', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Darsh Sharma', 'aiml2024023@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024024', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Yash Sharma', 'aiml2024024@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024025', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dev Sharma', 'aiml2024025@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024026', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aryan Sharma', 'aiml2024026@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024027', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rudra Sharma', 'aiml2024027@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024028', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Om Sharma', 'aiml2024028@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024029', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Parth Sharma', 'aiml2024029@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024030', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Harsh Sharma', 'aiml2024030@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024031', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ananya Sharma', 'aiml2024031@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024032', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Diya Sharma', 'aiml2024032@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024033', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aadhya Sharma', 'aiml2024033@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024034', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pari Sharma', 'aiml2024034@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024035', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anika Sharma', 'aiml2024035@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024036', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Navya Sharma', 'aiml2024036@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024037', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Myra Sharma', 'aiml2024037@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024038', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ira Sharma', 'aiml2024038@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024039', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Avni Sharma', 'aiml2024039@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024040', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Riya Sharma', 'aiml2024040@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024041', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shanaya Sharma', 'aiml2024041@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024042', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Siya Sharma', 'aiml2024042@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024043', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Priya Sharma', 'aiml2024043@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024044', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kavya Sharma', 'aiml2024044@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024045', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishita Sharma', 'aiml2024045@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024046', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kiara Sharma', 'aiml2024046@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024047', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Nisha Sharma', 'aiml2024047@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024048', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Meera Sharma', 'aiml2024048@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024049', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Tanvi Sharma', 'aiml2024049@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024050', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pooja Sharma', 'aiml2024050@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024051', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Neha Sharma', 'aiml2024051@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024052', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Lakshmi Sharma', 'aiml2024052@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024053', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sneha Sharma', 'aiml2024053@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024054', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Divya Sharma', 'aiml2024054@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024055', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Swati Sharma', 'aiml2024055@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024056', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anjali Sharma', 'aiml2024056@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024057', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shruti Sharma', 'aiml2024057@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024058', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Deepika Sharma', 'aiml2024058@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024059', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kritika Sharma', 'aiml2024059@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024060', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sakshi Sharma', 'aiml2024060@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024061', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarav Verma', 'aiml2024061@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024062', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vihaan Verma', 'aiml2024062@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024063', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aditya Verma', 'aiml2024063@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024064', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arjun Verma', 'aiml2024064@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024065', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Reyansh Verma', 'aiml2024065@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024066', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sai Verma', 'aiml2024066@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024067', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arnav Verma', 'aiml2024067@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024068', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ayaan Verma', 'aiml2024068@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024069', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Krishna Verma', 'aiml2024069@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024070', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishaan Verma', 'aiml2024070@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024071', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shaurya Verma', 'aiml2024071@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024072', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Atharv Verma', 'aiml2024072@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024073', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Advik Verma', 'aiml2024073@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024074', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pranav Verma', 'aiml2024074@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024075', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dhruv Verma', 'aiml2024075@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024076', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kabir Verma', 'aiml2024076@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024077', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ritvik Verma', 'aiml2024077@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024078', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarush Verma', 'aiml2024078@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024079', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Veer Verma', 'aiml2024079@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024080', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rohan Verma', 'aiml2024080@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024081', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vivaan Verma', 'aiml2024081@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024082', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kian Verma', 'aiml2024082@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024083', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Darsh Verma', 'aiml2024083@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024084', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Yash Verma', 'aiml2024084@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024085', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dev Verma', 'aiml2024085@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024086', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aryan Verma', 'aiml2024086@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024087', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rudra Verma', 'aiml2024087@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024088', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Om Verma', 'aiml2024088@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024089', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Parth Verma', 'aiml2024089@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024090', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Harsh Verma', 'aiml2024090@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024091', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ananya Verma', 'aiml2024091@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024092', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Diya Verma', 'aiml2024092@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024093', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aadhya Verma', 'aiml2024093@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024094', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pari Verma', 'aiml2024094@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024095', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anika Verma', 'aiml2024095@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024096', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Navya Verma', 'aiml2024096@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024097', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Myra Verma', 'aiml2024097@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024098', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ira Verma', 'aiml2024098@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024099', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Avni Verma', 'aiml2024099@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024100', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Riya Verma', 'aiml2024100@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024101', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shanaya Verma', 'aiml2024101@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024102', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Siya Verma', 'aiml2024102@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024103', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Priya Verma', 'aiml2024103@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024104', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kavya Verma', 'aiml2024104@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024105', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishita Verma', 'aiml2024105@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024106', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kiara Verma', 'aiml2024106@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024107', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Nisha Verma', 'aiml2024107@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024108', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Meera Verma', 'aiml2024108@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024109', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Tanvi Verma', 'aiml2024109@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024110', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pooja Verma', 'aiml2024110@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024111', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Neha Verma', 'aiml2024111@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024112', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Lakshmi Verma', 'aiml2024112@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024113', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sneha Verma', 'aiml2024113@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024114', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Divya Verma', 'aiml2024114@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024115', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Swati Verma', 'aiml2024115@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024116', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anjali Verma', 'aiml2024116@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024117', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shruti Verma', 'aiml2024117@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024118', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Deepika Verma', 'aiml2024118@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024119', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kritika Verma', 'aiml2024119@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024120', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sakshi Verma', 'aiml2024120@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024121', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarav Patel', 'aiml2024121@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024122', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vihaan Patel', 'aiml2024122@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024123', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aditya Patel', 'aiml2024123@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024124', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arjun Patel', 'aiml2024124@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024125', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Reyansh Patel', 'aiml2024125@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024126', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sai Patel', 'aiml2024126@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024127', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arnav Patel', 'aiml2024127@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024128', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ayaan Patel', 'aiml2024128@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024129', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Krishna Patel', 'aiml2024129@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024130', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishaan Patel', 'aiml2024130@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024131', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shaurya Patel', 'aiml2024131@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024132', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Atharv Patel', 'aiml2024132@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024133', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Advik Patel', 'aiml2024133@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024134', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pranav Patel', 'aiml2024134@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024135', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dhruv Patel', 'aiml2024135@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024136', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kabir Patel', 'aiml2024136@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024137', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ritvik Patel', 'aiml2024137@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024138', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarush Patel', 'aiml2024138@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024139', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Veer Patel', 'aiml2024139@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024140', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rohan Patel', 'aiml2024140@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024141', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vivaan Patel', 'aiml2024141@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024142', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kian Patel', 'aiml2024142@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024143', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Darsh Patel', 'aiml2024143@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024144', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Yash Patel', 'aiml2024144@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024145', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dev Patel', 'aiml2024145@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024146', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aryan Patel', 'aiml2024146@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024147', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rudra Patel', 'aiml2024147@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024148', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Om Patel', 'aiml2024148@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024149', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Parth Patel', 'aiml2024149@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('AIML2024150', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Harsh Patel', 'aiml2024150@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'AIML'), (SELECT id FROM college_classes WHERE name = 'AIML-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024001', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ananya Patel', 'cyber2024001@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024002', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Diya Patel', 'cyber2024002@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024003', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aadhya Patel', 'cyber2024003@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024004', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pari Patel', 'cyber2024004@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024005', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anika Patel', 'cyber2024005@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024006', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Navya Patel', 'cyber2024006@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024007', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Myra Patel', 'cyber2024007@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024008', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ira Patel', 'cyber2024008@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024009', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Avni Patel', 'cyber2024009@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024010', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Riya Patel', 'cyber2024010@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024011', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shanaya Patel', 'cyber2024011@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024012', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Siya Patel', 'cyber2024012@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024013', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Priya Patel', 'cyber2024013@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024014', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kavya Patel', 'cyber2024014@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024015', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishita Patel', 'cyber2024015@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024016', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kiara Patel', 'cyber2024016@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024017', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Nisha Patel', 'cyber2024017@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024018', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Meera Patel', 'cyber2024018@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024019', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Tanvi Patel', 'cyber2024019@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024020', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pooja Patel', 'cyber2024020@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024021', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Neha Patel', 'cyber2024021@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024022', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Lakshmi Patel', 'cyber2024022@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024023', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sneha Patel', 'cyber2024023@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024024', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Divya Patel', 'cyber2024024@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024025', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Swati Patel', 'cyber2024025@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024026', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anjali Patel', 'cyber2024026@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024027', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shruti Patel', 'cyber2024027@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024028', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Deepika Patel', 'cyber2024028@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024029', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kritika Patel', 'cyber2024029@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024030', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sakshi Patel', 'cyber2024030@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024031', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarav Singh', 'cyber2024031@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024032', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vihaan Singh', 'cyber2024032@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024033', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aditya Singh', 'cyber2024033@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024034', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arjun Singh', 'cyber2024034@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024035', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Reyansh Singh', 'cyber2024035@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024036', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sai Singh', 'cyber2024036@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024037', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arnav Singh', 'cyber2024037@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024038', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ayaan Singh', 'cyber2024038@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024039', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Krishna Singh', 'cyber2024039@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024040', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishaan Singh', 'cyber2024040@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024041', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shaurya Singh', 'cyber2024041@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024042', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Atharv Singh', 'cyber2024042@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024043', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Advik Singh', 'cyber2024043@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024044', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pranav Singh', 'cyber2024044@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024045', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dhruv Singh', 'cyber2024045@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024046', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kabir Singh', 'cyber2024046@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024047', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ritvik Singh', 'cyber2024047@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024048', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarush Singh', 'cyber2024048@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024049', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Veer Singh', 'cyber2024049@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024050', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rohan Singh', 'cyber2024050@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-A'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024051', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vivaan Singh', 'cyber2024051@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024052', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kian Singh', 'cyber2024052@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024053', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Darsh Singh', 'cyber2024053@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024054', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Yash Singh', 'cyber2024054@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024055', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dev Singh', 'cyber2024055@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024056', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aryan Singh', 'cyber2024056@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024057', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rudra Singh', 'cyber2024057@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024058', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Om Singh', 'cyber2024058@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024059', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Parth Singh', 'cyber2024059@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024060', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Harsh Singh', 'cyber2024060@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024061', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ananya Singh', 'cyber2024061@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024062', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Diya Singh', 'cyber2024062@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024063', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aadhya Singh', 'cyber2024063@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024064', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pari Singh', 'cyber2024064@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024065', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anika Singh', 'cyber2024065@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024066', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Navya Singh', 'cyber2024066@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024067', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Myra Singh', 'cyber2024067@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024068', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ira Singh', 'cyber2024068@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024069', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Avni Singh', 'cyber2024069@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024070', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Riya Singh', 'cyber2024070@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024071', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shanaya Singh', 'cyber2024071@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024072', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Siya Singh', 'cyber2024072@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024073', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Priya Singh', 'cyber2024073@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024074', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kavya Singh', 'cyber2024074@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024075', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishita Singh', 'cyber2024075@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024076', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kiara Singh', 'cyber2024076@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024077', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Nisha Singh', 'cyber2024077@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024078', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Meera Singh', 'cyber2024078@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024079', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Tanvi Singh', 'cyber2024079@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024080', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pooja Singh', 'cyber2024080@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024081', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Neha Singh', 'cyber2024081@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024082', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Lakshmi Singh', 'cyber2024082@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024083', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sneha Singh', 'cyber2024083@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024084', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Divya Singh', 'cyber2024084@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024085', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Swati Singh', 'cyber2024085@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024086', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anjali Singh', 'cyber2024086@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024087', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shruti Singh', 'cyber2024087@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024088', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Deepika Singh', 'cyber2024088@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024089', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kritika Singh', 'cyber2024089@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024090', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sakshi Singh', 'cyber2024090@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024091', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarav Kumar', 'cyber2024091@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024092', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vihaan Kumar', 'cyber2024092@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024093', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aditya Kumar', 'cyber2024093@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024094', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arjun Kumar', 'cyber2024094@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024095', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Reyansh Kumar', 'cyber2024095@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024096', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sai Kumar', 'cyber2024096@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024097', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Arnav Kumar', 'cyber2024097@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024098', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ayaan Kumar', 'cyber2024098@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024099', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Krishna Kumar', 'cyber2024099@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024100', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishaan Kumar', 'cyber2024100@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-B'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024101', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shaurya Kumar', 'cyber2024101@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024102', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Atharv Kumar', 'cyber2024102@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024103', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Advik Kumar', 'cyber2024103@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024104', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pranav Kumar', 'cyber2024104@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024105', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dhruv Kumar', 'cyber2024105@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024106', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kabir Kumar', 'cyber2024106@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024107', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ritvik Kumar', 'cyber2024107@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024108', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aarush Kumar', 'cyber2024108@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024109', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Veer Kumar', 'cyber2024109@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024110', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rohan Kumar', 'cyber2024110@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024111', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Vivaan Kumar', 'cyber2024111@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024112', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kian Kumar', 'cyber2024112@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024113', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Darsh Kumar', 'cyber2024113@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024114', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Yash Kumar', 'cyber2024114@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024115', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Dev Kumar', 'cyber2024115@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024116', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aryan Kumar', 'cyber2024116@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024117', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Rudra Kumar', 'cyber2024117@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024118', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Om Kumar', 'cyber2024118@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024119', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Parth Kumar', 'cyber2024119@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024120', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Harsh Kumar', 'cyber2024120@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024121', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ananya Kumar', 'cyber2024121@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024122', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Diya Kumar', 'cyber2024122@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024123', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Aadhya Kumar', 'cyber2024123@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024124', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pari Kumar', 'cyber2024124@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024125', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anika Kumar', 'cyber2024125@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024126', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Navya Kumar', 'cyber2024126@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024127', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Myra Kumar', 'cyber2024127@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024128', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ira Kumar', 'cyber2024128@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024129', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Avni Kumar', 'cyber2024129@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024130', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Riya Kumar', 'cyber2024130@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024131', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shanaya Kumar', 'cyber2024131@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024132', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Siya Kumar', 'cyber2024132@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024133', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Priya Kumar', 'cyber2024133@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024134', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kavya Kumar', 'cyber2024134@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024135', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Ishita Kumar', 'cyber2024135@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024136', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kiara Kumar', 'cyber2024136@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024137', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Nisha Kumar', 'cyber2024137@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024138', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Meera Kumar', 'cyber2024138@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024139', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Tanvi Kumar', 'cyber2024139@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024140', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Pooja Kumar', 'cyber2024140@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024141', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Neha Kumar', 'cyber2024141@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024142', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Lakshmi Kumar', 'cyber2024142@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024143', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sneha Kumar', 'cyber2024143@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024144', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Divya Kumar', 'cyber2024144@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024145', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Swati Kumar', 'cyber2024145@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024146', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Anjali Kumar', 'cyber2024146@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024147', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Shruti Kumar', 'cyber2024147@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024148', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Deepika Kumar', 'cyber2024148@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024149', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Kritika Kumar', 'cyber2024149@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
ON CONFLICT (enrollment_number) DO NOTHING;

INSERT INTO college_students (enrollment_number, password_hash, password_plain, name, email, department_id, class_id)
VALUES ('CYBER2024150', '$2a$10$TL3ffCyLyTUFVsyzpF3pnuMUGDz8wiGTX5dGm.LOg0leKsdeegMWC', 'student123', 'Sakshi Kumar', 'cyber2024150@snapclass.edu', (SELECT id FROM college_departments WHERE code = 'CYBER'), (SELECT id FROM college_classes WHERE name = 'CYBER-C'))
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
