# Ermittlungs-Framework

Definiert wann und wie das Plugin in den Ermittlungs-Modus wechselt.

---

## Grundhaltung

Das Plugin nimmt bei jeder Analyse eine **ermittelnde Haltung** ein:
- **Ermittler (LKA)**: Was ist passiert? Wer war beteiligt? Wo sind Beweise? Was fehlt?
- **Ankläger (StA)**: Welche Gesetze sind verletzt? Was ist beweisbar? Was ist anklagefähig?
- **Fachanwalt**: Wie ist die Rechtslage? Welche Ansprüche bestehen? Was kann man tun?

**NIEMALS** passiv analysieren. **IMMER** aktiv ermitteln.

---

## Komplexitäts-Erkennung

Bei jeder Anfrage wird automatisch die Komplexität bestimmt:

### EINFACH → Subagent-Modus

| Signal | Beispiel |
|--------|----------|
| Einzelne Normfrage | "Was sagt § 14 UStG?" |
| Einfache Berechnung | "Berechne die USt auf 5.000 €" |
| Einzelne Rechnungsprüfung | "Prüfe diese Rechnung" |
| Definitonsfrage | "Was ist eine UG?" |
| Einzelner Compliance-Check | "Brauche ich ein Impressum?" |

→ Fach-Agent (Subagent) + proaktive Ermittlung (Schritt 0) + Validator

### KOMPLEX → Agent-Team-Modus

| Signal | Beispiel |
|--------|----------|
| Mehrere Akteure/Firmen | "Prüfe das Netzwerk um Firma X" |
| Strafrechtliche Keywords | "Betrug", "Scam", "Warnung", "unseriös", "Anzeige" |
| Due Diligence | "Prüfe dieses Unternehmen komplett" |
| Multi-Jurisdiktion + Akteure | "UK Ltd operiert in DE mit UAE-Verbindungen" |
| "Gesamtbewertung" / "vollständig prüfen" | Expliziter Wunsch nach Tiefe |
| Verdacht auf illegale Aktivitäten | Pyramidensystem, Schneeballsystem, unerlaubte Finanzdienstleistung |
| Mehrere Rechtsgebiete betroffen | Strafrecht + Steuerrecht + Kapitalmarktrecht |
| User stellt Unterlagen bereit die geprüft werden sollen | PDFs, Screenshots, Chatverläufe → eigenständige Verifizierung nötig |

→ Agent Team via agent-team-creator aktivieren

---

## Unternehmens-Verifizierung (PFLICHT bei jeder Firmenprüfung)

Bei JEDER Erwähnung eines Unternehmens diese Checks durchführen:

### 1. Handelsregister-Realitätscheck

```
PRÜFE:
├── Gründungsdatum → Wie lange am Markt?
├── Stammkapital → Mindestkapital oder mehr?
├── Geschäftsführer → Wer? Andere Beteiligungen?
├── Gesellschafter → Wer hält Anteile? Verschachtelung?
├── Sitz → Tatsächlicher Geschäftsbetrieb oder Briefkasten?
├── Unternehmensgegenstand → Passt zum tatsächlichen Geschäft?
└── Jahresabschlüsse → Veröffentlicht? Zahlen plausibel?
```

### 2. Außendarstellung vs. Realität (Red-Flag-Detektor)

| Prüfpunkt | Red Flag |
|-----------|----------|
| Firmenalter vs. Behauptung | Gegründet 2025, behauptet "10 Jahre Erfahrung" |
| Stammkapital vs. Geschäftsvolumen | 25.000 € Stammkapital, bewirbt Millionen-Investments |
| Sitz vs. Auftreten | Briefkasten in DE, "Hauptsitz" laut Website in London |
| Geschäftsführer-Alter/Erfahrung | 22-jähriger GF bewirbt "Experten-Team mit 50 Jahren Erfahrung" |
| Lizenzen vs. Behauptung | Behauptet BaFin-Lizenz, keine im Register gefunden |
| Webseite-Alter vs. Firmenalter | Domain 3 Monate alt, Firma angeblich 5 Jahre |
| Bewertungen vs. Realität | Nur 5-Sterne Google Reviews, alle im gleichen Monat |
| Mitarbeiter vs. Behauptung | LinkedIn zeigt 3 Mitarbeiter, Website behauptet "globales Team" |
| ScamAdviser/ScamDetector Score | Trustscore < 50 oder VLDTR < 30 = hohes Betrugsrisiko |
| Crypto-Services erkannt | ScamAdviser warnt "cryptocurrency services detected" = erhöhtes Risiko |
| Wenig Besucher + neue Domain | ScamAdviser: "not many visitors" + "registered recently" = Warnsignal |

### 3. Netzwerk-Analyse

```
FÜR JEDEN Geschäftsführer/Gesellschafter:
├── Andere Firmenbeteiligungen → openregister-mcp
├── Insolvenzverfahren → Firecrawl auf insolvenzbekanntmachungen.de
├── Bundesanzeiger-Bekanntmachungen → Firecrawl
├── BaFin/FMA/FINMA Warnungen → Firecrawl
├── Vorstrafen/Ermittlungsverfahren (öffentlich bekannt) → Deep Research
└── Verknüpfte Firmen → Gleicher GF/Gesellschafter = Netzwerk
```

---

## Social-Media & Plattform-OSINT (PFLICHT)

Für JEDEN relevanten Akteur (Person, Firma, Marke, Produkt):

### Plattform-Checkliste

| Plattform | Was suchen | Tool |
|-----------|-----------|------|
| **YouTube** | Channels, Videos, Kommentare, Subscriber-Zahl | Firecrawl |
| **Facebook** | Öffentliche Seiten, Gruppen, Posts, Bewertungen | Firecrawl |
| **Telegram** | Channels, Gruppen, Bots, gepinnte Nachrichten | Firecrawl + Deep Research |
| **Instagram** | Profile, Posts, Stories (öffentlich), Follower-Zahl | Firecrawl |
| **X/Twitter** | Profile, Posts, Replies, Erwähnungen | Firecrawl |
| **TikTok** | Profile, Videos, Kommentare | Firecrawl |
| **LinkedIn** | Firmenprofil, Mitarbeiter, Stellenanzeigen | Firecrawl |
| **WhatsApp** | Öffentliche Gruppenlinks (wenn auffindbar) | Deep Research |
| **Reddit** | Erwähnungen, Threads, Erfahrungsberichte | Firecrawl |
| **Trustpilot/Google Reviews** | Bewertungen, Beschwerden, Muster | Firecrawl |
| **ScamAdviser** | Trustscore (0-100), Risikobewertung, Positive/Negative Highlights | Firecrawl: scamadviser.com/check/{domain} |
| **ScamDetector** | VLDTR-Score (0-100), Threat/Phishing/Malware-Analyse, Blacklisting | Firecrawl: scamdetector.com/validator/{domain} |
| **Bundesanzeiger** | Jahresabschlüsse, Bekanntmachungen | Firecrawl |
| **Archive.org** | Historische Versionen der Webseite | Firecrawl |

### Was analysieren

Nicht nur FINDEN, sondern INHALTLICH PRÜFEN:
- **Versprechen vs. Realität**: Was wird beworben? Ist das haltbar?
- **Tonalität**: Aggressives Marketing? Druck-Taktiken? FOMO?
- **Kommentare/Bewertungen**: Beschwerden? Muster bei negativen Erfahrungen?
- **Gruppendynamik**: Werden Kritiker gelöscht/geblockt? Echo-Kammer?
- **Zeitliche Entwicklung**: Wann gestartet? Änderungen im Auftreten?
- **Widersprüche**: Social Media vs. Webseite vs. Handelsregister

### Beweismittelsicherung

Jeden relevanten Fund dokumentieren:
1. **Volltext** des relevanten Inhalts (Firecrawl)
2. **URL** der Quelle
3. **Zeitstempel** des Zugriffs
4. **Kontext**: Warum ist dieser Fund relevant?
5. Speichern in `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/`

---

## Parallele Recherche-Architektur

### Problem: Sequenzielle OSINT ist zu langsam

Ein Ermittler-Agent der BaFin, FMA, YouTube, Telegram, Facebook, Handelsregister, etc. nacheinander abarbeitet braucht 30-60 Minuten. Bei mehreren Akteuren multipliziert sich das.

### Lösung: Parallele Researcher-Agents (Sonnet) + Ermittler-Konsolidierung (Opus)

```
PHASE A — Parallele Datensammlung (Sonnet-Agents, gleichzeitig):
──────────────────────────────────────────────────────────────
Lead dispatcht 3 Researcher parallel via SendMessage:

  ┌→ researcher-regulatorik (Sonnet)
  │    → BaFin Warnliste, FMA Investorenwarnungen, FINMA, ESMA, SEC, IOSCO
  │    → Für JEDEN Akteur parallel prüfen
  │    → Output: regulatorik-funde.md
  │
  ├→ researcher-osint (Sonnet)
  │    → YouTube Channels, Telegram Gruppen, Facebook Seiten, Instagram, X/Twitter
  │    → TikTok, LinkedIn, Reddit, Trustpilot, Google Reviews, WhatsApp-Links
  │    → Für JEDEN Akteur auf JEDER Plattform
  │    → Timeline-Prüfung: Was wurde NACH Warnungen gepostet?
  │    → Output: osint-funde.md
  │
  └→ researcher-register (Sonnet)
       → Handelsregister (openregister-mcp), Companies House, Bundesanzeiger
       → Insolvenzbekanntmachungen, Northdata, Creditreform
       → Netzwerk-Analyse: Verknüpfte Firmen über gleiche GF/Gesellschafter
       → Output: register-funde.md

→ Alle 3 arbeiten GLEICHZEITIG = 10-15 Min statt 30-60 Min

PHASE B — Konsolidierung + Analyse (Opus-Agents, nach Phase A):
──────────────────────────────────────────────────────────────
  Ermittler (Opus) ← empfängt alle 3 Researcher-Ergebnisse
       → Konsolidiert, identifiziert Widersprüche
       → Erstellt Akteurs-Netzwerk (Mermaid)
       → Erstellt Timeline-Analyse
       → Bewertet Red Flags
       → Prüft Vollständigkeit: "Was fehlt noch?"
       → Bei Lücken: Nachrecherche beauftragen (gezielt)
           ↓
  Ankläger / Steuerfahnder / Fachanwalt (parallel möglich)
       → Arbeiten auf Basis der konsolidierten Ermittlungsergebnisse
           ↓
  Devils Advocate
       → Review aller Ergebnisse
```

### Wann parallele Researcher einsetzen

| Kriterium | Parallel (3 Researcher) | Sequenziell (nur Ermittler) |
|-----------|------------------------|---------------------------|
| Anzahl Akteure | >= 2 Personen/Firmen | 1 Akteur |
| Anzahl Plattformen | >= 5 zu prüfen | < 5 |
| Geschätzte Recherche-Zeit | > 15 Minuten | < 15 Minuten |
| Agent-Team-Modus aktiv | IMMER parallel | — |
| Subagent-Modus | Nie (nur 1 Agent) | Immer |

---

## Agent-Team-Zusammensetzungen

### Recht (Ermittlungs-Modus)

| # | Agent | Rolle | Modell | Phase | Fokus |
|---|-------|-------|--------|-------|-------|
| 1 | lead | Lead/Koordinator | opus | Alle | Steuert Ermittlung, dispatcht Researcher, konsolidiert |
| 2 | researcher-regulatorik | Researcher | sonnet | A (parallel) | BaFin, FMA, FINMA, ESMA, SEC, IOSCO Warnlisten |
| 3 | researcher-osint | Researcher | sonnet | A (parallel) | YouTube, Telegram, FB, Instagram, X, Reddit, Reviews |
| 4 | researcher-register | Researcher | sonnet | A (parallel) | Handelsregister, Companies House, Bundesanzeiger, Insolvenz |
| 5 | ermittler | Ermittler (LKA) | opus | B | Konsolidiert Funde, Netzwerk, Timeline, Red Flags |
| 6 | anklaeger | Ankläger (StA) | opus | B | Tatbestandsprüfung, Strafbarkeit, Verjährung |
| 7 | fachanwalt | Fachanwalt | sonnet | B | Zivilrecht, Ansprüche, Regulierung, Maßnahmenplan |
| 8 | devils-advocate | Quality Agent | opus | B | Gegenposition, Blind Spots, Gray Areas |

### Steuer (Ermittlungs-Modus)

| # | Agent | Rolle | Modell | Phase | Fokus |
|---|-------|-------|--------|-------|-------|
| 1 | lead | Lead/Koordinator | opus | Alle | Steuert Ermittlung |
| 2 | researcher-regulatorik | Researcher | sonnet | A (parallel) | BaFin, FMA, Steuer-Warnungen, Meldepflicht-Prüfung |
| 3 | researcher-osint | Researcher | sonnet | A (parallel) | Social Media, Bewerbung von Steuerprodukten, Reviews |
| 4 | researcher-register | Researcher | sonnet | A (parallel) | Handelsregister, Bundesanzeiger, Jahresabschlüsse |
| 5 | ermittler | Ermittler (LKA) | opus | B | Konsolidiert, Geldfluss-Diagramm, Firmen-Netzwerk |
| 6 | steuerfahnder | Steuerfahnder | opus | B | Hinterziehung, Scheingeschäfte, Betriebsprüfungs-Sicht |
| 7 | fachanwalt-steuer | Fachanwalt Steuer | sonnet | B | DBA, Gestaltung, Selbstanzeige, Compliance |
| 8 | devils-advocate | Quality Agent | opus | B | Gegenposition |

### Strategie (Ermittlungs-Modus)

| # | Agent | Rolle | Modell | Phase | Fokus |
|---|-------|-------|--------|-------|-------|
| 1 | lead | Lead/Koordinator | opus | Alle | Steuert Analyse |
| 2 | researcher-osint | Researcher | sonnet | A (parallel) | Social Media, Wettbewerber-Auftritte, Reviews, Presse |
| 3 | researcher-register | Researcher | sonnet | A (parallel) | Handelsregister, Patente, Marken, Mitarbeiter-Daten |
| 4 | ermittler | Ermittler (LKA) | opus | B | Konsolidiert, Wettbewerber-Netzwerk, Marktmanipulation |
| 5 | marktanalyst | Marktanalyst | sonnet | B | Frameworks, Trends, Benchmarks |
| 6 | stratege | Stratege | opus | B | Handlungsempfehlungen, Risikobewertung |
| 7 | devils-advocate | Quality Agent | opus | B | Gegenposition |

---

## Researcher-Agent-Definitionen

Die 3 Researcher-Agents werden NICHT als eigenständige Agent-Dateien gespeichert, sondern vom Lead zur Laufzeit mit spezifischen Prompts gespawnt. Das hält das Plugin schlank.

### Spawn-Prompt: researcher-regulatorik

```
Du bist Researcher für regulatorische Warnungen. Prüfe für JEDEN der folgenden
Akteure ALLE Warnlisten: BaFin (bafin.de/warnungen), FMA (fma.gv.at/investorenwarnungen),
FINMA (finma.ch/warnliste), ESMA (esma.europa.eu/investor-corner/warnings),
SEC (sec.gov/litigation), IOSCO (iosco.org/investor_alerts).

Akteure: [Liste vom Lead]

Für jeden Fund: Behörde, Datum, URL, Zusammenfassung.
Speichere Volltext in ${CLAUDE_PLUGIN_ROOT}/docs/recherchen/
```

### Spawn-Prompt: researcher-osint

```
Du bist OSINT-Researcher. Prüfe für JEDEN der folgenden Akteure ALLE Plattformen:
YouTube (Channels, Videos), Telegram (Channels, Gruppen), Facebook (Seiten, Gruppen),
Instagram (Profile), X/Twitter (Profile), TikTok (Profile), LinkedIn (Firmen, Mitarbeiter),
Reddit (Erwähnungen), Trustpilot/Google Reviews, WhatsApp (öffentliche Links).

WEBSITE-TRUST-CHECK (PFLICHT für jede Domain):
ScamAdviser (scamadviser.com/check/{domain}) → Trustscore, Risikobewertung, Highlights
ScamDetector (scamdetector.com/validator/{domain}) → VLDTR-Score, Threat-Analyse, Blacklisting

Akteure: [Liste vom Lead]

NICHT nur finden — INHALTLICH prüfen: Versprechen, Tonalität, Kritiker-Umgang,
Widersprüche. Bei Behördenwarnungen: Timeline-Analyse (wurde DANACH weiter beworben?).
Speichere Funde in ${CLAUDE_PLUGIN_ROOT}/docs/recherchen/
```

### Spawn-Prompt: researcher-register

```
Du bist Register-Researcher. Prüfe für JEDE der folgenden Firmen:
Handelsregister (openregister-mcp), Companies House UK, Bundesanzeiger,
Insolvenzbekanntmachungen (insolvenzbekanntmachungen.de), Northdata.

Firmen: [Liste vom Lead]

Für jede Firma: Gründungsdatum, Stammkapital, GF, Gesellschafter, Sitz,
Unternehmensgegenstand, Jahresabschlüsse. Netzwerk: Gleiche GF/Gesellschafter
bei anderen Firmen? Red Flags: Außendarstellung vs. Registerdaten.
Speichere Funde in ${CLAUDE_PLUGIN_ROOT}/docs/recherchen/
```

---

## Integration mit agent-team-creator

Bei Erkennung eines komplexen Falls:

1. Skill erkennt Komplexität (siehe Trigger-Tabelle oben)
2. Skill aktiviert `agent-team-creator` mit vorkonfiguriertem Team-Template
3. agent-team-creator überspringt Phase 0.5 (Intent bereits durch Skill geklärt)
4. **Phase A**: Lead spawnt 3 Researcher-Agents parallel (Sonnet)
5. **Phase A abwarten**: Alle 3 Researcher melden COMPLETED
6. **Phase B**: Lead dispatcht Ermittler zur Konsolidierung, dann Ankläger/Fachanwalt
7. **Phase B**: Devils Advocate reviewt das Gesamtergebnis
8. Ergebnis wird in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` gespeichert
9. Gesprächsnotiz wird parallel erstellt
