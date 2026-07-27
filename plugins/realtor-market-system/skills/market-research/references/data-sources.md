# Data Sources + Search Patterns — Market Research

## Source priority (highest first)

1. **The local real estate board's own monthly release** — this is the primary source. Everything
   else is commentary on it.
2. **National association / statistics agency** — CREA, NAR, CMHC, Statistics Canada, Census.
3. **The central bank** — for rates and rate signalling.
4. **Major financial press** reporting on the above, when the release itself isn't accessible.
5. **Portal research arms** — Zillow, Realtor.com, Redfin research (US); Better Dwelling, WOWA (Canada).

Never use an aggregator blog, an AI-generated summary site, or another agent's market update as a
source for a figure.

---

## Canada

### National
- CREA (crea.ca) — national monthly housing stats
- CMHC (cmhc-schl.gc.ca) — affordability, rental, housing supply, starts
- Bank of Canada (bankofcanada.ca) — rate decisions and signalling
- Statistics Canada (statcan.gc.ca) — population, migration, CPI shelter
- Better Dwelling (betterdwelling.com) · WOWA (wowa.ca) — analysis and rate tables
- BNN Bloomberg · Globe and Mail Real Estate · Financial Post

### Local boards (primary source for city-level data)
| City | Board | Website |
|---|---|---|
| Calgary | CREB | creb.com/stats |
| Toronto / GTA | TRREB | trreb.ca/the-market |
| Vancouver / Greater Van | GVR (formerly REBGV) | gvrealtors.ca |
| Fraser Valley | FVREB | fvreb.bc.ca |
| Edmonton | REALTORS® Association of Edmonton | realtorsofedmonton.com |
| Ottawa | OREB | oreb.ca/market-statistics |
| Montreal | APCIQ / QPAREB | apciq.ca |
| Hamilton–Burlington | RAHB | rahb.ca |
| London / St. Thomas | LSTAR | lstar.ca |
| Winnipeg | WinnipegREALTORS® | winnipegrealtors.ca |
| Halifax | NSAR | nsar.ns.ca |
| Saskatoon / Regina | SRA | saskatchewanrealtors.ca |
| Victoria | VREB | vreb.org |
| Kelowna / Okanagan | AIR | assocrealtors.ca |

*Not listed? Search `[city] real estate board statistics` and confirm it's the board's own domain.*

### Rates
- Bank of Canada policy rate + announcement schedule
- Posted and discounted 5-year fixed and variable — ratehub.ca, wowa.ca, or a major lender's page
- Note the qualifying/stress-test rate where it affects buying power

---

## United States

### National
- NAR (nar.realtor) — existing home sales, median prices, months of supply
- Realtor.com Research (realtor.com/research) · Zillow Research (zillow.com/research) · Redfin Data Center
- FHFA house price index · Case-Shiller
- Federal Reserve (federalreserve.gov) — rate decisions
- Freddie Mac (freddiemac.com) — weekly Primary Mortgage Market Survey
- HousingWire · CoreLogic

### Regional + local
- State REALTOR® association monthly press releases (usually the best state-level source)
- The local MLS or association's monthly data release
- City newspaper real estate sections for local colour and quotes

### Rates
- Freddie Mac PMMS for the weekly 30-year fixed benchmark
- Mortgage News Daily for a current daily read
- Note points and whether the quote is with or without buydowns

---

## Search patterns

Replace `[city]`, `[community]`, `[month]`, `[year]` with the agent's specifics.

**1 — Board stats (run these first)**
- `[city] real estate board statistics [month] [year]`
- `[board acronym] [month] [year] statistics` (CREB / TRREB / GVR / OREB …)
- `[city] housing market report [month] [year]`
- `[city] MLS statistics [month] [year]`

**2 — The headline metrics**
- `[city] benchmark price [month] [year]`
- `[city] average home price [month] [year]`
- `[city] home sales volume [month] [year]`
- `[city] new listings [month] [year]`
- `[city] housing inventory [month] [year]`
- `[city] days on market [month] [year]`
- `[city] months of supply [month] [year]`
- `[city] sales to new listings ratio [month] [year]`

**3 — Community and property type**
- `[community] real estate prices [month] [year]`
- `[city] detached benchmark price [month] [year]`
- `[city] condo market [month] [year]`
- `[city] townhouse prices [month] [year]`
- `[city] new construction starts [year]` (for new-build niches)

**4 — Rates and context**
- `Bank of Canada rate decision [month] [year]` / `Federal Reserve rate decision [month] [year]`
- `mortgage rates [month] [year]` / `Freddie Mac mortgage rate survey [month] [year]`
- `[city] real estate year over year [year]`
- `[city] housing market forecast [year]` *(attribute; never state as fact)*
- `[city] population growth migration [year]`

**5 — What people are asking (doctrine-driven, not a metric)**
- `should I buy in [city] right now [year]`
- `[city] housing market reddit [month] [year]`
- `[city] real estate news [month] [year]`
- Local news comment threads and community forums for the recurring worry of the month

---

## Extraction protocol

For every source you fetch, extract in this shape before using anything from it:

```
SOURCE: [Publication or board name]
URL: [verified URL — actually fetched, not guessed]
DATE PUBLISHED: [date]
DATA PERIOD: [the month/year the figures cover]

EXTRACTED METRICS
- [Metric]: [value] ([YoY change if given])
- [Metric]: [value] ([YoY change if given])

QUOTES / FINDINGS
- [direct quote from a board economist or official, with their name and title]
- [notable trend the source calls out]
```

If a URL 404s, paywalls, or redirects to a generic page, it is not a source. Find another.

---

## Handling gaps

Board releases vary in timing and detail. When something's missing:

1. **Release not out yet** → say so, and offer to run in a few days. Never headline a partial month.
2. **A metric isn't published** → write "not published this month." Never estimate or interpolate.
3. **No community-level data** → note "community-level data isn't published for [X]" and flag it as a
   custom-analysis offer the agent can make on camera.
4. **Only national or provincial data exists for a metric** → use it *with the label attached*:
   "[city]-specific days-on-market wasn't published this month; the provincial average was [X]."
5. **A figure looks wrong** (a 40% jump, a number out of line with every neighbouring month) → check a
   second source before using it. Most such figures are a methodology change or a misread table.
