---
name: ermittlung
description: |
  Starte eine umfassende Ermittlung mit Agent-Team (LKA + Staatsanwaltschaft + Fachanwalt).
  Erzwingt den komplexen Agent-Team-Modus unabhängig von der Komplexitäts-Erkennung.
  Verwende diesen Skill wenn der User eine vollständige Ermittlung starten will.
  Trigger: "Ermittlung starten", "ermittle", "Unternehmen prüfen", "Due Diligence",
  "Betrugsverdacht", "Compliance-Prüfung", "Firma durchleuchten", "Hintergrund-Check",
  "Background Check", "OSINT", "Akteure identifizieren", "Netzwerk aufdecken",
  "/ermittlung".
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - Agent
  - Write
  - Edit
  - WebFetch
  - WebSearch
---

# Ermittlung — Agent-Team-Modus

Starte eine umfassende Ermittlung. Dieser Skill erzwingt den komplexen Agent-Team-Modus
unabhängig von der automatischen Komplexitäts-Erkennung.

## Ablauf

### Schritt 1: Sachverhalt klären

Frage den User nach dem Ermittlungsziel:
- **Unternehmensprüfung** → Welche Firma(s)?
- **Betrugsverdacht** → Welche Akteure?
- **Compliance-Prüfung** → Welche Branche/Regulierung?
- **Due Diligence** → Welches Ziel?

### Schritt 2: Domäne bestimmen

| Domäne | Team-Zusammensetzung |
|--------|---------------------|
| Rechtlich | Lead + Ermittler + Ankläger + Fachanwalt + Devil's Advocate |
| Steuerlich | Lead + Ermittler + Steuerfahnder + Steuerberater + Devil's Advocate |
| Strategisch | Lead + Ermittler + Marktanalyst + Stratege + Devil's Advocate |
| Übergreifend | Lead + Ermittler + Ankläger + Steuerfahnder + Fachanwalt + Devil's Advocate |

### Schritt 3: Agent Team starten

Aktiviere `agent-team-creator` mit dem gewählten Team.
Lies `${CLAUDE_PLUGIN_ROOT}/references/ermittlungs-framework.md` für Team-Zusammensetzungen und Researcher-Agent-Definitionen.

### Schritt 4: Ermittlung durchführen

Team arbeitet autonom mit Review-Loop:
1. Ermittler führt OSINT durch (parallel wo möglich)
2. Fach-Agenten bewerten Findings
3. Validator berechnet Confidence-Scores
4. Devil's Advocate prüft Blind Spots und Gray Areas

### Schritt 5: Ergebnis

Umfassender Ermittlungsbericht wird in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` gespeichert.
Format gemäß `${CLAUDE_PLUGIN_ROOT}/references/docs-output.md`.

## Referenzen

- `${CLAUDE_PLUGIN_ROOT}/references/ermittlungs-framework.md` — Team-Zusammensetzungen
- `${CLAUDE_PLUGIN_ROOT}/references/autonome-recherche.md` — OSINT-Entscheidungsbaum
- `${CLAUDE_PLUGIN_ROOT}/references/kernlogik.md` — 10-Phasen-Durchlauf
- `${CLAUDE_PLUGIN_ROOT}/references/confidence-scoring.md` — Scoring-Algorithmus
- `${CLAUDE_PLUGIN_ROOT}/references/docs-output.md` — Speicherkonvention
