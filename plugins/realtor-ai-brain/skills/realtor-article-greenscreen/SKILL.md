---
name: realtor-article-greenscreen
description: >
  Realtor Article Green Screen Skill — finds trending real estate and market news articles
  relevant to the agent's local market, then generates a batch of 9:16 PNG green screen
  backgrounds and word-for-word talking scripts so the agent can record straight over them
  as Instagram Reels or TikToks. The agent triggers this by asking for a "new batch of article
  videos", "green screen articles", "trending article backgrounds", "what should I record today",
  or any request for article-based short form content. Reads the agent's Brain automatically
  if present (market, brand, persona) to ensure every background and script is locally relevant
  and on-brand. Designed for real estate agents who are beginners — outputs are word-for-word
  ready to record with zero editing needed.
---

# Realtor Article Green Screen Skill

When triggered, this skill finds the most relevant trending real estate and market news for the
agent's city, selects the best articles for short-form video content, generates a branded 9:16
PNG green screen background for each, and writes a complete word-for-word talking script the
agent reads to camera while the background plays behind them.

The agent records. The skill does everything else.

---

## Before You Start

### Step 1 — Load the Brain

**Read `~/realtor-brain/brain.md` first**, then open what this skill needs:

- `~/realtor-brain/identity/profile.md` — name, city/market, target audience, booking link, socials
- `~/realtor-brain/identity/avatars.md` — ideal client, what the audience worries about
- `~/realtor-brain/identity/market.md` — local neighbourhoods, current market conditions
- `~/realtor-brain/identity/voice.md` — tone, what they never want to sound like, CTA
- `~/realtor-brain/identity/brand-visual.md` — colors, tagline for the backgrounds
- `~/realtor-brain/memory/content-log.md` — articles/angles already covered, to keep the batch fresh

Apply this context to every article search, background, and script. The city/market is the primary
search target; the voice shapes every script's tone and CTA. **If `~/realtor-brain/` doesn't exist,
tell the agent to run _Realtor AI Brain — Setup_ first.**

### Step 1b — Before you publish (always)
- **Compliance:** read `~/realtor-brain/identity/compliance.md`. Append the required brokerage disclaimer
  + license # to every public-facing output, and never make a claim on its "claims to avoid" list. *(If
  `compliance.md` is empty/unset, proceed but flag it to the agent.)*
- **No placeholders:** if any identity file you rely on still contains `[bracketed]` template text, treat
  that field as missing — ask the agent or skip it. **Never output bracketed placeholder text.**

### Step 2 — Read Skill Reference Files

1. `references/article-sources.md` — Where to find trending real estate articles by market type
2. `references/script-guide.md` — How to write green screen talking scripts for real estate agents
3. `references/background-templates.md` — Visual layout rules for the 9:16 PNG backgrounds

---

## Phase 1: Intake

Keep this minimal. The agent should be able to trigger this with one message.

### Default trigger (no extra input needed once the Brain is set up)
If the agent's city and target audience are in the Brain, go straight to article finding.
Do not ask questions the Brain already answers.

### Ask only if the Brain is missing it

1. **City / market** — What city or region are they covering? (e.g., "Calgary, AB" or "Greater Austin area")
2. **Target audience for this batch** — Buyers, sellers, investors, or general local market? (default: mixed)

### Optional customization (agent can specify, but doesn't have to)

3. **Topic focus** — Any specific category they want this batch to focus on? (e.g., interest rates, new developments, neighbourhood news, market stats). If not specified, find the most timely and relevant mix.
4. **Number of videos** — How many article videos in this batch? Default is 5.

---

## Phase 2: Article Research

### Step 1 — Find Trending Articles

Search for real-time trending articles relevant to the agent's market. Use web search to find
articles published within the last 7 days. Prioritize recency — stale news makes the agent look
out of touch.

**Search queries to run (adapt city/market from agent's profile):**

Primary searches:
- `"[city] real estate" news [current month] [year]`
- `"[city] housing market" [current month] [year]`
- `"[city] home prices" OR "home sales" [current month] [year]`
- `Canada real estate news [current month] [year]` OR `US real estate news [current month] [year]`
- `mortgage rates [current month] [year]`
- `housing market [current month] [year]`

Supplementary searches (run if primary results are thin):
- `"[city] new development" OR "new construction" [year]`
- `"[city] real estate forecast" [year]`
- `first time home buyer news [current month] [year]`
- `Bank of Canada rate` OR `Federal Reserve rate` [current month] [year]`

**Article quality criteria — only include articles that pass ALL of these:**
- Published within the last 7 days (hard cutoff — no older articles)
- From a credible source (major news outlet, real estate board, government, recognized industry publication)
- Contains specific data, stats, or a clear market insight the agent can react to
- Relevant to buyers, sellers, or investors in the agent's market
- Has a clear angle the agent can comment on — not just a press release or listing announcement

**Sources to prioritize:**
- Local city news outlets and newspapers
- Real estate board press releases (CREA, TRREB, CREB, CAR, NAR, local boards)
- BNN Bloomberg, Globe and Mail, CBC Real Estate, Financial Post (Canada)
- Realtor.com, Zillow Research, HousingWire, Inman News (US)
- Bank of Canada, CMHC, Federal Reserve announcements
- Local city government planning and development news

**Sources to avoid:**
- Agent or brokerage blogs (too promotional)
- Articles without a specific data point or insight
- Opinion pieces with no factual anchor
- Articles older than 7 days

### Step 2 — Select the Best Articles for Video

From your search results, select the top articles based on:

1. **Relevance to the agent's specific market** — local > national
2. **Reaction potential** — can the agent add their own take, disagree, or contextualize it?
3. **Audience impact** — would a buyer, seller, or homeowner in that city care about this right now?
4. **Visual simplicity** — the key stat or headline fits cleanly on a background (avoid articles that require 3 paragraphs of context)
5. **Variety** — don't select 5 articles on the same topic. Mix categories: market stats, rates, local news, buyer/seller advice, policy

Default batch = 5 articles. Each article becomes one video.

### Step 3 — Show Article Selection for Approval

Before generating any backgrounds or scripts, present the selected articles to the agent for approval.

Format:
```
Here are the 5 articles I found for this batch. Let me know if you want to swap any out before I build the backgrounds and scripts.

ARTICLE 1
Headline: [exact headline]
Source: [publication name]
Published: [date]
Link: [URL]
Why this works: [1 sentence — why this is a strong video topic for their market]
Video angle: [1 sentence — how the agent will frame it]

ARTICLE 2
[same format]

[...continue for all articles]

Ready to generate? Or swap any articles first?
```

Do not proceed to background generation until the agent confirms.

---

## Phase 3: Background Generation

For each approved article, generate one 9:16 PNG green screen background.

**Read:** `references/background-templates.md`

### Background Content Rules

Each background displays the article headline, source, and key data point — giving the viewer
context while the agent talks over it. The agent's face appears in front of the background via
green screen. The background is the "evidence" — the agent is the commentary.

**Every background must include:**

1. **Source badge** — publication name + logo placeholder in top corner
2. **Article headline** — shortened to fit, max 12 words, headline case
3. **Key stat or pull quote** — the single most compelling data point from the article, large and bold
4. **Agent commentary zone** — a subtle visual cue showing where the agent will appear (left or right side, 40% of frame)
5. **Agent branding** — agent name and city in footer, pull colors from `identity/brand-visual.md`

**Layout logic:**
- Agent appears on the LEFT side of frame → content stacks on the RIGHT
- Agent appears on the RIGHT side of frame → content stacks on the LEFT
- Alternate left/right across the batch so the videos look varied in the feed
- Keep the agent zone clear — no text, no cards in the 40% where their face will be

### Background Templates

**Template 1 — Stat Spotlight (dark)**
Dark background (#111111), bold white headline, large gold stat callout, source badge top right.
Best for: Market data articles, price changes, rate announcements, inventory reports.

**Template 2 — Breaking News (dark with accent bar)**
Dark background with a colored left-border accent bar in the agent's brand color.
Bold "BREAKING" or source label at top. Headline large and centered. Stat below.
Best for: Rate announcements, policy changes, unexpected market shifts.

**Template 3 — Local Spotlight (clean light)**
White/off-white background, dark text, city name prominent at top, headline below.
Clean and readable. Source badge top left. Key stat in brand accent color.
Best for: Local market updates, neighbourhood news, city-specific data.

**Template 4 — Quote Card (dark)**
Large pull quote from the article centered on screen. Source attribution below.
Minimal layout — the quote does the work.
Best for: Expert predictions, market outlook quotes, surprising statements from officials.

**Template 5 — Stats Stack (dark)**
Multiple stats from the same article displayed as a vertical stack of data points.
Agent reacts to each one.
Best for: Monthly market reports, board statistics releases, multi-data-point articles.

### Template Selection Rule

Pick the template that best matches the article type. Never use the same template twice in a batch
of 5 — vary the visual style so the feed looks diverse. If the agent has brand colors in their
Brain (`identity/brand-visual.md`), apply them as the accent color on every background.

### Background Generation Process

**Read:** `/mnt/skills/public/frontend-design/SKILL.md` before writing any code.

Generate each background as a 1080×1920px PNG (9:16 ratio) using Python with Pillow or a
bash/SVG approach as defined in the frontend design skill. Save to `/home/claude/outputs/` with
descriptive filenames:

`[city-slug]_[topic-slug]_[template-name].png`

Example: `calgary_inventory-drop_stat-spotlight.png`

---

## Phase 4: Script Generation

**Read:** `references/script-guide.md`

For each background, write a complete word-for-word talking script the agent reads to camera
while standing in front of their green screen.

### Script Rules

- **Length:** 30-60 seconds (75-150 words). Agents are beginners — shorter is better.
- **Structure:** Hook (5 sec) → Context (10 sec) → Agent's take (30 sec) → CTA (10 sec)
- **Tone:** Pull from `identity/voice.md`. Default: warm, credible, local expert.
- **Never say:** "According to this article..." / "I just read that..." / "A news story says..."
  The background shows the article — the agent should sound like they already know this, not like they're reading a news report.
- **Always say:** The agent's city/market by name. Speak directly to their specific audience.
- **The take:** Every script must include the agent's reaction or interpretation — not just the stat. What does this mean for a buyer in [city] right now? What should a seller do with this information? This is what separates the agent from anyone else reposting the article.

### Script Structure (Every Script)

```
HOOK (first 5 seconds — stop the scroll)
[One punchy line that connects the article to something the viewer cares about.
Reference the stat or headline directly. City name in the hook when possible.]

CONTEXT (10 seconds)
[Set up the article in 1-2 sentences. What's happening, where, and when.
No "according to" language — deliver it like you already know this.]

YOUR TAKE (30 seconds — this is the value)
[Agent's interpretation. What does this actually mean for buyers/sellers/investors
in [city]? What would you tell a client who asked you about this today?
This is conversational, opinionated, and specific. Not a news recap.]

CTA (10 seconds)
[Single clear action. Match to agent's primary CTA from `identity/voice.md`.
Options: "Book a free call — link in bio" / "Follow for [city] market updates every week" /
"DM me and I'll tell you exactly what this means for your situation"]
```

### On-Screen Text Callouts

For each script, include 2-3 `[ON SCREEN: text]` suggestions in brackets within the script.
These display as text overlays in the editing app (CapCut, Reels, etc.) while the agent talks.
Use for: key stats, city names, key phrases. Max 6 words per callout.

---

## Phase 5: Caption Generation

For each video (background + script pair), write one ready-to-post Instagram/TikTok caption.

### Caption Rules
- 100-200 words
- Opens with the hook from the script (adapted for reading, not watching)
- 2-3 lines of value or context
- CTA matching the agent's primary CTA
- 8-10 hashtags: mix of local (#[City]RealEstate, #[City]Homes) + topic + audience

---

## Phase 6: Compile and Deliver

### Output Per Video (×5 by default)

For each article:
- 1 × 9:16 PNG background (saved to `~/realtor-brain/exports/`)
- 1 × word-for-word talking script
- 1 × ready-to-post caption with hashtags

### Final Delivery Format

Present each video package clearly:

```
─────────────────────────────────────
VIDEO 1 OF 5
Article: [Headline]
Source: [Publication] | Published: [Date]
Template: [Template name]
─────────────────────────────────────

BACKGROUND: [present file]

TALKING SCRIPT (read word-for-word to camera):

HOOK:
[hook text]

CONTEXT:
[context text]

YOUR TAKE:
[take text]

CTA:
[CTA text]

[ON SCREEN suggestions noted inline]
Estimated runtime: [X] seconds

─────────────────────────────────────

CAPTION (copy/paste for Instagram & TikTok):

[full caption]

[hashtags]

─────────────────────────────────────
```

Repeat for all 5 videos. Present all backgrounds using the present_files tool.

---

## Phase 7: Write Back to the Brain

**The second law.** Append one row per article video to `~/realtor-brain/memory/content-log.md`
(Status `Scripted`, Format `Short — green screen`) so the next batch doesn't resurface the same stories:

```
| [date] | Reels | Short — green screen | [article headline / angle] | [city/area] | Scripted | [article URL] |
```
(One row per video.) Then tell the agent: *"Logged this batch to your Brain."*

---

## Quality Checklist (Run Before Delivering)

### Articles
- [ ] All articles published within the last 7 days
- [ ] All articles from credible, named sources
- [ ] 5 different topic categories represented — no duplicates
- [ ] Agent confirmed the selection before generation began

### Backgrounds
- [ ] All backgrounds are 1080×1920px (9:16)
- [ ] No two backgrounds use the same template
- [ ] Left/right agent zone alternated across the batch
- [ ] Agent branding (name, city) present in footer of every background
- [ ] Brand colors from `identity/brand-visual.md` applied (or neutral default if not found)
- [ ] Agent zone (40% of frame) is clear of text and cards

### Scripts
- [ ] Every script is 30-60 seconds (75-150 words)
- [ ] Every script includes the agent's city by name
- [ ] No "according to this article" language anywhere
- [ ] Every script has a genuine agent take — not just a news recap
- [ ] CTA matches the agent's primary CTA from `identity/voice.md`
- [ ] On-screen text callouts included for each script

### Captions
- [ ] Each caption opens with the hook from the script
- [ ] CTA present in every caption
- [ ] Hashtags include at least 2 local tags ([City]RealEstate, [City]Homes)

### Variety
- [ ] 5 backgrounds look visually distinct from each other
- [ ] 5 scripts have different hooks and angles — not the same format repeated
- [ ] Mix of buyer-facing and seller-facing content in the batch
