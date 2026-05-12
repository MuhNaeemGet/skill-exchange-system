-- ============================================================
-- SkillPortal Database Schema
-- Skill Exchange & Session Management System
-- ============================================================

PRAGMA foreign_keys = ON;

-- ────────────────────────────────────────────────────────────
-- TABLE: students
-- ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS students (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name   TEXT    NOT NULL,
    email       TEXT    NOT NULL UNIQUE,
    password    TEXT    NOT NULL,
    profile_pic TEXT    DEFAULT 'default.png',
    created_at  TEXT    DEFAULT (datetime('now'))
);

-- ────────────────────────────────────────────────────────────
-- TABLE: teachers
-- ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS teachers (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name   TEXT    NOT NULL,
    email       TEXT    NOT NULL UNIQUE,
    password    TEXT    NOT NULL,
    bio         TEXT    DEFAULT '',
    experience  INTEGER DEFAULT 0 CHECK(experience >= 0),
    hourly_rate REAL    DEFAULT 0.0 CHECK(hourly_rate >= 0),
    profile_pic TEXT    DEFAULT 'default.png',
    created_at  TEXT    DEFAULT (datetime('now'))
);

-- ────────────────────────────────────────────────────────────
-- TABLE: skills
-- ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS skills (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    skill_name TEXT    NOT NULL UNIQUE
);

-- ────────────────────────────────────────────────────────────
-- TABLE: teacher_skills  (many-to-many)
-- ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS teacher_skills (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher_id INTEGER NOT NULL,
    skill_id   INTEGER NOT NULL,
    UNIQUE(teacher_id, skill_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id)   REFERENCES skills(id)   ON DELETE CASCADE
);

-- ────────────────────────────────────────────────────────────
-- TABLE: sessions
-- ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS sessions (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id   INTEGER NOT NULL,
    teacher_id   INTEGER NOT NULL,
    skill        TEXT    NOT NULL,
    message      TEXT    DEFAULT '',
    scheduled_at TEXT    NOT NULL,
    duration     INTEGER DEFAULT 60 CHECK(duration > 0),
    status       TEXT    DEFAULT 'pending' CHECK(status IN ('pending','confirmed','completed','cancelled')),
    created_at   TEXT    DEFAULT (datetime('now')),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE
);

-- ────────────────────────────────────────────────────────────
-- TABLE: ratings
-- ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS ratings (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    stars      INTEGER NOT NULL CHECK(stars BETWEEN 1 AND 5),
    comment    TEXT    DEFAULT '',
    created_at TEXT    DEFAULT (datetime('now')),
    UNIQUE(teacher_id, student_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- ────────────────────────────────────────────────────────────
-- TABLE: messages
-- ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS messages (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    sender     TEXT    NOT NULL,
    receiver   TEXT    NOT NULL,
    message    TEXT    NOT NULL,
    created_at TEXT    DEFAULT (datetime('now'))
);

-- ────────────────────────────────────────────────────────────
-- TABLE: admin
-- ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS admin (
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT    NOT NULL UNIQUE,
    password TEXT    NOT NULL
);

-- ────────────────────────────────────────────────────────────
-- INDEXES
-- ────────────────────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_sessions_student  ON sessions(student_id);
CREATE INDEX IF NOT EXISTS idx_sessions_teacher  ON sessions(teacher_id);
CREATE INDEX IF NOT EXISTS idx_ratings_teacher   ON ratings(teacher_id);
CREATE INDEX IF NOT EXISTS idx_messages_sender   ON messages(sender);
CREATE INDEX IF NOT EXISTS idx_messages_receiver ON messages(receiver);

-- ────────────────────────────────────────────────────────────
-- DEMO DATA
-- ────────────────────────────────────────────────────────────

-- Admin account  (password: admin123)
INSERT OR IGNORE INTO admin (username, password) VALUES
    ('admin', 'admin123');

-- Skills
INSERT OR IGNORE INTO skills (skill_name) VALUES
    ('Python Programming'),
    ('Web Development'),
    ('Data Science'),
    ('Machine Learning'),
    ('UI/UX Design'),
    ('JavaScript'),
    ('Database Design'),
    ('Cybersecurity'),
    ('Mobile Development'),
    ('Cloud Computing');

-- Teachers  (password: teacher123)
INSERT OR IGNORE INTO teachers (full_name, email, password, bio, experience, hourly_rate) VALUES
    ('Dr. Sarah Ahmed',   'sarah@example.com',   'teacher123', 'Expert in Python and Data Science with 8 years of industry experience.', 8, 25.00),
    ('Prof. Ali Hassan',  'ali@example.com',     'teacher123', 'Full-stack web developer and university professor passionate about clean code.', 12, 30.00),
    ('Ms. Zara Khan',     'zara@example.com',    'teacher123', 'UI/UX specialist with a design-first philosophy. Previously at top tech companies.', 5, 20.00),
    ('Mr. Omar Siddiqui', 'omar@example.com',    'teacher123', 'Cybersecurity engineer helping students understand digital safety.', 7, 35.00),
    ('Dr. Fatima Malik',  'fatima@example.com',  'teacher123', 'Machine learning researcher focused on practical AI applications.', 10, 40.00);

-- Teacher skills
INSERT OR IGNORE INTO teacher_skills (teacher_id, skill_id) VALUES
    (1, 1), (1, 4), (1, 3),
    (2, 2), (2, 6), (2, 7),
    (3, 5), (3, 6),
    (4, 8), (4, 7),
    (5, 4), (5, 3), (5, 10);

-- Students  (password: student123)
INSERT OR IGNORE INTO students (full_name, email, password) VALUES
    ('Ahmed Raza',     'ahmed@example.com',   'student123'),
    ('Bilal Tariq',    'bilal@example.com',   'student123'),
    ('Chloe Williams', 'chloe@example.com',   'student123');

-- Sessions
INSERT OR IGNORE INTO sessions (student_id, teacher_id, skill, message, scheduled_at, duration, status) VALUES
    (1, 1, 'Python Programming', 'I need help with OOP concepts.',    '2025-06-10 10:00', 60, 'confirmed'),
    (2, 2, 'Web Development',    'Want to learn Flask routing.',       '2025-06-11 14:00', 90, 'pending'),
    (3, 3, 'UI/UX Design',       'Portfolio review and feedback.',     '2025-06-12 09:00', 60, 'completed'),
    (1, 5, 'Machine Learning',   'Intro to neural networks please.',   '2025-06-15 11:00', 120,'pending');

-- Ratings
INSERT OR IGNORE INTO ratings (teacher_id, student_id, stars, comment) VALUES
    (1, 1, 5, 'Sarah is an amazing teacher! Explained everything clearly.'),
    (2, 2, 4, 'Very knowledgeable. Sessions are well-structured.'),
    (3, 3, 5, 'Zara gave brilliant design feedback. Highly recommend!');

-- Messages
INSERT OR IGNORE INTO messages (sender, receiver, message) VALUES
    ('student_1', 'teacher_1', 'Hi Dr. Sarah, can we reschedule our session?'),
    ('teacher_1', 'student_1', 'Of course! How does Thursday afternoon work for you?'),
    ('student_2', 'teacher_2', 'Professor Ali, I have a question about REST APIs.'),
    ('teacher_2', 'student_2', 'Sure, feel free to ask anything during our next session.');
