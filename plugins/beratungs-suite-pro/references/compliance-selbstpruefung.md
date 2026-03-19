# Compliance-Selbstprüfung — Website, AGB, Affiliate, Unternehmensstruktur

Wird ausschließlich in Perspektive 2 (SELBSTPRÜFUNG) verwendet.
Definiert was konkret geprüft und korrigiert werden muss.

---

## Modul C1: Website & Impressum — Vollständige Prüfliste

### Impressum (§5 DDG, ehemals TMG)

Für JEDE öffentlich zugängliche Website mit gewerblichem Charakter:

```
PFLICHT-PRÜFUNG:
  ABRUFEN: web_fetch("{domain}/impressum") UND web_fetch("{domain}/imprint")
            UND web_fetch("{domain}/legal") UND web_fetch("{domain}/kontakt")

  CHECKLISTE (jedes Feld mit JA/NEIN/UNVOLLSTÄNDIG):
  [ ] Vollständiger Name der natürlichen oder juristischen Person
  [ ] Ladungsfähige Anschrift (kein Postfach!)
  [ ] Kontaktmöglichkeit (E-Mail + entweder Telefon ODER weiteres)
  [ ] Verantwortliche Person nach §18 MStV (bei journalistischen Inhalten)
  [ ] Handelsregisternummer + Registergericht (falls eingetragen)
  [ ] USt-IdNr. oder Steuernummer (wenn USt-pflichtig)
  [ ] Erlaubnisangabe wenn erlaubnispflichtige Tätigkeit vorliegt:
      - §34f GewO → Vermittlerregisternummer
      - §34d GewO → Vermittlerregisternummer
      - §32 KWG → BaFin-Institutsnummer
  [ ] Verbraucherstreitbeilegung-Hinweis (§36 VSBG)
  [ ] Berufshaftpflicht (wenn Pflichtmitglied einer Kammer)
```

Jedes fehlende Pflichtfeld = konkreter Korrekturschritt im Plan.

### Datenschutzerklärung (DSGVO)

```
PRÜFEN:
  ABRUFEN: web_fetch("{domain}/datenschutz") UND web_fetch("{domain}/privacy")

  CHECKLISTE:
  [ ] Verantwortlicher nach Art. 4 Nr. 7 DSGVO benannt?
  [ ] Rechtsgrundlagen für jede Datenverarbeitung genannt (Art. 6)?
  [ ] Alle genutzten Tracking-Tools aufgelistet?
      (Google Analytics, Facebook Pixel, Hotjar, etc.)
  [ ] Cookie-Einwilligung DSGVO-konform? (kein Pre-checked, kein Dark Pattern)
  [ ] Drittland-Transfer transparent (USA-Server)?
  [ ] Betroffenenrechte vollständig aufgeführt (Art. 13/14 DSGVO)?
  [ ] Datenschutzbeauftragten-Angabe wenn nötig (>20 MA)?
```

### AGB / Vertragsbedingungen

```
PRÜFEN:
  ABRUFEN: web_fetch("{domain}/agb") UND web_fetch("{domain}/terms")

  KRITISCH-PRÜFEN:
  [ ] Verschwiegenheitsklauseln die Rechtsberatung einschränken → §307 BGB (unwirksam)
  [ ] Ausschluss gesetzlicher Mängelrechte → §309 Nr.8 BGB (unwirksam)
  [ ] Gerichtsstandklausel zum Nachteil des Verbrauchers → §305c, §307 BGB
  [ ] Widerrufsrecht korrekt (14 Tage, §312g BGB)?
      Bei fehlender Belehrung: 12 Monate + 14 Tage Widerrufsfrist!
  [ ] Haftungsausschlüsse für Finanz- oder Gesundheitsaussagen —
      können faktisch unwirksam sein wenn Hauptleistung diese umfasst
  [ ] Preisangaben klar und vollständig (PAngV)?

  FORMULIERUNGS-FEHLER DIE SOFORT KORRIGIERT WERDEN MÜSSEN:
  - "Kein Finanzprodukt" wenn tatsächlich Einlagen entgegengenommen werden
  - "Keine Anlageberatung" wenn konkrete Produktempfehlungen mit Provisionen gemacht werden
  - "Ohne Gewähr" bei Renditeversprechen (schützt nicht vor §5 UWG)
```

---

## Modul C2: Affiliate-Links & Werbung — Vollständige Prüfliste

```
FÜR JEDE SEITE DES AUFTRETENDEN (Website, YouTube, Instagram, Telegram):

AFFILIATE-PARAMETER SUCHEN:
  javascript_eval oder web_fetch:
  Alle Links mit: ?aff=, ?ref=, ?affid=, ?partner=, ?via=
  Alle Shortlinks: shortbee.io, bit.ly, tinyurl, ow.ly etc.
  Alle Tracking-Links: go.*, lnk.*, track.*

KENNZEICHNUNGS-PRÜFUNG PRO KANAL:
  Website:   "Werbung" oder "Anzeige" MUSS vor dem Link erscheinen
  YouTube:   "Dieser Link ist ein Affiliate-Link" in Beschreibung MUSS vor dem Link stehen
  Instagram: "#Werbung" oder "#Ad" MUSS im Post (nicht im Kommentar) erscheinen
  Telegram:  Kennzeichnung im Post selbst, nicht am Ende einer langen Nachricht
  TikTok:    Branded Content Toggle ODER "Werbung" im Text

NORM BEI FEHLENDER KENNZEICHNUNG:
  §5a UWG — sofort abmahnbar durch Wettbewerber oder Verbände
  Kein Vorsatz nötig — fahrlässige Nichtkenntnis reicht

FÜR JEDEN AFFILIATE-LINK PRÜFEN:
  1. Ist das beworbene Produkt selbst legal und lizenziert?
     → Produkt-Tiefenanalyse (lies references/produkt-tiefenanalyse.md)
  2. Falls das Produkt eine BaFin/FMA-Warnung hat:
     → Weiterbewerbung nach Kenntnis = §826 BGB, §263 StGB Beihilfe
     → SOFORT deaktivieren (nicht nur "pausieren")
  3. Falls das Produkt regulierungspflichtig ist ohne Lizenz:
     → Bewerbung = Beihilfe zum unerlaubten Betreiben (§54 KWG)
     → SOFORT deaktivieren + eigene Haftungsexposition dokumentieren

KORREKTUR-CHECKLISTE:
  [ ] Alle Affiliate-Links inventarisiert
  [ ] Alle beworbenen Produkte auf Lizenzstatus geprüft
  [ ] Fragwürdige Produkte deaktiviert (Datum dokumentieren!)
  [ ] Verbleibende Links mit §5a UWG-konformer Kennzeichnung versehen
  [ ] Screenshot-Dokumentation des Vorher/Nachher-Zustands
```

---

## Modul C3: Unternehmensstruktur-Check

```
PRÜFPUNKTE:

1. RECHTSFORM vs. TÄTIGKEIT
   Welche Rechtsform liegt vor?
   Ist sie für die tatsächliche Tätigkeit geeignet?

   PROBLEMATISCHE KOMBINATIONEN:
   - UG (haftungsbeschränkt) mit Tätigkeit die §32 KWG-Zulassung braucht
     → Zulassung setzt Mindestkapital voraus (730.000 € für Broker)
   - UK Ltd mit Verwaltungssitz in DE (post-Brexit):
     → Wird als OHG/GbR behandelt → persönliche Haftung der Gesellschafter!
   - GbR oder Einzelunternehmen bei erlaubnispflichtigen Tätigkeiten:
     → Persönliche Haftung unbegrenzt
   - Offshore-Konstrukt (Dubai, St. Vincent) mit aktivem DE-Marketing:
     → Marktortprinzip: DE-Regulierung gilt trotzdem

2. STAMMKAPITAL vs. GESCHÄFTSVOLUMEN
   Ist das Stammkapital für die beworbenen Geschäftsvolumina plausibel?
   25.000 € GmbH-Stammkapital + Bewerbung von Millionen-Investments = Red Flag
   für Behörden (Unterkapitalisierung, Haftungsdurchgriff)

3. UNTERNEHMENSGEGENSTAND vs. TATSÄCHLICHE TÄTIGKEIT
   Stimmt der eingetragene Unternehmensgegenstand mit dem tatsächlichen Geschäft?
   Abweichung = Registereintrag korrigieren (Notartermin nötig bei GmbH)

4. EMPFEHLENSWERTERE STRUKTUREN (nur wenn vom Anwalt bestätigt):
   - Lizenzierter Haftungsdach-Vertrag (§2 Abs.10 KWG) als Zwischenlösung
   - Compliance-konformes Affiliate-Modell statt direkter Finanzberatung
   - Klare Trennung Betriebsgesellschaft / Holdingstruktur für Haftungsschutz
   → Alle Strukturänderungen NUR nach Rücksprache mit Fachanwalt umsetzen

5. MELDEPFLICHTEN PRÜFEN (die vielleicht versäumt wurden):
   - Gewerbeamt-Anmeldung (§14 GewO) — bei nachträglicher Tätigkeit
   - IHK-Pflichtmitgliedschaft (§2 IHKG) — automatisch bei Gewerbebetrieb
   - DAC6 (internationale Steuergestaltungen meldepflichtig?)
   - GwG §2 — Bist du selbst Verpflichteter? (dann eigene KYC-Pflichten!)
```

---

## Modul C4: Entlastungsdokumentation

Für den Fall dass Behörden oder Gerichte später fragen werden.

```
SOFORT DOKUMENTIEREN (bevor Korrekturen gemacht werden):

1. "Was ich nicht wusste": Schriftlich fixieren was zum Zeitpunkt X
   unbekannt war — mit Datum und Unterschrift. Nicht rückdatieren.

2. "Was ich nicht entschieden habe": Wenn mehrere Personen beteiligt
   sind — wer hat was entschieden? Interne E-Mails, Protokolle sichern.

3. "Wann ich es erfahren habe": Datum des Kenntniserwerbs (z.B. BaFin-Warnung,
   erster Nutzerschadenbericht) genau dokumentieren — BEVOR Korrekturen folgen.

4. "Was ich danach getan habe": Jede Korrekturmaßnahme mit Datum und
   Nachweis (Screenshot Vorher/Nachher, E-Mail-Bestätigung).

FORM: PDF mit elektronischem Zeitstempel oder notarielle Beurkundung
      bei hohem Streitwert-Risiko.
```
