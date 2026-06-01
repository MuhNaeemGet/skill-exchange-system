-- ============================================================
-- SKILLSWAP - Complete Database Schema
-- ============================================================
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Users (
    user_id       INTEGER PRIMARY KEY AUTOINCREMENT,
    username      TEXT    NOT NULL UNIQUE,
    email         TEXT    NOT NULL UNIQUE,
    password_hash TEXT    NOT NULL,
    bio           TEXT    DEFAULT '',
    location      TEXT    DEFAULT '',
    credits       INTEGER DEFAULT 10,
    avg_rating    REAL    DEFAULT 0.0,
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Skills (
    skill_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL UNIQUE,
    category    TEXT NOT NULL,
    description TEXT DEFAULT ''
);

CREATE TABLE IF NOT EXISTS User_Skills (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id        INTEGER NOT NULL,
    skill_id       INTEGER NOT NULL,
    type           TEXT    NOT NULL CHECK(type IN ('offer','want')),
    level          TEXT    DEFAULT 'Intermediate' CHECK(level IN ('Beginner','Intermediate','Expert')),
    hourly_credits INTEGER DEFAULT 5,
    FOREIGN KEY (user_id)  REFERENCES Users(user_id)  ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id) ON DELETE CASCADE,
    UNIQUE(user_id, skill_id, type)
);

CREATE TABLE IF NOT EXISTS Exchange_Requests (
    request_id       INTEGER PRIMARY KEY AUTOINCREMENT,
    requester_id     INTEGER NOT NULL,
    provider_id      INTEGER NOT NULL,
    skill_offered_id INTEGER NOT NULL,
    skill_wanted_id  INTEGER NOT NULL,
    status           TEXT    DEFAULT 'pending' CHECK(status IN ('pending','accepted','rejected','cancelled')),
    message          TEXT    DEFAULT '',
    created_at       DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (requester_id)     REFERENCES Users(user_id),
    FOREIGN KEY (provider_id)      REFERENCES Users(user_id),
    FOREIGN KEY (skill_offered_id) REFERENCES Skills(skill_id),
    FOREIGN KEY (skill_wanted_id)  REFERENCES Skills(skill_id)
);

CREATE TABLE IF NOT EXISTS Sessions (
    session_id          INTEGER PRIMARY KEY AUTOINCREMENT,
    request_id          INTEGER NOT NULL,
    scheduled_at        DATETIME NOT NULL,
    duration_mins       INTEGER  DEFAULT 60,
    mode                TEXT     DEFAULT 'online' CHECK(mode IN ('online','in-person')),
    status              TEXT     DEFAULT 'scheduled' CHECK(status IN ('scheduled','completed','cancelled')),
    credits_transferred INTEGER  DEFAULT 0,
    FOREIGN KEY (request_id) REFERENCES Exchange_Requests(request_id)
);

CREATE TABLE IF NOT EXISTS Reviews (
    review_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id  INTEGER NOT NULL,
    reviewer_id INTEGER NOT NULL,
    reviewee_id INTEGER NOT NULL,
    rating      INTEGER NOT NULL CHECK(rating BETWEEN 1 AND 5),
    comment     TEXT    DEFAULT '',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id)  REFERENCES Sessions(session_id),
    FOREIGN KEY (reviewer_id) REFERENCES Users(user_id),
    FOREIGN KEY (reviewee_id) REFERENCES Users(user_id),
    UNIQUE(session_id, reviewer_id)
);

CREATE TABLE IF NOT EXISTS Messages (
    message_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    sender_id   INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    request_id  INTEGER,
    content     TEXT    NOT NULL,
    sent_at     DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_read     INTEGER  DEFAULT 0,
    FOREIGN KEY (sender_id)   REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id),
    FOREIGN KEY (request_id)  REFERENCES Exchange_Requests(request_id)
);

CREATE TABLE IF NOT EXISTS Credit_Transactions (
    txn_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id    INTEGER NOT NULL,
    session_id INTEGER,
    amount     INTEGER NOT NULL,
    type       TEXT    NOT NULL CHECK(type IN ('earned','spent','bonus','refund')),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)    REFERENCES Users(user_id),
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id)
);

CREATE INDEX IF NOT EXISTS idx_us_user   ON User_Skills(user_id);
CREATE INDEX IF NOT EXISTS idx_us_skill  ON User_Skills(skill_id);
CREATE INDEX IF NOT EXISTS idx_req_req   ON Exchange_Requests(requester_id);
CREATE INDEX IF NOT EXISTS idx_req_prov  ON Exchange_Requests(provider_id);
CREATE INDEX IF NOT EXISTS idx_req_stat  ON Exchange_Requests(status);
CREATE INDEX IF NOT EXISTS idx_ses_req   ON Sessions(request_id);
CREATE INDEX IF NOT EXISTS idx_msg_recv  ON Messages(receiver_id);
CREATE INDEX IF NOT EXISTS idx_txn_user  ON Credit_Transactions(user_id);

INSERT OR IGNORE INTO Skills (name, category) VALUES
('Python','Tech'),('JavaScript','Tech'),('Web Design','Tech'),('React','Tech'),('SQL','Tech'),
('Graphic Design','Art'),('Photography','Art'),('Video Editing','Art'),('Drawing','Art'),
('Guitar','Music'),('Piano','Music'),('Singing','Music'),('Drums','Music'),
('English','Language'),('Arabic','Language'),('French','Language'),('Spanish','Language'),
('Mathematics','Education'),('Physics','Education'),('Chemistry','Education'),
('Cooking','Lifestyle'),('Yoga','Sports'),('Football Coaching','Sports'),('Swimming','Sports');
