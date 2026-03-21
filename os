#!/usr/bin/env bash
# ============================================================
#  product-os — os
#  The CLI for your AI-native product OS
#  Usage: ./os <skill> [options]
# ============================================================

set -euo pipefail

# ── Colors ──────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ── Config ───────────────────────────────────────────────────
FRAMEWORK_VERSION="1.0.0"
PROGRESS_FILE="claude-progress.txt"
SKILLS_DIR=".claude/agents"

# ── Helpers ──────────────────────────────────────────────────
log()     { echo -e "${CYAN}[product-os]${RESET} $*"; }
success() { echo -e "${GREEN}✓${RESET} $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET}  $*"; }
error()   { echo -e "${RED}✗${RESET}  $*"; exit 1; }
section() { echo -e "\n${BOLD}${BLUE}══ $* ══${RESET}\n"; }

check_progress() {
  if [ ! -f "$PROGRESS_FILE" ]; then
    warn "claude-progress.txt not found. Creating initial state..."
    cat > "$PROGRESS_FILE" << EOF
# product-os — Project Progress

## Current Phase
research

## Project Name
[not set]

## Last Completed
[none — just initialized]

## Next Action
Run: ./os research

## Sprint
[not started]

## Notes
[add notes here]
EOF
    success "Created claude-progress.txt"
  fi
}

print_banner() {
  echo -e "${BOLD}${CYAN}"
  echo "  ██████╗ ██████╗  ██████╗ ██████╗ ██╗   ██╗ ██████╗████████╗      ██████╗ ███████╗"
  echo "  ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██║   ██║██╔════╝╚══██╔══╝     ██╔═══██╗██╔════╝"
  echo "  ██████╔╝██████╔╝██║   ██║██║  ██║██║   ██║██║        ██║   █████╗██║   ██║███████╗"
  echo "  ██╔═══╝ ██╔══██╗██║   ██║██║  ██║██║   ██║██║        ██║   ╚════╝██║   ██║╚════██║"
  echo "  ██║     ██║  ██║╚██████╔╝██████╔╝╚██████╔╝╚██████╗   ██║        ╚██████╔╝███████║"
  echo "  ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝  ╚═════╝   ╚═╝         ╚═════╝ ╚══════╝"
  echo -e "${RESET}"
  echo -e "  ${BOLD}The Operating System for AI-Native Product Teams${RESET} — v${FRAMEWORK_VERSION}"
  echo -e "  ${BLUE}https://github.com/[your-username]/product-os${RESET}\n"
}

update_progress() {
  local phase="$1"
  local note="$2"
  local timestamp
  timestamp=$(date '+%Y-%m-%d %H:%M')
  sed -i.bak "s/## Current Phase.*/## Current Phase\n${phase}/" "$PROGRESS_FILE" 2>/dev/null || true
  echo "[$timestamp] ${phase}: ${note}" >> "$PROGRESS_FILE"
  success "Progress updated → ${phase}"
}

# ── Skill: help ──────────────────────────────────────────────
skill_help() {
  print_banner
  echo -e "${BOLD}Available Skills:${RESET}\n"

  echo -e "  ${BOLD}${CYAN}PRODUCT${RESET}"
  echo -e "  ${GREEN}./os research${RESET}      Run the Research Agent (market, competitors, pain points)"
  echo -e "  ${GREEN}./os prd${RESET}           Generate PRD interactively with the Product Agent"
  echo -e "  ${GREEN}./os sprint${RESET}        Kick off a new sprint with user stories + acceptance criteria"
  echo -e "  ${GREEN}./os brainstorm${RESET}    Structured idea exploration before committing to a direction"

  echo -e "\n  ${BOLD}${CYAN}DESIGN${RESET}"
  echo -e "  ${GREEN}./os stitch${RESET}        Generate Google Stitch brief → UI design"
  echo -e "  ${GREEN}./os design${RESET}        Create design.md (stack + architecture + UX decisions)"

  echo -e "\n  ${BOLD}${CYAN}DEVELOPMENT${RESET}"
  echo -e "  ${GREEN}./os dev${RESET}           Load dev agent context + coding best practices"
  echo -e "  ${GREEN}./os agents${RESET}        Spin up parallel subagents for complex tasks"
  echo -e "  ${GREEN}./os debug${RESET}         Systematic debugging agent"

  echo -e "\n  ${BOLD}${CYAN}QA & SECURITY${RESET}"
  echo -e "  ${GREEN}./os qa${RESET}            Run QA Agent (test-first loop, E2E, edge cases)"
  echo -e "  ${GREEN}./os e2e${RESET}           Playwright E2E test suite"
  echo -e "  ${GREEN}./os security${RESET}      OWASP security scan + hardening checklist"
  echo -e "  ${GREEN}./os verify${RESET}        Pre-merge verification checklist"

  echo -e "\n  ${BOLD}${CYAN}SHIP & LAUNCH${RESET}"
  echo -e "  ${GREEN}./os ship${RESET}          Pre-ship checklist + deploy to production"
  echo -e "  ${GREEN}./os launch${RESET}        Go-to-market checklist (SEO, analytics, marketing)"
  echo -e "  ${GREEN}./os metrics${RESET}       Analytics tracking setup"

  echo -e "\n  ${BOLD}${CYAN}FRAMEWORK${RESET}"
  echo -e "  ${GREEN}./os install-all${RESET}   Install all skills from os ecosystem"
  echo -e "  ${GREEN}./os status${RESET}        Show current project phase and progress"
  echo -e "  ${GREEN}./os init${RESET}          Initialize product-os in a new project"
  echo -e "  ${GREEN}./os help${RESET}          Show this help\n"
}

# ── Skill: status ────────────────────────────────────────────
skill_status() {
  check_progress
  section "Project Status"
  cat "$PROGRESS_FILE"
}

# ── Skill: init ──────────────────────────────────────────────
skill_init() {
  section "Initializing product-os"
  check_progress

  read -rp "  Project name: " project_name
  read -rp "  One-line description: " project_desc

  sed -i.bak "s/\[not set\]/${project_name}/" "$PROGRESS_FILE"
  success "Initialized: ${project_name}"
  log "Description: ${project_desc}"
  log "Next step: ./os research"
}

# ── Skill: install-all ───────────────────────────────────────
skill_install_all() {
  section "Installing skills from os ecosystem"

  log "Installing Product skills..."
  npx skills add github/awesome-copilot/prd
  npx skills add obra/superpowers/brainstorming
  npx skills add obra/superpowers/writing-plans
  success "Product skills installed"

  log "Installing Design skills (Google Stitch stack)..."
  npx skills add google-labs-code/stitch-skills/design-md
  npx skills add google-labs-code/stitch-skills/stitch-loop
  npx skills add google-labs-code/stitch-skills/react:components
  npx skills add google-labs-code/stitch-skills/enhance-prompt
  npx skills add google-labs-code/stitch-skills/shadcn-ui
  npx skills add anthropics/skills/frontend-design
  npx skills add vercel-labs/agent-skills/web-design-guidelines
  success "Design skills installed"

  log "Installing Dev skills..."
  npx skills add vercel-labs/agent-skills/vercel-react-best-practices
  npx skills add vercel-labs/next-skills/next-best-practices
  npx skills add wshobson/agents/api-design-principles
  npx skills add wshobson/agents/typescript-advanced-types
  npx skills add obra/superpowers/subagent-driven-development
  npx skills add obra/superpowers/dispatching-parallel-agents
  npx skills add obra/superpowers/systematic-debugging
  npx skills add obra/superpowers/using-git-worktrees
  success "Dev skills installed"

  log "Installing QA skills..."
  npx skills add obra/superpowers/test-driven-development
  npx skills add anthropics/skills/webapp-testing
  npx skills add currents-dev/playwright-best-practices-skill/playwright-best-practices
  npx skills add obra/superpowers/verification-before-completion
  npx skills add supercent-io/skills-template/backend-testing
  success "QA skills installed"

  log "Installing Security skills..."
  npx skills add supercent-io/skills-template/security-best-practices
  npx skills add pbakaus/impeccable/harden
  npx skills add supercent-io/skills-template/authentication-setup
  success "Security skills installed"

  log "Installing CI/CD & Ship skills..."
  npx skills add github/awesome-copilot/git-commit
  npx skills add supercent-io/skills-template/git-workflow
  npx skills add obra/superpowers/finishing-a-development-branch
  npx skills add obra/superpowers/requesting-code-review
  npx skills add obra/superpowers/receiving-code-review
  npx skills add vercel-labs/agent-skills/deploy-to-vercel
  npx skills add supercent-io/skills-template/monitoring-observability
  success "Ship skills installed"

  log "Installing Launch & Marketing skills..."
  npx skills add coreyhaines31/marketingskills/launch-strategy
  npx skills add coreyhaines31/marketingskills/pricing-strategy
  npx skills add coreyhaines31/marketingskills/seo-audit
  npx skills add coreyhaines31/marketingskills/analytics-tracking
  success "Launch skills installed"

  success "All skills installed! Run ./os help to see what's available."
  update_progress "setup" "All skills installed"
}

# ── Skill: research ──────────────────────────────────────────
skill_research() {
  section "Research Agent"
  check_progress
  log "Loading research agent from ${SKILLS_DIR}/research.md"
  log "Installing research skills if needed..."
  npx skills add obra/superpowers/brainstorming 2>/dev/null || true
  echo -e "\n${BOLD}Research Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Use the research subagent to analyze the market for [your idea]\"${RESET}"
  echo -e "Or open Claude Code and run: ${CYAN}/research${RESET}\n"
  update_progress "research" "Research agent activated"
}

# ── Skill: prd ───────────────────────────────────────────────
skill_prd() {
  section "Product Agent — PRD Generator"
  check_progress
  npx skills add github/awesome-copilot/prd 2>/dev/null || true
  npx skills add obra/superpowers/writing-plans 2>/dev/null || true
  echo -e "\n${BOLD}Product Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Use the product subagent to create a PRD for [your product]\"${RESET}"
  echo -e "Template: ${CYAN}templates/PRD.md${RESET}\n"
  update_progress "prd" "Product agent activated for PRD creation"
}

# ── Skill: stitch ────────────────────────────────────────────
skill_stitch() {
  section "Google Stitch Design Agent"
  check_progress
  npx skills add google-labs-code/stitch-skills/design-md 2>/dev/null || true
  npx skills add google-labs-code/stitch-skills/enhance-prompt 2>/dev/null || true
  npx skills add google-labs-code/stitch-skills/stitch-loop 2>/dev/null || true
  npx skills add google-labs-code/stitch-skills/react:components 2>/dev/null || true
  npx skills add google-labs-code/stitch-skills/shadcn-ui 2>/dev/null || true
  echo -e "\n${BOLD}Stitch Design Agent activated.${RESET}"
  echo -e "Workflow:"
  echo -e "  1. Fill in ${CYAN}templates/stitch/stitch-brief.md${RESET}"
  echo -e "  2. Go to ${CYAN}https://stitch.withgoogle.com/${RESET}"
  echo -e "  3. Paste the brief → generate UI"
  echo -e "  4. Export components → place in ${CYAN}components/ui/${RESET}"
  echo -e "  5. Run ${CYAN}./os design${RESET} to generate design.md\n"
  update_progress "design" "Stitch agent activated"
}

# ── Skill: design ────────────────────────────────────────────
skill_design() {
  section "Architecture & Design Agent"
  check_progress
  npx skills add google-labs-code/stitch-skills/design-md 2>/dev/null || true
  echo -e "\n${BOLD}Design Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Use the architect subagent to generate design.md for this project\"${RESET}"
  echo -e "Output: ${CYAN}design.md${RESET} (stack, architecture, decisions)\n"
  update_progress "design" "design.md generation started"
}

# ── Skill: sprint ────────────────────────────────────────────
skill_sprint() {
  section "Sprint Kickoff Agent"
  check_progress
  npx skills add obra/superpowers/writing-plans 2>/dev/null || true
  echo -e "\n${BOLD}Sprint Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Use the product subagent to plan sprint [N] from PRD.md\"${RESET}"
  echo -e "Output: User stories with acceptance criteria in ${CYAN}sprints/sprint-N.md${RESET}\n"
  update_progress "sprint" "Sprint planning started"
}

# ── Skill: qa ────────────────────────────────────────────────
skill_qa() {
  section "QA Agent — Test-First Loop"
  check_progress
  npx skills add obra/superpowers/test-driven-development 2>/dev/null || true
  npx skills add obra/superpowers/verification-before-completion 2>/dev/null || true
  npx skills add anthropics/skills/webapp-testing 2>/dev/null || true
  echo -e "\n${BOLD}QA Agent activated.${RESET}"
  echo -e "Workflow:"
  echo -e "  1. QA agent writes tests FIRST"
  echo -e "  2. Tests run and FAIL (expected)"
  echo -e "  3. Dev agent implements to make tests PASS"
  echo -e "  4. QA agent verifies E2E"
  echo ""
  echo -e "Tell Claude Code: ${CYAN}\"Use the QA subagent to write tests for [feature]\"${RESET}\n"
  update_progress "qa" "QA agent activated"
}

# ── Skill: security ──────────────────────────────────────────
skill_security() {
  section "Security Agent — OWASP Scan"
  check_progress
  npx skills add supercent-io/skills-template/security-best-practices 2>/dev/null || true
  npx skills add pbakaus/impeccable/harden 2>/dev/null || true
  echo -e "\n${BOLD}Security Agent activated.${RESET}"
  echo -e "Checklist:"
  echo -e "  ${CYAN}□${RESET} SQL injection / XSS / command injection"
  echo -e "  ${CYAN}□${RESET} Auth and authorization flows"
  echo -e "  ${CYAN}□${RESET} Secrets in code (use grep or trufflehog)"
  echo -e "  ${CYAN}□${RESET} Insecure data handling"
  echo -e "  ${CYAN}□${RESET} Dependencies with known CVEs"
  echo ""
  echo -e "Tell Claude Code: ${CYAN}\"Use the security subagent to review this codebase\"${RESET}"
  echo -e "Or run in CI: triggered automatically on every push\n"
  update_progress "security" "Security scan initiated"
}

# ── Skill: ship ──────────────────────────────────────────────
skill_ship() {
  section "Ship Agent — Pre-Deploy Checklist"
  check_progress

  echo -e "\n${BOLD}Pre-Ship Checklist:${RESET}"
  echo -e "  ${CYAN}□${RESET} All tests passing (./os qa)"
  echo -e "  ${CYAN}□${RESET} Security scan clean (./os security)"
  echo -e "  ${CYAN}□${RESET} E2E verified in staging"
  echo -e "  ${CYAN}□${RESET} .env.example updated"
  echo -e "  ${CYAN}□${RESET} No console.logs in production code"
  echo -e "  ${CYAN}□${RESET} Error handling in all API routes"
  echo -e "  ${CYAN}□${RESET} Performance: Lighthouse score > 90"
  echo -e "  ${CYAN}□${RESET} Analytics tracking verified"
  echo -e "  ${CYAN}□${RESET} Rollback plan documented"

  npx skills add vercel-labs/agent-skills/deploy-to-vercel 2>/dev/null || true

  echo ""
  echo -e "${BOLD}Ready to ship?${RESET}"
  echo -e "  Push to main → CI/CD triggers automatically"
  echo -e "  Or: ${CYAN}git push origin main${RESET}\n"
  update_progress "shipping" "Pre-ship checklist completed"
}

# ── Skill: launch ────────────────────────────────────────────
skill_launch() {
  section "Launch Agent — Go-To-Market"
  check_progress
  npx skills add coreyhaines31/marketingskills/launch-strategy 2>/dev/null || true
  npx skills add coreyhaines31/marketingskills/analytics-tracking 2>/dev/null || true
  npx skills add coreyhaines31/marketingskills/seo-audit 2>/dev/null || true
  echo -e "\n${BOLD}Launch Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Use the launch subagent to create a go-to-market plan\"${RESET}\n"
  update_progress "launch" "Go-to-market planning started"
}

# ── Skill: e2e ───────────────────────────────────────────────
skill_e2e() {
  section "E2E Testing — Playwright"
  npx skills add currents-dev/playwright-best-practices-skill/playwright-best-practices 2>/dev/null || true
  echo -e "\n${BOLD}E2E Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Use the QA subagent with Playwright to test the full user journey\"${RESET}\n"
}

# ── Skill: verify ────────────────────────────────────────────
skill_verify() {
  section "Verification Before Completion"
  npx skills add obra/superpowers/verification-before-completion 2>/dev/null || true
  echo -e "\n${BOLD}Verify: never mark a feature done without this.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Verify this feature end-to-end before marking complete\"${RESET}\n"
}

# ── Skill: debug ─────────────────────────────────────────────
skill_debug() {
  section "Systematic Debugging Agent"
  npx skills add obra/superpowers/systematic-debugging 2>/dev/null || true
  echo -e "\n${BOLD}Debug Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Use systematic debugging to find the root cause of [issue]\"${RESET}\n"
}

# ── Skill: agents ────────────────────────────────────────────
skill_agents() {
  section "Parallel Subagents"
  npx skills add obra/superpowers/subagent-driven-development 2>/dev/null || true
  npx skills add obra/superpowers/dispatching-parallel-agents 2>/dev/null || true
  echo -e "\n${BOLD}Parallel Agent mode activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Dispatch parallel subagents to work on [feature A] and [feature B] simultaneously\"${RESET}\n"
}

# ── Skill: brainstorm ────────────────────────────────────────
skill_brainstorm() {
  section "Brainstorm Agent"
  npx skills add obra/superpowers/brainstorming 2>/dev/null || true
  echo -e "\n${BOLD}Brainstorm Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Help me brainstorm ideas for [topic] using structured exploration\"${RESET}\n"
}

# ── Skill: metrics ───────────────────────────────────────────
skill_metrics() {
  section "Analytics & Metrics Setup"
  npx skills add coreyhaines31/marketingskills/analytics-tracking 2>/dev/null || true
  echo -e "\n${BOLD}Metrics Agent activated.${RESET}"
  echo -e "Tell Claude Code: ${CYAN}\"Set up analytics tracking for [product] with success metrics from the PRD\"${RESET}\n"
}

# ── Skill: dev ───────────────────────────────────────────────
skill_dev() {
  section "Dev Agent — Claude Code Patterns"
  npx skills add vercel-labs/agent-skills/vercel-react-best-practices 2>/dev/null || true
  npx skills add vercel-labs/next-skills/next-best-practices 2>/dev/null || true
  npx skills add wshobson/agents/typescript-advanced-types 2>/dev/null || true
  echo -e "\n${BOLD}Dev Agent activated.${RESET}"
  echo -e "Best practices loaded for: Next.js + TypeScript + React\n"
}

# ── Main router ──────────────────────────────────────────────
main() {
  local skill="${1:-help}"

  case "$skill" in
    help|--help|-h)   skill_help ;;
    status)           skill_status ;;
    init)             skill_init ;;
    install-all)      skill_install_all ;;
    research)         skill_research ;;
    prd)              skill_prd ;;
    stitch)           skill_stitch ;;
    design)           skill_design ;;
    sprint)           skill_sprint ;;
    qa)               skill_qa ;;
    e2e)              skill_e2e ;;
    security)         skill_security ;;
    verify)           skill_verify ;;
    ship)             skill_ship ;;
    launch)           skill_launch ;;
    debug)            skill_debug ;;
    agents)           skill_agents ;;
    brainstorm)       skill_brainstorm ;;
    metrics)          skill_metrics ;;
    dev)              skill_dev ;;
    *)
      error "Unknown skill: '${skill}'. Run ./os help to see all available skills."
      ;;
  esac
}

main "$@"
