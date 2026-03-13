# Using Guardrails with ChatGPT Web

## Setup (One-time)
```bash
curl -sSL https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.sh | bash
```
This creates a `.ai-guardrails/` folder in your current project.

## Daily Workflow

### Option A: Add File to Chat
1. Open ChatGPT at chat.openai.com
2. Click the **paperclip** icon (attach file)
3. Navigate to `.ai-guardrails/prompts/`
4. Select the prompt file you need (e.g., `pr_security_review.prompt`)
5. Paste your code in the same message
6. Send and get security analysis

### Option B: Copy-Paste Prompt
1. Open `.ai-guardrails/prompts/pr_security_review.prompt`
2. Copy the entire content
3. Paste into ChatGPT chat
4. Add your code below the prompt
5. Send message

## Recommended Prompts by Use Case

| Task | Prompt File |
|------|-------------|
| Review PR/code changes | `pr_security_review.prompt` |
| Check for leaked secrets | `secrets_scan.prompt` |
| Review API routes | `api_route_review.prompt` |
| Harden auth/login flow | `auth_flow_hardening.prompt` |
| Red team LLM app | `llm_app_red_team.prompt` |

## Tips
- Use GPT-4 for best security analysis results
- Include relevant config files alongside code
- Ask follow-up questions about specific findings
- Use the checklist files to verify fixes

## Example Session
```
You: [attach: auth_flow_hardening.prompt]
Here is my login endpoint code:
[paste your code]

ChatGPT: I've reviewed your authentication flow and found the following security issues...
```
