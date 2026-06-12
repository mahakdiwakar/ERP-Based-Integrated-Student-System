-- Recreate college_fees table with Razorpay integration fields
DROP TABLE IF EXISTS college_fees CASCADE;

CREATE TABLE college_fees (
  id SERIAL PRIMARY KEY,
  student_id INTEGER UNIQUE NOT NULL REFERENCES college_students(id) ON DELETE CASCADE,
  total_fee NUMERIC(10,2) NOT NULL DEFAULT 50000.00,
  paid_amount NUMERIC(10,2) NOT NULL DEFAULT 0.00,
  pending_amount NUMERIC(10,2) NOT NULL DEFAULT 50000.00,
  status TEXT DEFAULT 'pending' CHECK (status IN ('paid', 'pending', 'overdue')),
  razorpay_order_id TEXT,
  razorpay_payment_id TEXT,
  transaction_id TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seed fees for existing students based on their enrollment number
INSERT INTO college_fees (student_id, total_fee, paid_amount, pending_amount, status)
SELECT id, 50000.00, 50000.00, 0.00, 'paid' 
FROM college_students 
WHERE enrollment_number = 'AIML2024001';

INSERT INTO college_fees (student_id, total_fee, paid_amount, pending_amount, status)
SELECT id, 50000.00, 30000.00, 20000.00, 'pending' 
FROM college_students 
WHERE enrollment_number = 'AIML2024002';

INSERT INTO college_fees (student_id, total_fee, paid_amount, pending_amount, status)
SELECT id, 50000.00, 30000.00, 20000.00, 'pending' 
FROM college_students 
WHERE enrollment_number = 'CYB2024001';
