---
name: steuer-check
description: Starte eine steuerrechtliche Analyse oder Berechnung
---

# /steuer-check

Führe eine steuerrechtliche Analyse durch.

## Ablauf

0. **Komplexität prüfen**: Einfache Berechnung → Subagent. Komplex (Holding-Strukturen, Steuerhinterziehungsverdacht, Multi-Jurisdiktion) → automatisch Agent Team. Für erzwungenen Team-Modus: `/ermittlung`.

1. **Frage klären**:
   - Steuerberechnung → Welche Steuerart? Welche Zahlen?
   - Rechnungsprüfung → Rechnung als PDF oder Text bereitstellen
   - DBA-Analyse → Welche Länder beteiligt?
   - Steuerliche Auswirkung → Welche Transaktion?

2. **Region**: DE, AT, CH, EU, USA, UAE — oder grenzüberschreitend?

3. **Analyse starten**: Aktiviere den `steuer-analyse` Skill.

4. **Validierung**: Confidence-Score + Disclaimer.

5. **Speichern**: Analyse als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` ablegen. Recherche-Rohdaten in `docs/recherchen/`. Siehe `references/docs-output.md`.

6. **Output**: Steuerliche Stellungnahme mit Berechnungen, Normenverweisen, Disclaimer und Dateipfad.
