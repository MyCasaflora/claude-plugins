# Link-Hub & Affiliate-Analyse

Vollständige Erfassung von Affiliate-Strukturen aus Link-Aggregatoren und
Social-Media-Bios. Ergänzt `autonome-recherche.md`.

---

## Schritt 1: Link-Hub vollständig auslesen

```javascript
// javascript_eval auf linktr.ee/{name} oder äquivalente Plattform:
Array.from(document.querySelectorAll('a[href]'))
  .map(a => ({ text: a.innerText.trim(), href: a.href }))
  .filter(l => l.href && !l.href.includes('linktr.ee'))
```

Reihenfolge erfassen → Priorisierung gibt Hinweis auf Hauptprodukte.

---

## Schritt 2: Affiliate-Parameter auflösen

```
ERKENNUNGSMUSTER:
  ?aff={name}       → direkter Affiliate-Code
  ?ref={id}         → Referral-Code
  ?affid={name}     → Affiliate-ID
  ?partner={name}   → Partner-Code
  ?via={name}       → Via-Parameter
  shortbee.io/*     → IMMER auflösen (Verschleierung)
  bit.ly/*          → IMMER auflösen
  tinyurl.com/*     → IMMER auflösen

AUFLÖSUNG JEDES SHORTLINKS:
  web_fetch(shortlink) → HTTP-Redirect verfolgen → Ziel-URL + alle Parameter erfassen
```

---

## Schritt 3: Facebook Ad Library (Pflicht-Quelle)

```
FÜR JEDEN AKTEUR:
  URL: https://www.facebook.com/ads/library/?q={name}&type=ALL

ERFASSEN:
  - Laufende UND vergangene Anzeigen (auch gelöschte sind sichtbar)
  - Zielgruppen-Targeting (DE/AT/CH? → Nachweis für deutschen Markt)
  - Laufzeit der Anzeigen
  - Ausgaben-Range (Nachweis für gewerbsmäßige Bewerbung)

RECHTLICHE BEDEUTUNG:
  Facebook Ads beweisen gewerbsmäßige, bezahlte Bewerbung eines Produkts
  → Nachweis für §5a UWG-Pflicht (Kennzeichnung) und Marktort-DE-Zuständigkeit
```

---

## Schritt 4: Provisionsstruktur-Mapping

```json
{
  "anzeigename": "...",
  "angezeigter_link": "shortbee.io/XYZ",
  "tatsächlicher_link": "product.com/buy?aff=kanalname",
  "ziel_domain": "product.com",
  "affiliate_parameter": "aff=kanalname",
  "affiliate_plattform": "Digistore24 / direkt / unklar",
  "produkt_kategorie": "Krypto / Immobilien / Gesundheit / ...",
  "preis": "k.A. / X €"
}
```

Alle nicht-gekennzeichneten Affiliate-Links → §5a UWG-Verstoß, sofort abmahnbar.
