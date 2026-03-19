#!/usr/bin/env bash
# check-tools.sh — Prüft ob CLI-Tools für landingpage-audit-pro installiert sind
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "=== landingpage-audit-pro: Tool Check ==="
echo ""

MISSING_REQUIRED=0
MISSING_RECOMMENDED=0

check_tool() {
  local name="$1"
  local cmd="$2"
  local level="$3"
  local install="$4"

  if command -v "$cmd" &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} $name"
  else
    if [ "$level" = "required" ]; then
      echo -e "  ${RED}✗${NC} $name (PFLICHT) — Install: $install"
      MISSING_REQUIRED=$((MISSING_REQUIRED + 1))
    elif [ "$level" = "recommended" ]; then
      echo -e "  ${YELLOW}○${NC} $name (empfohlen) — Install: $install"
      MISSING_RECOMMENDED=$((MISSING_RECOMMENDED + 1))
    else
      echo -e "  ${YELLOW}○${NC} $name (optional) — Install: $install"
    fi
  fi
}

echo "Pflicht-Tools:"
check_tool "Lighthouse CLI" "lighthouse" "required" "npm install -g lighthouse"
check_tool "lychee (Link Checker)" "lychee" "required" "brew install lychee"
echo ""

echo "Empfohlene Tools:"
check_tool "Axe-Core CLI" "axe" "recommended" "npm install -g @axe-core/cli"
check_tool "Pa11y" "pa11y" "recommended" "npm install -g pa11y"
check_tool "cspell (Spell Check)" "cspell" "recommended" "npm install -g cspell"
echo ""

echo "Optionale Tools:"
check_tool "BackstopJS" "backstop" "optional" "npm install -g backstopjs"
check_tool "html-validate" "html-validate" "optional" "npm install -g html-validate"
echo ""

echo "Services:"
if curl -s --max-time 2 http://localhost:8081/v2/check -d "language=de&text=Test" &>/dev/null; then
  echo -e "  ${GREEN}✓${NC} LanguageTool API (localhost:8081)"
elif curl -s --max-time 2 http://localhost:8010/v2/check -d "language=de&text=Test" &>/dev/null; then
  echo -e "  ${GREEN}✓${NC} LanguageTool API (localhost:8010)"
else
  echo -e "  ${YELLOW}○${NC} LanguageTool API nicht erreichbar — Install: brew install languagetool && brew services start languagetool"
fi

echo ""
echo "MCP Server:"
echo -e "  ${YELLOW}i${NC} Playwright MCP — wird zur Laufzeit über Claude Code MCP geprüft"
echo ""

echo "=== Ergebnis ==="
if [ "$MISSING_REQUIRED" -gt 0 ]; then
  echo -e "${RED}$MISSING_REQUIRED Pflicht-Tool(s) fehlen. Bitte installieren vor Nutzung.${NC}"
  exit 1
elif [ "$MISSING_RECOMMENDED" -gt 0 ]; then
  echo -e "${YELLOW}Alle Pflicht-Tools vorhanden. $MISSING_RECOMMENDED empfohlene(s) Tool(s) fehlen (Plugin funktioniert, aber mit reduziertem Umfang).${NC}"
  exit 0
else
  echo -e "${GREEN}Alle Tools installiert. Plugin ist voll einsatzbereit.${NC}"
  exit 0
fi
