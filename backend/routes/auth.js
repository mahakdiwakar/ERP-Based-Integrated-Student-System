import express from 'express';
import { from } from '../lib/db.js';
import { verifyPassword, signToken } from '../lib/auth.js';

const router = express.Router();

async function loginUser(table, idField, idValue, password, role, tokenFields) {
  const { data, error } = await from(table)
    .select('*')
    .eq(idField, idValue)
    .maybeSingle();

  if (error || !data) return null;
  if (!verifyPassword(password, data.password_hash)) return null;

  const token = signToken({
    role,
    id: data.id,
    loginId: data[idField],
    name: data.name,
    ...tokenFields(data)
  });

  return {
    success: true,
    token,
    role,
    user: {
      id: data.id,
      name: data.name,
      role,
      loginId: data[idField],
      ...tokenFields(data)
    }
  };
}

export async function studentLogin(req, res) {
  try {
    const { enrollment_number, password } = req.body;
    if (!enrollment_number || !password) {
      return res.status(400).json({ error: 'Enrollment number and password required' });
    }
    const result = await loginUser(
      'college_students',
      'enrollment_number',
      enrollment_number.trim().toUpperCase(),
      password,
      'student',
      (d) => ({ department_id: d.department_id, class_id: d.class_id })
    );
    if (!result) return res.status(401).json({ error: 'Invalid credentials' });
    res.json(result);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
}

export async function teacherLogin(req, res) {
  try {
    const { teacher_id, password } = req.body;
    if (!teacher_id || !password) {
      return res.status(400).json({ error: 'Teacher ID and password required' });
    }
    const result = await loginUser(
      'college_teachers',
      'teacher_id',
      teacher_id.trim().toUpperCase(),
      password,
      'teacher',
      (d) => ({ department_id: d.department_id })
    );
    if (!result) return res.status(401).json({ error: 'Invalid credentials' });
    res.json(result);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
}

export async function adminLogin(req, res) {
  try {
    const { username, password } = req.body;
    if (!username || !password) {
      return res.status(400).json({ error: 'Username and password required' });
    }
    const result = await loginUser(
      'college_admins',
      'username',
      username.trim().toLowerCase(),
      password,
      'admin',
      () => ({})
    );
    if (!result) return res.status(401).json({ error: 'Invalid credentials' });
    res.json(result);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
}

// Legacy paths under /api/auth/*
router.post('/student/login', studentLogin);
router.post('/teacher/login', teacherLogin);
router.post('/admin/login', adminLogin);

export default router;
