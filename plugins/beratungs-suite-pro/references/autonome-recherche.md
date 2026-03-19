# Autonome Informationsbeschaffung — Entscheidungsbaum

Dieses Dokument definiert, wann und wie das Plugin selbständig zusätzliche Informationen beschafft.

---

## Tool-Zuständigkeiten (Übersicht)

| Aufgabe | Tool |
|---|---|
| Instagram, TikTok, Facebook, X/Twitter, LinkedIn, YouTube | **Bright Data MCP** (`web_data_*` Tools) |
| Telegram Channels — Nachrichten, Metadaten | **Bright Data MCP** (`scrape_as_markdown` auf `t.me/s/USERNAME`) |
| Behördenseiten, Handelsregister-Web, Archive.org | **Bright Data MCP** (`scrape_as_markdown` / `web_unlocker`) |
| Regulierungs-Warnlisten (BaFin, FMA, SEC, …) | **Bright Data MCP** (`scrape_as_markdown`) |
| Website-Trust-Check (ScamAdviser, ScamDetector) | **Bright Data MCP** (`scrape_as_markdown`) |
| Google News / Presseartikel | **Bright Data MCP** (`search_engine`) |
| Deutsche Gesetze | rechtsinformationen-bund / german-law MCPs |
| Handelsregister-Abfragen (DE) | openregister MCP |

> **Hinweis:** Firecrawl wird für Social Media **nicht mehr verwendet** — es scheitert an Login-Walls aller großen Plattformen. Bright Data MCP löst dieses Problem durch eigene Proxy-Infrastruktur und plattformspezifische Scraper.

---

## Grundprinzip

Das Plugin prüft nach jeder Primärquellen-Abfrage:
1. Sind genügend unabhängige Quellen vorhanden? (Ziel: >= 2)
2. Gibt es Signale im Kontext, die zusätzliche Abfragen erfordern?
3. Ist die Information aktuell genug?

Wenn NEIN → automatisch nächste Stufe aktivieren.

---

## WICHTIG: Nicht blind vertrauen

**Das Plugin darf NIEMALS ausschließlich auf User-bereitgestellte Unterlagen vertrauen.**

Jede rechtliche Bewertung erfordert eigenständige Ermittlung. Der User weiß oft nicht, ob seine Unterlagen vollständig oder korrekt sind — genau deshalb fragt er das Plugin. Das Plugin muss selbst aktiv werden und das Gesamtbild zusammensetzen.

---

## Entscheidungsbaum

```
Anfrage erhalten
│
├── 0. PROAKTIVE ERMITTLUNG (VOR Analyse der User-Unterlagen)
│   │
│   │   *** DIESER SCHRITT IST PFLICHT BEI JEDER RECHTLICHEN BEWERTUNG ***
│   │
│   ├── 0a. Regulatorische Warnungen prüfen
│   │   │   Für JEDE beteiligte Person/Firma/Marke:
│   │   ├── DE: BaFin Warnliste → Bright Data: scrape_as_markdown auf bafin.de/warnungen
│   │   ├── AT: FMA Investorenwarnungen → Bright Data: scrape_as_markdown auf fma.gv.at/investorenwarnungen
│   │   ├── CH: FINMA Warnliste → Bright Data: scrape_as_markdown auf finma.ch/warnliste
│   │   ├── EU: ESMA Warnungen → Bright Data: scrape_as_markdown auf esma.europa.eu/investor-corner/warnings
│   │   ├── USA: SEC EDGAR + Enforcement → Bright Data: scrape_as_markdown auf sec.gov/litigation
│   │   └── International: IOSCO Alerts → Bright Data: scrape_as_markdown auf iosco.org/investor_alerts
│   │
│   ├── 0b. Website-Trust-Check (bei JEDER Domain)
│   │   │   Für JEDE Domain die im Kontext auftaucht:
│   │   ├── ScamAdviser → Bright Data: scrape_as_markdown auf scamadviser.com/check/{domain}
│   │   │     → Trustscore, Risikobewertung, Positive/Negative Highlights
│   │   └── ScamDetector → Bright Data: scrape_as_markdown auf scamdetector.com/validator/{domain}
│   │         → VLDTR-Score, Threat-Analyse, Blacklisting-Status
│   │
│   ├── 0c. Digitaler Fußabdruck scannen (OSINT)
│   │   │   Für JEDE beteiligte Person/Firma/Marke:
│   │   │
│   │   ├── YouTube → Bright Data: web_data_youtube_channel_search (USERNAME)
│   │   │            → dann web_data_youtube_channel_info für Details
│   │   │
│   │   ├── Facebook → Bright Data: web_data_facebook_profile (URL)
│   │   │             → web_data_facebook_posts (URL, limit: 50)
│   │   │
│   │   ├── Telegram → Bright Data: scrape_as_markdown auf t.me/s/USERNAME
│   │   │              → Gibt ~20 neueste Nachrichten als Markdown zurück
│   │   │              → Für ältere Nachrichten: mehrere Requests mit Scroll-Offset
│   │   │
│   │   ├── Instagram → Bright Data: web_data_instagram_profile (USERNAME)
│   │   │              → web_data_instagram_posts (USERNAME, limit: 50)
│   │   │
│   │   ├── X/Twitter → Bright Data: web_data_twitter_profile (USERNAME)
│   │   │              → web_data_twitter_posts (USERNAME, limit: 50)
│   │   │
│   │   ├── TikTok → Bright Data: web_data_tiktok_profile (USERNAME)
│   │   │           → web_data_tiktok_posts (USERNAME, limit: 50)
│   │   │
│   │   ├── LinkedIn → Bright Data: web_data_linkedin_person_profile (URL)
│   │   │             → web_data_linkedin_company_profile (URL)
│   │   │
│   │   └── Google News → Bright Data: search_engine (MARKENNAME + "Betrug" ODER "Warnung" ODER "Klage")
│   │
│   ├── 0d. Beweismittelsicherung
│   │   │   Für JEDEN relevanten Fund:
│   │   ├── Volltext der Quelle sichern (Bright Data: scrape_as_markdown)
│   │   ├── Archive.org Wayback Machine prüfen → Bright Data: scrape_as_markdown auf
│   │   │   web.archive.org/web/*/ORIGINAL_URL
│   │   ├── Zeitstempel dokumentieren (ISO 8601)
│   │   ├── URL + Zugriffsdatum festhalten
│   │   └── Alle Funde in docs/recherchen/ speichern (siehe docs-output.md)
│   │
│   ├── 0e. Unabhängige Verifizierung der User-Unterlagen
│   │   ├── Behauptungen des Users gegen öffentliche Quellen prüfen
│   │   ├── Genannte Firmen/Personen im Handelsregister nachschlagen (openregister MCP)
│   │   ├── Genannte Lizenzen/Genehmigungen bei Aufsichtsbehörden prüfen
│   │   ├── Genannte Urteile/Bescheide in Rechtsprechungsdatenbanken suchen
│   │   └── Bei Widersprüchen: User informieren + beide Versionen dokumentieren
│   │
│   └── 0f. Vollständigkeitsprüfung
│       │   Nach Abschluss der proaktiven Ermittlung:
│       ├── "Welche Akteure fehlen noch im Bild?"
│       ├── "Gibt es verknüpfte Unternehmen/Personen, die nicht erwähnt wurden?"
│       ├── "Welche Kanäle/Plattformen wurden noch nicht geprüft?"
│       ├── "Gibt es historische Vorgänge, die relevant sein könnten?"
│       └── Falls Lücken → weitere Recherche durchführen bevor Analyse startet
│
├── 1. KONTEXT-SIGNALE PRÜFEN
│   │
│   ├── Firmenname / Unternehmensname erwähnt?
│   │   └── → openregister-mcp: Handelsregisterdaten abrufen
│   │       (Gesellschaftsform, Sitz, Geschäftsführer, Stammkapital)
│   │
│   ├── Domain / URL erwähnt?
│   │   └── → Bright Data: scrape_as_markdown (Web Unlocker — umgeht Blocks)
│   │       → Impressum, Datenschutzerklärung, AGB extrahieren
│   │       → ScamAdviser + ScamDetector Trust-Score abrufen
│   │       → Domain-WHOIS prüfen (wenn relevant)
│   │
│   ├── PDF / Dokument bereitgestellt?
│   │   └── → Read tool: PDF lesen
│   │       → Dokumenttyp erkennen
│   │       → Relevante Normen identifizieren
│   │
│   ├── Person erwähnt (im geschäftlichen Kontext)?
│   │   └── → openregister-mcp: Beteiligungen prüfen
│   │       → Bright Data: scrape_as_markdown auf Bundesanzeiger Bekanntmachungen
│   │
│   └── IHK / Kammer erwähnt?
│       └── → Bright Data: scrape_as_markdown auf ihk.de (Brancheninformationen, Pflichtmitgliedschaft)
│
├── 2. PRIMÄRQUELLEN ABFRAGEN
│   │
│   ├── Jurisdiktion bestimmen (siehe jurisdiktions-mapping.md)
│   ├── Primärquellen der Jurisdiktion abfragen
│   └── Ergebnis bewerten:
│       │
│       ├── >= 2 unabhängige Quellen mit konsistenten Ergebnissen?
│       │   └── → Weiter zu VALIDIERUNG (Schritt 4)
│       │
│       └── < 2 Quellen ODER Ergebnis unvollständig?
│           └── → Weiter zu SEKUNDÄRQUELLEN (Schritt 3)
│
├── 3. SEKUNDÄRQUELLEN AKTIVIEREN
│   │
│   ├── 3a. Fallback-Kette (gleiche Jurisdiktion, andere Quelle)
│   │   ├── DE: rechtsinformationen-bund → german-law → ayunis-legal → Bright Data: scrape_as_markdown
│   │   ├── AT: RIS API → Bright Data: scrape_as_markdown auf ris.bka.gv.at
│   │   ├── CH: Fedlex SPARQL → Bright Data: scrape_as_markdown auf admin.ch
│   │   ├── EU: EU Publications SPARQL → EU_compliance_MCP → Bright Data: scrape_as_markdown auf eur-lex
│   │   ├── USA: Federal Register → GovInfo → open-legal-compliance → Bright Data: scrape_as_markdown
│   │   └── UAE: Bright Data: scrape_as_markdown auf legislation.ae → tax.gov.ae → difc.ae
│   │
│   ├── 3b. Aktualitätscheck (wenn Norm möglicherweise veraltet)
│   │   ├── Norm zitiert Fassung älter als 1 Jahr?
│   │   │   └── → Bright Data: scrape_as_markdown auf offizielle Quelle: aktuelle Fassung prüfen
│   │   ├── Steuerrechtliche Norm?
│   │   │   └── → Prüfen ob Jahressteuergesetz Änderungen brachte
│   │   └── EU-Verordnung?
│   │       └── → Prüfen ob Änderungsverordnung existiert
│   │
│   ├── 3c. Grenzüberschreitender Sachverhalt?
│   │   ├── Mehrere Jurisdiktionen betroffen?
│   │   │   └── → Alle betroffenen Jurisdiktionen parallel abfragen
│   │   ├── DBA-relevant?
│   │   │   └── → BMF DBA-Liste via Bright Data: scrape_as_markdown abrufen
│   │   └── EU-Harmonisierung relevant?
│   │       └── → EU-Richtlinie + nationale Umsetzung prüfen
│   │
│   ├── 3d. Tiefere Recherche nötig? (Komplexe Rechtsfrage)
│   │   └── → openrouter-skill-v3 aktivieren:
│   │       ├── Gemini Deep Research (höchste Qualität, 3-8 Min)
│   │       └── Perplexity Deep Research (schneller, mit Citations)
│   │
│   └── 3e. Ergebnis nach Sekundärquellen immer noch < 2 Quellen?
│       └── → Confidence auf "NIEDRIG" setzen
│           → Erweiterten Disclaimer verwenden
│           → User informieren: "Begrenzte Quellenlage"
│
└── 4. VALIDIERUNG
    │
    ├── Confidence-Score berechnen (siehe confidence-scoring.md)
    ├── Score >= 70? → Standard-Output mit Disclaimer
    ├── Score 50-69? → Devil's Advocate aktivieren
    ├── Score < 50? → Devil's Advocate + Blind Spot + Gray Area
    └── Output generieren mit Score + Quellenangaben + Disclaimer

```

---

## Trigger-Signal-Tabelle

### Proaktive Ermittlung (Schritt 0)

| Signal im Kontext | Automatische Aktion | Tool |
|---|---|---|
| Jede Person/Firma bei rechtlicher Bewertung | BaFin/FMA/FINMA/ESMA/SEC Warnlisten prüfen | Bright Data: scrape_as_markdown |
| Jede Person/Firma bei rechtlicher Bewertung | YouTube → web_data_youtube_channel_search | Bright Data MCP |
| Jede Person/Firma bei rechtlicher Bewertung | Facebook → web_data_facebook_profile + posts | Bright Data MCP |
| Jede Person/Firma bei rechtlicher Bewertung | Instagram → web_data_instagram_profile + posts | Bright Data MCP |
| Jede Person/Firma bei rechtlicher Bewertung | X/Twitter → web_data_twitter_profile + posts | Bright Data MCP |
| Jede Person/Firma bei rechtlicher Bewertung | TikTok → web_data_tiktok_profile + posts | Bright Data MCP |
| Jede Person/Firma bei rechtlicher Bewertung | LinkedIn → web_data_linkedin_person/company | Bright Data MCP |
| Jede Person/Firma bei rechtlicher Bewertung | Google News / Presseartikel | Bright Data: search_engine |
| Domain / URL bei Verdachtsfällen | ScamAdviser + ScamDetector Trust-Check | Bright Data: scrape_as_markdown |
| "Telegram", "Gruppe", "Channel", "Community" | scrape_as_markdown auf t.me/s/USERNAME | Bright Data MCP |
| "Betrug", "Scam", "Warnung", "unseriös" | IOSCO Alerts + alle Aufsichtsbehörden prüfen | Bright Data: scrape_as_markdown |
| "Video", "Webinar", "Schulung", "Kurs" | YouTube-Channel des Anbieters prüfen | Bright Data: web_data_youtube_* |
| "Lizenz", "Genehmigung", "Erlaubnis", "BaFin" | Lizenz bei zuständiger Behörde verifizieren | Bright Data: scrape_as_markdown |
| Jeder relevante Fund | Beweismittelsicherung (Volltext + Zeitstempel) | Bright Data: scrape_as_markdown + Write |
| User-Unterlagen enthalten Behauptungen | Unabhängig gegen öffentliche Quellen verifizieren | Bright Data MCP + openregister |

### Kontext-Signale (Schritt 1)

| Signal im Kontext | Automatische Aktion | Tool |
|---|---|---|
| Firmenname (GmbH, AG, UG, Ltd, Inc) | Handelsregister-Abfrage | openregister-mcp |
| Domain / URL | Webseite crawlen + rechtlich prüfen | Bright Data: scrape_as_markdown |
| Domain / URL | ScamAdviser + ScamDetector Trust-Score abrufen | Bright Data: scrape_as_markdown |
| PDF als Anhang | Dokument lesen + Typ erkennen | Read tool |
| "IHK", "Kammer", "Gewerbeanmeldung" | Brancheninfos + Pflichten | Bright Data: scrape_as_markdown auf ihk.de |
| "Eintragung", "Register" | Relevantes Register identifizieren | openregister-mcp / Bright Data |
| "Konkurrent", "Wettbewerber" + Firmenname | Wettbewerber-Daten abrufen | openregister-mcp + Bright Data |
| Zwei oder mehr Länder erwähnt | Multi-Jurisdiktions-Abfrage | Alle relevanten Quellen |
| "DBA", "Doppelbesteuerung" | DBA-Text abrufen | Bright Data: scrape_as_markdown auf BMF DBA-Übersicht |
| "aktuell", "2024", "2025", "2026", "neu" | Aktualitätscheck erzwingen | Bright Data: scrape_as_markdown auf offizielle Quelle |
| "sicher?", "stimmt das?", "zuverlässig?" | Deep Research aktivieren | openrouter-skill-v3 |
| Strafrecht-Keywords ("Betrug", "Haftung", "Anzeige") | Strafrechtlichen Disclaimer hinzufügen | — |

---

## Bright Data MCP — Tool-Referenz für Social Media

| Plattform | Profil abrufen | Posts abrufen | Suche |
|---|---|---|---|
| Instagram | `web_data_instagram_profile` | `web_data_instagram_posts` | — |
| TikTok | `web_data_tiktok_profile` | `web_data_tiktok_posts` | — |
| Facebook | `web_data_facebook_profile` | `web_data_facebook_posts` | — |
| X/Twitter | `web_data_twitter_profile` | `web_data_twitter_posts` | — |
| LinkedIn (Person) | `web_data_linkedin_person_profile` | — | — |
| LinkedIn (Firma) | `web_data_linkedin_company_profile` | — | — |
| YouTube | `web_data_youtube_channel_info` | `web_data_youtube_videos` | `web_data_youtube_channel_search` |
| Allgemeines Web | `scrape_as_markdown` | — | `search_engine` |

Alle Tools liefern strukturiertes JSON. Kein HTML-Parsing nötig.
Nur öffentlich zugängliche Daten werden abgerufen (DSGVO/CCPA-konform).

---

## Telegram via Bright Data — Anleitung

Telegram-Channels haben öffentliche Web-Previews unter `t.me/s/USERNAME`.
Bright Data's `scrape_as_markdown` rendert diese vollständig und gibt Markdown zurück.

```
URL-Muster:  https://t.me/s/{USERNAME}
Tool:        scrape_as_markdown
Ergebnis:    ~20 neueste Nachrichten als strukturierter Markdown

Limitierung: Keine automatische Pagination — maximal ~20 Nachrichten pro Request.
Workaround:  Für tiefere Analyse → telegram-scroll-loop.md (Browser-basiert).
```

Keine zusätzlichen API-Keys nötig — läuft über den bestehenden Bright Data Token.

---

## Quellen-Erneuerung

### Cache-Strategie

| Quellentyp | Gültigkeit | Erneuerung |
|---|---|---|
| Gesetzestexte (MCP) | 24 Stunden | Bei nächster Abfrage neu laden |
| API-Ergebnisse (RIS, Federal Register) | Live | Immer frisch (kein Cache) |
| Bright Data Social Media Scrapes | 1 Stunde | Bei erneuter Abfrage neu laden |
| Telegram OSINT Ergebnisse | 30 Minuten | Bei erneuter Abfrage neu laden |
| Deep Research Ergebnisse | Session | Nicht cachen (zu individuell) |
| Handelsregister-Daten | 7 Tage | Bei erneuter Abfrage prüfen |

### Aktualitäts-Signale

Das Plugin erkennt automatisch, dass eine Quelle möglicherweise veraltet ist:
1. **Normzitat mit Datum**: "in der Fassung vom [Datum]" → Prüfen ob neuere Fassung existiert
2. **Steuerjahr-Referenz**: "Steuerjahr 2023" → Prüfen ob für aktuelles Jahr anders
3. **"Stand:"**: Wenn Stand älter als 6 Monate → Warnung + Frisch-Abfrage
4. **Gesetzesänderung erwähnt**: → Automatisch neueste Fassung laden
