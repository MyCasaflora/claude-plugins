# Actor Loop — Personen-Tiefenrecherche

Wenn ein Name (Initiator, CEO, Admin-C, Influencer) identifiziert wurde,
wird eine lückenlose Akteurs-Historie erstellt. Iterativ für JEDE Person.

Ergänzt `references/ermittlungs-framework.md` Abschnitt "Netzwerk-Analyse".

---

## Loop-Ablauf (für jede identifizierte Person)

### A: Handelsregister-Scraping (National + International)

```
North Data (DE):
  web_fetch("https://www.northdata.de/search?q={name}+{vorname}")
  → Alle verbundenen DE-Firmen, Insolvenzen, historische Beteiligungen

OpenCorporates (International):
  web_fetch("https://opencorporates.com/officers?q={name}&utf8=✓")
  → Internationale Firmenbeteiligungen

DE Handelsregister:
  openregister-mcp: Alle GF/Gesellschafter-Rollen
  unternehmensregister.de: Jahresabschlüsse, Bekanntmachungen

FRAGEN:
  Welche Firmen hatte die Person vorher?
  Sind diese insolvent gegangen?
  Gibt es Muster? (gleiche Branche, gleiche Struktur, gleiches Produkt)
  Serien-Täter wechseln oft nur das Produkt: Krypto → Diamanten → Cannabis → Immobilien
```

### B: Scam-Historien-Suche

```
SUCHFORMELN:
  web_search("{Name} {Vorname} Scam BaFin Insolvenz Schneeballsystem")
  web_search("{Name} {Vorname} Betrug Strafanzeige Klage Urteil")
  web_search("{Name} {Vorname} warning fraud SEC FCA")
  web_search("{Name} {Vorname} site:forum.* Erfahrungen Warnung")
  web_search("{Name} {Vorname} Trustpilot Bewertungen Betrug")
```

### C: Social Graphing

```
LinkedIn: linkedin.com/search/results/people/?keywords={name}
  → Frühere Tätigkeiten, Gründer-Verbindungen, Co-Founder
  → Wer sind die ständigen Begleiter?

SCHLÜSSELFRAGE:
  Wenn Initiator A "sauber" erscheint:
  Hat Initiator B (sein ständiger Begleiter) die Behördenwarnungen?
```

### D: Alias-Namen-Erkennung

```
Vergleich: Name in Impressum ≠ Name im Kanal ≠ Name in Metadaten
→ Jeden Alias separat durch den Actor Loop führen
→ web_search("{echter Name}" + bekannte Alias-Namen)
```

### E: Insolvenz & Bundesanzeiger

```
insolvenzbekanntmachungen.de → laufende/abgeschlossene Verfahren
bundesanzeiger.de → Jahresabschlüsse, frühere Unternehmen
```

---

## Output: Personen-Dossier

```json
{
  "name": "...",
  "aliases": [],
  "firmennetzwerk": [
    { "firma": "...", "status": "aktiv/insolvent/liquidiert", "zeitraum": "...", "quelle": "northdata.de" }
  ],
  "scam_historien": [
    { "quelle": "...", "inhalt": "...", "datum": "...", "verifiziert": true }
  ],
  "soziales_netzwerk": ["Name A (Co-Founder)", "Name B (bekannter Begleiter)"],
  "vorsatz_score_beitrag": 0,
  "rechtsrisiko": "🔴/🟠/🟡/🟢"
}
```
