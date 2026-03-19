# Tooling-Übersicht: Professionelle Beratungs-Suite

Stand: 2026-03-17

---

## 1. MCP-Server (sofort nutzbar)

| Name | GitHub / npm | Zweck | Status |
|------|-------------|-------|--------|
| rechtsinformationen-bund-de-mcp | [GitHub](https://github.com/Rechtsinformationen/rechtsinformationen-bund-de-mcp) | 6.870 deutsche Statuten via gesetze-im-internet.de | Verfügbar |
| german-law-mcp | [GitHub](https://github.com/Ansvar-Systems/german-law-mcp) | Deutsche Gesetze + Zitatprüfung + Aktualitätscheck | Verfügbar |
| ayunis-legal-mcp | [GitHub](https://github.com/ayunis-core/ayunis-legal-mcp) | Semantische Suche über Gesetze (pgvector, Ollama) | Verfügbar |
| EU_compliance_MCP | [GitHub](https://github.com/Ansvar-Systems/EU_compliance_MCP) | 37 EU-Verordnungen (DSGVO, AI Act, MiFID II, NIS2) | Verfügbar |
| open-legal-compliance-mcp | [GitHub](https://github.com/TCoder920x/open-legal-compliance-mcp) | Multi-Jurisdiktionen (EU, USA, UK, Kanada, WIPO) | Verfügbar |
| openregister-mcp | [GitHub](https://github.com/Syndicats/openregister-mcp) | Handelsregister-Abfragen (DE) | Verfügbar |
| norman-mcp-server | — | EU Buchhaltung/Steuer | Zu prüfen |
| facturx-mcp | — | E-Invoicing (EN 16931) | Zu prüfen |

---

## 2. APIs (getestet und erreichbar)

| API | URL | Format | API-Key | Region |
|-----|-----|--------|---------|--------|
| RIS Österreich | `data.bka.gv.at/ris/api/v2.6/Bundesrecht` | JSON | Nein | AT |
| Federal Register | `federalregister.gov/api/v1/documents.json` | JSON | Nein | USA |
| GovInfo | `api.govinfo.gov/collections` | JSON | DEMO_KEY | USA |
| Fedlex SPARQL | `fedlex.data.admin.ch/sparqlendpoint` | RDF/XML | Nein | CH |
| EU Publications SPARQL | `publications.europa.eu/webapi/rdf/sparql` | RDF/XML | Nein | EU |
| World Bank | `api.worldbank.org/v2/country` | XML/JSON | Nein | International |

### APIs — nicht erreichbar / fehlerhaft

| API | Problem |
|-----|---------|
| EUR-Lex REST | 404 |
| CURIA | 404 |
| OECD SDMX | Migriert (404) |
| SEC EFTS | 403 (API-Key nötig) |
| api.rechtsinformationsportal.de | DNS-Fehler (existiert nicht) |

---

## 3. Open-Source-Projekte / GitHub-Repos

| Repo | GitHub | Zweck |
|------|--------|-------|
| Open Legal Data (OLDP) | [openlegaldata/oldp](https://github.com/openlegaldata/oldp) | Deutsche Rechtsprechung — Django + REST API + Elasticsearch |
| OLDP-DE Theme | [openlegaldata/oldp-de](https://github.com/openlegaldata/oldp-de) | Deutsches Theme für OLDP |
| awesome-legal-data | [openlegaldata/awesome-legal-data](https://github.com/openlegaldata/awesome-legal-data) | Sammlung legaler Datasets und Ressourcen |
| taxger | [mpm/taxger](https://github.com/mpm/taxger) | Deutsche Lohn-/Einkommensteuer-Berechnung (Ruby) |
| taxcalculator | [taxcalcs/taxcalculator](https://github.com/taxcalcs/taxcalculator) | BMF-Steuerrechner als Code |
| taxly | [oseughu/taxly](https://github.com/oseughu/taxly) | Flexible Tax API für mehrere Länder |
| Consult Ralph | [unicodeveloper/consultralph](https://github.com/unicodeveloper/consultralph) | KI-Beratungstool (Due Diligence, Marktanalyse) |
| PlannerAPI | [nycsav/PlannerAPI](https://github.com/nycsav/PlannerAPI) | Strategische Intelligenz (McKinsey, Gartner) |
| Claude-Code-Lawyer | [danielrosehill/Claude-Code-Lawyer](https://github.com/danielrosehill/Claude-Code-Lawyer) | Juristischer Intake-Prozess für Claude Code |
| bundesgit / gesetze | [kmein/gesetze](https://github.com/kmein/gesetze) | Tägliches Archiv von gesetze-im-internet.de als Git |
| QuantLaw | [QuantLaw](https://github.com/QuantLaw) | Quantitative Analyse deutscher Gesetze |

---

## 4. Bereits installierte Skills (im Workspace nutzbar)

| Skill | Pfad | Relevanz für Plugin |
|-------|------|---------------------|
| openrouter-skill-v3 | `~/.claude/skills/openrouter-skill-v3/` | Deep Research (Gemini, Perplexity), Bildgenerierung |
| agent-team-creator | `~/.claude/skills/agent-team-creator/` | Multi-Agent-Koordination, Review-Loop, Confidence-Scoring |
| figma-bridge | `~/.claude/skills/figma-bridge/` | Entscheidungsbaum-Pattern (Vorlage für autonome Recherche) |
| handoff | `~/.claude/skills/handoff/` | Session-Management zwischen Entwicklungsphasen |

---

## 5. Bereits installierte Plugins / Tools

| Tool | Zweck | Relevanz |
|------|-------|----------|
| Firecrawl | Web-Crawling, Scraping | Quellen ohne API crawlen (Gerichte, Finanzämter, UAE-Portale) |
| Playwright | Browser-Automatisierung | Interaktive Webseiten testen/prüfen |
| Chrome DevTools MCP | Browser-Debugging | Domain-Prüfung (Impressum, DSGVO) |
| Google Drive MCP | Docs lesen/schreiben | Google Doc mit Architektur-Vision |
| GitHub MCP | Repo-Zugriff | MCP-Server-Repos untersuchen |
| context-mode | Kontext-Optimierung | Große API-Outputs verarbeiten |
| claude-mem | Persistentes Gedächtnis | Cross-Session-Wissen bewahren |

---

## 6. Externe Datenquellen (kein API, nur Crawling)

| Quelle | URL | Region | Inhalt |
|--------|-----|--------|--------|
| gesetze-im-internet.de | `gesetze-im-internet.de` | DE | Bundesgesetze (HTML) |
| rechtsprechung-im-internet.de | `rechtsprechung-im-internet.de` | DE | BGH, BVerfG Urteile |
| bundesanzeiger.de | `bundesanzeiger.de` | DE | Bekanntmachungen, Jahresabschlüsse |
| handelsregister.de | `handelsregister.de` | DE | Firmeneinträge |
| ris.bka.gv.at | `ris.bka.gv.at` | AT | Österreichisches Recht (auch API) |
| admin.ch | `admin.ch` | CH | Schweizer Bundesrecht |
| eur-lex.europa.eu | `eur-lex.europa.eu` | EU | EU-Recht |
| curia.europa.eu | `curia.europa.eu` | EU | EuGH-Rechtsprechung |
| legislation.ae | `legislation.ae` | UAE | UAE Bundesgesetze |
| tax.gov.ae | `tax.gov.ae` | UAE | Federal Tax Authority (VAT) |
| difc.ae | `difc.ae` | UAE | DIFC Regulierung |
| mof.gov.ae | `mof.gov.ae` | UAE | UAE Finanzministerium |

---

## 7. Referenz-Dokumente im Workspace

| Datei | Inhalt |
|-------|--------|
| `docs/research-rechts-steuer-quellen-gemini.md` | Deep Research DE/DACH/EU/International (Gemini) |
| `docs/research-rechts-steuer-quellen-perplexity.md` | Deep Research DE/DACH/EU/International (Perplexity) |
| `docs/research-rechts-steuer-quellen-usa-uae-gemini.md` | Deep Research USA/UAE (Gemini) |
| `docs/research-rechts-steuer-quellen-usa-uae-perplexity.md` | Deep Research USA/UAE (Perplexity) |
| `docs/api-erreichbarkeit-test.md` | Live-Test aller APIs mit Status |
| `docs/analyse-devils-advocate-blindspot-grayarea.md` | Kritische 3-Perspektiven-Analyse |
| `docs/mcp-alternativen-recherche.md` | Existierende MCPs, Open-Source, Alternativen |
| `docs/plan-beratungs-suite.md` | Implementierungsplan (v1, wird überarbeitet) |
| `handoff/latest.md` | Session-Handoff mit Gesamtstand |
| `handoff/decisions.md` | Entscheidungsprotokoll |

---

## 8. Google Doc (externe Quelle)

| Dokument | ID | Inhalt |
|----------|-----|--------|
| Claude Code Skill: Recht, Steuern, Beratung | `1p1lWrd6GUkcP8Jp1kxkqxnPfsdxrHZQ1W_Ro2xImrN8` | Architektur-Framework, MCP-Analyse, Plugin-Struktur, Multi-Agenten-Workflow, 39 Referenzen |
