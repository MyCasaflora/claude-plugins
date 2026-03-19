# Umsetzungsplan-Referenz — Logik & Entscheidungsregeln

Definiert die Logik für die Erstellung konkreter Umsetzungspläne aus Analyseergebnissen.
Wird von `skills/umsetzungsplan/SKILL.md` und `agents/umsetzungsplaner.md` gelesen.

---

## Findings-Aufnahme

### Akzeptierte Input-Formate

| Format | Behandlung |
|--------|-----------|
| Bisheriger Plugin-Report (Markdown) | Direkt verwenden — alle Felder vorhanden |
| PDF-Gutachten | Per Firecrawl extrahieren, dann strukturieren |
| Freitext des Users | Aktiv nachfragen um Pflichtfelder zu füllen |
| Externe Analyse (Anwalt etc.) | Als "externe Findings" kennzeichnen, Confidence = "extern" |
| Mündliche Beschreibung | Schriftlich zusammenfassen, User bestätigen lassen |

### Pflicht-Mindestinformationen

Ohne diese Felder kann kein valider Plan erstellt werden:

1. **Mindestens 1 identifiziertes Problem/Risiko** (konkret, nicht vage)
2. **Domäne** (Recht / Steuer / Strategie / Kombiniert)
3. **Zuständigkeits-Kontext** (Privatperson / Unternehmen / Projekt)

Ohne Punkt 1: Plan-Erstellung abbrechen.
Ohne Punkte 2-3: Nachfragen, dann fortfahren.

### Veraltungs-Schwellen

| Alter der Findings | Maßnahme |
|-------------------|---------|
| 0-30 Tage | Normal fortfahren |
| 31-60 Tage | Hinweis: "Findings vom [Datum] — prüfe ob noch aktuell" |
| 61-180 Tage | Warnung: "Rechtslage könnte sich geändert haben. Empfehle Aktualisierung." |
| > 180 Tage | Starke Warnung: "Diese Findings sind über 6 Monate alt. Verlässlichkeit eingeschränkt." |

Zusätzlich: Für JEDE zeitkritische Maßnahme prüfen ob Fristen noch offen sind.
Lies `references/verjährungsfristen.md` für alle relevanten Fristen.

---

## Priorisierungs-Algorithmus

### Schritt 1: Zeitkritikalität bestimmen

Für jede identifizierte Maßnahme:

```
WENN Verjährungsfrist < 30 Tage → Priorität: SOFORT (Kritisch)
WENN Verjährungsfrist < 90 Tage → Priorität: SOFORT
WENN Verjährungsfrist < 365 Tage → Priorität: KURZFRISTIG
WENN Beweise könnten verschwinden → Priorität: SOFORT
WENN laufender Schaden eskaliert → Priorität: SOFORT
WENN keine Zeitkritikalität → Priorität: nach Schwere des Problems
```

### Schritt 2: Domänen-Gewichtung

| Domäne | Standard-Priorität |
|--------|-------------------|
| Strafrecht (User als Verdächtiger) | SOFORT — Anwalt VOR allem anderen |
| Strafrecht (User als Geschädigter) | Kurzfristig — Anzeige + Beweissicherung |
| Steuerrecht (Selbstanzeige-Option offen) | SOFORT — Frist beachten |
| Steuerrecht (Compliance) | Mittelfristig |
| Regulatorisches Recht | Kurzfristig |
| Zivilrecht (Schadensersatz) | Kurzfristig-Mittelfristig je nach Verjährung |
| Strategie / Geschäftsmodell | Mittelfristig |

### Schritt 3: Abhängigkeits-Reihenfolge

Bestimmte Schritte haben logische Vorbedingungen:

```
BEWEISSICHERUNG muss VOR ANZEIGE kommen
ANWALT KONSULTIEREN muss VOR EIGENSTÄNDIGEN RECHTLICHEN SCHRITTEN kommen
INSOLVENZCHECK GEGENSEITE muss VOR ZIVILKLAGE kommen
SELBSTANZEIGE-PRÜFUNG muss VOR FINANZAMT-KONTAKT kommen
WIDERRUF muss VOR CHARGEBACK kommen (manche Banken verlangen das)
```

---

## Domänen-spezifische Planlogik

### Recht — Typische Schritte (in Reihenfolge)

1. **Beweissicherung** (Screenshots, Archive.org, Chatverläufe, Zahlungsbelege)
2. **Anwalt beauftragen** (Spezialisierung je nach Fall)
3. **Schadensbegrenzung** (Zahlungen stoppen, Widerruf prüfen, Chargeback)
4. **Aufsichtsbeschwerde** (BaFin, FMA, FINMA — kostenlos, parallel möglich)
5. **Strafanzeige** (bei StA oder Polizei)
6. **Zivilrechtliche Schritte** (Abmahnung → Klage)
7. **Monitoring** (Warnlisten, Handelsregister)

### Steuer — Typische Schritte (in Reihenfolge)

1. **Sofort: Selbstanzeige-Fenster prüfen** (§ 371 AO — ist es noch offen?)
2. **Steuerberater mit Steuerstrafrecht-Erfahrung beauftragen**
3. **Alle relevanten Unterlagen zusammenstellen** (Kontodaten, Verträge, Buchungen)
4. **Steuerliche Nachdeklaration vorbereiten**
5. **Nachzahlung + Zinsen berechnen**
6. **Ratenzahlungsplan mit Finanzamt vereinbaren**
7. **Compliance-System aufbauen** (für Zukunft)

### Strategie / Unternehmen — Typische Schritte (in Reihenfolge)

1. **Sofort: Akute Haftungsrisiken identifizieren und minimieren**
2. **Rechtliche Sofort-Compliance** (Impressum, DSGVO, Kennzeichnungspflichten)
3. **Geschäftsmodell-Legalitätsprüfung** (Anwalt für Vertragsrecht)
4. **Strategische Repositionierung** (Geschäftsmodell, Marktpositionierung)
5. **Compliance-Aufbau** (interne Prozesse, Officer benennen)
6. **Regelmäßige Audits** (Recht + Steuer + Strategie, jährlich)

### Kombiniert (Multi-Domäne) — Sequenz-Logik

Wenn mehrere Domänen betroffen sind, gilt folgende Priorisierung:

```
1. Strafrechtliche Verteidigung (User als Verdächtiger) — IMMER ZUERST
2. Beweissicherung — IMMER PARALLEL ZU ALLEM ANDEREN
3. Akute Schaden-Stopp-Maßnahmen
4. Steuerliche Selbstanzeige (wenn Fenster offen)
5. Regulatorische Beschwerden (BaFin etc.)
6. Zivilrechtliche Schritte
7. Strategische Maßnahmen
```

---

## Konflikts-Szenarien & Auflösungen

### Szenario A: "Sofort handeln" vs. "Erst Anwalt"
**Auflösung**: Beides richtig, beides jetzt.
- Schritt 1: Anwalt kontaktieren (innerhalb 24-48h)
- Schritt 2: Keine eigenständigen rechtlichen Schritte VOR dem Anwalt
- Schritt 3: Beweissicherung sofort (das ist immer sicher, auch ohne Anwalt)

### Szenario B: Steuerliche Selbstanzeige vs. Strafverteidigung
**Auflösung**: Beide Spezialisten GLEICHZEITIG beauftragen.
- Steuerberater mit Steuerstrafrecht für § 371 AO
- Strafverteidiger für strafrechtliche Aspekte
- Beide müssen koordiniert werden — Anwalt übernimmt Koordination

### Szenario C: Verjährung droht aber Beweislage dünn
**Auflösung**: Handeln trotz dünner Beweislage.
- Anzeige/Klage einreichen um Verjährung zu hemmen
- Gleichzeitig weiter Beweise sammeln
- Anwalt entscheidet ob Risiko des Scheiterns vertretbar ist

### Szenario D: Gegner insolvent / Offshore
**Auflösung**: Zivilklage weglassen, Eskalation umlenken.
- Insolvenzbekanntmachungen prüfen
- Forderung im Insolvenzverfahren anmelden (kostenlos)
- Stattdessen: Aufsichtsbeschwerde + Strafanzeige (Staat ermittelt dann)
- Bei Offshore: Nur wenn Vollstreckung in DE möglich → Klage sinnlos

---

## Fortschritts-Tracking System

Jede Maßnahme im Plan erhält eine Status-Zeile:

| Status | Symbol | Bedeutung |
|--------|--------|---------|
| Nicht begonnen | ✗ | Noch nicht angefangen |
| In Bearbeitung | ◷ | Läuft aktuell |
| Abgeschlossen | ✓ | Erfolgskriterium erfüllt |
| Blockiert | ⊘ | Warte auf Voraussetzung |
| Irrelevant geworden | — | Situation hat sich geändert |

User kann jederzeit den Status melden:
"Schritt 2 ist erledigt" → Plan wird aktualisiert, nächste offene Schritte hervorgehoben.

---

## Kosten-Kalkulation

Für JEDE Maßnahme eine Kostenschätzung (auch 0€):

| Maßnahme | Typische Kosten |
|---------|----------------|
| Strafanzeige bei StA/Polizei | 0€ |
| Aufsichtsbeschwerde BaFin/FMA | 0€ |
| Anwaltliche Erstberatung (Kapitalmarktrecht) | 190-250€ (oft kostenlos) |
| Abmahnung (anwaltlich) | 500-3.000€ (nach RVG) |
| Einstweilige Verfügung | 1.000-5.000€ |
| Zivilklage 10.000€ Streitwert | ~3.200€ bei Verlust |
| Steuerberater Erstberatung | 150-300€/h |
| Selbstanzeige mit Steuerberater | 2.000-10.000€ (je Komplexität) |
| Mediation | 150-300€/h |

Wenn Rechtsschutzversicherung vorhanden: Immer prüfen ob abgedeckt.
Wenn Prozesskostenhilfe möglich: Bei geringem Einkommen immer erwähnen.
