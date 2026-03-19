# landingpage-audit-pro

Vollautomatisiertes Landing-Page-Audit über 8 Dimensionen mit 5 spezialisierten Agents.

## Features

- **Performance & SEO**: Lighthouse-Audit, Core Web Vitals, Meta-Tags, Heading-Hierarchie
- **Accessibility**: WCAG AA, Kontrast, ARIA, Screenreader-Kompatibilität
- **Stress-Test**: Alle Links prüfen, Buttons/Formulare/Modals interaktiv testen
- **Content & Rechtliches**: Rechtschreibung, Grammatik, Pflichtseiten (Impressum, Datenschutz, Cookie-Banner)
- **CRO / Konversion**: 12 evidenzbasierte Heuristiken, Copywriting-Bewertung
- **Visual Design**: Fluid Typography, Farbkontrast, Spacing-System, Responsive Check
- **Mockup-Generierung**: Visuelle Vorher/Nachher-Mockups für kritische Findings
- **Gesamtreport**: Gewichteter Score (A+ bis F) mit priorisiertem Aktionsplan

## Nutzung

```
/audit-lp https://example.com
/audit-lp http://localhost:3000
/audit-lp ./my-landingpage/
```

## Voraussetzungen

Prüfe den Tool-Status mit:
```bash
bash ~/.claude/plugins/landingpage-audit-pro/scripts/check-tools.sh
```

### Pflicht-Tools
- `lighthouse` — `npm install -g lighthouse`
- `lychee` — `brew install lychee`

### Empfohlene Tools
- `axe` (Axe-Core CLI) — `npm install -g @axe-core/cli`
- `pa11y` — `npm install -g pa11y`
- `cspell` — `npm install -g cspell`

### Optionale Tools
- `backstop` (BackstopJS) — `npm install -g backstopjs`
- `html-validate` — `npm install -g html-validate`

### Services
- **LanguageTool**: `brew install languagetool && brew services start languagetool` (Port 8081)
- Alternativ via Docker: Port 8010

### MCP Server
- **Playwright MCP** (empfohlen) — für Screenshots und Interaktionstests
- Alternativ: Puppeteer MCP oder Chrome DevTools MCP

## Architektur

```
/audit-lp Command
    └── audit-landingpage Skill (Orchestrator)
            ├── performance-agent  (Sonnet) — Lighthouse, SEO
            ├── stress-test-agent  (Sonnet) — Links, Buttons, Formulare
            ├── content-agent      (Sonnet) — Rechtschreibung, Recht
            ├── cro-agent          (Opus)   — Konversions-Psychologie
            └── visual-agent       (Opus)   — Typografie, Design, Mockups
```

## Report-Ausgabe

Reports werden als Markdown gespeichert:
```
audit-report-YYYY-MM-DD-domain.md
```

### Scoring-Gewichtung
| Dimension | Gewicht |
|-----------|---------|
| Performance & SEO | 20% |
| Accessibility | 15% |
| Stress-Test | 10% |
| Content & Rechtlich | 15% |
| CRO | 25% |
| Visual Design | 15% |

## Version

0.2.0
