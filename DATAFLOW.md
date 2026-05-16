# Milestone 3 — Dataset Preprocessing & Dataflow

---

## Step 1 — Synthetic Data Summary

Since SkillPortal is a web application platform (not based on a real-world dataset), structured synthetic data was generated using a Python script. All data is realistic and meaningful, designed to properly populate all core tables.

| Table | Rows Generated | Method |
|---|---|---|
| students | 75 | Python random + name lists |
| teachers | 50 | Python random + name lists |
| skills | 10 | Fixed domain list |
| teacher_skills | 126 | Random unique (teacher, skill) pairs |
| sessions | 100 | Random student-teacher bookings |
| ratings | 60 | Random unique (teacher, student) pairs |
| messages | 80 | Random sender/receiver pairs |
| admin | 1 | Fixed admin account |

### Data Quality Checks Applied
- No duplicate emails in `students` or `teachers`
- No duplicate `(teacher_id, skill_id)` pairs in `teacher_skills`
- No duplicate `(teacher_id, student_id)` pairs in `ratings`
- All foreign key values reference valid parent rows
- `status` values in `sessions` restricted to allowed set
- `stars` values in `ratings` restricted to 1–5
- No NULL in required fields (name, email, password)
- `hourly_rate` values between 10.00 and 60.00 (realistic range)
- `experience` values between 1 and 20 years

---

## Step 2 — Dataflow Description

This section describes exactly how data enters, moves through, and exits the SkillPortal database.

### Entry Points (Where Data Comes In)

Data enters the SkillPortal system through three sources:

1. **Student Registration Form** → inserts one row into `students` (full_name, email, password, profile_pic)
2. **Teacher Registration Form** → inserts one row into `teachers` (full_name, email, password, bio, experience, hourly_rate, profile_pic)
3. **Admin Panel** → the admin account is pre-seeded in the `admin` table; no public registration exists for admin

Once logged in, users generate further data through actions:

| User Action | Table Written |
|---|---|
| Book a session | `sessions` |
| Send a message | `messages` |
| Rate a teacher | `ratings` |
| Teacher adds a skill | `teacher_skills` |
| Teacher updates profile | `teachers` (UPDATE) |
| Student uploads profile picture | `students` (UPDATE) |

### Movement Through the Database (How Data Flows)

```
[Student Registers]
        │
        ▼
   students table
        │
        ├──► sessions table (student books a session)
        │         │
        │         └──► teachers table (session links to teacher)
        │
        ├──► ratings table (student rates a teacher after session)
        │         │
        │         └──► teachers table (rating links to teacher)
        │
        └──► messages table (student sends message to teacher)

[Teacher Registers]
        │
        ▼
   teachers table
        │
        ├──► teacher_skills table (teacher lists their skills)
        │         │
        │         └──► skills table (each skill is a reference)
        │
        ├──► sessions table (teacher receives session bookings)
        │
        └──► ratings table (teacher receives student ratings)
```

### Dependency Order (Which Tables Must Be Populated First)

When loading data, the following order must be followed to satisfy foreign key constraints:

1. `skills` — no dependencies
2. `admin` — no dependencies
3. `students` — no dependencies
4. `teachers` — no dependencies
5. `teacher_skills` — depends on `teachers` and `skills`
6. `sessions` — depends on `students` and `teachers`
7. `ratings` — depends on `teachers` and `students`
8. `messages` — references students and teachers by string ID (no FK constraint)

### Exit Points (What Comes Out)

Data exits the system through the following outputs:

| Output | Source Tables | Who Sees It |
|---|---|---|
| Teacher listing page | teachers, teacher_skills, skills, ratings | All visitors |
| Student dashboard | sessions (JOIN teachers) | Logged-in student |
| Teacher dashboard | sessions (JOIN students), ratings (JOIN students) | Logged-in teacher |
| Admin dashboard | students, teachers, sessions (with JOINs) | Admin only |
| Messages inbox | messages (WHERE receiver = current user) | Logged-in user |
| Average rating display | ratings (AVG aggregate) | All visitors |
| Session booking confirmation | sessions | Student + Teacher |

---

## Step 3 — CSV Files

The following CSV files are included in the `/csv/` folder of this repository:

- `students.csv` — 75 rows
- `teachers.csv` — 50 rows
- `skills.csv` — 10 rows
- `teacher_skills.csv` — 126 rows
- `sessions.csv` — 100 rows
- `ratings.csv` — 60 rows
- `messages.csv` — 80 rows
- `admin.csv` — 1 row

---

## Commit Message

```
M3: Synthetic data generated (50-100 rows/table); dataflow documented
```
