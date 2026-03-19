# Plan: Professionelle Beratungs-Suite Plugin

## Context

Der User entwickelt ein Claude Code Plugin "professionelle-beratungs-suite" das drei Säulen vereint: Recht, Steuern und Unternehmensberatung. Grundlage sind 7 Research-Dokumente (4x Deep Research, 1x API-Tests, 1x Devil's Advocate Analyse, 1x MCP-Alternativen) sowie ein Google Doc mit Architektur-Vision. Das Plugin soll autonom zusätzliche Informationen beschaffen, wenn nötig, und ein mehrstufiges Validierungssystem mit Confidence-Scoring implementieren.

---

## Plugin-Struktur

```
plugins/professionelle-beratungs-suite/
├── .claude-plugin/
│   └── plugin.json                    ← Manifest
├── .mcp.json                          ← MCP-Server-Anbindungen
├── skills/
│   ├── recht-recherche/SKILL.md       ← DE/DACH/EU/USA/UAE Rechtsquellen
│   ├── steuer-analyse/SKILL.md        ← Nationales + internationales Steuerrecht
│   └── beratung-strategie/SKILL.md    ← Strategische Analyse, Marktintelligenz
├── agents/
│   ├── jurist.md                      ← Rechtsrecherche-Spezialist (Opus)
│   ├── steuerberater.md               ← Steuerrechtliche Analyse (Opus)
│   ├── strategie-consultant.md        ← Strategische Beratung (Sonnet)
│   ├── validator.md                   ← Confidence Scoring (Opus)
│   └── devils-advocate.md             ← Widerlegen + Blind Spots + Gray Areas (Opus)
├── commands/
│   ├── recht-analyse.md               ← /recht-analyse
│   ├── steuer-check.md                ← /steuer-check
│   └── strategie-entwurf.md           ← /strategie-entwurf
├── hooks/
│   └── hooks.json                     ← Disclaimer-Enforcement
├── references/
│   ├── disclaimer-system.md           ← Rechtshinweise, Disclaimer-Texte
│   ├── confidence-scoring.md          ← Scoring-Algorithmus
│   ├── quellen-registry.md            ← Alle Quellen mit Status + Fallbacks
│   ├── autonome-recherche.md          ← Entscheidungsbaum für Infobeschaffung
│   └── jurisdiktions-mapping.md       ← Stichwort → Jurisdiktion → Quellen
├── scripts/
│   ├── setup-check.sh                 ← MCP-Verbindungstests
│   ├── ris-austria-query.py           ← RIS Österreich API Client
│   ├── eurlex-sparql-query.py         ← EUR-Lex SPARQL Client
│   ├── fedlex-sparql-query.py         ← Fedlex SPARQL Client
│   └── confidence-calculator.py       ← Scoring-Logik als Script
└── templates/
    ├── legal-memo.md                  ← Rechtsgutachten-Format
    ├── tax-analysis.md                ← Steuerliche Stellungnahme
    └── strategy-report.md             ← Management-Summary
```

---

## MCP-Server (.mcp.json)

| Server | Zweck | Status |
|--------|-------|--------|
| rechtsinformationen-bund-de-mcp | DE Bundesrecht (6.870 Statuten) | Sofort nutzbar |
| german-law-mcp (@ansvar-systems) | DE Gesetze + Zitatprüfung | Sofort nutzbar |
| ayunis-legal-mcp | Semantische Suche (pgvector) | Sofort nutzbar |
| openregister-mcp | Handelsregister | Sofort nutzbar |
| *Firecrawl* (bereits installiert) | Web-Crawling | Bereits verfügbar |
| *openrouter-skill-v3* (bereits als Skill) | Deep Research | Bereits verfügbar |

**Direkte API-Calls via Scripts** (kein MCP nötig):
- RIS Österreich (`data.bka.gv.at`) — JSON, beste API
- EUR-Lex SPARQL (`publications.europa.eu`)
- Fedlex SPARQL (`fedlex.data.admin.ch`)
- Federal Register API (`federalregister.gov`) — JSON
- GovInfo API (`api.govinfo.gov`) — JSON, DEMO_KEY
- World Bank API (`api.worldbank.org`)

---

## Autonome Informationsbeschaffung

Entscheidungsbaum (implementiert in `references/autonome-recherche.md`):

```
Anfrage erhalten
├── Primärquellen abfragen (MCP-Server)
│   ├── >= 2 unabhängige Quellen? → weiter zu Validierung
│   └── < 2 Quellen → Sekundärquellen aktivieren:
│       ├── Firmenname erwähnt? → openregister-mcp (Handelsregister)
│       ├── Aktuelle Entwicklung? → Firecrawl (Nachrichtenquellen)
│       ├── Komplexe Rechtsfrage? → Deep Research (Gemini/Perplexity)
│       ├── Grenzüberschreitend? → Zusätzliche Jurisdiktionen
│       └── Immer noch < 2 Quellen? → Confidence "niedrig" + Disclaimer
```

**Trigger-Signale:**
1. Unternehmensname → automatisch Handelsregister
2. Keine Treffer → Fallback-Kette (nächste Quelle)
3. Norm älter 1 Jahr → Aktualitätscheck via Crawling
4. Grenzüberschreitend → DBA + zusätzliche Jurisdiktionen
5. User fragt "sicher?" → Deep Research aktivieren

---

## Validierungssystem (Confidence Scoring)

### Multi-Source-Confirmation (Basis-Score)
- 0 Quellen: 0 — 1 Quelle: 30 — 2 Quellen: 55 — 3+ Quellen: 75

### Modifikatoren
- Offizielle Primärquelle (Amtsblatt): +15
- Offizielle API (RIS, EUR-Lex): +10
- Community-Quelle: +0
- Deep-Research-Ergebnis: -5 (Halluzinationsrisiko)
- Quellen widersprechen sich: -20
- Devil's Advocate findet Gegenargument: -10
- Aktualität < 7 Tage: +5 / > 1 Jahr: -15

### Score-Interpretation
| Score | Label | Verhalten |
|-------|-------|-----------|
| 90-100 | SEHR HOCH | Minimaler Disclaimer |
| 70-89 | HOCH | Standard-Disclaimer |
| 50-69 | MITTEL | Ausführlicher Disclaimer, fachliche Prüfung empfohlen |
| 30-49 | NIEDRIG | "Zwingend fachliche Beratung einholen" |
| 0-29 | SEHR NIEDRIG | "Keine zuverlässige Aussage möglich" |

### Drei-Agenten-Validierung (bei Score < 70 oder auf Nachfrage)
1. **Validator** — Quellen zählen, Scoring berechnen
2. **Devil's Advocate** — Aktiv widerlegen: "Was spricht GEGEN diese Aussage?"
3. **Blind Spot + Gray Area** — "Was wurde übersehen? Wo sind Grauzonen?"

### Pflicht-Disclaimer (JEDE Ausgabe)
> Diese Information dient der allgemeinen Orientierung und stellt keine Rechts-/Steuerberatung dar. Für verbindliche Auskünfte: zugelassenen Rechtsanwalt/Steuerberater konsultieren. [Confidence: XX% — N Quellen]

---

## Implementierungsreihenfolge

| Phase | Was | Dateien | Abhängigkeit |
|-------|-----|---------|-------------|
| 1 | Plugin-Grundgerüst | plugin.json, .mcp.json | — |
| 2 | Drei Kern-Skills | 3x SKILL.md | Phase 1 |
| 3 | Fünf Agenten | 5x agents/*.md | Phase 2 |
| 4 | Autonome Recherche | references/autonome-recherche.md, jurisdiktions-mapping.md | Phase 2 |
| 5 | Validierungssystem | references/confidence-scoring.md, disclaimer-system.md | Phase 3 |
| 6 | Slash-Commands | 3x commands/*.md | Phase 2+3 |
| 7 | Hooks | hooks/hooks.json | Phase 1 |
| 8 | Scripts | 5x scripts/* | Parallel zu 2-5 |
| 9 | References + Templates | quellen-registry.md, 3x templates | Parallel zu 2-5 |
| 10 | Testing + Deploy | — | Alles |

**Parallelisierbar:** Phase 7-9 können parallel zu Phase 2-5 laufen.

---

## Verification

1. **Plugin-Erkennung**: `cp -r plugins/professionelle-beratungs-suite ~/.claude/plugins/` → neue Session → prüfen ob Skills/Commands geladen werden
2. **MCP-Tests**: `scripts/setup-check.sh` — jeden MCP-Server einzeln testen
3. **Skill-Trigger**: Testen ob "Was sagt das Gesetz zu..." → recht-recherche triggert
4. **End-to-End**: "GmbH-Haftung bei Zahlungsunfähigkeit" → Rechtsrecherche + Handelsregister + Confidence Score + Disclaimer
5. **Confidence-Kalibrierung**: Bekannte Fakten prüfen (z.B. "MwSt-Satz in DE") → Score muss > 90 sein

---

## Kritische Dateien zur Implementierung

- `plugins/professionelle-beratungs-suite/.claude-plugin/plugin.json`
- `plugins/professionelle-beratungs-suite/.mcp.json`
- `plugins/professionelle-beratungs-suite/skills/recht-recherche/SKILL.md`
- `plugins/professionelle-beratungs-suite/references/confidence-scoring.md`
- `plugins/professionelle-beratungs-suite/references/autonome-recherche.md`
- `plugins/professionelle-beratungs-suite/references/disclaimer-system.md`
- `plugins/professionelle-beratungs-suite/agents/validator.md`
- `plugins/professionelle-beratungs-suite/agents/devils-advocate.md`

## Bestehende Patterns die wiederverwendet werden

- **agent-team-creator** (`~/.claude/skills/agent-team-creator/`) — Review-Loop, Confidence-Scoring, Multi-Agent-Koordination
- **openrouter-skill-v3** (`~/.claude/skills/openrouter-skill-v3/`) — Deep Research (Gemini, Perplexity)
- **figma-bridge** (`~/.claude/skills/figma-bridge/`) — Entscheidungsbaum-Pattern in SKILL.md
- **Firecrawl** (installierter Skill) — Web-Crawling für Quellen ohne API
