# API Security Checklist
> Guardrails for AI Coders | Use with: `prompts/api_route_review.prompt`

**When to use:** Before deploying any public API endpoint or when reviewing existing APIs.

---

## Authentication & Authorization
- [ ] Every protected route requires a valid auth token
- [ ] JWT tokens have expiry (exp claim) and it is enforced
- [ ] JWT signature algorithm is not 'none'
- [ ] Role/permission checks on every sensitive route (not just authentication)
- [ ] IDOR check: users cannot access other users' resources by changing IDs
- [ ] Admin endpoints are behind role checks (not just auth checks)

## Input Validation
- [ ] All user inputs are validated server-side (not just client-side)
- [ ] SQL/NoSQL queries use parameterized statements or ORM
- [ ] JSON payload size limits enforced
- [ ] File upload types and sizes restricted
- [ ] Content-Type header enforced on POST/PUT routes

## Rate Limiting & Abuse Prevention
- [ ] Rate limiting on all public endpoints (especially login, signup, forgot password)
- [ ] Account lockout after failed login attempts (5 attempts = 15 min lockout)
- [ ] Expensive operations (email, SMS, AI calls) have per-user rate limits

## Output & Error Handling
- [ ] No stack traces in production error responses
- [ ] No internal server info in error messages
- [ ] No PII (emails, passwords, tokens) in error responses or logs
- [ ] Error responses are generic ('Invalid credentials' not 'Wrong password')

## Security Headers
- [ ] `Content-Security-Policy` header set
- [ ] `X-Content-Type-Options: nosniff` header set
- [ ] `X-Frame-Options: DENY` header set
- [ ] `Strict-Transport-Security` (HSTS) enabled
- [ ] CORS restricted to known origins only

## Data Security
- [ ] Sensitive data encrypted at rest (passwords hashed, tokens encrypted)
- [ ] HTTPS enforced (no HTTP fallback in production)
- [ ] PII not logged in application logs
- [ ] Database credentials not hardcoded

## Dependencies
- [ ] `npm audit` / `pip check` / `bundle audit` run with no HIGH vulnerabilities
- [ ] Dependencies updated in last 90 days
- [ ] No known CVE packages in production build

---

## AI Prompt to Run
```
Open: .ai-guardrails/prompts/api_route_review.prompt
Paste your API router/controller code below it
Run in ChatGPT/Claude/Copilot Chat
```

---
*Part of [Guardrails for AI Coders](https://github.com/deepanshu-maliyan/guardrails-for-ai-coders)*
