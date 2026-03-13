# Secrets & Configuration Security Checklist

Use with: `.ai-guardrails/prompts/secrets_scan.prompt`

## Environment Variables
- [ ] No secrets hardcoded in source code
- [ ] `.env` files are in `.gitignore`
- [ ] No `.env` files committed to repo history
- [ ] Different secrets per environment (dev/staging/prod)
- [ ] Secrets rotated regularly (90-day policy)

## Secret Storage
- [ ] Secrets stored in vault (HashiCorp Vault, AWS Secrets Manager, etc.)
- [ ] No secrets in Docker images or Dockerfiles
- [ ] No secrets in CI/CD logs or artifacts
- [ ] No secrets in frontend bundles or client-side code
- [ ] Kubernetes secrets base64-encoded (not plaintext in YAML)

## API Keys & Tokens
- [ ] API keys have minimum required permissions (least privilege)
- [ ] API keys are rotatable without downtime
- [ ] Separate API keys per service/environment
- [ ] API key usage monitored and alerted on anomalies
- [ ] Unused API keys revoked

## Database Credentials
- [ ] Database passwords are strong (20+ chars, random)
- [ ] DB credentials not shared across services
- [ ] DB connection strings not logged
- [ ] Read-only credentials used where write not needed
- [ ] DB credentials rotated after staff offboarding

## Configuration Files
- [ ] Config files with secrets excluded from version control
- [ ] Example config files use placeholder values only
- [ ] No passwords in config comments or documentation
- [ ] Infrastructure-as-code templates use parameter references
- [ ] Secrets scanning tool enabled on repo (e.g., GitHub Secret Scanning)

## CI/CD Pipeline
- [ ] Secrets injected via CI/CD secret manager (not env vars in YAML)
- [ ] Pipeline logs masked for sensitive values
- [ ] Fork PRs cannot access repo secrets
- [ ] Build artifacts scanned for secret leakage before publish

---

## AI Prompt to Run
```
Open: .ai-guardrails/prompts/secrets_scan.prompt
Paste your config files, .env examples, or CI YAML
Run in ChatGPT/Claude/Copilot Chat
```
