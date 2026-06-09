---
name: realtor-trending-articles
description: >
  Realtor Trending Article Skill — searches the web for the most relevant, timely real estate
  and market news articles for the agent's specific city and audience, then delivers a batch of
  5 ready-to-record short-form video packages. Each package includes the article link, key stats
  extracted from the article, a word-for-word talking script, bullet points for the agent to riff
  from, and an Instagram/TikTok caption. The agent picks the videos they want to record and hits
  record — no research, no writing, no figuring out what to say.

  Trigger on: "find me articles to record", "give me article video ideas", "find trending real estate
  articles", "what real estate news should I film this week", "find me content to record this week",
  "article video batch", "find articles for my reels", "what's trending in real estate right now",
  "find me short form video ideas from the news", "real estate news batch", "find articles for
  [city] market", or any request where the agent wants Claude to find trending real estate news
  articles and turn them into short-form video scripts they can record.
---

# Realtor Trending Article Skill

When triggered, search the web for the freshest, most relevant real estate news for the agent's
market, select the 5 strongest articles for short-form video content, and deliver a complete
record-ready package for each one.

The agent reads the batch, picks the videos they want to film, and hits record.
Everything else is done.

---

## Before You Start

### Step 1 — Load the Brain

**Read `~/realtor-brain/brain.md` first**, then open what this skill needs:

- `~/realtor-brain/identity/profile.md` — name, city/market, target audience, booking link
- `~/realtor-brain/identity/market.md` — local conditions, price ranges, neighbourhoods served
- `~/realtor-brain/identity/avatars.md` — ideal client, what the audience worries about right now
- `~/realtor-brain/identity/voice.md` — tone, what they never want to sound like, signature phrases, CTA
- `~/realtor-brain/memory/content-log.md` — articles/angles already covered, so the batch stays fresh

The city/market is the primary search parameter. The target audience shapes which articles are
selected. The brand personality shapes how every script is written. **If `~/realtor-brain/` doesn't
exist, tell the agent to run _Realtor AI Brain — Setup_ first.**

### Step 2 — Read Skill Reference Files

1. `references/search-guide.md` — Search queries, sources, freshness rules, what makes a good article
2. `references/script-guide.md` — How to write short-form talking scripts for real estate agents
3. `references/hook-formulas.md` — 10 hook types — use a different one for each video in the batch

---

## Phase 1: Intake

The most natural way to trigger this skill is something like:
- "Find me articles to record this week"
- "What real estate news should I film?"
- "Find me article video ideas for [city]"
- "Find trending real estate articles for my market"

### With the Brain loaded
Go directly to article research. Do not ask questions the Brain already answers.

### If the Brain is missing those fields
Ask:
1. **City / market** — What city and region? (e.g., "Calgary, AB" or "Greater Phoenix area")
2. **Target audience** — Who are they primarily creating content for right now? (buyers / sellers / investors / general local market)

### Optional — agent can specify, but doesn't need to
3. **Topic focus** — Any specific category for this batch? (e.g., "focus on rate news" or "I want neighbourhood content"). If not specified, find the best mix.
4. **Batch size** — How many videos? Default is 5.

---

## Phase 2: Article Research

### Step 1 — Run Web Searches

Search for real-time articles published within the last 7 days. Run ALL search categories below.
Replace [city], [market], [month], and [year] with the agent's specific details.

**Category 1 — Local Market News (most important)**
- `"[city]" real estate market [month] [year]`
- `"[city]" home sales [month] [year]`
- `"[city]" housing market update [year]`
- `"[city]" home prices [month] [year]`
- `"[city]" real estate statistics [month] [year]`
- `[city] real estate board [month] [year]`

**Category 2 — Interest Rates & Mortgage News**
- `Bank of Canada rate decision [month] [year]` (Canada)
- `Federal Reserve rate [month] [year]` (US)
- `mortgage rates Canada [month] [year]` OR `mortgage rates US [month] [year]`
- `fixed rate variable rate forecast [year]`
- `mortgage affordability [city] [year]`

**Category 3 — Buyer & Seller Trends**
- `first time home buyer [city] [year]`
- `housing affordability [city] [year]`
- `seller's market buyer's market [city] [year]`
- `home buying tips [city] [year]`
- `[city] inventory homes for sale [month] [year]`

**Category 4 — National Real Estate News with Local Relevance**
- `Canada housing market [month] [year]` OR `US housing market [month] [year]`
- `CREA housing statistics [month] [year]` (Canada)
- `NAR housing statistics [month] [year]` (US)
- `real estate forecast [year]`
- `housing market outlook [year]`

**Category 5 — Local Development & Neighbourhood News**
- `"[city]" new development real estate [year]`
- `"[city]" new construction homes [year]`
- `"[city]" neighbourhood [year]`
- `"[city]" rezoning OR "new housing policy" [year]`

After running searches, use web_fetch on the 6-8 most promising URLs to read the full article
content before selecting. Do not select an article based on the headline alone.

---

### Step 2 — Extract Article Details (Do Not Skip)

For every article you consider, extract the following before deciding whether to include it:

1. **The key stat or number** — the single most compelling data point
   Example: "Calgary average home price up 4.2% month-over-month" or "Variable rate mortgages now at 5.45%"

2. **The specific claim or finding** — what actually happened
   Example: "CREB reports lowest inventory since March 2022" or "Bank of Canada holds rate for third consecutive meeting"

3. **What this means for buyers OR sellers** — the local implication
   Example: "Buyers in the under $600K range are seeing more competition" or "Sellers can realistically expect 98% of asking in this range"

4. **Any specific numbers, dates, or comparisons** — the detail that makes it real
   Example: "Sales up 12% year-over-year" / "Average 18 days on market vs 31 days last year"

5. **A quotable line** (if one exists) — from a real estate board, economist, or official source

**Minimum threshold:** Each article must have at least 2 of the 5 extraction points above with
specific, usable data. If the article is all vague generalities with no real numbers or named
sources — drop it. The agent cannot record a compelling video from fluff.

---

### Step 3 — Link Verification (Non-Negotiable)

Every link included in the final output must be verified working before delivery.

1. Only use URLs that appeared directly in search results — never guess or construct a URL
2. Fetch every URL with web_fetch and confirm actual article content loads
3. If the fetch returns "404", "page not found", a redirect to homepage, or a paywall with no preview — drop the article immediately and find a replacement
4. A broken link in the output is worse than no link — the agent clicks it, it fails, trust is gone

---

### Step 4 — Select the 5 Best Articles

Choose 5 articles that pass ALL of the following:

**Must have:**
- Published within the last 7 days
- From a credible named source (real estate board, major news outlet, government, recognized industry publication)
- At least 2 specific extraction points (stats, claims, numbers, comparisons)
- A verified working link
- A clear angle the agent can react to and add their own take

**Must avoid:**
- Articles without specific data (no vague "market conditions remain uncertain" pieces)
- Agent or brokerage promotional content
- Duplicate topics (don't pick 3 rate articles — vary the categories)
- Articles from paywalled sources with no preview content

**Selection criteria — rank by:**
1. Local relevance — [city]-specific beats national every time
2. Reaction potential — can the agent add a take, disagree, or contextualize?
3. Audience impact — would a buyer or seller in [city] care about this right now?
4. Stat strength — does it have a number that will stop the scroll?
5. Variety — aim for a mix across the 5 categories above

Once 5 articles are selected, proceed immediately to script writing. Do not pause for approval.

---

## Phase 3: Script Writing

**Read:** `references/script-guide.md` and `references/hook-formulas.md`

For each confirmed article, write a complete short-form video package.

### Hook Variety Rule

Every batch of 5 must use 5 different hook formulas. After writing all hooks, verify no two are
the same pattern. If two match — rewrite one. Refer to `references/hook-formulas.md` for the full
list of formulas.

### Script Structure (For Each Article)

```
HOOK (first 3-5 seconds — the scroll-stopper)
[One punchy line that grabs the target viewer immediately.
Reference the stat or local market directly. City name in the hook when it fits.
Word-for-word — agent reads this exactly.]

CONTEXT (5-10 seconds)
[One or two sentences establishing what happened.
Specific: source name, number, date, city.
No "according to this article" — deliver it like you already know this.]

YOUR TAKE (25-40 seconds — where the value lives)
[2-3 beats. What does this actually mean for a buyer/seller/investor in [city] right now?
Each beat should be something the agent genuinely believes and would say to a client.
Opinionated. Specific. Locally relevant.
This is NOT a news summary — this is the agent's interpretation and advice.]

CTA (5-10 seconds)
[Single clear action. Pull from agent's preferred CTA in `identity/voice.md`.
Default: "Follow for [city] market updates every week" or "Book a free call — link in bio."]
```

### Bullet Point Riff Notes

Below each full script, include 4-6 bullet points the agent can use if they prefer to riff
instead of reading word-for-word. These are the key talking points in shorthand:

```
RIFF NOTES (if you prefer to talk freely):
• [Key point 1 — one line]
• [Key point 2 — one line]
• [Key point 3 — one line]
• [Key point 4 — one line]
• CTA: [one line]
```

### Script Quality Rules

- **Minimum 2 specific details** from the article in every script — stat, name, number, comparison.
  A script that could be written from the headline alone is not acceptable.
- **"You" or "your" appears at least 3 times** in every script. This is content for one viewer, not a broadcast.
- **City name appears at least once** in every script. Local is the differentiator.
- **Agent has an opinion.** Every script must include one moment where the agent takes a position:
  "Here's what I'm telling my clients right now..." / "My honest take on this is..." / "Most people read this as bad news. I disagree."
- **No news anchor language.** "According to...", "A recent report says...", "Experts predict..." — none of these. The agent already knows this. They're sharing it with their audience.

---

## Phase 4: Caption Writing

For each video, write one ready-to-post Instagram and TikTok caption.

**Caption structure:**
- Opens with the hook from the script (adapted for reading)
- 2-3 lines of value or local context
- CTA line matching the agent's primary CTA
- 8-10 hashtags: minimum 2 local (#[City]RealEstate, #[City]Homes), mix of topic + audience tags

**Length:** 100-200 words. Short enough to read before tapping "more."

---

## Phase 5: Compile and Deliver

Present all 5 video packages in sequence. Use this format for each:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
VIDEO [#] OF 5 — [CATEGORY]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ARTICLE
Headline: [exact headline]
Source: [publication] | Published: [date]
Link: [verified URL]
Key stat: [the number to show on screen while filming]

─────────────────────────────────────────
TALKING SCRIPT (word-for-word):

HOOK:
[hook]

CONTEXT:
[context]

YOUR TAKE:
[beat 1]
[beat 2]
[beat 3]

CTA:
[CTA]

Estimated length: [X] seconds

─────────────────────────────────────────
RIFF NOTES (if you prefer to ad lib):
• [point 1]
• [point 2]
• [point 3]
• [point 4]
• CTA: [one line]

─────────────────────────────────────────
CAPTION (copy/paste):

[full caption text]

[hashtags]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

After all 5 packages, add a short filming note:

```
FILMING NOTE:
Pull up the article link on your phone or tablet and hold it or prop it behind you as your
green screen background — or just film talking head with no background. Either works.
Hook is word-for-word. Everything else comes from your experience.
Aim for 30-60 seconds per video. Post to Instagram Reels and TikTok.
```

---

## Phase 6: Write Back to the Brain

**The second law.** Append one row per article video to `~/realtor-brain/memory/content-log.md`
(Status `Scripted`, Format `Short — article`) so next week's batch doesn't resurface the same stories:

```
| [date] | Reels | Short — article | [article headline / angle] | [city/area] | Scripted | [article URL] |
```
(5 rows — one per video package.) Then tell the agent: *"Logged this week's 5 article videos to your Brain."*

---

## Quality Checklist (Run Before Delivering)

### Articles
- [ ] All 5 articles published within the last 7 days
- [ ] All 5 links verified working via web_fetch
- [ ] All 5 articles from credible named sources
- [ ] 5 different categories represented — no duplicate topics

### Scripts
- [ ] Every script contains at least 2 specific details from the article
- [ ] Every script uses "you" or "your" at least 3 times
- [ ] Every script includes the agent's city by name
- [ ] Every script has a genuine agent take — not a news recap
- [ ] No "according to this article" language anywhere
- [ ] All 5 hooks use different formulas — verified against hook-formulas.md
- [ ] At most 2 scripts open with a direct article reference — remaining 3 open differently
- [ ] CTA matches agent's preferred CTA from `identity/voice.md` (or default if not found)

### Captions
- [ ] Every caption opens with the hook adapted for reading
- [ ] Every caption has at least 2 local hashtags (#[City]RealEstate, #[City]Homes)
- [ ] CTA present in every caption

### Variety
- [ ] 5 scripts have meaningfully different hooks, structures, and angles
- [ ] Mix of buyer-facing and seller-facing content across the batch
- [ ] No two scripts feel like the same format repeated
