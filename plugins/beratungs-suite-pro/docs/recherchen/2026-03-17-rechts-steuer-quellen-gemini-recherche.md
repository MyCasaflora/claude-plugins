# Gemini Deep Research Report
Generated: 2026-03-17 08:14
Agent: deep-research-pro-preview-12-2025

---

# Maschinelle Erschließung von Rechts- und Steuerinformationen: Eine Analyse öffentlich zugänglicher APIs und Datenbanken

**Kurzzusammenfassung:** 
*   Die Landschaft der maschinenlesbaren Rechts- und Steuerdaten ist stark fragmentiert.
*   Die Europäische Union und die Schweiz bieten durch offene SPARQL- und REST-Schnittstellen (Semantic Web) exzellente Voraussetzungen für KI-Agenten und MCP-Server.
*   In Deutschland dominieren bei amtlichen Registern (Handelsregister, Bundesanzeiger) weiterhin unstrukturierte Formate (PDF, HTML) und fehlende offizielle APIs, was den Einsatz von Drittanbietern erzwingt.
*   Kommerzielle juristische Datenbanken (juris, beck-online, IBFD) sind durch strenge Lizenzmodelle und Paywalls für automatisierte Open-Data-Crawls ungeeignet.

Die vorliegende Untersuchung liefert eine umfassende Bestandsaufnahme zur maschinellen Lesbarkeit und API-Verfügbarkeit von Rechts- und Steuerinformationen. Obwohl die politische Forderung nach Open Government Data (OGD) auf nationaler und europäischer Ebene zunimmt, zeigen sich in der Praxis erhebliche technische und lizenzrechtliche Diskrepanzen. Während einige Jurisdiktionen auf Linked Open Data und Graphdatenbanken setzen, verharren andere in dokumentenzentrierten Paradigmen, die eine automatisierte Weiterverarbeitung massiv erschweren. Dieser Bericht bewertet die Quellen hinsichtlich ihrer architektonischen Beschaffenheit, ihrer Aktualität und ihrer direkten Integrierbarkeit in Model Context Protocol (MCP)-Server für große Sprachmodelle (LLMs).

---

## 1. Executive Summary

Die digitale Transformation des Rechts- und Steuerwesens erfordert den nahtlosen, maschinellen Zugriff auf primäre Rechtsquellen, Gerichtsentscheidungen und Registerdaten. Dieser Analysebericht evaluiert die Verfügbarkeit, Struktur und Kostendimension der wesentlichen Datenbanken in Deutschland, der DACH-Region, der Europäischen Union sowie auf internationaler Ebene. 

Das übergeordnete Ziel besteht darin, festzustellen, inwieweit diese Quellen für den automatisierten Abruf durch MCP-Server (Model Context Protocol) geeignet sind. MCP-Server fungieren als Brücke zwischen KI-Sprachmodellen und externen Datenquellen. Ihre Effizienz hängt maßgeblich von der Existenz strukturierter Formate (JSON, XML, RDF) und dem Fehlen technischer Barrieren (wie CAPTCHAs oder Paywalls) ab.

Die Untersuchung offenbart ein stark polarisiertes Bild: Die EU (über das Cellar-Repository und EUR-Lex) sowie die Schweiz (Fedlex) definieren den "Goldstandard" mit vollumfänglichen Semantic-Web-Technologien und offenen SPARQL-Endpoints [cite: 1, 2]. Im Kontrast dazu weist Deutschland, insbesondere im Bereich der Wirtschaftsdaten (Handelsregister, Bundesanzeiger), erhebliche Defizite auf. Amtliche APIs fehlen hier weitgehend, weshalb strukturierte Daten oft nur über kommerzielle Drittanbieter (z.B. handelsregister.ai, Dealfront) bezogen werden können [cite: 3, 4]. Internationale Steuerdatenbanken wie die der OECD bieten standardisierte SDMX-Schnittstellen [cite: 5, 6], wohingegen Institutionen wie das IBFD geschlossene, hochpreisige Systeme betreiben [cite: 7, 8]. 

## 2. Hauptbefunde

Die Recherche liefert folgende zentrale Erkenntnisse bezüglich der maschinenlesbaren Rechts- und Steuerinformationen:

1.  **Das deutsche API-Defizit bei Wirtschaftsregistern:** Weder das gemeinsame Registerportal der Länder (handelsregister.de) noch der Bundesanzeiger bieten eine offizielle, frei zugängliche API für strukturierte Firmendaten im JSON- oder XML-Format an [cite: 3, 4]. Die Daten liegen überwiegend als unstrukturierte PDFs oder HTML-Texte vor [cite: 9, 10]. Automatisierte Abrufe (Scraping) werden durch CAPTCHAs und Session-Limits aktiv blockiert [cite: 3]. 
2.  **Semantic Web als Best Practice (EU & Schweiz):** Die Plattform Fedlex (Schweiz) und das Cellar-System (EUR-Lex) nutzen fortschrittliche Linked-Open-Data-Architekturen. Metadaten und Volltexte sind über RESTful APIs und SPARQL-Endpoints in maschinenlesbaren Formaten (RDF, XML, JSON-LD) abrufbar [cite: 1, 2]. Diese Systeme sind für die direkte Anbindung an MCP-Server ideal geeignet.
3.  **Österreichs Vorreiterrolle bei Open Government Data:** Das Rechtsinformationssystem des Bundes (RIS) ist nahtlos in das österreichische OGD-Portal (data.gv.at) integriert. Daten können automatisiert und lizenzfrei (CC BY 4.0) abgerufen werden [cite: 11, 12].
4.  **Kommerzielle Barrieren bei Fachdatenbanken:** Etablierte juristische Datenbanken (juris, beck-online im DACH-Raum; IBFD international) operieren strikt hinter Paywalls [cite: 7, 13]. Es existieren zwar API-Schnittstellen (teilweise auch für KI-Anwendungen wie beck-Noxtua), diese erfordern jedoch kostspielige Lizenzverträge und sind für offene MCP-Crawls ohne Authentifizierung unbrauchbar [cite: 13, 14].
5.  **Standardisierung von Steuerdaten:** Internationale Organisationen wie die OECD haben mit dem SDMX-Standard (Statistical Data and Metadata eXchange) eine hochfunktionale Basis für den Abruf makroökonomischer und steuerlicher Daten geschaffen [cite: 6, 15]. Dies erlaubt Entwicklern den direkten JSON/XML-Abruf über REST-APIs [cite: 5, 16].

## 3. Detailanalyse

Die folgende Detailanalyse bewertet jede angefragte Quelle anhand technischer Spezifikationen. Die "Crawl-Eignung für MCP-Server" wird auf einer Skala von *Hervorragend* (offene API, JSON/XML, keine Barrieren), über *Bedingt* (Scraping erforderlich, XML-Dumps), bis *Ungenügend* (CAPTCHAs, PDFs, Paywalls) eingestuft.

### 3.1 Deutschland: Nationales Recht, Steuern und Register

#### Bundesrecht & gesetze-im-internet.de
Das Bundesamt für Justiz stellt das Bundesrecht kostenlos zur Verfügung. Historisch lagen die Daten als umständliche XML-Sammlungen vor [cite: 17].
*   **URL:** `www.gesetze-im-internet.de` [cite: 18]
*   **Format:** XML, HTML, PDF. Ein Inhaltsverzeichnis wird als `gii-toc.xml` bereitgestellt [cite: 19].
*   **API verfügbar:** Nein (keine offizielle REST-API). Es existieren jedoch zivilgesellschaftliche Repositories (z.B. GitHub `tech4germany/rechtsinfo_api` oder `QuantLaw`), die die XML-Daten parsen und als JSON-API oder Git-Archiv aufbereiten [cite: 17, 20].
*   **Update-Rhythmus:** Laufend/täglich. Neuigkeiten werden via RSS-Feed und Aktualitätendienst veröffentlicht [cite: 18, 20].
*   **Kostenlos:** Ja [cite: 18].
*   **Crawl-Eignung für MCP-Server:** *Gut*. Da eine strukturierte XML-Struktur zum Bulk-Download vorliegt, kann ein MCP-Server diese Daten (oder die GitHub-Derivate) exzellent verarbeiten, auch wenn eine native REST-API fehlt.

#### Landesrecht
*   **URL:** Meist über Links von `gesetze-im-internet.de` oder dezentrale Landesportale (z.B. Bayern.Recht).
*   **Format:** Meist HTML/PDF, in einigen Bundesländern XML.
*   **API verfügbar:** Weitgehend Nein.
*   **Update-Rhythmus:** Abhängig vom Bundesland.
*   **Kostenlos:** Ja.
*   **Crawl-Eignung für MCP-Server:** *Bedingt bis Ungenügend*. Die starke Dezentralisierung erfordert spezifische Scraper für jedes der 16 Bundesländer.

#### Steuerrecht, BMF-Schreiben & BFH-Urteile
Das Bundesfinanzministerium (BMF) veröffentlicht Schreiben oft als PDF. Im Zuge der E-Rechnungspflicht ab 2025 (Wachstumschancengesetz) werden zwar Rechnungen strukturiert (XML, ZUGFeRD, XRechnung) verlangt [cite: 21, 22], die rechtlichen Vorgaben selbst (BMF-Schreiben) sind jedoch klassische Textdokumente. Der Bundesfinanzhof (BFH) veröffentlicht Urteile.
*   **URL:** `bundesfinanzministerium.de`, `bundesfinanzhof.de` sowie Open-Data-Initiativen wie `openjur.de` [cite: 23].
*   **Format:** Offiziell primär PDF/HTML. Über Plattformen wie OpenJur als strukturiertes HTML/XML [cite: 23].
*   **API verfügbar:** Offiziell Nein. OpenJur bietet eine API an [cite: 23].
*   **Update-Rhythmus:** Anlassbezogen (bei neuen Urteilen/Schreiben).
*   **Kostenlos:** Ja.
*   **Crawl-Eignung für MCP-Server:** *Bedingt*. BFH-Urteile lassen sich über OpenJur-APIs gut abrufen [cite: 23]. Offizielle BMF-Schreiben müssen als PDF geparst werden (OCR/Text-Extraktion erforderlich).

#### Handelsregister
*   **URL:** `www.handelsregister.de` [cite: 9, 24]
*   **Format:** HTML, PDF. Strukturierte Daten sind laut offizieller Seite "ein unverbindlicher Service" und oft fehlerhaft bei Altgerichten [cite: 24].
*   **API verfügbar:** Offiziell **Nein** [cite: 3, 4]. Es gibt strikte Abruf-Limits (z.B. 60 Anfragen pro Stunde) und keine Programmierschnittstelle für automatisierte Anfragen [cite: 9, 10]. Kommerzielle Drittanbieter (z.B. handelsregister.ai, Dealfront, Firmenwissen) bieten REST-APIs mit JSON-Responses an [cite: 4, 25, 26].
*   **Update-Rhythmus:** Echtzeit/Tagesaktuell.
*   **Kostenlos:** Offizielle Web-Recherche ist kostenlos (seit Aug. 2022) [cite: 9, 10]. API-Zugänge über Drittanbieter sind kostenpflichtig (Pay-per-Event oder Abo) [cite: 26, 27].
*   **Crawl-Eignung für MCP-Server:** *Ungenügend (offiziell) / Hervorragend (via Drittanbieter-API)*. Der direkte Scraping-Versuch wird durch CAPTCHAs blockiert [cite: 3]. Ein MCP-Server muss zwingend mit einer API (wie handelsregister.ai) gekoppelt werden [cite: 28].

#### Bundesanzeiger
*   **URL:** `www.bundesanzeiger.de` [cite: 4]
*   **Format:** PDF, HTML. Finanzberichte sind oft unstrukturierter Fließtext oder sogar Bild-Scans [cite: 3].
*   **API verfügbar:** Offiziell **Nein**. Auch hier müssen Drittanbieter wie Dealfront oder eBilanz+ genutzt werden, die Text-Parser einsetzen, um Jahresabschlüsse in XML/JSON zu konvertieren [cite: 4, 29].
*   **Update-Rhythmus:** Täglich (gemäß Einreichungen).
*   **Kostenlos:** Web-Ansicht kostenlos. API kostenpflichtig (Drittanbieter).
*   **Crawl-Eignung für MCP-Server:** *Ungenügend*. Automatisierte Massenzugriffe sind technisch extrem erschwert [cite: 3].

#### dejure.org
Dejure.org ist ein privates Rechtsinformationsportal, das Gesetze und Urteile extrem stark untereinander vernetzt [cite: 30].
*   **URL:** `dejure.org` [cite: 30]
*   **Format:** HTML, Vernetzungs-Links.
*   **API verfügbar:** Ja. Es gibt eine kostenlose universelle API (Vernetzungsfunktion), um Textbausteine automatisch mit dejure.org-Links zu versehen [cite: 30, 31, 32].
*   **Update-Rhythmus:** Kontinuierlich.
*   **Kostenlos:** Ja (werbefinanziert) [cite: 30].
*   **Crawl-Eignung für MCP-Server:** *Gut für Referenzierung*. Eignet sich weniger zum Download von Volltexten, aber hervorragend, um in LLM-generierten Texten Zitationen (z.B. "§ 35 StVO") automatisch mit überprüfbaren URLs zu versehen [cite: 31].

#### juris und beck-online
Die Marktführer für juristische Fachpublikationen und Kommentare in Deutschland.
*   **URL:** `juris.de`, `beck-online.de`
*   **Format:** Proprietäres HTML/XML im geschlossenen Backend.
*   **API verfügbar:** Ja, aber restriktiv. Es gibt API-Schnittstellen (z.B. für Kanzleisoftware oder Tools wie lawlink), diese setzen jedoch aktive Nutzer-Lizenzen voraus [cite: 33, 34, 35]. KI-Integrationen (beck-Noxtua, juris KI) werden nativ vom Verlag angeboten [cite: 14].
*   **Update-Rhythmus:** Laufend.
*   **Kostenlos:** Nein. Strenge Lizenzmodelle (Abo-basiert) [cite: 13].
*   **Crawl-Eignung für MCP-Server:** *Ungenügend (geschlossenes Ökosystem)*. Ohne Enterprise-Vertrag und API-Key können MCP-Server diese Daten nicht legal und technisch problemlos indexieren [cite: 13].

---

### 3.2 DACH-Region (Österreich & Schweiz)

#### Österreich: RIS (Rechtsinformationssystem des Bundes)
Das RIS ist integraler Bestandteil der österreichischen Open-Data-Strategie.
*   **URL:** `ris.bka.gv.at` [cite: 11, 36]
*   **Format:** XML, JSON, HTML [cite: 37].
*   **API verfügbar:** Ja. Das RIS bietet OGD-Schnittstellen an. Daten können über das Portal `data.gv.at` via API abgefragt werden [cite: 11, 36].
*   **Update-Rhythmus:** Echtzeit / Tagesaktuell (Gesetzblätter) [cite: 12].
*   **Kostenlos:** Ja, unter CC BY 4.0 Lizenz [cite: 11, 12].
*   **Crawl-Eignung für MCP-Server:** *Hervorragend*. Maschinell leicht verarbeitbar durch strukturierte XML-Metadaten und offizielle Schnittstellen [cite: 12, 37]. Limitierungen wie kurze Abfragepausen (1-2 Sekunden) sind zu beachten [cite: 11].

#### Österreich: BMF.gv.at
Das österreichische Bundesministerium für Finanzen bietet für spezielle Use-Cases (wie das Register der wirtschaftlichen Eigentümer - WiEReG oder CESOP) Web-Services an.
*   **URL:** `bmf.gv.at` [cite: 38, 39]
*   **Format:** XML.
*   **API verfügbar:** Ja. Für Softwareentwickler gibt es z.B. das WiEReG-Webservice [cite: 39] und die CESOP Web Service API (REST, JSON/XML-basiert) [cite: 38, 40].
*   **Update-Rhythmus:** Echtzeit (synchrone Abfrage).
*   **Kostenlos:** API-Zugänge via Unternehmensserviceportal sind für Berechtigte teilweise kostenlos, unterliegen aber strengen Zugangsvoraussetzungen [cite: 39].
*   **Crawl-Eignung für MCP-Server:** *Bedingt*. Technisch hervorragend (XML, REST), jedoch meist an eine Authentifizierung (API-Key) und rechtliche Voraussetzungen (z.B. berufsmäßige Parteienvertreter) gebunden [cite: 38, 39].

#### Österreich: WKO (Wirtschaftskammer Österreich)
*   **URL:** `wko.at`, `data.wko.at` [cite: 41, 42, 43]
*   **Format:** HTML, CSV, RDF (Linked Data Ansätze) [cite: 43].
*   **API verfügbar:** Keine offene zentrale API für alle Firmendaten, jedoch gibt es OGD-Ansätze (`data.wko.at` für Unternehmensidentifikatoren) [cite: 43]. Scraping-Scripts für WKO-Firmendaten existieren auf GitHub [cite: 44].
*   **Update-Rhythmus:** Laufend.
*   **Kostenlos:** Firmendaten-Verzeichnisse online einsehbar.
*   **Crawl-Eignung für MCP-Server:** *Bedingt*. Offizielle Linked-Data-URIs sind nützlich [cite: 43], Bulk-Datenabrufe erfordern jedoch oft Scraping [cite: 44].

#### Schweiz: admin.ch & fedlex.data.admin.ch
Die Schweiz setzt mit Fedlex Maßstäbe in der semantischen Aufbereitung von Bundesrecht.
*   **URL:** `fedlex.data.admin.ch` [cite: 1, 45]
*   **Format:** RDF, XML, JSON, CSV, HTML, JSON-LD (eingebettet nach schema.org) [cite: 1].
*   **API verfügbar:** Ja. Ein offener SPARQL-Endpoint (`/sparqlendpoint`) und eine REST-API erlauben den direkten Zugriff auf den "Knowledge Graph" des Bundesrechts [cite: 1, 45].
*   **Update-Rhythmus:** Echtzeit/Laufend.
*   **Kostenlos:** Ja (Open Government Data) [cite: 46].
*   **Crawl-Eignung für MCP-Server:** *Hervorragend*. Fedlex ist durch seine Graphen-Struktur und SPARQL-Schnittstelle das perfekte System für LLMs. Komplexe juristische Zusammenhänge und Verweise können nativ in Graph-Queries übersetzt werden [cite: 1, 47].

---

### 3.3 Europäische Union

#### EUR-Lex & CELEX
EUR-Lex ist das primäre Portal für EU-Recht (Verträge, Richtlinien, Verordnungen, Rechtsprechung). Im Hintergrund arbeitet das Repository "Cellar".
*   **URL:** `eur-lex.europa.eu`, `data.europa.eu` [cite: 2]
*   **Format:** XML (Formex), RDF, PDF, HTML, JSON [cite: 2, 48].
*   **API verfügbar:** Ja. Es gibt Web-Services für registrierte Nutzer, direkte RESTful APIs sowie einen äußerst mächtigen SPARQL-Endpoint, der auf semantischen Technologien basiert [cite: 2, 49]. Das R-Package `eurlex` erleichtert Forschern den Zugriff [cite: 50, 51].
*   **Update-Rhythmus:** Täglich. RSS-Feeds benachrichtigen über Änderungen [cite: 2].
*   **Kostenlos:** Ja. Freie Wiederverwendung von Daten [cite: 2].
*   **Crawl-Eignung für MCP-Server:** *Hervorragend*. Über die Cellar-REST-API können Dokumente samt Metadaten effizient abgerufen werden. Die maschinelle Lesbarkeit (Formex XML) erlaubt präzises Chunking für RAG-Pipelines (Retrieval-Augmented Generation) [cite: 2, 48].

#### EU-Amtsblatt
Das offizielle Publikationsorgan der EU.
*   **URL:** Teil von EUR-Lex / Cellar [cite: 2].
*   **Format:** XML, CSV, PDF [cite: 2, 52].
*   **API verfügbar:** Ja. Über das Open Data Portal (`data.europa.eu`) lassen sich Amtsblätter in Bulk (als CSV mit Links zum XML) herunterladen [cite: 2].
*   **Update-Rhythmus:** Täglich (an Werktagen).
*   **Kostenlos:** Ja [cite: 2].
*   **Crawl-Eignung für MCP-Server:** *Hervorragend*. Gleiche Infrastruktur wie EUR-Lex.

#### CURIA (Gerichtshof der EU)
*   **URL:** `curia.europa.eu` [cite: 53, 54]. Rechtsprechung ist auch in EUR-Lex integriert.
*   **Format:** XML, HTML, PDF [cite: 53, 54].
*   **API verfügbar:** Ja. Über das Cellar-Repository und EUR-Lex abrufbar [cite: 54]. Es gibt spezialisierte Datensätze und APIs für NLP-Anwendungen im juristischen Bereich [cite: 55, 56].
*   **Update-Rhythmus:** Laufend.
*   **Kostenlos:** Ja [cite: 54].
*   **Crawl-Eignung für MCP-Server:** *Hervorragend*. Curia-Dokumente sind stark strukturiert (Kontext, Argumente, Entscheidung), was NLP-Analysen und KI-Einsatz stark vereinfacht [cite: 54, 55].

---

### 3.4 Internationale Quellen

#### OECD Tax Database
Die OECD publiziert umfassende Steuer- und Wirtschaftsdaten.
*   **URL:** `data-explorer.oecd.org` [cite: 15, 57]
*   **Format:** JSON, XML, CSV [cite: 5, 15].
*   **API verfügbar:** Ja. Die OECD bietet eine RESTful API, basierend auf dem SDMX-Standard (Statistical Data and Metadata eXchange) [cite: 6, 15]. Entwickler können Abfragen filtern und das Format (z.B. `format=jsondata`) in der URL definieren [cite: 5].
*   **Update-Rhythmus:** Laufend (bei Datenaktualisierung der Mitgliedsstaaten).
*   **Kostenlos:** Ja, unterliegt den Nutzungsbedingungen der OECD [cite: 5, 16]. Limitierung: 60 Queries pro Stunde [cite: 58].
*   **Crawl-Eignung für MCP-Server:** *Gut*. Die API ist standardisiert, erfordert jedoch die Handhabung des SDMX-Schemas. Die Limitierung der API-Calls erfordert Caching-Strategien auf Seiten des MCP-Servers [cite: 5, 58].

#### IBFD (International Bureau of Fiscal Documentation)
Das IBFD ist eine weltweit führende Datenbank für internationales Steuerrecht.
*   **URL:** `research.ibfd.org` [cite: 7]
*   **Format:** HTML/PDF im Webinterface.
*   **API verfügbar:** Nein (keine offene API dokumentiert). Geschlossene Plattform für Abonnenten (Identity Federation / SSO) [cite: 7].
*   **Update-Rhythmus:** Täglich [cite: 8].
*   **Kostenlos:** Nein. Hochpreisiges kommerzielles Produkt [cite: 7, 8].
*   **Crawl-Eignung für MCP-Server:** *Ungenügend*. Hinter harten Paywalls und Authentifizierungsschranken verborgen [cite: 7, 59]. Nicht für offenes Scraping geeignet.

#### UN Tax Committee
Das Steuerkomitee der UN erarbeitet Richtlinien und das UN Model Tax Convention.
*   **URL:** `financing.desa.un.org` [cite: 60, 61]
*   **Format:** Hauptsächlich PDF-Berichte und Arbeitsdokumente [cite: 60].
*   **API verfügbar:** Nein. Es gibt Diskussionen über den Aufbau von UN-verwalteten, zugänglichen Transfer-Pricing-Datenbanken, diese sind jedoch in der Planungsphase [cite: 62]. Es existieren Drittanbieter-Datenbanken (z.B. *Tax Treaties Explorer*), die Verträge analysieren [cite: 63].
*   **Update-Rhythmus:** Periodisch (nach Komiteesitzungen).
*   **Kostenlos:** Dokumente sind frei verfügbar.
*   **Crawl-Eignung für MCP-Server:** *Bedingt*. Der Server muss in der Lage sein, unstrukturierte PDFs zu verarbeiten (z.B. OCR und Layout-Parsing), da keine maschinenlesbare XML/JSON-Struktur der Resolutionen oder Verträge angeboten wird [cite: 60].

#### Doppelbesteuerungsabkommen (DBA)
DBAs sind bilaterale völkerrechtliche Verträge [cite: 64].
*   **URL:** Keine zentrale Welt-Datenbank als offene API. Zugänglich über nationale Finanzministerien (z.B. BZSt in Deutschland, ESTV in der Schweiz) [cite: 65, 66] oder das IBFD [cite: 7].
*   **Format:** HTML, PDF. Formulare zur Quellensteuerrückerstattung liegen teils als spezielles QDF-Format oder PDF vor [cite: 65, 67].
*   **API verfügbar:** Nein, nur über aggregierende Dienste (wie das kostenpflichtige IBFD) oder über die EUR-Lex API, sofern es EU-internes Vertragsrecht tangiert [cite: 2, 7, 64].
*   **Update-Rhythmus:** Bei Ratifizierung neuer Verträge.
*   **Kostenlos:** Texte bei Ministerien kostenlos; strukturierte Datenbanken kommerziell.
*   **Crawl-Eignung für MCP-Server:** *Bedingt*. Erfordert das Crawlen multipler Ministerium-Seiten. 

## 4. Quellen

Dieser Bericht stützt sich auf die folgenden evaluierten Forschungsdaten und Dokumentationen:

*   Fehlende API des Bundesanzeigers und Herausforderungen bei strukturierten Daten [cite: 3, 4].
*   Drittanbieterlösungen (eBilanz+, Dealfront, handelsregister.ai) für Registerdaten [cite: 26, 29].
*   Strategische Nutzung der Firmenwissen API [cite: 25].
*   Restriktive Lizenzmodelle und API-Zugänge bei juris und beck-online [cite: 13, 14, 68].
*   Integrationen von dejure.org via Schnittstelle [cite: 30, 31].
*   Open Data Projekte (bund.dev, tech4germany) für Gesetze und Handelsregister [cite: 9, 17].
*   Gesetze-im-internet.de Formate und XML-Struktur [cite: 18, 19].
*   Verfügbarkeit von BFH-Urteilen via OpenJur [cite: 23].
*   BMF-Vorgaben zu E-Rechnungen und strukturierten Formaten [cite: 21, 22].
*   Österreichisches RIS und OGD-Prinzipien (data.gv.at) [cite: 11, 12].
*   BMF.gv.at Web-Services (CESOP, WiEReG) [cite: 38, 39].
*   WKO Linked Open Data Ansätze und Scraping [cite: 43, 44].
*   Schweizer Fedlex: SPARQL und RDF Architekturen [cite: 1, 45].
*   EUR-Lex und Cellar Repository: SPARQL, REST und XML-Formex [cite: 2, 48].
*   R-Packages zur Nutzung der EU-APIs [cite: 50, 51].
*   NLP-Integrationen bei CURIA Gerichtsdokumenten [cite: 54, 55].
*   OECD Tax Database: SDMX API, JSON-Format und Limitierungen [cite: 5, 15].
*   IBFD Plattform-Restriktionen [cite: 7, 8].
*   UN Tax Committee: Publikationen und Datenbankinitiativen [cite: 60, 62].
*   Doppelbesteuerungsabkommen: Verfügbarkeit von Texten und Formularen [cite: 64, 65].

**Sources:**
1. [admin.ch](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQH8Qw36yxmOFfI5OrRTgaKs7paHzCHiHMJaEvuDns4lOKLD_iteVPj2CwON-eYsvJ7wRA45pJHTAdzrU9ij877zrxNlehk7wGZtjbmzIJOeBeGTou-9xtrwwYsnPg7GVLCAZbsk_4Dh)
2. [europa.eu](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFF8nGwCIgvXn2IaS-89zcvzGAWZS1PVW-DCE5jmbSAGfTP_5NtNu9RbZNgbc6vnTaRJb1I8ipSXkUgnwwOmNChiDVPeESL87QwUQrWPSVNSuRXLkXt--U_RFS6ftBh1WZ_WfuOPYSnnl82qekYS5ju0Js8ljMiTP5tLHl2KTkcRig5Aubik6qKyA==)
3. [handelsregister.ai](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGCJuJd1zlcP7KV0YZmri-RtTQQoctzd5BZw8ltZM2-TAdzdJopVgIspgMmn5ApDvCdMG6Xr789_YYdDC1t5yH8uO3nsgMr4_3DNMVvM_7jOiRSjffk3mvG_EiLCZGI_7vJQNzXulQ8cvUP4Z86UX0_3cZV6y-CzeOAtrA0kil9mZkQNHmOyT0mWYdrQ4XIAM1iNHFA)
4. [echobot.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEXZGWa0fma5OlKL1W1_Gdl8w6wGuvqKWjn5aVVHIHL89y1ClWUeE5OSBT0poA3Qiwu21n6fON1vRY9vhV11-I7O0CNDZcO2XdvtyuRf0T3SDm81w7G_EDhT9aYnDZfG0JA5tD1IvEt1ViKNy2u6gP2yUAvzR6jhQHuu1TJzcWtMqO-mmGwvHsHP7bRIzYG)
5. [oecd.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFU40VsKlzsVfSOo81tF9VuAW3LOWgNO-0aJUVldljcTVfQzDdNMcQqffmWIB8xjApwvpard4mKFN4sLwHkS-VxxQao7EyXCMKejMOnVg3iM8v1ClJEkEtf64ZhRccJVAw2nKbU5xeHED0nJax8m5VQs0hHCSppncGGVhA=)
6. [sdmx.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEBhRY_cscdQZ6m_nqGynTRfdwayvkHDRD0BJCvTXPSdxAaWmSBI0ff46Q80Q_TXYHanNuCbhPSWKC-7gpi8P2l_4tlufBG_6s7dZfGcTKgU9YoW2Z87-QGHw==)
7. [ibfd.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQG5LDd9jGCprVMUYiqCXrzz1p3dACKbRY7tLEQ4r-hcMykcyZ38-2axt69US85ZvTDhdoZWXs7Mg7H4ZaF9bYnw_FlvPvCoCtQyUEy3-Sox)
8. [ibfd.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQG_4qiYpeRPdDAxF-c2bWxepIrLeGO1-9UmtfjThJJogpVZEeIgTZS3J3jZ97x3_pe9Myi820n9p5L3eHCSIWhbi1HO7_P-tkFOY0enHZLh9RF3Bc2HnHty9i9MvfaE5g==)
9. [medium.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGgSrFluzdJHNf7sFDxKGi2-BxDblWp0Fgkam2hixHwufQjPXlunQmrgL50C7xApkWuSOmiSVsxxbCUXZomUNWOzMQma5zUYsi-y56if1aX3Khj-Nkd1t2Z0KIdr-X4_Xflnn2SbMfwH4lmW7m2I0k91yOxt3yLXtK-dHAPE6zhB-9WMYtmm3OVZ_kLjA==)
10. [golem.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEK--ji4iKjFc3DVZHIfNW8h-1Zo7rD6TaXfk7CoKSNvIpL_UPvqAVsS5malJ09wzaB88NRN6OgI-oM4PQGffzvZq9WodOEbHR_xvRmZQM13RF1qka4rE3HRIIEKh2wd24MI9Gs9tA2wPpgojr1TKv5PshxSp58i5Ni55y8ae2CcbF8g__hXoncY-kA6ADCZpWP6VOLczgFDkDI2KkfYFs=)
11. [bka.gv.at](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFErpkeNTM9sDWgEK2hkKIeNYn6lD0wYfBDloxP8dIe2eaAyW4ztlTMiL4uMc1Va3IPJxDGomnabaqt-MDxN_nB6FiS0Fv0QNOpcVGqHHJoSYR7OIoi86DyBOg=)
12. [bundeskanzleramt.gv.at](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQH76Xl5TMVgAFhN2vYdQ5PSyMT5ONtZJzWsvpHX_VWgAW24NGhn94oygxRZw_Bge24FQIeWHumZaHNcrZjYIxnV5AuJreW_PNtH2LUqQsy9-6QvgY1ol1YPrsnmf8WU0uB0q67oyJEjs2ueUt934z9Mlh_5i8iSBpmY_x-gLl5L35F5O5rxw7sdhDNAyDmP5eRE)
13. [law-school.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFYaFJUZIckmd2Lwf8JoRMn4D4Ligm9raZ4ZLNJnx5jlK4DezkLPSIcO89AzZuU2jerc4RG7FrbwXQ7EX-XsLPPBY3IweJMyDeNKlVUZ9G_gC1kzCX5l1i0WVWLiEWaJ7agEQIfRlC_8ygs58XbQ1QfiJVvxhbxDNioHyP_3d_b9-suwcGvI1mxxbd6eLF3X5aMQ8NkgClVSy7jzbHBd36hhhupibJOEtK0cwyM9RVMK-_ijenqBVw=)
14. [legal-tech.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHJG6zguhI4zNMlrqHgkgp6bMy1hVKNMRsFOoudyOEGq6_br84Zl2srA0UY8aUMVHJzX1Ozjj0MzNJjsSa9LDjRAyAD-OGghAFNqre1D53XqewqJphBcMIQvydKHweKSsrThZ8VYTPdaHSA)
15. [oecd.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQE5Hz4s-ww7pJ8DdR4OHz8W1PfkWb1R0jkEoYFRUYciy9wnpwRg3XyQ5jtsFcEKmNbzE7hzLQsUizF-m9XkYtpvsI4WpGi-zeMltixzVo2dBDnSWbuH8ddofg==)
16. [scribd.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFw52lhjCDRWsexxGZKNqJaTHv1-CHl2FdINqEg0bSNBcm10yDF8A4rvLkjsV8JtG_OYXk-eUqCved_7KqDJA-DaAUd_XI8lT2yLqKmnQJ78iEiedUlhf7lzw2wX06bVaoV-dqzoFa9lh54Em0aWbBbTlg8sGbQ7ouZNQ==)
17. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHTfwp3MgltKJDu_j2u75zuFXPoiG6EAQOk-7M6BT3N3l3PCzxZWTe2ND1H4mu0WUH5_GsYuRgpfk_NMSKafcxYMWKpTTINSeYrtv9jgIb_D0qhgX54_x1w95TBXu6oMN0AFZo=)
18. [gesetze-im-internet.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHG4NIbkCOZVuZ4tX1K_eOTGxMEFJn99cGkUVTFco9qfbHMrL43TxhgPLeknt9shQkA0KWAdHOIgZjy8zr58kn0mxs9YGkbMs5YZyootZq4ch-b5gu2RBt6)
19. [gesetze-im-internet.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGvSeUtbWPQf5PZy9D9EZQhuQ1pTP8EmAO1KmwDfvHFbvs0MGre-ifmb6HtQDFl2vLauqL6Rv4l9pKDPNH7HjYt4tn1hS35quJXq1RfL14en8zw1Msw3Ai7u0eS_llLZl8J-y0=)
20. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHAP1Wj1FyBAzDVa4Q97i9Zw3CkeKL6vJPyvuuyQPtE21enKpm0Fxo_DtegUXp33AfDhY_wlo_It1drTrrVmrK_Z9aP-LITBfcAy_kPyLXL1e2y73aoE0GPE5VEpSc1ag9kSQmx)
21. [cleartax.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEN1TonCLfz3S5frO-v03x4ZsgK63pJduyXoe_hqZK3vg6ommdEBOw4IGq7NrgDptGEjo2-pODhS9ChB4Tvq9IIYv98aqNXQ6pT-mSg1HRmFA6Nj8wzMtA-pGOQ0vTEt4lzZjuJmA==)
22. [seeburger.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFaFDmAEnvB9797X0iSHjOwYgb9wzvAYWI7GvQ27KOvgFJ7msYR2BXQ-4Uh6L6vj6Wx19XYMxMb_BiuxwlXM1q7ByaxS5KmOUcA5x085IxZ_NvW6zHazfoNTXFj96_Hj6kZztCtXPu_BR7wfGrwIDjwn0CtoGayhLGo--_zVuaWhK_6llfbRTFdivsvt2xKobUGCCEUyOqPIA3aE7v-tGI49Q==)
23. [openjur.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFMhrqG9REQfLCQ4hmi5x9iYu-csseJDjRPmRg6TyDJlmAIrXPNY8_aFLeXC3h81h8cfmlMP_3mcCZ-Hxs2xv4wx-7RC-MJWttElwbSIlsqCPOiSqzdFA==)
24. [handelsregister.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQH-AJkACoCoxFMX6bZ_3B7bleLFXtrCypeqjJCIJGU090dUZbalErGhplESvhWMSmJLc-MkZrmEx87m94FlvmVObrtGrhfKiHLVX6X9rHv9-2dJ_Jk=)
25. [rockstein-consulting.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFss3XGeU-Xyu2soY4pSNaS9aZdYLSC2vKV2-hjGMBmQ9FookIbNxbV9wMrzvq3mCqlKKDgQY2lFQT5R9FzFgowY282C1p1jruig11yJPloLVVPQ8hO_l35gDLUfADB7Dh-WRcHnB4=)
26. [handelsregister.ai](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEsSqkRKhZS8V9ec2H2ZUFUNZTARz_acvy8bzsZjfACmkZAZFGWTQtQ_P2fwQ3q2azi-bhbWdvGMYOY7bxcy6voCAGfoRrKpX25MuUJNNR8Zw==)
27. [apify.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFmhsH_7NQ9fiQQwIGBQ9AQIYXjv0H3SFzGFf7M-bnTypKv2DkLXn0fgsvPEOexed1cWeZNmw1HK546TPJpHyOkk39dH1lhPV-OUSth4vTxKtr_cwtcqHNUorMQ3BUFyko1XCU=)
28. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQECwY-EQuodsiQ5xiGAOCIFwx-maVGltzyfXjn6z1Dnrauf9if7an6nakUbvaFXa7nVUzlqpLTOeWIz0UulZjOxpgyjVQzu5fYzpVeI_0EoninzSPzyeyeo_7Rk5sABZyzwVdH9gbPQeXMw)
29. [ebilanzplus.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGqUZ0wIdJMRbtNS7ApiNlWFnwUkN4kwsgiUFNDnQGC1cTZMgE-djQHPg-Wu7xiyU9Bq8cqxtepN7vUJXXU28xSfJnIdvVZSL8FZ_TeMJV0ve8V-TDjB1rRIOhNFE_OCaw=)
30. [wikipedia.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHYtP06X4AnVmCrO0aHmkdMuBoLR5yN555lmHMjkABL9YIJ2ZvkwDRHf_a1e6MMQZ2AzLTenZB3gQzj-qvp8pzkl9IVvjnlC_NJYxJ7_D1YxlcNg-uk76v4WIjN32k=)
31. [th-h.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGVwh6Tm7EwAZo5pPigVu7V0SQX6aRg0VeFO9vk6CKe2K36nQ4aiDVMWc1x2iZ0V-dvdHkcjyAlWd8EL6iQvj3WXKKX5JMn8WwWAVAkqbnv0v-1pLWqei6sNXVcpDGFmQ==)
32. [typo3.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFfJXJZzMLkJRWCf-VesL17urzGJpEGgQSE_Pyoy5qbGVPSm11wXv93ZrIA3h6zNPBhPdaW8R7u3epUxAqk6qS36KTW0GLhM_vPvTkTkCjOB7md5YmmeO4mqKx2Ej_2CrwDTVTRUs8=)
33. [anwaltstag.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF5icpIQNyNOKfPhAj9hTUTJyGlyRhfIhR4O0pM-fS-f3GkugovzAhU-ov7TWqENXZaurxg3uOc6xpJeKhYMESpOab2NmiKp_xbUXSJgmeeTJB20MAESHPL8f79pHLHHbPvZhyF0M0cYsjTJMPVOZoCTLh_Sj4b)
34. [lawlink.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHxg5RpBd9-WtC6BpsYXBgklTI1uCabvuxKg6Lk6jAqfDvewxinsoi37_oGPYswC0Zi2d9HsQUHwEcSBELplsjdSFG4OSogxAV9SXu1ZQIKseM3)
35. [legal-tech.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFsnUp4GA0xhV9_h0AaKlrYo8FM3cCzTHP9PJDPR1S3-hV4nfpp5_Ps4O32V8X4phD31ERPW4kuw9fgpDWj8ooMb-ly_2Fbxqix52GmacJNdrl4h6R7673TSjb6ZWkbrd4ovV-ynlvJfhqF-fvlkl9Yh4pNnYbcuuoK-7nWGD_fGl8RMiyfwA1-LESqf5-s)
36. [europa.eu](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFP28lIgYcPulpmZAYcG-vKohXU7gtvdSFicI02Brlw_X3UTj0sxHhXDsimRRq7G0a7xnlI5QT5EmGsqg-sAeW-sha32x0pN6EsDP-t0DyscgZRdXzhqM0SeTn8s11BIKUsFDlc0wz6Hj-w8bmN-lXOe-7n-XFL4HELQ7uKiCkZ8XQULDqHykvf3TDF)
37. [noe.gv.at](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGtXKHOdFc5cfIbZnII-b27CKIk528quUZ6r3NWPTX8WjpV4piH05d0FjPRgkpaEHXorZ3Xnm7fDfFQzUY2GoMjUSag4INzSHhH1-xUSgVtXOiTMbwi_-3fgahaloHzM9FAmRtIDfcwYX7BH10Tw_B44NHb7TDrTcMSgw==)
38. [bmf.gv.at](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQH_7wM7kXAVzwBtsFpjGwlM9rJ5407G28hrHXBhHXnCQe4w_MKM-K99kK2xPca1qzuMCtm7DW0pVOoKfB0pXPXp9sYjMM-z8PRGcYtW57Q_1OW04S5YQzbAWk7qDZRttkG0wfiO3dD9jQJO70kMffgLtPxaQNHxzvJVxHXfhMM6ivbh8-A2E8efZGJA75bDrNXrqA6gldpuuN0B7q8Y)
39. [bmf.gv.at](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGqjZoDspACLTc8HrusQAXg_IObvM_eIJX99TthWUg4ApJ272l1IWTad0zsTPXciCR0K0ljEvKFWaQaPow2UqLRGuWgUau2yiL3LkGVW26XUXN0zF4u_qwETmIYI3AUhVYNvBKbyynXIqEos8Xh1IY8LDDEATnoog==)
40. [bmf.gv.at](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHfK40vgq5nEdpfnyomAIjfM1bCPrC1cIMpha45sXYFNnrImsMaAWAsKI5FRQ7_onf2FwArhVgVIFxutYV0ZvWMF4HStneDZ0ib7HmDptsaDOBBs-XTXi82E7zvwjBsDSYeAIeh0-B40-zSGQcoLjlFZr2tFx7uzc7vNlr84HLAaXalYpnd1Sy35a6-woZMK0-Th3Ufb0clwHyfZq5J9iw6VztUR16rKkh_v08wSETHjCyTwj0HiIC_BRYgwwL-uqZ1WT4BhW4QH1Q5wk4EB6aGwNODqEvgjA3IDbwNbpGP0u7b9bAyc-xGZpJpTXHClcQ_GiidfnA1TVmjAUNbEyMmpBuyCK14E073LVRM)
41. [wko.at](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEmO2SP1WH_OOUHvz_VoKI3zmy17EDCNimyvqlDw6c4az_CX51DIkIuchXcUr6Lmwrkh4SsYmpgcMrzXEvsgUUebcwv__gDfNz81M1ww4mW4yuiLMaMNWsryQLbMMct)
42. [op-wintersport.nl](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEWciQ5dJQ95b2mwNwxF87SVmqK1behepGUFWZT22RCW4ID5wP0nACzR8z7tx_93IxNZjTDtMwfqgMDqE36lGajd_cKt_5vfXOTExnBcduJqbotsOzWEqiCMgnis9GBbCX3HzicGvGZ7k-0C85OniccFQ==)
43. [tuwien.at](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQG_QJHayZW1Fh5ebtiPhIK5ZBJxKEj2CMhHPa0pa62fxKhxlLElES_jIV0qEz_f-lYITLmiXHhxAkCAUIvWxXMyZWC7m4O73Nvkl6IV6HOC-1if1jYhYmZg-wC1RAfkMVRFFnKv_C0QcTDClrySvd-bVA1zxqnMWziEc3RrMwSIKpYAQsc8vFGiTtc1oXr1wM5-v0vcekaywfICdCgyqV4lafVpp4grIU5QUxrhopWyga1b-NlhccwmesYQZIKPbgIJLtOpp8S6MpP7)
44. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFYlLHkFo5DhVHAclcMyCntL8jEaj4dlRf3tj460DWjbUnyzDxZWa7T-i36qru0a-DNuWTlkoqjuy5H2qUAoG1N9UE8loe8kxr75-UjjFrcRsZj5Mcef7LYErPuEW1I-FXFpmb6PsEjcdqQ3Jf44XOp8JaFnuYIQ7oIdKAmD7EQs0HD6iIYkpOBnw==)
45. [admin.ch](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFSQkbpJvlR41u6CGgvrQ1cuq25La6mUsn8gLBn853sb4oTaOSqK03aQzZlMX_v4PaPg8jgY_RZDs62VWVD0eicQjHsqPiSJbWcIDx89WqgzhcAhQzjjclE9wl1eKYaNsgX4QVLAFMGu-vEdr6Zsgzq9Em1Ludw9b8W6iTWuAk3AI7D6Ko0sxhPzHPp)
46. [julsraemy.ch](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF_c6WcgDIOdjLQwiL4BlFt8jXo-2H4CkD510myv-ztnGyx6mswzDl97a1rilnoZwRgIJYOAns2Tln1nKjhgYwv9oFfn9CxmNbAcJ5q_U-EjYeAd1uCpyOPpgiBFP3Vi2zZ99plSQejy5o=)
47. [admin.ch](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGB1LycBJnnb9AVBdtetCXXMB70EkyRdy1LLrv313jGJVaNspjLX8NCLkNjCgozvDV28ql85lcLA47abMNJkd-3dKoDUDgs7FMLLO9h_sUVUdeQmFizqJ8VNYnyFfcluX6VYKs-9thaApA63bxZ4TZ_UbD7)
48. [europa.eu](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHTGb_w-wC_wC6IrAkb6Fa_wdSIph4oJhwQ53G5OkapUclRZdvezKiY72H7rw3V3GGDZvuplkMfygwrEs93749SI1oqLUhcbAzgYynu7n0Kh8SmFzsrFLy8sHs-dAHmdFRm-Ww_5d7X4gyVaK2HhDOG71pGJXzO0M7Wpkdt)
49. [openlinksw.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHICIXDb5SCFD39YRlE5JcUTT5Dg-CktvF1eOk5hACnpcYru26V_BWHO8eysO_yLPwqKf2pnL2kl9SlO0ttJOsYEA_U08PGVpNHRsk2iucwGPeVR5ksLP6ai7i5XIW3BilxCJ6oRejdgGuCUCRiu1DoD31iAEmsqNnrZqoVUQo=)
50. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQG1-KpSwAEWLa0vPfsNSMiYbqVk1AQNurM__LOWiHspM1v7vYqNkoAs5Iy3sAfOafvT2BkYYx6OjJqlwAcxNhINNkvJEjYZ6mdSf-eaYnEZYdeCFeLSHFt7EJBt)
51. [tandfonline.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFJN6MuQFkJk4hVfiEZqD8AEDzLr-lv3IcMM727PWp8Wm1dCGuQa455B9d0oGAJpdMG1A8qX9_W_0poJ4vn8PYm_q7rkkvyOc5eeigeukehiGADbjB3sEkrPSnQLQmDYxaCngKhtUgVtWNhQNm2GT5UQJKj5R55sg==)
52. [api.store](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEfYYh82LcwOXom6WrwAVbfW2aqzWPyN297zsi_1gIkMRhYtnuY3oQr7dwtswC7nFghRhobR6cVx-8oPRDTspfCSLNoTbWakAffJU2tTrtOm1mBb6KVJWJfxptsCn0id_HIcwG6qkZXVHju8J1wJcqm7BqYseLqphF35esXGYvzRDdQ8QPoOUj8)
53. [europa.eu](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF3AJSP8OwFp9ADDMlbzudWDT3OD8BZO6L5VyvOcmSUjMXqwwor1gh6lSOgSIZlsXeJ-7aONgpN3LqIH1X68xGEplndHoaKBuDU5PAMeaB2mjV3yeoi6IgKrJMCSK7x6yFnSHxDgqovW-kvw3CfYzKzL57qmnHL_S63N8HxzpXDEfAN78V6Z4jIEg6ZHdrVSGJKIE9dlGUjcOOZfYx5Gw==)
54. [wetsuite.nl](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHpwV2QzspQfdCi1b3n_SZ3MCdWw5BnJZpIHPQ6Po5MUr3zoofAKnYzGKR_WeoRHjrotJURCrw2aJap-MOPOH-NKmY3vas-8IHydQKm3rudb4sJ6nbOFh2uc_P3dfch)
55. [ceur-ws.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGLoaIiqahTTgZX27IteMCJsda6ym9b1liT70pvMYYWzj_WnHDJ-jXy0la5TJ5Ni_VSLv5IeKH_kRyJPIH_HgQBr5enD5CL3RJQczy_eMRRsR2whb7OTvvB3dKAlZo=)
56. [github.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGm5m7y31Ve9FhT0baQUyrEytykjgep6Q9hB6dDM_vwycNe_NTHUsm1pAMJo8YuC_VyZDLHtLzwjVx0bVoQHfTXL7tGgijEqN0KnJQRsvf4M2DNzDVfjUJF_bsSEDAQQbqefPKiH6RcQw==)
57. [oecd.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEL3YvhAaxaRR12264bl0eoxHmvppdXDqN5MW7UNTlTeUVYA0THksK-HhXY2VBioYnIkmwLh4fLr8POdV0rqdCLQyzIvkJqYH_DruVb8Vj69SThZzyttN_bpcImrR3hLM6kVgLRFnAVBCjM_oEu-iRsDrp5AYzHKU7uyzXeYwKeEqgH2dHiDn1qoPWHbezn_hsG0jIHJTtMTohgv5yKHWn58-5MtxBHnFJZAaez0EhIJTitIenCdFJ3TMJJZHhVxY81-g==)
58. [oecd.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHpvejrMicFy5M6IFe2MdgnCos16P6-3-Bnc9bTO_7HheCJCr6ZW7R7vCmVU2FI3SgCDWLNJiEgoX9BdUt0Rx9TqLTYB8FJx3BJgmLLH6YLB6l6Cqm8SRj1ROQ3FhhmXqm_FwTw9-4cLJUPLsHFYvIVDSspWJqFgGk6bA0-AOgffDBZFw==)
59. [ibfd.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGk8EFkLi5uY6zD-19kT0JJIvVq2LAkZpEV9LFb50Nn4hfJEcUSJ2eIM8StfV0Bx6NbSDzB8RCoL6wRFwSCZ16sFCg4yk4Wus0dXD4W-29ovt6___lEr38E6Dg=)
60. [un.org](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQH8fNnykdDTkev-CRPrm1bRDNxHEJVuLbBowa0KB3Nq57nSAsKKfACiXNrVhnvHxLJgPyQtXBdFCqXr0fc0-Pp4hQinB49KrYLRzvutL4WsinqyZdLB8qg-vwhaL60-Qf8JwlRM3CpVzdQmMfyudq1v8kqnEu8dDyry1kI4HTHWMQjRDHOia6ek88cYhtoXyPE7ONAqk6_vcTKml2BxI4sZ9MKedrbVVQ==)
61. [wolterskluwer.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHq0hjEa4l7-vGHHP3Sk2HywfdV0TP5_1vh9x1OsHAhZoC1ECCn61HYL894zdklrPxLy2K-Gri8R9j23POholfQHiiVCNyvUpwhkt6XjnZDVoedeZg9ig6ngBp_KV4Hbkc3aV6C56kXSHVF4WrEdM5FTeL5PMeD5xOQJG_UoMJAro0G5vMLkBZKP0X14JPh5-_0iakQHGWKG8WPZGgErgIxmzLxy0eq5oWY2mg5hQuL-s9lEzur3fkK46I=)
62. [taxathand.com](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHwzTUAgxp73Li9UmPeBHinNulz8nI3vXYv1_i9BkPALOG2QOFQsEc0tsveVxSQGL6_KMgeN82M7gqYqTpNQkUe67LX1BHgVXizLvLrFNhA1n8jUhkRiysvBgJQeoFGFredh2M0--fd4PCGtHvHqLjGW84tK8xN1qd7pf_KgFxiqaR5ttGgnyrLIdmQMhAfnAXRb_OBvX49krvzag==)
63. [southcentre.int](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF36nWPdRx9O69NkRUSNVNmXjjmUKF_ID3qhZBz2BwphYwlE6RO-G-lIzD1Yok7JhFhrZksS2ySWOr5hVLUaAj1sPPhna4sh_UKICzcITxwerY6opYvcHErZytCPvVrSC5oZBwdPwDCaWHcPUgQ)
64. [bundestag.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFVMHjYfZq_rWu4M-Qyk5K8unR2qTzYx9sKZUVQp938esrsXMPtu7xhqV8ZWfa4KxmKZoWGCeqxBrJI0r8X0XFG1jOetoX-jWXTrY2JKfoQ3NZW68NYIOZ5fT6Xs4PVcwS0-5JroFTzw-5cSIuRQ_85FSowAm8H6N-1_Q5WwJhgDWFgXVFsx1KCfnQyD_1CMpcAwdBHzpw=)
65. [admin.ch](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQEUDAAGXHWIExi0tF5uHwAOpwUy6mNbeMI5VFQ017quRTMRxeG3gUb2F2Fd9SncRJ9wF0wCv8126PbJegJpx6HwpuvDsXFHi2E7KZxYtayjei6DpHNZgprdPCgomOy9sm3Ecr6YAM0EEYAn_PxWApB71oEmPciXdo0huF9UzkQq4n5cxr01pb8qG52AY_7uE0IABw==)
66. [bzst.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF1LCF-U4TOX1BmFab4mWIa8DkziS2eMqo3L29UUbmpwqs0PHN1mC0NTKZO5efcR8WQ0dBsyKUXaN-UGdTvGVeqG4MkS-4XRH8VokzTawbS0ySzWLZpM304NaVKEflN7G6M323ZcLhXsQBw_EKY_KjOkLNxd4yqUI_CdH3lIAv9yi0VU2E1mMZqM6Gga-tIMsgpCDRZZWrQoMELt5GSrYx2g-7E4QAi)
67. [bayern.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGUB8CvT-hBfzU9SB-ajJGZI45sr8nSG80LAj9cSAHWASkzQFTnwjuRn-7B3ebpj80wQjUjFzgp4OAL86TMfx0Gu7q7JAk3At8Wa3-aC_VWFDnaMOSMw-pNZ_zmVk_WHOegm_Y0Tx2U5s7FsKdqYrEu4fgWLeyuGPcwZtC8DhNA5IWG4JTGJSv3D4zobzSm9OatZ8abpJHCKiDSLyGcB2jvR_YutBzRf9RvfRBBmYWY_rYAQFdI4CzHqqnsk038AHnKSy7AD8wKBLP8ufw=)
68. [beck.de](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFRxLNdBRVWCHY0Y9PbGX9ISdbVbkduB4sNwaYlrlcljGwCn107YmBe0hFbHoow8VKYUKPeGHkOsS5sECMUcsKwsmr7ZAuX7Zkv4D_flqTPmsmznZKVM2lW5NjXNbdVPDxbNasCTIatNYof0yaSb58GbXNSbDSYYB-0EPzOL_cPeLgz9Ko02zm88dpiIM9nL_oGIw_PzD2amTEgNg==)

