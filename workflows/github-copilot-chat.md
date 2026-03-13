# Using Guardrails with GitHub Copilot Chat

## Setup (One-time)
```bash
curl -sSL https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.sh | bash
```

## In VS Code with GitHub Copilot Chat

### Method 1: Inline Chat
1. Open your code file in VS Code
2. Select the code you want reviewed
3. Press `Cmd+I` (Mac) or `Ctrl+I` (Windows) to open inline chat
4. Type: `@workspace Review this code for security vulnerabilities based on OWASP Top 10`
5. Or paste the contents of a `.prompt` file directly

### Method 2: Copilot Chat Panel
1. Open Copilot Chat (sidebar icon or `Cmd+Shift+I`)
2. Open `.ai-guardrails/prompts/pr_security_review.prompt` in editor
3. Copy all content
4. Paste into Copilot Chat
5. Add: `Review the currently open file using the above criteria`

### Method 3: Add to Context
1. In Copilot Chat, use `#file:` to reference prompt files
2. Type: `#file:.ai-guardrails/prompts/pr_security_review.prompt`
3. Then: `Apply this security review to #file:src/api/routes.js`

## Workspace-Level Security Rules
Create `.github/copilot-instructions.md` in your repo:
```markdown
When generating code:
- Always validate and sanitize user inputs
- Use parameterized queries for database operations
- Never hardcode secrets or credentials
- Apply principle of least privilege
- Include error handling that doesn't leak stack traces
```

## Useful Copilot Chat Commands
```
/explain - Explain security implications of selected code
/fix - Fix a security vulnerability
/tests - Generate security test cases
```

## Tips
- Use `@workspace` for repo-wide security analysis
- Reference multiple files with `#file:` for broader context
- Ask Copilot to generate security tests after finding issues
