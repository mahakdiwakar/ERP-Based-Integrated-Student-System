/* =========================================================
   hostel-login.js  —  Authentication logic for Hostel Portal
   ========================================================= */

'use strict';

/* ── Particle canvas ── */
(function initParticles() {
  const canvas = document.getElementById('particleCanvas');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  let W, H, particles = [];

  function resize() {
    W = canvas.width  = window.innerWidth;
    H = canvas.height = window.innerHeight;
  }
  resize();
  window.addEventListener('resize', resize);

  function randomRange(a, b) { return a + Math.random() * (b - a); }

  function createParticle() {
    return {
      x: randomRange(0, W),
      y: randomRange(0, H),
      r: randomRange(0.5, 1.8),
      vx: randomRange(-0.18, 0.18),
      vy: randomRange(-0.25, -0.08),
      alpha: randomRange(0.05, 0.35),
      decay: randomRange(0.0003, 0.0007)
    };
  }

  for (let i = 0; i < 90; i++) particles.push(createParticle());

  function draw() {
    ctx.clearRect(0, 0, W, H);
    particles.forEach((p, i) => {
      ctx.beginPath();
      ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
      ctx.fillStyle = `rgba(212,175,55,${p.alpha})`;
      ctx.fill();

      p.x += p.vx;
      p.y += p.vy;
      p.alpha -= p.decay;

      if (p.alpha <= 0 || p.y < -10) {
        particles[i] = { ...createParticle(), y: H + 5 };
      }
    });
    requestAnimationFrame(draw);
  }
  draw();
})();

/* ── Toast ── */
function showToast(message, type = 'info', duration = 3500) {
  const container = document.getElementById('toastContainer');
  const icons = { success: '✅', error: '❌', info: '✨' };
  const toast = document.createElement('div');
  toast.className = `hl-toast ${type}`;
  toast.innerHTML = `<span>${icons[type] || '•'}</span><span>${message}</span>`;
  container.appendChild(toast);

  setTimeout(() => {
    toast.style.animation = 'toastOut 0.4s ease forwards';
    setTimeout(() => toast.remove(), 400);
  }, duration);
}

/* ── Show / hide inline error ── */
function setError(id, message) {
  const el = document.getElementById(id);
  if (!el) return;
  el.textContent = message;
  el.classList.toggle('show', !!message);
}

/* ── Toggle password visibility ── */
function togglePassword(inputId, btn) {
  const input = document.getElementById(inputId);
  if (!input) return;
  const isHidden = input.type === 'password';
  input.type = isHidden ? 'text' : 'password';
  btn.textContent = isHidden ? '🙈' : '👁';
}

/* ── Button loading state ── */
function setBtnLoading(btnId, loading) {
  const btn = document.getElementById(btnId);
  if (!btn) return;
  const text   = btn.querySelector('.btn-text');
  const loader = btn.querySelector('.btn-loader');
  btn.disabled = loading;
  if (text)   text.style.display   = loading ? 'none' : '';
  if (loader) loader.style.display = loading ? 'flex' : 'none';
}

/* ── Forgot Password modal ── */
function showForgot(role) {
  const modal = document.getElementById('forgotModal');
  const desc  = document.getElementById('forgotDesc');
  if (desc) {
    desc.textContent = role === 'warden'
      ? 'Contact the system administrator to reset your warden credentials.'
      : 'Contact your hostel warden or the college admin office to reset your password.';
  }
  modal.classList.add('show');
  return false;
}

function closeForgot() {
  document.getElementById('forgotModal').classList.remove('show');
}

// Close modal on outside click
document.getElementById('forgotModal').addEventListener('click', function (e) {
  if (e.target === this) closeForgot();
});

/* ── Remember-me helpers ── */
function loadSavedCredentials() {
  try {
    const warden = JSON.parse(localStorage.getItem('hl_remember_warden') || 'null');
    if (warden) {
      const u = document.getElementById('wardenUsername');
      const p = document.getElementById('wardenPassword');
      const r = document.getElementById('wardenRemember');
      if (u) u.value = warden.username || '';
      if (p) p.value = warden.password || '';
      if (r) r.checked = true;
    }

    const student = JSON.parse(localStorage.getItem('hl_remember_student') || 'null');
    if (student) {
      const e = document.getElementById('studentEnroll');
      const p = document.getElementById('studentPassword');
      const r = document.getElementById('studentRemember');
      if (e) e.value = student.enrollment || '';
      if (p) p.value = student.password || '';
      if (r) r.checked = true;
    }
  } catch (_) { /* ignore */ }
}

function saveWardenCredentials(username, password, remember) {
  if (remember) {
    localStorage.setItem('hl_remember_warden', JSON.stringify({ username, password }));
  } else {
    localStorage.removeItem('hl_remember_warden');
  }
}

function saveStudentCredentials(enrollment, password, remember) {
  if (remember) {
    localStorage.setItem('hl_remember_student', JSON.stringify({ enrollment, password }));
  } else {
    localStorage.removeItem('hl_remember_student');
  }
}

/* ══════════════════════════════════════════
   WARDEN LOGIN
   ══════════════════════════════════════════ */
document.getElementById('wardenForm').addEventListener('submit', async function (e) {
  e.preventDefault();
  setError('wardenError', '');

  const username = document.getElementById('wardenUsername').value.trim();
  const password = document.getElementById('wardenPassword').value;
  const remember = document.getElementById('wardenRemember').checked;

  if (!username) { setError('wardenError', 'Please enter your username.'); return; }
  if (!password) { setError('wardenError', 'Please enter your password.'); return; }

  setBtnLoading('wardenSubmit', true);

  try {
    // Hostel login uses /api/hostel/login which assigns hostel_admin role
    const res = await fetch('/api/hostel/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ username, password })
    });
    const data = await res.json();
    if (!res.ok) throw new Error(data.detail || 'Login failed. Please check your credentials.');

    // Save session with remember-me routing (sessionStorage vs localStorage)
    saveSession(data, remember);
    saveWardenCredentials(username, password, remember);

    showToast('Welcome, Hostel Admin! Redirecting…', 'success');
    setTimeout(() => { window.location.replace('hostel-dashboard.html'); }, 1200);

  } catch (err) {
    const msg = err.message || 'Login failed. Please check your credentials.';
    setError('wardenError', msg);
    showToast(msg, 'error');
    document.getElementById('wardenCard').style.animation = 'none';
    requestAnimationFrame(() => {
      document.getElementById('wardenCard').style.animation = 'shake 0.45s ease';
    });
  } finally {
    setBtnLoading('wardenSubmit', false);
  }
});

/* ══════════════════════════════════════════
   STUDENT LOGIN
   ══════════════════════════════════════════ */
const studentForm = document.getElementById('studentForm');
if (studentForm) {
  studentForm.addEventListener('submit', async function (e) {
    e.preventDefault();
    setError('studentError', '');

    const enrollment = document.getElementById('studentEnroll').value.trim().toUpperCase();
    const password   = document.getElementById('studentPassword').value;
    const remember   = document.getElementById('studentRemember').checked;

    if (!enrollment) { setError('studentError', 'Please enter your enrollment number.'); return; }
    if (!password)   { setError('studentError', 'Please enter your password.'); return; }

    setBtnLoading('studentSubmit', true);

    try {
      const data = await AuthAPI.studentLogin(enrollment, password);

      // Save session with remember-me routing (sessionStorage vs localStorage)
      saveSession(data, remember);
      saveStudentCredentials(enrollment, password, remember);

      showToast('Welcome! Loading your hostel details…', 'success');
      setTimeout(() => { window.location.replace('hostel.html?role=student'); }, 1200);

    } catch (err) {
      const msg = err.message || 'Login failed. Please check your enrollment number and password.';
      setError('studentError', msg);
      showToast(msg, 'error');
      document.getElementById('studentCard').style.animation = 'none';
      requestAnimationFrame(() => {
        document.getElementById('studentCard').style.animation = 'shake 0.45s ease';
      });
    } finally {
      setBtnLoading('studentSubmit', false);
    }
  });
}

/* ── Shake keyframe (injected dynamically so it lives with the JS) ── */
(function injectShake() {
  const style = document.createElement('style');
  style.textContent = `
    @keyframes shake {
      0%,100% { transform: translateX(0) translateY(-4px); }
      20%      { transform: translateX(-8px) translateY(-4px); }
      40%      { transform: translateX(8px) translateY(-4px); }
      60%      { transform: translateX(-6px) translateY(-4px); }
      80%      { transform: translateX(6px) translateY(-4px); }
    }
  `;
  document.head.appendChild(style);
})();

/* ── Show expired session alert if redirected with ?expired=true ── */
(function checkExpiredParam() {
  const params = new URLSearchParams(window.location.search);
  if (params.get('expired') === 'true') {
    showToast('Session Expired. Please Login Again.', 'error', 5000);
    // Remove the query param from URL without reload
    history.replaceState(null, '', window.location.pathname);
  }
})();

/* ── If user is already logged in with a valid token, redirect to dashboard ── */
(function checkExistingSession() {
  const token = sessionStorage.getItem('erp_token') || localStorage.getItem('erp_token');
  if (!token) return;

  // Validate token is not expired
  try {
    const base64Url = token.split('.')[1];
    const payload = JSON.parse(atob(base64Url.replace(/-/g, '+').replace(/_/g, '/')));
    if (!payload.exp || (payload.exp * 1000) < Date.now()) return;

    const role = payload.role;
    if (role === 'student') {
      window.location.replace('hostel.html?role=student');
    } else if (['hostel_admin', 'warden', 'super_admin', 'college_admin', 'admin'].includes(role)) {
      window.location.replace('hostel-dashboard.html');
    }
  } catch (_) { /* ignore malformed tokens */ }
})();

/* ── Load saved credentials on page ready ── */
loadSavedCredentials();
