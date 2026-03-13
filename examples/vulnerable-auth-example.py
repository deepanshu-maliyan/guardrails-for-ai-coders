"""
EXAMPLE: Vulnerable Authentication Code (Before Guardrails Review)

This file demonstrates common auth/session security vulnerabilities.
Use with: .ai-guardrails/prompts/auth_flow_hardening.prompt

Run the prompt against this file to see AI security analysis.
"""

import hashlib
import sqlite3
from flask import Flask, request, session, jsonify

app = Flask(__name__)
app.secret_key = 'mysecret'  # VULNERABILITY: Weak secret key

# VULNERABILITY: MD5 password hashing (easily crackable)
def hash_password(password):
    return hashlib.md5(password.encode()).hexdigest()

# VULNERABILITY: SQL injection + weak hashing
@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    
    # VULNERABILITY: SQL Injection
    query = f"SELECT * FROM users WHERE username='{username}' AND password='{hash_password(password)}'"
    conn = sqlite3.connect('db.sqlite')
    user = conn.execute(query).fetchone()
    
    if user:
        session['user_id'] = user[0]  # VULNERABILITY: No session regeneration
        session['is_admin'] = user[3]  # VULNERABILITY: Trusting DB flag directly
        return jsonify({'status': 'logged in', 'user': dict(user)})  # VULNERABILITY: Returns full user object
    return jsonify({'error': 'Invalid credentials'})  # OK but no rate limiting

# VULNERABILITY: No authentication check on admin endpoint
@app.route('/admin/users')
def get_all_users():
    conn = sqlite3.connect('db.sqlite')
    users = conn.execute('SELECT * FROM users').fetchall()  # Returns passwords!
    return jsonify(users)

# VULNERABILITY: Password reset with predictable token
@app.route('/reset-password', methods=['POST'])
def reset_password():
    email = request.form['email']
    # VULNERABILITY: Token is just the email hash - predictable!
    token = hashlib.md5(email.encode()).hexdigest()
    # No expiry, no single-use enforcement
    send_reset_email(email, token)
    return jsonify({'message': 'Reset email sent'})

"""
TO FIX: Open ChatGPT/Claude and run:
1. Attach .ai-guardrails/prompts/auth_flow_hardening.prompt
2. Paste this file
3. Get secure version with bcrypt, parameterized queries, proper sessions
"""
