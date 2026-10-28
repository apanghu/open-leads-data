# open-leads-data

How many local businesses, by country and trade, currently have no real website — computed from
[Overture Maps Foundation](https://overturemaps.org) open data.

This repo is a periodic snapshot. The live, continuously-updating version (recomputed monthly as
Overture releases new data) is at **[ayepin.com/open-leads](https://ayepin.com/open-leads)**, where
each country/trade pair also has its own page with a per-city breakdown.

## What's in here

- `summary.csv` / `summary.json` — one row per (country, trade) pair: how many businesses were found,
  how many of those have no real website.
- `breakdown.csv` / `breakdown.json` — the same numbers broken down by city.
- `fetch.sh` — re-downloads the current live data from the same public API this snapshot came from.

## Methodology

For each country, the search tiles across that country's major cities (so a whole country can be
covered without a single query exceeding a reasonable area). Within each tile, every matching business
listing is read from Overture's `places` dataset and classified: a listing counts as "no website" unless
it lists a URL that isn't just a Facebook or Instagram page. Chains with multiple branches found in
different tiles are collapsed to one business. The query term for each trade is checked against Overture's
real category taxonomy, not just guessed from the trade's display name — a few of the obvious guesses
(e.g. "lawyer") turned out to match almost nothing, where the real category word (e.g. "attorney") matched
over 150 times as many listings in the same search.

This is an estimate, not a verified inventory: some listed businesses have closed without any source
noticing yet, and a business that quietly dropped its website after being listed won't be caught until
the next recompute.

## Data

Derived from Overture Maps Foundation's `places` theme, mostly licensed CDLA Permissive 2.0 (it varies
by underlying source -- see Overture's own [attribution and licensing page](https://docs.overturemaps.org/attribution/)).
This snapshot's own counts and breakdowns (the CSV/JSON files in this repo) are released under [CC0](LICENSE) -- use them for anything.

## About AyePin

[AyePin](https://ayepin.com) finds local businesses (via Google Maps, Bing Maps, Apple Maps, and this
same open data), drafts the first outreach message in your own voice, and sends nothing without your
approval. This open dataset is a byproduct of the same pipeline, published because the underlying data
deserves to be checkable by anyone, not just AyePin's own users.
