/**
 * EXAMPLE: Vulnerable API Code (Before Guardrails Review)
 * 
 * This file demonstrates common security vulnerabilities.
 * Use with: .ai-guardrails/prompts/api_route_review.prompt
 * 
 * Run the prompt against this file to see how AI identifies issues.
 */

const express = require('express');
const mysql = require('mysql');
const app = express();

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password123',  // VULNERABILITY: Hardcoded credential
  database: 'myapp'
});

// VULNERABILITY: SQL Injection - user input directly in query
app.get('/users', (req, res) => {
  const userId = req.query.id;
  const query = `SELECT * FROM users WHERE id = ${userId}`; // UNSAFE
  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message }); // VULNERABILITY: Leaks DB error
    }
    res.json(results);
  });
});

// VULNERABILITY: No authentication check
app.delete('/admin/users/:id', (req, res) => {
  const userId = req.params.id;
  db.query(`DELETE FROM users WHERE id = ${userId}`, (err) => {
    if (err) throw err; // VULNERABILITY: Unhandled error crashes server
    res.json({ message: 'User deleted' });
  });
});

// VULNERABILITY: Mass assignment - accepts all fields
app.post('/users', (req, res) => {
  const user = req.body; // Takes ALL user-supplied fields including isAdmin!
  db.query('INSERT INTO users SET ?', user, (err, result) => {
    res.json({ id: result.insertId, ...user }); // VULNERABILITY: Returns all data
  });
});

// VULNERABILITY: No rate limiting, no CORS restrictions
app.listen(3000);

/**
 * TO FIX: Open ChatGPT/Claude and run:
 * 1. Attach .ai-guardrails/prompts/api_route_review.prompt
 * 2. Paste this file
 * 3. Get secure version with parameterized queries, auth, validation
 */
