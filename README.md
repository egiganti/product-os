<div align="center">

# 🧠 product-os

### The Operating System for AI-Native Product Teams

**From raw idea → research → design → code → ship. With agents. In days, not months.**

[![GitHub Stars](https://img.shields.io/github/stars/egiganti/product-os?style=flat-square&logo=github)](https://github.com/egiganti/product-os/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-Support-FF5E5B?style=flat-square&logo=ko-fi)](https://ko-fi.com/ezegiga)

</div>

---

## The Problem

Every framework solves only part of the puzzle:

- **BMAD** — Great agents, no design, no CI/CD
- **GitHub Spec-Kit** — Great specs, no product, no ship
- **AI-Product-Toolkit** — Great templates, no agents, no QA

**Nobody connects all the dots.**

---

## The Solution

`product-os` covers the entire product lifecycle:

```
RAW IDEA → Research → PRD → Google Stitch → Claude Code → QA → Security → Ship → Launch
```

---

## Quick Start

```bash
# Clone
git clone https://github.com/egiganti/product-os.git
cd product-os

# Initialize your project
./os init

# Install all skills
./os install-all

# Start building
./os research
./os prd
./os stitch
./os ship
```

---

## CLI Commands

```bash
./os help          # All commands
./os research      # Market research agent
./os prd           # PRD generator
./os stitch        # Google Stitch design workflow
./os qa            # QA agent (test-first)
./os security      # OWASP security scan
./os ship          # Pre-ship checklist
./os launch        # Go-to-market agent
./os status        # Current project phase
```

---

## Agents

| Agent | Role | Trigger |
|-------|------|---------|
| Research | Market analysis, competitors | `./os research` |
| Product | PRD, user stories, sprints | `./os prd` |
| Architect | Stack, design.md | `./os design` |
| Stitch | Google Stitch UI workflow | `./os stitch` |
| QA | Test-first loop, E2E | `./os qa` |
| Security | OWASP scan | Every push (CI) |
| Launch | GTM, SEO, metrics | `./os launch` |

---

## CI/CD (GitHub Actions)

| Trigger | Workflow |
|---------|----------|
| Push any branch | Security scan |
| Open PR | QA agent + coverage |
| Merge to main | Deploy to Vercel |

---

## vs. The Competition

| | product-os | BMAD | Spec-Kit |
|--|:---------:|:----:|:--------:|
| Research agent | ✅ | ⚠️ | ❌ |
| Google Stitch | ✅ | ❌ | ❌ |
| CI/CD native | ✅ | ❌ | ❌ |
| QA test-first | ✅ | ✅ | ❌ |
| Full end-to-end | ✅ | ❌ | ❌ |

---

## Support

If product-os saves you time:

- ⭐ **Star this repo**
- ☕ **[Support on Ko-fi](https://ko-fi.com/ezegiga)**
- 🐛 **Open issues**

---

## License

MIT — free forever.

> Some capabilities are powered by open-source tooling from the agent skills ecosystem.
