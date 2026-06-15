<<<<<<< HEAD
# College ERP — SNAPCLASS

Luxury Black + Gold College ERP with Student, Teacher, and Admin portals.

## Departments

- **AIML**
- **CYBER SECURITY**

## Classes

AIML-A, AIML-B, AIML-C, CYBER-A, CYBER-B

## Quick Start

```powershell
cd backend
npm install
npm run seed
npm start
```

Open **http://localhost:3001**

> Full setup, troubleshooting, and API reference: **[GUIDE.md](./GUIDE.md)**

## Demo Credentials

| Role    | Login ID       | Password    |
|---------|----------------|-------------|
| Admin   | admin          | admin123    |
| Teacher | TCH001         | teacher123  |
| Student | AIML2024001    | student123  |
| Student | CYB2024001     | student123  |

## Project Structure

```
SNAPCLASS/
├── index.html                 # Landing page
├── student-login.html
├── teacher-login.html
├── admin-login.html
├── student-dashboard.html
├── student-payment.html
├── teacher-dashboard.html
├── teacher-attendance.html
├── teacher-marks.html
├── admin-dashboard.html
├── css/erp.css
├── js/api.js
└── backend/
    ├── server.js              # Express API + static files
    ├── routes/                # Auth, student, teacher, admin
    ├── migrations/            # PostgreSQL schema
    └── scripts/seed.js
```

## Database (InsForge PostgreSQL)

Tables: `college_departments`, `college_classes`, `college_subjects`, `college_students`, `college_teachers`, `college_admins`, `college_teacher_classes`, `college_attendance`, `college_marks`, `college_fees`

## Security

- JWT authentication (24h expiry)
- Role-based access: student / teacher / admin
- Teachers limited to 5 assigned classes
- Students see only their own data
=======
# ERP-Based-Integrated-Student-System
>>>>>>> d0a0a8b74ba11442c94a04dd696e0f195d860536
