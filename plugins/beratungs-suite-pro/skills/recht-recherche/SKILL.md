---
name: recht-recherche
description: |
  Professionelle Rechtsrecherche über DACH, EU, USA und UAE Rechtsquellen.
  Verwende diesen Skill wenn der User nach Gesetzen, Verordnungen, Rechtsprechung,
  Compliance-Anforderungen oder regulatorischen Rahmenbedingungen fragt.
  Trigger: "Rechtsrecherche", "Gesetz suchen", "Paragraph", "Verordnung",
  "Compliance", "Regulierung", "legal research", "was sagt das Gesetz",
  "rechtliche Grundlage", "DSGVO", "GDPR", "AGB prüfen", "Vertrag prüfen",
  "Handelsregister", "Impressumspflicht", "Gesellschaftsform", "Haftung",
  "Domain prüfen", "Webseite prüfen", "Impressum", "Datenschutzerklärung",
  "Markenrecht", "Urheberrecht", "PDF Vertrag prüfen", "AGB analysieren".
---

# Recht-Recherche

Professionelle Rechtsrecherche mit Multi-Source-Validierung über alle relevanten Jurisdiktionen.

---

## Wann einsetzen

- User fragt nach Gesetzen, Verordnungen, Rechtsprechung
- User möchte eine Domain/Webseite rechtlich prüfen lassen
- User hat ein PDF (Vertrag, AGB, Rechtsdokument) zur Prüfung
- User fragt nach Compliance-Anforderungen
- User erwähnt eine Gesellschaftsform oder Haftungsfrage
- User fragt nach Impressumspflicht, DSGVO, Datenschutz

---

## Ablauf

### Schritt 1: Anfrage-Analyse + Komplexitäts-Erkennung

Bestimme aus dem Kontext:
- **Jurisdiktion**: DE, AT, CH, EU, USA, UAE — bei Unklarheit nachfragen
- **Rechtsgebiet**: Zivilrecht, Strafrecht, Steuerrecht, Handelsrecht, Datenschutzrecht, etc.
- **Anfrage-Typ**: Gesetzesrecherche, Domain-Prüfung, PDF-Analyse, Compliance-Check
- **Dringlichkeit**: Aktuelle Rechtslage oder historische Analyse
- **Beteiligte Akteure**: Alle Personen, Firmen, Marken, Plattformen identifizieren

#### Komplexitäts-Erkennung (PFLICHT)

Lies `references/ermittlungs-framework.md` für die vollständige Logik.

**EINFACH** → Weiter mit Schritt 2 (Subagent-Modus):
- Einzelne Normfrage ("Was sagt § 14 UStG?")
- Einzelne Rechnungsprüfung, einzelner Compliance-Check
- Definitionsfrage, einzelne Impressumsprüfung

**KOMPLEX** → Agent Team aktivieren (Ermittlungs-Modus):
- Mehrere Akteure/Firmen beteiligt
- Strafrechtliche Keywords ("Betrug", "Scam", "Warnung", "unseriös", "Anzeige")
- Due Diligence oder umfassende Prüfung
- Multi-Jurisdiktion + mehrere Akteure
- User stellt Unterlagen zur Verifizierung bereit
- Verdacht auf illegale Aktivitäten

Bei **KOMPLEX**: Aktiviere `agent-team-creator` mit folgendem Team:

| Agent | Rolle | Modell |
|-------|-------|--------|
| lead | Koordinator, dispatcht Researcher | opus |
| researcher-regulatorik | BaFin, FMA, FINMA, ESMA, SEC (parallel) | sonnet |
| researcher-osint | YouTube, Telegram, FB, Instagram, X (parallel) | sonnet |
| researcher-register | Handelsregister, Companies House (parallel) | sonnet |
| ermittler | Konsolidiert Funde, Netzwerk, Timeline | opus |
| anklaeger | Tatbestandsprüfung, Strafbarkeit, Verjährung | opus |
| fachanwalt | Zivilrecht, Ansprüche, Maßnahmenplan | sonnet |
| devils-advocate | Gegenposition + Blind Spots | opus |

Das Team übernimmt ab hier. Die folgenden Schritte gelten für den **Subagent-Modus (EINFACH)**.

---

### Schritt 2: Proaktive Ermittlung (PFLICHT)

**NIEMALS nur auf User-Unterlagen vertrauen.** Eigenständig ermitteln.

Lies `references/autonome-recherche.md` Schritt 0 für den vollständigen Ablauf.

Kurzversion — für JEDEN beteiligten Akteur:

1. **Regulatorische Warnungen**: BaFin, FMA, FINMA, ESMA, SEC Warnlisten durchsuchen
2. **Digitaler Fußabdruck**: YouTube-Channels, Facebook-Seiten/Gruppen, Telegram-Channels, Instagram, X/Twitter, TikTok, LinkedIn prüfen
3. **Presserecherche**: Google News, Medienberichte zum Akteur suchen
4. **Handelsregister**: Alle genannten Firmen + verknüpfte Unternehmen nachschlagen
5. **Lizenzen verifizieren**: Behauptete Genehmigungen bei Aufsichtsbehörden prüfen
6. **Beweismittel sichern**: Jeden relevanten Fund mit Volltext, URL, Zeitstempel dokumentieren und in `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/` speichern
7. **User-Unterlagen verifizieren**: Behauptungen gegen öffentliche Quellen prüfen — bei Widersprüchen beide Versionen dokumentieren
8. **Vollständigkeitsprüfung**: "Welche Akteure/Kanäle/Plattformen fehlen noch?"

### Schritt 3: Quellen-Routing

Je nach Jurisdiktion die richtigen Quellen ansteuern:

| Jurisdiktion | Primärquellen | Fallback |
|---|---|---|
| DE | rechtsinformationen-bund-mcp → german-law-mcp → ayunis-legal-mcp | Firecrawl auf gesetze-im-internet.de |
| AT | RIS API (`data.bka.gv.at/ris/api/v2.6/Bundesrecht`) | Firecrawl auf ris.bka.gv.at |
| CH | Fedlex SPARQL (`fedlex.data.admin.ch/sparqlendpoint`) | Firecrawl auf admin.ch |
| EU | EU Publications SPARQL → EU_compliance_MCP | Firecrawl auf eur-lex.europa.eu |
| USA | Federal Register API → GovInfo API → open-legal-compliance-mcp | Firecrawl auf law.cornell.edu |
| UAE | Firecrawl auf legislation.ae, difc.ae, tax.gov.ae | Deep Research (Gemini/Perplexity) |

### Schritt 4: Spezial-Analysen

**Domain-Prüfung** (wenn URL/Domain genannt):
1. Webseite crawlen via Firecrawl
2. Impressum prüfen: Pflichtangaben nach § 5 TMG (DE), § 5 ECG (AT), Art. 3 UWG (CH)
3. Datenschutzerklärung prüfen: DSGVO Art. 13/14 Pflichtangaben
4. Cookie-Banner prüfen: ePrivacy, TTDSG § 25
5. AGB prüfen: Klauselverbote nach §§ 307-309 BGB
6. Markenschutz: Domain-Name gegen bekannte Marken prüfen
7. Strafrechtliche Relevanz: Hassrede, Urheberrechtsverletzungen, Betrug

**PDF-Analyse** (wenn PDF bereitgestellt):
1. PDF lesen (Read tool mit PDF-Support)
2. Dokumenttyp erkennen: Vertrag, AGB, Datenschutzerklärung, Bescheid, Urteil
3. Relevante Normen identifizieren
4. Kritische Klauseln markieren (bei Verträgen)
5. Fehlende Pflichtangaben identifizieren
6. Empfehlungen formulieren

### Schritt 5: Autonome Erweiterung

Lies `references/autonome-recherche.md` für den vollständigen Entscheidungsbaum.

Kurzversion:
- Firmenname erwähnt → automatisch openregister-mcp (Handelsregister)
- < 2 unabhängige Quellen → Firecrawl auf weitere Quellen
- Komplexe Rechtsfrage → Deep Research (openrouter-skill-v3: Gemini oder Perplexity)
- Grenzüberschreitend → zusätzliche Jurisdiktionen prüfen
- Norm älter 1 Jahr → Aktualitätscheck via Crawling

### Schritt 6: Validierung

Lies `references/confidence-scoring.md` für die vollständige Scoring-Logik.

1. Multi-Source-Confirmation durchführen (Quellen zählen)
2. Quellen-Qualität bewerten (Primärquelle vs. Crawling vs. Deep Research)
3. Aktualität prüfen
4. Bei Score < 70: Devil's Advocate Agent aktivieren
5. Confidence-Score berechnen und anzeigen

### Schritt 7: Dokument speichern

Lies `references/docs-output.md` für die vollständige Output-Konvention.

1. **Analyse speichern**: Fertige Rechtsanalyse als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` speichern
2. **Recherchen speichern**: Falls substanzielle Deep-Research-Ergebnisse vorliegen (> 500 Wörter oder > 3 Quellen), diese separat in `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/` speichern
3. **Namensschema**: `YYYY-MM-DD-<thema>-<typ>.md` (z.B. `2026-03-18-gmbh-haftung-analyse.md`)
4. **Frontmatter**: Jede Datei mit YAML-Header (titel, datum, typ, skill, jurisdiktion, confidence)
5. **User informieren**: Dateipfad im Output anzeigen

### Schritt 8: Output

Strukturierter Output mit:
- Antwort auf die Rechtsfrage
- Zitierte Normen mit Fundstelle
- Confidence-Score (0-100%)
- Quellenangaben
- Pflicht-Disclaimer (lies `references/disclaimer-system.md`)
- Dateipfad der gespeicherten Analyse

---

## Output-Format

```markdown
## Rechtliche Einschätzung

[Antwort]

### Relevante Normen
- § X Abs. Y [Gesetz] — [Kurzinhalt]
- Art. Z [Verordnung] — [Kurzinhalt]

### Confidence: [XX]% ([Label])
Basiert auf [N] unabhängigen Quellen: [Quellenliste]

---
⚖️ **Hinweis**: Diese Information dient der allgemeinen Orientierung und stellt
keine Rechtsberatung dar. Für verbindliche Auskünfte konsultieren Sie einen
zugelassenen Rechtsanwalt. Stand: [Datum]
---
```

---

## Edge Cases & Fehlerbehandlung

- **Kein Treffer in Primärquelle**: Fallback-Kette durchlaufen, Confidence senken
- **Quellen widersprechen sich**: Beide Positionen darstellen, Confidence auf "MITTEL" oder tiefer
- **PDF nicht lesbar**: User informieren, alternatives Format vorschlagen
- **Domain nicht erreichbar**: User informieren, Cache/Archive prüfen (web.archive.org)
- **Rechtsgebiet unklar**: Nachfragen bevor Recherche startet

---

## Beispiele

### Beispiel 1: Gesetzesrecherche

**Input**: "Was sagt das deutsche Recht zur GmbH-Haftung bei Zahlungsunfähigkeit?"

**Was Claude tut**:
1. Jurisdiktion: DE, Rechtsgebiet: Handelsrecht/Insolvenzrecht
2. rechtsinformationen-bund-mcp → GmbHG, InsO
3. Autonome Erweiterung: BGH-Rechtsprechung via Firecrawl
4. Validierung: 3 Quellen → Confidence 80%

### Beispiel 2: Domain-Prüfung

**Input**: "Prüfe bitte die Webseite example.de auf rechtliche Mängel"

**Was Claude tut**:
1. Firecrawl → Webseite crawlen
2. Impressum gegen § 5 TMG prüfen
3. Datenschutzerklärung gegen DSGVO Art. 13 prüfen
4. Cookie-Banner gegen TTDSG § 25 prüfen
5. Strukturierter Report mit Mängelliste

### Beispiel 3: PDF-Vertrag

**Input**: "Analysiere diesen Mietvertrag" + PDF

**Was Claude tut**:
1. PDF lesen
2. Als Mietvertrag identifizieren → BGB §§ 535 ff.
3. Kritische Klauseln markieren (Schönheitsreparaturen, Kündigungsfristen)
4. Fehlende Pflichtangaben identifizieren
5. Empfehlungen mit Normenverweisen

---

## Referenzen

Lies `references/autonome-recherche.md` für den Entscheidungsbaum zur autonomen Informationsbeschaffung.
Lies `references/confidence-scoring.md` für die vollständige Scoring-Logik.
Lies `references/disclaimer-system.md` für alle Disclaimer-Texte.
Lies `references/jurisdiktions-mapping.md` für das Jurisdiktions-Routing.
Lies `references/docs-output.md` für die Docs-Output-Konvention (Speicherpfade, Namensschema, Frontmatter).
Lies `references/ermittlungs-framework.md` für Komplexitäts-Erkennung, Unternehmens-Verifizierung und Agent-Team-Zusammensetzungen.
Lies `references/kernlogik.md` für den systematischen 8-Phasen-Durchlauf (PFLICHT).
Lies `references/visualisierung.md` für Mermaid-Diagramm-Templates und Farbcodierung.
Verwende `templates/gespraechsnotiz.md` für die kompakte Gesprächsnotiz-Version.
Lies `references/verjährungsfristen.md` für systematische Verjährungs-Berechnung (PFLICHT).
Lies `references/eskalationspfade.md` für Eskalationsstufen, Kostenrechner, Insolvenzrisiko-Check.
Lies `references/massnahmenplan.md` für konkrete Handlungsempfehlungen (PFLICHT am Ende jedes Reports).
Lies `references/erweiterte-prueffelder.md` für Sozialversicherung, Krypto, Schneeballsystem, DSGVO-Grenzen.

---

## Nächster Schritt nach der Analyse

Am Ende jeder abgeschlossenen Rechts-Analyse dem User anbieten:

> "Soll ich jetzt einen konkreten Umsetzungsplan erstellen, der alle Findings in
> priorisierte Handlungsschritte mit Fristen, Kosten und Erfolgskriterien übersetzt?
> → `/umsetzungsplan` starten"

Wenn User zustimmt: Sofort `/umsetzungsplan` mit den aktuellen Findings als Input starten.
Die Findings NICHT erneut erheben — direkt aus dieser Analyse verwenden.
