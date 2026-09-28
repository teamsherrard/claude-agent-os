---
name: shortform-video-plan
description: >
  The 30-Day Short-Form Plan — turns this month's local search demand into 20 reels, five a week for four
  weeks, each aimed at a real search people are making right now, with the title, the search it answers, the
  format, and which week it goes out. Reads the Search Demand Report (`shortform-search-research`) when present
  and feeds `shortform-scripts`. The research-driven monthly roadmap (vs `shortform-ideas`, the quick standalone
  idea list). Text only; never posts.

  Trigger on: "build my short form plan", "short form video plan", "30 day content plan", "plan my videos",
  "plan my month of reels", "my content plan", "what should I film this month", "map out my short form", or any
  request for a monthly short-form plan. (A quick idea list without research = shortform-ideas; talking-head
  topics to script now = shortform-talkinghead.)
---

# 30-Day Short-Form Plan (strategy pipeline, step 2)

Turn the search-demand report into a month of filming — 20 short-form videos, five a week, every one aimed at
something people in this market are actually searching. Vertical, 30–60s, phone-filmable.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) and
`${CLAUDE_PLUGIN_ROOT}/shared/mike-frameworks.md` (80/20 reach split; the silent 4-3-2-1 mix; locals-not-agents).

## Step 1 — Load the Brain + FIND THE RESEARCH FIRST
**If `~/realtor-brain/` is empty**, pull it first with **realtor-brain-sync**; only if the cloud has none, run
Brain Setup. Read `brain.md`, `identity/profile.md`, `identity/market.md`, `identity/content-engine.md`
(pillars, platform priority), `memory/content-log.md` (stay fresh), `memory/performance.md` (lean on winners).
**Look for this month's Search Demand Report** (from `shortform-search-research`) — in the chat, Drive, or
uploaded. If it's there, build every video from it and say so. If NOT: *"I can build this from scratch, but
it's much sharper off the search report — want me to run the research first?"* Only build without it on a yes.

## Step 2 — Output (use these exact section names)
- **THE MONTH AT A GLANCE** — one paragraph: the theme, and why this order (what films first and why).
- **WEEK 1 → WEEK 4** (each themed) — 5 videos in a bordered table: # · title (written the way people search) ·
  the search it answers (from the research) · format (green screen / talking head / carousel + on-location /
  stat / story variants) · one-line angle. Each week = **4 broad-reach + 1 niche** (80/20). Front-load demand:
  the highest-demand searches film in Week 1, not Week 4. The research's "questions nobody is answering" gap
  gets **at least 3** videos.
- **THE THREE TO FILM FIRST** — the highest-demand three, one line each on why.
- **THE BATCH PLAN** — which film in the same session (same outfit/location) and how many sessions the month
  really takes.

## Step 3 — Save + hand off
Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: render to `.docx` (`render_doc.py`) → `[Agent
Name] — Short-Form System/Content/[YYYY-MM · Month]/`, named `[YYYY-MM] · Short-Form Plan`. Deliver the same in
chat (the script skill reads it). Offer to drop it onto the Notion board (`shortform-board`). Close: *"Pick
your first five and say 'script these' — `shortform-scripts` writes them ready to film."*

## Rules
- Exactly **20**, numbered 1–20, five per week (count before delivering). Every video traces to a real search —
  name which one; a video that answers nothing nobody asked doesn't go on the plan.
- Titles the way people search, not the way agents talk. Never invent market stats (a video may reference a
  number only if the research cited it; the script carries the source).
- **Fair housing** (`identity/compliance.md`); match the Brain's voice.
- Text only — never post, send, or schedule.

## Quality checklist
- [ ] Brain loaded; research found + built from (or the offer to run it first was made)
- [ ] 20 videos, 5/week, each traced to a real search; 80/20 mix; gap list gets ≥3
- [ ] Demand front-loaded to Week 1; three-to-film-first + batch plan included
- [ ] Saved to Drive as `.docx`; handed to `shortform-scripts`; offered the board
