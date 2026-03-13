# Frontend Security Checklist

Use with: `.ai-guardrails/prompts/pr_security_review.prompt`

## XSS Prevention
- [ ] All user input is escaped/sanitized before rendering
- [ ] `innerHTML` never used with user-controlled content
- [ ] Content Security Policy (CSP) headers configured
- [ ] CSP disallows `unsafe-inline` and `unsafe-eval`
- [ ] Trusted Types API enforced for DOM manipulation
- [ ] Third-party scripts loaded from trusted CDNs with SRI hashes

## CSRF Protection
- [ ] CSRF tokens on all state-changing forms
- [ ] SameSite cookie attribute set
- [ ] Custom request headers used for AJAX (e.g., X-Requested-With)
- [ ] Origin/Referer header validation on server side

## Sensitive Data in Frontend
- [ ] No API keys, secrets, or credentials in JavaScript bundles
- [ ] No PII stored in localStorage or sessionStorage
- [ ] Sensitive data cleared from memory after use
- [ ] Browser autofill disabled on sensitive fields
- [ ] Developer tools detection not relied upon for security

## Dependency Security
- [ ] `npm audit` / `yarn audit` run regularly
- [ ] No packages with known critical CVEs
- [ ] Dependency versions pinned or locked (package-lock.json)
- [ ] Automated dependency update tool configured (Dependabot)
- [ ] `node_modules` not committed to repo

## iframe & Clickjacking
- [ ] `X-Frame-Options: DENY` or CSP `frame-ancestors` set
- [ ] Sensitive pages cannot be embedded in iframes
- [ ] `sandbox` attribute used on embedded third-party iframes

## HTTPS & Transport
- [ ] All assets loaded over HTTPS
- [ ] Mixed content warnings resolved
- [ ] HSTS header configured
- [ ] Certificate pinning considered for mobile web

---

## AI Prompt to Run
```
Open: .ai-guardrails/prompts/pr_security_review.prompt
Paste your frontend component code
Run in ChatGPT/Claude/Copilot Chat
```
