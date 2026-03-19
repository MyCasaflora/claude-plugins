# Maßnahmenplan — Konkrete Handlungsempfehlungen

Jeder Report MUSS am Ende einen konkreten, priorisierten Maßnahmenplan enthalten. Keine vagen Empfehlungen — nur konkrete Schritte mit Zuständigkeit, Frist und Hilfsmitteln.

---

## Grundregel

> **"Was genau tun, in welcher Reihenfolge, und was hilft bei der Umsetzung?"**

Jede Empfehlung muss diese 5 Felder haben:

| Feld | Beschreibung |
|------|-------------|
| **Was** | Konkrete Handlung (nicht "prüfen Sie" sondern "Strafanzeige bei StA [Stadt] einreichen") |
| **Warum** | Rechtliche/steuerliche Begründung in einem Satz |
| **Wer** | Zuständig: User selbst, Fachanwalt, Steuerberater, Behörde |
| **Bis wann** | Konkrete Frist (Datum oder "innerhalb X Wochen") |
| **Womit** | Konkrete Hilfsmittel (Vorlage, Behörden-Link, Anwalts-Spezialisierung) |

---

## Maßnahmenplan-Template

```markdown
## Maßnahmenplan

### Sofort (innerhalb 7 Tage)

| # | Was | Warum | Wer | Frist | Womit |
|---|-----|-------|-----|-------|-------|
| 1 | [Konkrete Handlung] | [Begründung] | [Zuständig] | [Datum] | [Hilfsmittel/Link] |

### Kurzfristig (innerhalb 30 Tage)

| # | Was | Warum | Wer | Frist | Womit |
|---|-----|-------|-----|-------|-------|

### Mittelfristig (innerhalb 90 Tage)

| # | Was | Warum | Wer | Frist | Womit |
|---|-----|-------|-----|-------|-------|

### Laufend (regelmäßig)

| # | Was | Intervall | Wer |
|---|-----|-----------|-----|

### Reihenfolge-Logik
[Mermaid-Flowchart der Abhängigkeiten: Was muss VOR was passieren?]
```

---

## Priorisierungsregeln

| Priorität | Kriterium | Beispiele |
|-----------|----------|-----------|
| **🔴 Sofort** | Verjährung < 3 Monate, akute Gefahr, Beweismittel könnten verschwinden | Strafanzeige, einstweilige Verfügung, Screenshots sichern |
| **🟡 Kurzfristig** | Verjährung < 1 Jahr, regulatorischer Verstoß, finanzieller Schaden läuft weiter | Aufsichtsbeschwerde, Abmahnung, Anwalt beauftragen |
| **🟢 Mittelfristig** | Strategische Maßnahmen, langfristige Absicherung | Zivilklage, Vertragsänderung, Compliance-Aufbau |
| **🔵 Laufend** | Monitoring, wiederkehrende Prüfungen | Warnlisten-Check, Handelsregister-Monitoring |

---

## Konkretisierungs-Regeln

### VERBOTEN (zu vage):
- ❌ "Konsultieren Sie einen Anwalt"
- ❌ "Eine rechtliche Prüfung wird empfohlen"
- ❌ "Steuerliche Implikationen sollten beachtet werden"

### RICHTIG (konkret):
- ✅ "Fachanwalt für Kapitalmarktrecht beauftragen — Schwerpunkt: Anlegervertretung gegen unregulierte Broker. Erstberatung ~190-250 € (oft kostenlos bei Rechtsschutzversicherung). Suchhilfe: anwalt.de → Filter: Kapitalmarktrecht + [PLZ]"
- ✅ "Strafanzeige bei StA [zuständige Stadt] einreichen — wegen Verdacht auf Kapitalanlagebetrug (§ 264a StGB). Online möglich über: [Link zur Online-Strafanzeige des Bundeslandes]. Beizufügen: FMA-Warnung, Screenshots der Werbung, Zahlungsbelege"
- ✅ "Aufsichtsbeschwerde bei BaFin einreichen — Online unter bafin.de/beschwerde. Bezug auf: fehlender Verkaufsprospekt gem. § 6 VermAnlG. Bearbeitungsdauer: 4-8 Wochen"

---

## Situationsmildernde Maßnahmen

Am Ende des Maßnahmenplans IMMER prüfen:

### Schadensbegrenzung
- Kann der laufende Schaden gestoppt werden? (Zahlungen einstellen, Verträge widerrufen)
- Gibt es Widerrufsfrist? (14 Tage Fernabsatz, 1 Jahr bei fehlender Belehrung)
- Kann Chargeback über Bank/Kreditkarte initiiert werden?
- Gibt es Rücktrittsrecht (§ 323 BGB)?

### Beweissicherung (bevor etwas verschwindet)
- Screenshots JETZT sichern (Telegram, YouTube, Website)
- Archive.org Snapshot anfertigen
- Korrespondenz (E-Mail, Chat) sichern
- Zahlungsbelege zusammenstellen

### Schutz des Users
- Eigene Daten beim Anbieter löschen lassen (DSGVO Art. 17)
- Passwörter ändern wenn Plattform-Zugang bestand
- Kontoauszüge sichern für Schadensnachweis

### Kollektive Lösungen
- Gibt es andere Betroffene? → Musterfeststellungsklage prüfen
- Verbraucherzentrale einschalten
- Sammelklage über Prozesskostenfinanzierer (z.B. Myright, Financialright)

### Selbstanzeige-Option (§ 371 AO)

Wenn der User SELBST steuerlich betroffen sein könnte:

| Bedingung | Status |
|-----------|--------|
| Noch keine Prüfungsanordnung erhalten | ✅ Selbstanzeige möglich |
| Tatentdeckung noch nicht erfolgt | ✅ Selbstanzeige möglich |
| Hinterzogener Betrag < 25.000 € pro Tat | ✅ Volle Straffreiheit |
| Hinterzogener Betrag > 25.000 € | ⚠️ Zuschlag 10-20% nötig |
| Bereits Prüfungsanordnung erhalten | ❌ Selbstanzeige gesperrt |

→ **Sofort Steuerberater mit Erfahrung in Selbstanzeigen konsultieren**
→ Suche: steuerberater.de → Spezialisierung: Steuerstrafrecht

---

## Domänenspezifische Maßnahmen

### Recht — Typische konkrete Schritte
1. Online-Strafanzeige beim zuständigen LKA / StA
2. Abmahnung über Fachanwalt (mit Unterlassungserklärung)
3. Einstweilige Verfügung bei Landgericht (wenn eilig)
4. Aufsichtsbeschwerde bei BaFin/FMA/FINMA
5. Meldung an Verbraucherzentrale
6. Anmeldung zur Musterfeststellungsklage (wenn vorhanden)

### Steuern — Typische konkrete Schritte
1. Steuerberater mit Steuerstrafrecht-Erfahrung beauftragen
2. Selbstanzeige prüfen (Frist beachten!)
3. Berichtigte Steuererklärung einreichen
4. Nachzahlung + Zinsen berechnen
5. Ratenzahlung mit Finanzamt vereinbaren
6. Compliance-System aufbauen

### Strategie — Typische konkrete Schritte
1. Geschäftsmodell auf Legalität prüfen lassen
2. Verträge anpassen (AGB, Partnerverträge)
3. Compliance-Officer benennen (ab gewisser Größe)
4. Impressum und Datenschutz korrigieren
5. Kennzeichnungspflichten umsetzen (Affiliate, Werbung)
6. Regelmäßige Rechts-Audits einführen
