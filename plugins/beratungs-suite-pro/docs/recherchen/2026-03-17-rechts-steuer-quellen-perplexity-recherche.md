# Comprehensive Legal & Tax Information APIs - DACH, EU & International

## 1. GERMANY

### Federal Law & Regulations

| Source | URL | Format | API? | Update Freq | Access | MCP Suitability |
|--------|-----|--------|------|-------------|--------|-----------------|
| **Gesetze im Internet (BGBl)** | gesetze-im-internet.de | HTML, partial XML | ❌ No official API | Daily | Free | Low - scraping required |
| **Rechtsinformationssystem (RIS)** | gesetze-im-internet.de/risxmldb | XML | ✅ Limited | Daily | Free | Medium - XML feeds available |
| **Bundesanzeiger** | bundesanzeiger.de | HTML, PDF | ✅ REST API (beta) | Real-time | Free (core) | Medium - covers companies, insolvencies |
| **Handelsregister (HRA/HRB)** | handelsregister.de | HTML, PDF | ❌ No API | Real-time | €2-5/query | Low - payment barrier |
| **Transparenzregister** | transparenzregister.de | XML, JSON | ✅ REST API | Daily | Free | High - UBO data structured |

### Tax Law & Court Decisions

| Source | URL | Format | API? | Update Freq | Access | MCP Suitability |
|--------|-----|--------|------|-------------|--------|-----------------|
| **BMF-Schreiben (Tax directives)** | bundesfinanznachrichten.de | PDF, HTML | ❌ No API | Weekly | Free | Low - unstructured |
| **BFH Decisions** | bfh.de | HTML, PDF | ❌ No API | Weekly | Free | Low - requires scraping |
| **Finanzgerichte (Tax Courts)** | finanzgerichtshof.de (state-specific) | HTML, PDF | ❌ No | Weekly | Free | Low |
| **ELSTER** | elster.de | XML (encrypted) | ⚠️ B2B only | Real-time | Restricted | Medium - requires registration |
| **Zollgesetze (Customs)** | zoll.de/gesetze | HTML | ❌ No | Ad-hoc | Free | Low |

**Key caveat**: Germany's federal legal databases deliberately avoid machine-readable APIs to preserve official publication status in Bundesgesetzblatt (BGBl).

---

## 2. AUSTRIA

| Source | URL | Format | API? | Update Freq | Access | MCP Suitability |
|--------|-----|--------|------|-------------|--------|-----------------|
| **RIS (Rechtsinformationssystem)** | ris.bka.gv.at | XML, JSON | ✅ SOAP/REST | Daily (24h lag) | Free | **High** - structured legal data |
| **RIS API Endpoint** | ris.bka.gv.at/GeltendeFassung | JSON-LD, XML | ✅ Full API | Daily | Free | High |
| **Bundesgesetzblatt (BGBl)** | norris.justice.gv.at | PDF, HTML | ❌ Limited | Weekly | Free | Low |
| **Wirtschaftskammer (WKO)** | wko.at/apiservices | JSON | ✅ REST API | Daily | Free (rate limited) | Medium |
| **Finanzministerium (BMF)** | bmf.gv.at/steuern | HTML, PDF | ❌ No API | Ad-hoc | Free | Low |
| **Gerichtsentscheidungen** | ris.bka.gv.at/Jus | XML | ✅ Queryable | Daily | Free | High |

**Strength**: RIS is the most robust legal API in DACH region.

---

## 3. SWITZERLAND

| Source | URL | Format | API? | Update Freq | Access | MCP Suitability |
|--------|-----|--------|------|-------------|--------|-----------------|
| **Fedlex (Federal Law)** | fedlex.data.admin.ch | RDF, JSON-LD, XML | ✅ SPARQL + REST | Real-time | Free | **Excellent** - Linked Data |
| **Fedlex Linked Data SPARQL** | fedlex.data.admin.ch/sparql | SPARQL queries | ✅ Full | Real-time | Free | Excellent - semantic queries |
| **Fedlex REST API** | fedlex.data.admin.ch/api | JSON-LD, XML | ✅ Full REST | Real-time | Free | High |
| **Swiss Tax Authority (ESTV/SFTA)** | estv.admin.ch | HTML, PDF | ❌ No API | Monthly | Free | Low |
| **Ordipro (Codes & Laws)** | admin.ch/opc | HTML | ❌ No | Real-time | Free | Low |
| **Cantonal Law Databases** | (varies by canton) | Varies | ❌ Limited | Varies | Free | Low |

**Strength**: Fedlex is model implementation for legal data publishing (uses W3C standards).

---

## 4. EU LEVEL

### EUR-Lex

| Source | URL | Format | API? | Update Freq | Access | MCP Suitability |
|--------|-----|--------|------|-------------|--------|-----------------|
| **EUR-Lex REST API** | eur-lex.europa.eu/content/help/faq/backend.html | XML, JSON | ✅ Full REST | Real-time | Free | **High** |
| **EUR-Lex Endpoint** | sparql.eur-lex.europa.eu | SPARQL | ✅ Full SPARQL | Real-time | Free | High - semantic queries |
| **Cellar Triple Store** | cellar.eu (backend) | RDF/XML, N-Triples | ✅ SPARQL only | Real-time | Free | High |
| **Publications Office API** | op.europa.eu/o/opportal_api | JSON, XML | ✅ REST | Real-time | Free | High |

**EUR-Lex API Documentation**: eur-lex.europa.eu/en/technical-notice

### Court of Justice (CURIA)

| Source | URL | Format | API? | Update Freq | Access | MCP Suitability |
|--------|-----|--------|------|-------------|--------|-----------------|
| **CURIA Case Law** | curia.europa.eu | HTML, PDF | ❌ No official API | Weekly | Free | Low - scraping required |
| **Unrestricted Documents** | curia.europa.eu/en/documents/ | XML, HTML | ⚠️ Partial | Weekly | Free | Medium |

---

## 5. INTERNATIONAL TAX & TRADE

| Source | URL | Format | API? | Update Freq | Access | MCP Suitability |
|--------|-----|--------|------|-------------|--------|-----------------|
| **OECD Tax Database** | oecd.org/tax/treaties | PDF, Excel | ❌ No API | Quarterly | Free (limited) | Low |
| **UN Double Taxation Agreements** | un.org/esa/ffd/treaties | PDF, HTML | ❌ No | Quarterly | Free | Low |
| **IBFD (International Bureau)** | ibfd.org | Various | ✅ Premium API | Daily | **Paid** (€500+/mo) | High - if budget allows |
| **WTO Tariff Database (TARIFFLINE)** | tariffline.wto.org | JSON, XML | ✅ REST API | Daily | Free | High - trade compliance |
| **UNODC Legislation** | legislation.unodc.org | HTML, PDF | ❌ No | Ad-hoc | Free | Low |

---

## TECHNICAL RECOMMENDATIONS FOR MCP SERVER

### Tier 1 (Highly Recommended - Build-Ready)
1. **Fedlex (Switzerland)** - SPARQL endpoint + REST API (real-time, structured)
2. **EUR-Lex + Cellar** - Complete EU law coverage (SPARQL + REST)
3. **RIS Austria** - JSON API with legal hierarchy
4. **WTO Tariff Database** - JSON exports for trade data

### Tier 2 (Supplementary)
5. **Bundesanzeiger (Germany)** - Company/insolvency data via REST
6. **Transparenzregister (Germany)** - UBO registers via JSON
7. **OECD Tax Treaties** - Manual ingestion (monthly updates)

### Caching Strategy
- **Real-time**: Fedlex, EUR-Lex (use WebSocket or polling every 6 hours)
- **Daily**: RIS Austria, BfA tax documents (nightly sync)
- **Manual**: OECD, IBFD data (quarterly)

### Data Integration Challenges

| Challenge | Solution |
|-----------|----------|
| Language variation (DE/FR/IT/EN) | Store original + machine translation |
| Cross-reference resolution | Build knowledge graph linking Fedlex→EUR-Lex→RIS |
| Version management | Implement temporal properties (dct:issued, dct:modified) |
| Legal cite parsing | Use Akoma Ntoso XML standard for normalization |

---

## NOT RECOMMENDED (Lacks Machine-Readability)

- ❌ Germany's gesetze-im-internet.de (deliberate anti-scraping stance)
- ❌ BFH court decisions (PDFs only, no structured data)
- ❌ Swiss cantonal law (fragmented, no unified API)
- ❌ IBFD (cost-prohibitive for open MCP)

---

**Disclaimer**: API endpoints and formats change. Verify current availability via institutional documentation. Several sources (particularly EU institutions) require proper attribution under CC4.0-BY licenses.

Would you like technical implementation details for any specific source or SPARQL query templates?