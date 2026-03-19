# Erweiterte Prüffelder

Zusätzliche Prüfpunkte pro Domäne, die bei relevanten Sachverhalten IMMER berücksichtigt werden müssen.

---

## Domänenübergreifend

### DSGVO-Grenzen bei OSINT-Ermittlung

Die proaktive Ermittlung (OSINT) muss sich an rechtliche Grenzen halten:
- **Nur öffentlich zugängliche Daten** verwenden (keine Hacks, kein Social Engineering)
- **Berechtigtes Interesse** (Art. 6 Abs. 1 lit. f DSGVO) als Rechtsgrundlage
- **Keine systematische Überwachung** von Privatpersonen ohne konkreten Verdacht
- **Verhältnismäßigkeit**: Eingriff in Persönlichkeitsrecht vs. Aufklärungsinteresse
- **Recht am eigenen Bild** (§ 22 KUG): Screenshots von Personen nur bei öffentlichem Interesse
- Im Zweifel: Nur Fakten dokumentieren, keine Profilbildung

### Wann ist ein Geschäftsmodell ein Schneeballsystem?

Keine eindeutige gesetzliche Definition in DE. Orientierung:

| Merkmal | Legales MLM | Schneeballsystem |
|---------|------------|-----------------|
| Produkt/Dienstleistung | Echtes Produkt mit Marktwert | Kein/wertloses Produkt |
| Einkommen | Primär aus Produktverkauf | Primär aus Anwerbung |
| Einstiegskosten | Gering/keine | Hohe Einstiegsgebühr |
| Wer profitiert | Alle Ebenen gleichermaßen | Nur obere Ebenen |
| Nachhaltigkeit | Funktioniert auch ohne Neuanwerbung | Kollabiert ohne Neuanwerbung |

**Rechtliche Einordnung:**
- § 16 Abs. 2 UWG: Progressive Kundenwerbung (Schneeballsystem) ist strafbar
- § 263 StGB: Betrug wenn Teilnehmer getäuscht werden
- BaFin: Kann als Einlagengeschäft (§ 1 KWG) gewertet werden

### Gerichtsverwertbarkeit von OSINT-Funden

| Sicherungsmethode | Beweiswert | Empfehlung |
|-------------------|-----------|------------|
| Screenshot (lokal) | Gering — kann manipuliert sein | Zusätzlich notarielle Beurkundung |
| Firecrawl Volltext + Zeitstempel | Mittel — technisch nachvollziehbar | Standard für Dokumentation |
| Archive.org Wayback Machine | Hoch — unabhängiger Dritter | IMMER zusätzlich anfertigen |
| Notarielle Beurkundung (Internet-Notar) | Sehr hoch | Bei hohem Streitwert empfehlen |
| eIDAS-konformer Zeitstempel | Hoch — EU-anerkannt | Wenn verfügbar |

### Aktualisierungs-Hinweis

Jede Analyse enthält am Ende:
```
⏳ **Gültigkeits-Hinweis**: Diese Analyse basiert auf dem Stand [Datum].
Gesetze, Warnungen und Sachverhalte können sich ändern. Eine Aktualisierung
wird empfohlen nach: 3 Monaten (bei laufenden Verfahren) / 6 Monaten (Standard) /
sofort bei Bekanntwerden neuer Informationen.
```

### Grenze zur Rechtsberatung (§ 3 RDG)

Das Plugin darf NICHT:
- Konkrete Empfehlung geben, OB geklagt werden soll (nur: "welche Optionen bestehen")
- Erfolgsaussichten beziffern ("Sie werden gewinnen")
- Als Rechtsberater auftreten
- Schriftsätze oder Verträge entwerfen

Das Plugin DARF:
- Rechtslage darstellen
- Optionen aufzeigen mit Vor-/Nachteilen
- An Fachanwalt verweisen
- Vorbereitung für Anwaltsgespräch liefern

---

## Recht — Erweiterte Prüffelder

### Musterfeststellungsklage / Sammelklage prüfen

Bei Fällen mit potenziell vielen Geschädigten IMMER prüfen:
1. **Klageregister** des Bundesamts für Justiz: musterfeststellungsklagen.de
2. **Verbraucherzentralen**: Laufende Verfahren zu ähnlichen Sachverhalten
3. **Prozesskostenfinanzierer**: Myright, Financialright, Legalbird — übernehmen Kosten bei Erfolgsaussicht
4. Dem User mitteilen: "Kosten: Keine (nur Anmeldung). Risiko: Kein eigenes Kostenrisiko."

### UK Ltd nach Brexit — Anerkennungsproblematik

Seit 01.01.2021 keine automatische Anerkennung in DE mehr:
- UK Ltd mit Verwaltungssitz in DE wird als **OHG oder GbR** behandelt
- Persönliche Haftung der Gesellschafter möglich (Haftungsdurchgriff)
- BGH-Rechtsprechung noch in Entwicklung
- **Red Flag**: UK Ltd mit DE-Geschäftstätigkeit = Prüfungsbedürftig

### Affiliate-Kennzeichnungspflicht — Grauzone

§ 5a UWG Auslegung bei Kongress-Veranstaltern:
- **Klar kennzeichnungspflichtig**: Direkte Affiliate-Links mit Provision
- **Grauzone**: Kongress empfiehlt Produkt, Veranstalter erhält "Sponsoring"
- **Umstritten**: "Erfahrungsberichte" die faktisch Werbung sind
- Gerichte urteilen unterschiedlich — im Zweifel: Kennzeichnungspflicht annehmen

---

## Steuer — Erweiterte Prüffelder

### Sozialversicherung / Scheinselbstständigkeit (§ 7 SGB IV)

Bei JEDER Prüfung von Geschäftsmodellen mit "Beratern", "Partnern", "Coaches":

| Merkmal | Selbstständig | Scheinselbstständig |
|---------|-------------|-------------------|
| Weisungsgebundenheit | Nein | Ja (Schulungen, Vorgaben) |
| Eigene Kunden | Ja, eigener Kundenstamm | Nein, nur Kunden des Auftraggebers |
| Unternehmerisches Risiko | Ja | Nein |
| Eingliederung | Nein | Ja (feste Termine, CI, Tools) |
| Ein Auftraggeber | Mehrere | Nur einer (> 5/6 Umsatz) |

**Konsequenzen bei Scheinselbstständigkeit:**
- Nachzahlung Sozialversicherungsbeiträge (bis 4 Jahre rückwirkend, 30 Jahre bei Vorsatz)
- Säumniszuschläge 1% pro Monat
- Strafrechtlich: § 266a StGB Vorenthalten von Arbeitsentgelt (bis 5 Jahre Freiheitsstrafe)
- Statusfeststellungsverfahren bei Deutsche Rentenversicherung Bund

### Krypto/DeFi/NFT steuerlich

| Vorgang | Steuerliche Behandlung DE | Norm |
|---------|--------------------------|------|
| Kauf und Halten | Keine Steuer | — |
| Verkauf < 1 Jahr Haltedauer | Privates Veräußerungsgeschäft | § 23 EStG |
| Verkauf > 1 Jahr | Steuerfrei | § 23 Abs. 1 Nr. 2 EStG |
| Staking/Lending Rewards | Sonstige Einkünfte | § 22 Nr. 3 EStG |
| Mining (gewerblich) | Gewerbeeinkünfte | § 15 EStG |
| NFT-Verkauf | Wie Krypto (< 1 Jahr steuerpflichtig) | § 23 EStG |
| Airdrop | Sonstige Einkünfte zum Zeitpunkt des Zuflusses | § 22 Nr. 3 EStG |

**Achtung**: MiCAR (ab 30.12.2024) ändert regulatorische Anforderungen für Krypto-Dienstleister.
Steuerliche Behandlung in AT/CH weicht ab!

### Verrechnungspreise (bei internationalen Strukturen)

Bei JEDER internationalen Firmenstruktur prüfen:
- Sind konzerninterne Leistungen marktüblich bepreist? (Arm's Length Principle)
- Verrechnungspreisdokumentation Pflicht ab 5 Mio. € Umsatz mit verbundenen Unternehmen
- § 90 Abs. 3 AO: Dokumentationspflicht
- OECD Transfer Pricing Guidelines als Maßstab
- **Red Flag**: Zahlungen an Offshore-Gesellschaften ohne erkennbare Gegenleistung

---

## Strategie — Erweiterte Prüffelder

### ESG / Nachhaltigkeits-Check

Bei Unternehmensberatung und Due Diligence:
- **CSRD** (Corporate Sustainability Reporting Directive): Ab 2025 für große Unternehmen, ab 2026 für mittelgroße
- **EU-Taxonomie**: Ist das Geschäftsmodell als "nachhaltig" klassifizierbar?
- **Greenwashing-Risiko**: Behauptungen vs. Realität prüfen (§ 5 UWG)
- **ESG-Rating**: Wenn verfügbar, externen Score prüfen

### IP / Patente / Marken

Bei Due Diligence IMMER prüfen:
- **DPMA** (DE): dpma.de → Markenrecherche
- **EUIPO** (EU): euipo.europa.eu → EU-Markenrecherche
- **WIPO** (International): wipo.int → Internationale Registrierungen
- Patente: espacenet.com (EPO), USPTO (USA)
- Sind Markennamen geschützt? Laufen Patente aus?
- **Red Flag**: Firma nutzt geschützten Markennamen ohne Lizenz

### Mitarbeiter / Talent / Arbeitgeberreputation

- **Kununu**: kununu.com → Arbeitgeberbewertungen (DACH)
- **Glassdoor**: glassdoor.com → International
- **LinkedIn**: Mitarbeiterzahl, Fluktuation (wie viele "ehemalig"?)
- **Stellenanzeigen**: Viele offene Stellen = Wachstum ODER hohe Fluktuation?
- **Red Flag**: Nur 5-Sterne-Bewertungen, alle im gleichen Monat

### Supply-Chain / Lieferketten-Sorgfalt (LkSG)

Ab 1.000 Mitarbeiter: Lieferkettensorgfaltspflichtengesetz
- Menschenrechtliche Risiken in der Lieferkette
- Umweltbezogene Risiken
- Beschwerdeverfahren eingerichtet?
- Risikoanalyse dokumentiert?
- **Bußgeld**: Bis 2% des Jahresumsatzes

### Kundenfokus-Risiken

- **Kundenkonzentration**: > 30% Umsatz mit einem Kunden = Klumpenrisiko
- **Vertragsabhängigkeit**: Langfristverträge? Kündigungsfristen?
- **Regulatorische Risiken**: Branchenspezifische Regulierung im Wandel?

---

## Komplexitäts-Erkennung — Erweiterte Trigger

Zusätzlich zu den bestehenden Triggern in `ermittlungs-framework.md`:

| Signal | Warum komplex | Domäne |
|--------|--------------|--------|
| "Schneeballsystem", "Pyramide", "MLM" | Strafrechtlich + regulatorisch + zivilrechtlich | Alle |
| "Krypto", "Token", "NFT", "DeFi" | Regulatorisch + steuerlich komplex | Steuer |
| "Scheinselbstständigkeit", "Freelancer" | SV-Nachforderung + Strafrecht | Steuer |
| "Patent", "Marke", "IP", "Lizenz" | Bewertung + Schutzrechte | Strategie |
| "ESG", "Nachhaltigkeit", "Greenwashing" | Regulatorisch + Reputationsrisiko | Strategie |
| "Lieferkette", "LkSG", "Sorgfaltspflicht" | Regulatorisch + Bußgeld | Strategie |
| "Whistleblower", "Meldestelle", "HinSchG" | Schutzansprüche + Verfahren | Recht |
