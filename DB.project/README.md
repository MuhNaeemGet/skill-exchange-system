# SkillSwap — Complete Project
## Online Skill Exchange System

---

## Quick Start

### 1. Install dependencies
```bash
pip install flask bcrypt PyJWT flask-cors
```

### 2. Run the server
```bash
python app.py
```

### 3. Open in browser
```
http://localhost:5000
```

The database (`skillswap.db`) is created automatically on first run.

---

## Project Structure

```
skillswap/
├── app.py              ← Flask backend (all API routes)
├── database.sql        ← SQLite schema + seed data
├── requirements.txt    ← Python dependencies
├── css/
│   └── styles.css      ← All page styles
├── js/
│   └── shared.js       ← Shared helpers, navbar, API
└── templates/
    ├── project.html    ← Landing / home page
    ├── login.html      ← Sign in
    ├── register.html   ← Create account
    ├── dashboard.html  ← Main dashboard
    ├── skills.html     ← Browse skills
    ├── users.html      ← Matches
    ├── request.html    ← Exchange requests
    ├── teach.html      ← Sessions
    ├── profile.html    ← My profile & skills
    └── wallet.html     ← Credit wallet
```

---

## Pages

| Page | URL | Description |
|------|-----|-------------|
| Home | / or project.html | Landing page with features |
| Login | login.html | Sign in |
| Register | register.html | Create account |
| Dashboard | dashboard.html | Overview, stats, quick actions |
| Browse | skills.html | Search users by skill |
| Matches | users.html | Auto-matched users |
| Requests | request.html | Send/accept/reject requests |
| Sessions | teach.html | Schedule, complete, review |
| Profile | profile.html | Edit bio, manage skills |
| Wallet | wallet.html | Credits & transactions |

---

## API Endpoints

| Method | Endpoint | Auth |
|--------|----------|------|
| POST | /api/auth/register | No |
| POST | /api/auth/login | No |
| GET | /api/users/me | Yes |
| GET/PUT | /api/users/:id | Yes |
| GET | /api/skills | No |
| POST/DELETE | /api/user-skills | Yes |
| GET | /api/browse | Yes |
| GET | /api/matches | Yes |
| GET/POST | /api/requests | Yes |
| PUT | /api/requests/:id | Yes |
| GET/POST | /api/sessions | Yes |
| PUT | /api/sessions/:id/complete | Yes |
| POST | /api/reviews | Yes |
| GET/POST | /api/messages | Yes |
| GET | /api/messages/unread | Yes |
| GET | /api/wallet | Yes |
