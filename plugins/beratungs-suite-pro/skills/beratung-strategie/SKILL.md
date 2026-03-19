---
name: beratung-strategie
description: |
  Strategische Unternehmensberatung mit Marktintelligenz und Benchmarking.
  Verwende diesen Skill für strategische Analysen, Marktrecherchen,
  Wettbewerbsanalysen oder Geschäftsmodelle.
  NICHT verwenden für: steuerrechtliche Analysen, Steuerberechnungen, DBA-Fragen.
  Für vollständige orchestrierte Strategieanalyse mit Validierung → /strategie-entwurf verwenden.
  Trigger: "Strategie", "Marktanalyse", "Wettbewerbsanalyse", "SWOT",
  "Geschäftsmodell", "Business Plan", "Markteintritt", "Due Diligence",
  "Benchmarking", "KPI", "Skalierung", "strategische Beratung",
  "Unternehmensgründung", "Expansion", "M&A", "Restrukturierung",
  "Porter", "BCG-Matrix", "PESTEL", "Branchenanalyse", "Firmenbewertung",
  "Investorensuche", "Pitch Deck", "Go-to-Market", "Wettbewerber".
---

# Beratung-Strategie

Strategische Unternehmensberatung mit Multi-Agenten-Workflow und Live-Marktdaten.

---

## Wann einsetzen

- User fragt nach Marktanalysen oder Wettbewerbslandschaft
- User plant eine Unternehmensgründung oder Expansion
- User braucht Due Diligence oder Firmenbewertung
- User möchte strategische Frameworks anwenden (SWOT, Porter, etc.)
- User fragt nach Benchmarking oder KPIs

---

## Ablauf

### Schritt 1: Analyse-Typ erkennen + Komplexitäts-Erkennung

| Typ | Methode | Datenquellen |
|-----|---------|-------------|
| Marktanalyse | PESTEL + Porter's Five Forces | Deep Research + Firecrawl |
| Wettbewerbsanalyse | Competitive Mapping | openregister-mcp + Deep Research |
| Strategieentwicklung | SWOT + BCG-Matrix | Alle verfügbaren Quellen |
| Due Diligence | Finanzen + Recht + Markt | openregister-mcp + Rechts-MCPs |
| Benchmarking | KPI-Vergleich | World Bank API + Branchendaten |
| Geschäftsmodell | Business Model Canvas | Deep Research |

#### Komplexitäts-Erkennung (PFLICHT)

Lies `references/ermittlungs-framework.md` für die vollständige Logik.

**EINFACH** → Weiter mit Schritt 2 (Subagent-Modus):
- Einzelne SWOT-Analyse für eine Geschäftsidee
- Einfache Branchenrecherche
- Einzelner KPI-Vergleich
- Business Model Canvas für ein Produkt

**KOMPLEX** → Agent Team aktivieren (Ermittlungs-Modus):
- Due Diligence (Unternehmensprüfung)
- Wettbewerbsanalyse mit Verdacht auf unlauteren Wettbewerb
- Multi-Markt-Expansion mit regulatorischen Risiken
- Prüfung eines Geschäftsmodells auf Legalität
- Investoren-Due-Diligence / M&A-Prüfung
- Verdacht auf Marktmanipulation oder irreführende Praktiken

Bei **KOMPLEX**: Aktiviere `agent-team-creator` mit folgendem Team:

| Agent | Rolle | Modell |
|-------|-------|--------|
| lead | Koordinator, dispatcht Researcher | opus |
| researcher-osint | Social Media, Wettbewerber, Presse (parallel) | sonnet |
| researcher-register | Handelsregister, Patente, Marken (parallel) | sonnet |
| ermittler | Konsolidiert, Wettbewerber-Netzwerk | opus |
| marktanalyst | Frameworks, Trends, Benchmarks | sonnet |
| stratege | Handlungsempfehlungen, Risiko, Maßnahmenplan | opus |
| devils-advocate | Gegenposition | opus |

Das Team übernimmt ab hier. Die folgenden Schritte gelten für den **Subagent-Modus (EINFACH)**.

---

### Schritt 2: Datenquellen aktivieren

1. **Handelsregister**: openregister-mcp für Firmendaten, Gesellschafter, Jahresabschlüsse
2. **Marktdaten**: Deep Research via openrouter-skill-v3 (Gemini Deep Research)
3. **Länderdaten**: World Bank API für makroökonomische Indikatoren
4. **Branchendaten**: Firecrawl auf Branchenverbands-Seiten, Statista (soweit frei)
5. **Wettbewerbsdaten**: Firecrawl auf Wettbewerber-Webseiten, Bundesanzeiger

### Schritt 3: Framework anwenden

**SWOT-Analyse:**
- Strengths: Interne Stärken aus Firmendaten
- Weaknesses: Interne Schwächen
- Opportunities: Externe Chancen aus Marktdaten
- Threats: Externe Risiken (regulatorisch, Wettbewerb)

**Porter's Five Forces:**
- Wettbewerber-Rivalität
- Bedrohung durch neue Marktteilnehmer
- Bedrohung durch Substitute
- Verhandlungsmacht der Lieferanten
- Verhandlungsmacht der Kunden

**PESTEL:**
- Political, Economic, Social, Technological, Environmental, Legal

### Schritt 4: Multi-Agenten-Workflow (bei komplexen Aufträgen)

Bei umfangreichen Analysen wird der Multi-Agenten-Workflow aktiviert:

1. **Reader Agent** (Sonnet) — Daten aus allen Quellen sammeln
2. **Analyst Agent** (Opus) — Trends identifizieren, Frameworks befüllen
3. **Strategist Agent** (Opus) — Handlungsempfehlungen entwickeln
4. **Formatter Agent** (Sonnet) — Professioneller Report im Template-Format

### Schritt 5: Validierung

Confidence-Scoring wie bei anderen Skills.
Bei strategischen Empfehlungen: Devil's Advocate für Gegenposition.

### Schritt 6: Dokument speichern

Lies `references/docs-output.md` für die vollständige Output-Konvention.

1. **Report speichern**: Fertigen Strategie-Report als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` speichern
2. **Recherchen speichern**: Falls substanzielle Marktrecherchen, Wettbewerbsdaten oder Deep-Research-Ergebnisse vorliegen, diese in `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/` speichern
3. **Namensschema**: `YYYY-MM-DD-<thema>-<typ>.md` (z.B. `2026-03-18-fintech-markt-report.md`)
4. **Frontmatter**: Jede Datei mit YAML-Header (titel, datum, typ, skill, jurisdiktion, confidence)
5. **User informieren**: Dateipfad im Output anzeigen

---

## Output-Format

Verwende `templates/strategy-report.md` als Basis:

```markdown
## Executive Summary
[2-3 Sätze Kernaussage]

## Analyse
[Framework-basierte Analyse mit Daten]

## Handlungsempfehlungen
1. [Empfehlung mit Begründung]
2. [Empfehlung mit Begründung]

## Risiken
- [Risiko + Mitigation]

### Confidence: [XX]%
### Quellen: [N] unabhängige Quellen
```

---

## Edge Cases

- **Keine Firmendaten verfügbar**: Deep Research als Fallback, Confidence senken
- **Branche zu nischig**: Breitere Suche, benachbarte Branchen einbeziehen
- **Internationale Märkte ohne Daten**: World Bank + Deep Research, Disclaimer "begrenzte Datenlage"
- **Sensible Finanzdaten**: Nur öffentlich verfügbare Daten verwenden

---

## Referenzen

Lies `references/autonome-recherche.md` für den Entscheidungsbaum.
Lies `references/confidence-scoring.md` für die Scoring-Logik.
Lies `references/docs-output.md` für die Docs-Output-Konvention (Speicherpfade, Namensschema, Frontmatter).
Lies `references/ermittlungs-framework.md` für Komplexitäts-Erkennung, Unternehmens-Verifizierung und Agent-Team-Zusammensetzungen.
Lies `references/kernlogik.md` für den systematischen 8-Phasen-Durchlauf (PFLICHT).
Lies `references/visualisierung.md` für Mermaid-Diagramm-Templates (Marktposition, Wertschöpfungskette).
Verwende `templates/gespraechsnotiz.md` für die kompakte Gesprächsnotiz-Version.
Lies `references/eskalationspfade.md` für Mediation, Schlichtung, Kostenrechner.
Lies `references/massnahmenplan.md` für konkrete Handlungsempfehlungen (PFLICHT am Ende jedes Reports).
Lies `references/erweiterte-prueffelder.md` für ESG, IP/Marken, Mitarbeiter-Analyse, Supply-Chain, Kundenkonzentration.

---

## Nächster Schritt nach der Analyse

Am Ende jeder abgeschlossenen Strategie-Analyse dem User anbieten:

> "Soll ich jetzt einen konkreten Umsetzungsplan erstellen, der alle Findings in
> priorisierte Handlungsschritte mit Fristen, Kosten und Erfolgskriterien übersetzt?
> → `/umsetzungsplan` starten"

Wenn User zustimmt: Sofort `/umsetzungsplan` mit den aktuellen Findings als Input starten.
Die Findings NICHT erneut erheben — direkt aus dieser Analyse verwenden.
