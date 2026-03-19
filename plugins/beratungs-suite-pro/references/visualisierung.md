# Visualisierung — Mermaid-Diagramme

Jede komplexe Analyse enthält PFLICHT-Diagramme zur Darstellung von Zusammenhängen. Einfache Analysen (Subagent-Modus) erhalten Diagramme nur wenn sinnvoll.

---

## Grundregeln

1. **Mermaid-Syntax** verwenden — rendert in GitHub, VS Code, Obsidian, Notion
2. **Maximal 15 Knoten** pro Diagramm — darüber hinaus aufteilen
3. **Farbcodierung** einheitlich (siehe unten)
4. **Warnungen rot markieren** — sofort visuell erkennbar
5. **Diagramm VOR dem Fließtext** platzieren — Leser erfasst Gesamtbild zuerst

---

## Farbcodierung (einheitlich über alle Domänen)

```
🔴 Rot (#ff6b6b)     — Warnungen, Red Flags, Straftatbestände
🟠 Orange (#ffa94d)   — Offshore/Ausland, Risiken, Prüfungsbedarf
🟢 Grün (#51cf66)     — Unbedenklich, belegt, konform
🔵 Blau (#339af0)     — Neutrale Akteure, Informationsquellen
🟣 Lila (#cc5de8)     — Behörden, Regulatoren
⚪ Grau (#868e96)     — Noch nicht geprüft, offen
```

In Mermaid:
```
style NODE fill:#ff6b6b,color:#fff   %% Rot — Warnung
style NODE fill:#ffa94d,color:#fff   %% Orange — Risiko
style NODE fill:#51cf66,color:#fff   %% Grün — OK
style NODE fill:#339af0,color:#fff   %% Blau — Neutral
style NODE fill:#cc5de8,color:#fff   %% Lila — Behörde
style NODE fill:#868e96,color:#fff   %% Grau — Offen
```

---

## Diagramm-Typen pro Domäne

### Recht: Akteurs-Netzwerk

Zeigt Personen, Firmen, Plattformen und deren Verbindungen. Warnungen sofort sichtbar.

```mermaid
graph TD
    subgraph Netzwerk
        P1[Person A<br/>Rolle] --> F1[Firma X<br/>Land, seit YYYY]
        P2[Person B<br/>Rolle] --> F1
        F1 -.->|bewirbt| F2[Firma Y<br/>⚠️ Behörden-Warnung]
        F1 --> PL[Plattform Z<br/>YouTube/Telegram]
    end

    subgraph Warnungen
        W1[🟣 BaFin<br/>Warnung DD.MM.YYYY]
        W2[🟣 FMA<br/>Warnung DD.MM.YYYY]
    end

    F2 --- W1
    F2 --- W2

    style F2 fill:#ff6b6b,color:#fff
    style W1 fill:#cc5de8,color:#fff
    style W2 fill:#cc5de8,color:#fff
```

**Wann verwenden:** Immer wenn >= 2 Akteure oder Firmen beteiligt sind.

### Recht: Beweiskette

Zeigt den Zusammenhang zwischen Befunden und deren Beweislage.

```mermaid
flowchart LR
    B1[Befund 1<br/>Bewertung A] --> N1[§ X StGB]
    B2[Befund 2<br/>Bewertung B] --> N1
    B3[Befund 3<br/>Bewertung C] --> N2[§ Y KWG]

    N1 --> E[Empfehlung:<br/>Strafanzeige]
    N2 --> E2[Empfehlung:<br/>Aufsichtsbeschwerde]

    style B1 fill:#51cf66,color:#fff
    style B2 fill:#ffa94d,color:#fff
    style B3 fill:#868e96,color:#fff
```

**Wann verwenden:** Bei strafrechtlicher Relevanz oder wenn mehrere Tatbestände geprüft werden.

---

### Steuern: Geldfluss-Diagramm

Zeigt Firmenstrukturen, Geldflüsse und steuerliche Zuordnung.

```mermaid
flowchart TB
    K[Kunde DE] -->|Zahlung| F1[Firma A<br/>UK Ltd]
    F1 -->|Weiterleitung| F2[Firma B<br/>Liechtenstein AG]
    F2 -->|Provision| F3[Firma C<br/>Mauritius]
    F2 -->|Leistung?| K

    subgraph Steuerliche Bewertung
        S1[DE: Steuerpflicht<br/>§ 49 EStG]
        S2[UK: Corporation Tax<br/>19%/25%]
        S3[LI: Ertragssteuer<br/>12.5%]
    end

    F1 --- S2
    F2 --- S3
    K --- S1

    style F3 fill:#ff6b6b,color:#fff
    style F2 fill:#ffa94d,color:#fff
```

**Wann verwenden:** Bei internationalen Strukturen, Holding-Konstrukten, Verdacht auf Gewinnverschiebung.

### Steuern: Steuerbelastungs-Vergleich

Einfaches Balken-Diagramm für Steuervergleiche (Mermaid xychart).

```mermaid
xychart-beta
    title "Steuerbelastung im Vergleich"
    x-axis ["DE GmbH", "AT GmbH", "UK Ltd", "LI AG", "UAE FZE"]
    y-axis "Effektive Steuerquote %" 0 --> 40
    bar [30, 25, 19, 12.5, 0]
```

**Wann verwenden:** Bei DBA-Analysen, Standortvergleichen, Holding-Optimierung.

---

### Strategie: Marktposition / Wettbewerber

```mermaid
mindmap
  root((Markt X))
    Wettbewerber
      Firma A
        Stärke: Marktführer
        Schwäche: Teuer
      Firma B
        Stärke: Innovativ
        Schwäche: Klein
    Chancen
      Wachsender Markt
      Regulatorische Öffnung
    Risiken
      Neue Regulierung
      Preisdruck
```

**Wann verwenden:** Bei Marktanalysen, SWOT, Wettbewerbsanalysen.

### Strategie: Wertschöpfungskette

```mermaid
flowchart LR
    A[Lieferant] --> B[Produktion] --> C[Vertrieb] --> D[Endkunde]

    B --> E[Partner X]
    C --> F[Affiliate-Netzwerk]

    style F fill:#ffa94d,color:#fff
```

**Wann verwenden:** Bei Business Model Analyse, Due Diligence, Geschäftsmodell-Prüfung.

---

## Platzierung im Dokument

```
## Ermittlungsbericht / Analyse

### Netzwerk-Übersicht          ← DIAGRAMM HIER (Gesamtbild zuerst)
[Mermaid-Diagramm]

### Identifizierte Akteure      ← Dann Details
[Tabelle]

### Befunde                     ← Ggf. Beweisketten-Diagramm
[Tabelle mit A-E Bewertung]

...

### Gesprächsnotiz              ← Am Ende
[Kompakte Version]
```

---

## Regeln für Agenten

1. **Ermittler-Agent**: Erstellt Akteurs-Netzwerk nach Phase 2 (Unternehmens-Verifizierung)
2. **Ankläger-Agent**: Erstellt Beweiskette nach Phase 3 (Tatbestandsprüfung)
3. **Steuerfahnder-Agent**: Erstellt Geldfluss-Diagramm nach Phase 1 (Struktur-Analyse)
4. **Stratege/Marktanalyst**: Erstellt Marktposition-Mindmap nach Framework-Analyse
5. **Lead**: Konsolidiert alle Diagramme im Endbericht, prüft auf Konsistenz
