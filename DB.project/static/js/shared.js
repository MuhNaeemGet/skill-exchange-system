/* ============================================================
   shared.js  —  included in every HTML page
   ============================================================ */

const BASE = 'http://localhost:5000';

/* ── Logo SVG ─────────────────────────────────────────────── */
const LOGO_ICON = `
<svg width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M6 9 Q12 5 18 9" stroke="#fff" stroke-width="2" stroke-linecap="round"/>
  <path d="M18 9 L14.5 6.5 L15.5 10" fill="#fff"/>
  <path d="M18 15 Q12 19 6 15" stroke="rgba(255,255,255,.7)" stroke-width="2" stroke-linecap="round"/>
  <path d="M6 15 L9.5 17.5 L8.5 14" fill="rgba(255,255,255,.7)"/>
  <circle cx="12" cy="12" r="1.5" fill="rgba(255,255,255,.5)"/>
</svg>`;

/* ── Auth helpers ─────────────────────────────────────────── */
function getUser()  { try { return JSON.parse(localStorage.getItem('ss_user')||'null'); } catch { return null; } }
function getToken() { return localStorage.getItem('ss_token')||''; }

function saveLogin(token, user) {
  localStorage.setItem('ss_token', token);
  localStorage.setItem('ss_user', JSON.stringify(user));
}

function doLogout() {
  localStorage.removeItem('ss_token');
  localStorage.removeItem('ss_user');
  window.location.href = 'login.html';
}

function requireAuth() {
  if (!getToken()) { window.location.href = 'login.html'; }
}

/* ── API helper ───────────────────────────────────────────── */
async function api(method, path, body) {
  const opts = { method, headers: { 'Content-Type': 'application/json' } };
  const tok  = getToken();
  if (tok)  opts.headers['Authorization'] = 'Bearer ' + tok;
  if (body) opts.body = JSON.stringify(body);
  try {
    const res  = await fetch(BASE + path, opts);
    const data = await res.json();
    return data;
  } catch (e) {
    console.error('API error:', e);
    return { error: 'Network error — is the server running?' };
  }
}

/* ── Toast ────────────────────────────────────────────────── */
function toast(msg, type = 'ok') {
  let w = document.getElementById('toast-wrap');
  if (!w) { w = document.createElement('div'); w.id = 'toast-wrap'; document.body.appendChild(w); }
  const el  = document.createElement('div');
  const ico = type === 'ok' ? '✓' : type === 'err' ? '✕' : 'ℹ';
  el.className = `toast ${type}`;
  el.innerHTML = `<span class="toast-icon">${ico}</span><span>${msg}</span>`;
  w.appendChild(el);
  setTimeout(() => { el.style.animation = 'none'; el.style.opacity = '0'; el.style.transition = 'opacity .3s'; setTimeout(() => el.remove(), 300); }, 3200);
}

/* ── Helpers ──────────────────────────────────────────────── */
function initials(name) {
  return (name || '?').split(' ').map(w => w[0]).join('').toUpperCase().slice(0, 2);
}
function fmtDate(dt) {
  if (!dt) return '';
  return new Date(dt).toLocaleString('en-GB', { dateStyle: 'medium', timeStyle: 'short' });
}
function fmtDateShort(dt) {
  if (!dt) return '';
  return new Date(dt).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' });
}
function starStr(r) {
  const n = Math.round(r || 0);
  return '★'.repeat(n) + '☆'.repeat(5 - n);
}
function statusBadge(s) {
  const map = {
    pending:'badge-amber', accepted:'badge-green', rejected:'badge-red',
    cancelled:'badge-gray', scheduled:'badge-teal', completed:'badge-green'
  };
  return `<span class="badge ${map[s]||'badge-gray'}">${s}</span>`;
}
function escHtml(s) {
  return String(s || '').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
}

/* ── Render navbar ────────────────────────────────────────── */
function renderNav(active) {
  const el   = document.getElementById('navbar');
  if (!el) return;
  const user = getUser();

  const logo = `
    <a class="nav-logo" href="${user ? 'dashboard.html' : 'project.html'}">
      <div class="nav-logo-icon">${LOGO_ICON}</div>
      <span class="nav-logo-text">Skill<span>Swap</span></span>
    </a>`;

  const guestNav = `
    <a class="nav-link ${active==='project'?'active':''}"   href="project.html">Home</a>
    <a class="nav-link ${active==='login'?'active':''}"     href="login.html">Sign in</a>
    <a class="nav-link nav-cta ${active==='register'?'active':''}" href="register.html">Get started free</a>`;

  const authNav = user ? `
    <a class="nav-link ${active==='dashboard'?'active':''}" href="dashboard.html">Dashboard</a>
    <a class="nav-link ${active==='skills'?'active':''}"    href="skills.html">Browse</a>
    <a class="nav-link ${active==='users'?'active':''}"     href="users.html">Matches</a>
    <a class="nav-link ${active==='request'?'active':''}"   href="request.html">Requests</a>
    <a class="nav-link ${active==='teach'?'active':''}"     href="teach.html">Sessions</a>
    <a class="nav-link ${active==='wallet'?'active':''}"    href="wallet.html">Wallet</a>
    <a class="nav-link ${active==='profile'?'active':''}"   href="profile.html" style="font-weight:700;color:var(--brand)">${escHtml(user.username)}</a>
    <button class="nav-link" onclick="doLogout()" style="color:var(--red)">Logout</button>` : '';

  el.innerHTML = logo + `<div class="nav-links">${user ? authNav : guestNav}</div>`;
}

/* ── Confirm dialog ───────────────────────────────────────── */
function confirmAction(msg, cb) {
  if (window.confirm(msg)) cb();
}
