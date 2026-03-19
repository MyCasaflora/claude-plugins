# Confidence-Scoring System

Mehrstufiges Validierungsverfahren zur Bewertung der Zuverlässigkeit von Recherche-Ergebnissen.

---

## Schritt 1: Multi-Source-Confirmation (Basis-Score)

| Unabhängige Quellen | Basis-Score | Bedeutung |
|---------------------|-------------|-----------|
| 0 | 0 | Keine Aussage möglich |
| 1 | 30 | Einzelquelle, unbestätigt |
| 2 | 55 | Teilweise bestätigt |
| 3 | 70 | Gut bestätigt |
| 4+ | 80 | Stark bestätigt |

**Was zählt als "unabhängige Quelle":**
- Verschiedene MCP-Server mit unterschiedlichen Datengrundlagen
- Verschiedene APIs (z.B. RIS + EUR-Lex)
- Verschiedene Crawl-Quellen (z.B. gesetze-im-internet.de + dejure.org)
- Deep Research zählt als EINE Quelle (egal wie viele interne Quellen)

**Was zählt NICHT als unabhängig:**
- Gleiche Datengrundlage über verschiedene Wege (z.B. zwei MCPs die beide gesetze-im-internet.de nutzen)
- Kopien desselben Textes auf verschiedenen Webseiten
- Wikipedia-Einträge (keine Primärquelle)

---

## Schritt 2: Quellen-Qualitäts-Modifikatoren

| Quellentyp | Modifikator | Begründung |
|------------|-------------|------------|
| Amtsblatt / Gesetzblatt (BGBl, ABl.) | +20 | Rechtsverbindliche Primärquelle |
| Offizielle API (RIS, EUR-Lex, Fedlex, Federal Register) | +15 | Offiziell, maschinenlesbar |
| Offizielle Webseite (gesetze-im-internet.de, ris.bka.gv.at) | +10 | Offiziell, aber konsolidiert |
| Anerkannte Sekundärquelle (OpenLegalData, eCFR, Cornell LII) | +5 | Geprüft, aber nicht offiziell |
| Fachzeitschrift / Kommentar (NJW, BB, DStR) | +5 | Expertenmeinung, peer-reviewed |
| Community-Quelle (OpenJur, GitHub-Archive, dejure.org) | +0 | Nützlich, aber ungeprüft |
| Nachrichten-Quelle (Handelsblatt, FAZ, Reuters) | -3 | Journalistisch, nicht juristisch |
| Scraping-Quelle (Firecrawl auf beliebiger Webseite) | -5 | Format/Aktualität ungewiss |
| Deep-Research-Ergebnis (Gemini/Perplexity) | -5 | Halluzinationsrisiko |
| Blog / Forum / Social Media | -10 | Keine Validierung |

**Berechnung:** Durchschnitt der Modifikatoren aller genutzten Quellen.

---

## Schritt 3: Aktualitäts-Modifikatoren

| Letzte bekannte Aktualisierung | Modifikator |
|-------------------------------|-------------|
| Heute (Live-API-Abfrage) | +10 |
| < 7 Tage | +5 |
| < 30 Tage | +0 |
| < 6 Monate | -5 |
| < 1 Jahr | -10 |
| > 1 Jahr | -15 |
| Datum unbekannt | -10 |

**Spezialregel Steuerrecht:** Immer prüfen ob ein neueres Jahressteuergesetz die Norm geändert hat.
**Spezialregel Rechtsprechung:** Bei Urteilen zählt das Urteilsdatum, nicht das Veröffentlichungsdatum.

---

## Schritt 4: Rechtsverbindlichkeits-Modifikator

| Typ | Modifikator |
|-----|-------------|
| Verkündete Fassung (Gesetzblatt) | +10 |
| Konsolidierte Fassung (ohne Rechtscharakter) | -5 |
| Entwurf / Draft | -15 |
| Inoffizielle Übersetzung | -10 |
| Aufgehobene Norm (historisch) | -20 |

---

## Schritt 5: Konsistenz-Modifikatoren

| Situation | Modifikator |
|-----------|-------------|
| Alle Quellen stimmen überein | +5 |
| Quellen ergänzen sich (keine Widersprüche) | +0 |
| Leichte Abweichungen (z.B. unterschiedliche Formulierung) | -5 |
| Quellen widersprechen sich inhaltlich | -15 |
| Devil's Advocate findet valides Gegenargument | -10 |
| Gray Area identifiziert (Auslegungsspielraum) | -5 |
| Blind Spot identifiziert (relevante Aspekte übersehen) | -10 |

---

## Schritt 6: Finaler Score

```
Finaler Score = min(100, max(0,
  Basis-Score
  + Ø Quellen-Qualität
  + Aktualitäts-Modifikator
  + Rechtsverbindlichkeits-Modifikator
  + Konsistenz-Modifikator
))
```

---

## Schritt 7: Score-Interpretation und Verhalten

### Duale Darstellung: Quellen-Klasse + Score

Der numerische Score wird IMMER zusammen mit einer **Quellen-Klasse** angezeigt, die transparent macht WOHER die Bewertung stammt. Das verhindert falsche Präzisions-Suggestion.

| Score | Klasse | Farbe | Bedeutung | Verhalten |
|-------|--------|-------|-----------|-----------|
| 90-100 | **Q1** — Behördlich bestätigt | 🟢 | Offizielle Behördenquellen (BaFin, FMA, Amtsblatt, Handelsregister) bestätigen den Befund | Minimaler Disclaimer |
| 70-89 | **Q2** — Mehrfach belegt | 🟢 | 3+ unabhängige Quellen, davon mind. 1 offizielle | Standard-Disclaimer |
| 50-69 | **Q3** — Teilweise belegt | 🟡 | 2 Quellen oder nur Sekundärquellen, keine behördliche Bestätigung | Ausführlicher Disclaimer |
| 30-49 | **Q4** — Schwach belegt | 🟠 | Nur 1 Quelle oder ausschließlich Crawl/Deep-Research | Starker Disclaimer |
| 0-29 | **Q5** — Unbelegt | 🔴 | Keine unabhängige Bestätigung, nur Annahmen | "Keine zuverlässige Aussage möglich" |

### Transparenz-Pflicht

Der Score allein sagt wenig. Die **Quellen-Klasse** und die **Quellenliste** sind die eigentliche Information:

```
Confidence: Q2 (76%) — Mehrfach belegt
├── Basis: 70 (3 unabhängige Quellen)
├── Quellen:
│   ├── [Q1] FMA Investorenwarnung Tag Markets (fma.gv.at) — Behörde, offiziell
│   ├── [Q2] Companies House UK (company-information.service.gov.uk) — Register, offiziell
│   └── [Q3] Verbraucherschutzforum Berlin (verbraucherschutzforum.berlin) — Sekundär, journalistisch
├── Quellen-Qualität: +10
├── Aktualität: +0
├── Rechtsverbindlichkeit: -5
└── Konsistenz: +1

→ Stärkste Quelle: FMA-Warnung (behördlich)
→ Schwächste Quelle: Verbraucherschutzforum (Sekundär)
→ Was fehlt: Keine BaFin-Warnung gefunden, kein Handelsregister DE
```

Die Zeile "Was fehlt" ist PFLICHT — sie zeigt dem Leser welche Quellen NICHT gefunden wurden, was genauso wichtig ist wie die gefundenen.

---

## Schritt 8: Automatische Eskalation

| Trigger | Aktion |
|---------|--------|
| Score < 70 | Devil's Advocate Agent aktivieren |
| Score < 50 | Zusätzlich Blind Spot + Gray Area Prüfung |
| Score < 30 | User explizit warnen: "Recherche unzureichend" |
| Quellen widersprechen sich | Beide Positionen darstellen |
| Strafrechtliche Relevanz erkannt | Sofortige Warnung + Verweis an Anwalt |

---

## Schritt 9: Score-Protokoll

Jede Recherche dokumentiert den Score transparent:

```
Confidence: 72% (HOCH)
├── Basis: 70 (3 unabhängige Quellen)
├── Quellen-Qualität: +12 (Ø: offizielle API + Sekundärquelle)
├── Aktualität: +0 (< 30 Tage)
├── Rechtsverbindlichkeit: -5 (konsolidierte Fassung)
└── Konsistenz: -5 (leichte Abweichung in Formulierung)
```
