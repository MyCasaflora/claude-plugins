# Kritische Analyse: Rechts- und Steuerquellen fuer MCP-Plugin
**Datum:** 2026-03-17
**Methode:** Drei-Perspektiven-Analyse (Devil's Advocate, Blind Spot, Gray Area)
**Grundlage:** Vier Research-Reports (Gemini + Perplexity, DACH/EU + USA/UAE)

---

## 1. Devil's Advocate -- Was NICHT funktionieren wird

### 1.1 APIs die in Wahrheit nicht frei zugaenglich sind

| Quelle | Behauptung im Report | Realitaet |
|--------|---------------------|-----------|
| **Bundesanzeiger REST API (beta)** | Perplexity listet eine "REST API (beta)" | Diese API existiert nicht oeffentlich. Der Bundesanzeiger hat keine dokumentierte oeffentliche API. Perplexity hat hier falsche Informationen geliefert. |
| **Transparenzregister REST API** | Perplexity behauptet "REST API, JSON, Free, High Suitability" | Falsch. Das Transparenzregister erfordert eine Registrierung als Verpflichteter nach GwG. Freier Zugang existiert nicht. Gebuehren fallen an. |
| **IRS APIs** | Beide Reports erwaehnen IRS-APIs | Korrekt als eingeschraenkt markiert, aber die Realitaet ist haerter: Kein einziger Endpunkt liefert allgemeine Steuerdaten. Nur B2B fuer zertifizierte Partner. Fuer ein Plugin voellig unbrauchbar. |
| **WKO REST API** | Perplexity listet "REST API, rate limited" | Die WKO hat keine oeffentlich dokumentierte REST-API. Es gibt OGD-Ansaetze, aber keine stabile API fuer Dritte. |
| **OECD Tax Database** | Perplexity: "No API" vs. Gemini: "SDMX REST API" | Gemini hat recht -- es gibt eine API. Aber: 60 Queries/Stunde Limit, komplexes SDMX-Schema, und die Daten sind makrooekonomisch, nicht operativ nutzbar fuer Steuerberatung. |
| **EmaraTax (UAE)** | Gemini bewertet als "Gering" fuer MCP | Korrekt. Die API ist ausschliesslich fuer autorisierte ERP-Systeme. Kein offener Zugang. |

### 1.2 Quellen die veraltet, unzuverlaessig oder gefaehrdet sind

- **OpenJur.de**: Wird von einer Einzelperson betrieben. Keine institutionelle Absicherung. Kann jederzeit offline gehen oder die API aendern. Kein SLA, keine Versionierung.
- **dejure.org**: Werbefinanziert, privat betrieben. Die "API" ist eigentlich nur eine Verlinkungsfunktion -- sie liefert keine Volltexte, sondern nur URLs. Fuer ein Plugin mit Substanz unbrauchbar.
- **tech4germany/rechtsinfo_api (GitHub)**: Community-Projekt, letzter Commit unklar. Keine Garantie fuer Wartung oder Aktualitaet.
- **Perplexity-Report erwaehnt "bundesfinanznachrichten.de"**: Diese Domain ist kein offizielles BMF-Portal. Fragwuerdige Quellenangabe.
- **Perplexity-Report erwaehnt "finanzgerichtshof.de"**: Diese Seite existiert nicht als zentrale Plattform. Finanzgerichte sind Laendersache mit jeweils eigenen Webauftritten.

### 1.3 Rechtliche Risiken beim Crawlen

- **Handelsregister.de**: Nutzungsbedingungen verbieten explizit automatisierte Abrufe. CAPTCHAs blockieren Scraping. Wer es trotzdem tut, riskiert Abmahnung und Sperrung.
- **Bundesanzeiger**: Gleiche Problematik. Massenzugriffe werden technisch und rechtlich unterbunden.
- **beck-online / juris**: Scraping waere ein klarer Verstoss gegen Urheberrecht und Nutzungsbedingungen. Strafbar nach UrhG.
- **PACER (USA)**: Jeder Abruf kostet Geld. Unkontrollierte LLM-Abfragen koennten massive Kosten verursachen. Das Free Law Project arbeitet seit Jahren an Alternativen -- Fortschritt ist langsam.
- **DIFC/ADGM (UAE)**: Kein oeffentliches Scraping erlaubt. Daten nur ueber Web-Interface zugaenglich.

### 1.4 Formate die kaum maschinenlesbar sind

- **BMF-Schreiben (Deutschland)**: Fast ausschliesslich PDF. Kein strukturiertes Format. OCR-Parsing notwendig, fehleranfaellig.
- **BFH-Urteile (offiziell)**: PDF/HTML ohne konsistente Struktur. OpenJur hilft, ist aber nicht die primaere Quelle.
- **UN Tax Committee**: Nur PDF-Berichte. Keine API, keine strukturierten Daten geplant.
- **DBA-Texte (Doppelbesteuerungsabkommen)**: Verstreut ueber Ministeriums-Seiten als PDF. Keine zentrale maschinenlesbare Datenbank.
- **Landesrecht Deutschland**: 16 verschiedene Systeme, ueberwiegend HTML/PDF. Ein Albtraum fuer Automatisierung.
- **UAE Federal Tax Authority**: PDF-Guides, HTML-Seiten. Keine strukturierte Rechtstext-API.

### 1.5 Realistische Einschaetzung: Was ein Plugin WIRKLICH nutzen kann

**Tier 1 -- Sofort nutzbar, stabil, strukturiert:**
- EUR-Lex / Cellar (SPARQL + REST, JSON/XML, kostenlos)
- Fedlex Schweiz (SPARQL + REST, exzellent dokumentiert)
- RIS Oesterreich (OGD, XML/JSON, CC BY 4.0)
- GovInfo USA (REST + nativer MCP-Server!)
- eCFR USA (REST, JSON/XML, kostenlos)
- Congress.gov API (REST, JSON)
- Federal Register API (REST, JSON, kein API-Key noetig)
- SEC EDGAR (REST, JSON/XBRL)

**Tier 2 -- Nutzbar mit Einschraenkungen:**
- gesetze-im-internet.de (XML-Bulk-Download, kein REST)
- OECD SDMX API (komplex, Rate-Limited)
- OpenCorporates (Freemium, Volumen-Limits)
- Dubai Pulse (OAuth erforderlich, JSON)

**Tier 3 -- Nur ueber Drittanbieter oder mit erheblichem Aufwand:**
- Handelsregister (nur via handelsregister.ai etc., kostenpflichtig)
- Bundesanzeiger (nur via Drittanbieter)
- IRS-Daten (nur fuer zertifizierte Partner)
- IBFD (hochpreisig)
- PACER (kostenpflichtig, kein API)

**Unbrauchbar fuer ein offenes Plugin:**
- beck-online, juris (Paywall + Lizenz)
- IBFD (Paywall)
- Transparenzregister (eingeschraenkter Zugang)
- UAE FTA/EmaraTax (nur autorisierte ERP-Systeme)

---

## 2. Blind Spot Analyst -- Was wurde UEBERSEHEN

### 2.1 Wichtige Quellen die komplett fehlen

#### Deutschland
- **OpenLegalData.io**: Open-Source-Plattform fuer deutsche Gerichtsentscheidungen. Bietet eine REST-API (JSON) mit tausenden Urteilen. In KEINEM der vier Reports erwaehnt.
- **Offene Gesetze (offenegesetze.de)**: Digitalisiert das Bundesgesetzblatt und macht es durchsuchbar. Community-Projekt von der Open Knowledge Foundation.
- **rechtsprechung-im-internet.de**: Offizielle Plattform des Bundes fuer Gerichtsentscheidungen der obersten Bundesgerichte. Hat XML-Feeds. Fehlt komplett.
- **bund.dev**: Community-API-Verzeichnis fuer deutsche Behoerden-Schnittstellen. Listet dutzende nutzbare APIs auf. Nur am Rande erwaehnt.
- **GovData.de**: Das zentrale Open-Data-Portal des Bundes. Bietet CKAN-API, DCAT-AP-kompatibel. Nicht erwaehnt.
- **Normenkontrollrat / Nationale Normenkontrollrat-Daten**: Regulatorische Daten zur Gesetzesfolgenabschaetzung.

#### EU
- **N-Lex**: Das Portal fuer nationales Recht der EU-Mitgliedstaaten. Verlinkt auf nationale Rechtsportale. Fehlt komplett.
- **HUDOC (EGMR)**: Die Datenbank des Europaeischen Gerichtshofs fuer Menschenrechte. Bietet strukturierte Suche und ist frei zugaenglich. Nicht erwaehnt.
- **ELI (European Legislation Identifier)**: Standard zur eindeutigen Identifikation von Rechtsvorschriften. Wird von EUR-Lex genutzt, aber als Konzept nicht erklaert.
- **e-Justice Portal der EU**: Zentrales Portal fuer grenzueberschreitende Justiz-Informationen.

#### USA
- **CourtListener (Free Law Project)**: Die wichtigste freie Alternative zu PACER. REST-API, JSON, Millionen von Urteilen. BULK-Downloads verfuegbar. In den Reports nur am Rande als "Free Law Project" erwaehnt, aber die API selbst nicht analysiert.
- **Regulations.gov API**: Oeffentliche Kommentare zu Regulierungsvorschlaegen. REST-API, JSON. Fehlt komplett.
- **Case.law (Harvard Caselaw Access Project)**: Digitalisierung aller US-Gerichtsentscheidungen. API verfuegbar. Nicht erwaehnt.
- **state.gov Treaties Database**: Fuer internationale Vertraege der USA.

#### UAE
- **UAE Legislation Portal (legislation.ae)**: Offizielle Gesetzessammlung der UAE auf Arabisch und Englisch. Nicht analysiert.
- **MOHRE (Ministry of Human Resources)**: Arbeitsrecht-Datenbank der UAE.

### 2.2 Open-Data-Initiativen die uebersehen wurden

- **EU Open Data Portal (data.europa.eu)**: Erwaehnt, aber die SPARQL-Endpunkte fuer Rechtsdaten nicht separat analysiert.
- **Wikidata**: Enthaelt strukturierte Daten zu Gesetzen, Gerichten und Jurisdiktionen. SPARQL-Endpoint frei verfuegbar. Als Metadaten-Quelle fuer ein Plugin extrem nuetzlich.
- **DBpedia**: Strukturierte Wikipedia-Daten mit Rechts-Ontologien.
- **LiDA (Linked Data Austria)**: Oesterreichische Linked-Data-Initiative.

### 2.3 Community-Projekte und Open-Source-Datenbanken

- **OpenLegalData.io** (siehe oben): Python-basiert, Django-Backend, REST-API.
- **QuantLaw (GitHub)**: Netzwerkanalyse deutscher Gesetze. Strukturierte Daten verfuegbar.
- **lexparency.org**: EU-Recht aufbereitet und verlinkt, Open Source.
- **Gesetze-Tools auf GitHub**: Diverse Repositories die gesetze-im-internet.de parsen und als JSON bereitstellen (z.B. `bundestag/gesetze`, `Wikipedia:Gesetzeslinks`).
- **Awesome Legal Data (GitHub)**: Kuratierte Liste von Rechts-Datenquellen.

### 2.4 Alternative Zugangswege

- **GitHub-Mirrors**: Es gibt aktiv gepflegte Git-Repositories die deutsche Gesetze versioniert ablegen. Aenderungen sind als Git-Diffs nachvollziehbar.
- **Academic APIs**: CrossRef, Semantic Scholar -- fuer juristische Fachliteratur und Kommentare.
- **Akoma Ntoso**: Internationaler XML-Standard fuer Rechtsdokumente. Wird von mehreren Jurisdiktionen unterstuetzt. In den Reports nicht als Integrationsstandard diskutiert.

### 2.5 Steuerberater- und Buchhaltungs-Software-APIs

Komplett uebersehen in allen vier Reports:

| Software/API | Relevanz | API verfuegbar |
|-------------|----------|----------------|
| **DATEV API (Steuerberater-Standard DE)** | Zentral fuer DE-Steuerbranche | Ja, aber nur fuer Partner (DATEV-Marktplatz) |
| **Lexware / lexoffice API** | KMU-Buchhaltung DE | Ja, REST-API dokumentiert |
| **ELSTER-API (ERiC)** | Elektronische Steuererklaerung DE | Ja, aber nur B2B, komplex |
| **Xero API** | Cloud-Buchhaltung international | Ja, REST-API, gut dokumentiert |
| **QuickBooks API (Intuit)** | US-Marktfuehrer Buchhaltung | Ja, REST-API |
| **Sage API** | Buchhaltung UK/international | Ja |
| **FreeAgent API** | UK-Buchhaltung | Ja |
| **Zoho Books API** | International/UAE beliebt | Ja, REST |
| **Tally API (UAE/Indien)** | Weit verbreitet in UAE | Begrenzt |
| **Wafeq (UAE)** | UAE-spezifische Buchhaltung | Ja, API verfuegbar |

Diese APIs waeren fuer ein Steuer-Plugin extrem relevant, weil sie die Bruecke zwischen Rechtsinformation und praktischer Anwendung schlagen.

---

## 3. Gray Area Analyst -- Wo lauern versteckte Probleme

### 3.1 Technisch erreichbar, aber rechtlich unklar

- **gesetze-im-internet.de XML-Download**: Die Daten sind frei verfuegbar, aber die Nutzungsbedingungen des BMJ sind unklar bezueglich kommerzieller Weiterverwendung in einem Plugin. Es gibt keine explizite Open-Data-Lizenz (kein CC BY, keine Datenlizenz Deutschland).
- **OpenJur API**: Die Nutzungsbedingungen sind schwammig. Kommerzielle Nutzung in einem Plugin ist nicht explizit erlaubt.
- **dejure.org Verlinkungsfunktion**: Darf in einem kommerziellen Plugin genutzt werden? Die Nutzungsbedingungen schweigen dazu.
- **CURIA-Scraping**: Technisch machbar, aber keine offizielle API. Die EU duldet vermutlich moderate Nutzung, aber es gibt keine Garantie.
- **Cornell LII**: Bulk-Downloads "auf Anfrage". Was passiert wenn die Anfrage abgelehnt wird? Kein garantierter Zugang.

### 3.2 Heute kostenlos, morgen kostenpflichtig

- **OpenCorporates**: Hat bereits Freemium-Tier. Die kostenlose Nutzung wird staendig eingeschraenkt. Plan-Preise steigen. Langfristig kein zuverlaessiger kostenloser Zugang.
- **handelsregister.ai**: Startup. Kann Preise jederzeit aendern, Geschaeftsmodell pivoten oder eingestellt werden.
- **Dubai Pulse**: Aktuell Open Data, aber die UAE-Regierung kann Zugangsregeln jederzeit aendern. Keine gesetzliche Open-Data-Garantie wie in der EU.
- **SEC EDGAR**: Aktuell kostenlos, aber die SEC hat Rate-Limiting eingefuehrt und koennte den Zugang weiter einschraenken.
- **GovInfo MCP-Server**: "Public Preview" -- das heisst, es ist noch nicht stabil. Kann geaendert oder zurueckgezogen werden.
- **OECD API**: Kostenlos, aber Terms of Service erlauben Einschraenkungen jederzeit.

### 3.3 Datenqualitaets-Probleme

- **Zeitverzoegerung bei RIS Oesterreich**: Bis zu 24 Stunden Lag. In der Zwischenzeit koennte ein Gesetz bereits geaendert sein, aber das Plugin zeigt die alte Version.
- **gesetze-im-internet.de**: Enthaelt die "aktuelle konsolidierte Fassung", aber NICHT die historischen Versionen. Fuer Steuerrecht ist aber oft die Fassung zu einem bestimmten Stichtag relevant.
- **EUR-Lex Konsolidierung**: Konsolidierte Fassungen haben keinen offiziellen Rechtscharakter. Nur das Amtsblatt ist verbindlich. Ein Plugin das konsolidierte Texte liefert, liefert technisch keine rechtsverbindliche Information.
- **Bundesanzeiger-Daten via Drittanbieter**: Parser-Fehler bei unstrukturierten PDFs sind unvermeidlich. Falsche Bilanzzahlen koennen resultieren.
- **Uebersetzungsprobleme**: EU-Recht existiert in 24 Sprachfassungen. Nur die Amtssprachen-Fassung ist verbindlich. Maschinelle Uebersetzungen koennen rechtlich falsche Ergebnisse liefern.
- **UAE Dual-Language-Problem**: Arabisch ist die verbindliche Rechtssprache. Englische Uebersetzungen (die ein Plugin nutzen wuerde) sind nicht rechtsverbindlich.

### 3.4 Jurisdiktions-Konflikte

- **DBA-Texte**: Ein DBA zwischen Deutschland und den USA kann auf bundestag.de, irs.gov, und im Bundesgesetzblatt stehen -- in unterschiedlichen Uebersetzungen und Formatierungen. Welche Version zeigt das Plugin?
- **EU-Recht vs. nationales Umsetzungsrecht**: Eine EU-Richtlinie ist nicht direkt anwendbar. Das Plugin muesste zwischen Richtlinie und nationalem Gesetz unterscheiden koennen. Das ist extrem komplex.
- **UAE Onshore vs. Free Zone**: Unterschiedliche Rechtsregime innerhalb der UAE. DIFC hat Common Law, Onshore hat Civil Law. Ein Plugin muss wissen, welches Regime gilt.
- **US Federal vs. State Tax**: 50 verschiedene Steuersysteme. Kein einheitlicher Zugang. Ein Plugin das "US-Steuerrecht" verspricht, liefert bestenfalls das Bundesrecht.

### 3.5 Haftungsrisiken

**Das groesste versteckte Problem aller vier Reports: Keiner diskutiert die Haftung.**

- **Falsche Rechtsinformation = potenzielle Schadensersatzpflicht**: Wenn ein Plugin veraltetes Steuerrecht anzeigt und ein Nutzer daraufhin eine falsche Steuererklaerung abgibt, wer haftet? Der Plugin-Entwickler? Der Datenlieferant? Niemand?
- **Rechtsberatungs-Monopol**: In Deutschland ist Rechtsberatung Anwaelten vorbehalten (RDG). Ein Plugin das Rechtsauskuenfte gibt, koennte gegen das Rechtsdienstleistungsgesetz verstossen. Auch Steuerberatung ist reglementiert (StBerG).
- **Disclaimer reicht nicht**: Ein "Dies ist keine Rechtsberatung"-Disclaimer schuetzt nicht vollstaendig vor Haftung, besonders wenn das Plugin den Eindruck erweckt, verbindliche Auskuenfte zu erteilen.
- **UAE: Unlicensed Legal Practice**: In den UAE ist nicht-lizenzierte Rechtsberatung strafbar. Ein Plugin das UAE-Recht interpretiert, koennte unter dieses Verbot fallen.
- **USA: Unauthorized Practice of Law (UPL)**: Jeder US-Bundesstaat hat eigene UPL-Regeln. Legal-Tech-Produkte bewegen sich in einer Grauzone.
- **Versicherungsproblematik**: Keine Berufshaftpflicht deckt Schaeden durch KI-generierte Rechtsauskuenfte ab.

### 3.6 Zusammenfassende Risikomatrix

| Risiko | Wahrscheinlichkeit | Impact | Mitigation |
|--------|-------------------|--------|------------|
| API wird kostenpflichtig | Hoch | Mittel | Multi-Source-Strategie, Caching |
| Veraltete Daten angezeigt | Hoch | Hoch | Timestamp-Anzeige, Freshness-Check |
| Verstoss gegen RDG/StBerG | Mittel | Sehr Hoch | Klarer Disclaimer, keine Interpretation |
| Scraping-Quelle geht offline | Hoch | Mittel | Fallback-Quellen, lokale Kopien |
| Falsche Daten durch Parser-Fehler | Mittel | Hoch | Validierung, Quellenangabe |
| Jurisdiktions-Verwechslung | Mittel | Hoch | Klare Kennzeichnung, Nutzer-Kontext |
| Lizenzrechtsverstoss bei Datennutzung | Niedrig-Mittel | Hoch | Nur explizit lizenzierte Quellen nutzen |

---

## Fazit

Die vier Research-Reports liefern eine solide Uebersicht, leiden aber an drei systematischen Schwaechen:

1. **Unkritische Uebernahme**: Besonders der Perplexity-Report fuer DACH/EU enthaelt nachweislich falsche Angaben (Bundesanzeiger-API, Transparenzregister-API, nicht-existierende URLs). Jede einzelne Quelle muss manuell verifiziert werden, bevor sie in ein Plugin integriert wird.

2. **Fehlende Praxis-Perspektive**: Keiner der Reports diskutiert die regulatorischen Risiken (RDG, StBerG, UPL). Fuer ein Produkt das Rechts- und Steuerinformationen liefert, ist das die existenzielle Frage.

3. **Uebersehene Quellen**: Wichtige Open-Source-Projekte (OpenLegalData, CourtListener, rechtsprechung-im-internet.de) und Software-APIs (DATEV, Lexware, Xero) fehlen komplett. Diese waeren fuer ein praktisch nutzbares Plugin entscheidend.

**Empfehlung**: Nicht mehr Quellen sammeln, sondern wenige, stabile, gut lizenzierte Quellen tief integrieren. Lieber EUR-Lex + Fedlex + GovInfo perfekt anbinden als 30 fragile Scraper zu bauen.
