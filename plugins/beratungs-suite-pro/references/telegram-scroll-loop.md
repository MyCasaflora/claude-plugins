# Telegram Scroll-Loop — Technische Implementierung

Telegram lädt Nachrichten lazy — ohne diesen Loop sieht man nur ~30–50 Nachrichten.

---

## Pflicht-Algorithmus (vor jeder Telegram-Analyse)

```
INITIALISIERUNG:
  NAVIGATION: web.telegram.org/a/#{kanal-id}
  WARTEN: Network-Idle (min. 3 Sekunden nach Laden)
  INITIAL-CHECK:
    Anzahl Mitglieder (sichtbar im Header)
    Öffentlich oder privat?
    Angepinnte Nachrichten → Screenshot + Text sofort erfassen
    Admin/Owner-Badges aus sichtbaren Nachrichten identifizieren

SCROLL-LOOP:
  previous_count = 0
  no_change_counter = 0

  WHILE no_change_counter < 3:
    scroll(up, amount=10)
    wait(2 Sekunden)
    current_count = querySelectorAll('.message-date-group').length

    IF current_count > previous_count:
      neue_gruppen = gruppen[0..delta] extrahieren → Buffer
      previous_count = current_count
      no_change_counter = 0
    ELSE:
      no_change_counter++

  → Ältestes verfügbares Datum dokumentieren
```

---

## Nachrichteninhalt extrahieren (EINZELN — nie als Array)

```javascript
// FÜR JEDE message-date-group EINZELN (Array-Abfragen triggern BLOCKED-Fehler):
const g = document.querySelectorAll('.message-date-group')[idx];
const walker = document.createTreeWalker(g, NodeFilter.SHOW_TEXT);
const texts = [];
let node;
while (node = walker.nextNode()) {
  const t = node.textContent.trim();
  if (t.length > 1 && !node.parentElement?.closest('a')) texts.push(t);
}
texts.join('\n')

// Links SEPARAT:
Array.from(g.querySelectorAll('a[href]')).map(a => a.href)
```

Pro Nachricht erfassen: Absendername, Badge (owner/admin/user), Zeitstempel, Text, URLs, View-Count, "Forwarded from".

---

## Signal-Pattern-Matching (Regex-Patterns)

### Finanzielle Risikosignale
```
Rendite:    /(\d+)[,.]?(\d*)\s*%\s*(pro|per|\/)\s*(Monat|Jahr|Tag|month|year)/i
Hebel:      /(Faktor|Factor|x)\s*\d+/i  |  /\d+x\s*(Account|Hebel|Leverage)/i
Absolut:    /\d+\s*%\s*p\.?\s*a\.?/i
MLM:        /(Sponsor.?ID|Downline|Upline|Empfehlungsbonus|Provisionsstufe)/i
Krypto-MLM: /(DAO|Token|Coin|NFT|Mining|Staking).{0,50}(Rendite|Gewinn|Return)/i
```

### Schadenssignale (SOFORT Screenshot bei Fund)
```
Keywords:
  "komme nicht (mehr) an mein Geld"  |  "Support meldet sich nicht"
  "Konto (wurde) gesperrt"  |  "Zahlung (kommt) nicht an"  |  "Geld weg"
  "Verlust"  |  "Betrug"  |  "Scam"  |  "Rückerstattung"
  "Anzeige"  |  "Rechtsanwalt"

AKTION: Screenshot + Volltext + Datum + Admin-Reaktion (Inhalt!) erfassen
→ Vorsatz-Score +30 wenn Weiterbetrieb nach Kenntnis des Schadens
```

### GwG / Geldwäsche-Merkmale
```
Keywords:
  "anonym" + (Karte | Konto | Zahlung | Transfer)
  "KYC-frei"  |  "ohne KYC"  |  "kein Ausweis"  |  "nicht nachverfolgbar"
  Hohe Transaktionslimits + keine Identitätsprüfung
```

### Marketing-Manipulationstechniken
```
FOMO:       Deadlines mit Datum, "letzte Chance", "nur noch X Plätze"
Angst:      "Enteignung", "Kontosperrung", "Überwachung", "AMLA", "Beweislastumkehr"
Authority:  Titel ohne Nachweispflicht ("Experte für...", fake Zertifikate)
Scarcity:   "begrenzte Plätze", "exklusiv für unsere Community"
```

### Vorsatz-Indikatoren
```
Keywords:
  "Verschwiegenheitsklausel"  |  "nicht weitersagen"  |  "unter uns"
  "BaFin" (in Admin-Post, in irgendeinem Kontext)
  "abgeschaltet" / "gesperrt" + sofortige Erwähnung Backup-Gruppe
  Admin-Reaktion auf Schadensberichte → Inhalt der Antwort dokumentieren!
```
