---
name: audit-lp
description: Vollständiges Landing-Page-Audit über 8 Dimensionen starten
argument-hint: "<URL oder lokaler Pfad>"
allowed-tools:
  - Bash
  - Read
  - Write
  - Grep
  - Glob
  - Agent
  - Skill
  - mcp__plugin_playwright_playwright__*
  - mcp__puppeteer__*
  - mcp__plugin_chrome-devtools-mcp_chrome-devtools__*
---

Führe ein vollständiges Landing-Page-Audit durch. Nutze den Skill `audit-landingpage` als Orchestrator.

## Ablauf

1. Erkenne den Input: URL (beginnt mit `http://` oder `https://`) oder lokaler Pfad.
2. Führe den Tool-Check aus: `bash ${CLAUDE_PLUGIN_ROOT}/scripts/check-tools.sh`
3. Lade den Skill `audit-landingpage` — er enthält die vollständige Orchestrierungs-Logik.
4. Folge der Orchestrierungs-Logik des Skills:
   - Daten vorbereiten (Screenshots, DOM, Text, CSS)
   - 5 Agents parallel dispatchen
   - Report zusammensetzen und speichern

## Beispiele

```
/audit-lp https://example.com
/audit-lp http://localhost:3000
/audit-lp ./my-landingpage/
```

Falls kein Argument übergeben wird, frage den User nach der URL oder dem Pfad.
