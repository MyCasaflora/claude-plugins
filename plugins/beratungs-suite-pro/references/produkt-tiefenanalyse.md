# Pro-Produkt-Analyse Loop

Für JEDES identifizierte Produkt diesen Loop vollständig durchführen.
Ergänzt `references/erweiterte-prueffelder.md`.

---

## Loop-Schritte (pro Produkt)

### A: Produktwebsite öffnen
```
web_fetch(produktURL)
Erfassen: AGB, Impressum, Risikohinweise, Renditeangaben
```

### B: Renditeversprechen berechnen
```
EXTRAKTION: /(\d+)[,.]?(\d*)\s*%/ Regex

UMRECHNUNG (Zinseszins):
  Monatlich → Jährlich: ((1 + x/100)^12 - 1) * 100
  Täglich → Jährlich: ((1 + x/100)^365 - 1) * 100

BEWERTUNGSSCHWELLEN:
  < 8% p.a.   → marktüblich
  8–20% p.a.  → erhöhtes Risiko, nähere Prüfung
  20–50% p.a. → sehr hohes Risiko, §5a UWG-Verstoß wahrscheinlich
  > 50% p.a.  → Schneeballverdacht → §16 UWG / §263 StGB-Merkmale
```

### C: Regulierungsstatus prüfen
```
web_search("{Produktname} BaFin MiCAR Betrug warning")
web_search("{Anbieter} {Land} Regulierung Lizenz")
Regulator-Endpoints: references/regulator-endpoints.md
```

### D: MLM-Struktur erkennen
```
INDIKATOREN:
  - Sponsor-ID oder Empfehlungs-ID bei Registrierung erforderlich
  - Mehrstufige Provisionspläne ("Downline", "Upline")
  - Verdienst durch Anwerbung neuer Mitglieder > Produktverkauf
  - Produkt nur über andere Mitglieder kaufbar

NORM WENN JA: §16 UWG (Progressive Kundenwerbung / Pyramidensystem)
```

### E: Risikokategorie zuweisen
```
🔴 Kritisch:  BaFin/FMA/FINMA-Warnung ODER nachgewiesene Schäden ODER GwG ODER >100% p.a.
🟠 Sehr hoch: Keine Lizenz bei regulierungspflichtigem Produkt ODER 50–100% p.a. ODER MLM
🟡 Hoch:      HWG-Verstoß ODER §5a UWG-Verstoß ODER 20–50% p.a.
🟢 Gering:    Keine Finanz-/Gesundheitsprodukte, alle Angaben nachprüfbar
```

---

## Produkt-Matrix (JSON-Schema)

```json
{
  "id": "P001",
  "name": "...",
  "anbieter": "...",
  "anbieter_land": "...",
  "affiliate_link_aufgeloest": "product.com?aff=kanalname",
  "rendite_versprechen_roh": "10% pro Monat",
  "rendite_pa_berechnet": "213.8% p.a. (Zinseszins)",
  "lizenz_bafin": "nicht vorhanden",
  "bafin_warnung": false,
  "mlm_struktur": true,
  "risikokategorie": "🔴",
  "relevante_normen": ["§16 UWG", "§32 KWG", "§263 StGB"],
  "belege": ["B001", "B002"]
}
```
