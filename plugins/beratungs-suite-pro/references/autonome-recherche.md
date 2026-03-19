# Autonome Informationsbeschaffung — Entscheidungsbaum

Dieses Dokument definiert, wann und wie das Plugin selbständig zusätzliche Informationen beschafft.

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
│   │   │   *** Lade zuerst references/regulator-endpoints.md für konkrete URLs ***
│   │   │
│   │   │   TIER 1 — Direkte API (curl, kein Browser):
│   │   ├── DE: BaFin Unternehmensdatenbank → curl auf portal.mvp.bafin.de/database/InstInfo/
│   │   ├── AT: FMA Warnliste → WordPress REST API auf fma.gv.at/wp-json/wp/v2/posts?categories=42
│   │   ├── EU: ESMA Warnungen → esma.europa.eu/databases-library/investor-corner/warnings
│   │   ├── USA: SEC EDGAR → efts.sec.gov/LATEST/search-index
│   │   │
│   │   │   TIER 2 — Firecrawl (JS-Rendering):
│   │   ├── DE: BaFin Warnungen (unerlaubte Geschäfte) → Firecrawl auf bafin.de Expertensuche
│   │   ├── CH: FINMA Bewilligungsträger + Warnliste → Firecrawl auf finma.ch
│   │   ├── UK: FCA Register → Firecrawl auf register.fca.org.uk
│   │   ├── UAE: DFSA/DIFC Register → Firecrawl auf dfsa.ae/public-register
│   │   │
│   │   │   TIER 3 — Playwright (volle Browser-Session):
│   │   ├── UAE: SCA Warnungen → Playwright auf sca.gov.ae (braucht Session-Cookie)
│   │   └── International: IOSCO Alerts → Firecrawl auf iosco.org/investor_alerts
│   │
│   ├── 0b. Digitaler Fußabdruck scannen (OSINT)
│   │   │   Für JEDE beteiligte Person/Firma/Marke:
│   │   ├── YouTube → Firecrawl: Suche nach Channels/Videos der Betroffenen
│   │   ├── Facebook → Firecrawl: Öffentliche Seiten/Gruppen
│   │   ├── Telegram → Firecrawl/Deep Research: Channels, Gruppen, Bots
│   │   ├── Instagram → Firecrawl: Öffentliche Profile/Beiträge
│   │   ├── X/Twitter → Firecrawl: Öffentliche Profile/Posts
│   │   ├── TikTok → Firecrawl: Öffentliche Profile/Videos
│   │   ├── LinkedIn → Firecrawl: Firmenprofile, Mitarbeiter
│   │   └── Google News → Deep Research: Presseartikel, Medienberichte
│   │
│   ├── 0c. Beweismittelsicherung
│   │   │   Für JEDEN relevanten Fund:
│   │   ├── Screenshot/Snapshot der Quelle anfertigen (Firecrawl Volltext)
│   │   ├── Archive.org Wayback Machine prüfen → Firecrawl auf web.archive.org
│   │   ├── Zeitstempel dokumentieren
│   │   ├── URL + Zugriffsdatum festhalten
│   │   └── Alle Funde in docs/recherchen/ speichern (siehe docs-output.md)
│   │
│   ├── 0d. Unabhängige Verifizierung der User-Unterlagen
│   │   ├── Behauptungen des Users gegen öffentliche Quellen prüfen
│   │   ├── Genannte Firmen/Personen im Handelsregister nachschlagen
│   │   ├── Genannte Lizenzen/Genehmigungen bei Aufsichtsbehörden prüfen
│   │   ├── Genannte Urteile/Bescheide in Rechtsprechungsdatenbanken suchen
│   │   └── Bei Widersprüchen: User informieren + beide Versionen dokumentieren
│   │
│   └── 0e. Vollständigkeitsprüfung
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
│   │   └── → Firecrawl: Webseite crawlen
│   │       → Impressum, Datenschutzerklärung, AGB extrahieren
│   │       → Domain-WHOIS prüfen (wenn relevant)
│   │
│   ├── PDF / Dokument bereitgestellt?
│   │   └── → Read tool: PDF lesen
│   │       → Dokumenttyp erkennen
│   │       → Relevante Normen identifizieren
│   │
│   ├── Person erwähnt (im geschäftlichen Kontext)?
│   │   └── → openregister-mcp: Beteiligungen prüfen
│   │       → Firecrawl: Bundesanzeiger Bekanntmachungen
│   │
│   └── IHK / Kammer erwähnt?
│       └── → Firecrawl: ihk.de (Brancheninformationen, Pflichtmitgliedschaft)
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
│   │   ├── DE: rechtsinformationen-bund → german-law → ayunis-legal → Firecrawl
│   │   ├── AT: RIS API → Firecrawl auf ris.bka.gv.at
│   │   ├── CH: Fedlex SPARQL → Firecrawl auf admin.ch
│   │   ├── EU: EU Publications SPARQL → EU_compliance_MCP → Firecrawl auf eur-lex
│   │   ├── USA: Federal Register → GovInfo → open-legal-compliance → Firecrawl
│   │   └── UAE: Firecrawl auf legislation.ae → tax.gov.ae → difc.ae
│   │
│   ├── 3b. Aktualitätscheck (wenn Norm möglicherweise veraltet)
│   │   ├── Norm zitiert Fassung älter als 1 Jahr?
│   │   │   └── → Firecrawl auf offizielle Quelle: aktuelle Fassung prüfen
│   │   ├── Steuerrechtliche Norm?
│   │   │   └── → Prüfen ob Jahressteuergesetz Änderungen brachte
│   │   └── EU-Verordnung?
│   │       └── → Prüfen ob Änderungsverordnung existiert
│   │
│   ├── 3c. Grenzüberschreitender Sachverhalt?
│   │   ├── Mehrere Jurisdiktionen betroffen?
│   │   │   └── → Alle betroffenen Jurisdiktionen parallel abfragen
│   │   ├── DBA-relevant?
│   │   │   └── → BMF DBA-Liste via Firecrawl abrufen
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
| Jede Person/Firma bei rechtlicher Bewertung | BaFin/FMA/FINMA/ESMA/SEC Warnlisten prüfen | Tier 1→2→3 (siehe regulator-endpoints.md) |
| Jede Person/Firma bei rechtlicher Bewertung | YouTube, Facebook, Telegram, Instagram, X scannen | Firecrawl + Deep Research |
| Jede Person/Firma bei rechtlicher Bewertung | Google News / Presseartikel suchen | Deep Research |
| "Betrug", "Scam", "Warnung", "unseriös" | IOSCO Alerts + alle Aufsichtsbehörden prüfen | Firecrawl |
| "Telegram", "Gruppe", "Channel", "Community" | Telegram-Channel crawlen + Inhalte sichern | Firecrawl |
| "Video", "Webinar", "Schulung", "Kurs" | YouTube-Channel des Anbieters prüfen | Firecrawl |
| "Lizenz", "Genehmigung", "Erlaubnis", "BaFin" | Lizenz bei zuständiger Behörde verifizieren | Tier 1→2→3 (siehe regulator-endpoints.md) |
| Jeder relevante Fund | Beweismittelsicherung (Volltext + Zeitstempel) | Firecrawl + Write |
| User-Unterlagen enthalten Behauptungen | Unabhängig gegen öffentliche Quellen verifizieren | Firecrawl + MCPs |

### Kontext-Signale (Schritt 1)

| Signal im Kontext | Automatische Aktion | Tool |
|---|---|---|
| Firmenname (GmbH, AG, UG, Ltd, Inc) | Handelsregister-Abfrage | openregister-mcp |
| Domain / URL | Webseite crawlen + rechtlich prüfen | Firecrawl |
| PDF als Anhang | Dokument lesen + Typ erkennen | Read tool |
| "IHK", "Kammer", "Gewerbeanmeldung" | Brancheninfos + Pflichten | Firecrawl auf ihk.de |
| "Eintragung", "Register" | Relevantes Register identifizieren | openregister-mcp / Firecrawl |
| "Konkurrent", "Wettbewerber" + Firmenname | Wettbewerber-Daten abrufen | openregister-mcp + Firecrawl |
| Zwei oder mehr Länder erwähnt | Multi-Jurisdiktions-Abfrage | Alle relevanten Quellen |
| "DBA", "Doppelbesteuerung" | DBA-Text abrufen | Firecrawl auf BMF DBA-Übersicht |
| "aktuell", "2024", "2025", "neu" | Aktualitätscheck erzwingen | Firecrawl auf offizielle Quelle |
| "sicher?", "stimmt das?", "zuverlässig?" | Deep Research aktivieren | openrouter-skill-v3 |
| Strafrecht-Keywords ("Betrug", "Haftung", "Anzeige") | Strafrechtlichen Disclaimer hinzufügen | — |

---

## Quellen-Erneuerung

### Cache-Strategie

| Quellentyp | Gültigkeit | Erneuerung |
|---|---|---|
| Gesetzestexte (MCP) | 24 Stunden | Bei nächster Abfrage neu laden |
| API-Ergebnisse (RIS, Federal Register) | Live | Immer frisch (kein Cache) |
| Crawl-Ergebnisse (Firecrawl) | 1 Stunde | Bei erneuter Abfrage neu crawlen |
| Deep Research Ergebnisse | Session | Nicht cachen (zu individuell) |
| Handelsregister-Daten | 7 Tage | Bei erneuter Abfrage prüfen |

### Aktualitäts-Signale

Das Plugin erkennt automatisch, dass eine Quelle möglicherweise veraltet ist:
1. **Normzitat mit Datum**: "in der Fassung vom [Datum]" → Prüfen ob neuere Fassung existiert
2. **Steuerjahr-Referenz**: "Steuerjahr 2023" → Prüfen ob für aktuelles Jahr anders
3. **"Stand:"**: Wenn Stand älter als 6 Monate → Warnung + Frisch-Abfrage
4. **Gesetzesänderung erwähnt**: → Automatisch neueste Fassung laden
