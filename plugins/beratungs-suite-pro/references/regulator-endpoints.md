# Regulierungs-Behörden: Funktionierende Endpunkte

Direkte API-Zugriffe, die Cloudflare umgehen. Stand: 2026-03-19.

## Tier 1: Direkte API (kein Browser nötig)

### BaFin (DE) — Unternehmensdatenbank
```bash
# Suche nach Unternehmen (HTML-Response, kein Cloudflare)
curl -s "https://portal.mvp.bafin.de/database/InstInfo/sucheForm.do?sucheButtonInstitut=Suche&institutName=FIRMENNAME"
```
- Gibt HTML mit Links zu `institutDetails.do?cmd=loadInstitutAction&institutId=XXXXX`
- Kein Auth, kein Session-Token nötig
- Parse die Ergebnisse mit grep/regex

### FMA (AT) — Warnliste (WordPress REST API)
```bash
# Warnungen durchsuchen (JSON-Response)
curl -s -H "User-Agent: Mozilla/5.0" -H "Accept-Language: en-US,en" \
  "https://www.fma.gv.at/wp-json/wp/v2/posts?categories=42&per_page=20&page=1&search=FIRMENNAME&_fields=id,date,title,link"
```
- Kategorie 42 = Warnungen (1211+ Einträge)
- Response: JSON-Array mit `X-WP-Total` Header für Gesamtanzahl
- Braucht User-Agent Header

### ESMA (EU) — Warnungen
```bash
# ESMA Investor Warnings (öffentliche API)
curl -s "https://www.esma.europa.eu/databases-library/investor-corner/warnings?search_api_views_fulltext=FIRMENNAME"
```
- Öffentlich zugänglich, kein Cloudflare

### SEC (USA) — EDGAR Full-Text Search
```bash
# EDGAR Full-Text Search API (JSON)
curl -s -H "User-Agent: CompanyName admin@example.com" \
  "https://efts.sec.gov/LATEST/search-index?q=FIRMENNAME&dateRange=custom&startdt=2020-01-01&forms=10-K,10-Q,8-K"
```
- Braucht User-Agent mit Kontaktinfo (SEC Policy)
- JSON Response

## Tier 2: Firecrawl erforderlich (JS-Rendering)

### BaFin (DE) — Warnungen (unerlaubte Geschäfte)
```
URL: https://www.bafin.de/SiteGlobals/Forms/Suche/Expertensuche_Formular.html?nn=19660250&documentType_=News&cl2Categories_Format=Meldung&cl2Categories_Thema=UnerlaubteGeschaefte&suchfeld=FIRMENNAME
```
- SPA — Daten laden client-seitig, daher Firecrawl nötig
- Nutze `firecrawl scrape` mit dieser URL

### FINMA (CH) — Bewilligungsträger + Warnliste
```
# Warnliste durchsuchen
URL: https://www.finma.ch/de/finma-public/bewilligte-institute-personen-und-produkte/?lic=&cmp=FIRMENNAME
# Warnliste
URL: https://www.finma.ch/de/durchsetzung/warnlisten/
```
- Cloudflare auf der API, aber Firecrawl rendert die Seite
- **Alternative ohne Cloudflare:** FINMA publiziert XLSX-Downloads:
  - SRO-Liste: `https://www.finma.ch/en/~/media/finma/dokumente/bewilligungstraeger/xlsx/sro.xlsx`
  - Weitere XLSX unter `/bewilligungstraeger/xlsx/`

### FMA (AT) — Unternehmensdatenbank
```
URL: https://www.fma.gv.at/en/search-company-database/?company=FIRMENNAME
```
- Braucht Firecrawl (403 bei direktem Zugriff)

## Tier 3: Playwright erforderlich (volle Browser-Session)

### SCA (UAE) — Securities and Commodities Authority
```
URL: https://www.sca.gov.ae/en/open-data.aspx
API: POST https://www.sca.gov.ae/api/PublicApi/GetContentList (typeId=1071 für Warnungen)
```
- Braucht ASP.NET_SessionId + CSRF-Token aus vorherigem Page-Load
- Nutze Playwright MCP: Seite laden → Session-Cookie extrahieren → API callen

### DFSA / DIFC (UAE)
```
# DFSA Firmenliste (öffentlich, kein Block)
URL: https://www.dfsa.ae/public-register/firms
# DIFC Firmenliste
URL: https://www.difc.ae/business/registering/public-register/
```
- Öffentlich zugänglich, Firecrawl reicht

### FCA (UK)
```
# FCA Financial Services Register (öffentlich)
URL: https://register.fca.org.uk/s/search?q=FIRMENNAME&type=Companies
```
- Öffentlich zugänglich, Firecrawl reicht

## Abruf-Strategie

```
1. Tier-1-Endpunkte IMMER zuerst (curl/Bash) — schnell, zuverlässig
2. Tier-2 mit Firecrawl — für JS-gerenderte Seiten
3. Tier-3 mit Playwright MCP — nur wenn 1+2 fehlschlagen
4. Bei ALLEN Fehlschlägen: als "nicht verifizierbar" markieren, NICHT als "keine Warnung"
```

## Ergebnis-Interpretation

- **Treffer gefunden** → KRITISCH, sofort im Report markieren
- **Kein Treffer** → "Nicht in Warnliste gefunden" (≠ "sicher")
- **Zugriff blockiert** → "Nicht verifizierbar — manuell prüfen" + Link angeben
- **API-Fehler** → Retry mit nächstem Tier, dann als blockiert melden
