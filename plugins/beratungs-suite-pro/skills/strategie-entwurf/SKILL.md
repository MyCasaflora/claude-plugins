---
name: strategie-entwurf
description: |
  Starte eine strategische Analyse oder Unternehmensberatung mit Validierung.
  Orchestriert den vollständigen Workflow: Analyse → Validierung → Disclaimer → Speichern.
  Verwende diesen Skill wenn der User explizit eine Strategieanalyse starten will.
  Trigger: "/strategie-entwurf", "Strategieanalyse starten", "strategische Analyse",
  "Strategie entwickeln", "Business Plan erstellen", "Marktanalyse starten".
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

# Strategie-Entwurf — Orchestrierter Workflow

Führe eine strategische Analyse mit Consulting-Frameworks und Validierungszyklus durch.

## Ablauf

### Schritt 0: Komplexität prüfen

- **Einfache Analyse** (SWOT, Branchenanalyse) → Subagent-Modus
- **Komplex** (Due Diligence, Legalitätsprüfung, M&A, Multi-Akteur) → automatisch Agent Team
- Für erzwungenen Team-Modus: Verwende den `ermittlung` Skill

### Schritt 1: Frage klären

- **Marktanalyse** → Welche Branche? Welche Region?
- **Wettbewerbsanalyse** → Welche Wettbewerber?
- **Strategieentwicklung** → Welches Ziel?
- **Due Diligence** → Welches Unternehmen?
- **Business Plan** → Welche Geschäftsidee?

### Schritt 2: Framework wählen

SWOT, Porter Five Forces, PESTEL, BCG-Matrix, Business Model Canvas — oder Kombination.
Siehe `${CLAUDE_PLUGIN_ROOT}/references/kernlogik.md` für Phasen-Tiefe.

### Schritt 3: Analyse starten

Aktiviere den `beratung-strategie` Skill mit den gesammelten Informationen.
Bei komplexen Aufträgen: Multi-Agenten-Workflow (Reader → Analyst → Strategist → Formatter).

### Schritt 4: Validierung

Devil's Advocate für Gegenposition bei Empfehlungen.
Bei Score < 70: Blind Spot + Gray Area Prüfung.

### Schritt 5: Speichern

- Report als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` ablegen
- Marktrecherchen in `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/`
- Siehe `${CLAUDE_PLUGIN_ROOT}/references/docs-output.md` für Namensschema

### Schritt 6: Output

Management-Summary mit:
- Framework-Ergebnissen und Visualisierungen (Mermaid)
- Handlungsempfehlungen (priorisiert)
- Confidence-Score (gemäß Bewertungs-Legende A-E)
- Disclaimer (gemäß `${CLAUDE_PLUGIN_ROOT}/references/disclaimer-system.md`)
- Dateipfad zum gespeicherten Dokument

## Referenzen

- `${CLAUDE_PLUGIN_ROOT}/skills/beratung-strategie/SKILL.md` — Strategie-Logik
- `${CLAUDE_PLUGIN_ROOT}/references/confidence-scoring.md` — Scoring
- `${CLAUDE_PLUGIN_ROOT}/references/disclaimer-system.md` — Disclaimer-Texte
- `${CLAUDE_PLUGIN_ROOT}/references/docs-output.md` — Speicherkonvention
