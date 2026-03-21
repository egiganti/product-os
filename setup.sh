#!/usr/bin/env bash
# ============================================================
#  product-os setup.sh
#  Run once to set up product-os in a new project
#  Usage: curl -sSL https://raw.githubusercontent.com/[your-username]/product-os/main/setup.sh | bash
# ============================================================

set -euo pipefail

GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

log()     { echo -e "${CYAN}[product-os]${RESET} $*"; }
success() { echo -e "${GREEN}✓${RESET} $*"; }

echo -e "${BOLD}${CYAN}"
echo "  Installing product-os..."
echo -e "${RESET}"

# Check dependencies
command -v node >/dev/null 2>&1 || { echo "Node.js 20+ required. Install from nodejs.org"; exit 1; }
command -v git  >/dev/null 2>&1 || { echo "git required."; exit 1; }

NODE_VERSION=$(node -v | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt 20 ]; then
  echo "Node.js 20+ required. You have $(node -v)"
  exit 1
fi

# Clone or copy framework files
PRODUCT_OS_DIR="$(pwd)"

log "Copying framework files..."

# Create directory structure
mkdir -p .claude/agents
mkdir -p .github/workflows
mkdir -p .github/ISSUE_TEMPLATE
mkdir -p templates/stitch
mkdir -p research
mkdir -p sprints
mkdir -p launch

# Copy core files if they don't exist
[ -f "CLAUDE.md" ]              || curl -sSL "https://raw.githubusercontent.com/[your-username]/product-os/main/CLAUDE.md" -o CLAUDE.md
[ -f "os" ]              || curl -sSL "https://raw.githubusercontent.com/[your-username]/product-os/main/os" -o os
[ -f "claude-progress.txt" ]    || curl -sSL "https://raw.githubusercontent.com/[your-username]/product-os/main/templates/claude-progress.txt" -o claude-progress.txt

# Copy agent files
for agent in research product architect stitch qa security launch; do
  [ -f ".claude/agents/${agent}.md" ] || \
    curl -sSL "https://raw.githubusercontent.com/[your-username]/product-os/main/.claude/agents/${agent}.md" \
    -o ".claude/agents/${agent}.md"
done

# Copy CI/CD workflows
for workflow in security-scan qa-review deploy; do
  [ -f ".github/workflows/${workflow}.yml" ] || \
    curl -sSL "https://raw.githubusercontent.com/[your-username]/product-os/main/.github/workflows/${workflow}.yml" \
    -o ".github/workflows/${workflow}.yml"
done

# Copy templates
[ -f "templates/PRD.md" ]                   || curl -sSL "https://raw.githubusercontent.com/[your-username]/product-os/main/templates/PRD.md" -o templates/PRD.md
[ -f "templates/design.md" ]                || curl -sSL "https://raw.githubusercontent.com/[your-username]/product-os/main/templates/design.md" -o templates/design.md
[ -f "templates/stitch/stitch-brief.md" ]   || curl -sSL "https://raw.githubusercontent.com/[your-username]/product-os/main/templates/stitch/stitch-brief.md" -o templates/stitch/stitch-brief.md

chmod +x os
success "os is executable"

# Add to .gitignore if it exists
if [ -f ".gitignore" ]; then
  grep -q ".env.local" .gitignore || echo -e "\n# product-os\n.env.local\n.env*.local" >> .gitignore
  success ".gitignore updated"
fi

echo ""
echo -e "${BOLD}${GREEN}✅ product-os installed!${RESET}"
echo ""
echo -e "Next steps:"
echo -e "  ${CYAN}./os init${RESET}         Initialize your project"
echo -e "  ${CYAN}./os install-all${RESET}  Install all skills"
echo -e "  ${CYAN}./os research${RESET}     Start with research"
echo -e "  ${CYAN}./os help${RESET}         See all commands"
echo ""
echo -e "⭐ If this saves you time: ${CYAN}https://github.com/[your-username]/product-os${RESET}"
echo ""
