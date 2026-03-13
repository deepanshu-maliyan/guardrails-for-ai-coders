# 🛡️ Guardrails for AI Coders

<div align="center">

**The #1 security prompt + checklist library for AI-assisted development.**

*Stop shipping vulnerable AI-generated code. One command. Instant security.*

[![GitHub stars](https://img.shields.io/github/stars/deepanshu-maliyan/guardrails-for-ai-coders?style=for-the-badge&color=yellow)](https://github.com/deepanshu-maliyan/guardrails-for-ai-coders/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/deepanshu-maliyan/guardrails-for-ai-coders?style=for-the-badge&color=blue)](https://github.com/deepanshu-maliyan/guardrails-for-ai-coders/network/members)
[![GitHub issues](https://img.shields.io/github/issues/deepanshu-maliyan/guardrails-for-ai-coders?style=for-the-badge&color=red)](https://github.com/deepanshu-maliyan/guardrails-for-ai-coders/issues)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=for-the-badge)](CONTRIBUTING.md)
[![Made with Love](https://img.shields.io/badge/Made%20with-%E2%9D%A4-red?style=for-the-badge)](https://github.com/deepanshu-maliyan)

</div>

---

## 🤔 The Problem

> You use ChatGPT / Copilot / Claude to write code. It ships fast. But is it **secure**?

AI coding assistants write code that:
- Hardcodes secrets and API keys
- Skips input validation (SQL injection, XSS)
- Uses weak auth (plain passwords, no rate limiting)
- Leaks system prompts and PII
- Misses OWASP Top 10 entirely

**Guardrails for AI Coders** gives you ready-made security prompts + checklists to catch all of this — before it hits production.

---

## ⚡ One-Command Install

Run this in your project root (macOS / Linux / WSL):

```bash
curl -sSL https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.sh | bash
```

> **Windows (PowerShell):**
> ```powershell
> iwr https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.ps1 | iex
> ```

**What happens in 10 seconds:**
```
✅ .ai-guardrails/ folder created in your project
✅ 20+ security prompts downloaded and ready
✅ 5 checklists (API, Auth, Secrets, LLM, Frontend)
✅ Workflow guides for ChatGPT, Claude, Copilot, Cursor
✅ .gitignore auto-updated
```

---

## 🎯 How to Use (3 steps)

**Step 1 — Install**
```bash
curl -sSL https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.sh | bash
```

**Step 2 — Open your AI tool** (ChatGPT, Claude, Copilot Chat, Cursor)

**Step 3 — Add files to chat + paste your code**
```
Drag: .ai-guardrails/prompts/pr_security_review.prompt  →  into ChatGPT/Claude
Then: paste your code or PR diff below
Result: instant security review with fixes
```

> 💡 **VS Code users**: Drag the `.prompt` file directly into Copilot Chat sidebar. Done.

---

## 📁 What's Inside

```
.ai-guardrails/
├── prompts/                          # Paste-ready AI prompts
│   ├── pr_security_review.prompt     # Review any PR for vulns
│   ├── secrets_scan.prompt           # Find leaked keys/tokens
│   ├── api_route_review.prompt       # OWASP API Top 10 check
│   ├── auth_flow_hardening.prompt    # Harden login/session/JWT
│   └── llm_app_red_team.prompt       # Prompt injection + leakage
│
├── checklists/                       # Human-readable checklists
│   ├── api-security.md               # API security checklist
│   ├── auth-session-security.md      # Auth & session checklist
│   ├── secrets-and-config.md         # Secrets management
│   ├── llm-app-security.md           # LLM/AI app security
│   └── frontend-security.md          # XSS, CSP, CORS, DOM
│
├── workflows/                        # Tool-specific guides
│   ├── chatgpt-web.md                # How to use with ChatGPT
│   ├── claude-code.md                # Claude Code commands
│   ├── github-copilot-chat.md        # Copilot Chat inline use
│   └── cursor.md                     # Cursor Composer setup
│
└── examples/                         # Before/after demos
    ├── node-express-api-example.md
    ├── react-xss-example.md
    └── llm-rag-app-example.md
```

---

## 🔥 Popular Prompts

### 1. PR Security Review
```
Open: .ai-guardrails/prompts/pr_security_review.prompt
Drag into: ChatGPT / Claude / Copilot Chat
Paste: your PR diff or file
Get: severity-tagged findings + code fixes
```
**Sample output:**
```
🔴 HIGH: Hardcoded DB password (CWE-798) — Line 12
   Fix: Use process.env.DB_PASSWORD

🟡 MEDIUM: No rate limiting on /login (OWASP API4) — Line 34
   Fix: Add express-rate-limit middleware

✅ 8 other checks passed
```

### 2. Secrets Scan
```
Open: .ai-guardrails/prompts/secrets_scan.prompt
Paste: your .env, config files, GitHub Actions YAML
Get: leaked keys + exact rotation steps
```

### 3. LLM App Red-Team
```
Open: .ai-guardrails/prompts/llm_app_red_team.prompt
Paste: your system prompt + app code
Get: prompt injection vectors + jailbreak risks + fixes
```

---

## 🛠️ Supported Stacks

| Stack | Checklists | Prompts | Examples |
|-------|-----------|---------|----------|
| Node.js / Express | ✅ | ✅ | ✅ |
| React / Next.js | ✅ | ✅ | ✅ |
| Java / Spring Boot | ✅ | ✅ | 🔜 |
| Swift / iOS | ✅ | ✅ | 🔜 |
| Python / FastAPI | 🔜 | 🔜 | 🔜 |
| Go / Gin | 🔜 | 🔜 | 🔜 |
| LLM / RAG Apps | ✅ | ✅ | ✅ |

---

## 🤖 Works With Every AI Tool

| Tool | Method | Guide |
|------|--------|-------|
| **ChatGPT** | Drag `.prompt` file or copy-paste | [Guide](workflows/chatgpt-web.md) |
| **Claude / Claude Code** | Drag file or `/security-review` command | [Guide](workflows/claude-code.md) |
| **GitHub Copilot Chat** | `@workspace` + drag prompt | [Guide](workflows/github-copilot-chat.md) |
| **Cursor Composer** | `@` mention prompt file | [Guide](workflows/cursor.md) |
| **Any LLM web UI** | Copy-paste contents | Works everywhere |

---

## 📊 What It Catches

```
OWASP Top 10          ✅  SQL Injection, XSS, IDOR, Broken Auth
OWASP API Top 10      ✅  Rate limiting, Auth, Mass Assignment
Secrets Leakage       ✅  API keys, tokens, .env, Git history
LLM App Threats       ✅  Prompt injection, data exfiltration
Auth & Session        ✅  JWT issues, weak passwords, session fixation
Frontend Security     ✅  CSP, CORS, DOM sinks, cookie flags
Cloud Misconfigs      🔜  Coming soon (AWS, GCP, Docker)
```

---

## 📅 Daily Workflow

```
Morning  →  New feature written with AI
Before PR →  Drag pr_security_review.prompt into Copilot Chat → fix issues
Before push →  Run secrets_scan.prompt on config files → rotate if needed
Weekly  →  Open checklist for your stack → tick boxes → sleep easy
```

---

## 🌟 Why Star This Repo?

- ✅ **Free forever** — MIT license, no sign-up, no SaaS fees
- ✅ **Works offline** — all files are local after install
- ✅ **Stack-agnostic** — Node, Java, Swift, React, LLMs
- ✅ **Community-driven** — PRs welcome for new stacks/prompts
- ✅ **Actively maintained** — new prompts added weekly
- ✅ **Used by real devs** — not just another checklist dump

> ⭐ **If this saves you from even one vulnerability in production, please star it. It helps more developers find it.**

---

## 🤝 Contributing

We welcome contributions for:
- New language prompts (Python, Go, Rust, PHP, Kotlin)
- Mobile security (React Native, Flutter, Android)
- Cloud config checks (Docker, Terraform, AWS, GCP)
- Better examples and before/after demos

```bash
# Quick contribute
git clone https://github.com/deepanshu-maliyan/guardrails-for-ai-coders
# Add your prompt in /prompts or checklist in /checklists
# Open a PR — we review within 48 hours
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for full guidelines.

---

## 📣 Share With Your Team

If you use AI coding tools daily, share this with your team:

```
Hey team — found this free repo that adds security guardrails
to ChatGPT/Copilot/Claude. One command install, drag-and-drop prompts.
https://github.com/deepanshu-maliyan/guardrails-for-ai-coders
```

---

## 🔗 Related Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP API Security Top 10](https://owasp.org/www-project-api-security/)
- [OWASP LLM Top 10](https://owasp.org/www-project-top-10-for-large-language-model-applications/)
- [GitHub Secret Scanning](https://docs.github.com/en/code-security/secret-scanning)
- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code)

---

## 📜 License

MIT License — free to use in personal and commercial projects.

Built with ❤️ by [Deepanshu Maliyan](https://github.com/deepanshu-maliyan)

---

<div align="center">

**⭐ Star this repo to help more developers write secure AI-generated code ⭐**

[![Star History Chart](https://api.star-history.com/svg?repos=deepanshu-maliyan/guardrails-for-ai-coders&type=Date)](https://star-history.com/#deepanshu-maliyan/guardrails-for-ai-coders&Date)

</div>
