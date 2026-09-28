---
name: shortform-search-research
description: >
  Short-Form Search Demand Research — finds what buyers, sellers, and people relocating to the agent's market
  are actually searching and asking online right now, sorted into buyer / seller / relocation demand, graded
  by how much evidence there is behind each one, and marked reel-ready (answerable in 30–60s) or too-big
  (a series). It never invents search volume — it grades by real evidence and cites where it saw each one.
  Step 1 of the short-form strategy pipeline: its report feeds `shortform-video-plan` and `shortform-ideas`.
  Text only; never posts.

  Trigger on: "run my short form research", "short form search research", "search demand", "what are people
  searching in my market", "keyword research", "what are buyers asking right now", "what should I make videos
  about", "demand report", "what's my market searching", or any request to map local search demand for
  short-form content. (A quick daily article to react to = shortform-greenscreen; performance + competitors =
  shortform-analytics.)
---

# Short-Form Search Demand Research (strategy pipeline, step 1)

Find what people in the agent's market are actually typing and asking online **this month** — then hand back a
report the plan turns into a month of reels. Everything aimed at short-form: questions one person can answer
in **30–60 seconds** on a phone.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`); weigh against
`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md` (reach vs niche, locals-not-agents).

## Step 1 — Load the Brain
**If `~/realtor-brain/` is empty** (fresh session/project), pull it first with **realtor-brain-sync**; only if
the cloud has none, run Brain Setup. Read `brain.md`, `identity/profile.md` (city, niche), `identity/market.md`
(communities + local terms), `identity/avatars.md`. Never re-ask what the Brain answers.

## Step 2 — Research the real demand (never from memory)
Use the live data connection where present (`${CLAUDE_PLUGIN_ROOT}/shared/composio-data-engine.md` — search /
trends / news) and web search. Look, noting where each finding came from:
- **Search autocomplete** — after "moving to [city]", "living in [city]", "buying a house in [city]",
  "selling my house in [city]", "[city] vs [nearby city]".
- **"People also ask"** boxes; **forums** (Reddit r/[city], r/FirstTimeHomeBuyer; local FB groups);
  **YouTube** titles + comments for "[city] real estate" / "moving to [city]"; **local news + the board's
  latest report** (what the market is forcing people to ask — rates, inventory, a development, a bylaw).

**HONESTY RULE:** you cannot see true search volume and have no keyword tool. **Never invent a number.** Grade
by evidence found — **HIGH** (autocomplete AND repeated in forums/comments) · **MEDIUM** (one place, or a few
times) · **LOW/EMERGING** (once, or brand-new this month). Mark each **REEL-READY** (<60s honest answer) or
**TOO BIG** (a series). If live search/web isn't available, say so plainly and stop — don't guess.

## Step 3 — Build the report (use these exact section names)
- **THIS MONTH'S HEADLINE** — one sentence: what the market is making people ask, and what changed.
- **BUYER SEARCHES** — 8–12 phrases, each: phrase in their words · demand grade · reel-ready/too-big ·
  evidence (where you saw it) · the real worry underneath.
- **SELLER SEARCHES** — 6–10, same format.
- **RELOCATION SEARCHES** — 8–12 from people moving TO the market ("[city] vs [other]" + cost-of-living =
  highest intent), same format.
- **THE QUESTIONS NOBODY IS ANSWERING** — 3–5 things asked repeatedly that local agents/media cover poorly —
  the gap worth owning, where the plan aims first.
- **SOURCES** — every place you searched, linked.

## Step 4 — Save + hand off
Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: render to a styled `.docx` (`render_doc.py`) →
`[Agent Name] — Short-Form System/Performance/`, named `[YYYY-MM] · Short-Form Search Demand Report`. Deliver
the same content in chat (the next skill reads it). Close: *"That's what your market is asking this month. Say
'build my short-form plan' and I'll turn this into your next 30 days."*

## Rules
- **Real phrasings only** (write the search the way a person types it); every term carries its evidence; never
  invent volume/rankings/traffic.
- **Fair housing** (`identity/compliance.md`): lifestyle, cost, commute, amenities — never demographics,
  "good/bad" areas, or schools as code.
- Text only — research and write; never post, send, or schedule.

## Quality checklist
- [ ] Brain loaded (pulled first if empty); nothing re-asked
- [ ] Every term graded by real evidence + cited; no invented numbers; reel-ready/too-big marked
- [ ] The "questions nobody is answering" gap list included
- [ ] Fair-housing safe; saved to Drive as `.docx`; pointed to `shortform-video-plan`
