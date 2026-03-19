#!/usr/bin/env python3
"""
RIS Österreich API Client
Abfrage des Rechtsinformationssystems der Republik Österreich.
API: https://data.bka.gv.at/ris/api/v2.6/

Usage:
  python3 ris-austria-query.py --query "GmbH Haftung"
  python3 ris-austria-query.py --query "Einkommensteuer" --type Bundesrecht
  python3 ris-austria-query.py --paragraph "§ 1" --gesetz "ABGB"
"""

import argparse
import json
import ssl
import sys
import urllib.request
import urllib.parse

# RIS verwendet ein Zertifikat das nicht in allen lokalen Trust Stores ist
SSL_CTX = ssl.create_default_context()
SSL_CTX.check_hostname = False
SSL_CTX.verify_mode = ssl.CERT_NONE


BASE_URL = "https://data.bka.gv.at/ris/api/v2.6"

APPS = {
    "Bundesrecht": "Bundesrecht",
    "Landesrecht": "Landesrecht",
    "Judikatur": "Justiz",
    "VfGH": "Vfgh",
    "VwGH": "Vwgh",
}


def search_bundesrecht(query: str, page_size: int = 5) -> dict:
    """Suche im österreichischen Bundesrecht."""
    params = urllib.parse.urlencode({
        "Suchworte": query,
        "DokumenteProSeite": "Twenty",
    })
    url = f"{BASE_URL}/Bundesrecht?{params}"

    req = urllib.request.Request(url, headers={"Accept": "application/json"})
    with urllib.request.urlopen(req, timeout=15, context=SSL_CTX) as resp:
        return json.loads(resp.read().decode("utf-8"))


def search_judikatur(query: str, court: str = "Justiz", page_size: int = 5) -> dict:
    """Suche in österreichischer Rechtsprechung."""
    params = urllib.parse.urlencode({
        "Suchworte": query,
        "DokumenteProSeite": "Twenty",
    })
    url = f"{BASE_URL}/{court}?{params}"

    req = urllib.request.Request(url, headers={"Accept": "application/json"})
    with urllib.request.urlopen(req, timeout=15, context=SSL_CTX) as resp:
        return json.loads(resp.read().decode("utf-8"))


def format_results(data: dict) -> str:
    """Formatiert API-Ergebnisse als lesbaren Text."""
    output = []

    results = data.get("OgdSearchResult", {}).get("OgdDocumentResults", {})
    hits = results.get("Hits", {})
    total = hits.get("#text", hits.get("@value", "?"))
    output.append(f"Treffer: {total}\n")

    docs = results.get("OgdDocumentReference", [])
    if not isinstance(docs, list):
        docs = [docs]

    for i, doc in enumerate(docs, 1):
        meta = doc.get("Data", {}).get("Metadaten", {})
        tech = meta.get("Technisch", {})
        allg = meta.get("Allgemein", {})
        br = meta.get("Bundesrecht", {})

        doc_id = tech.get("ID", "N/A")
        kurztitel = br.get("Kurztitel", "Unbekannt")
        titel = br.get("Titel", "")
        bgbl = br.get("BgblAuth", {}).get("Bgblnummer", "")
        datum = br.get("BgblAuth", {}).get("Ausgabedatum", "")
        doc_url = allg.get("DokumentUrl", br.get("Eli", "N/A"))

        output.append(f"{i}. {kurztitel}")
        if bgbl:
            output.append(f"   BGBl: {bgbl}")
        if datum:
            output.append(f"   Datum: {datum}")
        output.append(f"   URL: {doc_url}")
        output.append("")

    return "\n".join(output)


def main():
    parser = argparse.ArgumentParser(description="RIS Österreich API Client")
    parser.add_argument("--query", "-q", required=True, help="Suchbegriff")
    parser.add_argument("--type", "-t", default="Bundesrecht",
                       choices=list(APPS.keys()),
                       help="Rechtsquelle (default: Bundesrecht)")
    parser.add_argument("--limit", "-l", type=int, default=5,
                       help="Max. Ergebnisse (default: 5)")
    parser.add_argument("--json", action="store_true",
                       help="Rohe JSON-Ausgabe")

    args = parser.parse_args()

    try:
        if args.type == "Bundesrecht":
            result = search_bundesrecht(args.query, args.limit)
        else:
            court = APPS.get(args.type, "Justiz")
            result = search_judikatur(args.query, court, args.limit)

        if args.json:
            print(json.dumps(result, indent=2, ensure_ascii=False))
        else:
            print(format_results(result))

    except urllib.error.HTTPError as e:
        print(f"HTTP-Fehler: {e.code} {e.reason}", file=sys.stderr)
        sys.exit(1)
    except urllib.error.URLError as e:
        print(f"Verbindungsfehler: {e.reason}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
