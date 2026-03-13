#!/bin/bash
# =============================================================
# Guardrails for AI Coders - One-Command Installer
# https://github.com/deepanshu-maliyan/guardrails-for-ai-coders
# =============================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

REPO_URL="https://github.com/deepanshu-maliyan/guardrails-for-ai-coders"
RAW_URL="https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main"
INSTALL_DIR=".ai-guardrails"

echo ""
echo -e "${BLUE}  ____                     _           _ _      "
echo -e " / ___|_   _  __ _ _ __ __| |_ __ __ _(_) |___  "
echo -e "| |  _| | | |/ _' | '__/ _' | '__/ _' | | / __| "
echo -e "| |_| | |_| | (_| | | | (_| | | | (_| | | \\__ \\ "
echo -e " \\____/\\__,_|\\__,_|_|  \\__,_|_|  \\__,_|_|_|___/ "
echo -e "${NC}"
echo -e "${GREEN}  Guardrails for AI Coders - Security Prompt Installer${NC}"
echo -e "  ${BLUE}$REPO_URL${NC}"
echo ""

# Check dependencies
if ! command -v curl &> /dev/null && ! command -v git &> /dev/null; then
  echo -e "${RED}Error: curl or git is required. Please install one.${NC}"
  exit 1
fi

# Install or update
if [ -d "$INSTALL_DIR" ]; then
  echo -e "${YELLOW}Updating existing .ai-guardrails/ folder...${NC}"
  if [ -d "$INSTALL_DIR/.git" ]; then
    cd "$INSTALL_DIR" && git pull --quiet && cd ..
  else
    rm -rf "$INSTALL_DIR"
    git clone --quiet "$REPO_URL.git" "$INSTALL_DIR"
  fi
else
  echo -e "${BLUE}Downloading guardrails-for-ai-coders...${NC}"
  git clone --quiet "$REPO_URL.git" "$INSTALL_DIR"
fi

# Add to .gitignore
if [ -f ".gitignore" ]; then
  if ! grep -q ".ai-guardrails" .gitignore; then
    echo "" >> .gitignore
    echo "# Guardrails for AI Coders (local security prompts)" >> .gitignore
    echo ".ai-guardrails/" >> .gitignore
    echo -e "${GREEN}Added .ai-guardrails/ to .gitignore${NC}"
  fi
else
  echo ".ai-guardrails/" > .gitignore
  echo -e "${GREEN}Created .gitignore with .ai-guardrails/${NC}"
fi

# Summary
echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo -e "${YELLOW}Your .ai-guardrails/ folder is ready:${NC}"
echo ""
echo -e "  ${BLUE}PROMPTS${NC} (drag into ChatGPT/Claude/Copilot Chat):"
for f in "$INSTALL_DIR"/prompts/*.prompt; do
  echo -e "    - $(basename $f)"
done
echo ""
echo -e "  ${BLUE}CHECKLISTS${NC} (open and follow before each deploy):"
for f in "$INSTALL_DIR"/checklists/*.md; do
  echo -e "    - $(basename $f)"
done
echo ""
echo -e "  ${BLUE}WORKFLOWS${NC} (setup guides for each AI tool):"
for f in "$INSTALL_DIR"/workflows/*.md; do
  echo -e "    - $(basename $f)"
done
echo ""
echo -e "${GREEN}HOW TO USE:${NC}"
echo -e "  1. Open ChatGPT / Claude / Copilot Chat / Cursor"
echo -e "  2. Drag any .prompt file from .ai-guardrails/prompts/ into the chat"
echo -e "  3. Paste your code below === YOUR CODE === and hit Enter"
echo -e "  4. Get instant security review with severity + fixes!"
echo ""
echo -e "${YELLOW}Quick start: cat .ai-guardrails/prompts/pr_security_review.prompt${NC}"
echo ""
echo -e "${BLUE}Star the repo if this helps! $REPO_URL${NC}"
echo ""
