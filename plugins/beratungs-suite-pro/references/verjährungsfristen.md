# Verjährungsfristen — Systematischer Rechner

Bei JEDER Analyse mit rechtlicher Relevanz MUSS eine Verjährungs-Prüfung erfolgen.

---

## Strafrechtliche Verjährung (§ 78 StGB)

| Strafrahmen | Frist | Beispiel-Delikte |
|-------------|-------|-----------------|
| Bis 1 Jahr (Übertretung) | 3 Jahre | Beleidigung, Hausfriedensbruch |
| Bis 5 Jahre | 5 Jahre | Betrug (§ 263), Untreue (§ 266), Kapitalanlagebetrug (§ 264a) |
| Bis 10 Jahre | 10 Jahre | Schwerer Betrug (§ 263 Abs. 3), Bankrott (§ 283) |
| Mehr als 10 Jahre | 20 Jahre | Raub, schwere Brandstiftung |
| Lebenslänglich | Keine | Mord |

### Beginn der Verjährung
- **Grundsatz**: Mit Beendigung der Tat (§ 78a StGB)
- **Dauerstraftaten**: Erst wenn der rechtswidrige Zustand endet
- **Betrug**: Mit Eintritt des Vermögensschadens beim letzten Geschädigten
- **Steuerhinterziehung**: Mit Bekanntgabe des Steuerbescheids (§ 376 AO: 10 Jahre bei schweren Fällen)

### Ruhen und Unterbrechung
- **Ruhen** (§ 78b): Während Immunitätsschutz, bei Auslandsaufenthalt
- **Unterbrechung** (§ 78c): Durch richterliche Durchsuchung, Anklageerhebung, Eröffnungsbeschluss
- Nach Unterbrechung: Frist beginnt neu, aber absolute Verjährung = doppelte Frist

---

## Zivilrechtliche Verjährung

| Anspruch | Frist | Beginn | Norm |
|----------|-------|--------|------|
| **Regelverjährung** | 3 Jahre | Jahresende der Kenntnis | § 195, 199 BGB |
| **Kenntnisunabhängig** | 10 Jahre | Entstehung des Anspruchs | § 199 Abs. 3 Nr. 1 BGB |
| **Absolute Grenze** | 30 Jahre | Begehung der Verletzung | § 199 Abs. 2 BGB |
| **Schadensersatz (Delikt)** | 3 Jahre / 30 Jahre | Kenntnis / Handlung | §§ 195, 199 BGB |
| **Gewährleistung (Kauf)** | 2 Jahre | Übergabe der Sache | § 438 BGB |
| **Werkvertrag** | 2 Jahre (5 bei Bauwerk) | Abnahme | § 634a BGB |
| **Mietrecht** | 6 Monate | Rückgabe | § 548 BGB |

### Hemmung (§ 203 ff. BGB)
- Verhandlungen über den Anspruch
- Klageerhebung, Mahnbescheid
- Mediation, Schlichtung

---

## Steuerliche Festsetzungsverjährung

| Steuerart | Regelfrist | Bei Steuerhinterziehung | Bei leichtfertiger Verkürzung |
|-----------|-----------|------------------------|------------------------------|
| ESt, KSt, GewSt | 4 Jahre | 10 Jahre | 5 Jahre |
| USt | 4 Jahre | 10 Jahre | 5 Jahre |
| ErbSt, SchenkSt | 4 Jahre | 10 Jahre | 5 Jahre |

Beginn: Ende des Kalenderjahres der Steuerentstehung (§ 170 AO)

### Strafverfolgungsverjährung Steuerstraftaten (§ 376 AO)
- § 370 AO (einfache Hinterziehung): **5 Jahre** (ab 2020: 10 Jahre bei großem Ausmaß)
- § 370 Abs. 3 AO (besonders schwerer Fall, > 50.000 €): **10 Jahre**
- § 378 AO (leichtfertige Verkürzung): **5 Jahre**

---

## Ordnungswidrigkeiten

| OWi | Frist | Beispiel |
|-----|-------|---------|
| Bis 1.000 € Geldbuße | 6 Monate | Kleinere Verstöße |
| Bis 2.500 € | 1 Jahr | UWG-Verstöße |
| Bis 15.000 € | 2 Jahre | DSGVO-Verstöße (einfach) |
| Über 15.000 € | 3 Jahre | Schwere Ordnungswidrigkeiten |

---

## Verjährungs-Tabelle im Report (PFLICHT-Format)

```markdown
### Verjährungs-Übersicht

| Tatbestand | Norm | Tatzeit (geschätzt) | Frist | Deadline | Status |
|-----------|------|--------------------|----- -|----------|--------|
| Betrug | § 263 StGB | [Datum] | 5 Jahre | [Datum] | 🟢 Offen / 🟡 < 1 Jahr / 🔴 Verjährt |
| Schadensersatz | §§ 823, 826 BGB | [Datum] | 3 Jahre (Kenntnis) | [Datum] | |
| Steuerhinterziehung | § 370 AO | [Steuerjahr] | 10 Jahre | [Datum] | |

⏰ **Nächste kritische Frist**: [Datum] — [Was bis dahin passieren muss]
```

---

## Prüf-Regeln für Agenten

1. **JEDER identifizierte Tatbestand** bekommt eine Verjährungs-Zeile
2. **Tatzeit schätzen** — auch wenn nur ungefähr bekannt
3. **Deadline berechnen** — Tatzeit + Frist
4. **Status farbcodieren**: 🟢 > 2 Jahre offen, 🟡 < 1 Jahr, 🔴 verjährt oder < 3 Monate
5. **Nächste kritische Frist** prominent hervorheben
6. **Hemmungsgründe prüfen** — laufen Verhandlungen? Wurde Mahnbescheid zugestellt?
7. **Bei Unsicherheit**: Kürzere Frist annehmen (im Zweifel für den Handlungsdruck)
