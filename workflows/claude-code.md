# Using Guardrails with Claude (Anthropic)

## Setup (One-time)
```bash
curl -sSL https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.sh | bash
```

## Using with Claude.ai Web

1. Go to claude.ai
2. Start a new conversation
3. Click the **paperclip** (attach) icon
4. Upload a `.prompt` file from `.ai-guardrails/prompts/`
5. Add your code in the message
6. Send for security review

## Using with Claude API / Claude Code

### In your terminal with Claude CLI:
```bash
# Read prompt and pipe with code
cat .ai-guardrails/prompts/pr_security_review.prompt > /tmp/review.txt
echo "\n\nCode to review:\n" >> /tmp/review.txt
cat your_file.py >> /tmp/review.txt
claude < /tmp/review.txt
```

### In Cursor or VS Code with Claude:
1. Open `.ai-guardrails/prompts/pr_security_review.prompt`
2. Select all and copy (Cmd+A, Cmd+C)
3. Open Claude chat panel
4. Paste prompt
5. Paste code below
6. Submit

## Claude-Specific Tips
- Claude excels at understanding full file context - provide complete files
- Use Claude 3.5 Sonnet or Opus for deep security analysis
- Claude can reason through complex auth flows well
- Ask Claude to explain its findings with code examples
- Request OWASP categorization for each finding

## Example Prompt Extension
Add this after any prompt for deeper Claude analysis:
```
For each issue found:
1. Classify by OWASP Top 10 category
2. Rate severity: Critical/High/Medium/Low
3. Show vulnerable code snippet
4. Provide fixed code snippet
5. Explain why the fix works
```
