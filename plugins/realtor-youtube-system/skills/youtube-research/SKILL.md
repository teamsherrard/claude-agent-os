---
name: youtube-research
description: The Research Engine for the Realtor YouTube System. Gathers what's happening in the agent's specific market and niche right now — local real estate market data, local + lifestyle news, and rising search trends — and synthesizes a Research Brief that feeds Ideation and the Coach. Reads the agent's AI Brain for market, communities, niche, price band, and avatars so research is always local and specific, never generic. Runs fresh whenever the agent asks for ideas, or on demand. Triggers on "run my research", "what's happening in my market", "weekly research", "market research", "what's new in [city]", or as a step inside the optional Monday Kickoff when it is enabled.
---

# Research Engine

Know exactly what's happening in THIS agent's market + niche right now, so Ideation can turn it into
timely, locally-specific video ideas. Output = a fresh **Research Brief** (delivered in chat — not stored
as a spreadsheet; the system regenerates it live).

> **Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`). Research is
> **search-intent-first** (the S in S.E.A.R.C.H., §3): lead with what the agent's future buyer/seller is
> actually typing — the exact questions (§3 "E"), not clever angles. For any topic worth a video, run the
> **competitive audit** (§11.5, §16.4): pull the top 3–5 ranking videos and note title / thumbnail / hook /
> structure / local specificity / what's missing — so the agent can beat them. When you read existing videos,
> classify them by **intent** (§23.4: awareness · trust-building · high-intent lead-gen · niche authority ·
> underperformers needing a title/thumbnail fix). Carry §16's "what makes a title win" into the signals.

## Step 1 — Read the AI Brain (scope the research)
Read the AI Brain + YouTube Layer for:
- City / metro + the specific **communities** the agent serves
- Country (US vs Canada) → picks the right data sources
- Niche + **price band** (only research relevant segments)
- Avatars — their questions, fears, and where they're moving from
- The **active Game Plan pillars + goal** (from the YouTube Layer) — scope research to advance those (house rules #10)
Research is ALWAYS scoped to this agent. Never return generic national filler.

## Step 2 — Gather across three lanes
Use web search + fetch. See `references/research-method.md` for sources (Canada vs US) and exact query patterns.

1. **Market data** — latest local stats (benchmark/median price, sales, inventory, months of supply,
   days on market, YoY change), mortgage rate / affordability, and — for new-construction niches —
   new community launches, builder incentives, and starts.
2. **Local & lifestyle news ("mayor of the town")** — new developments, infrastructure, schools,
   transit, population growth, notable new businesses/events — per community the agent serves.
3. **Rising search trends** — what people are increasingly searching about the market, relocation, and
   the niche (Google Trends-style signals + trending questions). Capture the **exact questions** buyers/sellers
   ask (§3 "E") — they become titles.
4. **Competitive audit** (§11.5, §16.4) — for the strongest topic candidates, search the topic on YouTube and
   review the **top 3–5 ranking videos**: title, thumbnail, hook, structure, local specificity, and what's
   missing — so the agent can make a more specific, clearer, more locally-useful version that beats them.

## Step 3 — Rules (non-negotiable)
- **Always capture SOURCE + DATE** for every stat or claim. Flag anything older than ~60 days as stale.
- **Never invent numbers.** If a figure can't be verified, say "unverified" rather than guess.
- Prefer authoritative local sources (real estate board, municipal, reputable local news).
- Stay scoped to the agent's communities + niche + price band. Cut national noise that doesn't apply.

## Step 4 — Output: the Research Brief
Produce it in the format in `references/research-method.md`. It MUST end with **"Signals for ideas"** —
the handful of most content-worthy hooks this week's research surfaced. That section is what the Idea
Engine consumes.

## Modes
- **At ideation time** — runs fresh as the first invisible step whenever the agent asks for ideas.
- **On-demand** — "what's happening in my market?" / "anything new in [community]?"

## Hand-off
The Research Brief feeds → **Ideation** (turns signals into ranked ideas) and the **Coach**
(market context for advice). Deliver it to the agent in chat; do not store it as a file.
