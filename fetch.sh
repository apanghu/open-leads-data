#!/bin/sh
# Re-downloads the current live data from the same public API this snapshot came from.
# Usage: ./fetch.sh
set -e
BASE="https://ayepin.com/api/public-stats"
curl -fsS "$BASE/export.csv" -o summary.csv
curl -fsS "$BASE/export.json" -o summary.json
curl -fsS "$BASE/export/breakdown.csv" -o breakdown.csv
curl -fsS "$BASE/export/breakdown.json" -o breakdown.json
echo "Fetched $(($(wc -l < summary.csv) - 1)) pairs."
