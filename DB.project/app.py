# ============================================================
# SKILLSWAP - Complete Flask Backend
# pip install flask PyJWT flask-cors
# python app.py  →  http://localhost:5000
# ============================================================

import sqlite3, hashlib, jwt, os
from datetime import datetime, timedelta
from functools import wraps
from flask import Flask, request, jsonify, g, send_from_directory
from flask_cors import CORS

app = Flask(__name__, static_folder='static', template_folder='templates')
app.config['SECRET_KEY'] = 'skillswap_2024_secret'
CORS(app)
DATABASE = 'skillswap.db'

# ── DB ────────────────────────────────────────────────────────
def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect(DATABASE)
        g.db.row_factory = sqlite3.Row
        g.db.execute("PRAGMA foreign_keys = ON")
    return g.db

@app.teardown_appcontext
def close_db(e):
    db = g.pop('db', None)
    if db: db.close()

def init_db():
    db = sqlite3.connect(DATABASE)
    db.execute("PRAGMA foreign_keys = ON")
    with open('database.sql') as f:
        db.executescript(f.read())
    db.commit()
    db.close()
    print("  ✓ Database ready")

def q(sql, args=(), one=False):
    cur = get_db().execute(sql, args)
    rv  = cur.fetchall()
    return (rv[0] if rv else None) if one else rv

def row(r):   return dict(r) if r else None
def rows(rs): return [dict(r) for r in rs]

def hash_pw(pw):
    return hashlib.sha256(pw.encode()).hexdigest()

# ── JWT ───────────────────────────────────────────────────────
def make_token(uid):
    return jwt.encode(
        {'user_id': uid, 'exp': datetime.utcnow() + timedelta(days=7)},
        app.config['SECRET_KEY'], algorithm='HS256'
    )

def token_required(f):
    @wraps(f)
    def dec(*a, **kw):
        tok = None
        ah  = request.headers.get('Authorization', '')
        if ah.startswith('Bearer '): tok = ah[7:]
        if not tok:
            return jsonify({'error': 'Token missing'}), 401
        try:
            data  = jwt.decode(tok, app.config['SECRET_KEY'], algorithms=['HS256'])
            g.uid = data['user_id']
        except:
            return jsonify({'error': 'Invalid or expired token'}), 401
        return f(*a, **kw)
    return dec

# ── Serve pages & static ──────────────────────────────────────
@app.route('/')
def index():
    return send_from_directory('templates', 'project.html')

@app.route('/static/css/<path:fn>')
def serve_css(fn):
    return send_from_directory('static/css', fn)

@app.route('/static/js/<path:fn>')
def serve_js(fn):
    return send_from_directory('static/js', fn)

@app.route('/<path:fn>')
def pages(fn):
    try:
        return send_from_directory('templates', fn)
    except:
        return send_from_directory('templates', 'project.html')

# ── AUTH ──────────────────────────────────────────────────────
@app.route('/api/auth/register', methods=['POST'])
def register():
    d  = request.get_json() or {}
    un = (d.get('username') or '').strip()
    em = (d.get('email') or '').strip().lower()
    pw = d.get('password', '')
    if not un or not em or not pw:
        return jsonify({'error': 'All fields required'}), 400
    if len(pw) < 6:
        return jsonify({'error': 'Password min 6 characters'}), 400
    ph = hash_pw(pw)
    db = get_db()
    try:
        db.execute(
            "INSERT INTO Users(username,email,password_hash) VALUES(?,?,?)",
            (un, em, ph)
        )
        db.commit()
    except sqlite3.IntegrityError:
        return jsonify({'error': 'Username or email already exists'}), 409
    u = row(q("SELECT * FROM Users WHERE email=?", (em,), one=True))
    return jsonify({'token': make_token(u['user_id']), 'user': u}), 201

@app.route('/api/auth/login', methods=['POST'])
def login():
    d  = request.get_json() or {}
    em = (d.get('email') or '').strip().lower()
    pw = d.get('password', '')
    u  = q("SELECT * FROM Users WHERE email=?", (em,), one=True)
    if not u or u['password_hash'] != hash_pw(pw):
        return jsonify({'error': 'Invalid email or password'}), 401
    return jsonify({'token': make_token(u['user_id']), 'user': row(u)})

# ── USERS ─────────────────────────────────────────────────────
@app.route('/api/users/me', methods=['GET'])
@token_required
def me():
    return jsonify({'user': row(q("SELECT * FROM Users WHERE user_id=?", (g.uid,), one=True))})

@app.route('/api/users/<int:uid>', methods=['GET'])
@token_required
def get_user(uid):
    u = row(q("SELECT * FROM Users WHERE user_id=?", (uid,), one=True))
    if not u: return jsonify({'error': 'Not found'}), 404
    sk = rows(q("""SELECT us.*,s.name,s.category
                   FROM User_Skills us JOIN Skills s ON us.skill_id=s.skill_id
                   WHERE us.user_id=?""", (uid,)))
    rv = rows(q("""SELECT r.*,u.username AS reviewer_name
                   FROM Reviews r JOIN Users u ON r.reviewer_id=u.user_id
                   WHERE r.reviewee_id=? ORDER BY r.created_at DESC LIMIT 10""", (uid,)))
    return jsonify({'user': u, 'skills': sk, 'reviews': rv})

@app.route('/api/users/<int:uid>', methods=['PUT'])
@token_required
def update_user(uid):
    if g.uid != uid: return jsonify({'error': 'Forbidden'}), 403
    d  = request.get_json() or {}
    db = get_db()
    db.execute("UPDATE Users SET bio=?,location=? WHERE user_id=?",
               (d.get('bio', ''), d.get('location', ''), uid))
    db.commit()
    return jsonify({'user': row(q("SELECT * FROM Users WHERE user_id=?", (uid,), one=True))})

# ── SKILLS ────────────────────────────────────────────────────
@app.route('/api/skills', methods=['GET'])
def get_skills():
    cat = request.args.get('category', '')
    if cat:
        return jsonify({'skills': rows(q("SELECT * FROM Skills WHERE category=? ORDER BY name", (cat,)))})
    return jsonify({'skills': rows(q("SELECT * FROM Skills ORDER BY category,name"))})

@app.route('/api/user-skills', methods=['POST'])
@token_required
def add_user_skill():
    d  = request.get_json() or {}


    if not d.get('skill_id') or not d.get('type'):
        return jsonify({'error': 'Missing data'}), 400
    

    db = get_db()
    try:
        db.execute(
            "INSERT INTO User_Skills(user_id,skill_id,type,level,hourly_credits) VALUES(?,?,?,?,?)",
            (g.uid, d.get('skill_id'), d['type'], d.get('level', 'Intermediate'), d.get('hourly_credits', 5))
        )
        db.commit()
    except sqlite3.IntegrityError:
        return jsonify({'error': 'Skill already added'}), 409
    
    return jsonify({'message': 'Skill added'}), 201
@app.route('/api/skills', methods=['POST'])
@token_required
def create_skill():
    d = request.get_json() or {}
    name = (d.get('name') or '').strip()
    category = (d.get('category') or 'Other').strip()

    if not name:
        return jsonify({'error': 'Skill name required'}), 400

    # Normalize to avoid duplicates
    name = name.lower().capitalize()

    db = get_db()
    try:
        db.execute(
            "INSERT INTO Skills(name, category) VALUES(?, ?)",
            (name, category)
        )
        db.commit()
    except sqlite3.IntegrityError:
        return jsonify({'error': 'Skill already exists'}), 409

    skill = q("SELECT * FROM Skills WHERE name=?", (name,), one=True)
    return jsonify({'skill': row(skill)}), 201

@app.route('/api/user-skills/<int:sid>', methods=['DELETE'])
@token_required
def del_user_skill(sid):
    r2 = q("SELECT * FROM User_Skills WHERE id=?", (sid,), one=True)
    if not r2 or r2['user_id'] != g.uid:
        return jsonify({'error': 'Not found'}), 404
    db = get_db()
    db.execute("DELETE FROM User_Skills WHERE id=?", (sid,))
    db.commit()
    return jsonify({'message': 'Removed'})

# ── BROWSE & MATCH ────────────────────────────────────────────
@app.route('/api/browse', methods=['GET'])
@token_required
def browse():
    skill  = request.args.get('skill', '')
    cat    = request.args.get('category', '')
    sql    = """SELECT DISTINCT u.user_id,u.username,u.bio,u.location,
                u.avg_rating,u.credits,s.name AS skill_name,s.category,
                s.skill_id,us.level,us.hourly_credits
                FROM Users u
                JOIN User_Skills us ON us.user_id=u.user_id AND us.type='offer'
                JOIN Skills s ON s.skill_id=us.skill_id
                WHERE u.user_id!=?"""
    params = [g.uid]
    if skill: sql += " AND s.name LIKE ?";  params.append(f'%{skill}%')
    if cat:   sql += " AND s.category=?";   params.append(cat)
    sql += " ORDER BY u.avg_rating DESC LIMIT 60"
    return jsonify({'users': rows(q(sql, params))})

@app.route('/api/matches', methods=['GET'])
@token_required
def matches():
    offered = [r['skill_id'] for r in q("SELECT skill_id FROM User_Skills WHERE user_id=? AND type='offer'", (g.uid,))]
    wanted  = [r['skill_id'] for r in q("SELECT skill_id FROM User_Skills WHERE user_id=? AND type='want'",  (g.uid,))]
    if not offered or not wanted: return jsonify({'matches': []})
    po  = ','.join('?' * len(offered))
    pw2 = ','.join('?' * len(wanted))
    sql = f"""SELECT DISTINCT u.user_id,u.username,u.bio,u.location,u.avg_rating,
              s1.name AS they_offer, s2.name AS they_want
              FROM Users u
              JOIN User_Skills uo ON uo.user_id=u.user_id AND uo.type='offer' AND uo.skill_id IN ({pw2})
              JOIN User_Skills uw ON uw.user_id=u.user_id AND uw.type='want'  AND uw.skill_id IN ({po})
              JOIN Skills s1 ON s1.skill_id=uo.skill_id
              JOIN Skills s2 ON s2.skill_id=uw.skill_id
              WHERE u.user_id!=?"""
    return jsonify({'matches': rows(q(sql, wanted + offered + [g.uid]))})

# ── REQUESTS ──────────────────────────────────────────────────
@app.route('/api/requests', methods=['POST'])
@token_required
def create_req():
    d  = request.get_json() or {}
    db = get_db()
    db.execute(
        "INSERT INTO Exchange_Requests(requester_id,provider_id,skill_offered_id,skill_wanted_id,message) VALUES(?,?,?,?,?)",
        (g.uid, d['provider_id'], d['skill_offered_id'], d['skill_wanted_id'], d.get('message', ''))
    )
    db.commit()
    return jsonify({'message': 'Request sent'}), 201

@app.route('/api/requests', methods=['GET'])
@token_required
def list_reqs():
    rs = rows(q("""SELECT er.*,u1.username AS requester_name,u2.username AS provider_name,
                   s1.name AS skill_offered,s2.name AS skill_wanted
                   FROM Exchange_Requests er
                   JOIN Users u1 ON u1.user_id=er.requester_id
                   JOIN Users u2 ON u2.user_id=er.provider_id
                   JOIN Skills s1 ON s1.skill_id=er.skill_offered_id
                   JOIN Skills s2 ON s2.skill_id=er.skill_wanted_id
                   WHERE er.requester_id=? OR er.provider_id=?
                   ORDER BY er.created_at DESC""", (g.uid, g.uid)))
    return jsonify({'requests': rs})

@app.route('/api/requests/<int:rid>', methods=['PUT'])
@token_required
def update_req(rid):
    d  = request.get_json() or {}
    st = d.get('status')
    if st not in ('accepted', 'rejected', 'cancelled'):
        return jsonify({'error': 'Invalid status'}), 400
    r2 = q("SELECT * FROM Exchange_Requests WHERE request_id=?", (rid,), one=True)
    if not r2: return jsonify({'error': 'Not found'}), 404
    if g.uid not in (r2['requester_id'], r2['provider_id']):
        return jsonify({'error': 'Forbidden'}), 403
    db = get_db()
    db.execute("UPDATE Exchange_Requests SET status=? WHERE request_id=?", (st, rid))
    db.commit()
    return jsonify({'message': f'Request {st}'})

# ── SESSIONS ──────────────────────────────────────────────────
@app.route('/api/sessions', methods=['POST'])
@token_required
def create_session():
    d  = request.get_json() or {}
    db = get_db()
    db.execute(
        "INSERT INTO Sessions(request_id,scheduled_at,duration_mins,mode) VALUES(?,?,?,?)",
        (d['request_id'], d['scheduled_at'], d.get('duration_mins', 60), d.get('mode', 'online'))
    )
    db.commit()
    return jsonify({'message': 'Session scheduled'}), 201

@app.route('/api/sessions', methods=['GET'])
@token_required
def list_sessions():
    rs = rows(q("""SELECT se.*,er.requester_id,er.provider_id,
                   u1.username AS requester_name,u2.username AS provider_name,
                   s1.name AS skill_offered,s2.name AS skill_wanted
                   FROM Sessions se
                   JOIN Exchange_Requests er ON er.request_id=se.request_id
                   JOIN Users u1 ON u1.user_id=er.requester_id
                   JOIN Users u2 ON u2.user_id=er.provider_id
                   JOIN Skills s1 ON s1.skill_id=er.skill_offered_id
                   JOIN Skills s2 ON s2.skill_id=er.skill_wanted_id
                   WHERE er.requester_id=? OR er.provider_id=?
                   ORDER BY se.scheduled_at DESC""", (g.uid, g.uid)))
    return jsonify({'sessions': rs})

@app.route('/api/sessions/<int:sid>/complete', methods=['PUT'])
@token_required
def complete_session(sid):
    s  = q("SELECT * FROM Sessions WHERE session_id=?", (sid,), one=True)
    if not s: return jsonify({'error': 'Not found'}), 404
    er = q("SELECT * FROM Exchange_Requests WHERE request_id=?", (s['request_id'],), one=True)
    if g.uid not in (er['requester_id'], er['provider_id']):
        return jsonify({'error': 'Forbidden'}), 403
    credits = max(1, s['duration_mins'] // 10)
    db = get_db()
    try:
        db.execute("UPDATE Users SET credits=credits-? WHERE user_id=?", (credits, er['requester_id']))
        db.execute("UPDATE Users SET credits=credits+? WHERE user_id=?", (credits, er['provider_id']))
        db.execute("UPDATE Sessions SET status='completed',credits_transferred=? WHERE session_id=?", (credits, sid))
        db.execute("INSERT INTO Credit_Transactions(user_id,session_id,amount,type) VALUES(?,?,?,?)",
                   (er['requester_id'], sid, -credits, 'spent'))
        db.execute("INSERT INTO Credit_Transactions(user_id,session_id,amount,type) VALUES(?,?,?,?)",
                   (er['provider_id'],  sid,  credits, 'earned'))
        db.commit()
    except Exception as e:
        db.rollback()
        return jsonify({'error': str(e)}), 500
    return jsonify({'message': 'Completed', 'credits_transferred': credits})

# ── REVIEWS ───────────────────────────────────────────────────
@app.route('/api/reviews', methods=['POST'])
@token_required
def create_review():
    d  = request.get_json() or {}
    db = get_db()
    try:
        db.execute(
            "INSERT INTO Reviews(session_id,reviewer_id,reviewee_id,rating,comment) VALUES(?,?,?,?,?)",
            (d['session_id'], g.uid, d['reviewee_id'], d['rating'], d.get('comment', ''))
        )
        db.execute("""UPDATE Users SET avg_rating=
                      (SELECT ROUND(AVG(rating),1) FROM Reviews WHERE reviewee_id=?)
                      WHERE user_id=?""", (d['reviewee_id'], d['reviewee_id']))
        db.commit()
    except sqlite3.IntegrityError:
        return jsonify({'error': 'Already reviewed'}), 409
    return jsonify({'message': 'Review submitted'}), 201

# ── MESSAGES ──────────────────────────────────────────────────
@app.route('/api/messages/<int:other>', methods=['GET'])
@token_required
def get_msgs(other):
    ms = rows(q("""SELECT m.*,u.username AS sender_name FROM Messages m
                   JOIN Users u ON u.user_id=m.sender_id
                   WHERE (m.sender_id=? AND m.receiver_id=?)
                      OR (m.sender_id=? AND m.receiver_id=?)
                   ORDER BY m.sent_at ASC""", (g.uid, other, other, g.uid)))
    db = get_db()
    db.execute("UPDATE Messages SET is_read=1 WHERE receiver_id=? AND sender_id=?", (g.uid, other))
    db.commit()
    return jsonify({'messages': ms})

@app.route('/api/messages', methods=['POST'])
@token_required
def send_msg():
    d  = request.get_json() or {}
    db = get_db()
    db.execute(
        "INSERT INTO Messages(sender_id,receiver_id,request_id,content) VALUES(?,?,?,?)",
        (g.uid, d['receiver_id'], d.get('request_id'), d['content'])
    )
    db.commit()
    return jsonify({'message': 'Sent'}), 201

@app.route('/api/messages/unread', methods=['GET'])
@token_required
def unread():
    r2 = q("SELECT COUNT(*) AS c FROM Messages WHERE receiver_id=? AND is_read=0", (g.uid,), one=True)
    return jsonify({'unread': r2['c']})

# ── WALLET ────────────────────────────────────────────────────
@app.route('/api/wallet', methods=['GET'])
@token_required
def wallet():
    u  = q("SELECT credits FROM Users WHERE user_id=?", (g.uid,), one=True)
    ts = rows(q("""SELECT ct.*,s.scheduled_at FROM Credit_Transactions ct
                   LEFT JOIN Sessions s ON s.session_id=ct.session_id
                   WHERE ct.user_id=? ORDER BY ct.created_at DESC LIMIT 30""", (g.uid,)))
    return jsonify({'balance': u['credits'], 'transactions': ts})

# ── MAIN ──────────────────────────────────────────────────────
if __name__ == '__main__':
    init_db()
    print("\n  ✦ SkillSwap running → http://localhost:5000\n")
    app.run(debug=True, port=5000)
