---
name: shortform-ideas
description: >
  Answers the question that actually stops agents filming — "what do I make a video about?" Turns the agent's
  market, niche, and listings into 20 specific short-form video ideas, each with the angle, the format to film
  it in, and who it's for, sorted into four weeks with the three to film first called out — plus the ideas that
  work as a recurring series and the ones to skip. Works standalone, or reads a Search Demand Report if one
  exists. Hands the picks to `shortform-scripts`. Text only; never posts.

  Trigger on: "reel ideas", "shortform ideas", "give me video ideas", "ideas for my reels", "what should I
  post this week", "I don't know what to film", "I'm out of content ideas", "20 video ideas", "a month of
  content ideas", or any request for a batch of short-form ideas. (Talking-head topics to script right now =
  shortform-talkinghead; a research-driven 30-day plan = shortform-video-plan.)
---

# Short-Form Ideas

Twenty specific videos built from the agent's market, niche, and what their buyers and sellers keep asking —
each already pointed at a format they can shoot. Not topics that "sound good"; videos they could film today.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) and
`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md` (the **80/20 reach split**, the silent **4-3-2-1** mix).

## Step 1 — Load the Brain (+ any research)
**If `~/realtor-brain/` is empty**, pull it first with **realtor-brain-sync**; only if the cloud has none, run
Brain Setup. Read `brain.md`, `identity/profile.md` (city, niche), `identity/market.md`, `identity/avatars.md`
(who they serve — this sets the mix), `identity/offer.md` (lead magnets), `memory/content-log.md` (so ideas
stay fresh), and `memory/ideas.md` (tag `shortform` — captured on-the-go ideas go to the TOP). If a
**Search Demand Report** (from `shortform-search-research`) is in the chat/Drive, build from it and say so.

## Step 2 — Build 20 ideas across the plugin's formats
Assign every idea a format and use the full range so the feed never looks the same twice:
- **Green screen** (react to an article/stat/listing) · **Talking head** (answer a question to camera) ·
  **Carousel** (no-film slides) · plus **on-location** and **stat/story** variants of those.
Each **week mixes 4 broad-reach + 1 niche** (the 80/20 split). Titles are what a person would actually search
or say ("What $500K gets you in [neighbourhood] right now"), never a content-calendar label.

## Step 3 — Output (use these exact section names)
- **THE MONTH AT A GLANCE** — one paragraph: the theme and why this order.
- **WEEK 1 → WEEK 4** — each = 5 videos in a bordered table: # · title (the way a person says it) · angle in
  one line · format · who it's for.
- **FILM THESE THREE FIRST** — the 3 highest-value ideas, one line each on why.
- **THE ONES THAT REPEAT** — 2–3 that work as a named recurring series (e.g. "$500K Friday").
- **WHAT TO SKIP** — 2–3 generic ideas an agent would normally make, and why to leave them.
Then: **Why this works** (2–3 sentences) and one offer — *"want me to script the first five? Say 'script these.'"*

## Step 4 — Save (if they want it) + hand off
Offer to save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` (render to `.docx` → `[Agent Name] —
Short-Form System/Content/[YYYY-MM · Month]/`, named `[YYYY-MM] · Short-Form Ideas`). Hand picks to
**`shortform-scripts`**. Captions/hashtags are NOT written here — the script + `shortform-optimizer` own those.

## Rules
- Exactly **20**, numbered, five per week (count before delivering). Every idea filmable on a phone, alone,
  in under 60s — if not, split into a series and say so.
- **The any-agent test:** if an idea could be filmed in any city, rewrite it with the community, price band,
  street, or local process.
- Never invent a stat, a listing, or a client story (mark where the agent supplies a real one).
- **Fair housing** (`identity/compliance.md`): lifestyle, cost, commute, process — never demographics,
  "good/bad" areas, or schools as code. Match the Brain's voice.
- Text only — never post, publish, or schedule.

## Quality checklist
- [ ] Brain (+ research + `ideas.md`) loaded; captured ideas surfaced first
- [ ] 20 ideas, 5/week, each format-assigned; 80/20 mix per week
- [ ] Three-to-film-first, a repeatable series, and a skip list included
- [ ] Every idea locally specific (passes the any-agent test); fair-housing safe
- [ ] Handed the picks to `shortform-scripts`
