---
name: audit-landingpage
description: |
  Vollautomatisiertes Landing-Page-Audit über 8 Dimensionen. Analysiert
  Performance, Accessibility, SEO, Links, Content, Rechtliches, CRO-Psychologie
  und Visual Design. Generiert strukturierte Reports mit visuellen Mockups.
  Trigger bei: "Landing Page auditieren", "Landingpage prüfen", "LP analysieren",
  "Website Audit", "Conversion Audit", "audit my landing page", "check my page",
  "LP Stress-Test", "Seite prüfen", "Landingpage bewerten", "audit-lp",
  "Landingpage analysieren", "page audit", "conversion check", "UX audit".
---

# Landing Page Audit — Orchestrator

Du orchestrierst ein vollständiges Landing-Page-Audit über 8 Dimensionen mit 5 spezialisierten Agents.

## Eingabe erkennen

Der User gibt dir entweder:
- **Eine URL**: `https://example.com`, `http://localhost:3000`
- **Einen lokalen Pfad**: `./my-project/`, `~/sites/landingpage/`

Erkenne automatisch:
- Beginnt mit `http://` oder `https://` → `TARGET_TYPE=url`
- Alles andere → `TARGET_TYPE=local`

Bei `TARGET_TYPE=local`:
- Prüfe ob ein Dev-Server-Script existiert (`package.json` → `npm run dev`, `start`)
- Starte den Dev-Server im Hintergrund
- Warte bis localhost erreichbar ist
- Setze `TARGET=http://localhost:<PORT>`

## Vor dem Audit: Tool-Check

Führe aus:
```bash
bash ${CLAUDE_PLUGIN_ROOT}/scripts/check-tools.sh
```

Falls Pflicht-Tools fehlen: Informiere den User und biete Installation an.
Falls nur empfohlene/optionale Tools fehlen: Melde es, fahre mit reduziertem Umfang fort.

## Daten-Vorbereitung

Bevor die Agents gestartet werden, bereite die gemeinsamen Daten vor:

### 1. Screenshots erstellen (via Playwright MCP)
- Desktop-Screenshot (1440x900)
- Mobile-Screenshot (375x812, iPhone-Viewport)

### 2. DOM-Struktur extrahieren

Via Playwright:
```javascript
const structure = {
  lang: document.documentElement.lang,
  title: document.title,
  headings: [...document.querySelectorAll('h1,h2,h3')].map(h => ({
    tag: h.tagName, text: h.textContent.trim()
  })),
  ctas: [...document.querySelectorAll(
    'button, a.btn, a.cta, [role="button"], input[type="submit"]'
  )].map(el => ({
    tag: el.tagName, text: el.textContent.trim(), href: el.href
  })),
  forms: [...document.querySelectorAll('form')].map(f => ({
    fields: f.querySelectorAll('input,select,textarea').length
  })),
  navLinks: [...document.querySelectorAll('nav a')].map(a => a.href),
  images: [...document.querySelectorAll('img')].map(i => ({
    src: i.src, alt: i.alt, width: i.width, height: i.height
  })),
  footerLinks: [...document.querySelectorAll('footer a')].map(a => ({
    text: a.textContent.trim(), href: a.href
  }))
};
```

### 3. Sichtbaren Text extrahieren
```javascript
document.body.innerText
```

### 4. CSS-Daten extrahieren
```javascript
// Computed Styles der wichtigsten Elemente
document.querySelectorAll('h1,h2,h3,h4,p,a,button,label,span').forEach(el => {
  const style = getComputedStyle(el);
  console.log(el.tagName, el.className, {
    fontSize: style.fontSize,
    lineHeight: style.lineHeight,
    letterSpacing: style.letterSpacing,
    fontFamily: style.fontFamily,
    fontWeight: style.fontWeight,
    color: style.color,
    backgroundColor: style.backgroundColor
  });
});
```

## Agents dispatchen

Starte alle 5 Agents parallel mit den vorbereiteten Daten:

```
Agent 1: performance-agent  → TARGET, TARGET_TYPE
Agent 2: stress-test-agent  → TARGET, TARGET_TYPE
Agent 3: content-agent      → TARGET, TARGET_TYPE, EXTRACTED_TEXT, LANG
Agent 4: cro-agent          → TARGET, SCREENSHOT_DESKTOP, SCREENSHOT_MOBILE, DOM_STRUCTURE, EXTRACTED_TEXT
Agent 5: visual-agent       → TARGET, SCREENSHOT_DESKTOP, SCREENSHOT_MOBILE, CSS_DATA
```

## Report zusammensetzen

Wenn alle Agents fertig sind, füge die Teil-Reports zu einem Gesamtreport zusammen.

### Gesamtscore berechnen

```
Gesamtscore = Gewichteter Durchschnitt:
- Performance & SEO:   20%
- Accessibility:       15% (aus Lighthouse Report)
- Stress-Test:         10%
- Content & Rechtlich: 15%
- CRO:                 25%
- Visual Design:       15%
```

Umrechnung in Note:
- 90-100: A+
- 80-89: A / A-
- 70-79: B+ / B / B-
- 60-69: C+ / C
- 50-59: D
- <50: F

### Report-Struktur

```markdown
# Landing Page Audit Report

> **URL:** <TARGET>
> **Datum:** <DATUM>
> **Gesamtscore:** <NOTE> (<PUNKTE>/100)

## Zusammenfassung
- X kritische Fehler, Y Warnungen, Z Hinweise
- **Top-3 Quick Wins:**
  1. ...
  2. ...
  3. ...

## 1. Performance & SEO
<Output von performance-agent>

## 2. Accessibility
<Aus Lighthouse Accessibility Score + Axe-Core Findings>

## 3. Link & Button Stress-Test
<Output von stress-test-agent>

## 4. Content & Rechtliches
<Output von content-agent>

## 5. CRO / Konversion
<Output von cro-agent>

## 6. Typografie & Visual Design
<Output von visual-agent>

## 7. Visuelle Mockups
<Alle generierten Mockups gesammelt>

## Aktionsplan
### Sofort beheben (Kritisch)
1. ...

### Diese Woche (Wichtig)
1. ...

### Nächstes Release (Nice-to-have)
1. ...
```

### Report speichern

Speichere den Report als:
```
audit-report-<YYYY-MM-DD>-<DOMAIN>.md
```

Im aktuellen Arbeitsverzeichnis des Users.

## Fehlerbehandlung

- Agent liefert keinen Output → Markiere Dimension als "Nicht geprüft (Agent-Fehler)"
- CLI-Tool nicht verfügbar → Nutze Fallback-Skill oder Claude-Analyse
- Playwright MCP nicht verfügbar → Nutze Puppeteer MCP oder Chrome DevTools MCP
- Keine MCP-Browser verfügbar → Nur Code-Analyse (kein Screenshot, kein Stress-Test)
- OpenRouter nicht verfügbar → Keine Mockups, nur Text-Empfehlungen
