# Disclaimer-System

Jede Ausgabe des Plugins enthält IMMER einen Disclaimer. Kein Output ohne Rechtshinweis.

---

## Standard-Disclaimer (Score >= 70)

```
⚖️ **Hinweis**: Diese Information dient ausschließlich der allgemeinen Orientierung
und stellt keine Rechtsberatung, Steuerberatung oder sonstige professionelle
Beratung dar. Für verbindliche Auskünfte wenden Sie sich an einen zugelassenen
Rechtsanwalt bzw. Steuerberater. Stand: [Datum der Abfrage]
```

## Erweiterter Disclaimer (Score 50-69)

```
⚠️ **Wichtiger Hinweis**: Die nachfolgende Darstellung basiert auf einer begrenzten
Quellenlage und kann unvollständig sein. Sie dient ausschließlich der ersten
Orientierung und ersetzt KEINE professionelle Rechts- oder Steuerberatung.
Eine fachliche Prüfung durch einen zugelassenen Berater wird dringend empfohlen.
Stand: [Datum]
```

## Warnungs-Disclaimer (Score 30-49)

```
🔴 **WARNUNG — Niedrige Konfidenz**: Die verfügbaren Quellen reichen für eine
zuverlässige Aussage NICHT aus. Die obige Darstellung kann unvollständig oder
fehlerhaft sein. Eine fachliche Prüfung durch einen zugelassenen Rechtsanwalt
bzw. Steuerberater ist ZWINGEND erforderlich, bevor auf Basis dieser Information
gehandelt wird. Stand: [Datum]
```

## Kritischer Disclaimer (Score < 30)

```
🚨 **KEINE ZUVERLÄSSIGE AUSSAGE MÖGLICH**: Die Recherche hat keine ausreichende
Grundlage für eine belastbare Einschätzung ergeben. Die obige Darstellung dient
AUSSCHLIESSLICH als allererste Orientierung und darf NICHT als Grundlage für
Entscheidungen verwendet werden. Konsultieren Sie UNVERZÜGLICH einen Fachanwalt
bzw. Steuerberater. Stand: [Datum]
```

---

## Bewertungs-Legende (Pflicht in jedem Dokument)

Jedes Dokument, das Bewertungskategorien (A, B, C, D, E) verwendet, MUSS diese Legende enthalten.

```markdown
---

### Bewertungs-Legende

| Stufe | Bedeutung | Kriterien |
|-------|-----------|-----------|
| **A. VOLLSTÄNDIG BELEGT** | Befund durch mehrere unabhängige Primärquellen bestätigt | >= 3 unabhängige Quellen, davon mind. 1 offizielle Behörde/Register; keine Widersprüche |
| **B. GUT BELEGT, ABER MIT EINSCHRÄNKUNGEN** | Befund grundsätzlich belegt, aber mit Lücken in der Beweisführung | 2+ Quellen vorhanden, aber: Identität nicht verifiziert, nur Sekundärquellen, Negativbeweis-Problem, oder Zeitstempel fehlt |
| **C. TEILWEISE BELEGT** | Hinweise vorhanden, aber unzureichend für eine belastbare Aussage | Nur 1 Quelle, oder Quellen widersprechen sich, oder wesentliche Kontextinformationen fehlen |
| **D. UNBELEGT / NUR BEHAUPTUNG** | Aussage basiert ausschließlich auf User-Angaben ohne unabhängige Bestätigung | Keine unabhängige Quelle gefunden; Behauptung konnte weder bestätigt noch widerlegt werden |
| **E. WIDERSPRÜCHLICH** | Quellen widersprechen sich wesentlich | Primärquellen kommen zu unterschiedlichen Ergebnissen; Sachverhalt unklar |

---
```

### Regeln zur Bewertungs-Legende

1. **Pflicht bei tabellarischen Bewertungen** — Sobald Befunde mit A/B/C/D/E kategorisiert werden, MUSS die Legende im Dokument enthalten sein
2. **Position**: Am Ende des Dokuments, vor dem Disclaimer
3. **Jeder Befund einzeln einstufen** — Nicht das Gesamtdokument, sondern jeden einzelnen Befund bewerten
4. **Einschränkungen benennen** — Bei Stufe B und C: konkret angeben, was fehlt oder einschränkt (z.B. "Negativbeweis-Problem", "nur Sekundärquelle zitiert", "Identität nicht verifiziert")
5. **Empfehlung pro Befund** — Bei Stufe B-E: konkrete Empfehlung, wie der Befund gestärkt werden kann (z.B. "FMA-Original nachliefern", "Screenshots mit Metadaten sichern")

---

## Spezial-Disclaimer

### Strafrechtliche Relevanz erkannt

```
⚠️ **Strafrechtlicher Hinweis**: Bei der Analyse wurden mögliche strafrechtlich
relevante Sachverhalte identifiziert. Dies ist KEINE rechtliche Bewertung.
Konsultieren Sie UMGEHEND einen Fachanwalt für Strafrecht.
```

### Steuergestaltung

```
⚠️ **Steuerlicher Hinweis**: Steuergestaltungen erfordern eine individuelle
Prüfung durch einen Steuerberater. Allgemeine Informationen ersetzen keine
auf den Einzelfall bezogene steuerliche Beratung. Anzeigepflicht nach
§ 138d AO bei grenzüberschreitenden Steuergestaltungen beachten.
```

### Internationale Sachverhalte

```
ℹ️ **Internationaler Hinweis**: Bei grenzüberschreitenden Sachverhalten können
mehrere Rechtsordnungen betroffen sein. Die Darstellung bezieht sich auf
[Jurisdiktion]. Für eine vollständige Einschätzung ist die Prüfung aller
betroffenen Rechtsordnungen durch qualifizierte lokale Berater erforderlich.
```

### Domain-/Webseiten-Prüfung

```
ℹ️ **Prüfungshinweis**: Die Analyse basiert auf dem zum Zeitpunkt der Abfrage
([Datum]) verfügbaren Inhalt der Webseite. Änderungen nach diesem Zeitpunkt
sind nicht berücksichtigt. Für eine rechtsverbindliche Prüfung konsultieren
Sie einen auf Medienrecht spezialisierten Rechtsanwalt.
```

---

## Regeln

1. **IMMER einen Disclaimer anhängen** — keine Ausnahme
2. **Disclaimer am ENDE der Antwort** — nicht am Anfang (stört den Lesefluss)
3. **Confidence-Score IMMER anzeigen** — Transparenz über die Qualität
4. **Quellenanzahl IMMER anzeigen** — "Basiert auf N unabhängigen Quellen"
5. **Datum IMMER anzeigen** — Stand der Information
6. **Bei Score < 50: Disclaimer FETT und mit Warnsymbol**
7. **Spezial-Disclaimer kumulativ** — mehrere können gleichzeitig gelten
