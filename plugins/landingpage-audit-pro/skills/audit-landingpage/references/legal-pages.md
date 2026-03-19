# Legal Pages Audit — Pflichtseiten & Pflichtangaben

## Spracherkennung

Die Sprache wird anhand des `<html lang="">` Attributs oder des Seiteninhalts erkannt.
- DE-Seiten (lang="de"): Deutsches Recht (TMG, DSGVO, UWG)
- EN-Seiten (lang="en"): Allgemeine Best Practices (Privacy, Terms)
- Andere: Nur allgemeine Checks

---

## Deutsche Seiten (DE/AT/CH)

### Pflichtseiten

| Seite | Pflicht | Suchbegriffe im Footer/Nav | Gesetzesgrundlage |
|-------|---------|---------------------------|-------------------|
| Impressum | JA (§5 TMG) | "impressum", "imprint" | §5 TMG / §5 DDG |
| Datenschutzerklärung | JA (Art. 13 DSGVO) | "datenschutz", "privacy", "datenschutzerklärung" | DSGVO Art. 13/14 |
| AGB | NEIN (aber empfohlen bei Shops) | "agb", "allgemeine geschäftsbedingungen", "terms" | — |
| Widerrufsbelehrung | JA (bei Fernabsatz, §312g BGB) | "widerruf", "widerrufsbelehrung" | §312g BGB |
| Cookie-Banner | JA (TTDSG §25) | Cookie-Consent-Element im DOM | TTDSG §25 |

### Impressum Pflichtangaben (§5 TMG)

Prüfe ob folgende Informationen im Impressum vorhanden sind:

- Name / Firma
- Anschrift (Straße, PLZ, Ort) — kein Postfach!
- Kontakt (E-Mail + Telefon ODER Kontaktformular)
- Vertretungsberechtigte Person(en) bei juristischen Personen
- Registergericht + Registernummer (bei eingetragenen Unternehmen)
- Umsatzsteuer-ID (§27a UStG) — wenn vorhanden
- Berufsrechtliche Angaben (bei regulierten Berufen)
- Verantwortlich für Inhalt nach §18 MStV (bei redaktionellen Inhalten)

### Cookie-Banner Checks

- Banner erscheint beim ersten Besuch
- Ablehnen-Button gleichwertig sichtbar wie Akzeptieren
- Keine vorausgewählten Checkboxen (außer "Notwendige")
- Link zur Datenschutzerklärung im Banner

---

## Englische Seiten (EN)

### Empfohlene Seiten

| Seite | Empfehlung | Suchbegriffe |
|-------|-----------|-------------|
| Privacy Policy | Stark empfohlen | "privacy", "privacy policy" |
| Terms of Service | Stark empfohlen | "terms", "terms of service", "tos" |
| Cookie Policy | Empfohlen (GDPR bei EU-Traffic) | "cookie", "cookie policy" |
| Disclaimer | Optional | "disclaimer" |

---

## Bewertung

- **PASS**: Alle Pflichtseiten vorhanden + Impressum vollständig
- **WARN**: Pflichtseiten vorhanden aber Impressum unvollständig
- **FAIL**: Pflichtseite fehlt (kein Impressum, keine Datenschutzerklärung)
- **INFO**: Optionale Seiten nicht vorhanden (AGB bei Nicht-Shop, Disclaimer)
