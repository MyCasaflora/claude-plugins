---
name: strategie-entwurf
description: Starte eine strategische Analyse oder Unternehmensberatung
---

# /strategie-entwurf

Führe eine strategische Analyse mit Consulting-Frameworks durch.

## Ablauf

0. **Komplexität prüfen**: Einfache SWOT/Branchenanalyse → Subagent. Komplex (Due Diligence, Legalitätsprüfung, M&A) → automatisch Agent Team. Für erzwungenen Team-Modus: `/ermittlung`.

1. **Frage klären**:
   - Marktanalyse → Welche Branche? Welche Region?
   - Wettbewerbsanalyse → Welche Wettbewerber?
   - Strategieentwicklung → Welches Ziel?
   - Due Diligence → Welches Unternehmen?
   - Business Plan → Welche Geschäftsidee?

2. **Framework wählen**: SWOT, Porter, PESTEL, BCG, Business Model Canvas

3. **Analyse starten**: Aktiviere den `beratung-strategie` Skill.
   Bei komplexen Aufträgen: Multi-Agenten-Workflow (Reader → Analyst → Strategist → Formatter).

4. **Validierung**: Devil's Advocate für Gegenposition bei Empfehlungen.

5. **Speichern**: Report als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` ablegen. Marktrecherchen in `docs/recherchen/`. Siehe `references/docs-output.md`.

6. **Output**: Management-Summary mit Handlungsempfehlungen und Dateipfad.
