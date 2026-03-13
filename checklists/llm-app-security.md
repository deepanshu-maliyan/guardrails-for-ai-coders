# LLM App Security Checklist
> Guardrails for AI Coders | Use with: `prompts/llm_app_red_team.prompt`

**When to use:** Before deploying any AI/LLM-powered application (chatbot, RAG, agent, etc.).

---

## Prompt Injection Prevention
- [ ] System prompt contains explicit confidentiality instructions
- [ ] User input is separated from system instructions (never concatenated directly)
- [ ] Input is screened for injection patterns before reaching LLM
- [ ] Indirect injection: external data (web, files, DB) is sanitized before insertion into prompts
- [ ] Output from LLM is treated as untrusted data, not instructions

## System Prompt Security
- [ ] System prompt does not contain secrets or API keys
- [ ] System prompt has anti-extraction instructions
- [ ] Model refuses to repeat/translate/summarize its instructions
- [ ] Business logic is in backend code, not in system prompt

## Output Handling
- [ ] LLM output is NOT rendered as raw HTML (XSS prevention)
- [ ] LLM output is NOT executed as code without validation
- [ ] File paths suggested by LLM are sanitized before use
- [ ] SQL/queries suggested by LLM are NOT executed directly
- [ ] LLM output is length-limited before display

## Data Privacy
- [ ] PII is not sent to external LLM APIs without user consent
- [ ] Conversation history is isolated per user (no cross-user leakage)
- [ ] User data is not used for model training without explicit opt-in
- [ ] Data retention/deletion policies are in place for conversation logs

## Agent / Tool Use Security
- [ ] Tool permissions follow least-privilege principle
- [ ] Dangerous tools (delete, send email, make payments) require human confirmation
- [ ] Tool outputs are validated before use
- [ ] Maximum tool call depth/limit is set to prevent infinite loops

## Rate Limiting & Abuse
- [ ] Per-user token limits set to prevent API cost abuse
- [ ] Conversation turn limits per session
- [ ] Abuse detection: flag unusually long prompts or suspicious patterns

## Monitoring
- [ ] All LLM interactions logged (with user ID, timestamp, truncated prompt)
- [ ] Alerts set up for detected injection attempts
- [ ] Cost monitoring in place to detect abuse

---

## AI Prompt to Run
```
Open: .ai-guardrails/prompts/llm_app_red_team.prompt
Paste your system prompt + relevant backend code
Run in ChatGPT/Claude
```

---
*Part of [Guardrails for AI Coders](https://github.com/deepanshu-maliyan/guardrails-for-ai-coders)*
