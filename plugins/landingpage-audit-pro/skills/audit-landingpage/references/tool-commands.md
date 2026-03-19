# CLI Tool Commands Reference

Schnellreferenz aller CLI-Befehle für die Agents.

## Lighthouse (Performance + SEO)

```bash
# Vollständiger Audit als JSON
lighthouse <URL> --output json --output-path ./lh-report.json --chrome-flags="--headless=new"

# Nur bestimmte Kategorien
lighthouse <URL> --output json --only-categories=performance,accessibility,seo,best-practices

# Für lokale Seiten
lighthouse http://localhost:3000 --output json --output-path ./lh-report.json
```

## lychee (Link Checker)

```bash
# Alle Links einer URL prüfen
lychee <URL> --format json --output lychee-results.json

# Lokale HTML-Dateien
lychee ./build/**/*.html --format json

# Mit Timeout und Retry
lychee <URL> --timeout 30 --retry-wait-time 5 --max-retries 3 --format json

# Externe Links ignorieren (nur interne prüfen)
lychee <URL> --format json --exclude-all-private
```

## Axe-Core (Accessibility)

```bash
# WCAG AA Audit
axe <URL> --tags wcag2aa --save axe-results.json

# Spezifische Regeln deaktivieren
axe <URL> --tags wcag2aa --disable color-contrast --save axe-results.json

# Mehrere Seiten
axe <URL1> <URL2> --tags wcag2aa --save axe-results.json
```

## Pa11y (Accessibility + Interaktion)

```bash
# Einzelne Seite
pa11y <URL> --reporter json

# Mit Aktionen (Formular ausfüllen, Button klicken)
pa11y <URL> --reporter json \
  --actions "set field #email to test@test.com" \
  --actions "click element #submit-btn" \
  --actions "wait for url to contain /success"

# WCAG Level spezifizieren
pa11y <URL> --reporter json --standard WCAG2AA
```

## LanguageTool (Rechtschreibung/Grammatik)

```bash
# Via HTTP API (Homebrew: Port 8081, Docker: Port 8010)
# Prüfe zuerst welcher Port aktiv ist:
curl -s http://localhost:8081/v2/check -d "language=de&text=Test" || \
curl -s http://localhost:8010/v2/check -d "language=de&text=Test"

# Audit-Aufruf
curl -s http://localhost:8081/v2/check \
  -d "language=de" \
  -d "text=<EXTRAHIERTER_TEXT>" | jq .

# Server starten (Homebrew — empfohlen)
brew install languagetool && brew services start languagetool

# Server starten (Docker — Alternative)
docker run -d -p 8010:8010 silviof/docker-languagetool
```

## cspell (Spell Check)

```bash
# HTML-Dateien prüfen
cspell "**/*.html" --locale de-DE --reporter default

# Mit Custom-Wörterbuch
cspell "**/*.html" --locale de-DE --words-only
```

## BackstopJS (Visual Regression)

```bash
# Initialisieren
backstop init

# Reference-Screenshots erstellen
backstop reference

# Vergleich
backstop test
```
