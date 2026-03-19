# Claude Plugins Marketplace

Privater Plugin-Marketplace für Claude Code.

## Plugins

| Plugin | Version | Beschreibung |
|--------|---------|-------------|
| beratungs-suite-pro | 0.6.3 | Integrierte Unterstützung für Recht, Steuern und Unternehmensberatung mit OSINT Master + Bright Data MCP |
| landingpage-audit-pro | 0.2.0 | Vollautomatisiertes Landing-Page-Audit über 8 Dimensionen |

## Installation

```bash
/plugin install beratungs-suite-pro@MyCasaflora-plugins
/plugin install landingpage-audit-pro@MyCasaflora-plugins
```

## Marketplace registrieren

In `~/.claude/settings.json` unter `extraKnownMarketplaces`:
```json
"MyCasaflora-plugins": {
  "source": {
    "source": "github",
    "repo": "MyCasaflora/claude-plugins"
  }
}
```
