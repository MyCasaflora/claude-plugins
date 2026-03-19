---
name: steuer-analyse
description: |
  Steuerrechtliche Analyse für nationales und internationales Steuerrecht.
  Verwende diesen Skill für einzelne Steuerfragen, Steuerberechnungen,
  DBA, Verrechnungspreise oder steuerliche Auswirkungen.
  NICHT verwenden für: strategische Unternehmensberatung, Marktanalysen, Geschäftsmodelle.
  Für vollständige orchestrierte Steueranalyse mit Validierung → /steuer-check verwenden.
  Trigger: "Steuer", "tax", "Umsatzsteuer", "Einkommensteuer", "Körperschaftsteuer",
  "DBA", "Doppelbesteuerung", "Verrechnungspreise", "VAT", "USt-IdNr",
  "Steuererklärung", "Betriebsausgaben", "Abschreibung", "steuerliche Auswirkung",
  "Holding-Struktur", "Wegzugsbesteuerung", "Quellensteuer", "tax planning",
  "Gewerbesteuer", "Grunderwerbsteuer", "Erbschaftsteuer", "Schenkungsteuer",
  "Lohnsteuer", "Kapitalertragsteuer", "Rechnung prüfen", "§ 14 UStG",
  "Kleinunternehmer", "Vorsteuerabzug", "Reverse Charge", "innergemeinschaftlich".
---

# Steuer-Analyse

Steuerrechtliche Analyse mit Berechnungsunterstützung und internationaler Perspektive.

---

## Wann einsetzen

- User fragt nach Steuersätzen, Freibeträgen, Schwellenwerten
- User möchte steuerliche Auswirkungen einer Transaktion wissen
- User fragt nach DBA oder internationaler Besteuerung
- User möchte eine Rechnung auf formale Korrektheit prüfen
- User fragt nach Holding-Strukturen oder Wegzugsbesteuerung
- User erwähnt Umsatzsteuer, Einkommensteuer, Körperschaftsteuer

---

## Ablauf

### Schritt 1: Steuer-Typ erkennen + Komplexitäts-Erkennung

| Typ | Schlüsselwörter | Relevante Normen |
|-----|-----------------|------------------|
| Einkommensteuer | EStG, Freibetrag, Progression | EStG, EStDV |
| Körperschaftsteuer | KStG, Gesellschaft, GmbH-Besteuerung | KStG, KStDV |
| Umsatzsteuer | USt, MwSt, Vorsteuer, Rechnung | UStG, UStDV |
| Gewerbesteuer | GewSt, Hebesatz | GewStG |
| International | DBA, Transfer Pricing, BEPS | AO § 90, OECD-MA |
| Lohnsteuer | Gehalt, Arbeitnehmer, Lohnabrechnung | EStG §§ 19, 38-42 |

#### Komplexitäts-Erkennung (PFLICHT)

Lies `references/ermittlungs-framework.md` für die vollständige Logik.

**EINFACH** → Weiter mit Schritt 2 (Subagent-Modus):
- Einzelne Steuerberechnung ("Berechne USt auf 5.000 €")
- Einzelne Rechnungsprüfung (§ 14 UStG)
- Einzelner Steuersatz/Freibetrag nachschlagen
- Einfache DBA-Frage mit 2 Ländern

**KOMPLEX** → Agent Team aktivieren (Ermittlungs-Modus):
- Verdacht auf Steuerhinterziehung / Scheingeschäfte
- Komplexe Holding-Strukturen / Offshore-Konstrukte
- Multi-Jurisdiktion mit Gewinnverschiebung
- Prüfung von Unternehmens-Steuerpraktiken
- User stellt Unterlagen zur Verifizierung bereit
- Verbindung zu strafrechtlich relevanten Sachverhalten

Bei **KOMPLEX**: Aktiviere `agent-team-creator` mit folgendem Team:

| Agent | Rolle | Modell |
|-------|-------|--------|
| lead | Koordinator, dispatcht Researcher | opus |
| researcher-regulatorik | BaFin, FMA, Steuer-Warnungen (parallel) | sonnet |
| researcher-osint | Social Media, Bewerbung Steuerprodukte (parallel) | sonnet |
| researcher-register | Handelsregister, Bundesanzeiger, Bilanzen (parallel) | sonnet |
| ermittler | Konsolidiert, Geldfluss-Diagramm, Netzwerk | opus |
| steuerfahnder | Hinterziehung, Scheingeschäfte, Betriebsprüfung | opus |
| fachanwalt-steuer | DBA, Selbstanzeige, Compliance, Maßnahmenplan | sonnet |
| devils-advocate | Gegenposition | opus |

Das Team übernimmt ab hier. Die folgenden Schritte gelten für den **Subagent-Modus (EINFACH)**.

---

### Schritt 2: Quellen-Routing

| Region | Primärquellen | Steuer-Spezifisch |
|--------|--------------|-------------------|
| DE | rechtsinformationen-bund-mcp (EStG, KStG, UStG, AO, GewStG) | BMF-Schreiben via Firecrawl |
| AT | RIS API (EStG AT, KStG AT, UStG AT) | BMF.gv.at via Firecrawl |
| CH | Fedlex SPARQL (DBG, MWSTG, StHG) | admin.ch/estv via Firecrawl |
| EU | EU VAT Richtlinie via EU_compliance_MCP | VIES API für USt-IdNr |
| USA | Federal Register + eCFR (26 CFR) | IRS.gov via Firecrawl |
| UAE | tax.gov.ae via Firecrawl | Corporate Tax Law (Federal Decree-Law No. 47/2022) |

### Schritt 3: Rechnungsprüfung (wenn relevant)

Pflichtangaben nach § 14 Abs. 4 UStG:
1. Vollständiger Name und Anschrift des leistenden Unternehmers
2. Vollständiger Name und Anschrift des Leistungsempfängers
3. Steuernummer oder USt-IdNr.
4. Ausstellungsdatum
5. Fortlaufende Rechnungsnummer
6. Menge und Art der Lieferung/Leistung
7. Zeitpunkt der Lieferung/Leistung
8. Nettobetrag
9. Steuersatz und Steuerbetrag
10. Bruttobetrag

Kleinbetragsrechnungen (< 250 € brutto): Erleichterte Anforderungen nach § 33 UStDV.

### Schritt 4: DBA-Analyse (bei grenzüberschreitend)

1. Beteiligte Staaten identifizieren
2. Relevantes DBA suchen (DE hat ~95 DBA)
3. Einkunftsart bestimmen (Art. 6-21 OECD-MA)
4. Methode bestimmen: Freistellung oder Anrechnung
5. Progressionsvorbehalt prüfen

### Schritt 5: Validierung

Wie bei recht-recherche: Confidence-Scoring, Disclaimer.

### Schritt 6: Dokument speichern

Lies `references/docs-output.md` für die vollständige Output-Konvention.

1. **Analyse speichern**: Fertige Steueranalyse als Datei in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/` speichern
2. **Recherchen speichern**: Falls substanzielle Recherche-Ergebnisse vorliegen (Normensammlungen, DBA-Vergleiche), diese in `${CLAUDE_PLUGIN_ROOT}/docs/recherchen/` speichern
3. **Namensschema**: `YYYY-MM-DD-<thema>-<typ>.md` (z.B. `2026-03-18-dba-de-ae-analyse.md`)
4. **Frontmatter**: Jede Datei mit YAML-Header (titel, datum, typ, skill, jurisdiktion, confidence)
5. **User informieren**: Dateipfad im Output anzeigen

---

## Berechnungsformeln

**Umsatzsteuer:**
- Brutto = Netto × (1 + Steuersatz)
- MwSt-Betrag = Brutto × Steuersatz / (1 + Steuersatz)
- DE: 19% (Regel) / 7% (ermäßigt)
- AT: 20% / 10% / 13%
- CH: 8,1% / 2,6% / 3,8%

**Einkommensteuer DE (vereinfacht, 2024):**
- Grundfreibetrag: 11.604 €
- Spitzensteuersatz: 42% (ab 66.761 €)
- Reichensteuersatz: 45% (ab 277.826 €)
- Solidaritätszuschlag: 5,5% auf ESt (Freigrenze 18.130 €)

**Gewerbesteuer DE:**
- Steuermessbetrag = Gewerbeertrag × 3,5%
- Gewerbesteuer = Steuermessbetrag × Hebesatz (Kommune)
- Freibetrag Personengesellschaften: 24.500 €

---

## Edge Cases

- **Steuerrecht ändert sich häufig**: Immer Aktualitätscheck, Jahressteuergesetz beachten
- **Berechnung vs. Beratung**: Nur Berechnungen auf Basis öffentlicher Formeln, keine Steuergestaltung
- **Internationale Sachverhalte**: Immer DBA prüfen, nie nur eine Seite betrachten
- **Kleinunternehmerregelung**: § 19 UStG beachten (Grenze 22.000 €/Jahr)

---

## Referenzen

Lies `references/confidence-scoring.md` für die Scoring-Logik.
Lies `references/disclaimer-system.md` für Steuer-spezifische Disclaimer.
Lies `references/quellen-registry.md` für alle verfügbaren Steuerquellen.
Lies `references/docs-output.md` für die Docs-Output-Konvention (Speicherpfade, Namensschema, Frontmatter).
Lies `references/ermittlungs-framework.md` für Komplexitäts-Erkennung, Unternehmens-Verifizierung und Agent-Team-Zusammensetzungen.
Lies `references/kernlogik.md` für den systematischen 8-Phasen-Durchlauf (PFLICHT).
Lies `references/visualisierung.md` für Mermaid-Diagramm-Templates (Geldfluss, Steuerbelastung).
Verwende `templates/gespraechsnotiz.md` für die kompakte Gesprächsnotiz-Version.
Lies `references/verjährungsfristen.md` für Festsetzungs- und Strafverfolgungsverjährung (PFLICHT).
Lies `references/eskalationspfade.md` für Selbstanzeige-Strategie, Eskalation, Kostenrechner.
Lies `references/massnahmenplan.md` für konkrete Handlungsempfehlungen (PFLICHT am Ende jedes Reports).
Lies `references/erweiterte-prueffelder.md` für Sozialversicherung, Krypto, Scheinselbstständigkeit, Verrechnungspreise.

---

## Nächster Schritt nach der Analyse

Am Ende jeder abgeschlossenen Steuer-Analyse dem User anbieten:

> "Soll ich jetzt einen konkreten Umsetzungsplan erstellen, der alle Findings in
> priorisierte Handlungsschritte mit Fristen, Kosten und Erfolgskriterien übersetzt?
> → `/umsetzungsplan` starten"

Wenn User zustimmt: Sofort `/umsetzungsplan` mit den aktuellen Findings als Input starten.
Die Findings NICHT erneut erheben — direkt aus dieser Analyse verwenden.
