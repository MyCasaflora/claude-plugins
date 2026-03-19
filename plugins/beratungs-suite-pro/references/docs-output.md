# Docs-Output-Konvention

Alle vom Plugin erstellten Dokumente werden im Plugin-eigenen `docs/`-Ordner gespeichert.

## Ordnerstruktur

```
docs/
├── analysen/      ← Fertige Reports (Rechtsgutachten, Steueranalysen, Strategie-Reports)
└── recherchen/    ← Zwischenergebnisse (Deep Research, Crawl-Ergebnisse, gesammelte Quellen)
```

## Basispfad

```
${CLAUDE_PLUGIN_ROOT}/docs/
```

Zur Laufzeit löst sich `${CLAUDE_PLUGIN_ROOT}` auf den tatsächlichen Plugin-Pfad auf (z.B. `~/.claude/plugins/beratungs-suite-pro/`).

## Namensschema

```
YYYY-MM-DD-<thema>-<typ>.md
```

| Feld | Beschreibung | Beispiele |
|------|-------------|-----------|
| `YYYY-MM-DD` | Erstelldatum | `2026-03-18` |
| `<thema>` | Kebab-case Beschreibung des Themas | `gmbh-haftung`, `dba-de-ae`, `marktanalyse-fintech` |
| `<typ>` | Dokumenttyp | `analyse`, `gutachten`, `recherche`, `report`, `pruefung` |

### Beispiele

- `2026-03-18-gmbh-haftung-analyse.md` — Fertige Rechtsanalyse → `docs/analysen/`
- `2026-03-18-dba-de-ae-recherche.md` — Deep-Research-Ergebnisse → `docs/recherchen/`
- `2026-03-18-fintech-markt-report.md` — Strategie-Report → `docs/analysen/`
- `2026-03-18-impressum-example-de-pruefung.md` — Domain-Prüfung → `docs/analysen/`
- `2026-03-18-ustg-normen-recherche.md` — Gesammelte Normen → `docs/recherchen/`

## Wann was wohin

| Was wird erstellt? | Zielordner | Typ-Suffix |
|---|---|---|
| Rechtsgutachten / Rechtsanalyse | `docs/analysen/` | `-analyse`, `-gutachten`, `-pruefung` |
| Steueranalyse / Steuerberechnung | `docs/analysen/` | `-analyse`, `-berechnung` |
| Strategie-Report / Due Diligence | `docs/analysen/` | `-report`, `-due-diligence` |
| Deep-Research-Ergebnisse | `docs/recherchen/` | `-recherche` |
| Gecrawlte Quellen / Rohdaten | `docs/recherchen/` | `-quellen`, `-crawl` |
| Gesammelte Normen / Gesetzestexte | `docs/recherchen/` | `-normen`, `-recherche` |

## Datei-Header

Jede gespeicherte Datei beginnt mit einem YAML-Frontmatter:

```yaml
---
titel: [Kurztitel der Analyse]
datum: YYYY-MM-DD
typ: analyse | recherche | gutachten | report | pruefung
skill: recht-recherche | steuer-analyse | beratung-strategie
jurisdiktion: [DE, AT, CH, EU, USA, UAE]
confidence: [0-100]
---
```

## Regeln

1. **Immer speichern** — Jede abgeschlossene Analyse wird als Datei gespeichert
2. **Recherchen optional** — Deep-Research-Ergebnisse werden gespeichert, wenn sie substanziell sind (> 500 Wörter oder > 3 Quellen)
3. **Keine Duplikate** — Vor dem Speichern prüfen, ob eine Datei zum gleichen Thema am gleichen Tag existiert. Falls ja: Suffix `-v2`, `-v3` etc.
4. **User informieren** — Nach dem Speichern den Dateipfad im Output anzeigen
5. **Web-Links PFLICHT** — Jeder Befund MUSS einen direkten URL-Link zur Quelle enthalten. Besonders bei: Behördenwarnungen, Handelsregister-Einträgen, Pressemeldungen, Gerichtsurteilen. Der Leser muss den Originalbeleg mit einem Klick aufrufen können.

---

## Beweissicherungs-Policy

### Zwei Speicherorte

| Typ | Speicherort | Wann |
|-----|-------------|------|
| **Text-Dokumentation** | `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/` | Standard — für alle Funde |
| **Bild-Dokumentation** | Google Drive: `beratungs-suite-pro/[Thema]/` | Wenn visuelle Beweise nötig |

### Text-Dokumentation (Standard)

Jeder Fund wird als Text mit folgenden Pflichtfeldern dokumentiert:
- **Volltext** oder relevanter Auszug
- **Direkte URL** zum Originaldokument (PFLICHT)
- **Zugriffsdatum + Uhrzeit**
- **Kontext**: Warum ist dieser Fund relevant?
- **Bewertung**: A-E Einstufung

Text-Dokumentation reicht für:
- Behördliche Warnungen (offizielle URLs sind stabil)
- Handelsregister-Daten (öffentlich und persistent)
- Gesetzestexte, Normen, Urteile
- Presseartikel bei etablierten Medien

### Bild-Dokumentation (Google Drive)

Wird über Google Drive MCP gespeichert. Ordnerstruktur:

```
Google Drive/
└── beratungs-suite-pro/
    └── [Thema-oder-Firmenname]/
        ├── YYYY-MM-DD-telegram-post-bewerbung.png
        ├── YYYY-MM-DD-youtube-video-thumbnail.png
        ├── YYYY-MM-DD-website-impressum-zustand.png
        └── YYYY-MM-DD-instagram-post-nach-warnung.png
```

Bild-Dokumentation ist nötig für:
- **Telegram-Nachrichten/Posts** — können jederzeit gelöscht werden
- **YouTube-Video-Thumbnails** mit Versprechungen — können gelöscht werden
- **Social-Media-Posts** die als Beweis für Timeline-Analyse dienen
- **Website-Zustände** die sich ändern können (Impressum, Produktseiten, Preise)
- **Alles was visuellen Kontext liefert**, den Text allein nicht vermittelt

Jedes gespeicherte Bild wird im Text-Dokument referenziert:
```markdown
📸 Screenshot gesichert: Google Drive → beratungs-suite-pro/[Thema]/[Dateiname]
```

### Timeline-Dokumentation

Bei Behördenwarnungen ist eine **chronologische Timeline** Pflicht:

```markdown
| Datum | Event | Quelle | URL | Typ |
|-------|-------|--------|-----|-----|
| TT.MM.JJJJ | Video bewirbt Produkt X | YouTube | [URL] | Vor Warnung |
| TT.MM.JJJJ | ⚠️ Behördenwarnung | [Behörde] | [URL] | WARNUNG |
| TT.MM.JJJJ | Weiterhin Werbung | Telegram | [URL] | **Nach Warnung** |
| — | Kein Distanzierungs-Statement | — | — | **Fehlt** |
```

Prüfe dabei IMMER:
1. Wurde NACH der Warnung weiterhin für das gewarnete Produkt geworben?
2. Gibt es ein offizielles Distanzierungs-Statement?
3. Hat das Unternehmen selbst reagiert?
