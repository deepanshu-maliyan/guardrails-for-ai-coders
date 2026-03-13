# 🛡️ Guardrails for AI Coders

**Ready-made security prompts + checklists for ChatGPT, Claude Code, Copilot Chat, Cursor, and more.**

Stop shipping insecure AI-generated code. Run one command → get a `.ai-guardrails/` folder → drag-and-drop prompts into any AI chat for instant security reviews.

[![GitHub stars](https://img.shields.io/github/stars/deepanshu-maliyan/guardrails-for-ai-coders?style=social)](https://github.com/deepanshu-maliyan/guardrails-for-ai-coders)
[![GitHub forks](https://img.shields.io/github/forks/deepanshu-maliyan/guardrails-for-ai-coders)](https://github.com/deepanshu-maliyan/guardrails-for-ai-coders)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## ⚡ One-Command Install

```bash
curl -sSL https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.sh | bash
```

**What happens in 10 seconds:**
```
✅ Downloads .ai-guardrails/ folder into your project
✅ Prompts ready to drag-and-drop into any AI chat
✅ Checklists ready to open and use
✅ .gitignore auto-updated
```

---

## 🗂️ What's Inside

```
.ai-guardrails/
├── prompts/
│   ├── pr_security_review.prompt         ← Drag into ChatGPT/Claude
│   ├── api_route_review.prompt           ← Paste your API code
│   ├── secrets_scan.prompt               ← Scan .env / config files
│   ├── auth_flow_hardening.prompt        ← Harden login/auth flows
│   └── llm_app_red_team.prompt           ← Red-team your AI app
├── checklists/
│   ├── api-security.md                   ← OWASP API Top 10
│   ├── auth-session-security.md          ← Auth best practices
│   ├── secrets-and-config.md             ← Secrets management
│   ├── frontend-security.md              ← XSS, CSP, CORS
│   └── llm-app-security.md               ← Prompt injection, leaks
├── workflows/
│   ├── chatgpt-web.md                    ← Use with ChatGPT
│   ├── claude-code.md                    ← Use with Claude Code
│   ├── github-copilot-chat.md            ← Use with Copilot Chat
│   └── cursor.md                         ← Use with Cursor
└── examples/
    ├── node-express-api-example.md       ← Before/after Node.js
    ├── react-xss-example.md              ← React XSS fix demo
    └── llm-rag-app-example.md            ← LLM app security demo
```

---

## 🚀 How to Use (3 Steps)

### Step 1 — Install
```bash
curl -sSL https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.sh | bash
```

### Step 2 — Pick a prompt
```bash
ls .ai-guardrails/prompts/
# pr_security_review.prompt
# api_route_review.prompt
# secrets_scan.prompt
# auth_flow_hardening.prompt
# llm_app_red_team.prompt
```

### Step 3 — Add to AI chat

| Tool | How to add |
|------|------------|
| **ChatGPT** | Drag `.prompt` file into chat window |
| **Claude.ai** | Drag `.prompt` file as attachment |
| **Copilot Chat (VS Code)** | `Ctrl+I` → type `#` → select file |
| **Cursor Composer** | `@` → select prompt file |
| **Any LLM** | Open file → copy all → paste |

Then paste your code below `=== YOUR CODE ===` and hit Enter.

---

## 📋 Example Output

**Input:** Paste `pr_security_review.prompt` + your login endpoint

**Output (30 seconds later):**
```
🔴 HIGH: Plain-text password comparison (CWE-256) Line 4
   Risk: Passwords stored/compared without hashing — rainbow table attack trivial
   Fix: Use bcrypt.compare(inputPassword, storedHash)

🟡 MEDIUM: No rate limiting on /login (OWASP API4) 
   Risk: Brute-force attacks unrestricted
   Fix: Add express-rate-limit middleware — 5 attempts/15 min

🟢 LOW: Missing security headers (CWE-16)
   Risk: Clickjacking, MIME sniffing possible
   Fix: Use helmet.js — app.use(helmet())

✅ SQL injection: CLEAN
✅ JWT validation: CLEAN  
✅ Input sanitization: CLEAN
```

---

## 🛠️ Supported Stacks

| Stack | Checklists | Prompts |
|-------|------------|--------|
| Node.js / Express | ✅ | ✅ |
| React / Frontend | ✅ | ✅ |
| Java / Spring Boot | ✅ | ✅ |
| Swift / iOS | ✅ | ✅ |
| Python / FastAPI | ✅ | ✅ |
| LLM / RAG Apps | ✅ | ✅ |

---

## 🔒 Daily Developer Workflow

```
Morning  → Open project
          → Run: curl ... | bash (one time only)

Coding   → Write feature with AI

Before PR → Open Copilot Chat
           → Add pr_security_review.prompt
           → Paste your diff
           → Fix findings

Before push → Drop secrets_scan.prompt
             → Paste your .env / config
             → Rotate any leaked keys

Before prod → Run api_route_review.prompt
             → Check OWASP coverage
             → Ship with confidence ✅
```

---

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

**Ideas for new prompts:**
- Python / Django security review
- Docker / Kubernetes config audit
- Terraform / cloud misconfiguration scan
- React Native mobile security
- GraphQL API security

```bash
# Add your prompt
cp your_new.prompt .ai-guardrails/prompts/
# Open a PR!
```

---

## ⚖️ License

MIT — free for personal and commercial use. See [LICENSE](LICENSE).

---

## 🙏 Credits

Built by [Deepanshu Maliyan](https://github.com/deepanshu-maliyan)

Inspired by OWASP API Security Top 10, CWE, and the amazing developer security community.

---

⭐ **If this saves you from one vulnerability, star it!**

> "Secure by default, not by accident."
