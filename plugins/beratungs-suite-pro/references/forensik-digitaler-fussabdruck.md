# Forensik: Digitaler Fußabdruck — Reverse Analytics, SSL & PDF

Ergänzt `autonome-recherche.md`. Wird IMMER in Phase 0 der Ermittlung ausgeführt,
bevor Plattform-OSINT beginnt. Ziel: De-Anonymisierung durch digitale Metadaten.

---

## Modul F1: Reverse IP & Analytics Lookup

Oft verraten gemeinsam genutzte Analytics-IDs oder IP-Adressen ganze Firmennetzwerke,
auch wenn die Domains oberflächlich verschieden wirken.

### Schritt 1: Analytics-ID aus Webseite extrahieren

```javascript
// Im Browser auf der Zielseite (javascript_eval):
// Google Analytics ID finden:
Array.from(document.querySelectorAll('script')).forEach(s => {
  const m = (s.textContent || s.src).match(/UA-\d+-\d+|G-[A-Z0-9]+/);
  if (m) console.log('GA:', m[0]);
});

// Facebook Pixel ID finden:
Array.from(document.querySelectorAll('script')).forEach(s => {
  const m = (s.textContent || '').match(/fbq\('init', '(\d+)'\)/);
  if (m) console.log('FB Pixel:', m[1]);
});
```

### Schritt 2: Reverse-Lookup über gefundene IDs

```
WENN Google Analytics ID gefunden:
  web_fetch("https://www.builtwith.com/websitelist/GOOGLE-ANALYTICS/{GA-ID}")
  → Zeigt alle Domains die dieselbe Analytics-ID nutzen

WENN Facebook Pixel ID gefunden:
  web_fetch("https://www.builtwith.com/websitelist/Facebook-Pixel/{Pixel-ID}")
  → Zeigt verbundenes Domain-Netzwerk

ALTERNATIV (Reverse IP):
  web_fetch("https://viewdns.info/reverseip/?host={domain}&apikey=free")
  web_search("{IP-Adresse} site:viewdns.info")
  → Alle Domains auf derselben IP
```

### Schritt 3: Befund dokumentieren

```json
{
  "analytics_id": "G-XXXXXXXXXX",
  "verbundene_domains_via_analytics": ["domain1.com", "domain2.de"],
  "verbundene_domains_via_ip": ["andere-domain.com"],
  "bedeutung": "Koordiniertes Domain-Netzwerk trotz verschiedener Markennamen"
}
```

**Red Flag:** Mehr als 3 Domains teilen dieselbe Analytics-ID = koordiniertes Netzwerk

---

## Modul F2: SSL-Zertifikat-Historie

Historische SSL-Zertifikate zeigen Betreibernamen und frühere Domains, bevor
professionelle Verschleierung einsetzte.

### Abfrage

```bash
# Alle bisherigen SSL-Zertifikate abrufen (öffentlich, kein Auth):
curl -s "https://crt.sh/?q={domain}&output=json" | python3 -c "
import json, sys
data = json.load(sys.stdin)
for c in sorted(data, key=lambda x: x.get('not_before',''))[:10]:
    print(c.get('not_before',''), '|', c.get('common_name',''), '|', c.get('name_value',''))
"
```

### Erfassen

- Frühestes Ausstellungsdatum → wann wurde die Domain wirklich erstellt?
- `common_name` / `name_value` früherer Zertifikate → frühere Subdomains, Services
- Zertifikatsaussteller-Organisation → oft echter Firmenname vor Offshore-Umbau
- Wildcard-Zertifikate → zeigen ggf. versteckte Subdomains

**Typischer Fund:** Erste Ausstellung lautete auf "Max Mustermann GmbH, München"
— beweist deutschen Ursprung trotz heutiger Dubai-Registrierung.

---

## Modul F3: PDF & Dokument-Metadaten-Forensik

Initiatoren sind auf HTML-Seiten vorsichtig, vergessen aber die Metadaten
in verlinkten PDFs (Whitepapers, Präsentationen, AGBs).

### Schritt 1: PDFs auf Zielseite finden

```javascript
// javascript_eval auf Zielseite:
Array.from(document.querySelectorAll('a[href$=".pdf"], a[href*=".pdf"]'))
  .map(a => a.href)
```

### Schritt 2: Metadaten extrahieren (bash_tool)

```bash
# Option 1: pdfinfo (schnell)
curl -s -L "{url}" -o /tmp/check.pdf && pdfinfo /tmp/check.pdf

# Option 2: Python (strukturiert)
python3 -c "
import PyPDF2
r = PyPDF2.PdfReader('/tmp/check.pdf')
m = r.metadata
for k,v in m.items(): print(k, ':', v)
"

# Option 3: exiftool (detailliert)
exiftool /tmp/check.pdf | grep -iE 'author|creator|producer|create date|modify date|software'
```

### Felder von forensischem Interesse

| Feld | Bedeutung | Typischer Fund |
|------|-----------|----------------|
| `/Author` | Wer hat das Dokument verfasst | Echter Name trotz Offshore-Firma |
| `/Creator` | Welche Software / welcher Nutzer | "Max.Mustermann@firma-de.com" |
| `/Producer` | PDF-Generator, oft OS-Info | "macOS 14.2" → DE-Rechner |
| `/CreationDate` | Wann erstellt | Kann Zeitlinie widerlegen |
| `/ModDate` | Letzte Änderung | Nachträgliche Manipulationen |

**Typischer Fund:** Whitepaper einer Dubai-Firma wurde laut Metadaten von
"thomas.b@deutschemail.de" auf einem Windows-Rechner in Germany erstellt.

---

## Modul F4: Wayback Machine — Frühere Betreiber De-Anonymisierung

Ziel ist NICHT nur "historische Website-Versionen" — sondern gezielt den ersten
verfügbaren Impressumsstand zu finden, bevor Offshore-Verschleierung einsetzte.

```
AKTION:
  web_fetch("https://web.archive.org/web/20180101000000*/{domain}/impressum")
  web_fetch("https://web.archive.org/web/20190101000000*/{domain}/impressum")
  web_fetch("https://web.archive.org/web/20200101000000*/{domain}/impressum")

ZIEL:
  Frühere Betreibernamen → in Actor Loop (references/actor-loop.md) einspeisen
  Domain-Alter vs. behauptete Gründungsgeschichte → Red-Flag-Detektor
  Frühere Produktbeschreibungen → Vergleich mit aktuellen Angeboten

FUND DOKUMENTIEREN: Wenn Version 1.0 echten deutschen Namen zeigt,
  der jetzt durch eine Briefkastenfirma ersetzt wurde → Screenshot + Wayback-URL
```
