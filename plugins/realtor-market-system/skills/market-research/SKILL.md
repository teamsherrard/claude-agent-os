---
name: market-research
description: >
  The data engine of the Monthly Market System — pulls this month's live LOCAL market numbers for the
  agent's city, communities, and niche, verifies every figure against a named source with a date, and
  writes one clean data block to the Brain that every other market skill quotes. Covers prices, sales,
  new listings, inventory, months of supply, days on market, sale-to-list, property-type and community
  breakdowns, the rate environment, real affordability math, and what local buyers and sellers are
  actually asking right now. Researches once per month so nothing downstream ever re-searches or
  disagrees. Never estimates, never forecasts as fact.

  Trigger on: "pull my market data", "get this month's numbers", "research my market", "what are the
  numbers this month", "market stats for [month]", "refresh my market data", "what's happening in my
  market", or as the first step of a full monthly run.
---

# Market Research

This is the engine. Every other piece in the month — the report, the script, the shorts, the graphic,
the newsletter — is built on what you find here, and none of them are allowed to search on their own.
Get this right and the month is right.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — above all #3: sourced and
dated, or it doesn't ship.
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — the timing rule (§2),
the 8 headline metrics (§5), market condition (§6), freshness (§7), affordability (§8).

**Read `references/data-sources.md`** — the source priority by country, the local board table, the
search patterns, and the extraction protocol.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/market.md` — **the primary input.** The city, the named communities, the price ranges,
  the niche. An agent selling luxury condos downtown needs completely different data than one selling
  new builds in the suburbs. Read this carefully before running a single search.
- `identity/profile.md` — city, region, country (country decides the source set).
- `memory/market-data.md` — last month's block, so you can compare and spot what actually changed.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop. If `market.md`
is blank, ask only for the city and the communities — nothing else.

## Step 2 — Settle the period
Apply the timing rule: **the previous complete month is the data; the current month goes in the
title.** Say it in one plain line and move on.

If the board release for that month hasn't dropped yet, say so plainly and offer to run it in a few
days rather than shipping stale headline numbers. Don't quietly fall back a month without saying so.

---

## Phase 1 — Build the search target list

From `identity/market.md`, write down before searching:
- **Primary market** — the city or region the board reports on.
- **Secondary targets** — the named communities, suburbs, or developments the agent actually sells in.
- **Niche filters** — property type, price tier, new construction, whatever narrows it to their business.

## Phase 2 — Run the searches

Work through every category in `references/data-sources.md`. Start with the **local real estate board**
— that is the primary source and outranks every news article about it. Then rates, then context.

Do not stop at search snippets. **Fetch the actual release** (web_fetch) and read the real figures.
A number lifted from a headline is a number you can't defend.

## Phase 3 — Extract and verify

For every source, extract in the protocol format from `references/data-sources.md`: source name, URL,
publication date, the period the data covers, the metrics, and any economist or board-official quote
worth using.

Then verify:
- Every headline metric has a **YoY comparison** — a number with no context is half a number.
- Two sources disagree → use the local board and note which you used.
- A metric wasn't published → write "not published this month." **Never estimate.**
- Community-level data isn't public → say so, and note it as a custom-analysis opportunity rather
  than dropping it silently.

## Phase 4 — What people are actually asking

Numbers alone don't tell you the angle. Spend a few searches on the *questions* in this market right
now — local news comment sections, community forums, r/[city] threads, recent local articles, "should
I buy in [city] right now" style searches. Pull **3–5 real questions or worries** buyers and sellers
in this market are voicing this month.

This is what makes the script sound like a local instead of a data feed, and it's where the shorts'
hooks come from. Quote the sentiment, never a private individual.

## Phase 5 — Do the affordability math

Per doctrine §8, convert the current rate into real monthly payments for this market's actual price
points. Two or three examples, labelled approximate, excluding taxes and fees. Show the same home at
last year's rate where the comparison is striking.

## Phase 6 — Write the data block

Append **one block per month, newest at the top**, to `~/realtor-brain/memory/market-data.md`
(find-or-create the file). This is the source of truth for the whole month:

```
## [Month Year]   ·   data period: [Month Year covered]   ·   pulled: [YYYY-MM-DD]

MARKET: [City / region]
PRIMARY SOURCE: [Board name] — [URL] — released [date]

HEADLINE METRICS
| Metric | This period | vs same month last year |
|---|---|---|
| Benchmark / average price | $[X] | [+/-X%] |
| Sales volume | [X] | [+/-X%] |
| New listings | [X] | [+/-X%] |
| Active inventory | [X] | [+/-X%] |
| Days on market | [X] | [+/-X days] |
| Months of supply | [X] | [+/-X] |
| Sale-to-list ratio | [X]% | [+/-X pts] |

MARKET CONDITION: [Seller's / Balanced / Buyer's] — from [X] months of supply (doctrine §6)
THE HEADLINE: [the one-sentence story of this month]

PROPERTY TYPES
| Type | Price | YoY | Sales | DOM |
|---|---|---|---|---|
| Detached | … | … | … | … |
| Condo / apartment | … | … | … | … |
| Townhouse | … | … | … | … |

COMMUNITIES
| Community | Price | YoY | Note |
|---|---|---|---|
| [name] | … | … | … |
(or: "community-level data not published for [X] this month")

RATES + AFFORDABILITY
- Current [5-yr fixed / 30-yr fixed]: [X]% — [source, date]
- Change since last month / last year: [X]
- What the [Bank of Canada / Federal Reserve] signalled: [one line, attributed]
- $[price] home | [X]% down | [X]% rate | ≈ $[monthly]/month
- $[price] home | [X]% down | [X]% rate | ≈ $[monthly]/month

WHAT PEOPLE ARE ASKING (Phase 4)
1. [real question or worry]
2. …

NOTABLE
- [board economist quote, policy change, development, or trend worth calling out]

NOT AVAILABLE THIS MONTH
- [any metric that wasn't published, named plainly]

SOURCES
- [Publication] — [URL] — retrieved [date]
```

Then **push the Brain to Drive** (`realtor-brain-sync`). An unsynced write is a lost write.

## Phase 7 — Save + report back

Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: create the month folder
(`YYYY-MM · [Month Year]`) inside `[Agent Name] — Market Updates/`, render the same block to a styled
`.docx`, and save it as `Market Data — [Month Year]`. This folder is the one every other skill reuses.

Then tell the agent the month in **three plain lines** — the headline, the condition, and the one
number that matters most this month — and offer to keep going into the report.

## Quality checklist
- [ ] `identity/market.md` read; searches scoped to their real city, communities, and niche.
- [ ] Timing rule applied and stated; data period named explicitly.
- [ ] Local real estate board used as the primary source, and fetched — not read off a headline.
- [ ] All 8 headline metrics pulled, or named as not published.
- [ ] Every headline metric has a YoY comparison.
- [ ] Market condition derived from months of supply, not vibes.
- [ ] Rate figure sourced and dated; affordability converted to real monthly dollars.
- [ ] 3–5 real local questions or worries captured.
- [ ] Nothing estimated, interpolated, or forecast as fact.
- [ ] Every figure traceable to a named source with a URL and a retrieval date.
- [ ] Data block written to `memory/market-data.md` and the Brain pushed to Drive.
- [ ] Month folder created; `Market Data — [Month Year]` saved into it.
