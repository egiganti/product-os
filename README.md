<div align="center">

# 🧠 product-os

### The Operating System for AI-Native Product Teams

**From raw idea → research → design → code → ship. With agents. In days, not months.**

[![GitHub Stars](https://img.shields.io/github/stars/egiganti/product-os?style=flat-square&logo=github)](https://github.com/egiganti/product-os/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![os](https://img.shields.io/badge/os-ecosystem-blue?style=flat-square)](https://os)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-optimized-orange?style=flat-square)](https://claude.ai/code)

[**Quick Start**](#quick-start) • [**How It Works**](#how-it-works) • [**Skills**](#skills-ecosystem) • [**CI/CD**](#cicd-pipeline) • [**Docs**](./docs)

</div>

---

## The Problem

Every framework today solves only part of the puzzle:

- **BMAD** — Great agents, but no design, no CI/CD, no research
- **GitHub Spec-Kit** — Great specs, but no product, no ship
- **AI-Product-Toolkit** — Great templates, but no agents, no QA

**Nobody connects all the dots.**

---

## The Solution

`product-os` is the first framework that covers the entire product lifecycle with AI agents:

```
RAW IDEA
   ↓
🔍 Research Agent        → Validates market, kills bad ideas early
   ↓
📋 Product Agent         → PRD + user stories + sprint planning
   ↓
🎨 Google Stitch         → AI-generated UI → design.md
   ↓
⚡ Claude Code + Agents  → Build with subagents (QA, Security, Dev)
   ↓
🧪 QA Agent              → Test-first loop, E2E verification
   ↓
🔒 Security Agent        → OWASP scan on every push
   ↓
🚀 CI/CD                 → Auto-deploy on merge to main
   ↓
📣 Launch Agent          → Go-to-market, SEO, metrics
   ↓
LIVE PRODUCT WITH METRICS
```

---

## Quick Start

```bash
# 1. Clone
git clone https://github.com/egiganti/product-os.git
cd product-os

# 2. Initialize your project
./os init

# 3. Install all skills from os ecosystem
./os install-all

# 4. Start building
./os research     # Validate your idea
./os prd          # Write the PRD
./os stitch       # Design with Google Stitch
./os sprint       # Plan your first sprint
```

---

## How It Works

### 1. `CLAUDE.md` — The Project Brain
The central intelligence. Every Claude Code session reads this first. Defines agents, rules, stack, methodology, and workflow.

### 2. `os` — Your CLI
One command to activate any agent or skill:

```bash
./os help         # See all available skills
./os research     # Market research agent
./os prd          # Product requirements generator
./os stitch       # Google Stitch design workflow
./os qa           # QA agent (test-first)
./os security     # OWASP security scan
./os ship         # Pre-ship checklist + deploy
./os launch       # Go-to-market agent
```

### 3. Specialized Agents
Located in `.claude/agents/`. Each agent has a specific role, isolated context, and defined output format.

| Agent | Trigger | Output |
|-------|---------|--------|
| `research` | `./os research` | `research/research-brief.md` |
| `product` | `./os prd` | `PRD.md` |
| `stitch` | `./os stitch` | `templates/stitch/stitch-brief.md` |
| `architect` | `./os design` | `design.md` |
| `qa` | `./os qa` | Tests + `qa-report.md` |
| `security` | Every push (CI) | `security-report.md` |
| `launch` | `./os launch` | GTM plan |

### 4. CI/CD Pipeline (GitHub Actions)

| Trigger | Workflow | What Runs |
|---------|----------|-----------|
| Push any branch | `security-scan.yml` | Secret scan + dep audit |
| Open PR | `qa-review.yml` | Tests + coverage + E2E |
| Open PR | Comment | Agent reviews + reports |
| Merge → main | `deploy.yml` | Build + test + ship |

---

## Skills Ecosystem

`product-os` uses the best skills from [os](https://os):

**Design (Google Stitch stack)**
- `google-labs-code/stitch-skills/design-md`
- `google-labs-code/stitch-skills/stitch-loop`
- `anthropics/skills/frontend-design`

**QA & Testing**
- `obra/superpowers/test-driven-development`
- `currents-dev/playwright-best-practices-skill`
- `obra/superpowers/verification-before-completion`

**Security**
- `supercent-io/skills-template/security-best-practices`
- `pbakaus/impeccable/harden`

**Shipping**
- `vercel-labs/agent-skills/deploy-to-vercel`
- `obra/superpowers/requesting-code-review`

[See full list →](./os)

---

## vs. The Competition

| | product-os | BMAD | Spec-Kit | AI-Toolkit |
|--|:---------:|:----:|:--------:|:----------:|
| Research agent | ✅ | ⚠️ | ❌ | ❌ |
| PRD for AI agents | ✅ | ✅ | ✅ | ✅ |
| **Google Stitch design** | ✅ | ❌ | ❌ | ❌ |
| Specialized subagents | ✅ | ✅ | ❌ | ❌ |
| **CI/CD native** | ✅ | ❌ | ❌ | ❌ |
| **os CLI** | ✅ | ❌ | ❌ | ❌ |
| QA test-first loop | ✅ | ✅ | ❌ | ❌ |
| Security baseline | ✅ | ⚠️ | ❌ | ❌ |
| Launch / marketing | ✅ | ❌ | ❌ | ❌ |
| **Full end-to-end** | ✅ | ❌ | ❌ | ❌ |

---

## Project Structure

```
product-os/
├── os                    ← CLI entry point
├── CLAUDE.md                    ← Project brain for Claude Code
├── claude-progress.txt          ← Session state (agent memory)
│
├── .claude/agents/
│   ├── research.md
│   ├── product.md
│   ├── stitch.md
│   ├── architect.md
│   ├── qa.md
│   ├── security.md
│   └── launch.md
│
├── .github/workflows/
│   ├── security-scan.yml
│   ├── qa-review.yml
│   └── deploy.yml
│
└── templates/
    ├── PRD.md
    ├── design.md
    ├── claude-progress.txt
    └── stitch/stitch-brief.md
```

---

## Philosophy

> **"Done ≠ shipped. Done = metrics moving."**

- Research before code — kill bad ideas early
- Specs before implementation — no vibe coding
- Tests before features — QA agent writes first
- Security on every push — not at the end
- Metrics from day 1 — not retrofitted

---

## Contributing

PRs welcome. This framework is built in public and improves with every project that uses it.

```bash
git clone https://github.com/egiganti/product-os
cd product-os
# Make your improvements
# Open a PR
```

---

## Support This Project

If `product-os` saves you time, consider:

- ⭐ **Star this repo** — it helps others find it
- 💖 **[Sponsor on GitHub](https://github.com/sponsors/egiganti)** — keep it free for everyone
- 🐛 **Open issues** — help us improve
- 📣 **Share it** — tweet, post, tell your team

---

## License

MIT — free forever. Build great products.

---

<div align="center">

Built with ❤️ using Claude Code + product-os

**[⭐ Star us on GitHub](https://github.com/egiganti/product-os)**

</div>
