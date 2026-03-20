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

Invoke via `./skills.sh <agent>` or use subagents directly in Claude Code.

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

```
Current phase: [READ FROM claude-progress.txt]
Last completed: [READ FROM claude-progress.txt]
Next action: [READ FROM claude-progress.txt]
```

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

Override in `templates/design.md` per project.

---

## Development Rules

### Always
- ✅ Read `claude-progress.txt` at session start
- ✅ Write tests BEFORE writing implementation (QA agent first)
- ✅ Run `./skills.sh security` before any PR
- ✅ Atomic commits with semantic messages (`feat:`, `fix:`, `chore:`)
- ✅ Update `claude-progress.txt` at session end

### Never
- ❌ Secrets or API keys in code — use `.env.local` + `.env.example`
- ❌ Merge without QA agent approval
- ❌ Skip the PRD phase — no code without specs
- ❌ Mark a feature complete without E2E verification
- ❌ One-shot large features — break into atomic stories

---

## Workflow: The product-os Loop

```
1. RESEARCH    → ./skills.sh research
2. PRD         → ./skills.sh prd
3. DESIGN      → ./skills.sh stitch → ./skills.sh design
4. SPRINT      → ./skills.sh sprint
5. BUILD       → Claude Code + dev agent
6. QA          → ./skills.sh qa (runs before every PR)
7. SECURITY    → ./skills.sh security (runs on every push via CI)
8. SHIP        → ./skills.sh ship → auto-deploy on merge to main
9. LAUNCH      → ./skills.sh launch
```

---

## Agile Methodology

- **Sprint length:** 1 week
- **Story format:** As a [user], I want [action], so that [outcome]
- **Acceptance criteria:** Defined BEFORE development starts
- **Definition of Done:** Tests pass + Security scan clean + E2E verified + Metrics instrumented
- **Retrospective:** End of every sprint — what worked, what didn't, what to change

---

## Context Management

- Keep CLAUDE.md under 500 lines
- Each agent has its own isolated context (see `.claude/agents/`)
- Use `claude-progress.txt` to bridge sessions
- Prefer subagents for isolated tasks (security review, QA, research)

---

## Subagent Delegation Pattern

```
"Use the security subagent to review this authentication code."
"Use the QA subagent to write tests for the payment flow."
"Use the research subagent to analyze competitors for [feature]."
```

---

## Skills Ecosystem

This project uses skills from [skills.sh](https://skills.sh). Install all at once:

```bash
./skills.sh install-all
```

Or install individually:

```bash
npx skills add google-labs-code/stitch-skills/design-md
npx skills add obra/superpowers/test-driven-development
npx skills add anthropics/skills/frontend-design
# ... see skills.sh for full list
```

---

## CI/CD Pipeline

| Trigger | Workflow | Agent |
|---------|----------|-------|
| Push any branch | `security-scan.yml` | Security Agent |
| Open PR | `qa-review.yml` | QA Agent |
| Open PR | `agent-pr-comment.yml` | Review Agent |
| Merge to main | `deploy.yml` | Deploy |

---

## Product Mindset

> "Done ≠ shipped. Done = metrics moving."

- Every feature ships with at least 1 success metric
- Analytics tracking from sprint 1, never retrofitted
- User feedback loop built into launch checklist
- SEO and performance are features, not afterthoughts
