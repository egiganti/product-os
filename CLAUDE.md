# product-os — The Operating System for AI-Native Product Teams

> Build products people love. From raw idea to live product — with agents, structure, and zero chaos.

---

## What is product-os?

`product-os` is a framework that replaces vibe coding chaos with a structured, repeatable system for building world-class products using AI agents.

**Unlike BMAD, Spec-Kit, or any other framework**, product-os covers the full stack:
- 🔍 **Research** (Grok / Claude Deep Research)
- 📋 **Product** (PRD + Agile sprints)
- 🎨 **Design** (Google Stitch → design.md)
- ⚡ **Build** (Claude Code + specialized subagents)
- 🧪 **QA** (test-first agent loop)
- 🔒 **Security** (OWASP baseline, always-on)
- 🚀 **Ship** (CI/CD → Vercel/Railway)
- 📣 **Launch** (marketing + metrics from day 1)

---

## Agents Available

Invoke via `./os <agent>` or use subagents directly in Claude Code.

| Agent | File | Role |
|-------|------|------|
| Research | `.claude/agents/research.md` | Market research, competitive analysis |
| Product | `.claude/agents/product.md` | PRD, user stories, sprint planning |
| Architect | `.claude/agents/architect.md` | Stack decisions, design.md, system design |
| Stitch | `.claude/agents/stitch.md` | Google Stitch brief → UI components |
| Dev | `.claude/agents/dev.md` | Implementation, Claude Code patterns |
| QA | `.claude/agents/qa.md` | Test-first, E2E, verification |
| Security | `.claude/agents/security.md` | OWASP, secrets, auth, hardening |
| Launch | `.claude/agents/launch.md` | Go-to-market, metrics, SEO |

---

## Project State

Always read `claude-progress.txt` before starting any session.
Always update `claude-progress.txt` after completing any phase.

---

## Stack Defaults

```
Frontend:   Next.js 15 + TypeScript + Tailwind + shadcn/ui
Backend:    Next.js API routes or FastAPI (Python)
DB:         Supabase (Postgres + Auth + Storage)
Deploy:     Vercel (frontend) / Railway (backend)
CI/CD:      GitHub Actions
Testing:    Vitest + Playwright
Design:     Google Stitch → React components
```

---

## Development Rules

### Always
- ✅ Read `claude-progress.txt` at session start
- ✅ Write tests BEFORE writing implementation (QA agent first)
- ✅ Run `./os security` before any PR
- ✅ Atomic commits with semantic messages (`feat:`, `fix:`, `chore:`)
- ✅ Update `claude-progress.txt` at session end

### Never
- ❌ Secrets or API keys in code — use `.env.local` + `.env.example`
- ❌ Merge without QA agent approval
- ❌ Skip the PRD phase — no code without specs
- ❌ Mark a feature complete without E2E verification

---

## Workflow: The product-os Loop

```
1. RESEARCH    → ./os research
2. PRD         → ./os prd
3. DESIGN      → ./os stitch → ./os design
4. SPRINT      → ./os sprint
5. BUILD       → Claude Code + dev agent
6. QA          → ./os qa
7. SECURITY    → ./os security (CI on every push)
8. SHIP        → ./os ship → auto-deploy on merge to main
9. LAUNCH      → ./os launch
```

---

## Agile Methodology

- **Sprint length:** 1 week
- **Story format:** As a [user], I want [action], so that [outcome]
- **Acceptance criteria:** Defined BEFORE development starts
- **Definition of Done:** Tests pass + Security scan clean + E2E verified + Metrics instrumented

---

## Skills

Some capabilities are powered by open-source tooling from the agent skills ecosystem.

Install all:
```bash
./os install-all
```
