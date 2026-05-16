-- ============================================================
-- Milestone 4 — DDL Scripts
-- SkillPortal: Skill Exchange & Session Management System
-- Database: MySQL (compatible with MySQL Workbench)
-- ============================================================

-- Drop tables if they exist (in reverse FK order)
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS teacher_skills;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS admin;

-- ────────────────────────────────────────────────────────────
-- TABLE 1: students
-- Stores registered student accounts.
-- ────────────────────────────────────────────────────────────
CREATE TABLE students (
    id          INT           NOT NULL AUTO_INCREMENT,
    full_name   VARCHAR(100)  NOT NULL,
    email       VARCHAR(150)  NOT NULL,
    password    VARCHAR(255)  NOT NULL,
    profile_pic VARCHAR(255)  DEFAULT 'default.png',
    created_at  DATETIME      DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_student_email (email)
);

-- Index on email for fast login lookups
CREATE INDEX idx_student_email ON students(email);

-- ────────────────────────────────────────────────────────────
-- TABLE 2: teachers
-- Stores registered teacher accounts with professional info.
-- ────────────────────────────────────────────────────────────
CREATE TABLE teachers (
    id          INT           NOT NULL AUTO_INCREMENT,
    full_name   VARCHAR(100)  NOT NULL,
    email       VARCHAR(150)  NOT NULL,
    password    VARCHAR(255)  NOT NULL,
    bio         TEXT          DEFAULT NULL,
    experience  INT           DEFAULT 0,
    hourly_rate DECIMAL(8,2)  DEFAULT 0.00,
    profile_pic VARCHAR(255)  DEFAULT 'default.png',
    created_at  DATETIME      DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_teacher_email (email),
    CONSTRAINT chk_experience   CHECK (experience  >= 0),
    CONSTRAINT chk_hourly_rate  CHECK (hourly_rate >= 0)
);

-- Index on email for fast login lookups
CREATE INDEX idx_teacher_email ON teachers(email);

-- ────────────────────────────────────────────────────────────
-- TABLE 3: skills
-- Master list of available skills on the platform.
-- ────────────────────────────────────────────────────────────
CREATE TABLE skills (
    id         INT          NOT NULL AUTO_INCREMENT,
    skill_name VARCHAR(100) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uq_skill_name (skill_name)
);

-- ────────────────────────────────────────────────────────────
-- TABLE 4: teacher_skills
-- Junction table — many-to-many: teachers ↔ skills
-- ────────────────────────────────────────────────────────────
CREATE TABLE teacher_skills (
    id         INT NOT NULL AUTO_INCREMENT,
    teacher_id INT NOT NULL,
    skill_id   INT NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uq_teacher_skill (teacher_id, skill_id),

    CONSTRAINT fk_ts_teacher FOREIGN KEY (teacher_id)
        REFERENCES teachers(id) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_ts_skill   FOREIGN KEY (skill_id)
        REFERENCES skills(id)   ON DELETE CASCADE ON UPDATE CASCADE
);

-- Indexes on foreign keys
CREATE INDEX idx_ts_teacher ON teacher_skills(teacher_id);
CREATE INDEX idx_ts_skill   ON teacher_skills(skill_id);

-- ────────────────────────────────────────────────────────────
-- TABLE 5: sessions
-- Booking records between students and teachers.
-- ────────────────────────────────────────────────────────────
CREATE TABLE sessions (
    id           INT          NOT NULL AUTO_INCREMENT,
    student_id   INT          NOT NULL,
    teacher_id   INT          NOT NULL,
    skill        VARCHAR(100) NOT NULL,
    message      TEXT         DEFAULT NULL,
    scheduled_at DATETIME     NOT NULL,
    duration     INT          DEFAULT 60,
    status       VARCHAR(20)  DEFAULT 'pending',
    created_at   DATETIME     DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT chk_duration CHECK (duration > 0),
    CONSTRAINT chk_status   CHECK (status IN
        ('pending','confirmed','completed','cancelled')),

    CONSTRAINT fk_sess_student FOREIGN KEY (student_id)
        REFERENCES students(id) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_sess_teacher FOREIGN KEY (teacher_id)
        REFERENCES teachers(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Indexes on foreign keys and status (frequently filtered)
CREATE INDEX idx_sess_student ON sessions(student_id);
CREATE INDEX idx_sess_teacher ON sessions(teacher_id);
CREATE INDEX idx_sess_status  ON sessions(status);

-- ────────────────────────────────────────────────────────────
-- TABLE 6: ratings
-- Student ratings for teachers. One rating per student-teacher pair.
-- ────────────────────────────────────────────────────────────
CREATE TABLE ratings (
    id         INT      NOT NULL AUTO_INCREMENT,
    teacher_id INT      NOT NULL,
    student_id INT      NOT NULL,
    stars      TINYINT  NOT NULL,
    comment    TEXT     DEFAULT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_rating_pair (teacher_id, student_id),

    CONSTRAINT chk_stars CHECK (stars BETWEEN 1 AND 5),

    CONSTRAINT fk_rat_teacher FOREIGN KEY (teacher_id)
        REFERENCES teachers(id) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_rat_student FOREIGN KEY (student_id)
        REFERENCES students(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Indexes on foreign keys
CREATE INDEX idx_rat_teacher ON ratings(teacher_id);
CREATE INDEX idx_rat_student ON ratings(student_id);

-- ────────────────────────────────────────────────────────────
-- TABLE 7: messages
-- Simple messaging between students and teachers.
-- ────────────────────────────────────────────────────────────
CREATE TABLE messages (
    id         INT          NOT NULL AUTO_INCREMENT,
    sender     VARCHAR(50)  NOT NULL,
    receiver   VARCHAR(50)  NOT NULL,
    message    TEXT         NOT NULL,
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id)
);

-- Indexes on sender and receiver for inbox queries
CREATE INDEX idx_msg_sender   ON messages(sender);
CREATE INDEX idx_msg_receiver ON messages(receiver);

-- ────────────────────────────────────────────────────────────
-- TABLE 8: admin
-- Admin accounts for platform management.
-- ────────────────────────────────────────────────────────────
CREATE TABLE admin (
    id       INT          NOT NULL AUTO_INCREMENT,
    username VARCHAR(50)  NOT NULL,
    password VARCHAR(255) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uq_admin_username (username)
);

-- ============================================================
-- END OF DDL SCRIPT
-- Commit Message: M4: DDL scripts added, EER diagram verified
-- ============================================================
