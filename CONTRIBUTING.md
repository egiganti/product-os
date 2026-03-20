# Contributing to product-os

First off — thank you. This project is built in public and gets better with every contribution.

## Ways to Contribute

### ⭐ Easiest — Star & Share
Star the repo and tell one person about it. It genuinely helps.

### 🐛 Report Bugs
Open an issue with the bug report template. Be specific.

### 💡 Suggest Skills
Found a skill on [skills.sh](https://skills.sh) that belongs in product-os? Open a Feature Request issue.

### 🔧 Submit a PR

```bash
# 1. Fork the repo
# 2. Create a feature branch
git checkout -b feat/your-improvement

# 3. Make your changes
# 4. Test that skills.sh still works
./skills.sh help

# 5. Commit with semantic message
git commit -m "feat: add [skill-name] to qa workflow"

# 6. Push and open a PR
git push origin feat/your-improvement
```

## What Makes a Good PR

- **One thing per PR** — don't bundle unrelated changes
- **Update the README** if you add a skill or command
- **Test your change** — run `./skills.sh` to verify nothing breaks
- **Clear description** — explain why, not just what

## Adding a New Skill

1. Find the skill on [skills.sh](https://skills.sh)
2. Add it to the appropriate section in `skills.sh`
3. Add the `npx skills add ...` command
4. Update the help section with a description
5. Document it in the README skills table

## Adding a New Agent

1. Create `.claude/agents/your-agent.md`
2. Follow the existing agent format (name, description, tools, model, instructions)
3. Add a skill command: `skill_youragent()` in `skills.sh`
4. Add it to the CLAUDE.md agents table
5. Add it to the README

## Code Style

- Bash: follow the existing `skills.sh` patterns
- Markdown: clear headers, concrete examples
- Agent files: always include name, description, tools, model frontmatter

## Community

Be kind. We're all building in public and learning together.
