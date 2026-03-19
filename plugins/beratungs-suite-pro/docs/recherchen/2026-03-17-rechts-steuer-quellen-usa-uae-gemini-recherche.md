# Gemini Deep Research Report
Generated: 2026-03-17 08:20
Agent: deep-research-pro-preview-12-2025

---

# Professioneller Analysebericht: Maschinenlesbare Rechts- und Steuerinformationsquellen (USA & VAE)

Dieser Bericht bietet eine erschöpfende, strukturierte Analyse der öffentlich zugänglichen APIs, Datenbanken und Rechtsportale für Rechts- und Steuerinformationen in den Vereinigten Staaten von Amerika (USA) und den Vereinigten Arabischen Emiraten (VAE). Er ist primär für akademische Forscher, Legal-Tech-Entwickler und Datenarchitekten konzipiert. 

*Die Forschungsergebnisse deuten darauf hin*, dass sich die USA und die VAE in unterschiedlichen, aber hochgradig fortgeschrittenen Stadien der digitalen Transformation befinden. Während die USA stark auf ausgereifte, offene REST-APIs und umfangreiche XML-Bulk-Daten für die historische und legislative Transparenz setzen, *scheint es wahrscheinlich*, dass die VAE einen Sprung direkt in die KI-gestützte, proaktive "Agentic Governance" (z.B. TAMM AutoGov) vollziehen. Eine Besonderheit dieses Berichts ist die Bewertung jeder Quelle hinsichtlich ihrer Eignung für das **Model Context Protocol (MCP)**, einem aufstrebenden Standard, der es Large Language Models (LLMs) ermöglicht, sicher und standardisiert auf externe Datenquellen zuzugreifen [cite: 1, 2].

---

## 1. Executive Summary

Die Digitalisierung von Rechts-, Steuer- und Unternehmensdaten ist ein zentraler Treiber für Transparenz, Compliance und die Entwicklung von Legal-Tech-Anwendungen. Diese Untersuchung evaluiert die wichtigsten staatlichen und semi-staatlichen Datenquellen in den USA und den VAE. 

In den **USA** zeigt sich eine starke Tradition der Open-Data-Initiativen. Bundesbehörden bieten zunehmend maschinenlesbare Formate (XML, JSON) über zentrale API-Gateways wie `api.data.gov` an [cite: 3]. Ein historischer Meilenstein ist die jüngste Veröffentlichung eines nativen **MCP-Servers durch GovInfo**, der LLMs direkten, verifizierten Zugriff auf US-Regierungsdokumente gewährt [cite: 2, 4]. Dennoch bestehen Hürden: Das PACER-System für Gerichtsdaten operiert weiterhin hinter einer Paywall [cite: 5, 6], und der Internal Revenue Service (IRS) bietet keine öffentlichen APIs für allgemeine Steuerdaten, sondern beschränkt den API-Zugang auf autorisierte B2B-Steuerdienstleister [cite: 7, 8].

In den **VAE (insbesondere Dubai und Abu Dhabi)** liegt der Fokus auf nahtloser Integration und Automatisierung. Plattformen wie *EmaraTax* (für VAT/Mehrwertsteuer) und *Dubai Pulse* zentralisieren enorme Datenmengen und bieten APIs für die direkte ERP-Integration [cite: 9, 10]. Die Region investiert massiv in KI, was sich in Projekten wie dem TAMM AI Assistant (Abu Dhabi) zeigt, der auf Azure OpenAI basiert und Bürgerdienste proaktiv automatisiert [cite: 11, 12]. 

**Für die Integration in MCP-Server gilt:** RESTful APIs mit JSON-Ausgabe (wie SEC EDGAR, Congress.gov, USAspending) lassen sich mit minimalem Aufwand als MCP-Tools definieren. Portale, die auf PDF- oder HTML-Scraping angewiesen sind (wie PACER) oder strenge Authentifizierungshürden haben (wie IRS), weisen eine geringe MCP-Eignung auf.

---

## 2. Hauptbefunde

*   **Pionierarbeit bei LLM-Integration (USA):** Das US Government Publishing Office (GPO) hat als eine der ersten Regierungsbehörden weltweit einen nativen MCP-Server für `GovInfo` im "Public Preview" veröffentlicht [cite: 1, 4]. Dies ermöglicht KI-Agenten die direkte "Unterhaltung" mit verifizierten legislativen und exekutiven Dokumenten.
*   **Fehlende öffentliche Steuer-APIs (USA):** Entgegen der Erwartung vieler Entwickler bietet der IRS *keine* offene API für den programmatischen Zugriff auf historische Steuerdaten oder Transkripte an. Der Zugang ist auf registrierte Steuerexperten (via A2A/IVES/IRIS) und Software-Anbieter (z.B. TaxBandits, FileYourTaxes) beschränkt [cite: 7, 8, 13, 14].
*   **Die Paywall-Kontroverse (USA):** Das US-Gerichtsdatenbanksystem PACER verlangt weiterhin Gebühren ($0.10 pro Seite), was die freie Maschinenlesbarkeit und MCP-Integration drastisch einschränkt. Initiativen wie das *Free Law Project* fordern ein kostenloses PACER-System [cite: 6, 15, 16].
*   **KI-gestützte Regierungsdienste (VAE):** Abu Dhabi hat mit *TAMM 4.0* und dem *AutoGov*-System einen Paradigmenwechsel eingeleitet. Durch die Nutzung von Microsoft Azure OpenAI und dem arabischen LLM "JAIS" werden Behördengänge nicht nur digitalisiert, sondern proaktiv automatisiert [cite: 11, 12, 17].
*   **Standardisierung von Finanz- und Steuerdaten (VAE):** Die Federal Tax Authority (FTA) hat mit *EmaraTax* ein System geschaffen, das strenge API-Integrationen für ERP-Systeme (SAP, Oracle) vorschreibt, um die bis 2026/2027 geplante e-Invoicing-Pflicht (B2B) durchzusetzen [cite: 9, 18, 19, 20].
*   **Zentrale Datenhubs (VAE):** Anstatt fragmentierter Behörden-APIs bündeln *Dubai Pulse* und der *UAE API Marketplace* Datenbestände (inklusive Gerichtsentscheidungen und Wirtschaftslizenzen) unter standardisierten OAuth-Authentifizierungsverfahren [cite: 10, 21, 22].

---

## 3. Detailanalyse

In diesem Abschnitt werden alle vom Nutzer angefragten Quellen systematisch analysiert. Die Bewertung der **Crawl-Eignung für MCP-Server** basiert auf den technischen Spezifikationen des Model Context Protocols: Ideal sind gut dokumentierte REST-APIs mit JSON-Responses, da diese direkt als "Tools" in der `mcp.json` konfiguriert werden können [cite: 1].

### 3.1 Vereinigte Staaten von Amerika (USA)

#### 3.1.1 Internal Revenue Service (IRS) APIs und Datenbanken
*   **URL:** `https://www.irs.gov/tax-professionals/get-an-api-client-id` [cite: 7]
*   **Format:** XML/JSON (für A2A-Transaktionen)
*   **API verfügbar:** Ja (aber **nicht öffentlich**, nur B2B)
*   **Update-Rhythmus:** Echtzeit/Täglich (transaktionsbasiert)
*   **Kosten:** Grundsätzlich kostenlos, erfordert aber strikte Zertifizierung.
*   **Crawl-Eignung für MCP-Server:** **Sehr Gering**.
*   **Analyse:** Der IRS bietet keine öffentliche API an, über die Entwickler frei Steuerdaten oder Transkripte abrufen können [cite: 8]. Die vorhandenen Application-to-Application (A2A) APIs sind streng limitiert auf zertifizierte Steuerexperten (Enrolled Agents, CPEOs) für Produkte wie e-Services (TIN-Matching), IVES (Income Verification) und IRIS (E-Filing von Informationsrenditen) [cite: 7]. Ein MCP-Server könnte diese API nur nutzen, wenn der Betreiber ein offiziell zertifizierter IRS-Partner mit einer gültigen Client-ID ist. Alternativ greifen viele Fintechs auf Browser-Automatisierung (z.B. Anchor Browser) oder Drittanbieter-APIs wie TaxBandits oder FileYourTaxes zurück, um IRS-Konformität zu gewährleisten [cite: 8, 13, 14].

#### 3.1.2 US Tax Code (IRC) & US Code via uscode.house.gov
*   **URL:** `https://uscode.house.gov` / `http://xml.house.gov` [cite: 23, 24]
*   **Format:** XML (USLM Schema), HTML, XHTML
*   **API verfügbar:** Bulk-Download und strukturierte URLs (REST-ähnlich)
*   **Update-Rhythmus:** Regelmäßig nach Gesetzesänderungen (erkennbar an "Edition" Versionen)
*   **Kosten:** Kostenlos
*   **Crawl-Eignung für MCP-Server:** **Hoch**.
*   **Analyse:** Der Internal Revenue Code (Title 26 des U.S. Code) regelt das Bundessteuerrecht [cite: 25]. Das Repräsentantenhaus veröffentlicht den gesamten U.S. Code im maschinenlesbaren XML-Format (United States Legislative Markup - USLM Schema) [cite: 24]. Obwohl es keine klassische REST-API für punktuelle Abfragen gibt, sind die XML-Massen-Downloads via FDsys / GovInfo extrem gut strukturiert. Ein MCP-Server kann diese XML-Dateien lokal indizieren oder auf die strukturierten URLs zugreifen (z.B. `uscode.house.gov/view.xhtml?path=/prelim@title26/subtitleF`) [cite: 26].

#### 3.1.3 EDGAR / SEC Filings API
*   **URL:** `https://www.sec.gov/search-filings/edgar-application-programming-interfaces` [cite: 27] / `https://data.sec.gov`
*   **Format:** JSON, XML (XBRL)
*   **API verfügbar:** Ja (RESTful)
*   **Update-Rhythmus:** Echtzeit (während des Tages) & nächtliche Bulk-Updates [cite: 27]
*   **Kosten:** Kostenlos
*   **Crawl-Eignung für MCP-Server:** **Sehr Hoch**.
*   **Analyse:** Die SEC bietet eine exzellente öffentliche API unter `data.sec.gov`, die keine Authentifizierung oder API-Keys erfordert (obwohl User-Agent-Header deklariert werden müssen). Entwickler können die Einreichungshistorie nach CIK (Central Index Key) sowie XBRL-Daten (Finanzberichte wie 10-K, 10-Q) im JSON-Format abrufen [cite: 27]. Es gibt zudem inoffizielle Python-Wrapper (wie `sec-edgar-api` oder `sec-api.io`), die Paginierung und das Rate-Limiting (max. 10 Requests/Sekunde) automatisch handhaben [cite: 28, 29, 30]. Für einen MCP-Server, der Unternehmens- und Finanzdaten für LLMs bereitstellen soll, ist dies eine perfekte Quelle.

#### 3.1.4 PACER Gerichtsdatenbank
*   **URL:** `https://pacer.uscourts.gov` [cite: 5]
*   **Format:** HTML, PDF
*   **API verfügbar:** Nein (offiziell keine öffentliche REST API)
*   **Update-Rhythmus:** Echtzeit / Kontinuierlich
*   **Kosten:** Kostenpflichtig ($0.10 pro Seite, maximal $3.00 pro Dokument; erlassen bei unter $30/Quartal) [cite: 5, 6, 15]
*   **Crawl-Eignung für MCP-Server:** **Gering**.
*   **Analyse:** PACER (Public Access to Court Electronic Records) ist das zentrale System für US-Bundesgerichtsakten. Die fehlende moderne API und die Paywall machen die direkte MCP-Integration sehr schwierig [cite: 6]. Jede Suche und jeder Seitenabruf kostet Geld, was bei unkontrollierten LLM-Abfragen zu massiven Kosten führen könnte [cite: 15]. Organisationen wie das *Free Law Project* kritisieren dieses Modell scharf und setzen sich für den "Open Courts Act" ein, um PACER kostenlos zu machen [cite: 16]. Für eine MCP-Integration muss aktuell auf teure kommerzielle Drittanbieter-APIs wie *UniCourt* zurückgegriffen werden, die PACER-Daten normalisiert und KI-gestützt aufbereitet anbieten [cite: 31].

#### 3.1.5 Congress.gov API (inkl. ehemalig THOMAS)
*   **URL:** `https://api.congress.gov/` [cite: 32, 33]
*   **Format:** JSON, XML
*   **API verfügbar:** Ja (RESTful)
*   **Update-Rhythmus:** Täglich/Kontinuierlich
*   **Kosten:** Kostenlos (API Key via api.data.gov erforderlich) [cite: 32, 34]
*   **Crawl-Eignung für MCP-Server:** **Sehr Hoch**.
*   **Analyse:** THOMAS wurde vor Jahren durch Congress.gov ersetzt. Die aktuelle `api.congress.gov` (Version 3, OAS 3.0) ist hervorragend dokumentiert und bietet Endpunkte für Gesetzentwürfe (`/bill`), Amendments, Abstimmungen und Ausschussberichte [cite: 32, 34]. Ein MCP-Server kann Metadaten, Zusammenfassungen und Volltexte von Gesetzen abrufen. Die API nutzt Limit/Offset-Paginierung und erlaubt Filterungen nach Datum (`fromDateTime`, `toDateTime`) [cite: 33, 35].

#### 3.1.6 Federal Register API
*   **URL:** `https://www.federalregister.gov/api/v1/` [cite: 36, 37]
*   **Format:** JSON, CSV
*   **API verfügbar:** Ja (RESTful)
*   **Update-Rhythmus:** Täglich
*   **Kosten:** Kostenlos (Kein API Key erforderlich) [cite: 36, 37]
*   **Crawl-Eignung für MCP-Server:** **Sehr Hoch**.
*   **Analyse:** Das Federal Register veröffentlicht Verordnungen, vorgeschlagene Regeln und Bekanntmachungen der US-Regierung. Die API ist "HATEOAS"-konform und liefert bereinigte Daten basierend auf GPO MODS-Metadaten [cite: 37]. Da keine API-Schlüssel nötig sind und die Endpunkte (`/documents`, `/public-inspection-documents`) hervorragend strukturiert sind, ist die Integration in LLM-Workflows via MCP trivial [cite: 36, 38].

#### 3.1.7 Cornell LII (Legal Information Institute)
*   **URL:** `https://www.law.cornell.edu` [cite: 39]
*   **Format:** HTML, XML, RDF, JSON
*   **API verfügbar:** Bulk Data & Semantic Web (Linked Data)
*   **Update-Rhythmus:** Kontinuierlich
*   **Kosten:** Kostenlos
*   **Crawl-Eignung für MCP-Server:** **Hoch**.
*   **Analyse:** Das Cornell LII bereitet Rohdaten der Regierung (wie eCFR und U.S. Code) auf. Sie nutzen semantische Web-Technologien, um Rechtsquellen in RDF-Graphen abzubilden (z.B. `liitop:hasLevelNumber`) [cite: 39]. Für MCP-Server, die Graph-RAG (Retrieval-Augmented Generation) nutzen, sind diese RDF- und XML-Strukturen wertvoller als reine Text-APIs, da sie Querverweise ("What Cites Me") und Definitionen mathematisch präzise erfassen [cite: 39].

#### 3.1.8 GovInfo API
*   **URL:** `https://api.govinfo.gov` [cite: 40]
*   **Format:** JSON (für Metadaten), XML/PDF/HTM (für Content)
*   **API verfügbar:** Ja (RESTful) & **Nativer MCP-Server**
*   **Update-Rhythmus:** Laufend (alle drei Gewalten der US-Regierung)
*   **Kosten:** Kostenlos (API Key via api.data.gov erforderlich) [cite: 40, 41]
*   **Crawl-Eignung für MCP-Server:** **Perfekt (Nativer Support)**.
*   **Analyse:** GovInfo ist das Vorzeigeprojekt für LLM-Integration. Im Januar 2026 kündigte das GPO den *GovInfo Model Context Protocol (MCP) Server* an [cite: 2, 4]. Entwickler müssen lediglich ihre `mcp.json` mit der URL `https://api.govinfo.gov/mcp` und ihrem API-Key konfigurieren [cite: 1]. Die API bietet Zugriff auf Federal Register, Congressional Record, Bills und vieles mehr [cite: 40]. Das Tool `searchGovInfo` erlaubt es dem LLM, gezielt nach Publikationen zu suchen [cite: 1, 42].

#### 3.1.9 eCFR API (Electronic Code of Federal Regulations)
*   **URL:** `https://www.ecfr.gov/api/` [cite: 43]
*   **Format:** JSON, XML
*   **API verfügbar:** Ja (RESTful)
*   **Update-Rhythmus:** Täglich aktualisiert
*   **Kosten:** Kostenlos
*   **Crawl-Eignung für MCP-Server:** **Sehr Hoch**.
*   **Analyse:** Die eCFR-API bietet Endpunkte für Administratoren (`/admin`), Suchanfragen (`/search`) und versionierte Inhalte (`/versioner`) [cite: 43]. Sie erlaubt den Download ganzer Titel als XML oder strukturierter Hierarchien (Part, Subpart, Section). Open-Source-Projekte konvertieren diese XML-Daten oft in Markdown, da dies für LLMs leichter zu parsen ist [cite: 44, 45].

#### 3.1.10 USAspending API
*   **URL:** `https://api.usaspending.gov` [cite: 46, 47]
*   **Format:** JSON
*   **API verfügbar:** Ja (RESTful)
*   **Update-Rhythmus:** Regelmäßig (verknüpft mit DATA Act)
*   **Kosten:** Kostenlos (Kein API Key erforderlich) [cite: 46, 48]
*   **Crawl-Eignung für MCP-Server:** **Sehr Hoch**.
*   **Analyse:** Die API bietet transparenten Zugriff auf US-Regierungsausgaben, Verträge und Förderungen [cite: 48]. Sie unterstützt sowohl GET- (für spezifische IDs) als auch mächtige POST-Anfragen für erweiterte Suchen und komplexe Filterungen [cite: 47, 49]. Für einen MCP-Server, der Compliance- oder Finanzanalysen durchführt, ist diese API ideal.

#### 3.1.11 State-level Business Registries & Tax Databases (via OpenCorporates)
*   **URL:** `https://api.opencorporates.com` [cite: 50]
*   **Format:** JSON, XML
*   **API verfügbar:** Ja (RESTful)
*   **Update-Rhythmus:** Kontinuierlich (aggregiert hunderte Register)
*   **Kosten:** Freemium (Kostenloser Tier vorhanden, kostenpflichtige für hohes Volumen) [cite: 51, 52]
*   **Crawl-Eignung für MCP-Server:** **Hoch**.
*   **Analyse:** Da jeder US-Bundesstaat sein eigenes Unternehmensregister und Steuerportal betreibt, ist eine Aggregations-API wie OpenCorporates unerlässlich [cite: 50]. Sie liefert Daten aus 140 Gerichtsbarkeiten weltweit, einschließlich US-Bundesstaaten. Die API liefert detaillierte `statements` über Kontrolle, Aktionäre und Gründungsdaten (`incorporation_date`) [cite: 50]. Die API limitiert standardmäßig auf 30 Ergebnisse pro Seite (bis zu 100 erweiterbar) [cite: 53]. Ideal für KYC- (Know Your Customer) und AML- (Anti-Money Laundering) LLM-Agenten.


### 3.2 Vereinigte Arabische Emirate (VAE / UAE)

#### 3.2.1 Ministry of Finance & Federal Tax Authority (FTA) / EmaraTax
*   **URL:** `https://tax.gov.ae` / EmaraTax Portal [cite: 54, 55]
*   **Format:** XML, JSON, PDF/A-3 (für e-Invoicing) [cite: 18, 56]
*   **API verfügbar:** Ja (für autorisierte ERP-Systeme und Service Provider) [cite: 9, 19]
*   **Update-Rhythmus:** Echtzeit (Validierung) / Monatlich & Quartalsweise (Returns) [cite: 19, 55]
*   **Kosten:** Kostenlos (Portalnutzung), Drittanbieter-Integration kostenpflichtig.
*   **Crawl-Eignung für MCP-Server:** **Gering (aus Sicherheitsgründen)**.
*   **Analyse:** Die FTA verlangt von Unternehmen (Umsatz > 375.000 AED) die Registrierung für die VAT (Mehrwertsteuer) [cite: 54]. Das zentrale System **EmaraTax** bietet APIs, um ERP-Systeme (SAP, Oracle, Odoo) direkt anzubinden [cite: 9, 19, 20]. Dies dient der Automatisierung von VAT201-Rückgaben und der Vorbereitung auf das kommende e-Invoicing-Mandat (2026/2027), welches Rechnungen im XML- oder PDF/A-3-Format verlangt [cite: 18, 20]. Ein MCP-Server kann hier nicht öffentlich crawlen, könnte aber (als autorisierter Agent mit API-Schlüsseln des Unternehmens) Rechnungsdaten und Steuer-Compliance prüfen [cite: 9].

#### 3.2.2 Dubai Economic Department (DED)
*   **URL:** `https://www.dubaipulse.gov.ae/data/ded-permits/ded_permits-open-api` [cite: 57]
*   **Format:** JSON
*   **API verfügbar:** Ja (via Dubai Pulse & dedizierten DET APIs) [cite: 57, 58]
*   **Update-Rhythmus:** Laufend
*   **Kosten:** Kostenlos (Open Data) / Gebühren für spezifische Lizenzen (z.B. Ticketing API) [cite: 58]
*   **Crawl-Eignung für MCP-Server:** **Mittel bis Hoch**.
*   **Analyse:** Das DED bietet über die *Dubai Pulse* Plattform Open-Data-APIs an, etwa für temporäre und permanente Genehmigungen (`ded_permits-open-api`) [cite: 57]. Zudem gibt es spezifische APIs, wie das Ticket-Seller-System, das eine direkte API-Integration mit dem e-Ticketing-System des DET erfordert [cite: 58]. Zur Überprüfung von DED-Lizenzen (KYC) existieren Drittanbieter-APIs wie *Surepass*, die Echtzeitprüfungen der Lizenzgültigkeit ermöglichen [cite: 59].

#### 3.2.3 DIFC Courts & Dubai International Financial Centre
*   **URL:** `https://www.difc.com` [cite: 60, 61]
*   **Format:** JSON (für neue APIs)
*   **API verfügbar:** Ja (Spezifische APIs wie Real Estate Data) [cite: 60, 62]
*   **Update-Rhythmus:** Echtzeit
*   **Kosten:** Teilweise kommerziell
*   **Crawl-Eignung für MCP-Server:** **Hoch** (für freigegebene Daten).
*   **Analyse:** Das DIFC ist eine Finanzfreizone mit einem englisch geprägten Common-Law-System. Kürzlich startete das DIFC eine Real Estate Data API, abonniert von PropTechs wie *Keyper*, um Echtzeitdaten zu Immobilienwerten, Mietrenditen und Transaktionshistorien bereitzustellen [cite: 60, 62, 63]. Hinsichtlich der DIFC Courts gibt es Richtlinien zum Datenschutz (vergleichbar mit DSGVO/GDPR), die den Datentransfer regeln [cite: 61].

#### 3.2.4 Abu Dhabi Global Market (ADGM) Registration Authority
*   **URL:** `https://www.adgm.com/registration-authority` [cite: 64]
*   **Format:** Elektronische Register (JSON via API wahrscheinlich intern/autorisiert)
*   **API verfügbar:** Ja (Regierungsdienste & ADGM Registry Solution) [cite: 65, 66]
*   **Update-Rhythmus:** Laufend
*   **Kosten:** Gebührenbasiert für Registrierungen
*   **Crawl-Eignung für MCP-Server:** **Mittel**.
*   **Analyse:** Wie das DIFC operiert das ADGM unter Common Law [cite: 67, 68]. Die *Registration Authority (RA)* wickelt alle Gründungen über die "ADGM Registry Solution" ab [cite: 65]. Im Oktober 2025 lancierte die RA eine umfassende digitale Suite für Immobiliendienste (Off-plan Vereinbarungen, SMART Valuation), die eine starke API-Integration im Hintergrund impliziert [cite: 66]. Ein MCP-Server könnte öffentliche Registerdaten extrahieren, um Unternehmensstrukturen und rechtliche Dokumente im ADGM zu überprüfen [cite: 65, 67].

#### 3.2.5 Emirates NBD Business Banking APIs
*   **URL:** `https://www.emiratesnbd.com/en/corporate-and-institutional-banking/transaction-banking/digital-solution/api-banking` [cite: 69]
*   **Format:** JSON
*   **API verfügbar:** Ja (Emirates NBD API Souq) [cite: 70, 71]
*   **Update-Rhythmus:** Echtzeit
*   **Kosten:** Sandbox kostenlos, Produktion vertragsabhängig [cite: 71, 72]
*   **Crawl-Eignung für MCP-Server:** **Mittel** (hohe Sicherheitsanforderungen).
*   **Analyse:** Emirates NBD betreibt den "API Souq", das umfassendste Open-Banking-Entwicklerportal der Region [cite: 70]. Es bietet über 500 Endpunkte für Zahlungen, Kontodaten und Trade Finance [cite: 72]. Die Sicherheit ist extrem hoch (TLS, JWT Tokens, Message Layer Security mit digitalen Signaturen) [cite: 69]. Ein LLM/MCP-Agent könnte diese API nutzen, um im Auftrag eines Unternehmens vollautomatisierte Finanz- und Steuer-Reconciliations durchzuführen, sofern er über die entsprechenden privaten Schlüssel verfügt [cite: 69, 71].

#### 3.2.6 Dubai Courts & MOJ.gov.ae
*   **URL:** `https://www.dubaipulse.gov.ae/data/courts-records/courts_verdicts-open-api` [cite: 73]
*   **Format:** JSON, CSV (via CKAN Action API) [cite: 10, 22]
*   **API verfügbar:** Ja (Dubai Pulse)
*   **Update-Rhythmus:** Regelmäßig
*   **Kosten:** Kostenlos (Open Data, erfordert API Key/Secret für Token) [cite: 10]
*   **Crawl-Eignung für MCP-Server:** **Hoch**.
*   **Analyse:** Dubai Courts stellt seine Daten über das *Dubai Pulse* Portal zur Verfügung. Hierzu gehören Urteile (`courts_verdicts-open-api`), Rechtsgrundsätze (`courts_principles-open-api`) und Notargebührenquittungen (`courts_notary_fees_receipts-open-api`) [cite: 10, 22, 73]. Entwickler nutzen eine OAuth-Client-Credential-Authentifizierung, um einen Bearer-Token zu generieren, der für 30 Minuten gültig ist [cite: 10]. Dies ist ideal für MCP-Server: Ein Legal-Tech-LLM kann nach Eingabe des Tokens nahtlos nach arabischsprachigen Urteilen und Präzedenzfällen in Dubai suchen [cite: 10].

#### 3.2.7 Tamm Platform Abu Dhabi
*   **URL:** `https://tamm.abudhabi` (impliziert) / Apps [cite: 74, 75]
*   **Format:** JSON (API-getrieben im Hintergrund)
*   **API verfügbar:** Ja (Backend-Integration von 940+ Diensten) [cite: 74, 76]
*   **Update-Rhythmus:** Echtzeit
*   **Kosten:** App/Plattform kostenlos (Dienste ggf. gebührenpflichtig)
*   **Crawl-Eignung für MCP-Server:** **Potenziell Hoch (Architektur ist KI-nativ)**.
*   **Analyse:** Die TAMM-Plattform bündelt alle Regierungsdienste von Abu Dhabi. Mit der Einführung von *TAMM 4.0* und *AutoGov* auf der GITEX 2025 wurde das System zu einem "AI Public Servant" transformiert [cite: 12, 17]. Angetrieben von *Microsoft Azure OpenAI* und G42's Compass 2.0 (inklusive dem JAIS LLM), automatisiert TAMM proaktiv Dienste wie Lizenzerneuerungen und Rechnungszahlungen [cite: 11, 12, 17]. Das System basiert auf LangChain und LangGraph zur Orchestrierung der KI-Agenten [cite: 76]. Für externe MCP-Entwickler bietet die KI-native Struktur ("API-first") massive Potenziale, sofern Abu Dhabi öffentliche Entwickler-Schnittstellen (wie den UAE API Marketplace) für Dritt-LLMs öffnet [cite: 17, 21].

#### 3.2.8 Dubai Trade Portal
*   **URL:** `https://www.dubaitrade.ae/en/` [cite: 77, 78]
*   **Format:** Wahrscheinlich JSON/XML
*   **API verfügbar:** Ja ("Open API for Seamless Integration") [cite: 77]
*   **Update-Rhythmus:** Echtzeit
*   **Kosten:** Portal Deposit/Bankgarantien für Transaktionen [cite: 77]
*   **Crawl-Eignung für MCP-Server:** **Mittel**.
*   **Analyse:** Dubai Trade ist das zentrale Portal für grenzüberschreitenden Handel und Logistik (Zoll, Hafen, DP World, Jafza) [cite: 78]. Sie bewerben aktiv "Ready to use Open APIs" für die nahtlose Integration in Unternehmenssoftware [cite: 77]. Ein MCP-Server in einem Logistikunternehmen könnte diese APIs nutzen, um Zollgebühren, "Rosoom"-Zahlungen und den Status von Frachtbriefen via LLM-Prompt in Echtzeit abzufragen und zu verwalten [cite: 77, 78].

---

## 4. Quellen

Die folgenden Quellen wurden für diese Analyse herangezogen und nach US- und VAE-spezifischen Themenkomplexen gruppiert ausgewertet:

*   **IRS (USA):** [cite: 7, 8, 13, 14]
*   **Congress.gov & US Code (USA):** [cite: 23, 24, 25, 26, 32, 33, 34, 35, 79]
*   **EDGAR / SEC (USA):** [cite: 27, 28, 29, 30, 80]
*   **PACER (USA):** [cite: 5, 6, 15, 16, 31]
*   **Federal Register (USA):** [cite: 36, 37, 38, 81]
*   **Cornell LII (USA):** [cite: 39, 82, 83]
*   **GovInfo (USA):** [cite: 1, 2, 4, 40, 41, 42, 84, 85]
*   **eCFR (USA):** [cite: 43, 44, 45, 86]
*   **USAspending (USA):** [cite: 46, 47, 48, 49, 87]
*   **State-level Registries / OpenCorporates:** [cite: 50, 51, 52, 53, 88]
*   **EmaraTax / FTA (VAE):** [cite: 9, 18, 19, 20, 54, 55, 56]
*   **Dubai Pulse / DED / Dubai Courts (VAE):** [cite: 10, 21, 22, 57, 58, 59, 73]
*   **DIFC & ADGM (VAE):** [cite: 60, 61, 62, 63, 64, 65, 66, 67, 68]
*   **Emirates NBD API (VAE):** [cite: 69, 70, 71, 72, 89]
*   **TAMM Abu Dhabi (VAE):** [cite: 11, 12, 17, 74, 75, 76, 90, 91, 92]
*   **Dubai Trade (VAE):** [cite: 58, 77, 78]

*(Anmerkung des Analysten: Bei der Recherche wurde die Präferenz für DACH/deutsche Quellen berücksichtigt; da es sich jedoch um hochspezifische, lokale Regierungsportale der USA und VAE handelt, stammen die originären und aktuellsten Primär- und Sekundärquellen aus diesen Regionen in englischer Sprache. Die technische und konzeptionelle Analyse wurde entsprechend auf Deutsch transferiert.)*

**Sources:**
1. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF5CSX3aXm_OUF1bVvLHjy2swPSCLuGIE6rJoIATXw-Q66_kNVQ3UGUSBDtZ_spyR_2RAl8HuLSRZNAAm0E0ut4217wrAgvE_eQKVse1T1s2FlnviSOThKrNvL4VUd9YCBhRcbHw6U=)
2. [fedscoop.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFD8D5p-ccY7wlmduFLeFrxV7QcxOfiQgoWTr4OK3ykRSC7ONVRg-rCWJ2R0RBi3aXN0fzsQdPtrciPdaCdtUqsGcc_dIo8MoHei1jeft0KXbRCK9-OLHtxB4nD1jXck3h3V_o3acF3jSmwdPN6wbdkWO_UXEpumsOuM-d57w==)
3. [data.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGqjDW56FHrdL9u63lPqs2iDjWEUYJH4okHD6RCQ42fhaqE5qbv_BRIOyLE6v1IGjbXd0jnx1wcAHFb525b2_YO-QILrtZ18O8K)
4. [govinfo.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFm-0loPbyQhvEkED6omhMOIj_inufNhKtI-wgEs5hcqGxUstuE2z4hUMHsISFkDrNfcIb4k7YzIiwPPY10Xid-NzG5Q7IpQNRIEJv0-xwol8ZskU7WbEY6hG8sAZhvgJVrfFUDLNO3)
5. [uscourts.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHtyzRe0NGmZZCetLsxjWjyQe-fWX4y1GK4QfWmS7ElSvx9StlYmT692PG1Kpz03_CcXOlfod6JYqIuFY0RWAqQTTO7xNigBefzi6SFPuaSrDfyy6QUuMD3yqAIfBNBKaU-j3118YeoZal1)
6. [wordpress.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFynuCnMV51xJFPppZVyleNq23k_MXMEgptTJgkej0F1MMPqR58DUfKgyLVbXngjf1h9JkHHHIMu8SgIUBecvL77La-IRrF7cMUOxin0zJS_2xC-xsc3nlf7UvAXASWLuOhC2n5aqqHToADQ1KjI8VOISxMu712PSvNhQ==)
7. [irs.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGhEhtcGqLXbUqXF3ECdKKX298ZJwU1yYNIbo2mUI_T0dpzznMTZclrlkfNBScvf-GShZbEd6nU1VY2DSQAShlUTfEddp-R61uuFdGGqmzsP60ylxutoOoNycmn1DEl4HK4K0o8gPRuFRhPtatSCw==)
8. [anchorbrowser.io](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGSBeuRZLFYiyB8ZVLGwwl1NABHt7SKU4B929wq06cofo5kk-E1JoPay7G_wAkQLA7-KjEwDkfmYE2bkPkUT4NVnZSoF-hWq7FMJk22x7LwhVBbUW5FKnsS5r4K5ftPdinlrMZTK8CB2eVqvmdrEnxxbL5JQ1W2L1HKpq40PR2r)
9. [infinite-it.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGT0ajmaDJLkPvmqdWgdjYEDa4Ujq-QYPrbogxZCeT_z6k17rlw-ph1R7ygFP9HquHxN2MEOug5sFR1C3FrCsz6akEx-qz7GZohlmQ9B9Qrna2txHYGNqM5mHikd6fEpkN1s9v84H_NrfI9JSyxBuKghq83V_0wO-Iw0ZCc)
10. [dubaipulse.gov.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEe66b5Z1t0sDPU8n0m3vbGgFaUDQv2au_d23W7UuADrM9KQm5LIdNPl-0MfgKoBn4OudQs77GuTsEAuZI4IKqcFdhWiMFJtcQQFnokMb7Nc-uVBGo9bUevDlLuh-9YQsnFfJA-QUMtq0Rpx-KYr8Xvw_su7B09Pt7L-b9F55XaRg==)
11. [microsoft.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHAHmRr9NEq59KgOKPN0gLiJ0Q3Y1VGkPfr_FOWZY7aUxvm8tV3D5aqk4JpNVn46hy7HtMjCAvw4bcGg4KdG1FeHjnSja4DJ_hUoZSBv5pxHycRfru2V48CqVSktxxZX49ABCApyFFOVQ5kG-QVlra6VZ7QO6BjT8-K5Coj4NjHM_Jpf1v714g0XwpP)
12. [financialcontent.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEgGn64y92K1XDHUqBdfwHI5QqNKMZINSMBKqQkU0uAGkNRNn07ZmIMnS6ElNeVdFwhmfMaFcWXeNW87DZybXkXQi9NiyeJkNWuKuUq965QMxRaRVPSfXH1V2jB9Tf-UkIF7tbbYWkBZtArvvmdbb-jSCxa0qfw8rpv9VvMQS1FLftC7C3rUWmG-9Y5LNQhvt-LmEYqHTKGqGZwkckgsf00j97kKzzLvojUxuULMBU1p9BZDgEnAgSkuAyeehsLcNsMAkxTFwkkVBeWmURMYnUKaabBwIAZLy8vUr4c3Q==)
13. [fileyourtaxes.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGbmJhS5_-iFXMsOJ3DwUBWo50o_Z3GF2T0CeTEcFxGJBNe7ZNokIbCT9vEpYSn2y8vdrKF-cFsD6IkbaGi5OEaxlCnPD6Zr9q5gw9TK02wrV5iqIsm3A==)
14. [taxbandits.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHXc4anmVcU4tl-zJAymDS6mIfv9VKv1Qilmjoy-qZv2UqDpfBWxX0pREicND2-_vK2_xa0ee1f4uQ0Am1KPUd-iW8YGAHST2HRYJVb3QYu9s-jhf5K)
15. [uscourts.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQG-TDR5-6FaxkeMfK_TWmfUN9zRkC8rYH2cLCnywjtem7Qiyh13yNiqdLsbI72l1UoMe0a1Mt-sJ-HkAYgo25YJtdUk0vJF9fshTY4ZWKHUCjv97UuxcEtfI_9fMlBFhTYWCzoe4Iin58FqkQAOqF07zuMuT6Dh5M4qvVqcPuF9nseSjz6z7T8mbJn6)
16. [fedscoop.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHYtJNmvf-0zNDQYCWtBV58jtUIKhGgDz9RaOoa_gjg5kc5Fw58Px5Jvzxr-DlxiwNZ3McXtUlg4rKFUzM7KwmFKQ-j8DXdaVhTZm_hhOs2xFGqYKXBVAGQRh6ufWgiZpCbtEnU0v8Abe6qNxB6_vSh1Q==)
17. [completeaitraining.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEaD-ES1rou4CUO6qrDi6Cw69-mky8iuiK_uGSGvbExTWmXsvAc59z9lhzBMCKMK895trdikJSw-qDyM-takA8aqVMMhTufkQMI_MU2CYX10iBvcylCugpwOW9ozvXY-BdEUYmWq0xY8SjVI_Y3-YzCGfsUipW23BLRBraPXZTCGxhLT9W24rjEZdwi8dFZMF-OLw==)
18. [wahni.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQENk2gmEUh-U7tALKlWlnztnZ8Z6vdKVOhrcmv6YHp-AkVD2WPIy4l8WEpn63bJnOcuud7bF2kqXXt6sklHroJADAI_69uEkT4YpYfjIJYQwGrbvC5H)
19. [sowaanerp.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHehnE_653r4E2R93EoxQxvSGKoqU6Gav_Y0FbLYaxnM5OwwIRZm6EKH2v0cKp4hOXhVbMceFzW1_LoDDwK4epPfNrB9v66Fm6xnXxyfW-qvVd4ua6fzyI=)
20. [infinite-it.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHfB2F7w1Ih1mUrn-W51uXb7fkQcafgPimQULhGIclFKwFFuXlhUmnS9JswDtHZr64gD0xZt46RhA29WCjQtmURHhcZX9yAkalAuWzY8hXGk7lzE7JRYF_cyWpid4k5H8PC9MunucrRLyos0L4=)
21. [government.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFB1MuuFal1PB_tDdFdiYJTAlk3ODu5XId7ysoi9xB3wDVi2hbup6NyjgVeH5bYUHBhszV0TwH5PVdUIl4YYvcFAjaUYr5cocnRVodbBAf1mNxGc_iIyls-uhJumMUo0RAZW5lWCExzNbiHyEGXjsS285hq1UHUjdeyzx5QBt6xyiPfiGXQ_Xh5VOZHOITTIw==)
22. [dubaipulse.gov.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFnyJmMkmF61hbzJpvNzdEHHBA1Kp2UKOcr9QwLSRIYPCtSpDUUB_VpCU65MjodMlhCwDuyjToogTrK87Ym0dl4LYT62K8y8m5A4MyiStVtJSVN7kRmnpX9y97FeTTFvI9PeZ0HBJfg79iH2mnAe23PCkFidnQ0lqWf0P1-i_cGlN0ZEh7vXtOC9G4=)
23. [house.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEtXufbT0drNKMHqVmdjye_tppHIAYGQABWwxWfRq-34iYrjplngWoY8hxuEKtk8s5yFxCu9wr_x-3pTcRFUY0_zH43yvQ7Ry0reVJnFdhmoAOuR21gwPinEAeCFSR9trZHl8jhsM3Iwfb2p0xXDqoQxC6U)
24. [house.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQE_8xtlic7A98XOQZfey8Uiv2fDgeE3g88ZUdNj8VxJLH7by-6apJ_yvPnH1iay5pwMVJU3T38EA048-n6h6dpdu621vn82INlE)
25. [irs.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGgIPteWWSxtBThgQa9VWXGHIcnYo0t3qUj2HZ0khozVH58u0C5Q_I6457pMguHEZ6Jmaos8sM6uM6tRwmVnE4lN7HqjLcujKksxu9Wc056dbyeFxfF16ytdVQMesesy2Ub9iuHJihl6cMECaFEQ95dX__NTa9gcTXDc4675j04xb4uAKsT)
26. [house.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF895fWx9ZStcMyFcnGXqjocyXwhJfZUb7ldhaqjCKtcZmVtXNbagr3iAt6h9NLuDdZ4wcFHpaQp4mvXdEbdQZUd0gO9NquTqB_odrJG-bZNM7KkqUWU_O7gAHGXQuFaULhAG4-1-4PAf2mdRnppVR-ahwg0FOgxjwk5uRGAYO6QtwsjdKa)
27. [sec.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEYT3TFE6DnS3APyh2wLUklaxrwAp7Wza1wK2mein_5fiIfkaD_s8-VbDFxcA1vBbBdLa8D3X31X-NRU9srD8tCmtfIaZ0w8wwQGkI7D1K0fzcGRRirhRdLJrbOSd2GfgsK8j_ZitiH-EJ1XD6QQPe5TWw5juseabEHAefvivMk)
28. [sec-api.io](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEAQiWbKV5yOiGtOCt-HLrv7OaRqUcSTCrk3Gpi4Nupfk3cKbhzPtKMNi6Tr6pncl9KYBtFd_u4gHcCP3iaU5FFsDpj9P-Mwg==)
29. [readthedocs.io](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHK9LUiW8Rj5k45o-lih0wcjauW2JXc21TPMGQinb_L_Cn-ZeFYBzfzFSSedAkjI-8U3Rm7YzSrCn7RdrUrHMhrYVqAlflHUqQFtKCw0rOvy_shOEiIH93LeQ==)
30. [pypi.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQH4RyvL7Sn-bf2bjSAjQiSCQaLNP_vcD2ydLiLdcAcDjO98Xq3L2QfnY00p_x4j6_GVcU_KpJEhMKJdDuxzddRU72yOXJsgpoM6gvUocbLtKwaD2eLJ)
31. [datarade.ai](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF9e8X9edF1GXyOATgf1oZ719OE2gRGYeyhGcnnXfIfUSoCjNVqFra6TMxCaMRkjPbKtx0dGaaHsaxj8BXp2v1enMV2rLPb8LsSoORJqr7MYtHLuWuygxn2b_zuSOUR_AGS-5wyX0Q7GvrmXrC1QkuD0uUh78CsaCSBmTc6Ec3Usj9GeEAMjb4w7DoW_YHd)
32. [congress.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGc8pAeBFXjLbMwcm9sL1uOk-8PD7YCA1ll6yCD93pi9ukNG2hg4Uu5RJcvMYxyJuNrvwYheSfkaho8p008iq1tmxoRM--Vjfv0uaJ0Nw==)
33. [getpostman.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF9cxiH-dAle_H2nmoI5R0_mz-6I5y7uS8bT1Z1x-8GIbNS7-nRjEXNprIGFZ7z2fTS8tgSfnEVGEBUL00EpYgGIVFDGfKjBrdVjFuL2UhFpLyQab8jFTVpK2xS-b6BkTeIDI5x2c4eTGrK9g==)
34. [loc.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGCNCiPHr2zZB56HcjZsIbAt1Afj0WJ7ZwqQVXUq90G2k9WpY6U2DS28MsbmDobg9-obG_gUe-TTqooeZjTWBL_x8c6noLfgp4X4YiN5c3fPVsyAF0VPu4IIU_xhD_MRHVyoIHunx1rNmDKsVHk0WF4cOE=)
35. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFLS6n2PehSkGdNC54EDeVkzLn8Q6VX6swINqjlmMizVkxNs6norUenskKc_YjA-k9Rkbslqo-inzDhwWohOHlFOKthi-HLAvgETDbiRXxvFr9j7lDsxXXktg7Mys2KkTw2gxPqWDOSEpk=)
36. [federalregister.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFYs3GRxKBU-RSLXHsCvt3a4x_kjU9qkmPQfMGyJujkOgejoewW7iPm2gShovwNL8PTBs3ULwN8BJB6iz4U7U8Xzbzp2Rnu3iqo8GFgkolHt4eWMn678AnRfu--rl0CJrjKhqi2FIR95M8voTVVLHy-13Fi)
37. [federalregister.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFdga9R_pDVrO4Zz20wS-yJQGQMFpVQLyrbfMgw4olSJzDFv5jmaO1Q6b1XNUmwnVFv-kxjFxgktNhXRsWMEJXPzt3y5qEM7Zo6ALJ5hrWj5V01_A9KD_nHWOEaJ-V_VThJx-X5ESzQCpVhWxtkxnaUJL25heNsrPUTGaEy)
38. [data.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHOz07pQGFaOEBFoJbFGQMa6M55mEhyNB0AYTqP_sieYBXrPvp2tpHN6IVBMylpy0EZte-64CCKr9XjRpGcE94mjeh-eB9DEWXnG0LP9rSDkO8G6YVXh7Rfj1J-Cix5WAgwyoTeir_-JXh5eJW_3Kxf)
39. [code4lib.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFLHuSMxjY5M6L3dst3mjsw9FDglH624m-eEz7sBRmMmw2h0wat9dXXerY_UF88TniFe_aD7equqqZRl_eM1SkkD5ZTaqRqBNqKlzOz3VJJJCKN-mAdokY4uUw5Bc0v-Q==)
40. [govinfo.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQH4lVkax_8daIe4Da5Vvsw5S0SjE6rCBg4FQc8hseo9sRdyPpbjXhRqh0zptAVLeib2pxak_ULY4dyId9UpMlB6yv_mLfT37n8LGDF3aUMNSHYybnrmr-9M)
41. [govinfo.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHSUBrWfwTRGt_AKBCuCMN5W4P3Dh3uVr5xyrxIRs8_CFODoyyD2_9o8aEbnu5R7opBJva0QpRH1Oiu_CL567LcyNgrxPA8Kt6kkQFsl0nFX1F71m5kxw==)
42. [mcpmarket.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFKkO97-a-q_Rdlj-IgC49hHNGa9ZiKEgMI3hbRV-L_DvbABmCh7WVd4kFF-7H5b9nGPB5xvGSkDmE3DKcDj_hxkOBR0YGUZ0Y04MZyPMwuBh4-h-U8wopG)
43. [ecfr.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQG8rEGd8xBhNb5MC6iDA7I0rZvXTg0biCS-EcA78x1xd4I_9owtmeLQa1D2HNxoUgwKbi-aJYVsYZ4rpfp94Y24yaqLiITXZnDAokSNHwJI6ImlVC4XUY7dApW8jaVrScZJsk0X0DzGJg==)
44. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQG-NOkS9dkUq8YKv5SAXqsuudfizjYYE7qrYpdSigDrlwgUhBkvzJH22Xt0g3v_RuIXGJdQY8Zr67Jh7xt_PkjH-Nv5r8BXYAXfW0fmjD0Z7VNlb8iLaVGHpw==)
45. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEHaWsgI3Ag8nhWWHORfNgLI4qpSmklF3-bNKrrbnyI4J_4MImvjYOaK8prW-NdcYFFe2MMQd39o1bOkowxPu-aXBLY69sWgsP2PjU-SlDjwxNyAz2dKH_-de-dFfc0fGQfODNavS5tyJtBtckjQQ63YiDOxHPs6-0r)
46. [usaspending.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGyPiQQF1kpY22EEvKQE3HANsLfJ10NchwdYaP096_QJtO9dLZDDAYGXnOZ--Cuc16-zdbqEAQY9IAODKHd5gdnNHep8aWcG3OM5Cvz5GWior9CL00Z-h0nfAWBX6r7)
47. [youtube.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFuKdmORwvsXaa7M31TA6RUvrsLfZcbPR7ljic6iP_hDDxNGFlxXjx89-GmJ0Xr0TtCoRSHSdOL8VBTzH3NwM53kUhDKGsy1yadEIQke4O_vUOKEp8krLfp3s-8xG4dBQ==)
48. [treasury.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFuIY2zxsjAYB8N3Z-nIY51eF84qdpjE-dYREJQWwL4_q3P5A5_Q2xT2JH115yWmZqjlG2wL4o8S6chXmwxafgvEvWiIoiPqrhVWA10DOExoWKS6YQ-o3BSojtpGZy5QzOCokmt524=)
49. [usaspending.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHC5c2Za0wgjHe4jQEuN2gn86gbTBr_ZG2Ews_14nczG7K8EK0NEWDnUonoLE24rN-GWw90Cpfg0FacpQdmhizDAVIPtNdh-O2svcOMwrjDQfhOkfIrgOxlfPUjBTSVSh2K0Bw=)
50. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGsM6otOXvVb386ip-5KRpzP226pZZpbSMBWsXNwrxh4ElcgN26NP2NcWa9YthzGAOTSqcYEzrmHDYTq771IakAqZ-6w84n5uZKx3fymO1JupY94yvjBDypCkouunjlAnM=)
51. [freeapisforyou.in](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEsPxRo_7dG3ymTHLMOO6JVE2zWtVmyTgSIgOBJ5tFM9UqfTVBG6PBu9wFWGyTRlwa8fiOBAQLftt9ET5WUUJIy8EhpBio0JZSjvYS9F-NCNxF58ZlCx4g6cMu5ZwTTexhbiEmO)
52. [trider.uk](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEOjVLn8BX6CX8IUoaC8ctWyu5hnDzCYWuLfS8hhZh09ejUrYl2yWjaK6tq9vN93lB7EtM1jHP2Ab9gCsXhiRmuZyiwCWL6VOqwjlx0sX1pu0Kb7XCvaiG-ptul6oOLL6Xn4BixJpziJ6FqW52BaEOtt5krokyElQ==)
53. [youtube.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHflyFJGFtJGRTz73WZm1QYWDjV0yUOp7Ms_8TFK3GKVdazoIBmzBu2di9tvZ8SZU5nrKvSDepNe0xCPjuAEM9iJ3UCNNWVkt5gyE8X0WzfvG8iR_9fX46B7k4FjovFiQ==)
54. [mof.gov.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHOqDi2FAL75LJvkXKFDYbWF6wQ5vf-BOtaimLJ0BKdul1yIQsF8u1lnBbu6HjUQ3ZTH79E4w-RTFqS0wn1TZ-TKszXQID949r_pcOGwht3qNo8Cwn1lzCq3l-4Lf_v4Fp9HLLOdkwvj1Hll56xCzvUCA==)
55. [u.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGoxlZdIeCVMD7eELDNHmpslbycy8iFWA6N3CF5Jt3B2_iAQPFo8zI6SoDloA3IhTYlZ8vXiiDFZQnraN7-qzLVJ1CVUtqOUWQGjmf8Lt0YOiim8lbewzKr-tIy3nPjAHEuk3VetMqUUOd2rZgOHPacOtxms5ZLj6nBjXLlxUOKrKiHzpuhOyi8j9noqjIgbCSyjffvI9xeY86aNVs=)
56. [taxilla.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQE2hr4TSHNNpx2Wqaqq7HFqf63bMm9UBxk3idjuDWBQHFgg1ePOQ64mzTfawJClAki64byxK1X3rR2JCWyzvpt4gwl1rSUyqZPjZTPZWamLdoZ-1hWpk8b3-ZUg92xL)
57. [dubaipulse.gov.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGLNAsqyzvE-Rjynik838DcXmC9QXoxuDMAW4pOZ9rAzSGJqvt0MtDDwqKUJ5uxHmHM-y2h9Tw7FxbM-SydRcSntLEa_QcSYr5bjcAeN1rWKy2w7nwGN4uT0QbHS-CibHbFNDw7Mm4qARxsFvMJPuaIpU-KVqYjrA==)
58. [dubaidet.gov.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFFJJT8riP_O04uTMs46OKx53bGdmrGbwX3_vbsGwPHx_Tp_gPl1mIk_yJv7spquqIgk_Rbb-CKmlCgQRg9mkcWuRVCFXJ9kcGyMAUNXE1MJf5i0x0TCyDZhp3iPx9ndxJP1Ftdvm-izsZ_0UujcDmQb7rpGxEpmedjl1InVHh9qUHXm-vjnXqD1j8OArSV4uCu1Wcg_wUCuY81)
59. [surepass.io](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEIixR7VJMWVLeXZe5triGCh6gVZdR_vEfe4KkCfYu1E9DYJJECm-an-Tq5GLQH3hhm6EVvALWvMyoMPhdDocl-vimxmhqv1vek_c2oUFSeWITTPp5msF73GDsKr4yCBbU2HCfciLYBOynXwRXiM9_24ckSpA==)
60. [financemiddleeast.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFKRdbmXsrePGdvliamB08jAzKTd13AuCLYfkFH6crp2avh3uENS2EAJsrc6s17iosBXgFif_pxx_x_DkrSVUIHtZlAGRmwOSe1dzIdTc-N5kyAST9lQPJhkSpGhHdFf0kvYtfL6jx6svSgZ_wCz7RfjwqhaIL1ZT9oO9ipfS_oQXC4vnCj36WqO8PH6jwNHQ==)
61. [difc.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFgWaC1CogriIDgG9yUS-APP8OhpE5g3-hlzb-lH2eblWpi9Mwf62ELsHKfylLobRFjA1sugVwR7hqIarVM2e9_SCgxTPhKFqcS4jKSD_ajjgSvk28qmDpL1cyTIcM4gbJ9RlE0xsfWf15ZUYip4_Cnc25PxXll3762goQycAq1-sHkzAlHBUVtwEmtz8bsxPmwUJ1H4JHEEsdJbvc=)
62. [dubaichronicle.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGYpHa4O5sNbd8Ov5Iqf62nbXkwvCDUyuAaA-nA8uYaukyvYotfopGhqAX4IWMVuDZWQSSITtgUM-8zlY5NUAllHfwm-uySLCg3-QfO5YTV0kJKYw6ud7Y5n7tvvjLIW8gP7ZSJron5ueM7p2Ml82ODq2Hdu39fjJ16c6BUUSQhhXw=)
63. [gulfnews.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEspAdsNE6m5lwRsHpOmpSgPFss7FWNu2JbXKGn44M_lw-dGcMDD8gR1Qr0BLLvSc2j_sKz53XEV5hWbtzGu4pncCBD_fPosnHHNx3DId8e7ZYk3ciDKQ8vR9zdFH00h5MEjnhqtf1TNealFx5lm8etLihhVFvvzIg-mQdzM3LZQLMBfSn0tCXd3NPevJupeBnHeaoSlCf7-ZwL9Oy8SVbmYfc0)
64. [adgm.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEXOj9mk900gYpcmQ8VpffLP2x_l7kp7Hd2u15fyTL9gEE4d9--lFvVDuLHl61c9Ru5y2ne_qP5UsM0enMw1TRrFbtgi2r7Oz9ILwFIFR_q8v0GPNM3LLfYIK3gaTOhJQ==)
65. [pinlegalglobal.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGHUvpux1K2oJNm6msxgOpd9G_3-U8bZhS6hMsAPZD-rTAwgmzPKUmmeXiklb3D2gU81z-8vQGL3B15fMv8bzH5YwHX3klPoSjbFTqm58a2mUVQpUxUhYAaTqGT4h-aUdsKtNfmijZFUiawOXytL-ys7nVPl14R0lI6Pv91AoBBBJetgJ-5_e279Q75O29sXkFpWHD8tfCRRg==)
66. [wam.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFDRM5sFa0HHOkxvbwTwUcw_Mtl3fpZxRBAfXbSsWUOTMMEZ8Fg31nWnMkbnSBl4BtNvNoQ3i_1QuGvC5DMSLhSFTDdEYRGbfU60oVqwMRGSkMSAmuXmQ0lX4A45Y1fan0P9SOlChQF6BlTJ65dr_e_6tkSqSLM15y6iEcFStAWkOCZAyeBSMgqWiqlIDpjOGrPQaI=)
67. [healyconsultants.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFL_1Ufotp9Us8mk8F8RWaGefxRouV09J90hL2A3xWQFSwYTDDmh0732Z5j3owBjrnzCNU9RXVKuzWkJ4NNpYhtd1x3h0673_YKXGL9g_fL7uX5QUgVJxkMLJQYsD7zqCWaVcBOJyRt2nWMt6i0JyQd9VcIlF0rEa9N6Xxbra0=)
68. [tamimi.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGcujxyQdkW13fui7Ez04O7USfLL5hmnFLhH4KJw2iUuHWCkR36SHKksLB8B6-XbYHtE5GTCmpoxNMQ_R3tZJMMN43ktye6e-ZSxM_zDhUzXw1mEcvrwrR6pHS4CFK6d3MIzQwnthITDRohtR6ilYRX7iIxdf969aDSCu0nGDCRBtP4bhLb5KE=)
69. [emiratesnbd.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQH8-Eu8JFn3qZmJzCBQRIoLLxTWya7zseCn3XsfCArUzxxpAQvVNsK2Tn4TgehjYQC6E_Tnjj9QJU1cF3ME7lgdhc_TglH8lsktPfWRIjqGnFaPZx-F0Eq5zrMsqV2k4UM_yv1F9W9msGxt6xFbX2usOKMV5DhSAISuZPNUXk38FtTLVIqpRPHQqT2WtfhN2C1aXC87QCTTRO0ff1n1f9iGM2Q8xvxwOg==)
70. [wam.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFIBpLW49lkthp8fHYMaVYxa_CRY77wnoJTtsalS1nNbBG6sfOpCMyt2985-t12f5OHrDKrxJ6Ld2UUCBKXRbXZ6FmZOrb0CS6JCgD_I9pCDYawTaP79jPau7qy04sh6O8d8NLLrYh7DdI8ibgaQtvspC5Y9ASbhy61ecT7oFUhMdFlYKv9)
71. [readthedocs.io](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFEhjRzj1eR8rg_EH8WWm-dBzI0GutOcBFC1GEN7_Slq4nNsE_QTK0E-Ea4GpvUO4QMk-JLlCEVHbzPy8iek5e7IilZDvyJBxr1sCGwXYZFK9Wo70V2ow9H)
72. [amf.org.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEHOw8gwI0ViLit1KxDRxPYwNiAw2Pu1ngnu-a1yRhAiugEGzZ8LNCTB8ZOYlQIdxL_znjfLXly50y-mVgBAS97jrtLJhJm6L2nFJRCSxtD-EWGyL3qT0rT-KyCKr7Y264VTs4qT-RZofHQ-QdQkJTZKXkhLNSLO497vA3Ce6o4nyoE3upeXntfklYHGEcYWQWDvA==)
73. [dubaipulse.gov.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEL-dU0nDInZg4x6sbMDMmt_5A_m4x6suUVdTOVLJxlFbzgBqXErcX4o0Zrk8KO_zIfhn6v0U7YiNOX8vBYKkkWZ64a4F0VgJnzhBnCORxcTW97QPsaXnWmP5C1x-RDhPOOgPOC7uNnbJ_1zGD-yv2AcCmR3qDc6qg7Q3MNw46V)
74. [apple.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQG6rQAmPV92_rGEk8vDRMtbSLeIZxoCwNa3qq_S4dLFgxeQQTpX7kfrGb5dBVjDwN99CVL4lZQmRxUekIenoFwoSCDzxc1KEolU5Gxji43gS9rHcUwmf7hFQN9m2gTNB6RrDlILCLRiq2M1ZzhM9WyuNeMeuPAhyps0wXwhIGbQ-A==)
75. [google.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHuDkmv6kjcbjDYFaSey9x_9X_JwR3Ea_DkVikuK5nVMq66zr5N6i4CLbcTtkQClx5xp6aaHNeYg3bOAgA_NSq8bV8rKsbfz28cLbC7jvA_4Ld8cxuXlFu4dLhYRZXmvX-TJEqWRZ27-q92YTK-oH01e_vlVQ==)
76. [langchain.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFldbZ_1WLTFm-LiHFI0nG5FhPAY81Pzk8fXHt1nyW21hzkvdTD0iKkcOB7yXVHkb06ws5XN9d7hZLtrK4whoUq1Rd0QjujKNk04EUaobQWuQ15h8j7ZV4IEHYbTMHRXUvmLyojM2pQbxgB248DzQ==)
77. [dubaitrade.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEg5KIfKjRr71X-8RGITuFDDazq7JuaoTzBP8OfTpsgS1wVR_PnUJgQ7PkA55GZ17FpeMfVQA4wrYNUE-8rxfk_cRktALfjYt5s94k_HGKSjtMCCXxbn1e7TllHgh1JzqBfGHt_J-9tR8TReHxvJ38m547q977bN3tO2_f0LPXBpInn9c6hxuLbEOzF7QXeJYrtWY71wFVmey7EegnB5jAgJ6e_0l5ysnra2FjakA==)
78. [dubaitrade.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGVZpjNhSLOhOVP7o2WB5ZlpYrYY83-mHB_tg86vSWmNiAfKMHSqPYayT2X-qwiDT-IoLsW50Wx0joNEYUkFHsIo5d1Gaewkjj3BzM6qbIG6y5oha-OfhcKhLgWe82ByWdKx4e22mRHpkc185la5j2ASA==)
79. [house.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGe6QJYoSAi5BlelHf8tAJwJKmewdSac2rRWXChkTGKf4dSEnXyiTUcg6lb4rZ7XUa6g2IMeRKkzl0gjW_MRK16EGdb68Ns7sOAICO-jzhUCQPi2kp8UpzF0HmXL05rPZlK5zwqCoOhmizvYCx6fJolUQh5Nvkix_TBs86bpWLvvCVIHw==)
80. [sec.gov](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQE_AqhfuGOcaoU_ZXnDmp6TNY9t61hPmNckzJqz2YIEHkLpaeGPdndNUXWYtdCeJbw3Zxx_QWVeUog8D1_Vp4GSkFImtGxAA4ypzq30g0pz2FKKG3c=)
81. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGzltTbZOb8Z6UmrtIYFCXGmKSQ0gNHX2mGT-9pK080PReuT8Vb4uRTO0y4doDC94v4aeddi_-pV2ZAbM_8xyKnoEkRQwzsorxTK34QmwIZt2lqBXYaXZJjAF-KlhlSu7n4L0aNOfCdhvYXM1eJJEGlgO4=)
82. [opengovdata.io](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFlcQuag2Yr92A69o1CacdbN1xV_u9q3schtiO9N-Yr6_eO_g3cDDgl1YES1tSlfMkl68jp5Any4G1PgQP1ckzNbQgrJrHWFTT1u01oE9I4tbPUEwtecxl3zmyEa7RAxOXR)
83. [thesai.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHTLZYqiiHZFp3XdTE6fq9MPPIuHL8sjgJS3dRpbvgFladp66KpXMnznfznkMHQLIB4qVMmWK4W-njcId0_dlnW4J2qcWk-LHF4A7XsgHjsb9jJYASCzVU3yP6lu4xPM1gtKFzWtW1NYsW-UkTjAuVrBK0SwBORmnD-MdL_J35PDnHhsT5uuGrs608N4QFd9MYCnys=)
84. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFWbQ-XvRrvycqatGF30bbRTwoaSxp1jfCL_pJBIrcmnGDDmAzj6KUylxlWiytSi9hkRscW0MWoa9i9pdFg91P_AYMV-0VBHG7G6E1gy2rlTw==)
85. [npmjs.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEHd3OhS-ud8KtVKA0ecCDctMeAInWRwl03wZxuvnIwL5P0d0l8MT_wbsIty5EoNiycnlIcrNGerKZx9PQOOPDVBQPIb6d6IuP_czgBKfzhEwb88sYFb30pg54rKc0Ht-ekwWQ5wJ-29UBlaZ0XiNJ7Zg==)
86. [drupal.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQErOnlBv2gMfVG8Odsk2ZfqR_79RAr2NtBcD6K3XszmL-zUcwnyPScVWYX3u7vwX6zDrJBus8vtHgf6R5MU_TuyfOhRCPmCvOTHkxXeUr3IVKIYiVy8ya8=)
87. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFHo76R12QH3OzQh-qYLRRwDxENyniypq-gFsCOZAPk-EU-TtXOOPuKCxXBKSWWTWpPZOwTrgoqbyM1J0az2YNSLX4eW_3cSSPd9xqnhtSANsiwoHsi_vPtS5TEZQpHI5v656z2YLFN7uTV0QNpNw==)
88. [scribd.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGgEqfYlyTAuMdnT08i_MKAgDrfTk4RzpmVu-yXEk-lbQIMVjvTA3AnxfEzpsW0wS0a9NAVwfOsi4Mrn25N8trpFjX5SVre1Sdid6QLz7__ke_uzOviUAHVEyCqJ3Y9YJUwVeeHzylw5AohB6mydOkILkZXc7xKKWfd0lo=)
89. [openbankingtracker.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGXgL29Pbi94pDN1X6YYKdH3jL5kgXV95ysmAlzHplVe7RWtBbRLYtBlTl5XLzN9G1w3BM1_tr90COWqbQ8Rbmj6CmVbMCnB5ZBUQEe3de2zyVokcAlKDzcBLjTjv6BV28hWlCdYEfu7RoWRSmPFJlB)
90. [wam.ae](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQErOmphibGesBET5uYprg811pvq2E8EisycJ1Uc6BeVjhY4peew3gdxXwJ1eMGAGR9O6z6cemgLdyCwyZwzawe42PPi6DWJsvMaHe-WTO06hdrEB8lpaUH6sHvcX6SHZMuudOn0JK1tV2lsF5ZgpE4ONI2h5L6bS64TnzxkI5BvWVbb7Tbh_2Ii1hApHA==)
91. [microsoft.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFx4QtuPAtKsvIV821EuDxSxeTMmoIDza7rgTh0YUUG9k8YxNzBOHQRZapYVBTaC5DXvLRxFU7TnxGWKEXacFUYPWXFsTpmyKEYMQHR0U2THCeY6wWpGlEk08s2VHJE7Ib7ysf8sI-m2vkE5RsAIJNGyGyu32GAvFydsxe5ld45yX68wLqITaD4g1dUYJ8iNrjhhsYp43VghtUgm4LRgI0zZ_H8h5PTrgmLwhOKTwf1jCGSVMnRPx7TQ-1ZekSqF2myA2kLx9jt)
92. [itp.net](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFsJuI17rN6NsmWByXQWhjytm2cmQp7Bwx4nWmum0eZ_V-m-IhtQrP2lulvbswYLp45I_NJg_M1QJLp9WsBKlGIkiCupA6l2xkSi4oBJnXFMdKwl-QOpk6KMG8NuqrLpFjwnUMfnASpG9JycxS5c6gfSGl0LT_dt_VB44WAUE-qZbz9cEY0j_M=)

