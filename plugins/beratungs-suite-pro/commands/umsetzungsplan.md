---
name: umsetzungsplan
description: Erstelle einen konkreten, priorisierten Umsetzungsplan aus vorhandenen Analyseergebnissen
---

# /umsetzungsplan

Verwandelt Analyseergebnisse (Recht, Steuer, Strategie, Ermittlung) in einen konkreten,
Schritt-für-Schritt-Aktionsplan mit Verantwortlichkeit, Frist und Erfolgskriterium.

## Einsprungpunkte

### Modus A: Nach einer Analyse (automatisch)
Der Command wird am Ende jeder Analyse als nächster logischer Schritt angeboten.
Die Findings aus Phase 1-8 werden automatisch als Input verwendet.

---

## Schritt 1: Findings-Aufnahme & Validierung

Lies `references/umsetzungsplan.md` Abschnitt "Findings-Aufnahme" für die vollständige Logik.

### Was entgegennehmen:
- Analyseberichte (Markdown, PDF, Klartext)
- Rechtsgutachten oder Steuerliche Stellungnahmen
- Ermittlungsergebnisse (Bewertungen A-E, Befunde-Tabellen)
- Formlose Beschreibungen ("ich habe folgende Probleme gefunden...")

### Vollständigkeitsprüfung (PFLICHT vor Planerstellung):

| Feld | Vorhanden? | Aktion bei Fehlen |
|------|-----------|-------------------|
| Identifizierte Probleme/Risiken | [ ] | STOP — ohne dies kein Plan möglich |
| Domäne (Recht/Steuer/Strategie) | [ ] | Nachfragen |
| Schweregrad / Bewertung (A-E oder Beschreibung) | [ ] | Schätzen + mit User bestätigen |
| Zeitrahmen (wann entstand das Problem?) | [ ] | Nachfragen für Verjährungs-Check |
| Zuständigkeits-Kontext (Unternehmen/Privat/Projekt) | [ ] | Nachfragen |
| Bereits ergriffene Maßnahmen | [ ] | Explizit fragen: "Was haben Sie bereits unternommen?" |

Wenn "Identifizierte Probleme" fehlen: Sofort abbrechen und User auffordern,
Findings bereitzustellen oder zuerst eine Analyse durchzuführen (`/ermittlung`, `/recht-analyse`, etc.).

### Veraltungs-Check:
Wenn Findings älter als 60 Tage: Warnung ausgeben.
Wenn älter als 180 Tage: Starke Warnung + Empfehlung zur Aktualisierung der Analyse.
Für jeden zeitkritischen Schritt: Prüfe ob Fristen (Verjährung, Widerruf) noch offen sind.

---

## Schritt 2: Komplexitäts-Erkennung

### EINFACH → Subagent-Modus (umsetzungsplaner Agent):
- Findings aus EINER Domäne
- Maximal 3-5 identifizierte Probleme
- Klare Zuständigkeit (ein Akteur)

→ Aktiviere `agents/umsetzungsplaner.md` direkt.

### KOMPLEX → Agent-Team-Modus:
- Findings aus MEHREREN Domänen mit konfligierenden Empfehlungen
- Mehr als 5 identifizierte Probleme
- Strafrecht + steuerliche Selbstanzeige gleichzeitig

Bei KOMPLEX: Aktiviere `agent-team-creator` mit Team aus Lead + jurist-planer + steuer-planer + strategie-planer + umsetzungsplaner + devils-advocate.

---

## Schritt 3: Plan erstellen

Lies `references/umsetzungsplan.md` für die vollständige Planlogik.
Verwende `templates/umsetzungsplan-template.md` als Dokumentstruktur.

### Kernprinzip: 6 Pflichtfelder pro Maßnahme

| Feld | Beschreibung | Beispiel |
|------|-------------|---------|
| **Was** | Konkrete Handlung (Imperativ) | "Strafanzeige bei StA München einreichen" |
| **Warum** | Rechtliche/strategische Begründung | "Verdacht auf § 264a StGB, Beweislage A" |
| **Wer** | Verantwortlicher | "Fachanwalt Kapitalmarktrecht" |
| **Bis wann** | Konkretes Datum | "Bis 15.04.2026 (Verjährung droht)" |
| **Womit** | Links, Dokumente, Kosten | "bafin.de/beschwerde, Kosten: ~0€" |
| **Erfolgskriterium** | Messbares Ergebnis | "Eingangsbestätigung der StA liegt vor" |

---

## Schritt 4: Speichern

Speichere den Plan in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/YYYY-MM-DD-<thema>-umsetzungsplan.md`

---

## Schritt 5: Übergabe an User

1. Plan im Chat zusammenfassen (Top 3 Sofortmaßnahmen hervorheben)
2. Nächste kritische Frist prominent nennen: `⏰ Nächste kritische Frist: [Datum] — [Maßnahme]`
3. Fortschritts-Tabelle zeigen mit Status-Spalte
4. Anbieten: "Soll ich einen der Schritte weiter ausarbeiten?"
5. Anbieten: "Soll ich eine Gesprächsnotiz für den Anwalt/Steuerberater erstellen?"
