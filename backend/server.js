import path from 'path';
import { fileURLToPath } from 'url';
import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import authRoutes, { adminLogin, studentLogin, teacherLogin } from './routes/auth.js';
import studentRoutes from './routes/student.js';
import teacherRoutes, { saveAttendanceHandler } from './routes/teacher.js';
import { authMiddleware } from './lib/auth.js';
import adminRoutes from './routes/admin.js';
import paymentRoutes from './routes/payment.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
dotenv.config({ path: path.join(__dirname, '../.env.local') });

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors({ origin: true, credentials: true }));
app.use(express.json());

// Public login endpoints (must be registered BEFORE protected /api/admin routes)
app.post('/api/admin/login', adminLogin);
app.post('/api/student/login', studentLogin);
app.post('/api/teacher/login', teacherLogin);

// Legacy login paths
app.use('/api/auth', authRoutes);

// Protected API routes
app.post('/api/attendance/save', authMiddleware(['teacher']), saveAttendanceHandler);
app.use('/api/student', studentRoutes);
app.use('/api/teacher', teacherRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/payment', paymentRoutes);

app.get('/api/health', (_req, res) => res.json({ status: 'ok' }));

const root = path.join(__dirname, '..');
app.use(express.static(root));

app.get('*', (req, res, next) => {
  if (req.path.startsWith('/api')) return next();
  const file = path.join(root, req.path === '/' ? 'index.html' : req.path);
  res.sendFile(file, (err) => {
    if (err) res.status(404).send('Not found');
  });
});

// Return 405/404 for unmatched API methods (not static GET fallback)
app.use('/api', (req, res) => {
  res.status(405).json({ error: `Method ${req.method} not allowed for ${req.path}` });
});

app.listen(PORT, () => {
  console.log(`College ERP running at http://localhost:${PORT}`);
});
