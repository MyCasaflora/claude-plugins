# Public Legal & Tax Information Sources: United States & Dubai/UAE

## UNITED STATES

### 1. **IRS APIs and Databases**
| Property | Details |
|----------|---------|
| **Primary URL** | www.irs.gov/developers |
| **APIs Available** | Form 990-N e-file API, Tax Exempt Organization Search API |
| **Data Format** | JSON, XML |
| **Update Frequency** | Weekly-Monthly (varies by dataset) |
| **Access Cost** | Free |
| **API Documentation** | www.irs.gov/pub/irs-pdf/p6454.pdf |
| **MCP Suitability** | Moderate - limited to specific datasets; tax return filing focuses on nonprofits |

**Limitations**: IRS does not expose full tax code or individual return data via API for privacy reasons.

---

### 2. **US Internal Revenue Code (IRC)**
| Property | Details |
|----------|---------|
| **Primary Sources** | uscode.house.gov/view.xhtml?path=/prelim@title26 (Title 26 = Tax Code) |
| **Alternative Sources** | Cornell LII (law.cornell.edu/uscode/), Legal Information Institute maintains XML version |
| **Data Format** | HTML, XML (via Cornell), PDF |
| **Machine-Readable Format** | Cornell LII offers XML; www.govinfo.gov offers structured XML |
| **Update Frequency** | Real-time (within 24 hours of enactment) |
| **Access Cost** | Free |
| **GovInfo API** | api.govinfo.gov/docs?collection=USCODE&pageSize=100 |
| **MCP Suitability** | High - structured XML available; excellent for knowledge base integration |

---

### 3. **EDGAR / SEC API**
| Property | Details |
|----------|---------|
| **Primary URL** | www.sec.gov/cgi-bin/browse-edgar |
| **REST API Endpoint** | www.sec.gov/cgi-bin/browse-edgar (query parameters) |
| **Alternative API** | sec.report API (third-party, more JSON-friendly) |
| **Data Format** | HTML, XML (XBRL for financial data), JSON (via third-party) |
| **Update Frequency** | Real-time (filings processed same-day) |
| **Access Cost** | Free |
| **Query Example** | `www.sec.gov/cgi-bin/browse-edgar?action=getcompany&CIK=0000789019&type=10-K&dateb=&owner=exclude&count=100` |
| **XBRL Data** | www.sec.gov/xbrl/what-are-xbrl-documents |
| **MCP Suitability** | High - XBRL is XML-based; structured financial data ideal for integration |

**Note**: SEC does not have RESTful JSON API; use XML (XBRL) or parse HTML. Third-party services (like sec.report, financialmodelingprep.com) offer JSON wrappers.

---

### 4. **PACER (Public Access to Court Electronic Records)**
| Property | Details |
|----------|---------|
| **Primary URL** | www.pacer.uscourts.gov |
| **API Status** | No official JSON/XML API; HTML-based query system |
| **Query Interface** | www.pacer.uscourts.gov/ppl |
| **Data Format** | PDF (documents), HTML (search results) |
| **Free Access** | Limited free access; charges $0.10/page for downloads |
| **Update Frequency** | Daily |
| **Machine-Readable Format** | Minimal; PDFs are not machine-readable without OCR |
| **MCP Suitability** | Low - No structured API; requires PDF parsing and OCR |

**Alternative**: Google Scholar (scholar.google.com) offers free opinion access with structured search.

---

### 5. **Congress.gov API**
| Property | Details |
|----------|---------|
| **Primary URL** | congress.gov/developers |
| **API Endpoint** | api.congress.gov/v3 |
| **Data Format** | JSON (native) |
| **Update Frequency** | Daily (real-time for current activity) |
| **Access Cost** | Free (requires API key) |
| **Documentation** | api.congress.gov/docs |
| **Query Example** | `api.congress.gov/v3/bills?api_key=YOUR_KEY&limit=250` |
| **Available Data** | Bills, amendments, actions, votes, members, committees |
| **MCP Suitability** | Excellent - Clean JSON structure, comprehensive legislative data |

---

### 6. **Federal Register API**
| Property | Details |
|----------|---------|
| **Primary URL** | federalregister.gov/api/v1 |
| **API Endpoint** | api.federalregister.gov/v1 |
| **Data Format** | JSON (native), XML available |
| **Update Frequency** | Daily |
| **Access Cost** | Free |
| **Documentation** | federalregister.gov/reader-aids/developer-resources |
| **Query Example** | `api.federalregister.gov/v1/documents?agencies=IRS&per_page=100` |
| **Available Data** | Notices, proposed rules, final rules, executive orders |
| **MCP Suitability** | Excellent - Well-structured JSON; regulatory monitoring capability |

---

### 7. **US Code (Title 26 - Tax & Title 31 - Money/Finance)**
| Property | Details |
|----------|---------|
| **Primary URL** | uscode.house.gov |
| **Bulk Download** | Congress.gov provides bulk XML: www.congress.gov/download |
| **GovInfo** | api.govinfo.gov (for structured data) |
| **Data Format** | XML (best for machine-reading), HTML, PDF |
| **Update Frequency** | Real-time after legislation enacted |
| **Access Cost** | Free |
| **MCP Suitability** | High - XML available; excellent for legal knowledge bases |

---

### 8. **Cornell LII (Legal Information Institute)**
| Property | Details |
|----------|---------|
| **Primary URL** | law.cornell.edu |
| **Collections** | US Code, Federal Regulations, Court Opinions, State Laws |
| **Data Format** | HTML, XML (available upon request for bulk data) |
| **API Status** | No formal API; bulk XML downloadable |
| **Update Frequency** | Daily |
| **Access Cost** | Free |
| **Bulk Data Request** | Contact Cornell LII for XML dumps |
| **MCP Suitability** | Moderate - HTML-based; requires scraping unless bulk XML obtained |

---

### 9. **GovInfo API**
| Property | Details |
|----------|---------|
| **Primary URL** | api.govinfo.gov |
| **API Documentation** | www.govinfo.gov/about/api |
| **Data Format** | XML, JSON (limited), PDF, HTML |
| **Collections** | Federal Register, Congressional Record, US Code, CFR, CRS Reports |
| **Update Frequency** | Daily |
| **Access Cost** | Free |
| **Query Example** | `api.govinfo.gov/collections/CFR?api_key=YOUR_KEY&pageSize=100` |
| **XML Structure** | Highly structured; publication-level metadata included |
| **MCP Suitability** | Excellent - Comprehensive XML; authoritative government source |

---

### 10. **eCFR (Electronic Code of Federal Regulations) API**
| Property | Details |
|----------|---------|
| **Primary URL** | ecfr.gov/api |
| **API Endpoint** | api.ecfr.gov/api/v1 |
| **Data Format** | JSON (native), XML available |
| **Update Frequency** | Real-time (updated as regulations change) |
| **Access Cost** | Free |
| **Documentation** | ecfr.gov/reader-aids/api-developers-guide |
| **Query Example** | `api.ecfr.gov/api/v1/parts?title=26` (Title 26 = Tax regulations) |
| **Available Data** | Title 26 (Tax), Title 31 (Money), regulatory text with versioning |
| **MCP Suitability** | Excellent - Clean JSON; regulatory text with historical versions |

---

### 11. **USAspending.gov API**
| Property | Details |
|----------|---------|
| **Primary URL** | www.usaspending.gov/api |
| **Data Format** | JSON |
| **Update Frequency** | Daily |
| **Access Cost** | Free |
| **Documentation** | www.usaspending.gov/api/docs |
| **Query Scope** | Federal spending, contracts, grants |
| **MCP Suitability** | Moderate - Financial data; less relevant for tax law but useful for government procurement |

---

### 12. **State Tax Databases** (Variable by State)
| Property | Details |
|----------|---------|
| **Aggregators** | TaxJar (taxjar.com), Avalara (avalara.com) - maintain state databases |
| **State-Level** | Most states maintain custom portals (no unified API) |
| **Example: California** | taxes.ca.gov; no official API but bulk data available |
| **Example: New York** | tax.ny.gov |
| **Data Format** | HTML, PDF, occasional XML (state-dependent) |
| **MCP Suitability** | Low to Moderate - Fragmented; varies significantly by state |

**Note**: No unified national API for state taxes exists. Consider web scraping or third-party aggregators.

---

### 13. **State Business Registries**
| Property | Details |
|----------|---------|
| **National Access** | SAM.gov (System for Award Management) for federal contractors |
| **SAM.gov API** | api.sam.gov (JSON-based) |
| **State-Level** | Secretary of State websites (no unified API) |
| **Example: Delaware** | delaware.gov/business/entities/index.shtml |
| **MCP Suitability** | Low - Highly fragmented; requires state-by-state integration |

---

### 14. **Congressional Research Service (CRS) Reports**
| Property | Details |
|----------|---------|
| **Primary Source** | GovInfo (api.govinfo.gov collections=CRS) |
| **Alternative** | congress.gov/reports |
| **Data Format** | PDF, HTML, XML (via GovInfo) |
| **Update Frequency** | Varies (new reports added regularly) |
| **Access Cost** | Free |
| **Query Example** | `api.govinfo.gov/collections/CRS?pageSize=100&api_key=YOUR_KEY` |
| **MCP Suitability** | High - GovInfo API provides structured metadata + PDF |

---

### 15. **Tax Foundation Data**
| Property | Details |
|----------|---------|
| **Primary URL** | taxfoundation.org |
| **Data Availability** | Research reports, tax calculators |
| **API Status** | No official API |
| **Data Format** | HTML, PDF |
| **Access Cost** | Free (research), some premium content |
| **MCP Suitability** | Low - No machine-readable data format; research organization, not primary source |

---

## DUBAI / UNITED ARAB EMIRATES

### 1. **Federal Tax Authority (FTA) - VAT & Corporate Tax**
| Property | Details |
|----------|---------|
| **Primary URL** | www.fta.gov.ae |
| **VAT Registration Portal** | taxes.fta.gov.ae |
| **API Status** | No public API; B2B portal available for registered businesses |
| **Data Format** | HTML, PDF (tax guides) |
| **Business Portal** | Portal available for registered entities; API access upon special request |
| **Update Frequency** | As regulations change |
| **Access Cost** | Free (registration required for VAT filers) |
| **Regulatory Documents** | Available as PDF |
| **MCP Suitability** | Low - Limited machine-readable data; API access requires government approval |

**Note**: FTA does not provide public APIs for tax code or regulations. All data is HTML/PDF-based.

---

### 2. **Ministry of Finance UAE**
| Property | Details |
|----------|---------|
| **Primary URL** | www.mof.gov.ae |
| **API Status** | No public API |
| **Data Format** | HTML, PDF |
| **Content** | Budget information, fiscal policies, financial reports |
| **Update Frequency** | Periodic (annual budget cycles) |
| **Access Cost** | Free |
| **MCP Suitability** | Low - Informational only; no structured data access |

---

### 3. **Dubai Economic Department (DED)**
| Property | Details |
|----------|---------|
| **Primary URL** | www.ded.ae |
| **Business Registration** | Smart License Portal (license.ded.ae) |
| **API Status** | No public API; B2B integrations available for authorized partners |
| **Data Format** | HTML, XML (for B2B integrations) |
| **Business Search** | Public business directory search available |
| **Access Cost** | Free (public search); licensing for business services |
| **MCP Suitability** | Low to Moderate - Limited public API; B2B integrations require partnership |

---

### 4. **DIFC (Dubai International Financial Centre) Courts & Regulations**
| Property | Details |
|----------|---------|
| **Primary URL** | www.difccourts.ae |
| **DIFC Laws** | laws.difc.ae |
| **Law Library** | Comprehensive laws/regulations database |
| **Data Format** | HTML, PDF (laws and judgments) |
| **API Status** | No public API; database searchable via web interface |
| **Case Law Access** | Case judgments available online (HTML/PDF) |
| **Update Frequency** | Real-time (new judgments posted) |
| **Access Cost** | Free |
| **MCP Suitability** | Moderate - Structured content but no API; requires web scraping |

---

### 5. **Abu Dhabi Global Market (ADGM) Regulations**
| Property | Details |
|----------|---------|
| **Primary URL** | www.adgm.com |
| **Regulatory Rules** | www.adgm.com/rulebooks-and-regulations |
| **Data Format** | HTML, PDF |
| **API Status** | No public API |
| **Laws Available** |