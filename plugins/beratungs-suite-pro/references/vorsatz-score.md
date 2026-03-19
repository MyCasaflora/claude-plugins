# Vorsatz-Score — Strafrechtlicher Intentionsnachweis

Misst nachweisbare Vorsatz-Indikatoren für strafrechtliche Einordnung.
Ergänzt (ersetzt NICHT) das Confidence-Scoring-System.

---

## Punkte-System

### Kenntnis & Weiterbewerbung (höchste Gewichtung)
| Indikator | Punkte |
|-----------|--------|
| Behördliche Warnung (BaFin/FMA/FINMA) + Produkt danach weiter beworben | +35 |
| Nutzerschaden öffentlich gemeldet im eigenen Kanal + keine Reaktion + Weiterbetrieb | +30 |
| EU-/nationale Behörde hat Kanal gesperrt + Weiterbetrieb auf Backup-Kanal | +25 |
| Strafanzeige oder Klage gegen Produkt bekannt + Weiterbewerbung | +20 |

### Strukturelle Verschleierung
| Indikator | Punkte |
|-----------|--------|
| Verschwiegenheitsklausel in Kundenverträgen (§307 BGB — unwirksam) | +20 |
| URL-Shortener systematisch für ALLE Affiliate-Links | +15 |
| Keine §5a UWG-Kennzeichnung trotz nachgewiesener Affiliate-Provisionen | +10 |
| Offshore-Firmensitz (Dubai/UK/St. Vincent) + aktiver DE-Vertrieb | +10 |
| Alias-Namen / andere Identität in verschiedenen Kanälen | +10 |

### Produkt-Risiko
| Indikator | Punkte |
|-----------|--------|
| Bewerbung KYC-freier / anonymer Zahlungsprodukte | +15 |
| Renditeversprechen > 50% p.a. (eindeutig unrealistisch) | +10 |
| MLM-Struktur mit Provisionsstufenplan | +10 |
| FOMO-Deadline-Marketing bei regulierungspflichtigem Produkt | +5 |
| Gesundheitsversprechen ohne Studienlage | +5 |

---

## Interpretation

| Score | Einordnung | Empfehlung |
|-------|------------|------------|
| 0–15 | Fahrlässigkeit möglich | §823 BGB prüfen |
| 16–35 | Bedingter Vorsatz wahrscheinlich | §826 BGB prüfen |
| 36–60 | Bedingter Vorsatz gut belegt | Strafanzeige erwägen |
| 60+ | Vorsatz stark belegt | §263 StGB Beihilfe / §264a StGB wahrscheinlich |

---

## Pflicht-Ausgabe im Report

```markdown
### Vorsatz-Score
| Indikator | Punkte | Beleg |
|-----------|--------|-------|
| [Beschreibung] | +XX | [Quelle / Screenshot] |
| GESAMT | XX | → [Einordnung] |
```
