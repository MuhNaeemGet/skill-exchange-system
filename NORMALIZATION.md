# Milestone 2 — Normalization Document
# SkillPortal: Skill Exchange & Session Management System

---

## Overview

This document applies First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF) to every table in the SkillPortal database schema. For each table and each normal form, we state whether a change was needed, what the issue was, what change was made, and why.

---

## Table 1: `students`

**Columns:** id, full_name, email, password, profile_pic, created_at

### 1NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** Every column holds a single atomic value. There are no repeating groups or multi-valued attributes. Each row is uniquely identified by the primary key `id`. The table satisfies 1NF as designed.

### 2NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** The primary key is a single column (`id`), so partial dependency is not possible. Every non-key attribute — `full_name`, `email`, `password`, `profile_pic`, `created_at` — depends entirely on `id`. The table satisfies 2NF.

### 3NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** There are no transitive dependencies. No non-key column determines another non-key column. `email` is unique but it does not functionally determine any other attribute in a way that creates a transitive chain. The table satisfies 3NF.

---

## Table 2: `teachers`

**Columns:** id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at

### 1NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** All columns are atomic. There are no lists or repeating groups. Skills taught by a teacher are intentionally separated into the `teacher_skills` table, so no multi-valued attribute exists here. The table satisfies 1NF.

### 2NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** The primary key is a single column (`id`). All attributes describe the teacher directly. There is no composite key, so partial dependency cannot exist. The table satisfies 2NF.

### 3NF
- **Issue:** `hourly_rate` could theoretically depend on `experience`, creating a transitive dependency (id → experience → hourly_rate).
- **Change Made:** We reviewed the business logic and confirmed that `hourly_rate` is set independently by each teacher and is not derived from `experience`. Two teachers with equal experience can charge different rates. Therefore no structural change is needed, but this dependency was explicitly reviewed.
- **Justification:** Since `hourly_rate` is an independent attribute entered by the teacher and not computed from any other column, no transitive dependency exists. The table satisfies 3NF.

---

## Table 3: `skills`

**Columns:** id, skill_name

### 1NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** The table has two atomic columns. Each skill has one name. `id` is the primary key. The table satisfies 1NF.

### 2NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** Single-column primary key. `skill_name` fully depends on `id`. The table satisfies 2NF.

### 3NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** With only one non-key attribute (`skill_name`), no transitive dependency is possible. The table satisfies 3NF.

---

## Table 4: `teacher_skills`

**Columns:** id, teacher_id, skill_id

### 1NF
- **Issue:** In an earlier draft, skills were stored as a comma-separated string inside the `teachers` table (e.g., `skills = "Python, Flask, SQL"`). This violated 1NF.
- **Change Made:** Skills were extracted into a separate `skills` table, and a junction table `teacher_skills` was created to represent the many-to-many relationship between teachers and skills.
- **Justification:** Storing multiple values in a single column violates atomicity. Separating skills into their own table and linking them through `teacher_skills` ensures each cell holds exactly one value and eliminates the repeating group. The table now satisfies 1NF.

### 2NF
- **Issue:** Potential partial dependency. The composite key is `(teacher_id, skill_id)`. If any attribute depended only on `teacher_id` or only on `skill_id`, it would violate 2NF.
- **Change Made:** No additional attributes were added to this table beyond the surrogate key `id`. Teacher details stay in `teachers`; skill details stay in `skills`.
- **Justification:** The table contains only foreign keys and a surrogate primary key. There are no non-key attributes that could be partially dependent. The table satisfies 2NF.

### 3NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** With no non-key attributes, transitive dependency is impossible. The table satisfies 3NF.

---

## Table 5: `sessions`

**Columns:** id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at

### 1NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** All columns hold single atomic values. `skill` stores the name of the skill being taught in this session as a plain string. `status` is a single-value CHECK-constrained column. No repeating groups exist. The table satisfies 1NF.

### 2NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** The primary key is a single column (`id`). All attributes describe a specific session booking. There is no composite key, so partial dependency cannot occur. The table satisfies 2NF.

### 3NF
- **Issue:** `skill` (text) in sessions is a denormalized copy of skill name. One could argue it should be a foreign key to the `skills` table to avoid redundancy.
- **Change Made:** After analysis, we kept `skill` as a plain text column in `sessions` deliberately. The reason is that a skill name in the `skills` table may change in the future, but a historical session record must preserve the exact skill name that was booked at that point in time. This is an intentional design decision for data integrity of historical records.
- **Justification:** This is an intentional denormalization for historical accuracy. The `skill` value in a session is a snapshot, not a live reference. This does not violate 3NF because the value is determined by the session itself, not transitively through another non-key column. The table satisfies 3NF.

---

## Table 6: `ratings`

**Columns:** id, teacher_id, student_id, stars, comment, created_at

### 1NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** All values are atomic. `stars` is a single integer. `comment` is a single text value. There are no multi-valued attributes. The table satisfies 1NF.

### 2NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** Primary key is `id` (single column). All attributes — `stars`, `comment`, `created_at` — describe the specific rating event. The table satisfies 2NF.

### 3NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** No non-key attribute determines another. `stars` does not determine `comment` or vice versa. There is no transitive dependency. The table satisfies 3NF.

---

## Table 7: `messages`

**Columns:** id, sender, receiver, message, created_at

### 1NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** Each column holds one atomic value. `sender` and `receiver` store a formatted string identifier (e.g., `student_1`, `teacher_2`). The table satisfies 1NF.

### 2NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** Single primary key `id`. All attributes describe the message event. The table satisfies 2NF.

### 3NF
- **Issue:** `sender` and `receiver` store role-prefixed IDs as strings rather than foreign keys. This was flagged during review.
- **Change Made:** We reviewed the design and determined that the messaging system supports both student-to-teacher and teacher-to-student communication without a fixed direction. Using string identifiers is acceptable for this scope. A future improvement would be to split into `sender_role` and `sender_id` columns.
- **Justification:** The string format is consistent and atomic. No transitive dependency exists between the columns. While a more normalized approach could separate role and ID, this does not violate 3NF as currently structured. The table satisfies 3NF.

---

## Table 8: `admin`

**Columns:** id, username, password

### 1NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** Two atomic attributes. Each row is one admin account. The table satisfies 1NF.

### 2NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** Single primary key. Both attributes fully depend on `id`. The table satisfies 2NF.

### 3NF
- **Issue:** None.
- **Change Made:** No change required.
- **Justification:** `password` does not depend on `username` or any other non-key column. No transitive dependency exists. The table satisfies 3NF.

---

## Step 2 — Duplicate & Redundancy Check

| Table | Issue Found | Action Taken |
|---|---|---|
| students | None | No change |
| teachers | `skills` column existed in early draft | Removed; moved to `teacher_skills` junction table |
| skills | None | No change |
| teacher_skills | None | UNIQUE(teacher_id, skill_id) prevents duplicate entries |
| sessions | None | No change |
| ratings | Duplicate rating possible | Added UNIQUE(teacher_id, student_id) constraint |
| messages | None | No change |
| admin | None | No change |

---

## Step 3 — ERD Summary (Post-Normalization)

All relationships confirmed after normalization:

| Relationship | Type | Foreign Key |
|---|---|---|
| students → sessions | 1 : Many | sessions.student_id |
| teachers → sessions | 1 : Many | sessions.teacher_id |
| teachers → teacher_skills | 1 : Many | teacher_skills.teacher_id |
| skills → teacher_skills | 1 : Many | teacher_skills.skill_id |
| teachers → ratings | 1 : Many | ratings.teacher_id |
| students → ratings | 1 : Many | ratings.student_id |

---

## Commit Message

```
M2: Applied 1NF-3NF normalization to all 8 tables, updated ERD and schema
```
