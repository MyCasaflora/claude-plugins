# Visualisierung Export — Diagramme als PNG/PDF ausgeben

Jede Analyse, die Mermaid-Diagramme enthält, bekommt diese ZUSÄTZLICH
als hochauflösende PNG- und PDF-Dateien exportiert.

---

## Wann Export ausführen

Export ist PFLICHT bei:
- Akteurs-Netzwerk-Diagrammen (>= 3 Knoten)
- Umsetzungsplan-Abhängigkeits-Diagrammen
- Verjährungs-Timelines als Diagramm
- Geldfluss-Diagrammen

Export ist OPTIONAL bei:
- Einfachen Flowcharts (< 5 Schritte)
- Subagent-Modus (nur wenn User explizit fragt)

---

## Export-Methode: Mermaid CLI (mmdc)

```bash
# Installation prüfen / nachholen:
which mmdc || npm install -g @mermaid-js/mermaid-cli

# Export-Funktion (für jedes Diagramm aufrufen):
export_diagram() {
  local DIAGRAM_FILE="$1"   # .mmd Quelldatei
  local OUTPUT_NAME="$2"    # Name ohne Extension
  local OUTPUT_DIR="$3"     # Zielordner

  # PNG (hochauflösend, für Präsentationen und Dokumente)
  mmdc -i "$DIAGRAM_FILE" \
       -o "${OUTPUT_DIR}/${OUTPUT_NAME}.png" \
       -w 2400 \
       -H 1600 \
       --backgroundColor white \
       --theme default

  # PDF (für Druck und Archivierung)
  mmdc -i "$DIAGRAM_FILE" \
       -o "${OUTPUT_DIR}/${OUTPUT_NAME}.pdf" \
       --theme default
}
```

---

## Workflow: Diagramm erstellen → exportieren → referenzieren

### Schritt 1: Mermaid-Quellcode in temporäre .mmd-Datei schreiben

```bash
cat > /tmp/diagram_TIMESTAMP.mmd << 'EOF'
[Mermaid-Code hier einfügen]
EOF
```

### Schritt 2: Export ausführen

```bash
# Zielordner: docs/analysen/visuals/ (wird ggf. angelegt)
mkdir -p "${CLAUDE_PLUGIN_ROOT}/docs/analysen/visuals"

mmdc -i /tmp/diagram_TIMESTAMP.mmd \
     -o "${CLAUDE_PLUGIN_ROOT}/docs/analysen/visuals/YYYY-MM-DD-[thema]-[diagrammtyp].png" \
     -w 2400 -H 1600 --backgroundColor white

mmdc -i /tmp/diagram_TIMESTAMP.mmd \
     -o "${CLAUDE_PLUGIN_ROOT}/docs/analysen/visuals/YYYY-MM-DD-[thema]-[diagrammtyp].pdf"

# Temp-Datei aufräumen:
rm /tmp/diagram_TIMESTAMP.mmd
```

### Schritt 3: Im Markdown-Dokument referenzieren

```markdown
![Akteurs-Netzwerk](./visuals/YYYY-MM-DD-[thema]-netzwerk.png)
Export: [PNG](./visuals/YYYY-MM-DD-[thema]-netzwerk.png) |
               [PDF](./visuals/YYYY-MM-DD-[thema]-netzwerk.pdf)
```

---

## Fallback: mmdc nicht verfügbar

Wenn mmdc trotz Installationsversuch nicht funktioniert:

```bash
# Fallback 1: Python + matplotlib für einfache Diagramme
pip install matplotlib --break-system-packages --quiet

# Fallback 2: Nur Mermaid-Code im Markdown belassen
# (rendert in VS Code, GitHub, Notion, Obsidian)
# Hinweis an User ausgeben:
echo "Hinweis: mmdc nicht verfügbar. Diagramme sind als Mermaid-Code im Markdown enthalten und können in VS Code, GitHub oder Notion gerendert werden."
```

---

## Diagramm-Typen und Dateinamen-Schema

| Diagramm | Dateiname-Suffix |
|----------|-----------------|
| Akteurs-Netzwerk | `-netzwerk` |
| Geldfluss | `-geldfluss` |
| Umsetzungsplan-Sequenz | `-massnahmen-sequenz` |
| Verjährungs-Timeline | `-verjaehrung` |
| Beweiskette | `-beweiskette` |
| Compliance-Status | `-compliance-status` |
