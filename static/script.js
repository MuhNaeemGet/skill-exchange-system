/* ============================================================
   SkillPortal — Main JavaScript
   ============================================================ */

'use strict';

// ── Dark Mode ─────────────────────────────────────────────────
(function () {
  const html        = document.documentElement;
  const themeToggle = document.getElementById('themeToggle');
  const PREF_KEY    = 'sp-theme';

  // Apply saved preference or system preference
  const saved  = localStorage.getItem(PREF_KEY);
  const prefer = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  html.setAttribute('data-theme', saved || prefer);

  if (themeToggle) {
    themeToggle.addEventListener('click', () => {
      const current = html.getAttribute('data-theme');
      const next    = current === 'dark' ? 'light' : 'dark';
      html.setAttribute('data-theme', next);
      localStorage.setItem(PREF_KEY, next);
    });
  }
})();

// ── Mobile Nav Toggle ────────────────────────────────────────
(function () {
  const toggle = document.getElementById('navToggle');
  const links  = document.getElementById('navLinks');

  if (toggle && links) {
    toggle.addEventListener('click', () => {
      links.classList.toggle('open');
      toggle.setAttribute('aria-expanded', links.classList.contains('open'));
    });

    // Close when a nav link is clicked
    links.querySelectorAll('a').forEach(a => {
      a.addEventListener('click', () => links.classList.remove('open'));
    });
  }
})();

// ── Auto-dismiss Flash Messages ──────────────────────────────
(function () {
  const flashes = document.querySelectorAll('.flash');
  flashes.forEach((f, i) => {
    setTimeout(() => {
      f.style.transition  = 'opacity .4s, transform .4s';
      f.style.opacity     = '0';
      f.style.transform   = 'translateX(100%)';
      setTimeout(() => f.remove(), 400);
    }, 4000 + i * 300);
  });
})();

// ── Animate elements on scroll (Intersection Observer) ────────
(function () {
  if (!('IntersectionObserver' in window)) return;

  const targets = document.querySelectorAll(
    '.teacher-card, .step-card, .stat-pill, .qa-card, .dash-section'
  );

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });

  targets.forEach((el, i) => {
    el.style.opacity     = '0';
    el.style.transform   = 'translateY(20px)';
    el.style.transition  = `opacity .4s ease ${i * 0.05}s, transform .4s ease ${i * 0.05}s`;
    observer.observe(el);
  });

  // Add visible state
  document.head.insertAdjacentHTML('beforeend', `
    <style>
      .visible { opacity: 1 !important; transform: translateY(0) !important; }
    </style>
  `);
})();

// ── Form Validation ───────────────────────────────────────────
(function () {
  const forms = document.querySelectorAll('.auth-form');
  forms.forEach(form => {
    form.addEventListener('submit', function (e) {
      const pw = form.querySelector('input[name="password"]');
      if (pw && pw.value.length > 0 && pw.value.length < 6) {
        e.preventDefault();
        showInlineError(pw, 'Password must be at least 6 characters.');
      }

      const email = form.querySelector('input[name="email"]');
      if (email && email.value && !email.value.includes('@')) {
        e.preventDefault();
        showInlineError(email, 'Please enter a valid email address.');
      }
    });
  });

  function showInlineError(input, msg) {
    const existing = input.parentElement.querySelector('.inline-err');
    if (!existing) {
      const err = document.createElement('small');
      err.className   = 'inline-err';
      err.style.color = 'var(--danger)';
      err.textContent = msg;
      input.parentElement.appendChild(err);
    }
    input.style.borderColor = 'var(--danger)';
    input.focus();
    setTimeout(() => {
      input.style.borderColor = '';
      const e = input.parentElement.querySelector('.inline-err');
      if (e) e.remove();
    }, 3000);
  }
})();

// ── Confirm before destructive actions ───────────────────────
(function () {
  document.querySelectorAll('a[href*="cancel"], a[href*="remove"]').forEach(a => {
    a.addEventListener('click', function (e) {
      if (!confirm('Are you sure?')) e.preventDefault();
    });
  });
})();

// ── Datetime minimum: now ─────────────────────────────────────
(function () {
  const dtInput = document.getElementById('scheduled_at');
  if (dtInput) {
    const now = new Date();
    now.setMinutes(now.getMinutes() - now.getTimezoneOffset());
    dtInput.min = now.toISOString().slice(0, 16);
  }
})();
