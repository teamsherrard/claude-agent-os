---
name: realtor-market-update
description: >
  Realtor Market Update Skill — researches and pulls live market data for the agent's specific
  city, communities, and niche, then generates a complete monthly market update package including:
  a visual market update report (for screen share and email distribution), a 15-minute word-for-word
  YouTube script built around the data, and 3 short-form video concepts (article-based, green screen
  background-based, and talking head opinion). Everything is compiled into a single clean, formatted doc.

  Trigger on: "run my market update", "create my market update", "market update for [month]",
  "build my market update package", "monthly market update", "market update video", "generate
  market update", "what's happening in my market", "market stats for this month", or any request
  for a market update report, YouTube market update script, or monthly real estate data package.
  BOUNDARY: if the dedicated Realtor YouTube System plugin is installed, defer to its
  youtube-market-report for the monthly market update video — this skill is the built-in version
  for agents without it.
---

# Realtor Market Update Skill

When triggered, research live market data for the agent's specific city and communities, build a
complete visual market update report, write a 15-minute YouTube script the agent reads while screen
sharing the report, and generate 3 short-form video concepts ready to record.

Everything compiles into one clean, formatted doc the agent uses on camera, sends to their list, and
repurposes into short-form content.

---

## Before You Start

### Step 1 — Load the Brain

Before searching for anything, **read `~/realtor-brain/brain.md`** — it tells you who this agent is
and where their detail lives. Then open the specific files this skill needs:

- `~/realtor-brain/identity/market.md` — the specific city, neighbourhoods, communities, price
  ranges, and niche. **This is the primary input that shapes every search.**
- `~/realtor-brain/identity/voice.md` — tone, what they never want to sound like, signature phrases, CTA
- `~/realtor-brain/identity/profile.md` — name, booking link, socials, brokerage
- `~/realtor-brain/identity/brand-visual.md` — colors and fonts for the report
- `~/realtor-brain/memory/content-log.md` — **what they've already published** (so this month's
  angles don't repeat recent ones)

**This is critical.** An agent who sells luxury condos downtown needs completely different data than
one who sells new construction in the suburbs. Read `market.md` carefully before running a single
search. **If `~/realtor-brain/` does not exist, tell the agent to run _Realtor AI Brain — Setup_
first** — don't proceed with a blank slate.

Never ask the agent for anything already in the Brain.

### Step 1b — Before you publish (always)
- **Compliance:** read `~/realtor-brain/identity/compliance.md`. Append the required brokerage disclaimer
  + license # to every public-facing output, and never make a claim on its "claims to avoid" list. *(If
  `compliance.md` is empty/unset, proceed but flag it to the agent.)*
- **No placeholders:** if any identity file you rely on still contains `[bracketed]` template text, treat
  that field as missing — ask the agent or skip it. **Never output bracketed placeholder text.**

### Step 2 — Read Skill Reference Files

1. `references/data-research-guide.md` — where to find market data, search patterns, what to pull
2. `references/report-guide.md` — how to structure and write the visual market update report
3. `references/youtube-script-guide.md` — how to write the 15-minute screen share YouTube script
4. `references/shortform-guide.md` — how to build the 3 short-form video concepts

---

## Phase 1: Intake

Minimal. With the Brain loaded (Step 1), the skill runs automatically — market, niche, and voice
all come from `identity/`.

### Always ask (month-specific — not in the Brain)
1. **Which month is this update for?** (e.g., "May 2026" — defaults to current month if not specified)

### Check the content log
Scan `memory/content-log.md` for recent market-update content. If last month's talking-head angle
was, say, "contrarian take on prices," pick a *different* angle this month. Note any repeats to avoid.

### Ask only if the Brain is missing it
2. **City / market and communities** — only if `identity/market.md` is blank.
3. **Niche** — only if not in `identity/profile.md` or `market.md`.

### Never ask
Anything about market data, stats, or numbers. Claude finds all of that. And never anything already
in the Brain.

---

## Phase 2: Market Data Research

**Read:** `references/data-research-guide.md`

This is the engine of the entire skill. All downstream outputs — the report, the YouTube script,
and the short-form concepts — are built on the data found here. Do not skip any category.

### Step 1 — Identify Search Targets

From the agent's market knowledge file, build a specific search target list:
- Primary market (city or region)
- Secondary markets or communities (suburbs, neighbourhoods, specific developments)
- Niche filters (luxury tier, new construction, specific property types if applicable)

### Step 2 — Run Data Searches

Search for the most recent available data for the agent's market. Run ALL of the following,
replacing [city], [community], [month], and [year] with the agent's specifics.

**Category 1 — Local Real Estate Board Stats (Most Important)**
- `[city] real estate board statistics [month] [year]`
- `[city] housing market report [month] [year]`
- `CREB [month] [year] statistics` (Calgary)
- `TRREB [month] [year] market watch` (Toronto)
- `REBGV [month] [year] statistics` (Vancouver)
- `[local board name] [month] [year] housing statistics`
- `[city] MLS statistics [month] [year]`

**Category 2 — Key Metrics Searches**
- `[city] average home price [month] [year]`
- `[city] days on market [month] [year]`
- `[city] housing inventory [month] [year]`
- `[city] sales to new listings ratio [month] [year]`
- `[city] benchmark price [month] [year]`
- `[city] home sales volume [month] [year]`

**Category 3 — Community/Neighbourhood Level (if applicable)**
- `[specific community] real estate [month] [year]`
- `[neighbourhood] home prices [year]`
- `[city] [property type] market [month] [year]` (condo, detached, townhouse)

**Category 4 — Context and Comparison**
- `[city] real estate year over year [year]`
- `[city] housing market forecast [year]`
- `Canada housing market [month] [year]` OR `US housing market [month] [year]`
- `Bank of Canada rate [month] [year]` OR `Federal Reserve rate [month] [year]`
- `mortgage rates Canada [month] [year]` OR `mortgage rates [month] [year]`

### Step 3 — Fetch and Extract Data

For every promising search result, use web_fetch to read the full content. Extract:

**Primary metrics (pull every one of these that exists):**
- Average / benchmark / median sale price (current month)
- Average / benchmark / median sale price (same month last year) — for YoY comparison
- Total sales volume (number of homes sold)
- Sales volume vs same month last year
- New listings (month)
- Active listings / total inventory
- Months of supply / months of inventory
- Days on market (average)
- Sale-to-list price ratio
- Any property-type breakdowns (detached, condo, townhouse) if available

**Context metrics (pull if available):**
- Current interest rates / mortgage rate environment
- Rate changes since last month or last year
- Any notable policy, development, or market news affecting the area
- Any economist or board official quotes about market direction

### Step 4 — Organize the Data

Before building anything, organize all extracted data into a clean internal data summary:

```
MARKET: [City/Region]
REPORTING PERIOD: [Month Year]
DATA SOURCE: [Board name, publication, date retrieved]

HEADLINE METRICS:
- Benchmark/Average Price: $[X] ([+/-X%] vs same month last year)
- Sales Volume: [X] sales ([+/-X%] YoY)
- New Listings: [X] ([+/-X%] YoY)
- Active Inventory: [X] listings ([+/-X%] YoY)
- Days on Market: [X] days ([+/-X] days vs last year)
- Sale-to-List Ratio: [X]%
- Months of Supply: [X] months
- Current Rate Environment: [X]% (fixed/variable context)

PROPERTY TYPE BREAKDOWN (if available):
- Detached: $[X] avg, [X] sales, [X] DOM
- Condo/Apartment: $[X] avg, [X] sales, [X] DOM
- Townhouse: $[X] avg, [X] sales, [X] DOM

COMMUNITY/NEIGHBOURHOOD DATA (if applicable):
- [Community 1]: $[X] avg, [X] sales
- [Community 2]: $[X] avg, [X] sales

MARKET CONDITION: [Seller's market / Balanced / Buyer's market] — based on months of supply
NOTABLE: [Any significant trend, quote, or development worth highlighting]
```

Do not proceed to report building until this data summary is complete.

---

## Phase 3: Market Update Report

**Read:** `references/report-guide.md`

The report serves two purposes simultaneously:
1. **Screen share asset** — the agent shares this on screen during their YouTube recording
2. **Email distribution asset** — sent to the agent's list as a standalone market update

It must look clean enough to share publicly and be data-dense enough to be genuinely useful.

### Report Structure

**Page 1 — Cover**
- "[City] Real Estate Market Update"
- Month + Year
- Agent name, photo placeholder, brokerage (from `identity/profile.md`)
- Agent's booking link / CTA

**Page 2 — Market at a Glance**
A single-page snapshot of all headline metrics in a clean visual layout.
Large numbers, minimal text. This is the "money page" — the one they show on camera first.

Metrics to display (each as a large stat with label and YoY change arrow):
- Average/Benchmark Price
- Total Sales
- New Listings
- Active Inventory
- Days on Market
- Sale-to-List Ratio
- Months of Supply
- Market Condition (Seller's / Balanced / Buyer's)

**Page 3 — What the Numbers Mean**
Plain-English interpretation of the data. Written for a buyer or seller, not a data analyst.
3-4 short paragraphs covering:
- Overall market condition and what it means
- What buyers need to know this month
- What sellers need to know this month
- One forward-looking observation or prediction

**Page 4 — Property Type Breakdown (if data available)**
Side-by-side comparison of detached, condo, and townhouse metrics.
If only one property type is relevant to the agent's niche, focus on that.

**Page 5 — Community Spotlight (if agent serves specific communities)**
Key data for each community the agent covers.
1-2 sentences of plain-English commentary per community.

**Page 6 — Rate & Affordability Context**
Current rate environment, what it means for purchasing power.
Example: "At today's rates, a buyer putting 20% down on a $[X] home pays approximately $[X]/month."
Keep this practical — real numbers, not general commentary.

**Page 7 — Agent Commentary & CTA**
Agent's personal take on the market (2-3 sentences in their voice from `identity/voice.md`).
Booking link, contact info, social handles.
"Want to talk about what this means for your specific situation? Book a free call: [LINK]"

---

## Phase 4: YouTube Script (15 Minutes)

**Read:** `references/youtube-script-guide.md`

A word-for-word, teleprompter-ready script the agent reads while screen sharing the market
update report. The script is timed to move through the report page by page so the agent
never has to think about what to say next — they just read and advance slides.

### Script Structure

**INTRO (60-90 seconds)**
Hook — open with the single most compelling stat from this month's data. Not "welcome back."
The first line should make someone stop scrolling.

Example structure:
"[City] just had [surprising stat]. [One-sentence implication]. My name is [Name], I'm a
real estate agent in [City], and every month I break down exactly what's happening in our
market so you know what to expect whether you're buying, selling, or just watching. Let's
get into the [Month] numbers."

**SECTION 1 — Market at a Glance (2-3 minutes)**
Walk through the "Market at a Glance" page.
Read each metric, give it one sentence of context.
End with: "So the headline for [Month] is [one-sentence market summary]."

**SECTION 2 — What This Means for Buyers (2-3 minutes)**
Speak directly to buyers. What do the numbers mean for someone trying to buy right now?
Cover: competition level, price trends, rate environment, strategic advice.
Specific and opinionated — not "it depends." What would this agent tell a buyer who called today?

**SECTION 3 — What This Means for Sellers (2-3 minutes)**
Speak directly to sellers. What do the numbers mean for someone thinking about listing?
Cover: pricing expectations, days on market, demand level, timing advice.
Again — specific and opinionated. What would this agent tell a seller who called today?

**SECTION 4 — Property Type Breakdown (2 minutes)**
Walk through detached, condo, townhouse data if available.
Highlight the most interesting comparison or trend across property types.

**SECTION 5 — Community Spotlight (1-2 minutes, if applicable)**
Quick hits on the specific communities the agent covers.
1-2 sentences per community — what's moving, what's sitting, what's worth watching.

**SECTION 6 — Rate & Affordability (1-2 minutes)**
Current rate environment, real affordability numbers.
"Here's what a $[X] home actually costs per month at today's rates."

**OUTRO (60-90 seconds)**
Summary of the 3 most important takeaways from this month.
Soft sell — what the agent offers, who they help, booking link.
Subscribe ask — "If you want this every month, hit subscribe."
End card direction — "Check out last month's update here" [gesture to end card].

### Script Formatting Rules
- Every section is labeled with a [SCREEN: advance to page X] cue
- B-roll or camera direction noted in [BRACKETS] throughout
- Estimated section times noted at each header
- Agent's name, city, and booking link used as written placeholders throughout
- Written in plain spoken language — how the agent would actually talk, not how they'd write

---

## Phase 5: Short-Form Video Concepts

**Read:** `references/shortform-guide.md`

Generate 3 short-form video concepts pulled directly from the market update data. Each concept
is a different format so the agent has variety in their feed.

### Concept 1 — Article-Based

Find one specific article published within the last 7 days about this market's stats, conditions,
or a related rate/policy story. Write a complete short-form package around it.

Produce:
- Article headline, source, date, verified link
- Key stat from the article to display on screen
- Word-for-word 30-60 second talking script reacting to the article
- Riff notes (4-5 bullet points for agents who prefer to speak freely)
- Instagram/TikTok caption with hashtags

Script angle: The agent reacts to the article with their local expert interpretation.
"Here's what this headline actually means for [city] right now..."

### Concept 2 — Green Screen Background-Based

Write a script designed specifically for green screen delivery — the agent stands in front of
their screen with a data visual behind them. The background shows the key market stats while
the agent walks through them.

Produce:
- Background content description: exactly what data to display on screen behind them
  (which stats, what layout, what numbers — agent can recreate this in Canva or on their phone)
- Word-for-word 30-60 second talking script walking through the on-screen data
- [ON SCREEN: text] callouts throughout the script
- Riff notes
- Instagram/TikTok caption with hashtags

Script angle: The agent as the local data authority. Numbers visible, agent explains what they mean.
"Here are the [Month] numbers for [city] — and here's what they actually mean..."

### Concept 3 — Talking Head Opinion

Based on what the data shows, identify the single strongest opinion angle the agent can take.
Pick the most interesting, counterintuitive, or locally specific insight from this month's numbers
and build a talking head script around it.

Angle options — pick whichever fits the data best (or a different angle entirely if the data tells a stronger story):
- Contrarian take: "Everyone thinks the market is [X]. The data says otherwise."
- Before/after: "[City] 12 months ago vs today — here's what changed."
- Myth buster: "The most common thing I'm hearing from buyers right now is [X]. Here's the truth."
- Prediction: "Based on what I'm seeing in the [Month] data, here's what I think happens next."
- Neighbourhood spotlight: "[Specific community] is doing something the rest of the market isn't."
- Buyer/seller advice: "If I were a [buyer/seller] in [city] right now, here's exactly what I'd do."

Produce:
- Chosen angle and why it fits this month's data
- Word-for-word 30-60 second talking script
- Riff notes
- Instagram/TikTok caption with hashtags

---

## Phase 6: Save as a clean, formatted doc

**Read `${CLAUDE_PLUGIN_ROOT}/shared/doc-formatting.md` first.** Build this as well-structured text (the
grammar in that file), write it to a temp file (e.g. `/tmp/doc.txt`), and render it to a styled `.docx`:
`python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "Market Update · [City] · [Month Year].docx" --title "[City] Market Update — [Month Year]" --subtitle "[Agent] · [City]"`
Then upload the `.docx` via the Drive connector.

### Document Structure

```
COVER PAGE
  [City] Real Estate Market Update — [Month Year]
  Agent name | Date

─────────────────────────
SECTION 1: MARKET UPDATE REPORT
  Page 1 — Cover
  Page 2 — Market at a Glance
  Page 3 — What the Numbers Mean
  Page 4 — Property Type Breakdown
  Page 5 — Community Spotlight
  Page 6 — Rate & Affordability
  Page 7 — Agent Commentary & CTA

─────────────────────────
SECTION 2: YOUTUBE SCRIPT (15 MIN)
  Intro
  Section 1 — Market at a Glance
  Section 2 — What This Means for Buyers
  Section 3 — What This Means for Sellers
  Section 4 — Property Type Breakdown
  Section 5 — Community Spotlight
  Section 6 — Rate & Affordability
  Outro

─────────────────────────
SECTION 3: SHORT-FORM VIDEO CONCEPTS
  Concept 1 — Article-Based
  Concept 2 — Green Screen Background
  Concept 3 — Talking Head Opinion

─────────────────────────
DATA SOURCES
  List of all sources used with URLs and retrieval dates
```

### Formatting (per the doc-formatting standard)
- Title + meta line (city · agent · month-year), then ALL-CAPS section headers each with an em-dash
  divider line above and a blank line below.
- Separate paragraphs with blank lines; `•` bullets, one per line; numbered items each on their own line.
- Script lines each on their own line — never run dialogue together; `[SCREEN CUE]` / `[BRACKET]`
  directions on their own line.
- Stat callouts: the number on its own line with the label under it.
- Script sections set off with a clear label + a divider above and below so each stands out (the
  renderer turns the dividers into real headings).
- No brand colours — every doc renders to one clean neutral standard (visual brand design lives in the agent's design tool).

Upload the rendered `.docx` to the agent's Drive **`Realtor AI Brain` → `exports`** (find-or-create
`exports`), named `Market Update · [City] · [Month Year]`, and tell the agent the location + link.

---

## Phase 7: Write Back to the Brain

**This is the second law — do not skip it.** After the package is built, record what was created so
future runs (and other skills) know it exists and don't repeat it.

Append one row per deliverable to `~/realtor-brain/memory/content-log.md`:
- The **YouTube long-form** (the 15-min market update)
- Each of the **3 short-form concepts** (article-based, green screen, talking head)

Use the existing table format. Status is `Scripted` (these are scripts the agent still has to record):

```
| Date | Platform | Format | Topic / Angle | Listing/Area | Status | Link |
| 2026-06-08 | YouTube | Long-form | [Month] Calgary market update | Calgary NW | Scripted | — |
| 2026-06-08 | Reels   | Short — talking head | [the angle you chose] | Calgary NW | Scripted | — |
```

Then tell the agent plainly: *"Logged to your Brain — next month I'll pick fresh angles so nothing
repeats."* If the agent later publishes, they (or AI Admin) can update Status to `Published` and add the
link.

**Then push to Drive:** run `realtor-brain-sync` (PUSH) so this write survives the session — the local
copy is wiped when the session ends; an unsynced write is a lost write.

### Data
- [ ] All data from named, credible sources (real estate board, major publication, government)
- [ ] All data from the most recent available reporting period
- [ ] Year-over-year comparisons included for every headline metric
- [ ] Data sources listed with URLs at the end of the document
- [ ] If data for a specific community was unavailable, noted clearly rather than omitted silently

### Report
- [ ] Every metric on the "Market at a Glance" page has a YoY comparison
- [ ] "What the Numbers Mean" section written for a buyer/seller — not a data analyst
- [ ] Rate & Affordability section uses real dollar amounts, not just percentages
- [ ] Agent CTA and booking link present on the final page
- [ ] Report works as a standalone document someone could read without watching the video

### YouTube Script
- [ ] Opens with the single most compelling stat — not "welcome back" or "hey guys"
- [ ] Every section has a [SCREEN: advance to page X] cue
- [ ] Buyer section speaks directly to buyers — opinionated, specific, actionable
- [ ] Seller section speaks directly to sellers — opinionated, specific, actionable
- [ ] Agent's city used by name throughout — not "this market" or "locally"
- [ ] Outro includes subscribe ask and end card direction
- [ ] Script reads at approximately 15 minutes (130 words/min = ~1,950 words total)

### Short-Form Concepts
- [ ] Concept 1 article link verified working
- [ ] All 3 concepts use different formats and hook styles
- [ ] Each concept includes word-for-word script + riff notes + caption
- [ ] Green screen concept includes specific on-screen data descriptions
- [ ] Talking head concept angle chosen based on what the data actually shows — not generic

### Voice and Authenticity
- [ ] No "in today's ever-changing market" language anywhere
- [ ] No generic real estate filler phrases
- [ ] Agent's city named specifically throughout — never "locally" or "in this area"
- [ ] Brand voice from `identity/voice.md` applied across all written sections
- [ ] Deliverables logged to `memory/content-log.md` (Phase 7) — angles checked against past content
