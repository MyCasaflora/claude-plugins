# Quellen-Registry

Vollständige Übersicht aller verfügbaren Quellen mit Status, Limits und Fallbacks.

---

## MCP-Server

| Server | Status | Daten | Limits |
|--------|--------|-------|--------|
| rechtsinformationen-bund-de-mcp | ✅ Aktiv | 6.870 DE Statuten | Keine bekannt |
| german-law-mcp | ✅ Aktiv | DE Gesetze + Zitatprüfung | Keine bekannt |
| ayunis-legal-mcp | ✅ Aktiv | Semantische Suche (pgvector) | Braucht PostgreSQL + Ollama |
| EU_compliance_MCP | ✅ Aktiv | 37 EU-Verordnungen | Artikel bis 70K Token |
| open-legal-compliance-mcp | ✅ Aktiv | EU/USA/UK/Kanada/WIPO | GovInfo braucht API-Key |
| openregister-mcp | ✅ Aktiv | DE Handelsregister | Rate Limits möglich |

## APIs

| API | URL | Status | Format | Key | Update |
|-----|-----|--------|--------|-----|--------|
| RIS Österreich | data.bka.gv.at | ✅ | JSON | Nein | Live |
| Federal Register | federalregister.gov/api | ✅ | JSON | Nein | Live |
| GovInfo | api.govinfo.gov | ✅ | JSON | DEMO_KEY | Live |
| Fedlex SPARQL | fedlex.data.admin.ch | ✅ | RDF | Nein | Live |
| EU Publications SPARQL | publications.europa.eu | ✅ | RDF | Nein | Live |
| World Bank | api.worldbank.org | ✅ | XML/JSON | Nein | Jährlich |
| EUR-Lex REST | eur-lex.europa.eu | ❌ 404 | — | — | — |
| CURIA | curia.europa.eu | ❌ 404 | — | — | — |
| OECD SDMX | stats.oecd.org | ❌ Migriert | — | — | — |

## Crawl-Quellen

| Quelle | Region | Crawl-Eignung | Fallback für |
|--------|--------|---------------|-------------|
| gesetze-im-internet.de | DE | Gut (HTML) | MCP-Ausfall |
| dejure.org | DE | Gut (HTML) | Zusatzquelle |
| bundesanzeiger.de | DE | Mittel (Login nötig für Details) | Firmendaten |
| ris.bka.gv.at | AT | Gut (HTML) | RIS API Ausfall |
| admin.ch | CH | Gut (HTML) | Fedlex Ausfall |
| eur-lex.europa.eu | EU | Mittel (komplex) | SPARQL Ausfall |
| law.cornell.edu | USA | Gut (HTML) | API Ausfall |
| irs.gov | USA | Mittel (PDFs) | Steuerrecht USA |
| legislation.ae | UAE | Mittel (arabisch/englisch) | Einzige Quelle |
| tax.gov.ae | UAE | Mittel | VAT/Corporate Tax |
| difc.ae | UAE | Gut | DIFC Regulierung |

## Website-Trust & Scam-Check Quellen

| Quelle | URL | Crawl-Eignung | Daten |
|--------|-----|---------------|-------|
| ScamAdviser | scamadviser.com/check/{domain} | Gut (HTML) | Trustscore (0-100), Risikobewertung, Positive/Negative Highlights, Crypto-Erkennung, Domain-Alter, Besucherzahlen |
| ScamDetector | scamdetector.com/validator/{domain} | Gut (HTML) | VLDTR-Score (0-100), Threat/Phishing/Malware-Analyse, Domain-Blacklisting-Status, HTTPS-Check, Branchenzuordnung |

### Verwendung

Für JEDE Domain die im Kontext einer Ermittlung auftaucht:
```
Firecrawl: https://www.scamadviser.com/check/{domain}
  → Trustscore extrahieren, Positive/Negative Highlights dokumentieren
  → Besonders achten auf: Crypto-Services-Warnung, Domain-Alter, Besucherzahlen

Firecrawl: https://www.scamdetector.com/validator/{domain}
  → VLDTR-Score extrahieren, Risk-Level dokumentieren
  → Besonders achten auf: Proximity to Harmful Websites, Blacklisting-Status
```

### Score-Interpretation

| Score-Bereich | ScamAdviser | ScamDetector |
|---------------|-------------|--------------|
| 0-30 | Hohes Risiko, nicht empfohlen | Hohes Risiko, Standard-Warnung |
| 31-50 | Fragwürdig, Vorsicht geboten | Medium-Hohes Risiko |
| 51-70 | Durchschnittlich, eigene Due Diligence nötig | Medium Risiko |
| 71-85 | Wahrscheinlich legitim | Akzeptabel |
| 86-100 | Vertrauenswürdig | Sicher |

### Integration in Confidence-Score

- Beide Scores < 50 → Confidence-Abzug von 15 Punkten
- Ein Score < 30 → Confidence-Abzug von 10 Punkten
- Beide Scores > 70 → Kein Abzug (neutral)
- Widersprüchliche Scores (Differenz > 30) → Als Red Flag dokumentieren, beide Bewertungen zitieren

## Nicht verfügbare Quellen (kostenpflichtig)

| Quelle | Grund | Alternative |
|--------|-------|------------|
| Juris | Kein API-Zugang, kostenpflichtig | OpenLegalData, german-law-mcp |
| Beck-Online | Kein API-Zugang, kostenpflichtig | Firecrawl auf dejure.org |
| LexisNexis | Kein Developer-Programm | open-legal-compliance-mcp |
| Westlaw | Kein Developer-Programm | Federal Register + GovInfo |
| IBFD | Academic Access eingeschränkt | OECD Data, Deep Research |
