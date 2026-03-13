# Using Guardrails with Cursor IDE

## Setup (One-time)
```bash
curl -sSL https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.sh | bash
```

## Using Cursor Chat

### Method 1: Add Files to Chat Context
1. Open Cursor Chat (`Cmd+L` or `Ctrl+L`)
2. Click the **+** icon to add files to context
3. Add `.ai-guardrails/prompts/pr_security_review.prompt`
4. Add the code file you want reviewed
5. Type: `Review the code using the security prompt I've added`

### Method 2: Direct Paste
1. Open `.ai-guardrails/prompts/pr_security_review.prompt`
2. Copy all content (Cmd+A, Cmd+C)
3. Open Cursor Chat
4. Paste the prompt
5. Add `@filename.py` to reference your code file
6. Send for review

### Method 3: Cursor Rules (Best for Teams)
Create `.cursorrules` in your project root:
```
You are a security-aware code reviewer.
When reviewing or generating code:
- Flag OWASP Top 10 vulnerabilities
- Enforce input validation on all user-controlled data
- Never suggest hardcoding secrets
- Require parameterized queries for DB operations
- Flag missing authentication/authorization checks
- Suggest security headers for API responses
```

## Cursor Composer for Security Fixes
1. Select vulnerable code in editor
2. Press `Cmd+K` to open Composer
3. Type: `Fix the security vulnerabilities in this code following OWASP best practices`
4. Review changes before accepting

## Tips
- Use `@codebase` in Cursor Chat for repo-wide security analysis
- Cursor can reference `.cursorrules` automatically - set up once, benefit forever
- Use Cmd+Shift+L to add selected code to chat context instantly
- Combine with the checklist files to verify all issues are addressed
