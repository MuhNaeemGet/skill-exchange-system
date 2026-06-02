# SkillPortal — Entity Relationship Diagram (ERD)

## ERD Description (Post-Normalization)

Below is the complete ERD for SkillPortal after applying 1NF → 3NF normalization.

---

## Entities & Attributes

### students
| Column | Type | Constraint |
|---|---|---|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| full_name | VARCHAR(100) | NOT NULL |
| email | VARCHAR(150) | NOT NULL, UNIQUE |
| password | VARCHAR(255) | NOT NULL |
| profile_pic | VARCHAR(255) | DEFAULT 'default.png' |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP |

### teachers
| Column | Type | Constraint |
|---|---|---|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| full_name | VARCHAR(100) | NOT NULL |
| email | VARCHAR(150) | NOT NULL, UNIQUE |
| password | VARCHAR(255) | NOT NULL |
| bio | TEXT | - |
| experience | INT | CHECK >= 0 |
| hourly_rate | DECIMAL(8,2) | CHECK >= 0 |
| profile_pic | VARCHAR(255) | DEFAULT 'default.png' |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP |

### skills
| Column | Type | Constraint |
|---|---|---|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| skill_name | VARCHAR(100) | NOT NULL, UNIQUE |

### teacher_skills  *(junction table)*
| Column | Type | Constraint |
|---|---|---|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| teacher_id | INT | FOREIGN KEY → teachers(id) |
| skill_id | INT | FOREIGN KEY → skills(id) |
| — | — | UNIQUE(teacher_id, skill_id) |

### sessions
| Column | Type | Constraint |
|---|---|---|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| student_id | INT | FOREIGN KEY → students(id) |
| teacher_id | INT | FOREIGN KEY → teachers(id) |
| skill | VARCHAR(100) | NOT NULL |
| message | TEXT | - |
| scheduled_at | DATETIME | NOT NULL |
| duration | INT | CHECK > 0 |
| status | VARCHAR(20) | CHECK IN (pending, confirmed, completed, cancelled) |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP |

### ratings
| Column | Type | Constraint |
|---|---|---|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| teacher_id | INT | FOREIGN KEY → teachers(id) |
| student_id | INT | FOREIGN KEY → students(id) |
| stars | TINYINT | CHECK BETWEEN 1 AND 5 |
| comment | TEXT | - |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP |
| — | — | UNIQUE(teacher_id, student_id) |

### messages
| Column | Type | Constraint |
|---|---|---|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| sender | VARCHAR(50) | NOT NULL |
| receiver | VARCHAR(50) | NOT NULL |
| message | TEXT | NOT NULL |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP |

### admin
| Column | Type | Constraint |
|---|---|---|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| username | VARCHAR(50) | NOT NULL, UNIQUE |
| password | VARCHAR(255) | NOT NULL |

---

## Relationships

| Relationship | Cardinality | Foreign Key |
|---|---|---|
| students → sessions | One-to-Many (1 : N) | sessions.student_id |
| teachers → sessions | One-to-Many (1 : N) | sessions.teacher_id |
| teachers → teacher_skills | One-to-Many (1 : N) | teacher_skills.teacher_id |
| skills → teacher_skills | One-to-Many (1 : N) | teacher_skills.skill_id |
| teachers ↔ skills | Many-to-Many (M : N) via teacher_skills | — |
| teachers → ratings | One-to-Many (1 : N) | ratings.teacher_id |
| students → ratings | One-to-Many (1 : N) | ratings.student_id |

---

## Cascade Rules

All foreign keys use:
- `ON DELETE CASCADE` — deleting a parent row removes all child rows
- `ON UPDATE CASCADE` — updating a parent PK propagates to child FKs

---

## Indexes

| Index | Table | Column(s) | Purpose |
|---|---|---|---|
| idx_student_email | students | email | Fast login lookup |
| idx_teacher_email | teachers | email | Fast login lookup |
| idx_ts_teacher | teacher_skills | teacher_id | Join optimization |
| idx_ts_skill | teacher_skills | skill_id | Join optimization |
| idx_sess_student | sessions | student_id | Dashboard queries |
| idx_sess_teacher | sessions | teacher_id | Teacher dashboard |
| idx_sess_status | sessions | status | Filtering by status |
| idx_rat_teacher | ratings | teacher_id | Avg rating queries |
| idx_rat_student | ratings | student_id | Student rating history |
| idx_msg_sender | messages | sender | Inbox queries |
| idx_msg_receiver | messages | receiver | Inbox queries |
