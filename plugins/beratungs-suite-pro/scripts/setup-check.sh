#!/bin/bash
# Setup-Check: Prüft ob alle MCP-Server und APIs erreichbar sind
# Usage: bash scripts/setup-check.sh

echo "=== Professionelle Beratungs-Suite — Setup Check ==="
echo ""

PASS=0
FAIL=0

check_url() {
  local name="$1"
  local url="$2"
  local expected="$3"

  status=$(curl -s -o /dev/null -w "%{http_code}" -L --max-time 10 "$url" 2>/dev/null)

  if [ "$status" = "$expected" ] || [ "$status" = "200" ]; then
    echo "  ✅ $name ($status)"
    PASS=$((PASS + 1))
  else
    echo "  ❌ $name (Status: $status, erwartet: $expected)"
    FAIL=$((FAIL + 1))
  fi
}

check_command() {
  local name="$1"
  local cmd="$2"

  if command -v "$cmd" &> /dev/null; then
    echo "  ✅ $name (installiert)"
    PASS=$((PASS + 1))
  else
    echo "  ❌ $name (nicht gefunden)"
    FAIL=$((FAIL + 1))
  fi
}

echo "--- Tools ---"
check_command "Node.js" "node"
check_command "npx" "npx"
check_command "Python 3" "python3"
check_command "curl" "curl"

echo ""
echo "--- APIs (Deutschland) ---"
check_url "gesetze-im-internet.de" "https://www.gesetze-im-internet.de" "200"

echo ""
echo "--- APIs (Österreich) ---"
check_url "RIS API" "https://data.bka.gv.at/ris/api/v2.6/Bundesrecht?Suchworte=GmbH&DokumenteProSeite=Eintraege1" "200"

echo ""
echo "--- APIs (Schweiz) ---"
check_url "Fedlex SPARQL" "https://fedlex.data.admin.ch/sparqlendpoint" "200"

echo ""
echo "--- APIs (EU) ---"
check_url "EU Publications SPARQL" "https://publications.europa.eu/webapi/rdf/sparql" "200"

echo ""
echo "--- APIs (USA) ---"
check_url "Federal Register" "https://www.federalregister.gov/api/v1/documents.json?per_page=1" "200"
check_url "GovInfo" "https://api.govinfo.gov/collections?api_key=DEMO_KEY&offset=0&pageSize=1" "200"

echo ""
echo "--- APIs (International) ---"
check_url "World Bank" "https://api.worldbank.org/v2/country/DE?format=json" "200"

echo ""
echo "--- APIs (UAE) ---"
check_url "UAE Tax Authority" "https://tax.gov.ae" "200"
check_url "DIFC" "https://www.difc.ae" "200"

echo ""
echo "=== Ergebnis: $PASS bestanden, $FAIL fehlgeschlagen ==="

if [ $FAIL -gt 0 ]; then
  echo "⚠️  Einige Dienste sind nicht erreichbar. Das Plugin funktioniert mit Einschränkungen."
  exit 1
else
  echo "✅ Alle Dienste erreichbar. Plugin ist einsatzbereit."
  exit 0
fi
