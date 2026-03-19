---
name: recht-analyse
description: |
  Starte eine professionelle Rechtsrecherche und -analyse mit Validierung.
  Orchestriert den vollständigen Workflow: Recherche → Validierung → Disclaimer → Speichern.
  Verwende diesen Skill wenn der User explizit eine Rechtsanalyse starten will.
  Trigger: "/recht-analyse", "Rechtsanalyse starten", "analysiere rechtlich",
  "rechtliche Analyse", "Rechtsgutachten erstellen", "Rechtsfall prüfen".
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

# Recht-Analyse — Orchestrierter Workflow

Führe eine professionelle Rechtsrecherche mit vollständigem Validierungszyklus durch.

## Ablauf

### Schritt 0: Komplexität prüfen

- **Einfache Frage** (einzelne Norm, klare Jurisdiktion) → Subagent-Modus
- **Komplex** (mehrere Akteure, Strafrecht, Due Diligence, Multi-Jurisdiktion) → automatisch Agent Team
- Für erzwungenen Team-Modus: Verwende den `ermittlung` Skill

### Schritt 1: Frage klären

Was genau soll recherchiert werden?
- **Gesetzesrecherche** → Norm suchen
- **Domain-Prüfung** → Webseite rechtlich prüfen
- **PDF-Analyse** → Dokument prüfen
- **Compliance-Check** → Regulatorische Anforderungen

### Schritt 2: Jurisdiktion

DE, AT, CH, EU, USA, UAE — oder mehrere?
Verwende `${CLAUDE_PLUGIN_ROOT}/references/jurisdiktions-mapping.md` für Quellen-Routing.

### Schritt 3: Recherche starten

Aktiviere den `recht-recherche` Skill mit den gesammelten Informationen.
Folge dem Ablauf in `${CLAUDE_PLUGIN_ROOT}/skills/recht-recherche/SKILL.md`.

### Schritt 4: Validierung

Confidence-Score berechnen lassen (Validator Agent).
Lies `${CLAUDE_PLUGIN_ROOT}/references/confidence-scoring.md`.

### Schritt 5: Eskalation bei niedrigem Score

- Score < 70 → Devil's Advocate Agent aktivieren
- Score < 50 → Zusätzlich Blind Spot + Gray Area Prüfung
- Strafrechtliche Relevanz → Sofortige Warnung

### Schritt 6: Speichern

- Analyse als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` ablegen
- Recherche-Rohdaten in `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/`
- Siehe `${CLAUDE_PLUGIN_ROOT}/references/docs-output.md` für Namensschema

### Schritt 7: Output

Strukturiertes Rechtsgutachten mit:
- Normenverweisen und Fundstellen
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
| Validator nicht verfügbar | Manuelle Confidence-Schätzung + erweiterten Disclaimer verwenden |

Bei jedem Fallback: Im Output dokumentieren welcher Schritt nicht regulär lief.

## Referenzen

- `${CLAUDE_PLUGIN_ROOT}/skills/recht-recherche/SKILL.md` — Recherche-Logik
- `${CLAUDE_PLUGIN_ROOT}/references/confidence-scoring.md` — Scoring
- `${CLAUDE_PLUGIN_ROOT}/references/disclaimer-system.md` — Disclaimer-Texte
- `${CLAUDE_PLUGIN_ROOT}/references/docs-output.md` — Speicherkonvention
