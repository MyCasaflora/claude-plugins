---
titel: Ermittlungs-Framework Upgrade Plan
datum: 2026-03-18
typ: plan
skill: beratungs-suite-pro
jurisdiktion: [DE, AT, CH, EU, USA, UAE]
confidence: 95
---

# Ermittlungs-Framework — Upgrade Plan

## Problem
Plugin vertraut blind auf User-Unterlagen, recherchiert nicht eigenständig,
nutzt nur sequenzielle Subagent-Kette ohne Zusammenspiel.

## Lösung: Hybrides Modell
- Einfache Fragen → Subagent mit proaktiver Ermittlung
- Komplexe Fälle → Agent Team mit LKA/StA/Fachanwalt-Perspektiven

## Umsetzungsschritte
1. Neue Referenz: ermittlungs-framework.md
2. Neue Agents: ermittler.md + anklaeger.md
3. Bestehende Agents upgraden
4. Skills aktualisieren (Komplexitäts-Erkennung)
5. Commands aktualisieren
6. README + Doku

## Status: IN UMSETZUNG
