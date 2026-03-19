# Typography Audit Rules — Standards 2025/2026

## Scoring

Jede Regel: PASS / WARN / FAIL
- Visual-Score: Gewichteter Durchschnitt aller Regeln

## T1: Fluid Typography
- **PASS**: CSS Custom Properties mit `clamp()` für font-sizes
- **WARN**: Media Queries für font-sizes (funktioniert, aber nicht optimal)
- **FAIL**: Harte px-Werte ohne Responsive-Anpassung

## T2: Body Text Größe
- **PASS**: ≥16px (1rem) auf allen Viewports
- **WARN**: 14-15px auf Mobile
- **FAIL**: <14px auf Mobile
- **Referenz**: 16px ist industrieweites Minimum. Medium steigerte Lesezeit +40% mit 21px.

## T3: Heading-Hierarchie (Modular Scale)
- **PASS**: H1 ist 2.0-2.5x Body, H2 ist 1.5-1.8x Body, H3 ist 1.2-1.3x Body
- **WARN**: Hierarchie vorhanden aber Ratios außerhalb der Empfehlung
- **FAIL**: Keine erkennbare Hierarchie oder H2 > H1

## T4: Zeilenlänge (Characters Per Line)
- **PASS**: Desktop 45-75 CPL (ideal 66), Mobile 30-50 CPL
- **WARN**: Desktop 75-90 CPL oder Mobile 50-60 CPL
- **FAIL**: Desktop >90 CPL oder Mobile >60 CPL
- **Technik**: `max-width: 70ch` im CSS prüfen

## T5: Zeilenabstand (line-height)
- **PASS**: Body ≥1.5, Headlines 1.1-1.3
- **WARN**: Body 1.3-1.49
- **FAIL**: Body <1.3 oder Headlines >1.5

## T6: Font Loading Performance
- **PASS**: WOFF2 Format, ≤3 Font-Weights, `font-display: swap`
- **WARN**: WOFF2 aber >3 Weights oder fehlendes `font-display: swap`
- **FAIL**: Kein WOFF2, >5 Weights, oder FOIT (Flash of Invisible Text)

## T7: Farbkontrast (WCAG AA)
- **PASS**: Body Text ≥4.5:1, Large Text ≥3:1, UI-Elemente ≥3:1
- **WARN**: Knapp unter Schwellenwert (4.0-4.49:1 für Body)
- **FAIL**: <4.0:1 für Body Text
- **Large Text**: ≥24px oder ≥18.66px bold

## T8: Spacing-System
- **PASS**: Konsistentes System erkennbar (4px/8px Grid, Tailwind Scale, Custom Tokens)
- **WARN**: Teilweise konsistent, einige Ausreißer
- **FAIL**: Keine Systematik, willkürliche Werte

## T9: Letter-Spacing (Dyslexie-Freundlichkeit)
- **PASS**: letter-spacing ≥0.12em für Body Text
- **WARN**: letter-spacing 0.05-0.11em
- **FAIL**: letter-spacing: 0 oder negativ
- **Referenz**: British Dyslexia Association Empfehlung

## T10: Text-Ausrichtung
- **PASS**: Linksbündig (text-align: left/start) für Fließtext
- **WARN**: Zentriert für kurze Abschnitte (≤3 Zeilen)
- **FAIL**: Blocksatz (text-align: justify) für Fließtext
- **Referenz**: Blocksatz erzeugt unregelmäßige Weißräume, stört Lesefluss bei Dyslexie.

## T11: Responsive Touch-Targets
- **PASS**: Alle klickbaren Elemente ≥44x44px
- **WARN**: 38-43px
- **FAIL**: <38px

## Empfohlene CSS-Vorlage

```css
:root {
  --font-size-body: clamp(1rem, 1rem + 0.5vw, 1.25rem);
  --font-size-h1: clamp(2rem, 4vw, 2.5rem);
  --font-size-h2: clamp(1.5rem, 3vw, 2rem);
  --font-size-h3: clamp(1.25rem, 2.5vw, 1.5rem);
}
body {
  font-size: var(--font-size-body);
  line-height: 1.5;
  letter-spacing: 0.03em;
}
h1, h2, h3 { line-height: 1.2; }
p, li { max-width: 70ch; }
```
