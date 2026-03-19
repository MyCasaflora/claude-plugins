# API-Erreichbarkeitstest

**Testdatum:** 2026-03-17
**Methode:** HTTP GET via `curl` mit 10s Connect-Timeout, 15s Max-Time, Follow-Redirects

---

## Ergebnisse

| Region | API / URL | Status | Format | API-Key nötig | Bemerkung |
|---|---|---|---|---|---|
| Deutschland | https://www.gesetze-im-internet.de/Teilliste_translations.html | 200 | HTML | Nein | OK, statische Seite mit Übersetzungslinks |
| Deutschland | https://api.rechtsinformationsportal.de | FEHLER | — | — | DNS-Auflösung fehlgeschlagen, Domain existiert nicht |
| Deutschland | https://www.bundesanzeiger.de | 200 | HTML | Nein | OK, Webportal (kein REST-API) |
| Deutschland | https://www.handelsregister.de | 200 | HTML | Nein | OK, Webportal (kein REST-API) |
| Österreich | https://data.bka.gv.at/ris/api/v2.6/Bundesrecht | 200 | JSON | Nein | OK, echte REST-API, liefert JSON |
| Österreich | https://www.ris.bka.gv.at | 200 | HTML | Nein | OK, Webportal zum RIS |
| Schweiz | https://fedlex.data.admin.ch/sparqlendpoint | 200 | HTML | Nein | OK, SPARQL-Endpoint (Query-Interface) |
| Schweiz | https://www.admin.ch/api | 202 | HTML | Nein | Accepted (202), vermutlich Async-Verarbeitung |
| EU | https://eur-lex.europa.eu/eurlex-ws/rest | 404 | HTML | — | Endpoint nicht gefunden, ggf. anderer Pfad nötig |
| EU | https://publications.europa.eu/webapi/rdf/sparql | 200 | HTML | Nein | OK, SPARQL-Interface verfügbar |
| EU | https://curia.europa.eu/juris | 404 | HTML | — | Pfad nicht gefunden, Suchportal unter anderem Pfad |
| International | https://stats.oecd.org/restsdmx/sdmx.ashx | 404 | — | — | Alter SDMX-Endpoint, vermutlich migriert |
| International | https://api.worldbank.org/v2/country | 200 | XML | Nein | OK, liefert XML mit Länderdaten |
| USA | https://www.federalregister.gov/api/v1/documents.json?per_page=1 | 200 | JSON | Nein | OK, offene REST-API, liefert JSON |
| USA | https://api.govinfo.gov/collections?api_key=DEMO_KEY | 200 | JSON | Ja (DEMO_KEY) | OK, DEMO_KEY funktioniert, produktiv eigener Key nötig |
| USA | https://efts.sec.gov/LATEST/search-index?q=test | 403 | HTML | Vermutlich ja | Zugriff verweigert (403), ggf. anderer Endpoint nutzen |
| USA | https://uscode.house.gov/download/releasepoints/us/pl/118/68/xml_uscAll@118-68.zip | FEHLER | — | — | Timeout, sehr große Datei oder Pfad ungültig |
| UAE | https://tax.gov.ae | 200 | HTML | Nein | OK, Webportal (kein REST-API) |
| UAE | https://www.mof.gov.ae | 200 | HTML | Nein | OK, Webportal (kein REST-API) |
| UAE | https://www.difc.ae | 200 | HTML | Nein | OK, Webportal (kein REST-API) |

---

## Zusammenfassung

### Echte APIs mit strukturierten Daten (direkt nutzbar)

| API | Format | Anmerkung |
|---|---|---|
| data.bka.gv.at/ris/api/v2.6/Bundesrecht | JSON | Beste API im Test, offen, kein Key |
| api.worldbank.org/v2/country | XML | Offen, kein Key |
| federalregister.gov/api/v1/documents.json | JSON | Offen, kein Key |
| api.govinfo.gov/collections | JSON | DEMO_KEY verfügbar, produktiv Key beantragen |
| fedlex.data.admin.ch/sparqlendpoint | SPARQL | Erfordert SPARQL-Queries |
| publications.europa.eu/webapi/rdf/sparql | SPARQL | Erfordert SPARQL-Queries |

### Nur Webportale (Scraping nötig)

- gesetze-im-internet.de, bundesanzeiger.de, handelsregister.de
- ris.bka.gv.at
- tax.gov.ae, mof.gov.ae, difc.ae

### Nicht erreichbar / Fehlerhaft

- api.rechtsinformationsportal.de — Domain existiert nicht
- eur-lex.europa.eu/eurlex-ws/rest — 404
- curia.europa.eu/juris — 404
- stats.oecd.org/restsdmx — 404 (migriert zu sdmx.oecd.org)
- efts.sec.gov/LATEST/search-index — 403
- uscode.house.gov ZIP — Timeout
