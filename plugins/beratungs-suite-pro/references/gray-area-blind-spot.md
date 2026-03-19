# Gray Area & Blind Spot Assessment

Ergänzt `agents/devils-advocate.md` mit konkreten Prüfkatalogen.
Wird IMMER in Phase 6 (Validierung) der Kernlogik ausgeführt.

---

## Blind Spot Assessment (BSA)

### BSA-01 — Prospektpflicht
```
FRAGE: Wird Kapital von mehr als 20 Personen eingeworben?
       Liegt der Gesamtbetrag über 100.000 € (VermAnlG) oder 8 Mio. € (WpPG)?
WENN JA → Prospektpflicht → Nachweis billigendes BaFin-Prospekt erforderlich
NORM: §6 VermAnlG, §3 WpPG
```

### BSA-02 — Berufshaftpflicht
```
FRAGE: Besteht für erlaubnispflichtige Tätigkeit Versicherungspflicht?
       §34d, §34f, §34i GewO → Ja
NACHWEIS: Im Impressum oder auf Anfrage
FEHLT ES? → Compliance-Verstoß, Hinweis auf fehlende Zulassung
```

### BSA-03 — Widerrufsrecht (Fernabsatz)
```
FRAGE: Werden Verträge per Internet, Telefon, E-Mail geschlossen? (= Fernabsatz)
PFLICHT: 14-tägiges Widerrufsrecht + Widerrufsbelehrung (§312g BGB)
FEHLT ES? → Verlängerte Widerrufsfrist: 12 Monate + 14 Tage!
```

### BSA-04 — DSGVO als Proxy-Indikator
```
Vollständige DSGVO-Erklärung mit korrektem Verantwortlichen → Seriosität indiziert
Fehlende/kopierte DSGVO → Compliance-Muster mangelhaft → Erhöhte Prüfpflicht
```

### BSA-05 — GwG-Pflichten
```
FRAGE: Verpflichteter nach §2 GwG?
       (Finanzdienstleister, Glücksspiel, Immobilien, Güterhändler >10.000€ Bar)
WENN JA → KYC-Pflicht §10 GwG, Verdachtsmeldepflicht §43 GwG
FEHLEND → GwG-Verstoß + §261 StGB-Relevanz
```

### BSA-06 — Affiliate-Transparenz
```
Nachgewiesener Affiliate-Link ohne §5a UWG-Kennzeichnung = sofort abmahnbar
Maßstab: Kennzeichnung muss VOR dem ersten Klick sichtbar sein
```

---

## Gray Area Assessment (GAA)

### GAA-01 — Finanzbildung vs. Anlageberatung
```
LEGAL:    Allgemeine Erläuterung von Finanzkonzepten ohne Produktbezug
ILLEGAL:  Produktbezogene Empfehlung mit Renditehoffnung an konkrete Gruppe
PRÜFFRAGEN:
  1. Ist es produktspezifisch? → Beratung → §34f GewO-Pflicht
  2. Steckt eine Provision dahinter? → Interessenkonflikt → §5a UWG
  3. Allgemeine Einschätzung ohne Produktlink? → Meinungsfreiheit
```

### GAA-02 — Lifestyle-Content vs. getarnter Vertrieb
```
PRÜFFRAGE:
  "Würde dieser Content ohne die Produktlinks überhaupt existieren?"
  WENN NEIN → getarnter Vertrieb → §5a UWG (fehlende Kennzeichnung)
```

### GAA-03 — Affiliate-Marketing Legal / Illegal
```
LEGAL:   Klare §5a UWG-Kennzeichnung ("Werbung"/"Anzeige") + legales Produkt
ILLEGAL: Keine Kennzeichnung → sofort abmahnbar (§5a UWG)
         Beworbenes Produkt selbst illegal → §823 Abs.2 BGB Beihilfe
         Link-Verschleierung → §5 UWG aktive Irreführung
```

### GAA-04 — Angst-Marketing & politische Rhetorik
```
LEGAL:   "Die EU kontrolliert Ihr Geld" → politische Meinungsäußerung
ILLEGAL: "Die EU kontrolliert Ihr Geld — kaufen Sie jetzt unser Produkt" → §3 UWG
NACHWEIS: Systematische Kombination Angstnarrativ + Produktkauf = §826 BGB Relevanz
```

### GAA-05 — Verschleierung als Straftatbestand
```
GRAUZONE:  Bit.ly allein = kein Straftatbestand
KRITISCH:  Mehrere Verschleierungsebenen (Shortener + Telegram + Offshore)
           erhöhen Vorsatz-Score erheblich
           Shortener + illegales Zielprodukt = Beihilfe
```

### GAA-06 — HWG-Grauzone (Gesundheitsprodukte)
```
PRÜFKRITERIUM (§1 HWG):
  → Wird eine Krankheit, Leiden oder Körperschaden erwähnt?
  → Werden therapeutische Wirkungen behauptet (auch implizit durch Testimonials)?
  WENN JA → HWG anwendbar → §§3, 11 HWG prüfen
  Beispiel: "verbessert Wohlbefinden" → mögl. Lifestyle
            "heilt Schlafstörungen" → §3 HWG-Verstoß (klar)
```

### GAA-07 — Steueroptimierung vs. Steuerhinterziehung
```
LEGAL:    Allgemeine Hinweise auf legale Optimierung (Dubai, Zypern Non-Dom)
ILLEGAL:  Steuerberatung ohne §5 StBerG-Zulassung
          Konkrete Tipps für individuelle Situation → §5 StBerG
          Aufruf zur Hinterziehung → §370 AO
```

### GAA-08 — KYC-Umgehung: Datenschutz vs. GwG
```
LEGAL:   Datensparsamkeit, DSGVO-Konformität, Hardware-Wallets
ILLEGAL: "Ohne Namen", "kein KYC erforderlich", "nicht nachverfolgbar"
         bei Zahlungsprodukten → GwG §§10/11, ZAG §10, §261 StGB
SCHWELLE: Transaktionsvolumen + explizite Anonymitätsbewerbung
```

---

## Ausgabe-Pflicht im Report

```markdown
### Blind Spots
| BSA | Befund | Norm | Status |
|-----|--------|------|--------|
| BSA-01 Prospektpflicht | [Befund] | §6 VermAnlG | 🔴/🟡/🟢 |
| ... | | | |

### Gray Areas
| GAA | Grauzone | Prüfergebnis | Tendenz |
|-----|----------|--------------|---------|
| GAA-01 Finanzbildung | [Befund] | [Begründung] | Eher illegal / Grauzone / Eher legal |
| ... | | | |
```
