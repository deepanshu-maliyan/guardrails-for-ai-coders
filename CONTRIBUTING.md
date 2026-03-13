# Contributing to Guardrails for AI Coders

Thank you for helping make AI-assisted coding more secure! This project thrives on community contributions.

## Ways to Contribute

### 1. Add New Security Prompts
- Fork the repo
- Create a new `.prompt` file in `/prompts/`
- Follow the naming convention: `feature_area_action.prompt`
- Include: role definition, task description, output format, severity levels
- Submit a PR with a description of what vulnerability category it addresses

### 2. Improve Existing Checklists
- Review checklist items in `/checklists/`
- Add missing security controls
- Update items for new OWASP guidance
- Add references to CVEs or security advisories

### 3. Add IDE/Tool Workflows
- Add new `workflows/` docs for AI tools not yet covered
- Document how to use prompts with new AI coding assistants
- Add screenshots or screen recordings (link in PR)

### 4. Add Example Vulnerable Code
- Add realistic examples to `/examples/`
- Include comments marking each vulnerability
- Map to OWASP Top 10 categories
- Pair with the correct prompt file

### 5. Report Issues
- Security gaps or incorrect guidance → open an Issue
- Broken install.sh → open a bug report
- New vulnerability patterns → open a feature request

## Contribution Guidelines

### Quality Standards
- Prompts should be tested with at least one AI model (GPT-4, Claude, Copilot)
- Checklists should cite OWASP or established security standards where possible
- Examples should be realistic but not based on real production code
- No real credentials, tokens, or sensitive data in any file

### PR Process
1. Fork the repository
2. Create a feature branch: `git checkout -b add/your-feature`
3. Make your changes
4. Test the prompt/checklist with an AI tool
5. Submit a PR with:
   - What you added/changed
   - Which AI tool(s) you tested with
   - Sample output showing the prompt works

### Code of Conduct
- Be respectful and constructive
- No real vulnerability disclosures in prompts (use generic patterns)
- Credit original research when building on others' work

## Star the Repo
If you find this useful, please star the repo - it helps others discover it!

## Contact
Open an issue or start a Discussion for questions.

Thanks for making AI coding safer!
