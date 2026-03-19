#!/bin/bash
# Setup-Check: Prüft ob alle MCP-Server, APIs und OSINT-Tools erreichbar sind
# Usage: bash scripts/setup-check.sh
#
# v0.6.1: Bright Data MCP + Telegram OSINT MCP

echo "=== Professionelle Beratungs-Suite — Setup Check ==="
echo ""

PASS=0
FAIL=0
WARN=0

check_url() {
  local name="$1"
  local url="$2"
  local status
  status=$(curl -s -o /dev/null -w "%{http_code}" -L --max-time 10 "$url" 2>/dev/null)
  if [ "$status" = "200" ] || [ "$status" = "301" ] || [ "$status" = "302" ]; then
    echo "  ✅ $name ($status)"
    PASS=$((PASS + 1))
  else
    echo "  ❌ $name (Status: $status)"
    FAIL=$((FAIL + 1))
  fi
}

check_command() {
  local name="$1"
  local cmd="$2"
  if command -v "$cmd" &> /dev/null; then
    echo "  ✅ $name ($(command -v "$cmd"))"
    PASS=$((PASS + 1))
  else
    echo "  ❌ $name (nicht gefunden)"
    FAIL=$((FAIL + 1))
  fi
}

check_python_pkg() {
  local name="$1"
  local pkg="$2"
  if python3 -c "import $pkg" &> /dev/null; then
    local ver
    ver=$(python3 -c "import $pkg; print(getattr($pkg, '__version__', 'ok'))" 2>/dev/null)
    echo "  ✅ $name ($ver)"
    PASS=$((PASS + 1))
  else
    echo "  ❌ $name (nicht installiert — pip install $pkg)"
    FAIL=$((FAIL + 1))
  fi
}

check_env() {
  local name="$1"
  local var="$2"
  local hint="$3"
  if [ -n "${!var}" ]; then
    local preview="${!var:0:8}..."
    echo "  ✅ $name ($preview)"
    PASS=$((PASS + 1))
  else
    echo "  ⚠️  $name (nicht gesetzt — $hint)"
    WARN=$((WARN + 1))
  fi
}

check_file() {
  local name="$1"
  local path="$2"
  if [ -f "$path" ]; then
    echo "  ✅ $name ($path)"
    PASS=$((PASS + 1))
  else
    echo "  ❌ $name fehlt ($path)"
    FAIL=$((FAIL + 1))
  fi
}

# ── System-Tools ──────────────────────────────────────────────────────────────
echo "--- System-Tools ---"
check_command "Node.js" "node"
check_command "npx" "npx"
check_command "Python 3" "python3"
check_command "curl" "curl"
check_command "pip3" "pip3"

# ── Plugin-Dateien ────────────────────────────────────────────────────────────
echo ""
echo "--- Plugin-Dateien ---"
check_file ".mcp.json" ".mcp.json"
check_file "autonome-recherche.md" "references/autonome-recherche.md"

# ── Umgebungsvariablen ────────────────────────────────────────────────────────
echo ""
echo "--- API Keys & Tokens ---"
check_env "BRIGHTDATA_API_TOKEN" "BRIGHTDATA_API_TOKEN" \
  "https://brightdata.com → Account → API Keys"

# ── Bright Data Erreichbarkeit ────────────────────────────────────────────────
echo ""
echo "--- Bright Data (Social Media OSINT) ---"
if [ -n "$BRIGHTDATA_API_TOKEN" ]; then
  bd_status=$(curl -s -o /dev/null -w "%{http_code}" \
    -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN" \
    --max-time 10 \
    "https://api.brightdata.com/account/info" 2>/dev/null)
  if [ "$bd_status" = "200" ]; then
    echo "  ✅ Bright Data API (authentifiziert)"
    PASS=$((PASS + 1))
  else
    echo "  ❌ Bright Data API (Status: $bd_status — Token prüfen)"
    FAIL=$((FAIL + 1))
  fi
else
  echo "  ⚠️  Bright Data API (Token nicht gesetzt — Test übersprungen)"
  WARN=$((WARN + 1))
fi

# ── Behörden-APIs ─────────────────────────────────────────────────────────────
echo ""
echo "--- Behörden-APIs (Deutschland) ---"
check_url "gesetze-im-internet.de" "https://www.gesetze-im-internet.de"
check_url "BaFin Warnliste" "https://www.bafin.de/SiteGlobals/Functions/RSSFeed/DE/RSSFeed_Warnungen.html"

echo ""
echo "--- Behörden-APIs (Österreich) ---"
check_url "RIS API (AT)" "https://data.bka.gv.at/ris/api/v2.6/Bundesrecht?Suchworte=GmbH&DokumenteProSeite=Eintraege1"
check_url "FMA Warnliste (AT)" "https://www.fma.gv.at/en/warnings/"

echo ""
echo "--- Behörden-APIs (Schweiz) ---"
check_url "Fedlex SPARQL (CH)" "https://fedlex.data.admin.ch/sparqlendpoint"
check_url "FINMA Warnliste (CH)" "https://www.finma.ch/en/investor-protection/watch-list/"

echo ""
echo "--- Behörden-APIs (EU / International) ---"
check_url "EU Publications SPARQL" "https://publications.europa.eu/webapi/rdf/sparql"
check_url "ESMA Warnungen" "https://www.esma.europa.eu/investor-corner/consumer-corner/warnings"
check_url "SEC EDGAR (USA)" "https://www.sec.gov/cgi-bin/browse-edgar?action=getcompany"

echo ""
echo "--- Behörden-APIs (UAE) ---"
check_url "UAE Tax Authority" "https://tax.gov.ae"
check_url "DIFC" "https://www.difc.ae"

# ── MCP-Pakete ────────────────────────────────────────────────────────────────
echo ""
echo "--- MCP-Pakete (npx) ---"
echo "  ℹ️  MCP-Pakete werden beim ersten Start automatisch via npx geladen."
echo "     Zum Vorab-Download: npx -y @brightdata/mcp --version"

# ── Ergebnis ──────────────────────────────────────────────────────────────────
echo ""
echo "════════════════════════════════════════════"
echo "  Ergebnis: $PASS bestanden  |  $WARN Warnungen  |  $FAIL fehlgeschlagen"
echo "════════════════════════════════════════════"

if [ $FAIL -gt 0 ]; then
  echo ""
  echo "❌ Kritische Fehler gefunden. Plugin funktioniert eingeschränkt."
  echo "   → Fehlende Pakete installieren: pip install telethon mcp"
  echo "   → API Keys in .env oder Shell-Profil setzen"
  exit 1
elif [ $WARN -gt 0 ]; then
  echo ""
  echo "⚠️  Warnungen vorhanden. Plugin funktioniert, aber einige Features fehlen."
  echo "   → Bright Data Token: https://brightdata.com (5.000 Requests/Monat kostenlos)"
  echo "   → Telegram API Keys: https://my.telegram.org/apps (kostenlos)"
  exit 0
else
  echo ""
  echo "✅ Alle Checks bestanden. Plugin ist vollständig einsatzbereit."
  exit 0
fi
