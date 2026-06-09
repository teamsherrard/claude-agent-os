# Data Research Guide — Realtor Market Update

## Source Priority by Country

### Canada — National
- CREA (crea.ca) — national monthly housing stats
- CMHC (cmhc-schl.gc.ca) — affordability, rental, housing supply
- Bank of Canada (bankofcanada.ca) — rate decisions
- Better Dwelling (betterdwelling.com) — data analysis and breakdowns
- BNN Bloomberg (bnnbloomberg.ca) — breaking housing and economic news
- Globe and Mail Real Estate — theglobeandmail.com
- Financial Post — financialpost.com

### Canada — Local Boards (Primary Source for City-Level Data)
| City | Board | Website |
|------|-------|---------|
| Calgary | CREB | creb.com/stats |
| Toronto / GTA | TRREB | trreb.ca/the-market |
| Vancouver | REBGV | rebgv.org/market-watch |
| Edmonton | REALTORS Association of Edmonton | realtorsofedmonton.com |
| Ottawa | OREB | oreb.ca/market-statistics |
| Montreal | APCIQ | apciq.ca |
| Hamilton | RAHB | rahb.ca |
| London | LSTAR | lstar.ca |

### United States — National
- NAR (nar.realtor) — monthly existing home sales, median prices
- Realtor.com Research (realtor.com/research)
- Zillow Research (zillow.com/research)
- CoreLogic (corelogic.com)
- HousingWire (housingwire.com)
- Federal Reserve (federalreserve.gov)
- Freddie Mac (freddiemac.com) — weekly mortgage rate survey

### United States — Regional
- State Realtor association press releases
- Local MLS data releases
- City-specific newspapers with real estate sections

---

## What Data to Pull

### The 8 Headline Metrics (Pull All of These)

| Metric | Why It Matters |
|--------|---------------|
| Benchmark / Average / Median Price | Most-watched number — buyers and sellers lead with this |
| YoY Price Change | Context — is this higher or lower than a year ago? |
| Total Sales Volume | How active is the market? |
| YoY Sales Change | Momentum — is activity increasing or decreasing? |
| New Listings | Supply entering the market |
| Active Inventory | Total available supply right now |
| Days on Market | How fast homes are selling — key demand signal |
| Months of Supply | The single best indicator of market condition |

### Market Condition Guide (Based on Months of Supply)
- Under 2 months → Strong seller's market
- 2-3 months → Seller's market
- 3-4 months → Balanced market (slight seller favour)
- 4-6 months → Balanced market
- 6+ months → Buyer's market

### Secondary Metrics (Pull If Available)
- Sale-to-list price ratio
- Property type breakdowns (detached, condo, townhouse)
- Absorption rate
- New construction activity
- Rental vacancy and rates (if relevant to agent's niche)

---

## Data Extraction Protocol

For every source you fetch, extract data in this format before using it:

```
SOURCE: [Publication name]
URL: [Verified URL]
DATE PUBLISHED: [Date]
DATA PERIOD: [Month/Year the data covers]

EXTRACTED METRICS:
- [Metric]: [Value] ([YoY change if available])
- [Metric]: [Value] ([YoY change if available])

NOTABLE QUOTES OR FINDINGS:
- [Any direct quote from board economist or official]
- [Any notable trend or commentary]
```

---

## Handling Data Gaps

Real estate board data releases vary by timing. If the exact month's data isn't published yet:

1. Use the most recent available month and note clearly in the report: "Data as of [Month Year]"
2. Do not fabricate or estimate numbers — only use what was actually published
3. If a specific community doesn't have publicly available data, note "data not publicly available
   for this community" rather than omitting it silently
4. If only national or provincial data is available for some metrics, use it with context:
   "While [city]-specific DOM data wasn't available this month, the national average was [X]"

---

## Affordability Calculation

For the Rate & Affordability section, calculate real monthly payment examples:

**Formula (approximate):**
Monthly payment = (Price × (1 - down payment %)) amortized over 25 years at current rate

**Standard examples to include:**
- Entry-level home in the agent's market at 5% down (or minimum down)
- Mid-range home at 20% down
- Use current posted 5-year fixed rate (or variable if more relevant)

Keep it simple and practical. The goal is for a buyer to read it and immediately understand
what their budget means in real monthly dollars in this specific market.

---

## Freshness Rules

| Data Age | Status |
|----------|--------|
| Current month's board release | Ideal |
| Previous month (if current not yet released) | Acceptable — note clearly |
| 2+ months old | Only use for context/comparison, never as headline data |
| Forecasts and predictions | Always attribute to source, never state as fact |
