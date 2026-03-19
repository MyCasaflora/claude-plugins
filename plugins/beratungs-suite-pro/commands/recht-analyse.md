---
name: recht-analyse
description: Starte eine professionelle Rechtsrecherche und -analyse
---

# /recht-analyse

Führe eine professionelle Rechtsrecherche durch.

## Ablauf

0. **Komplexität prüfen**: Einfache Frage → Subagent. Komplex (mehrere Akteure, Strafrecht, Due Diligence) → automatisch Agent Team. Für erzwungenen Team-Modus: `/ermittlung`.

1. **Frage klären**: Was genau soll recherchiert werden?
   - Gesetzesrecherche → Norm suchen
   - Domain-Prüfung → Webseite rechtlich prüfen
   - PDF-Analyse → Dokument prüfen
   - Compliance-Check → Regulatorische Anforderungen

2. **Jurisdiktion**: DE, AT, CH, EU, USA, UAE — oder mehrere?

3. **Recherche starten**: Aktiviere den `recht-recherche` Skill mit den gesammelten Informationen.

4. **Validierung**: Confidence-Score berechnen lassen (Validator Agent).

5. **Bei Score < 70**: Devil's Advocate Agent aktivieren.

6. **Speichern**: Analyse als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` ablegen. Recherche-Rohdaten in `docs/recherchen/`. Siehe `references/docs-output.md`.

7. **Output**: Strukturiertes Rechtsgutachten mit Normenverweisen, Confidence-Score, Disclaimer und Dateipfad.
