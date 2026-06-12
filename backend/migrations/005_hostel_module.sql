-- Hostel Management Module Schema

-- Hostels Table
CREATE TABLE IF NOT EXISTS hostels (
  id SERIAL PRIMARY KEY,
  hostel_name TEXT NOT NULL,
  gender TEXT CHECK (gender IN ('Male', 'Female', 'Other')),
  total_rooms INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Rooms Table
CREATE TABLE IF NOT EXISTS rooms (
  id SERIAL PRIMARY KEY,
  hostel_id INTEGER REFERENCES hostels(id) ON DELETE CASCADE,
  room_number TEXT NOT NULL,
  floor INTEGER,
  capacity INTEGER NOT NULL,
  occupied_beds INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Hostel Allocations Table
CREATE TABLE IF NOT EXISTS hostel_allocations (
  id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES college_students(id) ON DELETE CASCADE,
  hostel_id INTEGER REFERENCES hostels(id),
  room_id INTEGER REFERENCES rooms(id),
  bed_number INTEGER,
  allocation_date DATE DEFAULT CURRENT_DATE,
  status TEXT DEFAULT 'Allocated' CHECK (status IN ('Allocated', 'Waiting', 'Removed')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Hostel Fees Table
CREATE TABLE IF NOT EXISTS college_hostel_fees (
  id SERIAL PRIMARY KEY,
  student_id INTEGER UNIQUE NOT NULL REFERENCES college_students(id) ON DELETE CASCADE,
  total_fee NUMERIC(10,2) DEFAULT 30000,
  paid_amount NUMERIC(10,2) DEFAULT 0,
  pending_amount NUMERIC(10,2) DEFAULT 30000,
  status TEXT DEFAULT 'pending',
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seed some initial hostels
INSERT INTO hostels (hostel_name, gender, total_rooms) VALUES
  ('Luxury Male Residency', 'Male', 50),
  ('Golden Female Suites', 'Female', 50)
ON CONFLICT DO NOTHING;

-- Seed some initial rooms for Luxury Male Residency
INSERT INTO rooms (hostel_id, room_number, floor, capacity)
SELECT h.id, '10' || s.i, 1, 4
FROM hostels h, generate_series(1, 10) s(i)
WHERE h.hostel_name = 'Luxury Male Residency'
ON CONFLICT DO NOTHING;

-- Seed some initial rooms for Golden Female Suites
INSERT INTO rooms (hostel_id, room_number, floor, capacity)
SELECT h.id, '10' || s.i, 1, 4
FROM hostels h, generate_series(1, 10) s(i)
WHERE h.hostel_name = 'Golden Female Suites'
ON CONFLICT DO NOTHING;
