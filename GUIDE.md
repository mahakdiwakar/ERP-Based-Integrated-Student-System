# SNAPCLASS — College ERP Run Guide

Luxury black + gold College ERP with Student, Teacher, and Admin portals. Backend: **Express + InsForge PostgreSQL**.

---

## Prerequisites

| Tool | Version |
|------|---------|
| [Node.js](https://nodejs.org/) | 18 or newer |
| [InsForge CLI](https://insforge.dev) | Latest (`npx @insforge/cli`) |
| InsForge project | Linked to this repo |

---

## 1. Environment setup

Copy the example env file and fill in your InsForge credentials:

```powershell
cd c:\Users\mahak\OneDrive\Desktop\SNAPCLASS
copy .env.example .env.local
```

Edit `.env.local`:

```env
INSFORGE_URL=https://your-appkey.us-east.insforge.app
INSFORGE_API_KEY=your_api_key_from_insforge_cli
JWT_SECRET=change-this-to-a-long-random-string
PORT=3001
```

> **Razorpay** keys in `.env.example` are only needed if you run the optional FastAPI payment server (`backend/main.py`). The main Express app does not require them.

Link the InsForge project (one-time):

```powershell
npx @insforge/cli link
```

---

## 2. Database setup

Apply migrations (first time only):

```powershell
npx @insforge/cli db query --file backend/migrations/001_college_erp.sql
npx @insforge/cli db query --file backend/migrations/002_recreate_fees.sql
```

Seed demo users, attendance, marks, and fees:

```powershell
cd backend
npm install
npm run seed
```

---

## 3. Start the server

```powershell
cd backend
npm start
```

You should see:

```
College ERP running at http://localhost:3001
```

Open in your browser: **http://localhost:3001**

> **Important:** Always use port **3001**. Opening HTML files directly (Live Server, `file://`) will break API login unless `js/api.js` redirects to `:3001` — the Express server serves both the frontend and API.

Verify the API is healthy:

```powershell
Invoke-RestMethod http://localhost:3001/api/health
# → { "status": "ok" }
```

---

## 4. Demo credentials

| Role | Login ID | Password | Notes |
|------|----------|----------|-------|
| **Admin** | `admin` | `admin123` | Full user management + analytics |
| **Teacher** | `TCH001` | `teacher123` | Attendance + marks for 5 classes |
| **Student** | `AIML2024001` | `student123` | Fully paid fees (₹50,000 / ₹50,000) |
| **Student** | `AIML2024002` | `student123` | Partial fees (₹30,000 paid, ₹20,000 pending) |
| **Student** | `CYB2024001` | `student123` | Partial fees (₹30,000 paid, ₹20,000 pending) |

### Portal URLs

| Page | URL |
|------|-----|
| Landing page | http://localhost:3001/ |
| Student login | http://localhost:3001/student-login.html |
| Teacher login | http://localhost:3001/teacher-login.html |
| Admin login | http://localhost:3001/admin-login.html |

---

## 5. What each portal does

### Student
- **Dashboard** — attendance %, mid-sem marks, fee status (total / paid / pending / badge)
- **Pay Now** — visible when pending > 0; links to payment page
- **Download Receipt** — visible when paid > 0 (requires FastAPI for PDF generation)

### Teacher
- **Dashboard** — assigned classes overview
- **Attendance** — mark present/absent per class per day
- **Marks** — enter mid-sem marks per subject

### Admin
- **User management** — create/edit/delete students and teachers
- **Analytics** — attendance and marks overview
- **Fee analytics** — collection charts

---

## 6. Departments & classes

| Department | Classes |
|------------|---------|
| AIML | AIML-A, AIML-B, AIML-C |
| CYBER SECURITY | CYBER-A, CYBER-B |

---

## 7. Project structure

```
SNAPCLASS/
├── index.html                  # Landing page
├── student-login.html
├── student-dashboard.html
├── student-payment.html
├── teacher-login.html
├── teacher-dashboard.html
├── teacher-attendance.html
├── teacher-marks.html
├── admin-login.html
├── admin-dashboard.html
├── css/erp.css
├── js/
│   ├── api.js                  # API client (auto-detects :3001)
│   └── teacher-marks.js
├── .env.local                  # Secrets (not committed)
├── .env.example
└── backend/
    ├── server.js               # Express — main server
    ├── package.json
    ├── routes/                 # auth, student, teacher, admin
    ├── lib/                    # db, auth, fees helpers
    ├── migrations/             # SQL schema
    ├── scripts/seed.js         # Demo data
    ├── main.py                 # Optional FastAPI (Razorpay + PDF receipts)
    └── requirements.txt
```

---

## 8. API overview

Base URL: `http://localhost:3001/api`

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| POST | `/student/login` | — | Student login |
| POST | `/teacher/login` | — | Teacher login |
| POST | `/admin/login` | — | Admin login |
| GET | `/student/dashboard` | Student JWT | Attendance, marks, fees |
| POST | `/student/fees/pay` | Student JWT | Manual fee payment |
| GET | `/teacher/classes` | Teacher JWT | Assigned classes |
| POST | `/teacher/attendance` | Teacher JWT | Save attendance |
| POST | `/teacher/marks` | Teacher JWT | Save marks |
| GET | `/admin/users` | Admin JWT | List all users |
| GET | `/admin/analytics` | Admin JWT | Dashboard stats |
| GET | `/health` | — | Health check |

---

## 9. Fee status logic

The API reads `total_fee`, `paid_amount`, and `pending_amount` from `college_fees` and derives status:

| Condition | Status badge |
|-----------|--------------|
| `pending ≤ 0` | **PAID** |
| `paid > 0` and pending > 0 | **PARTIALLY PAID** |
| `paid = 0` | **PENDING** |

**Pay Now** button shows only when `pending > 0`.

---

## 10. Optional: FastAPI payment server

For Razorpay checkout and PDF receipts, run the Python backend separately:

```powershell
cd backend
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

Then point `js/api.js` `API_BASE` to `http://localhost:8000/api` or proxy payment routes. Express handles all core ERP features; FastAPI adds payment gateway + receipt PDF.

---

## 11. Troubleshooting

### `npm start` fails with "Cannot use import statement outside a module"
Ensure `backend/package.json` exists with `"type": "module"`. Run `npm install` again.

### Login returns "Invalid credentials"
Re-run the seed to reset passwords:

```powershell
cd backend
npm run seed
```

### Fee Status shows Total = 0
The Express API must use `total_fee` (not `total_fees`). This is fixed in `backend/lib/fees.js` and `backend/routes/student.js`.

### Admin login returns HTTP 405
You are not hitting the Express server. Start `npm start` in `backend/` and open **http://localhost:3001**.

### API calls fail from Live Server (port 5500)
`js/api.js` auto-redirects API calls to `localhost:3001`. Ensure the Express server is running.

### Database connection errors
Check `.env.local` has valid `INSFORGE_URL` and `INSFORGE_API_KEY`. Run `npx @insforge/cli status` to verify the project link.

---

## 12. Bulk demo students (300 accounts)

Admin → **Create Users** → **Generate Demo Students**

| Class | Enrollment range | Students |
|-------|------------------|----------|
| AIML-A | AIML2024001 – AIML2024050 | 50 |
| AIML-B | AIML2024051 – AIML2024100 | 50 |
| AIML-C | AIML2024101 – AIML2024150 | 50 |
| CYBER-A | CYBER2024001 – CYBER2024050 | 50 |
| CYBER-B | CYBER2024051 – CYBER2024100 | 50 |
| CYBER-C | CYBER2024101 – CYBER2024150 | 50 |

Password for all: `student123`

SQL option:

```powershell
npx @insforge/cli db query "..." # run 003_bulk_students_setup.sql statements
cd backend
npm run generate-demo-sql   # writes migrations/003_bulk_demo_students.sql
```

API: `POST /api/admin/generate-demo-students` (admin JWT). Runs once only.

---

## 13. Quick restart checklist

```powershell
# Terminal 1 — from project root
cd backend
npm start

# Browser
start http://localhost:3001
```

Login as **AIML2024002** / `student123` to see partial fees with **Pay Now** visible.
