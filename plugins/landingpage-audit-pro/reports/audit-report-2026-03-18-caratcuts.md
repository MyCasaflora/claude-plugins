# Landing Page Audit Report

> **URL:** https://caratcuts.com/
> **Datum:** 2026-03-18
> **Gesamtscore:** C+ (72/100)

## Zusammenfassung

- **8 kritische Fehler, 12 Warnungen, 6 Hinweise**
- Die Seite ist handwerklich stark gebaut mit exzellentem Dark-Theme-Design und gutem Copywriting, wird aber durch fehlende SEO-Grundlagen, einen externen CTA-Redirect, fehlenden Cookie-Banner und Performance-Probleme bei Google Fonts deutlich abgewertet.

**Top-3 Quick Wins:**
1. **Google Fonts async laden** — spart ~2.8s FCP, hebt Performance-Score auf ~90+
2. **Meta Description + OG-Tags ergänzen** — sofortiger SEO- und Social-Sharing-Gewinn
3. **Cookie-Banner implementieren** — rechtliche Pflicht (DSGVO/ePrivacy), da Cookies gesetzt werden

---

## 1. Performance & SEO

### Scores
- Performance: **77/100**
- SEO: **91/100**
- Best Practices: **100/100**

### Core Web Vitals
| Metrik | Wert | Status |
|--------|------|--------|
| LCP | 3.9 s | WARN |
| FCP | 3.9 s | FAIL |
| CLS | 0.012 | PASS |
| INP | n/a (Lab) | — |
| TTFB | 110 ms | PASS |

> LCP-Element ist ein `<div>` im Hero-Bereich. Der massive Element Render Delay (4.237 ms) wird durch blockierende Google Fonts verursacht.

### Findings
1. **[FAIL] Render-Blocking Google Fonts — Est. Savings: 2.790 ms**
   `fonts.googleapis.com` CSS wird synchron geladen und blockiert das initiale Rendering komplett. Empfehlung: `font-display: swap` + `<link rel="preconnect">` + asynchrones Laden oder Font-Self-Hosting.

2. **[FAIL] FCP 3.9 s (Score 0.25)**
   Direkt verursacht durch die blockierenden Google Fonts. Ziel: FCP < 1.8 s.

3. **[FAIL] Fehlende `<meta name="description">`**
   Meta-Description fehlt vollständig. Google zeigt unkontrollierten Snippet-Text.

4. **[WARN] Keine Open Graph / Twitter Card Tags**
   Social Shares zeigen kein Preview-Bild, keinen kontrollierten Titel.

5. **[WARN] Fehlende Canonical URL**
   Kein `<link rel="canonical">` — Duplicate-Content-Risiko.

6. **[WARN] Heading-Hierarchie verletzt**
   H4-Elemente erscheinen ohne vorangehende H3. Lighthouse `heading-order` FAIL.

7. **[WARN] Kein `<main>` Landmark**
   Screenreader können nicht direkt zum Hauptinhalt springen.

8. **[WARN] Slider-Input ohne Label**
   `input#cSld` (Calculator) hat kein assoziiertes `<label>`. WCAG Level A Verstoß.

9. **[WARN] Bildoptimierung — Est. Savings: 24 KiB**
   Trust-Face-Bilder könnten als WebP ausgeliefert werden.

10. **[INFO] robots.txt nicht vorhanden (404)**
11. **[INFO] sitemap.xml nicht vorhanden (404)**
12. **[PASS] CLS 0.012** — Kein Layout-Shift-Problem.
13. **[PASS] TTFB 110 ms** — Server-Antwortzeit exzellent.
14. **[PASS] Best Practices 100/100** — Sichere Verbindung, kein Mixed Content.

---

## 2. Accessibility

**Score: 84/100** (aus Lighthouse)

### Findings
| Issue | Schwere | Detail |
|-------|---------|--------|
| Heading-Hierarchie | Moderat | H4 ohne vorangehende H3 |
| Fehlendes `<main>` | Moderat | Kein Landmark für Hauptinhalt |
| Slider ohne Label | Kritisch (A) | Calculator-Input `#cSld` ohne `<label>` oder `aria-label` |
| 5 Bilder ohne Alt-Text | Gering | Notification-Badge-Bilder (32x32) — dekorativ, `alt=""` empfohlen |

---

## 3. Link & Button Stress-Test

### Link-Check
- Geprüft: **24 Links** (intern + extern)
- OK: **23** | Broken: **0** | Unsupported: **1**

Keine Broken Links gefunden. Alle URLs liefern HTTP 200.

### Redirect-Analyse
| Start-URL | Hops | End-URL |
|-----------|------|---------|
| `http://caratcuts.com/` | 2 | `https://caratcuts.com/` |

**[WARN]** Redirect-Kette: `http://` → `https://www.` → `https://` non-www (2 Hops statt 1). Minimaler SEO-Nachteil.

### Interaktions-Test
- Buttons geprüft: **22** (21 FAQ + 1 "Show more") — alle OK
- Anchor-Links: **5** (#video, #how, #calculator, #plans, #faq) — alle Ziel-IDs vorhanden
- FAQ Akkordeons: **21** sichtbar — Öffnen/Schließen funktioniert
- Calculator Slider: Vorhanden, Range $100–$100.000
- CTA-Links (extern): **8** Links zu `diamond-solution.net` — alle erreichbar
- Footer-Links: `/terms` → 200, `/privacy` → 200

### Auffälligkeiten
1. **[WARN] Video-Thumbnail-Klick startet kein Autoplay** — Nach Klick bleibt Video `paused: true`. Nutzer muss manuell Play drücken.
2. **[WARN] "Show 12 more questions" Button** — Expand-Verhalten inkonsistent, versteckte Fragen möglicherweise nicht vollständig im DOM.
3. **[INFO] Social Proof Counter ist Fake** — "155 people viewing" und Live-Ticker-Nachrichten sind hardcoded animierte Elemente, keine Echtzeit-Daten.

---

## 4. Content & Rechtliches

### Rechtschreibung & Grammatik
- Geprüft: ~543 Wörter | Sprache: EN
- Fehler: **0 echte Fehler** (3 cspell-Treffer waren Eigennamen: USGS, Statista)

### Placeholder-Texte
- **PASS** — Kein "Lorem ipsum", "TODO" oder Platzhalter gefunden.

### Konsistenz
| Prüfpunkt | Status | Detail |
|-----------|--------|--------|
| Markennamen | PASS | "CARAT" durchgehend konsistent |
| Zahlenformate | **WARN** | "12.400+" verwendet europäische Schreibweise (Punkt als Tausendertrenner) — sollte "12,400+" sein für EN-Publikum |
| Ton & Stil | PASS | Konsistent direkt/imperativ |

### Rechtliche Seiten
| Seite | Status | Vollständigkeit |
|-------|--------|----------------|
| Terms & Conditions | ✅ Vorhanden | 14 Sektionen, inkl. Risks, Governing Law, Cancellation |
| Privacy Policy | ✅ Vorhanden | 11 Sektionen, DSGVO-ähnliche Rechte |
| Cookie-Banner | ❌ **FEHLT** | Kein Cookie-Consent trotz Cookie-Nutzung laut Privacy Policy §5 |
| Financial Disclaimer | ✅ Vorhanden | Footer: "This is not financial advice. Past performance does not guarantee future results." |
| Impressum | N/A | Englisch/International — nicht erforderlich |

### Kritischer Befund: Externer CTA-Link
Alle "Start Your Investment →" Buttons leiten zu `https://diamond-solution.net/user/register?reference=performance` weiter — eine **komplett andere Domain**. Kein Hinweis auf der Seite, dass dies eine externe Plattform ist. Affiliate-Parameter `reference=performance` sichtbar.

### Weitere Content-Findings
- **[WARN]** Governing Law in Terms §14 nennt keine konkrete Rechtsordnung
- **[WARN]** 5 Profilbilder (Notification-Badges) ohne Alt-Text

**Content-Score: 62/100**

---

## 5. CRO / Konversions-Psychologie

### Gesamtscore: C (4 FAIL, 3 WARN, 5 PASS)

### Heuristik-Bewertung
| # | Heuristik | Status | Begründung |
|---|-----------|--------|------------|
| H1 | Ein-CTA-Regel | WARN | 2 CTAs above the fold ("Start Your Investment" + "Watch Video First") konkurrieren visuell |
| H2 | CTA-Text Qualität | WARN | "Start Your Investment →" ist aktionsorientiert aber generisch — nicht nutzenorientiert oder in 1. Person |
| H3 | Navigation | **FAIL** | 7-Link-Navigation ist zu viel Ablenkung für eine Landingpage mit Konversionsziel |
| H4 | Value Proposition | PASS | H1 "Buy Real Diamonds. Earn Every Month." — exzellent: 7 Wörter, nutzengetrieben, einfaches Sprachniveau |
| H5 | Subheadline | PASS | Pre-Headline (Social Proof) + H1 (Nutzen) + Subheadline beantwortet "Was habe ich davon?" |
| H6 | Trust Signals | PASS | Hervorragend: 4.8/5 Rating, GIA Badge, 6 Testimonials, Live-Ticker, Länder-Liste, Trust-Badges |
| H7 | Formular-Minimalismus | **FAIL** | Kein Formular auf der Seite — alle CTAs führen zu externer Domain. Domain-Wechsel kostet geschätzt 30-50% der Konversionen |
| H8 | Social Proof | PASS | Exzellent quantifiziert: 12,400+ Investoren, 48+ Länder, $38M+, 6 Testimonials mit Verified-Badges |
| H9 | Layout-Pattern | PASS | Klares vertikales Scroll-Pattern mit CTA an jedem Abschnitt |
| H10 | Whitespace | WARN | Grundsätzlich gut, aber Calculator und Vergleichstabelle recht dicht |
| H11 | Ladezeit | **FAIL** | Extrem lange Seite (10.934px Desktop) mit blockierenden Fonts — LCP 3.9s |
| H12 | Mobile | **FAIL** | 11.330px Seitenlänge auf Mobile, Touch-Targets bei Navigation grenzwertig klein, Calculator-Slider auf Touch schwer bedienbar |

### Top-3 Quick Wins
1. **Inline-Registrierung statt externer Redirect** — Email-Feld direkt auf LP einbauen oder Registration-Modal als Overlay. Domain-Wechsel kostet ~30-50% Konversionen.
2. **Navigation auf Logo + Sticky-CTA reduzieren** — 7-Link-Nav lenkt vom Konversionsziel ab.
3. **CTA-Text kontextuell variieren** — Hero: "See My Diamond Options →", nach Calculator: "Lock In These Returns →", Final: "Claim My Diamonds Now →"

### Copywriting-Bewertung
- **Headline (A):** "Buy Real Diamonds. Earn Every Month." — Kurz, nutzengetrieben, zwei klare Benefits
- **Subheadline (B+):** Erklärt den Mechanismus, könnte persönlichen Nutzen stärker betonen
- **CTA-Text (C):** Generisch-repetitiv, alle 7 CTAs identisch
- **Reading Level (A):** Einfache Sprache, kurze Sätze, keine Fachbegriffe

### Kritische Investment-Bewertung
- **Renditeversprechen:** 6.3%/Monat (73.2%/Jahr) sind außergewöhnlich hoch. Disclaimer existiert, ist aber in winziger Schrift im Footer. Empfehlung: Risiko-Disclaimer visuell prominenter, direkt beim Calculator.
- **Social Proof:** Testimonial-Fotos von `randomuser.me` API — **nicht authentisch**. Live-Ticker ist hardcoded — **Fake Social Proof**.
- **Regulatorisch:** "Fully Licensed" Badge ohne Angabe welcher Lizenz von welcher Behörde. Keine BaFin/SEC/FCA-Registrierung sichtbar.
- **Urgency:** Moderat eingesetzt, keine Countdown-Timer. "Your Savings Are Shrinking" nutzt Inflationsdaten.

---

## 6. Typografie & Visual Design

### Visual-Score: 76/100

### Typografie-Regeln
| # | Regel | Status | Ist-Wert | Soll-Wert |
|---|-------|--------|----------|-----------|
| T1 | Fluid Typography | PASS | `clamp()` aktiv | `clamp()` |
| T2 | Body Text Größe | WARN | min 14.08px | ≥16px (1rem) |
| T3 | Heading-Hierarchie | WARN | H1=4.6x body, H2=2.7x | H1: 2.0-2.5x, H2: 1.5-1.8x |
| T4 | Zeilenlänge (CPL) | PASS | 45-75 CPL | 45-75 Desktop |
| T5 | Zeilenabstand | WARN | Body min 1.37, H1 1.05 | Body ≥1.5, H1 1.1-1.3 |
| T6 | Font Loading | WARN | 5 Weights, 2 Families | ≤3 Weights, WOFF2 |
| T7 | Farbkontrast | PASS | Alle Paare ≥4.5:1 | WCAG AA |
| T8 | Spacing-System | PASS | Konsistentes vertikales Spacing | 4px/8px Grid |
| T9 | Letter-Spacing | WARN | Kein erhöhtes Spacing | ≥0.02em für Body |
| T10 | Text-Ausrichtung | WARN | Viel zentrierter Fließtext | Linksbündig für Fließtext |
| T11 | Touch-Targets | WARN | Nav 12.8px, Labels 11.52px | ≥44x44px Tappable Area |

### Farbkontrast
| Element | Vordergrund | Hintergrund | Ratio | Status |
|---------|------------|-------------|-------|--------|
| Body text | rgb(192,200,220) | ~rgb(10,15,30) | 11.4:1 | PASS |
| Headings | rgb(240,243,250) | ~rgb(10,15,30) | 17.2:1 | PASS |
| Teal accent | rgb(82,212,216) | ~rgb(10,15,30) | 10.7:1 | PASS |
| CTA text on teal | rgb(7,13,26) | rgb(82,212,216) | 10.9:1 | PASS |
| Labels | rgb(112,128,160) | ~rgb(10,15,30) | 4.8:1 | PASS (knapp) |
| Gold stars | rgb(212,168,67) | ~rgb(10,15,30) | 8.6:1 | PASS |

**Alle Farbkontraste bestehen WCAG AA.** Das Dark-Theme ist professionell umgesetzt.

### Stärken
- Exzellente Farbkontrast-Werte durch Dark-Theme
- Kohärente Farbpalette: Dark Navy + Teal + Near-White
- Professionelle Fintech-Ästhetik
- Klare visuelle Hierarchie

### Schwächen
- H1 bei 78px überdimensioniert (4.6x Body statt 2.0-2.5x)
- Body-Text beginnt bei 14px (unter 16px Standard)
- 5 Font-Weights belasten Ladezeit
- Zentrierter Fließtext erschwert Scannen

### Code-Empfehlungen
```css
/* Body-Mindestgröße auf 16px anheben */
body, p { font-size: clamp(1rem, 0.95rem + 0.25vw, 1.125rem); }

/* H1 Ratio reduzieren */
h1 { font-size: clamp(2.5rem, 2rem + 2.5vw, 3.5rem); }

/* Body line-height erhöhen */
p, li, span { line-height: 1.6; }

/* Weniger Weights laden (spart HTTP-Requests) */
/* Empfehlung: 400, 600, 700 statt 300, 400, 500, 600, 700 */

/* Touch-Targets vergrößern */
nav a { min-height: 44px; min-width: 44px; display: inline-flex; align-items: center; }
```

---

## 7. Gesamtscore-Berechnung

| Dimension | Gewicht | Score | Gewichtet |
|-----------|---------|-------|-----------|
| Performance & SEO | 20% | 80 | 16.0 |
| Accessibility | 15% | 84 | 12.6 |
| Stress-Test | 10% | 85 | 8.5 |
| Content & Rechtlich | 15% | 62 | 9.3 |
| CRO | 25% | 55 | 13.8 |
| Visual Design | 15% | 76 | 11.4 |
| **Gesamt** | **100%** | | **71.6 → 72** |

**Gesamtnote: C+ (72/100)**

---

## Aktionsplan

### Sofort beheben (Kritisch)
1. **Cookie-Banner implementieren** — Rechtliche Pflicht bei Cookie-Nutzung (DSGVO/ePrivacy)
2. **Google Fonts async laden** — `font-display: swap` + Preconnect. Spart ~2.8s FCP.
3. **`<meta name="description">` ergänzen** — 120-155 Zeichen, sofortiger SEO-Gewinn
4. **Externe CTA-Domain transparent machen** — Registration auf eigene Domain migrieren oder klaren Hinweis hinzufügen
5. **"Fully Licensed" Badge konkretisieren** — Welche Lizenz? Welche Behörde?
6. **Fake Social Proof ersetzen** — Testimonial-Fotos von `randomuser.me` durch echte Fotos oder Trustpilot-Integration ersetzen

### Diese Woche (Wichtig)
7. **Navigation reduzieren** — Nur Logo + Sticky-CTA in Nav
8. **Inline-Registration** — Email-Feld oder Modal statt externer Redirect
9. **Open Graph + Twitter Card Tags** — Preview-Bild für Social Sharing
10. **Canonical URL setzen** — `<link rel="canonical" href="https://caratcuts.com/">`
11. **Heading-Hierarchie korrigieren** — H4 → H3, `<main>` Landmark ergänzen
12. **Calculator-Slider Label** — `aria-label="Investment amount"`
13. **Zahlenformat korrigieren** — "12.400+" → "12,400+" für EN-Publikum
14. **Body-Text auf 16px anheben**
15. **Redirect-Kette optimieren** — Direkt `http://` → `https://caratcuts.com/` (1 Hop)

### Nächstes Release (Nice-to-have)
16. CTA-Text kontextuell variieren
17. robots.txt + sitemap.xml anlegen
18. Font-Weights reduzieren (3 statt 5)
19. H1 Größe normalisieren (78px → ~56px)
20. Video-Thumbnail → Autoplay bei Klick
21. Touch-Targets vergrößern (≥44x44px)
22. Risiko-Disclaimer prominent beim Calculator
23. Governing Law in Terms konkretisieren
24. Fließtext linksbündig statt zentriert

---

*Report generiert am 2026-03-18 via Landing Page Audit Plugin (5 parallele Agents: Performance, Stress-Test, Content, CRO, Visual Design)*
