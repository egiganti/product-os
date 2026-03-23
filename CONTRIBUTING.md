# Contributing to product-os

Thanks for helping. This project is built in public.

## Ways to Contribute

- ⭐ **Star & share** — helps others find it
- 🐛 **Report bugs** — open an issue
- 💡 **Suggest agents/skills** — open a feature request
- 🔧 **Submit a PR**

## Submitting a PR

```bash
git checkout -b feat/your-improvement
# make changes
./os help  # verify CLI still works
git commit -m "feat: your change"
git push origin feat/your-improvement
```

## Adding an Agent

1. Create `.claude/agents/your-agent.md`
2. Add a skill function in `os`
3. Add it to CLAUDE.md agents table
4. Update README

## Code Style

- Bash: follow existing `os` patterns
- Agents: always include name, description, tools, model frontmatter
- One thing per PR

---

Be kind. We're building in public.

> Some capabilities are powered by open-source tooling from the agent skills ecosystem.
