# Authentication & Session Security Checklist

Use with: `.ai-guardrails/prompts/auth_flow_hardening.prompt`

## Password Security
- [ ] Passwords hashed with bcrypt/argon2 (not MD5/SHA1)
- [ ] Minimum password length enforced (12+ chars)
- [ ] Password complexity requirements configured
- [ ] Password history enforced (prevent reuse of last 5)
- [ ] Secure password reset flow (token-based, expires in 1hr)

## Session Management
- [ ] Session IDs are cryptographically random (128+ bits)
- [ ] Sessions invalidated on logout
- [ ] Sessions expire after inactivity (30 min default)
- [ ] Absolute session timeout enforced (24hr max)
- [ ] Session fixation prevented (regenerate ID on login)
- [ ] Session stored server-side (not in JWT for sensitive ops)

## Cookie Security
- [ ] `HttpOnly` flag set on session cookies
- [ ] `Secure` flag set (HTTPS only)
- [ ] `SameSite=Strict` or `Lax` configured
- [ ] Cookie domain/path scoped appropriately
- [ ] Session cookie not accessible via JavaScript

## JWT Security (if using tokens)
- [ ] Algorithm is explicitly set and restricted (RS256 or HS256, never 'none')
- [ ] Signature is verified on every request (not just decoded)
- [ ] `exp` (expiry) claim is present and enforced
- [ ] `aud` (audience) claim is validated
- [ ] Signing secret is 256+ bits and stored in environment variables
- [ ] Short expiry (15-60 min) + refresh token pattern used

## Brute Force Protection
- [ ] Account lockout after 5 failed attempts (15 min lockout)
- [ ] Rate limiting on /login, /register, /forgot-password endpoints
- [ ] CAPTCHA shown after 3+ failed attempts
- [ ] Login attempts logged with IP, timestamp, user-agent

## Multi-Factor Authentication
- [ ] MFA available for all accounts
- [ ] MFA required for admin/privileged accounts
- [ ] TOTP secrets stored encrypted in database
- [ ] Backup codes are one-time use and hashed

## OAuth / Social Login
- [ ] `state` parameter used and validated (CSRF prevention)
- [ ] `redirect_uri` validated against strict whitelist
- [ ] Access tokens stored in httpOnly cookies (not localStorage)
- [ ] Token exchange happens server-side only

---

## AI Prompt to Run
```
Open: .ai-guardrails/prompts/auth_flow_hardening.prompt
Paste your login/auth/session code
Run in ChatGPT/Claude/Copilot Chat
```
