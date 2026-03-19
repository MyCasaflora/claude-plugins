# Recherche: MCP-Server, Tools & Alternativen fuer Rechts- und Steuer-Plugin

Stand: 2026-03-17

---

## 1. Existierende MCP-Server (Legal / Tax)

### 1.1 Deutsche Rechts-MCPs

| Name | URL | Beschreibung | Kosten | Integration |
|------|-----|-------------|--------|-------------|
| **ayunis-legal-mcp** | https://github.com/ayunis-core/ayunis-legal-mcp | MCP-Server fuer deutsche Gesetzbuecher (77 Stars) | Kostenlos / Open Source | Direkt nutzbar als MCP-Server, liefert deutsche Gesetzestexte |
| **rechtsinformationen-bund-de-mcp** | https://github.com/wolfgangihloff/rechtsinformationen-bund-de-mcp | MCP-Server fuer das offizielle Bundesrechtsinformationsportal (rechtsinformationen.bund.de). NeuRIS-Integration. (6 Stars) | Kostenlos / Open Source | Beste Option fuer offizielle DE-Bundesgesetze. Nutzt die offizielle API. Claude Desktop nutzt ihn automatisch fuer DE-Rechtsfragen |
| **German-law-mcp** | https://github.com/Ansvar-Systems/German-law-mcp | MCP-Server fuer deutsche Gesetzgebung via gesetze-im-internet.de (3 Stars) | Kostenlos / Open Source | Scraping-basiert, gut als Fallback |
| **gesetzessuche** | https://github.com/Steffen-W/gesetzessuche | MCP-Server + Python-Library fuer Suche in deutschen Bundesgesetzen (4 Stars) | Kostenlos / Open Source | Kann als Library eingebunden oder als MCP genutzt werden |

### 1.2 Steuer-MCPs

| Name | URL | Beschreibung | Kosten | Integration |
|------|-----|-------------|--------|-------------|
| **norman-mcp-server** | https://github.com/norman-finance/norman-mcp-server | AI-Buchhaltung und Steuererklaerung via MCP fuer EU-Unternehmer (20 Stars) | Kostenlos / Open Source | Direkt relevant fuer Steuer-Plugin, EU-Fokus |
| **french-tax-mcp** | https://github.com/cornelcroi/french-tax-mcp | MCP-Server fuer franzoesische Steuerberechnungen (11 Stars) | Kostenlos / Open Source | Architektur als Vorlage fuer DE-Steuer-MCP nutzbar |
| **irs-taxpayer-mcp** | https://github.com/dma9527/irs-taxpayer-mcp | 39 Tools fuer US-Bundessteuer-Berechnungen, Credits, Abzuege (2 Stars) | Kostenlos / Open Source | Umfangreichstes Tax-MCP, gute Vorlage fuer Architektur |
| **saft-mcp** | https://github.com/Bloomidea/saft-mcp | Analyse von SAF-T Steuerdateien (PT) mit AI (1 Star) | Kostenlos / Open Source | Relevant fuer SAF-T/E-Rechnung-Integration |
| **facturx-mcp** | https://github.com/SamDreamsMaker/facturx-mcp | Factur-X E-Rechnungen (EN 16931) erstellen/validieren (1 Star) | Kostenlos / Open Source | Direkt relevant fuer E-Rechnungs-Compliance (ZUGFeRD/Factur-X) |
| **korean-capital-gains-tax-mcp** | https://github.com/pchuri/korean-capital-gains-tax-mcp | Kapitalertragssteuer-Rechner fuer KR-Immobilien (2 Stars) | Kostenlos / Open Source | Architektur-Vorlage fuer laenderspezifische Tax-Rechner |
| **tax-law-mcp** (Japan) | https://github.com/kentaroajisaka/tax-law-mcp | Japanisches Steuerrecht via e-Gov API (69 Stars) | Kostenlos / Open Source | Best-Practice: Integration mit Regierungs-API |

### 1.3 Internationale Legal-MCPs (als Vorlage/Erweiterung)

| Name | URL | Beschreibung | Kosten | Integration |
|------|-----|-------------|--------|-------------|
| **yargi-mcp** (Tuerkei) | https://github.com/saidsurucu/yargi-mcp | MCP fuer tuerkische Rechtsdatenbanken (674 Stars, groesster Legal-MCP) | Kostenlos / Open Source | Architektur-Referenz (hoechste Star-Zahl) |
| **uk-case-law-mcp-server** | https://github.com/georgejeffers/uk-case-law-mcp-server | UK Case Law via National Archives API (20 Stars) | Kostenlos / Open Source | Vorlage fuer Rechtsprechungs-Integration |
| **us-legal-mcp** | https://github.com/JamesANZ/us-legal-mcp | Umfassende US-Gesetzgebung (17 Stars) | Kostenlos / Open Source | Referenz fuer Multi-Jurisdiktions-Ansatz |
| **courtlistener-mcp** | https://github.com/blakeox/courtlistener-mcp | CourtListener API fuer Urteile, Dockets, Gerichtsakten (7 Stars) | Kostenlos / Open Source | Modell fuer Rechtsprechungs-Suche |
| **law7** | https://github.com/mikhashev/law7 | Offene aktuelle Rechtsdatenbank fuer AI-Assistenten (9 Stars) | Kostenlos / Open Source | Multi-Jurisdiktions-Engine |
| **legal-context-ce** | https://github.com/protomated/legal-context-ce | Bridge zu Kanzlei-DMS (Clio) (22 Stars) | Kostenlos / Open Source | Modell fuer DMS-Integration |
| **legal-mcp** | https://github.com/agentic-ops/legal-mcp | Umfassender MCP fuer Legal Workflows (11 Stars) | Kostenlos / Open Source | Workflow-orientierter Ansatz |
| **pasal** (Indonesien) | https://github.com/ilhamfp/pasal | AI-native Legal Platform: MCP + REST API + Web (189 Stars) | Kostenlos / Open Source | Beste Full-Stack-Referenz |
| **law-scrapper-mcp** (Polen) | https://github.com/numikel/law-scrapper-mcp | Polnische Rechtsakte via Sejm API (11 Stars) | Kostenlos / Open Source | Vorlage fuer Parlaments-API-Integration |
| **brlaw_mcp_server** (Brasilien) | https://github.com/pdmtt/brlaw_mcp_server | Brasilianisches Recht via offizielle Quellen (27 Stars) | Kostenlos / Open Source | Agent-driven Research Pattern |
| **boe-mcp** (Spanien) | https://github.com/AnCode666/boe-mcp | Spanisches Amtsblatt (BOE) API (3 Stars) | Kostenlos / Open Source | Offizielles Amtsblatt-Muster |

---

## 2. Open-Source Legal Tech Tools

### 2.1 Deutsche Gesetze als strukturierte Daten

| Name | URL | Beschreibung | Kosten | Integration |
|------|-----|-------------|--------|-------------|
| **kmein/gesetze** | https://github.com/kmein/gesetze | Deutsche Gesetze von gesetze-im-internet.de als Plain Text, taeglich aktualisiert (41 Stars) | Kostenlos | Als Datenquelle fuer Offline-Index, Git-basierte Versionierung |
| **jandinter/gesetze-im-internet** | https://github.com/jandinter/gesetze-im-internet | Woechentliches Archiv von gesetze-im-internet.de (36 Stars) | Kostenlos | Historische Versionen vergleichbar |
| **QuantLaw/gesetze-im-internet** | https://github.com/QuantLaw/gesetze-im-internet | Taegliches Archiv von gesetze-im-internet.de (33 Stars) | Kostenlos | Wissenschaftlich betrieben (Quantitative Legal Studies) |
| **bundesrecht-scraper** | https://github.com/daniel-j-h/bundesrecht-scraper | GitHub Action Scraper fuer Aenderungen an Bundesrecht (4 Stars) | Kostenlos | CI/CD-Muster fuer automatische Updates |
| **datenschutz-checkliste** | https://github.com/mirkoschubert/datenschutz-checkliste | DSGVO-Checkliste als Open-Source-Daten (34 Stars) | Kostenlos | DSGVO-Modul-Datenquelle |

### 2.2 OpenLegalData (Deutsche Rechtsprechung)

| Name | URL | Beschreibung | Kosten | Integration |
|------|-----|-------------|--------|-------------|
| **OpenLegalData.io** | https://de.openlegaldata.io/ | Offene Plattform fuer deutsche Rechtsprechung und Gesetze | Kostenlos / API verfuegbar | REST API fuer Urteils-Suche, kann direkt angebunden werden |
| **oldp-de** | https://github.com/openlegaldata/oldp-de | Deutsches Theme fuer Open Legal Data (6 Stars) | Kostenlos | Frontend-Referenz |
| **legal-ai-assistant** | https://github.com/KermitClein/legal-ai-assistant | KI-Rechtsassistent mit OpenLegalData API | Kostenlos | Referenz-Implementation |

### 2.3 LegalXML / Akoma Ntoso Standards

| Name | URL | Beschreibung | Kosten | Integration |
|------|-----|-------------|--------|-------------|
| **legaldocml-akomantoso** | https://github.com/oasis-open/legaldocml-akomantoso | OASIS TC: Schema, Beispiele, Libraries fuer LegalDocML/Akoma Ntoso (76 Stars) | Kostenlos | XML-Schema fuer strukturierte Gesetzestexte, EU-Standard |
| **AkomaNtosoBulkData** | https://github.com/SenatoDellaRepubblica/AkomaNtosoBulkData | Bulk-Daten des ital. Senats in Akoma Ntoso Format (34 Stars) | Kostenlos | Referenz fuer Akoma-Ntoso-Verarbeitung |
| **Schematise** | https://github.com/sankalpsrv/Schematise | LLM-basierter XML-Generator fuer Gesetze in LegalDocML/LegalRuleML (20 Stars) | Kostenlos | LLM-zu-LegalXML-Konvertierung |

### 2.4 Internationale Tools

| Name | URL | Beschreibung | Kosten | Integration |
|------|-----|-------------|--------|-------------|
| **CourtListener / Free Law Project** | https://www.courtlistener.com/ | Groesste freie US-Rechtsprechungs-Datenbank mit API | Kostenlos (API-Key noetig) | REST API, MCP bereits vorhanden (courtlistener-mcp) |
| **lawpy** | https://github.com/paultopia/lawpy | Pythonisches Interface zur CourtListener API (20 Stars) | Kostenlos | Python-Library fuer CourtListener |
| **air-gapped-legal-mind** | https://github.com/automotive-ai/air-gapped-legal-mind | Lokale Legal AI fuer EU-Richtlinien, komplett offline (5 Stars) | Kostenlos | Offline-EU-Recht-Referenz |

---

## 3. Kommerzielle APIs mit Free Tiers

### 3.1 Steuer-APIs

| Name | URL | Beschreibung | Free Tier | Integration |
|------|-----|-------------|-----------|-------------|
| **Avalara AvaTax** | https://developer.avalara.com/ | Sales Tax Calculation API, SDKs fuer PHP/Ruby/Python | Free Sandbox, 250 Transaktionen/Monat im Free Plan | SDKs: [PHP](https://github.com/avadev/AvaTax-REST-V2-PHP-SDK) (51*), [Ruby](https://github.com/avadev/AvaTax-REST-V2-Ruby-SDK) (38*), [Python](https://github.com/avadev/AvaTax-REST-V2-Python-SDK) (23*). Gut fuer US/CA Sales Tax |
| **TaxJar** (by Stripe) | https://www.taxjar.com/developers/ | US/EU Sales Tax API | Free Sandbox verfuegbar | REST API, gut fuer E-Commerce Tax |
| **Thomson Reuters ONESOURCE** | https://tax.thomsonreuters.com/ | Umfassende Steuerberechnung | Kein Free Tier, Enterprise-only | Nur fuer Enterprise-Kunden relevant |
| **IBFD** | https://www.ibfd.org/ | Internationale Steuerdatenbank | Academic Access fuer Universitaeten, kein Developer-Programm | Nicht direkt integrierbar, nur als Recherche-Quelle |
| **VAT Comply** | https://www.vatcomply.com/ | EU-Umsatzsteuer-Validierung (USt-IdNr.) | Free API fuer USt-IdNr. Validierung | REST API, einfach integrierbar fuer EU-VAT-Checks |
| **VIES (EU)** | https://ec.europa.eu/taxation_customs/vies/ | Offizielle EU USt-IdNr. Validierung | Kostenlos | SOAP/REST API, offizielle EU-Quelle |

### 3.2 Rechts-Datenbanken

| Name | URL | Beschreibung | Free Tier | Integration |
|------|-----|-------------|-----------|-------------|
| **Juris** | https://www.juris.de/ | Deutsche Rechtsdatenbank | Kein Free Tier, kein Developer-Programm bekannt | Nicht direkt integrierbar |
| **Beck-Online** | https://beck-online.beck.de/ | Umfassende deutsche Rechtsdatenbank | Kein Free Tier, kein oeffentliches API | Nicht direkt integrierbar |
| **LexisNexis** | https://developer.lexisnexis.com/ | Globale Rechtsdatenbank | Developer Portal vorhanden, aber Enterprise-Pricing | REST API theoretisch moeglich, hohe Kosten |
| **Westlaw (Thomson Reuters)** | https://legal.thomsonreuters.com/en/westlaw | US/UK Rechtsdatenbank | Kein Free Tier fuer Entwickler | Nicht direkt integrierbar |
| **Casetext (by Thomson Reuters)** | https://casetext.com/ | AI-Legal-Research | Kein Free Developer Tier | Nicht direkt integrierbar |

---

## 4. Open Data Portale & Crawl-Strategien

### 4.1 Government Open Data Portale

| Name | URL | Beschreibung | Kosten | Integration |
|------|-----|-------------|--------|-------------|
| **GovData.de** | https://www.govdata.de/ | Deutsches Open-Data-Portal (Bund, Laender, Kommunen) | Kostenlos | CKAN API, Metadaten zu Rechts- und Verwaltungsdaten |
| **data.gv.at** | https://www.data.gv.at/ | Oesterreichisches Open-Data-Portal | Kostenlos | CKAN API, oesterreichische Rechtsdaten |
| **opendata.swiss** | https://opendata.swiss/ | Schweizer Open-Data-Portal | Kostenlos | CKAN API, CH-Verwaltungsdaten |
| **data.gov** | https://data.gov/ | US Open Data Portal | Kostenlos | REST API, US-Regulierungsdaten |
| **bayanat.ae** | https://bayanat.ae/ | UAE Open Data Portal | Kostenlos | REST API, VAE-Daten |
| **EU Open Data Portal** | https://data.europa.eu/ | EU-Institutionen Daten | Kostenlos | SPARQL + REST API, EUR-Lex-Daten |
| **EUR-Lex** | https://eur-lex.europa.eu/ | Offizielle EU-Rechtsquelle | Kostenlos | SPARQL API + REST (Cellar), alle EU-Rechtsakte |
| **rechtsinformationen.bund.de** | https://rechtsinformationen.bund.de/ | Offizielles DE Bundesrechtsinformationsportal (NeuRIS) | Kostenlos | API vorhanden, MCP existiert bereits |
| **gesetze-im-internet.de** | https://www.gesetze-im-internet.de/ | Alle Bundesgesetze und -verordnungen | Kostenlos | XML-Download, mehrere Scraper/Archive verfuegbar |

### 4.2 Crawl-Strategien

| Strategie | Tool/Quelle | Beschreibung | Integration |
|-----------|-------------|-------------|-------------|
| **Firecrawl MCP** | https://github.com/firecrawl/firecrawl-mcp-server (5786 Stars) | Offizieller Firecrawl MCP-Server fuer Web-Scraping | Bereits als MCP verfuegbar, kann rechtliche Seiten crawlen |
| **Crawl4AI MCP** | https://github.com/sadiuysal/crawl4ai-mcp-server (62 Stars) | Selbst-gehostete Firecrawl-Alternative, kostenlos | Open Source, kein API-Key noetig |
| **bundesrecht-scraper** | https://github.com/daniel-j-h/bundesrecht-scraper | GitHub Action fuer Bundesrecht-Aenderungen | CI/CD-basiert, automatische Updates |
| **RSS-Feeds Gerichte** | Diverse (BVerfG, BGH, BFH haben RSS) | Bundesgerichte bieten teilweise RSS fuer neue Entscheidungen | RSS-Parser in n8n oder direkt im Plugin |
| **Bundesanzeiger RSS** | https://www.bundesanzeiger.de/ | Amtliche Veroeffentlichungen | RSS-Feed verfuegbar |
| **BMF-Schreiben** | https://www.bundesfinanzministerium.de/ | BMF-Schreiben, Erlasse, Richtlinien | RSS-Feed + Crawling moeglich |

### 4.3 EU-spezifische Datenquellen

| Name | URL | Beschreibung | Integration |
|------|-----|-------------|-------------|
| **EUR-Lex SPARQL** | https://eur-lex.europa.eu/content/tools/webservices.html | SPARQL-Endpoint fuer EU-Recht | Direkte Abfrage von EU-Verordnungen, Richtlinien |
| **Cellar API** | https://op.europa.eu/en/web/cellar | EU Publications Office Content Repository | REST API fuer alle EU-Publikationen |
| **EURLexDemoApi** | https://github.com/PieterjanMontens/EURLexDemoApi | Demo-API fuer EUR-Lex | Python-basierte Referenzimplementation |
| **CURIA** | https://curia.europa.eu/ | EuGH-Rechtsprechung | Structured Data via API |

---

## 5. Wrapping-Moeglichkeiten

### 5.1 n8n Workflows

| Ansatz | Beschreibung | Integration |
|--------|-------------|-------------|
| **n8n Legal Aggregator** | n8n Workflow der RSS-Feeds von Gerichten, BMF, Bundesanzeiger aggregiert | Via n8n-mcp-remote MCP bereits im Stack, Workflow erstellen und als Tool exponieren |
| **n8n EUR-Lex Watcher** | Workflow der EU-Rechtsaenderungen monitort | Webhook + Scheduled Trigger, Ergebnisse in Knowledge Base speichern |
| **n8n Gesetzes-Diff** | Workflow der taegliche Aenderungen an gesetze-im-internet.de trackt | Git-Diff der Archive-Repos, Benachrichtigung bei Aenderungen |

### 5.2 Bestehende Bots & Newsletter

| Name | Beschreibung | Integration |
|------|-------------|-------------|
| **Buzer.de** | Aenderungshistorie deutscher Gesetze, kostenlos browsebar | Crawling moeglich, kein API |
| **dejure.org** | Vernetzte Rechtsinformationen mit Querverweisen | Crawling moeglich, strukturierte URLs |
| **LTO.de Newsletter** | Legal Tribune Online Updates | RSS-Feed verfuegbar |
| **NWB Steuer-Newsletter** | Steuerrecht-Updates | Nur kostenpflichtig |
| **Haufe Steuer-News** | https://www.haufe.de/steuern/ | Steuer-Nachrichten | RSS-Feed verfuegbar |

---

## 6. Empfohlene Integrations-Strategie

### Prioritaet 1: Direkt nutzbare MCPs (sofort einsetzbar)

1. **rechtsinformationen-bund-de-mcp** -- Offizielle DE-Bundesgesetze
2. **ayunis-legal-mcp** -- Deutsche Gesetzbuecher
3. **gesetzessuche** -- Bundesgesetze durchsuchen
4. **German-law-mcp** -- gesetze-im-internet.de Zugang
5. **facturx-mcp** -- E-Rechnungs-Compliance
6. **norman-mcp-server** -- EU-Steuer/Buchhaltung

### Prioritaet 2: Datenquellen anbinden (eigener MCP noetig)

1. **OpenLegalData API** (de.openlegaldata.io) -- Rechtsprechung
2. **EUR-Lex SPARQL** -- EU-Recht
3. **VIES API** -- USt-IdNr. Validierung
4. **gesetze-im-internet.de Archive** -- Offline-Gesetzes-Index
5. **CourtListener API** -- US-Rechtsprechung (fuer internationales Modul)

### Prioritaet 3: Crawl-basierte Quellen (Firecrawl/n8n)

1. **BMF-Schreiben** via Firecrawl MCP
2. **BFH/BVerfG RSS** via n8n Workflow
3. **Bundesanzeiger** via Crawl4AI MCP
4. **dejure.org / buzer.de** als Querverweisquellen

### Prioritaet 4: Kommerzielle APIs (bei Budget)

1. **Avalara AvaTax** -- Sales Tax (Free Sandbox)
2. **VAT Comply** -- EU-VAT (Free)
3. **TaxJar** -- E-Commerce Tax (Free Sandbox)

---

## 7. Architektur-Empfehlung

```
Claude Code Skill (rechts-steuer-plugin)
  |
  +-- MCP Layer (bestehende Server nutzen)
  |     +-- rechtsinformationen-bund-de-mcp  (DE Bundesrecht)
  |     +-- ayunis-legal-mcp                 (DE Gesetzbuecher)
  |     +-- facturx-mcp                      (E-Rechnung)
  |     +-- norman-mcp-server                (EU Steuer)
  |     +-- firecrawl-mcp-server             (Crawling)
  |
  +-- Eigener MCP Server
  |     +-- OpenLegalData API Wrapper
  |     +-- EUR-Lex SPARQL Wrapper
  |     +-- VIES USt-IdNr. Checker
  |     +-- BMF-Schreiben Index
  |
  +-- n8n Workflows (via n8n-mcp-remote)
  |     +-- RSS Aggregator (Gerichte, BMF, Bundesanzeiger)
  |     +-- Gesetzes-Diff Tracker
  |     +-- EU-Recht Monitor
  |
  +-- Offline Knowledge Base
        +-- gesetze Archive (Git-basiert)
        +-- Steuer-Tabellen (jaehrlich aktualisiert)
        +-- DSGVO Checklisten
```

---

## 8. Fazit

- **Es existieren bereits 4+ MCP-Server speziell fuer deutsches Recht** -- diese koennen sofort genutzt werden
- **Kein fertiger MCP fuer deutsches Steuerrecht** -- hier besteht eine Luecke die das Plugin fuellen kann
- **norman-mcp-server** ist der naechste Treffer fuer EU-Steuer, aber nicht DE-spezifisch
- **Die groesste Chance** liegt in einem kombinierten DE-Recht+Steuer MCP der bestehende Datenquellen (rechtsinformationen.bund.de, gesetze-im-internet.de, OpenLegalData, BMF) vereint
- **Firecrawl + n8n** sind bereits im Stack und koennen fuer dynamische Quellen genutzt werden
- **Kommerzielle APIs** (Juris, Beck) haben keine Developer-Programme -- Open Data ist der gangbare Weg
