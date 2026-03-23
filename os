#!/usr/bin/env bash
# ============================================================
#  product-os — os
#  The CLI for your AI-native product OS
#  Usage: ./os <skill> [options]
# ============================================================

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

FRAMEWORK_VERSION="1.0.0"
PROGRESS_FILE="claude-progress.txt"

log()     { echo -e "${CYAN}[product-os]${RESET} $*"; }
success() { echo -e "${GREEN}✓${RESET} $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET}  $*"; }
error()   { echo -e "${RED}✗${RESET}  $*"; exit 1; }
section() { echo -e "\n${BOLD}${BLUE}══ $* ══${RESET}\n"; }

check_progress() {
  if [ ! -f "$PROGRESS_FILE" ]; then
    warn "claude-progress.txt not found. Creating..."
    cat > "$PROGRESS_FILE" << EOF
# product-os — Project Progress
## Current Phase
setup
## Last Completed
Initialized
## Next Action
Run: ./os research
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
  echo -e "  ${BOLD}The OS for AI-Native Product Teams${RESET} — v${FRAMEWORK_VERSION}"
  echo -e "  ${BLUE}https://github.com/egiganti/product-os${RESET}\n"
}

update_progress() {
  local phase="$1"
  local note="$2"
  local timestamp
  timestamp=$(date '+%Y-%m-%d %H:%M')
  echo "[$timestamp] ${phase}: ${note}" >> "$PROGRESS_FILE"
  success "Progress updated → ${phase}"
}

skill_help() {
  print_banner
  echo -e "${BOLD}Available Skills:${RESET}\n"
  echo -e "  ${BOLD}${CYAN}PRODUCT${RESET}"
  echo -e "  ${GREEN}./os research${RESET}      Research agent"
  echo -e "  ${GREEN}./os prd${RESET}           Product requirements generator"
  echo -e "  ${GREEN}./os sprint${RESET}        Sprint kickoff"
  echo -e "  ${GREEN}./os brainstorm${RESET}    Idea exploration"
  echo -e "\n  ${BOLD}${CYAN}DESIGN${RESET}"
  echo -e "  ${GREEN}./os stitch${RESET}        Google Stitch design workflow"
  echo -e "  ${GREEN}./os design${RESET}        Generate design.md"
  echo -e "\n  ${BOLD}${CYAN}DEVELOPMENT${RESET}"
  echo -e "  ${GREEN}./os dev${RESET}           Dev agent"
  echo -e "  ${GREEN}./os agents${RESET}        Parallel subagents"
  echo -e "  ${GREEN}./os debug${RESET}         Systematic debugging"
  echo -e "\n  ${BOLD}${CYAN}QA & SECURITY${RESET}"
  echo -e "  ${GREEN}./os qa${RESET}            QA agent (test-first)"
  echo -e "  ${GREEN}./os e2e${RESET}           Playwright E2E tests"
  echo -e "  ${GREEN}./os security${RESET}      OWASP security scan"
  echo -e "  ${GREEN}./os verify${RESET}        Pre-merge checklist"
  echo -e "\n  ${BOLD}${CYAN}SHIP & LAUNCH${RESET}"
  echo -e "  ${GREEN}./os ship${RESET}          Pre-ship checklist"
  echo -e "  ${GREEN}./os launch${RESET}        Go-to-market"
  echo -e "  ${GREEN}./os metrics${RESET}       Analytics setup"
  echo -e "\n  ${BOLD}${CYAN}FRAMEWORK${RESET}"
  echo -e "  ${GREEN}./os install-all${RESET}   Install all skills"
  echo -e "  ${GREEN}./os status${RESET}        Project phase"
  echo -e "  ${GREEN}./os init${RESET}          Initialize project"
  echo -e "  ${GREEN}./os help${RESET}          This help\n"
}

skill_status() { check_progress; section "Project Status"; cat "$PROGRESS_FILE"; }

skill_init() {
  section "Initializing product-os"
  check_progress
  read -rp "  Project name: " project_name
  success "Initialized: ${project_name}"
  log "Next: ./os research"
}

skill_research()  { check_progress; section "Research Agent"; npx skills add obra/superpowers/brainstorming 2>/dev/null || true; echo -e "\n${BOLD}Research Agent ready.${RESET}\nTell Claude Code: ${CYAN}\"Use the research subagent to analyze [topic]\"${RESET}\n"; update_progress "research" "activated"; }
skill_prd()       { check_progress; section "Product Agent — PRD"; npx skills add github/awesome-copilot/prd 2>/dev/null || true; echo -e "\n${BOLD}Product Agent ready.${RESET}\nTell Claude Code: ${CYAN}\"Use the product subagent to create a PRD for [product]\"${RESET}\n"; update_progress "prd" "activated"; }
skill_stitch()    { check_progress; section "Google Stitch Agent"; npx skills add google-labs-code/stitch-skills/design-md 2>/dev/null || true; npx skills add google-labs-code/stitch-skills/stitch-loop 2>/dev/null || true; echo -e "\n${BOLD}Stitch Agent ready.${RESET}\n1. Fill templates/stitch/stitch-brief.md\n2. Go to https://stitch.withgoogle.com\n3. Run ./os design after export\n"; update_progress "design" "stitch activated"; }
skill_design()    { check_progress; section "Architect Agent"; npx skills add google-labs-code/stitch-skills/design-md 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Use the architect subagent to generate design.md\"${RESET}\n"; update_progress "design" "design.md started"; }
skill_sprint()    { check_progress; section "Sprint Agent"; npx skills add obra/superpowers/writing-plans 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Use the product subagent to plan sprint [N] from PRD.md\"${RESET}\n"; update_progress "sprint" "started"; }
skill_qa()        { check_progress; section "QA Agent — Test-First"; npx skills add obra/superpowers/test-driven-development 2>/dev/null || true; npx skills add obra/superpowers/verification-before-completion 2>/dev/null || true; echo -e "\n${BOLD}QA Agent ready.${RESET}\nTell Claude Code: ${CYAN}\"Use the QA subagent to write tests for [feature]\"${RESET}\n"; update_progress "qa" "activated"; }
skill_security()  { check_progress; section "Security Agent"; npx skills add supercent-io/skills-template/security-best-practices 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Use the security subagent to review this codebase\"${RESET}\n"; update_progress "security" "scan initiated"; }
skill_ship()      { check_progress; section "Ship Checklist"; echo -e "\n${BOLD}Pre-Ship:${RESET}\n  □ Tests passing (./os qa)\n  □ Security clean (./os security)\n  □ E2E verified\n  □ .env.example updated\n  □ Analytics tracking\n"; npx skills add vercel-labs/agent-skills/deploy-to-vercel 2>/dev/null || true; update_progress "shipping" "checklist done"; }
skill_launch()    { check_progress; section "Launch Agent"; npx skills add coreyhaines31/marketingskills/launch-strategy 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Use the launch subagent to create a go-to-market plan\"${RESET}\n"; update_progress "launch" "started"; }
skill_dev()       { section "Dev Agent"; npx skills add vercel-labs/agent-skills/vercel-react-best-practices 2>/dev/null || true; npx skills add vercel-labs/next-skills/next-best-practices 2>/dev/null || true; echo -e "\n${BOLD}Dev Agent ready.${RESET}\n"; }
skill_agents()    { section "Parallel Subagents"; npx skills add obra/superpowers/subagent-driven-development 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Dispatch parallel subagents for [task A] and [task B]\"${RESET}\n"; }
skill_debug()     { section "Debug Agent"; npx skills add obra/superpowers/systematic-debugging 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Use systematic debugging for [issue]\"${RESET}\n"; }
skill_e2e()       { section "E2E Playwright"; npx skills add currents-dev/playwright-best-practices-skill/playwright-best-practices 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Use the QA subagent with Playwright to test the full user journey\"${RESET}\n"; }
skill_verify()    { section "Verify Before Done"; npx skills add obra/superpowers/verification-before-completion 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Verify this feature end-to-end before marking complete\"${RESET}\n"; }
skill_metrics()   { section "Metrics Setup"; npx skills add coreyhaines31/marketingskills/analytics-tracking 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Set up analytics tracking for [product]\"${RESET}\n"; }
skill_brainstorm(){ section "Brainstorm Agent"; npx skills add obra/superpowers/brainstorming 2>/dev/null || true; echo -e "\nTell Claude Code: ${CYAN}\"Help me brainstorm [topic]\"${RESET}\n"; }

skill_install_all() {
  section "Installing all skills"
  for skill in github/awesome-copilot/prd obra/superpowers/brainstorming obra/superpowers/writing-plans \
    google-labs-code/stitch-skills/design-md google-labs-code/stitch-skills/stitch-loop \
    google-labs-code/stitch-skills/react:components anthropics/skills/frontend-design \
    vercel-labs/agent-skills/vercel-react-best-practices vercel-labs/next-skills/next-best-practices \
    wshobson/agents/typescript-advanced-types obra/superpowers/subagent-driven-development \
    obra/superpowers/systematic-debugging obra/superpowers/test-driven-development \
    anthropics/skills/webapp-testing currents-dev/playwright-best-practices-skill/playwright-best-practices \
    obra/superpowers/verification-before-completion supercent-io/skills-template/security-best-practices \
    pbakaus/impeccable/harden vercel-labs/agent-skills/deploy-to-vercel \
    obra/superpowers/requesting-code-review coreyhaines31/marketingskills/launch-strategy \
    coreyhaines31/marketingskills/analytics-tracking; do
    npx skills add "$skill" 2>/dev/null || true
  done
  success "All skills installed"
  update_progress "setup" "all skills installed"
}

main() {
  local skill="${1:-help}"
  case "$skill" in
    help|--help|-h) skill_help ;;
    status)         skill_status ;;
    init)           skill_init ;;
    install-all)    skill_install_all ;;
    research)       skill_research ;;
    prd)            skill_prd ;;
    stitch)         skill_stitch ;;
    design)         skill_design ;;
    sprint)         skill_sprint ;;
    qa)             skill_qa ;;
    e2e)            skill_e2e ;;
    security)       skill_security ;;
    verify)         skill_verify ;;
    ship)           skill_ship ;;
    launch)         skill_launch ;;
    debug)          skill_debug ;;
    agents)         skill_agents ;;
    brainstorm)     skill_brainstorm ;;
    metrics)        skill_metrics ;;
    dev)            skill_dev ;;
    *)              error "Unknown skill: '${skill}'. Run ./os help" ;;
  esac
}

main "$@"
