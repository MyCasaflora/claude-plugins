---
name: steuer-check
description: |
  Starte eine steuerrechtliche Analyse oder Berechnung mit Validierung.
  Orchestriert den vollständigen Workflow: Analyse → Validierung → Disclaimer → Speichern.
  Verwende diesen Skill wenn der User explizit eine Steueranalyse starten will.
  Trigger: "/steuer-check", "Steueranalyse starten", "Steuer prüfen",
  "steuerliche Analyse", "Steuerberechnung", "Rechnungsprüfung starten".
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

# Steuer-Check — Orchestrierter Workflow

Führe eine steuerrechtliche Analyse mit vollständigem Validierungszyklus durch.

## Ablauf

### Schritt 0: Komplexität prüfen

- **Einfache Berechnung** (einzelne Steuerart, klare Zahlen) → Subagent-Modus
- **Komplex** (Holding-Strukturen, Steuerhinterziehungsverdacht, Multi-Jurisdiktion) → automatisch Agent Team
- Für erzwungenen Team-Modus: Verwende den `ermittlung` Skill

### Schritt 1: Frage klären

- **Steuerberechnung** → Welche Steuerart? Welche Zahlen?
- **Rechnungsprüfung** → Rechnung als PDF oder Text bereitstellen
- **DBA-Analyse** → Welche Länder beteiligt?
- **Steuerliche Auswirkung** → Welche Transaktion?

### Schritt 2: Region

DE, AT, CH, EU, USA, UAE — oder grenzüberschreitend?
Verwende `${CLAUDE_PLUGIN_ROOT}/references/jurisdiktions-mapping.md` für Quellen-Routing.

### Schritt 3: Analyse starten

Aktiviere den `steuer-analyse` Skill mit den gesammelten Informationen.
Folge dem Ablauf in `${CLAUDE_PLUGIN_ROOT}/skills/steuer-analyse/SKILL.md`.

### Schritt 4: Validierung

Confidence-Score + Disclaimer berechnen.
Lies `${CLAUDE_PLUGIN_ROOT}/references/confidence-scoring.md`.

### Schritt 5: Speichern

- Analyse als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` ablegen
- Recherche-Rohdaten in `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/`
- Siehe `${CLAUDE_PLUGIN_ROOT}/references/docs-output.md` für Namensschema

### Schritt 6: Output

Steuerliche Stellungnahme mit:
- Berechnungen und Formeln
- Normenverweisen (EStG, KStG, UStG, AO etc.)
- Confidence-Score (gemäß Bewertungs-Legende A-E)
- Disclaimer (gemäß `${CLAUDE_PLUGIN_ROOT}/references/disclaimer-system.md`)
- Dateipfad zum gespeicherten Dokument

## Fehlerbehandlung

Wenn ein Schritt fehlschlägt, NICHT abbrechen — stattdessen:

| Fehler | Fallback |
|--------|----------|
| MCP-Server nicht erreichbar | Bright Data `scrape_as_markdown` auf offizielle Quelle |
| Bright Data nicht verfügbar | openrouter-skill-v3 Deep Research als Ersatz |
| Keine Quellen gefunden | Confidence auf "SEHR NIEDRIG" setzen, User informieren |
| Agent-Team-Spawn fehlschlägt | Auf Subagent-Modus zurückfallen |
| Steuerberechnung unsicher | Beide Varianten zeigen + Disclaimer "Nachprüfung durch StB empfohlen" |

Bei jedem Fallback: Im Output dokumentieren welcher Schritt nicht regulär lief.

## Referenzen

- `${CLAUDE_PLUGIN_ROOT}/skills/steuer-analyse/SKILL.md` — Analyse-Logik
- `${CLAUDE_PLUGIN_ROOT}/references/confidence-scoring.md` — Scoring
- `${CLAUDE_PLUGIN_ROOT}/references/disclaimer-system.md` — Disclaimer-Texte
- `${CLAUDE_PLUGIN_ROOT}/references/docs-output.md` — Speicherkonvention
