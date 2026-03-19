---
name: umsetzungsplan
description: |
  Erstellt konkrete, priorisierte Umsetzungspläne aus Analyseergebnissen.
  Verwandelt Findings aus Recht, Steuer, Strategie oder Ermittlung in einen
  Schritt-für-Schritt-Aktionsplan mit 5 Pflichtfeldern pro Maßnahme
  (Was/Warum/Wer/Frist/Womit), Perspektiven-Auswahl und Fortschritts-Tracking.
  Trigger: "/umsetzungsplan", "Umsetzungsplan erstellen", "Aktionsplan",
  "Maßnahmenplan erstellen", "Was muss ich jetzt tun", "konkrete Schritte",
  "Handlungsplan", "To-Do-Liste aus Analyse", "Findings umsetzen",
  "Plan aus Gutachten", "nächste Schritte", "action plan", "implementation plan",
  "Umsetzung planen", "Schritt für Schritt", "priorisierte Maßnahmen".
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - Agent
  - Write
  - Edit
  - WebFetch
  - WebSearch
---

## Perspektiven-Eingang

Dieser Skill kann mit einer vorgewählten Perspektive aufgerufen werden:
- `perspektive=schutzseite` → Perspektive 1 direkt
- `perspektive=selbstpruefung` → Perspektive 2 direkt
- `perspektive=pruefauftrag` → Perspektive 3 direkt

Falls keine Perspektive übergeben wurde und Findings vorliegen:
Checkpoint aus `references/perspektiven-auswahl.md` ausführen.

Falls keine Perspektive und keine Findings: User nach beidem fragen.

# Umsetzungsplan — Findings in konkrete Aktionspläne übersetzen

Verwandelt Analyseergebnisse (Recht, Steuer, Strategie, Ermittlung) in einen konkreten,
Schritt-für-Schritt-Aktionsplan mit Verantwortlichkeit, Frist und Erfolgskriterium.

## Einsprungpunkte

### Modus A: Nach einer Analyse (automatisch)
Am Ende jeder Analyse als nächster logischer Schritt angeboten.
Die Findings aus Phase 1-8 werden automatisch als Input verwendet.

### Modus B: Standalone (mit externen Findings)
User liefert eigene Findings (Gutachten, Reports, formlose Beschreibungen).

---

## Schritt 1: Findings-Aufnahme & Validierung

Lies `${CLAUDE_PLUGIN_ROOT}/references/umsetzungsplan.md` Abschnitt "Findings-Aufnahme".

### Akzeptierte Inputs:
- Analyseberichte (Markdown, PDF, Klartext)
- Rechtsgutachten oder Steuerliche Stellungnahmen
- Ermittlungsergebnisse (Bewertungen A-E, Befunde-Tabellen)
- Formlose Beschreibungen ("ich habe folgende Probleme gefunden...")

### Vollständigkeitsprüfung (PFLICHT vor Planerstellung):

| Feld | Aktion bei Fehlen |
|------|-------------------|
| Identifizierte Probleme/Risiken | STOP — ohne dies kein Plan möglich |
| Domäne (Recht/Steuer/Strategie) | Nachfragen |
| Schweregrad / Bewertung (A-E) | Schätzen + mit User bestätigen |
| Zeitrahmen (wann entstand das Problem?) | Nachfragen für Verjährungs-Check |
| Zuständigkeits-Kontext (Unternehmen/Privat/Projekt) | Nachfragen |
| Bereits ergriffene Maßnahmen | Explizit fragen: "Was haben Sie bereits unternommen?" |

Wenn "Identifizierte Probleme" fehlen: Sofort abbrechen und User auffordern,
Findings bereitzustellen oder zuerst eine Analyse durchzuführen
(`/ermittlung`, `/recht-analyse`, `/steuer-check`, `/strategie-entwurf`).

### Veraltungs-Check:
- Findings 0-30 Tage: Normal fortfahren
- Findings 31-60 Tage: Hinweis ausgeben
- Findings 61-180 Tage: Warnung — Rechtslage könnte sich geändert haben
- Findings > 180 Tage: Starke Warnung — Verlässlichkeit eingeschränkt

Für jeden zeitkritischen Schritt: Prüfe ob Fristen (Verjährung, Widerruf) noch offen sind.
Lies `${CLAUDE_PLUGIN_ROOT}/references/verjährungsfristen.md`.

---

## Schritt 2: Komplexitäts-Erkennung

### EINFACH → Subagent-Modus:
- Findings aus EINER Domäne
- Maximal 3-5 identifizierte Probleme
- Klare Zuständigkeit (ein Akteur)
- Keine widersprüchlichen Empfehlungen

→ Aktiviere `agents/umsetzungsplaner.md` direkt.

### KOMPLEX → Agent-Team-Modus:
- Findings aus MEHREREN Domänen mit konfligierenden Empfehlungen
- Mehr als 5 identifizierte Probleme
- Mehrere beteiligte Akteure / Unternehmen
- Strafrecht + steuerliche Selbstanzeige gleichzeitig
- Unternehmensrestrukturierung (Recht + Steuer + Strategie)
- User hat explizit "Agent Team" oder "tiefe Analyse" angefragt

Bei KOMPLEX: Aktiviere `agent-team-creator` mit folgendem Team:

| Agent | Rolle | Modell | Arbeitsbereich |
|-------|-------|--------|----------------|
| lead | Koordiniert, löst Konflikte auf | opus | Übergreifend |
| jurist-planer | Rechtliche Teilschritte | sonnet | Nur Rechts-Maßnahmen |
| steuer-planer | Steuerliche Teilschritte | sonnet | Nur Steuer-Maßnahmen |
| strategie-planer | Strategische Teilschritte | sonnet | Nur Strategie-Maßnahmen |
| umsetzungsplaner | Synthesiert alle Teilpläne | opus | Integration + Sequenz |
| devils-advocate | Prüft den fertigen Plan | opus | Vollständiger Plan |

Spezialisten arbeiten PARALLEL. Umsetzungsplaner wartet und synthetisiert danach.

---

## Schritt 3: Plan erstellen

Lies `${CLAUDE_PLUGIN_ROOT}/references/umsetzungsplan.md` für die vollständige Planlogik.
Verwende `${CLAUDE_PLUGIN_ROOT}/templates/umsetzungsplan-template.md` als Dokumentstruktur.

### 5 Pflichtfelder pro Maßnahme (KEINE Kostenschätzungen):

| Feld | Beschreibung | Beispiel |
|------|-------------|---------|
| **Was** | Konkrete Handlung (Imperativ) | "Strafanzeige bei StA München einreichen" |
| **Warum** | Rechtliche Begründung in einem Satz | "Verdacht auf §264a StGB, Beweislage A" |
| **Wer** | Verantwortlicher | "Fachanwalt Kapitalmarktrecht" |
| **Bis wann** | Konkretes Datum | "Bis 15.04.2026 (Verjährung droht)" |
| **Womit** | Direktlinks, Dokumente, Ressourcen | "bafin.de/beschwerde, Formular XY" |

Keine Kostenschätzungen. Kosten variieren je nach Einzelfall zu stark
um hilfreiche Angaben zu machen — das ist Sache des beauftragten Anwalts.

### Perspektiven-spezifische Maßnahmentypen:

Lies `${CLAUDE_PLUGIN_ROOT}/references/perspektiven-auswahl.md` für die
vollständige Logik welche Maßnahmen in welcher Perspektive erscheinen.

### Verbotene Formulierungen:
- "Konsultieren Sie einen Anwalt"
- "Es wird empfohlen zu prüfen..."
- "Steuerliche Aspekte sollten beachtet werden"

### Pflicht-Formulierungen:
- "Beauftragen Sie bis [Datum] einen Fachanwalt für [Spezialgebiet]"
- "Reichen Sie die Beschwerde bis [Datum] bei [Behörde] ein. Direktlink: [URL]"
- "Stellen Sie bis [Datum] alle Zahlungen an [Gegenseite] ein. Rechtsgrundlage: [Norm]"

---

## Schritt 4: Speichern

Speichere in `${CLAUDE_PLUGIN_ROOT}/docs/analysen/YYYY-MM-DD-<thema>-umsetzungsplan.md`
Verwende YAML-Frontmatter gemäß Template.

---

## Schritt 5: Übergabe an User

1. Plan zusammenfassen (Top 3 Sofortmaßnahmen hervorheben)
2. Nächste kritische Frist prominent: `⏰ Nächste kritische Frist: [Datum] — [Maßnahme]`
3. Fortschritts-Tabelle zeigen mit Status-Spalte
4. Anbieten: "Soll ich einen der Schritte weiter ausarbeiten?"
5. Anbieten: "Soll ich eine Gesprächsnotiz für den Anwalt/Steuerberater erstellen?"

---

## Schritt 6: Diagramme exportieren

Für jeden Umsetzungsplan das Abhängigkeits-Sequenz-Diagramm exportieren.
Lies `${CLAUDE_PLUGIN_ROOT}/references/visualisierung-export.md` für
die vollständige Export-Prozedur.

Exportierte Dateien werden in
`${CLAUDE_PLUGIN_ROOT}/docs/analysen/visuals/` gespeichert und im
Markdown-Dokument referenziert.

---

## Referenzen

- `${CLAUDE_PLUGIN_ROOT}/references/umsetzungsplan.md` — Planlogik & Entscheidungsregeln
- `${CLAUDE_PLUGIN_ROOT}/references/massnahmenplan.md` — Basis-Maßnahmenlogik
- `${CLAUDE_PLUGIN_ROOT}/references/verjährungsfristen.md` — Fristen-Rechner
- `${CLAUDE_PLUGIN_ROOT}/references/eskalationspfade.md` — Eskalationsstufen
- `${CLAUDE_PLUGIN_ROOT}/references/disclaimer-system.md` — Disclaimer-Texte
- `${CLAUDE_PLUGIN_ROOT}/templates/umsetzungsplan-template.md` — Dokumentstruktur
- `${CLAUDE_PLUGIN_ROOT}/references/perspektiven-auswahl.md` — Perspektiven-Logik
- `${CLAUDE_PLUGIN_ROOT}/references/visualisierung-export.md` — Diagramm-Export
