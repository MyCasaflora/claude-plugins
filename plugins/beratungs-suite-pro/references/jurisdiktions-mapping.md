# Jurisdiktions-Mapping

Mapping von Stichwörtern zu Jurisdiktionen und Quellen.

---

## Automatische Jurisdiktions-Erkennung

| Signal im Kontext | Jurisdiktion | Primärquellen |
|---|---|---|
| BGB, StGB, HGB, GmbHG, AktG, InsO | DE | rechtsinformationen-bund, german-law |
| EStG, KStG, UStG, AO, GewStG (ohne Länderkürzel) | DE | rechtsinformationen-bund |
| ABGB, UGB, öStGB, "Österreich" | AT | RIS API |
| OR, ZGB, StGB-CH, "Schweiz" | CH | Fedlex SPARQL |
| DSGVO, AI Act, MiFID, NIS2, DORA | EU | EU_compliance_MCP |
| USC, CFR, "United States", "federal" | USA | Federal Register, GovInfo |
| "Dubai", "UAE", "DIFC", "ADGM", "Free Zone" | UAE | Firecrawl (legislation.ae) |
| "DBA", "Doppelbesteuerung" + 2 Länder | Multi | Beide Jurisdiktionen + DBA |
| "EU-Richtlinie" + nationales Recht | Multi | EU + nationales Recht |

---

## Quellen-Routing pro Jurisdiktion

### Deutschland (DE)
```
Primär:  rechtsinformationen-bund-mcp → german-law-mcp → ayunis-legal-mcp
Sekundär: Firecrawl auf gesetze-im-internet.de, dejure.org
Spezial:  openregister-mcp (Handelsregister), Firecrawl auf bundesanzeiger.de
Research: openrouter-skill-v3 (Gemini/Perplexity Deep Research)
```

### Österreich (AT)
```
Primär:  RIS API (data.bka.gv.at/ris/api/v2.6/Bundesrecht)
Sekundär: Firecrawl auf ris.bka.gv.at
Spezial:  Firecrawl auf wko.at, bmf.gv.at
```

### Schweiz (CH)
```
Primär:  Fedlex SPARQL (fedlex.data.admin.ch/sparqlendpoint)
Sekundär: Firecrawl auf admin.ch, fedlex.admin.ch
Spezial:  Firecrawl auf estv.admin.ch (Steuerverwaltung)
```

### EU
```
Primär:  EU Publications SPARQL → EU_compliance_MCP
Sekundär: open-legal-compliance-mcp
Spezial:  Firecrawl auf eur-lex.europa.eu, curia.europa.eu
```

### USA
```
Primär:  Federal Register API → GovInfo API
Sekundär: open-legal-compliance-mcp
Spezial:  Firecrawl auf law.cornell.edu, irs.gov
```

### UAE
```
Primär:  Firecrawl auf legislation.ae
Sekundär: Firecrawl auf tax.gov.ae, difc.ae, mof.gov.ae
Spezial:  Deep Research (Gemini/Perplexity) für aktuelle Entwicklungen
```

---

## Regulatorische Arbitrage Detection

### Targeting-Verstoß: Marktortprinzip

```
PRÜFUNG:
  1. Wo ist die Firma registriert?
  2. In welcher Sprache ist der Content? (stärkster Indikator)
  3. An wen richtet sich das Marketing geografisch? (Facebook Ad Library!)

RED-FLAG-KOMBINATIONEN:
  Deutsch + Dubai (FZCO)                 → BaFin-Zuständigkeit trotzdem
  Deutsch + St. Vincent und die Grenadinen → klar: Regulierungs-Arbitrage
  Deutsch + UK Ltd. + keine FCA-Lizenz   → KWG-relevant in DE
  Deutsch + Wyoming LLC                  → Keine direkte Vollstreckung in DE

RECHTLICHE KONSEQUENZ:
  Wer den deutschen Markt aktiv bewirbt, unterliegt der BaFin —
  egal wo die Firma sitzt. (Marktortprinzip nach EU-Recht)
```

### Offshore-Jurisdiktionen mit erhöhtem Risiko

| Jurisdiktion | Risikoprofil | Typische Struktur |
|---|---|---|
| Dubai (FZCO/LLC) | Hoch | Nullsteuer, wenig Transparenz |
| St. Vincent und die Grenadinen | Sehr hoch | Kein Regulierungsrahmen für Finanzprodukte |
| Seychellen | Hoch | Keine öffentlichen Gesellschafterregister |
| Marshall Islands | Sehr hoch | Extremes Offshore-Zentrum |
| Vanuatu | Hoch | Bekannt für Forex-Lizenzen ohne echte Aufsicht |
| Belize | Hoch | Offshore-Banklizenzen mit wenig Substanz |
| Wyoming LLC (USA) | Mittel-Hoch | Kein öffentliches Gesellschafterregister, kein Mindestkapital |
| UK Ltd (post-Brexit) | Mittel | Briefkastengesellschaft möglich; in DE ggf. als OHG behandelt |
| Zypern (ohne CySEC-Lizenz) | Mittel | EU-Mitglied, aber Briefkasten häufig |
