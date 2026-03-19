# Beratungs-Suite Pro v0.7.0

Integriertes Claude Code Plugin für **Recht**, **Steuern** und **Unternehmensberatung** mit Ermittlungs-Framework, Agent-Team-Modus, autonomer OSINT-Recherche, Multi-Source-Validierung, Confidence-Scoring und Disclaimer-Enforcement.

---

## Überblick

Die Beratungs-Suite Pro vereint drei professionelle Beratungssäulen in einem Plugin:

1. **Recht** — Rechtsrecherche über DE, AT, CH, EU, USA, UAE mit Domain- und PDF-Prüfung
2. **Steuern** — Steuerrechtliche Analyse, Rechnungsprüfung, DBA-Analyse, Steuerberechnung
3. **Unternehmensberatung** — Strategische Analyse, Marktintelligenz, Benchmarking mit Consulting-Frameworks

### Neu in v0.7.0: Drei-Perspektiven-System, Compliance-Selbstprüfung, Diagramm-Export

- **Perspektiven-Auswahl (Pflicht-Checkpoint)**: Nach jeder abgeschlossenen Analyse wählt der User eine von drei Perspektiven: SCHUTZSEITE (Betroffener), SELBSTPRÜFUNG (Betreiber/Gründer) oder PRÜFAUFTRAG (Due Diligence für Dritte). Jede Perspektive erzeugt einen grundlegend anderen Umsetzungsplan mit eigener Logik, eigenem Ton und eigenen Maßnahmentypen.
- **Compliance-Selbstprüfung (4 Module)**: Vollständige Prüflisten für Website/Impressum (§5 DDG), Datenschutz (DSGVO), AGB (§307-309 BGB), Affiliate-Links (§5a UWG) und Unternehmensstruktur-Check (Rechtsform vs. Tätigkeit, Stammkapital, Meldepflichten). Inklusive Entlastungsdokumentation.
- **Diagramm-Export (PNG + PDF)**: Mermaid-Diagramme werden automatisch als hochauflösende PNG- und PDF-Dateien via `mmdc` exportiert. Fallback auf Mermaid-Code in Markdown.
- **Update-Mechanismus**: Bestehende Umsetzungspläne können per Trigger-Phrasen ("Schritt X erledigt", "/plan-update") live aktualisiert werden — Status, Fristen und neue Findings werden direkt eingearbeitet.
- **Monitoring-Eskalation**: Bei Monitoring-Treffern (neue BaFin-Warnung, Handelsregister-Änderung, Presse) wird der Plan automatisch um Sofort-Maßnahmen erweitert.
- **Kostenschätzungen entfernt**: Pauschale Kostenangaben waren irreführend — stattdessen jetzt Ressourcen-Hinweise (kostenfrei/kostenpflichtig + wo Kosteninformation holen).
- **Hooks erweitert**: Perspektiven-Check-Hook (Sicherheitsnetz wenn Checkpoint vergessen wird) + Diagramm-Export-Logger.

### Neu in v0.6.3: Error-Recovery, Template-Frontmatter, Tool-Standardisierung

- **Fehlerbehandlung in Orchestrator-Skills**: `recht-analyse`, `steuer-check`, `strategie-entwurf` haben jetzt Fallback-Tabellen (MCP-Ausfall → Bright Data → Deep Research → Confidence-Absenkung)
- **Template-Frontmatter**: `legal-memo.md`, `tax-analysis.md`, `strategy-report.md` haben jetzt YAML-Frontmatter mit Pflichtfeldern und Verwendungszweck
- **Agent-Tool-Referenzen**: Jurist + Strategie-Consultant referenzieren jetzt Bright Data MCP statt Firecrawl
- **requirements.txt**: Python-Abhängigkeiten für Scripts dokumentiert

### Neu in v0.6.2: Plugin-Audit — Strukturbereinigung + Qualitätsverbesserungen

- **Hooks gefixt**: Ungültiges `Notification`-Event entfernt, Activity-Logger nach `Stop` migriert, doppelte Stop-Arrays zusammengeführt
- **5 Legacy-Commands gelöscht**: `ermittlung`, `recht-analyse`, `steuer-check`, `strategie-entwurf`, `umsetzungsplan` — Skills sind die Nachfolger
- **Agent-Modelle optimiert**: `steuerberater` und `validator` auf Sonnet (statt Opus) — spart Tokens bei einfachen Aufgaben
- **Agent-Tools erweitert**: `steuerberater` und `validator` haben jetzt `Agent`-Tool für Sub-Agent-Delegation
- **Kernlogik v2**: Phase 2 (Ermittlung) referenziert jetzt Forensik, Actor Loop, Bright Data Tools; Phase 4 referenziert Tätigkeitskategorisierung, Normen-Matching, Vorsatz-Score, Produkt-Tiefenanalyse; Phase 6 referenziert Gray Area & Blind Spot Assessment
- **Ermittler-Description**: Bright Data MCP Tools + Forensik-Module in Agent-Description integriert
- **Experimental Scripts entfernt**: `fedlex-sparql-query.py.experimental`, `eurlex-sparql-query.py.experimental`
- **commands/-Ordner entfernt**: Leer nach Migration, aus plugin.json entfernt

### Neu in v0.6.1: Bright Data MCP + Telegram OSINT MCP Integration

- **Bright Data MCP** (`@brightdata/mcp`): Ersetzt Firecrawl für Social Media OSINT — strukturierte JSON-Daten von Instagram, TikTok, Facebook, X/Twitter, LinkedIn, YouTube via plattformspezifische Scraper (umgeht Login-Walls). Zusätzlich Web Unlocker für Behördenseiten und SERP API für Google News.
- **Telegram via Bright Data**: Öffentliche Channels über `scrape_as_markdown` auf `t.me/s/USERNAME` — kein separater MCP-Server nötig, keine Telegram API-Keys erforderlich.
- **Tool-Zuständigkeits-Matrix**: Klare Zuordnung welches MCP-Tool für welche Plattform zuständig ist (in `autonome-recherche.md`)
- **Firecrawl-Migration**: Alle Social-Media-Referenzen von Firecrawl auf Bright Data MCP umgestellt
- **Setup-Check erweitert**: Prüft Bright Data API-Token, Telegram Session, Python-Pakete (telethon, mcp), Behörden-APIs
- **ScamAdviser + ScamDetector**: Jetzt über Bright Data `scrape_as_markdown` statt Firecrawl

### Neu in v0.6.0: OSINT Master-Erweiterung — 9 neue Ermittlungsmodule

- **Forensik-Module** (F1-F4): Reverse Analytics/IP-Lookup, SSL-Zertifikat-Historie (crt.sh), PDF-Metadaten-Forensik, Wayback Machine De-Anonymisierung — alles VOR dem OSINT-Scan
- **Telegram Scroll-Loop**: Technischer Lazy-Loading-Algorithmus mit Signal-Pattern-Matching (Rendite, Schadens-, GwG-, Vorsatz-Indikatoren + Regex-Patterns)
- **Link-Hub & Affiliate-Analyse**: Shortlink-Auflösung, Facebook Ad Library als Pflicht-Quelle, Provisionsstruktur-Mapping, §5a UWG-Erkennung
- **Actor Loop**: Iterative Personen-Tiefenrecherche (North Data, OpenCorporates, Scam-Historien, Social Graphing, Alias-Erkennung) mit JSON-Dossier-Output
- **Tätigkeitskategorisierung**: 11 Kategorien (Immobilien bis Gesundheit) mit Rechtsgrundlagen, Kontrastanalyse-Regel für selektive Lizenzangaben
- **Vorsatz-Score**: Quantifiziertes Punkte-System (0-60+) für strafrechtlichen Intentionsnachweis — Kenntnis/Weiterbewerbung, Verschleierung, Produkt-Risiko
- **Gray Area & Blind Spot Assessment**: 6 BSA-Prüfpunkte (Prospektpflicht bis Affiliate-Transparenz) + 8 GAA-Grauzone-Prüfungen (Finanzbildung vs. Beratung, HWG, KYC)
- **Produkt-Tiefenanalyse**: Pro-Produkt-Loop mit Renditeberechnung (Zinseszins), MLM-Erkennung, Risikokategorie-Zuordnung (🔴🟠🟡🟢)
- **Normen-Matching**: Vollständige Muster→Normen-Tabelle (Finanzvertrieb, Kapitalmarkt, Wettbewerb, Strafrecht, Vertragsrecht, Gesundheit)
- **Regulatorische Arbitrage Detection**: Marktortprinzip-Prüfung, 9 Offshore-Jurisdiktionen mit Risikoprofilen
- **ScamAdviser + ScamDetector**: Als PFLICHT-Schritt 0b im Entscheidungsbaum (vor OSINT), Score-Interpretation, Confidence-Abzug-Regeln

### Neu in v0.5.1: Regulator-Endpunkte, Website-Trust-Checks, Plugin-Standardisierung

- **Regulator-Endpoints (Tier 1→2→3)**: Funktionierende API-Endpunkte für 8 Behörden (BaFin, FMA, FINMA, ESMA, SEC, SCA, DFSA, FCA) — automatische Eskalation von Direkt-API über Firecrawl zu Playwright
- **Website-Trust-Checks**: ScamAdviser + ScamDetector als PFLICHT-Quellen bei jeder Ermittlung, Score-Interpretation (0-100), automatische Confidence-Score-Integration
- **Red-Flag-Detektor erweitert**: 3 neue Prüfpunkte (ScamAdviser/ScamDetector Score, Crypto-Services-Erkennung, Domain-Alter + Besucherzahlen)
- **OSINT Spawn-Prompt erweitert**: PFLICHT-Website-Trust-Check für jede Domain im researcher-osint
- **Plugin.json standardisiert**: Auto-Discovery gemäß offiziellem Anthropic-Pattern (keine Component-Arrays mehr)

### Neu in v0.4.x: Parallele Ermittlung + Vollständiges Audit

- **Parallele Researcher-Architektur**: 3 Sonnet-Agents recherchieren gleichzeitig (Regulatorik, OSINT, Register) — 10-15 Min statt 30-60 Min
- **10-Phasen-Kernlogik**: Aufnahme → Ermittlung → Verifizierung → Einordnung → Visualisierung → Validierung → Bericht → Gesprächsnotiz → Maßnahmenplan → Verjährungs-Check
- **Konkreter Maßnahmenplan**: Was/Warum/Wer/Wann/Womit — keine vagen Empfehlungen
- **Verjährungs-System**: Automatische Fristberechnung für alle Tatbestände
- **Eskalationspfade**: Wann Polizei, StA, Behörde, Zivilklage — inkl. Kostenrechner
- **Stabilisiertes Confidence-Scoring**: Quellen-Klassen Q1-Q5 + Pflicht-Zeile "Was fehlt"
- **Erweiterte Prüffelder**: Sozialversicherung, Krypto/DeFi, ESG, IP/Marken, Supply-Chain, Schneeballsystem-Erkennung

### Ermittlungs-Framework (seit v0.3.0)

Das Plugin nimmt bei komplexen Fällen automatisch die Haltung von **LKA-Ermittlern**, **Staatsanwälten** und **Fachanwälten** ein:

- **Hybrides Modell**: Einfache Fragen → Subagent. Komplexe Fälle → Agent Team mit 5 spezialisierten Agents
- **Proaktive Ermittlung**: OSINT über alle Social-Media-Plattformen, Regulierungs-Warnungen, Beweismittelsicherung
- **Unternehmens-Verifizierung**: Handelsregister-Alter vs. Außendarstellung (Red-Flag-Detektor)
- **Eigenständige Recherche**: Vertraut NIEMALS blind auf User-Unterlagen

---

## Features

- **6 Jurisdiktionen**: Deutschland, Österreich, Schweiz, EU, USA, UAE
- **Hybrides Agent-Modell**: Automatische Komplexitäts-Erkennung → Subagent oder Agent Team
- **Ermittlungs-Framework**: LKA + Staatsanwaltschaft + Fachanwalt Perspektiven
- **Proaktive OSINT-Ermittlung**: YouTube, Facebook, Telegram, Instagram, X, TikTok, LinkedIn, Reddit, WhatsApp
- **Regulatorische Warnungen**: BaFin, FMA, FINMA, ESMA, SEC, IOSCO automatisch prüfen
- **Unternehmens-Verifizierung**: Handelsregister vs. Außendarstellung mit Red-Flag-Detektor
- **Beweismittelsicherung**: Funde mit Volltext, URL, Zeitstempel dokumentiert
- **Autonome Recherche**: Erkennt Firmennamen, Domains, PDFs und beschafft Daten selbständig
- **Confidence-Scoring**: 0-100% Bewertung jeder Aussage mit transparentem Scoring-Protokoll
- **Bewertungs-Legende (A-E)**: Befunde einzeln bewertet von "Vollständig belegt" bis "Widersprüchlich"
- **Dreifach-Validierung**: Devil's Advocate + Blind Spot Analyst + Gray Area Analyst
- **Domain-Prüfung**: Impressum, DSGVO, Cookie-Banner, AGB, Markenschutz
- **PDF-Analyse**: Verträge, AGBs, Rechtsdokumente prüfen
- **Disclaimer-System**: Automatische Rechtshinweise je nach Confidence-Level
- **Consulting-Frameworks**: SWOT, Porter's Five Forces, PESTEL, BCG-Matrix
- **Docs-Output**: Alle Analysen und Recherchen werden als Dateien im Plugin gespeichert

---

## Plugin-Struktur

```
beratungs-suite-pro/
├── .claude-plugin/
│   └── plugin.json                    # Plugin-Manifest
├── .mcp.json                          # MCP-Server-Konfiguration
│
├── skills/                            # Auto-aktivierende + User-invocable Skills
│   ├── recht-recherche/SKILL.md       # Rechtsrecherche (alle Jurisdiktionen)
│   ├── steuer-analyse/SKILL.md        # Steuerrechtliche Analyse
│   ├── beratung-strategie/SKILL.md    # Strategische Unternehmensberatung
│   ├── umsetzungsplan/SKILL.md        # Konkreter Aktionsplan aus Findings (UPD v0.7.0 — Perspektiven)
│   ├── ermittlung/SKILL.md            # Erzwingt Agent-Team-Modus
│   ├── recht-analyse/SKILL.md         # Orchestrierter Rechts-Workflow
│   ├── steuer-check/SKILL.md          # Orchestrierter Steuer-Workflow
│   └── strategie-entwurf/SKILL.md     # Orchestrierter Strategie-Workflow
│
├── agents/                            # Spezialisierte Agenten
│   ├── ermittler.md                   # LKA-Ermittler (OSINT, Beweisketten, Netzwerk)
│   ├── anklaeger.md                   # Staatsanwalt (Tatbestände, Strafbarkeit)
│   ├── steuerfahnder.md               # Steuerfahnder (Hinterziehung, Scheingeschäfte)
│   ├── jurist.md                      # Rechtsrecherche-Spezialist
│   ├── steuerberater.md               # Steuerrecht-Spezialist
│   ├── strategie-consultant.md        # Strategie-Spezialist
│   ├── validator.md                   # Confidence-Scoring Agent
│   ├── devils-advocate.md             # Dreifach-Prüfungs-Agent
│   └── umsetzungsplaner.md            # Implementierungs-Planungs-Spezialist (NEU v0.5.0)
│
├── hooks/
│   └── hooks.json                     # Disclaimer-Enforcement, Namensschema, Activity-Log, Perspektiven-Check
│
├── references/                        # Internes Regelwerk
│   ├── umsetzungsplan.md              # Findings-Aufnahme, Priorisierung, Konflikt-Matrix (UPD v0.7.0)
│   ├── perspektiven-auswahl.md        # Drei-Perspektiven-Checkpoint (NEU v0.7.0)
│   ├── compliance-selbstpruefung.md   # Website/AGB/Affiliate/Struktur-Prüflisten (NEU v0.7.0)
│   ├── visualisierung-export.md       # Mermaid → PNG/PDF Export via mmdc (NEU v0.7.0)
│   ├── ermittlungs-framework.md       # Komplexitäts-Erkennung + Team-Zusammensetzungen
│   ├── autonome-recherche.md          # Entscheidungsbaum + Proaktive Ermittlung (OSINT)
│   ├── regulator-endpoints.md         # Tier 1-2-3 API-Endpunkte für 8 Behörden (NEU v0.5.1)
│   ├── forensik-digitaler-fussabdruck.md # Reverse Analytics, SSL-Historie, PDF-Forensik (NEU v0.6.0)
│   ├── telegram-scroll-loop.md        # Lazy-Loading-Algorithmus + Signal-Patterns (NEU v0.6.0)
│   ├── link-hub-affiliate-analyse.md  # Shortlink-Auflösung, FB Ad Library, §5a UWG (NEU v0.6.0)
│   ├── actor-loop.md                  # Personen-Tiefenrecherche + Dossier (NEU v0.6.0)
│   ├── taetigkeitskategorisierung.md  # 11 Kategorien + Kontrastanalyse (NEU v0.6.0)
│   ├── vorsatz-score.md               # Strafrechtlicher Intentionsnachweis 0-60+ (NEU v0.6.0)
│   ├── gray-area-blind-spot.md        # 6 BSA + 8 GAA Prüfkataloge (NEU v0.6.0)
│   ├── produkt-tiefenanalyse.md       # Pro-Produkt-Loop + Renditeberechnung (NEU v0.6.0)
│   ├── normen-matching.md             # Muster → Normen Zuordnung (NEU v0.6.0)
│   ├── confidence-scoring.md          # Scoring-Algorithmus (9 Schritte)
│   ├── disclaimer-system.md           # Disclaimer-Texte + Bewertungs-Legende (A-E)
│   ├── docs-output.md                 # Docs-Output-Konvention (Pfade, Namensschema)
│   ├── jurisdiktions-mapping.md       # Stichwort → Jurisdiktion → Quellen + Arbitrage (UPD v0.6.0)
│   └── quellen-registry.md            # Alle Quellen mit Status + Fallbacks + Trust-Checks (UPD v0.6.0)
│
├── docs/                              # Plugin-eigene Dokumente
│   ├── analysen/                      # Fertige Reports + Gutachten
│   └── recherchen/                    # Deep Research, Crawl-Ergebnisse, Quellen
│
├── scripts/                           # API-Clients und Hilfsskripte
│   ├── setup-check.sh                 # Erreichbarkeitstest aller APIs
│   └── ris-austria-query.py           # RIS Österreich API Client
│
└── templates/                         # Output-Vorlagen
    ├── umsetzungsplan-template.md     # 5-Felder-Format + Perspektive + Status-Tracking (UPD v0.7.0)
    ├── legal-memo.md                  # Rechtsgutachten-Format
    ├── tax-analysis.md                # Steuerliche Stellungnahme
    ├── gespraechsnotiz.md             # Kompakte Gesprächsnotiz
    └── strategy-report.md             # Management-Summary
```

---

## Hybrides Agent-Modell

### Automatische Komplexitäts-Erkennung

Jeder Skill prüft automatisch die Komplexität der Anfrage:

| Modus | Wann | Was passiert |
|-------|------|-------------|
| **Subagent** (einfach) | Einzelne Normfrage, Berechnung, Rechnungsprüfung | Fach-Agent + Proaktive Ermittlung + Validator |
| **Agent Team** (komplex) | Mehrere Akteure, Strafrecht, Due Diligence, Multi-Jurisdiktion | 5-Agent-Team mit LKA/StA/Fachanwalt-Perspektiven |

### Agent-Team-Zusammensetzungen

#### Recht (Ermittlungs-Modus)

| Agent | Rolle | Modell | Fokus |
|-------|-------|--------|-------|
| Lead | Koordinator | Opus | Steuert Ermittlung, prüft Vollständigkeit |
| Ermittler | LKA-Haltung | Opus | OSINT, Beweissicherung, Netzwerk-Analyse |
| Ankläger | StA-Haltung | Opus | Tatbestandsprüfung, Strafbarkeit |
| Fachanwalt | Zivilrecht | Sonnet | Ansprüche, Regulierung, Handlungsempfehlungen |
| Devil's Advocate | Quality | Opus | Gegenposition, Blind Spots, Gray Areas |

#### Steuer (Ermittlungs-Modus)

| Agent | Rolle | Modell | Fokus |
|-------|-------|--------|-------|
| Lead | Koordinator | Opus | Steuert Ermittlung |
| Ermittler | LKA-Haltung | Opus | OSINT, Finanztransaktionen, Firmennetzwerke |
| Steuerfahnder | Fahnder | Opus | Steuerhinterziehung, Scheingeschäfte, Betriebsprüfung |
| Fachanwalt Steuer | Steuerrecht | Sonnet | DBA, Gestaltung, Anzeigepflichten |
| Devil's Advocate | Quality | Opus | Gegenposition |

#### Strategie (Ermittlungs-Modus)

| Agent | Rolle | Modell | Fokus |
|-------|-------|--------|-------|
| Lead | Koordinator | Opus | Steuert Analyse |
| Ermittler | LKA-Haltung | Opus | OSINT, Wettbewerber-Netzwerk, Marktmanipulation |
| Marktanalyst | Datensammler | Sonnet | Trends, Benchmarks, Frameworks |
| Stratege | Empfehlungen | Opus | Handlungsempfehlungen, Risikobewertung |
| Devil's Advocate | Quality | Opus | Gegenposition |

### Subagent-Modus (einfache Fälle)

```
User → Fach-Agent (mit proaktiver Ermittlung) → Validator → [Devils Advocate bei Score < 70] → Output
```

| Agent | Modell | Zuständigkeit |
|-------|--------|--------------|
| **Jurist** | Opus | Rechtsrecherche, Normensuche, Domain-Prüfung, PDF-Analyse |
| **Steuerberater** | Opus | Steuerrechtliche Analyse, Rechnungsprüfung, DBA-Analyse |
| **Strategie-Consultant** | Opus | Marktanalyse, Wettbewerbsanalyse, Consulting-Frameworks |
| **Validator** | Opus | Confidence-Scoring nach JEDEM Fach-Agenten |
| **Devil's Advocate** | Opus | Dreifach-Prüfung bei Score < 70 |

---

## Proaktive Ermittlung (OSINT)

### Pflicht bei JEDER rechtlichen Bewertung

Das Plugin vertraut **NIEMALS** blind auf User-Unterlagen. Es ermittelt eigenständig:

#### Regulatorische Warnungen

| Behörde | Region | Was geprüft wird |
|---------|--------|------------------|
| BaFin | DE | Warnliste, Erlaubnispflicht |
| FMA | AT | Investorenwarnungen |
| FINMA | CH | Warnliste |
| ESMA | EU | Investor Warnings |
| SEC | USA | Enforcement Actions |
| IOSCO | International | Investor Alerts |

#### Digitaler Fußabdruck

| Plattform | Was analysiert wird |
|-----------|-------------------|
| YouTube | Channels, Videos, Versprechen, Kommentare |
| Facebook | Seiten, Gruppen, Posts, Bewertungen |
| Telegram | Channels, Gruppen, gepinnte Nachrichten |
| Instagram | Profile, Posts, Follower |
| X/Twitter | Posts, Replies, Erwähnungen |
| TikTok | Videos, Kommentare |
| LinkedIn | Firmenprofil, Mitarbeiter, Stellenanzeigen |
| WhatsApp | Öffentliche Gruppenlinks |
| Reddit | Erfahrungsberichte, Threads |
| Trustpilot/Google | Bewertungen, Beschwerden |

#### Unternehmens-Verifizierung

| Prüfpunkt | Red Flag |
|-----------|----------|
| Firmenalter vs. Behauptung | Gegründet 2025, behauptet "10 Jahre Erfahrung" |
| Stammkapital vs. Geschäftsvolumen | 25.000 € Stammkapital, bewirbt Millionen-Investments |
| Sitz vs. Auftreten | Briefkasten in DE, "Hauptsitz" laut Website in London |
| Lizenzen vs. Behauptung | Behauptet BaFin-Lizenz, keine im Register gefunden |
| Mitarbeiter vs. Behauptung | LinkedIn zeigt 3, Website behauptet "globales Team" |

---

## Bewertungs-Legende

Jeder Befund wird einzeln eingestuft:

| Stufe | Bedeutung | Kriterien |
|-------|-----------|-----------|
| **A** | Vollständig belegt | >= 3 unabhängige Quellen, mind. 1 offizielle Behörde |
| **B** | Gut belegt, mit Einschränkungen | 2+ Quellen, aber Lücken (Identität nicht verifiziert, nur Sekundärquellen) |
| **C** | Teilweise belegt | Nur 1 Quelle oder Widersprüche |
| **D** | Unbelegt / nur Behauptung | Keine unabhängige Bestätigung |
| **E** | Widersprüchlich | Primärquellen widersprechen sich |

---

## Confidence-Scoring

Jede Aussage erhält einen transparenten Confidence-Score:

| Score | Label | Verhalten |
|-------|-------|-----------|
| 90-100 | SEHR HOCH | Minimaler Disclaimer |
| 70-89 | HOCH | Standard-Disclaimer |
| 50-69 | MITTEL | Ausführlicher Disclaimer, fachliche Prüfung empfohlen |
| 30-49 | NIEDRIG | "Zwingend fachliche Beratung einholen" |
| 0-29 | SEHR NIEDRIG | "Keine zuverlässige Aussage möglich" |

### Automatische Eskalation

- Score < 70 → Devil's Advocate Agent aktiviert
- Score < 50 → Zusätzlich Blind Spot + Gray Area Prüfung
- Quellen widersprechen sich → Beide Positionen dargestellt
- Strafrechtliche Relevanz → Sofortige Warnung

---

## Docs-Output

Alle Analysen und Recherchen werden automatisch im Plugin gespeichert:

```
docs/
├── analysen/      ← Fertige Reports, Gutachten, Prüfungen
└── recherchen/    ← Deep Research, Crawl-Ergebnisse, Quellen
```

**Namensschema**: `YYYY-MM-DD-<thema>-<typ>.md`

Jede Datei enthält YAML-Frontmatter mit Titel, Datum, Typ, Skill, Jurisdiktion und Confidence-Score.

---

## Slash-Commands

| Command | Beschreibung |
|---------|-------------|
| `/ermittlung` | **Neu** — Erzwingt Agent-Team-Modus für umfassende Ermittlungen |
| `/recht-analyse` | Rechtsrecherche (auto-erkennt ob Subagent oder Team) |
| `/steuer-check` | Steueranalyse (auto-erkennt ob Subagent oder Team) |
| `/strategie-entwurf` | Strategische Analyse (auto-erkennt ob Subagent oder Team) |

---

## MCP-Server

| Server | Paket / Repo | Zweck |
|--------|-------------|-------|
| **rechtsinformationen-bund** | `@iflow-mcp/wolfgangihloff-rechtsinformationen` | Deutsche Bundesrechtsinformationen |
| **german-law** | `german-law-mcp` | Deutsche Gesetze via gesetze-im-internet.de |
| **openregister** | `openregister-mcp` | Handelsregister-Abfragen (DE) |
| **ayunis-legal** | [ayunis-legal-mcp](https://github.com/ayunis-core/ayunis-legal-mcp) | Semantische Suche über deutsche Gesetze (RAG) |

---

## Installation

```bash
# Plugin in Claude Code installieren
cp -r beratungs-suite-pro ~/.claude/plugins/beratungs-suite-pro

# Erreichbarkeit aller APIs testen
bash scripts/setup-check.sh
```

Claude Code erkennt das Plugin automatisch in der nächsten Session.

### Voraussetzungen

- Claude Code CLI
- Node.js + npx (für MCP-Server)
- Python 3 (für API-Clients)
- Firecrawl Plugin (für Crawl-basierte Quellen + OSINT)
- openrouter-skill-v3 (für Deep Research)
- agent-team-creator Skill (für Agent-Team-Modus)

---

## Disclaimer

Dieses Plugin dient ausschließlich der allgemeinen Orientierung und stellt **keine Rechtsberatung, Steuerberatung oder sonstige professionelle Beratung** dar. Für verbindliche Auskünfte konsultieren Sie einen zugelassenen Rechtsanwalt bzw. Steuerberater.

---

## Lizenz

MIT

---

## Changelog

- **v0.7.0** — Drei-Perspektiven-System: Pflicht-Checkpoint nach Analyse (Schutzseite / Selbstprüfung / Prüfauftrag), 3 neue Reference-Files (perspektiven-auswahl, compliance-selbstpruefung, visualisierung-export), Umsetzungsplan-Skill mit Perspektiven-Parameter + 5-Pflichtfelder (Kosten entfernt), Update-Mechanismus + Monitoring-Eskalation in Planlogik, Diagramm-Export als PNG/PDF via mmdc, Perspektiven-Checkpoint in Kernlogik Phase 9 und Ermittlung Schritt 6, 2 neue Hooks (Perspektiven-Check + Export-Logger), Template-Überarbeitung (Ressourcen-Hinweise statt Kosten-Übersicht)
- **v0.6.4** — Bright Data MCP Transport Fix (SSE → Streamable HTTP), JSON-Validierung in Stop-Hooks korrigiert
- **v0.6.3** — Error-Recovery + Templates: Fallback-Tabellen in Orchestrator-Skills, Template-Frontmatter, Agent-Tool-Referenzen auf Bright Data, requirements.txt
- **v0.6.2** — Plugin-Audit: Hooks gefixt (Notification→Stop), 5 Legacy-Commands gelöscht, Agent-Modelle optimiert (steuerberater/validator→Sonnet), Kernlogik v2 mit Referenzen auf alle v0.6.0 Module, Ermittler-Description mit Bright Data Tools, Experimental Scripts bereinigt
- **v0.6.1** — Bright Data MCP + Telegram OSINT MCP: Bright Data `@brightdata/mcp` als Social-Media-OSINT-Backend (Instagram, TikTok, Facebook, X/Twitter, LinkedIn, YouTube — strukturiertes JSON statt HTML-Parsing), Custom Telegram OSINT MCP Server via Telethon MTProto API (4 Tools: Channel-Info, Messages, Search, Members), komplett überarbeitete `autonome-recherche.md` mit Bright Data Tool-Zuständigkeits-Matrix, `ermittlungs-framework.md` Plattform-Checkliste auf Bright Data migriert, neues `setup-check.sh` mit API-Key-Validierung und Python-Paket-Checks, `.mcp.json` um brightdata + telegram-osint Server erweitert
- **v0.6.0** — OSINT Master-Erweiterung: 9 neue Reference-Files (forensik-digitaler-fussabdruck, telegram-scroll-loop, link-hub-affiliate-analyse, actor-loop, taetigkeitskategorisierung, vorsatz-score, gray-area-blind-spot, produkt-tiefenanalyse, normen-matching), Ermittler-Agent Phase 0 Forensik, Jurisdiktions-Mapping Regulatorische Arbitrage Detection (Marktortprinzip + 9 Offshore-Jurisdiktionen), ScamAdviser + ScamDetector als Pflicht-Schritt 0b im Entscheidungsbaum
- **v0.5.1** — Regulator-Endpunkte & Website-Trust-Checks: Neue `regulator-endpoints.md` mit funktionierenden API-Endpunkten für 8 Behörden (BaFin, FMA, FINMA, ESMA, SEC, SCA, DFSA, FCA) in 3 Tiers (Direkt-API → Firecrawl → Playwright), ScamAdviser + ScamDetector als PFLICHT-Quellen in `quellen-registry.md` mit Score-Interpretation und Confidence-Score-Integration, 3 neue Red-Flag-Prüfpunkte in `ermittlungs-framework.md` (ScamAdviser/ScamDetector Score, Crypto-Services, Domain-Alter), PFLICHT-Website-Trust-Check im researcher-osint Spawn-Prompt, Tier-1-2-3 Strategie in `autonome-recherche.md` statt generisches "Firecrawl", Diamond-Solution-Dubai-Ermittlung als Referenz-Analyse, plugin.json vereinfacht auf Auto-Discovery (offizielles Anthropic-Pattern)
- **v0.5.0** — Umsetzungsplan-Modul: Standalone `/umsetzungsplan` Command + Skill, spezialisierter `umsetzungsplaner` Agent, 6-Felder-Maßnahmen-Format (Was/Warum/Wer/Frist/Womit/Erfolgskriterium), Fortschritts-Tracking (✗/◷/✓), Kosten-Übersicht pro Maßnahme, Konflikt-Auflösungs-Matrix bei Multi-Domänen, Veraltungs-Check für Findings, Agent-Team-Modus für komplexe Multi-Domänen-Pläne, Hooks implementiert (Disclaimer-Enforcement, Namensschema-Prüfung, Activity-Logging), Legacy-Commands zu Skills migriert (ermittlung, recht-analyse, steuer-check, strategie-entwurf), Agent-Frontmatter korrigiert (name-Feld), plugin.json Component-Paths hinzugefügt, Ayunis-Legal MCP als optional markiert
- **v0.4.1** — Parallele Researcher-Architektur: 3 Sonnet-Agents (Regulatorik, OSINT, Register) recherchieren gleichzeitig, 2-Phasen-Ablauf (Sammlung parallel → Analyse sequenziell), Teams 7-8 Agents
- **v0.4.0** — DA/BSA/Gray-Area-Audit: Verjährungsfristen, Eskalationspfade, Maßnahmenplan, Insolvenzrisiko, Whistleblower (HinSchG), Musterfeststellungsklage, Kostenrechner, Selbstanzeige, Sozialversicherung, Krypto/DeFi, ESG, IP/Marken, Supply-Chain (LkSG), Schneeballsystem, UK Ltd, DSGVO-Grenzen, Q1-Q5 Confidence-Scoring, 10-Phasen-Kernlogik
- **v0.3.2** — Timeline-Analyse, Beweissicherungs-Policy, Google Drive Integration
- **v0.3.1** — Kernlogik (8-Phasen-Durchlauf), Mermaid-Visualisierungen (Netzwerk, Geldfluss, Beweisketten), Gesprächsnotiz-Template, systematischer Dual-Output (Bericht + Notiz)
- **v0.3.0** — Ermittlungs-Framework: Hybrides Agent-Modell (Subagent/Team), neue Agents (Ermittler, Ankläger, Steuerfahnder), proaktive OSINT-Ermittlung, Unternehmens-Verifizierung, Bewertungs-Legende (A-E), `/ermittlung` Command, Docs-Output-System, Strategie-Consultant auf Opus
- **v0.2.0** — ayunis-legal-mcp hinzugefügt, Market Intelligence Agent referenziert
- **v0.1.0** — Initiale Version mit 3 Skills, 5 Agents, 3 Commands, Confidence-Scoring, autonomer Recherche
