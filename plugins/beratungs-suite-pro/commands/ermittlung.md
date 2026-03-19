---
name: ermittlung
description: Starte eine umfassende Ermittlung mit Agent Team (LKA + StA + Fachanwalt)
---

# /ermittlung

Starte eine umfassende Ermittlung im Agent-Team-Modus. Erzwingt den komplexen Modus unabhängig von der Komplexitäts-Erkennung.

## Ablauf

1. **Sachverhalt klären**: Was soll ermittelt werden?
   - Unternehmensprüfung → Welche Firma(s)?
   - Betrugsverdacht → Welche Akteure?
   - Compliance-Prüfung → Welche Branche/Regulierung?
   - Due Diligence → Welches Ziel?

2. **Domäne bestimmen**:
   - Rechtlich → Recht-Team (Lead + Ermittler + Ankläger + Fachanwalt + DA)
   - Steuerlich → Steuer-Team (Lead + Ermittler + Steuerfahnder + Fachanwalt-Steuer + DA)
   - Strategisch → Strategie-Team (Lead + Ermittler + Marktanalyst + Stratege + DA)
   - Übergreifend → Kombiniertes Team (Lead + Ermittler + Ankläger + Steuerfahnder + Fachanwalt + DA)

3. **Agent Team starten**: Aktiviere `agent-team-creator` mit dem gewählten Team.
   Lies `references/ermittlungs-framework.md` für Team-Zusammensetzungen.

4. **Ermittlung durchführen**: Team arbeitet autonom mit Review-Loop.

5. **Ergebnis**: Umfassender Ermittlungsbericht in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/`.
