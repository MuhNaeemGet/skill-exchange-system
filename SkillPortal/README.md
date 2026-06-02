# SkillPortal — Skill Exchange & Session Management System

> A full-stack web application for student–teacher skill exchange, built with Python Flask, SQLite, and Jinja2.

---

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Setup & Installation](#setup--installation)
- [Demo Credentials](#demo-credentials)
- [Routes Reference](#routes-reference)
- [Screenshots](#screenshots)

---

## Overview

SkillPortal is a university-grade Database Lab semester project demonstrating:
- Relational database design with SQLite
- Full CRUD operations via Flask
- Session-based authentication (Students, Teachers, Admin)
- File upload handling
- Responsive frontend with dark mode

---

## Features

### Students
- Register & login
- Upload profile pictures
- Browse & search teachers by skill
- Book live sessions with teachers
- Send & receive messages
- Rate teachers (1–5 stars)
- View session history

### Teachers
- Register & login
- Manage bio, experience, and hourly rate
- List skills (add/remove)
- Accept/confirm/complete session requests
- View all ratings received

### Admin
- Secure admin login
- Analytics dashboard (stats overview)
- View all students, teachers, sessions
- Tab-based management interface

### General
- Dark / Light mode toggle (persisted in localStorage)
- Responsive design (mobile-first)
- Flash messages with auto-dismiss
- Scroll animations
- Form validation (client + server)

---

## Tech Stack

| Layer     | Technology            |
|-----------|-----------------------|
| Backend   | Python 3.x + Flask    |
| Database  | SQLite 3              |
| Templates | Jinja2                |
| Frontend  | HTML5, CSS3, JS (ES6) |
| Fonts     | Syne + DM Sans (Google Fonts) |

---

## Project Structure

```
SkillPortal/
├── app.py                  # Flask application & all routes
├── skillportal.sql         # Database schema + seed data
├── skillportal.db          # SQLite database (auto-generated)
├── requirements.txt
├── README.md
│
├── templates/
│   ├── layout.html         # Base template (navbar, footer, flash)
│   ├── index.html          # Home / Landing page
│   ├── register.html       # Student + Teacher registration
│   ├── login.html          # Login with role selection
│   ├── dashboard.html      # Student dashboard
│   ├── teachers.html       # Browse & search teachers
│   ├── book_session.html   # Session booking form
│   ├── messages.html       # Inbox & compose
│   ├── ratings.html        # Star rating form
│   ├── profile.html        # Profile edit + skill management
│   ├── teacher_dashboard.html  # Teacher panel
│   ├── admin_login.html    # Admin authentication
│   ├── admin_dashboard.html    # Admin panel with tabs
│   └── error.html          # 404 / 500 error pages
│
└── static/
    ├── style.css           # Full stylesheet with dark mode
    ├── script.js           # Dark mode, nav toggle, animations
    ├── uploads/            # User profile pictures
    └── img/
        └── logo.svg
```

---

## Database Schema

### Tables

| Table          | Purpose                              |
|----------------|--------------------------------------|
| students       | Student accounts                     |
| teachers       | Teacher accounts with rate/bio       |
| skills         | Master list of available skills      |
| teacher_skills | Many-to-many: teachers ↔ skills     |
| sessions       | Booking records with status          |
| ratings        | Student ratings for teachers         |
| messages       | Simple messaging system              |
| admin          | Admin login accounts                 |

### Key Constraints
- `UNIQUE` on emails in students and teachers
- `CHECK` on `sessions.status` — only `pending/confirmed/completed/cancelled`
- `CHECK` on `ratings.stars` — only 1–5
- `CHECK` on `teachers.experience` and `hourly_rate` — non-negative
- `FOREIGN KEY` with `ON DELETE CASCADE` throughout
- `UNIQUE(teacher_id, student_id)` on ratings — one review per pair

---

## Setup & Installation

### 1. Clone / Download
```bash
cd SkillPortal
```

### 2. Create virtual environment (recommended)
```bash
python -m venv venv

# Windows
venv\Scripts\activate

# macOS / Linux
source venv/bin/activate
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

### 4. Run the application
```bash
python app.py
```

The database is created automatically from `skillportal.sql` on first run.

### 5. Open in browser
```
http://localhost:5000
```

---

## Demo Credentials

| Role    | Email                 | Password     |
|---------|-----------------------|--------------|
| Student | ahmed@example.com     | student123   |
| Student | bilal@example.com     | student123   |
| Teacher | sarah@example.com     | teacher123   |
| Teacher | ali@example.com       | teacher123   |
| Admin   | (username) admin      | admin123     |

---

## Routes Reference

| Method | Route                          | Description                     |
|--------|--------------------------------|---------------------------------|
| GET    | `/`                            | Home / landing page             |
| GET    | `/register`                    | Registration form               |
| POST   | `/register`                    | Create student or teacher       |
| GET    | `/login`                       | Login form                      |
| POST   | `/login`                       | Authenticate user               |
| GET    | `/logout`                      | Clear session                   |
| GET    | `/dashboard`                   | Student dashboard               |
| GET    | `/teachers`                    | Browse + search teachers        |
| GET    | `/book/<teacher_id>`           | Booking form                    |
| POST   | `/book/<teacher_id>`           | Submit booking                  |
| GET    | `/messages`                    | Inbox + sent                    |
| POST   | `/messages`                    | Send message                    |
| GET    | `/rate/<teacher_id>`           | Rating form                     |
| POST   | `/rate/<teacher_id>`           | Submit rating                   |
| GET    | `/profile`                     | View/edit profile               |
| POST   | `/profile`                     | Update profile + upload pic     |
| POST   | `/add_skill`                   | Teacher: add skill              |
| GET    | `/remove_skill/<skill_id>`     | Teacher: remove skill           |
| GET    | `/teacher/dashboard`           | Teacher panel                   |
| GET    | `/teacher/update_session/…`    | Update session status           |
| GET    | `/admin`                       | Admin login                     |
| POST   | `/admin`                       | Admin authenticate              |
| GET    | `/admin/dashboard`             | Admin panel                     |
| GET    | `/admin/logout`                | Admin logout                    |

---

## Notes

- Passwords are stored as plain text for simplicity (appropriate for a DB lab project).
  In production, use `werkzeug.security.generate_password_hash`.
- Profile pictures are stored in `static/uploads/`.
- The database is initialised automatically if it does not exist.

---

*SkillPortal — Database Lab Semester Project*
