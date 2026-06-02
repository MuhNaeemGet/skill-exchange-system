# ============================================================
# SkillPortal — Skill Exchange & Session Management System
# Flask Backend  |  SQLite  |  Jinja2
# ============================================================

import os
import sqlite3
from functools import wraps
from flask import (Flask, render_template, request, redirect,
                   url_for, session, flash, g)
from werkzeug.utils import secure_filename

# ─── App Configuration ───────────────────────────────────────
app = Flask(__name__)
app.secret_key = 'skillportal_secret_2024'

BASE_DIR      = os.path.dirname(os.path.abspath(__file__))
DATABASE      = os.path.join(BASE_DIR, 'skillportal.db')
SCHEMA        = os.path.join(BASE_DIR, 'skillportal.sql')
UPLOAD_FOLDER = os.path.join(BASE_DIR, 'static', 'uploads')
ALLOWED_EXT   = {'png', 'jpg', 'jpeg', 'gif', 'webp'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
os.makedirs(UPLOAD_FOLDER, exist_ok=True)


# ─── Database Helpers ────────────────────────────────────────
def get_db():
    """Return a per-request database connection."""
    if 'db' not in g:
        g.db = sqlite3.connect(DATABASE)
        g.db.row_factory = sqlite3.Row
        g.db.execute("PRAGMA foreign_keys = ON")
    return g.db


@app.teardown_appcontext
def close_db(error):
    db = g.pop('db', None)
    if db is not None:
        db.close()


def query_db(sql, args=(), one=False):
    """Execute a SELECT and return rows."""
    cur = get_db().execute(sql, args)
    rv  = cur.fetchall()
    return (rv[0] if rv else None) if one else rv


def execute_db(sql, args=()):
    """Execute INSERT / UPDATE / DELETE."""
    db  = get_db()
    cur = db.execute(sql, args)
    db.commit()
    return cur.lastrowid


def init_db():
    """Create tables and seed demo data from schema file."""
    if not os.path.exists(DATABASE):
        db = sqlite3.connect(DATABASE)
        db.row_factory = sqlite3.Row
        with open(SCHEMA, 'r') as f:
            db.executescript(f.read())
        db.close()
        print("[SkillPortal] Database initialised.")


# ─── Auth Decorators ─────────────────────────────────────────
def login_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if 'user_id' not in session:
            flash('Please log in to continue.', 'warning')
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated


def teacher_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if session.get('role') != 'teacher':
            flash('Access restricted to teachers.', 'danger')
            return redirect(url_for('index'))
        return f(*args, **kwargs)
    return decorated


def admin_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if not session.get('admin'):
            flash('Admin access required.', 'danger')
            return redirect(url_for('admin_login'))
        return f(*args, **kwargs)
    return decorated


# ─── Utilities ───────────────────────────────────────────────
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXT


def avg_rating(teacher_id):
    row = query_db(
        "SELECT ROUND(AVG(stars), 1) AS avg FROM ratings WHERE teacher_id = ?",
        [teacher_id], one=True
    )
    return row['avg'] if row and row['avg'] else 0


# ─── Context Processor ───────────────────────────────────────
@app.context_processor
def inject_globals():
    return dict(session=session, avg_rating=avg_rating)


# ════════════════════════════════════════════════════════════
# PUBLIC ROUTES
# ════════════════════════════════════════════════════════════

@app.route('/')
def index():
    teachers = query_db(
        "SELECT * FROM teachers ORDER BY RANDOM() LIMIT 6"
    )
    skills = query_db("SELECT * FROM skills")
    return render_template('index.html', teachers=teachers, skills=skills)


# ─── Registration ────────────────────────────────────────────
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        role      = request.form.get('role', 'student')
        full_name = request.form['full_name'].strip()
        email     = request.form['email'].strip().lower()
        password  = request.form['password']

        if not full_name or not email or not password:
            flash('All fields are required.', 'danger')
            return redirect(url_for('register'))

        if role == 'student':
            existing = query_db("SELECT id FROM students WHERE email = ?", [email], one=True)
            if existing:
                flash('Email already registered.', 'danger')
                return redirect(url_for('register'))
            execute_db(
                "INSERT INTO students (full_name, email, password) VALUES (?, ?, ?)",
                [full_name, email, password]
            )
        else:
            existing = query_db("SELECT id FROM teachers WHERE email = ?", [email], one=True)
            if existing:
                flash('Email already registered.', 'danger')
                return redirect(url_for('register'))
            bio         = request.form.get('bio', '').strip()
            experience  = int(request.form.get('experience', 0) or 0)
            hourly_rate = float(request.form.get('hourly_rate', 0) or 0)
            execute_db(
                "INSERT INTO teachers (full_name, email, password, bio, experience, hourly_rate) VALUES (?,?,?,?,?,?)",
                [full_name, email, password, bio, experience, hourly_rate]
            )

        flash('Registration successful! Please log in.', 'success')
        return redirect(url_for('login'))

    return render_template('register.html')


# ─── Login ───────────────────────────────────────────────────
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        role     = request.form.get('role', 'student')
        email    = request.form['email'].strip().lower()
        password = request.form['password']

        if role == 'student':
            user = query_db(
                "SELECT * FROM students WHERE email = ? AND password = ?",
                [email, password], one=True
            )
            redirect_target = 'dashboard'
        else:
            user = query_db(
                "SELECT * FROM teachers WHERE email = ? AND password = ?",
                [email, password], one=True
            )
            redirect_target = 'teacher_dashboard'

        if user:
            session.clear()
            session['user_id']   = user['id']
            session['user_name'] = user['full_name']
            session['role']      = role
            flash(f'Welcome back, {user["full_name"]}!', 'success')
            return redirect(url_for(redirect_target))
        else:
            flash('Invalid credentials. Try again.', 'danger')

    return render_template('login.html')


# ─── Logout ──────────────────────────────────────────────────
@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out.', 'info')
    return redirect(url_for('index'))


# ════════════════════════════════════════════════════════════
# STUDENT ROUTES
# ════════════════════════════════════════════════════════════

@app.route('/dashboard')
@login_required
def dashboard():
    uid = session['user_id']
    my_sessions = query_db(
        """SELECT s.*, t.full_name AS teacher_name
           FROM sessions s JOIN teachers t ON s.teacher_id = t.id
           WHERE s.student_id = ? ORDER BY s.scheduled_at DESC""",
        [uid]
    )
    messages = query_db(
        """SELECT * FROM messages
           WHERE receiver = ? ORDER BY created_at DESC LIMIT 5""",
        [f'student_{uid}']
    )
    student = query_db("SELECT * FROM students WHERE id = ?", [uid], one=True)
    return render_template('dashboard.html',
                           student=student,
                           my_sessions=my_sessions,
                           messages=messages)


@app.route('/teachers')
@login_required
def teachers():
    search = request.args.get('q', '').strip()
    skill  = request.args.get('skill', '').strip()

    if search:
        rows = query_db(
            """SELECT DISTINCT t.* FROM teachers t
               LEFT JOIN teacher_skills ts ON t.id = ts.teacher_id
               LEFT JOIN skills sk ON ts.skill_id = sk.id
               WHERE t.full_name LIKE ? OR sk.skill_name LIKE ?""",
            [f'%{search}%', f'%{search}%']
        )
    elif skill:
        rows = query_db(
            """SELECT DISTINCT t.* FROM teachers t
               JOIN teacher_skills ts ON t.id = ts.teacher_id
               JOIN skills sk ON ts.skill_id = sk.id
               WHERE sk.skill_name = ?""",
            [skill]
        )
    else:
        rows = query_db("SELECT * FROM teachers ORDER BY id")

    all_skills = query_db("SELECT * FROM skills ORDER BY skill_name")

    teachers_list = []
    for t in rows:
        t_dict   = dict(t)
        skills_r = query_db(
            """SELECT sk.skill_name FROM skills sk
               JOIN teacher_skills ts ON sk.id = ts.skill_id
               WHERE ts.teacher_id = ?""",
            [t['id']]
        )
        t_dict['skills'] = [s['skill_name'] for s in skills_r]
        t_dict['rating'] = avg_rating(t['id'])
        teachers_list.append(t_dict)

    return render_template('teachers.html',
                           teachers=teachers_list,
                           all_skills=all_skills,
                           search=search)


@app.route('/book/<int:teacher_id>', methods=['GET', 'POST'])
@login_required
def book_session(teacher_id):
    teacher = query_db("SELECT * FROM teachers WHERE id = ?", [teacher_id], one=True)
    if not teacher:
        flash('Teacher not found.', 'danger')
        return redirect(url_for('teachers'))

    skills_r = query_db(
        """SELECT sk.skill_name FROM skills sk
           JOIN teacher_skills ts ON sk.id = ts.skill_id
           WHERE ts.teacher_id = ?""",
        [teacher_id]
    )
    teacher_skills = [s['skill_name'] for s in skills_r]

    if request.method == 'POST':
        skill        = request.form['skill']
        message      = request.form.get('message', '').strip()
        scheduled_at = request.form['scheduled_at']
        duration     = int(request.form.get('duration', 60) or 60)

        execute_db(
            """INSERT INTO sessions (student_id, teacher_id, skill, message, scheduled_at, duration)
               VALUES (?, ?, ?, ?, ?, ?)""",
            [session['user_id'], teacher_id, skill, message, scheduled_at, duration]
        )
        flash('Session booked successfully!', 'success')
        return redirect(url_for('dashboard'))

    return render_template('book_session.html',
                           teacher=teacher,
                           teacher_skills=teacher_skills)


@app.route('/messages', methods=['GET', 'POST'])
@login_required
def messages():
    role   = session['role']
    uid    = session['user_id']
    prefix = f'{role}_{uid}'

    if request.method == 'POST':
        receiver = request.form['receiver'].strip()
        msg_text = request.form['message'].strip()
        if msg_text and receiver:
            execute_db(
                "INSERT INTO messages (sender, receiver, message) VALUES (?, ?, ?)",
                [prefix, receiver, msg_text]
            )
            flash('Message sent!', 'success')

    inbox = query_db(
        "SELECT * FROM messages WHERE receiver = ? ORDER BY created_at DESC",
        [prefix]
    )
    sent  = query_db(
        "SELECT * FROM messages WHERE sender = ? ORDER BY created_at DESC",
        [prefix]
    )
    return render_template('messages.html', inbox=inbox, sent=sent)


@app.route('/rate/<int:teacher_id>', methods=['GET', 'POST'])
@login_required
def rate_teacher(teacher_id):
    teacher = query_db("SELECT * FROM teachers WHERE id = ?", [teacher_id], one=True)
    if not teacher:
        flash('Teacher not found.', 'danger')
        return redirect(url_for('teachers'))

    if request.method == 'POST':
        stars   = int(request.form['stars'])
        comment = request.form.get('comment', '').strip()
        uid     = session['user_id']

        existing = query_db(
            "SELECT id FROM ratings WHERE teacher_id = ? AND student_id = ?",
            [teacher_id, uid], one=True
        )
        if existing:
            execute_db(
                "UPDATE ratings SET stars = ?, comment = ? WHERE teacher_id = ? AND student_id = ?",
                [stars, comment, teacher_id, uid]
            )
        else:
            execute_db(
                "INSERT INTO ratings (teacher_id, student_id, stars, comment) VALUES (?,?,?,?)",
                [teacher_id, uid, stars, comment]
            )
        flash('Rating submitted. Thank you!', 'success')
        return redirect(url_for('teachers'))

    existing_rating = query_db(
        "SELECT * FROM ratings WHERE teacher_id = ? AND student_id = ?",
        [teacher_id, session['user_id']], one=True
    )
    return render_template('ratings.html', teacher=teacher, existing=existing_rating)


@app.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    uid  = session['user_id']
    role = session['role']

    if role == 'student':
        user = query_db("SELECT * FROM students WHERE id = ?", [uid], one=True)
    else:
        user = query_db("SELECT * FROM teachers WHERE id = ?", [uid], one=True)

    if request.method == 'POST':
        pic_filename = user['profile_pic']

        if 'profile_pic' in request.files:
            f = request.files['profile_pic']
            if f and f.filename and allowed_file(f.filename):
                pic_filename = secure_filename(f.filename)
                f.save(os.path.join(app.config['UPLOAD_FOLDER'], pic_filename))

        if role == 'student':
            execute_db(
                "UPDATE students SET full_name = ?, profile_pic = ? WHERE id = ?",
                [request.form['full_name'], pic_filename, uid]
            )
        else:
            execute_db(
                """UPDATE teachers SET full_name=?, bio=?, experience=?,
                   hourly_rate=?, profile_pic=? WHERE id=?""",
                [request.form['full_name'],
                 request.form.get('bio', ''),
                 int(request.form.get('experience', 0) or 0),
                 float(request.form.get('hourly_rate', 0) or 0),
                 pic_filename, uid]
            )
        session['user_name'] = request.form['full_name']
        flash('Profile updated!', 'success')
        return redirect(url_for('profile'))

    extra = {}
    if role == 'teacher':
        all_skills    = query_db("SELECT * FROM skills ORDER BY skill_name")
        teacher_skill_ids = [r['skill_id'] for r in query_db(
            "SELECT skill_id FROM teacher_skills WHERE teacher_id = ?", [uid]
        )]
        extra = {'all_skills': all_skills, 'teacher_skill_ids': teacher_skill_ids}

    return render_template('profile.html', user=user, **extra)


@app.route('/add_skill', methods=['POST'])
@login_required
@teacher_required
def add_skill():
    uid      = session['user_id']
    skill_id = request.form.get('skill_id')
    if skill_id:
        try:
            execute_db(
                "INSERT OR IGNORE INTO teacher_skills (teacher_id, skill_id) VALUES (?, ?)",
                [uid, int(skill_id)]
            )
            flash('Skill added!', 'success')
        except Exception:
            flash('Could not add skill.', 'danger')
    return redirect(url_for('profile'))


@app.route('/remove_skill/<int:skill_id>')
@login_required
@teacher_required
def remove_skill(skill_id):
    execute_db(
        "DELETE FROM teacher_skills WHERE teacher_id = ? AND skill_id = ?",
        [session['user_id'], skill_id]
    )
    flash('Skill removed.', 'info')
    return redirect(url_for('profile'))


# ════════════════════════════════════════════════════════════
# TEACHER ROUTES
# ════════════════════════════════════════════════════════════

@app.route('/teacher/dashboard')
@login_required
@teacher_required
def teacher_dashboard():
    tid = session['user_id']
    my_sessions = query_db(
        """SELECT s.*, st.full_name AS student_name
           FROM sessions s JOIN students st ON s.student_id = st.id
           WHERE s.teacher_id = ? ORDER BY s.scheduled_at DESC""",
        [tid]
    )
    my_ratings = query_db(
        """SELECT r.*, st.full_name AS student_name
           FROM ratings r JOIN students st ON r.student_id = st.id
           WHERE r.teacher_id = ? ORDER BY r.created_at DESC""",
        [tid]
    )
    teacher   = query_db("SELECT * FROM teachers WHERE id = ?", [tid], one=True)
    my_skills = query_db(
        """SELECT sk.skill_name FROM skills sk
           JOIN teacher_skills ts ON sk.id = ts.skill_id
           WHERE ts.teacher_id = ?""",
        [tid]
    )
    messages_count = query_db(
        "SELECT COUNT(*) AS c FROM messages WHERE receiver = ?",
        [f'teacher_{tid}'], one=True
    )['c']

    return render_template('teacher_dashboard.html',
                           teacher=teacher,
                           my_sessions=my_sessions,
                           my_ratings=my_ratings,
                           my_skills=my_skills,
                           messages_count=messages_count,
                           avg=avg_rating(tid))


@app.route('/teacher/update_session/<int:session_id>/<status>')
@login_required
@teacher_required
def update_session(session_id, status):
    if status not in ('confirmed', 'completed', 'cancelled'):
        flash('Invalid status.', 'danger')
        return redirect(url_for('teacher_dashboard'))
    execute_db(
        "UPDATE sessions SET status = ? WHERE id = ? AND teacher_id = ?",
        [status, session_id, session['user_id']]
    )
    flash(f'Session marked as {status}.', 'success')
    return redirect(url_for('teacher_dashboard'))


# ════════════════════════════════════════════════════════════
# ADMIN ROUTES
# ════════════════════════════════════════════════════════════

@app.route('/admin', methods=['GET', 'POST'])
def admin_login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        admin    = query_db(
            "SELECT * FROM admin WHERE username = ? AND password = ?",
            [username, password], one=True
        )
        if admin:
            session.clear()
            session['admin']    = True
            session['admin_id'] = admin['id']
            flash('Admin logged in.', 'success')
            return redirect(url_for('admin_dashboard'))
        flash('Invalid admin credentials.', 'danger')
    return render_template('admin_login.html')


@app.route('/admin/dashboard')
@admin_required
def admin_dashboard():
    students     = query_db("SELECT * FROM students ORDER BY id")
    teachers_all = query_db("SELECT * FROM teachers ORDER BY id")
    all_sessions = query_db(
        """SELECT s.*, st.full_name AS student_name, t.full_name AS teacher_name
           FROM sessions s
           JOIN students st ON s.student_id = st.id
           JOIN teachers t  ON s.teacher_id = t.id
           ORDER BY s.created_at DESC"""
    )
    stats = {
        'students': len(students),
        'teachers': len(teachers_all),
        'sessions': len(all_sessions),
        'ratings' : query_db("SELECT COUNT(*) AS c FROM ratings", one=True)['c'],
        'messages': query_db("SELECT COUNT(*) AS c FROM messages", one=True)['c'],
    }
    return render_template('admin_dashboard.html',
                           students=students,
                           teachers=teachers_all,
                           all_sessions=all_sessions,
                           stats=stats)


@app.route('/admin/logout')
def admin_logout():
    session.clear()
    flash('Admin logged out.', 'info')
    return redirect(url_for('admin_login'))


# ─── Error Handlers ──────────────────────────────────────────
@app.errorhandler(404)
def not_found(e):
    return render_template('error.html', code=404,
                           message='Page Not Found'), 404


@app.errorhandler(500)
def server_error(e):
    return render_template('error.html', code=500,
                           message='Internal Server Error'), 500


# ─── Entry Point ─────────────────────────────────────────────
if __name__ == '__main__':
    init_db()
    app.run(debug=True, host='0.0.0.0', port=5000)
