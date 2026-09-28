---
name: shortform-batch
description: >
  The Film-Day Batch Plan — turns a pile of scripts into ONE filming session: grouped by location and outfit so
  nothing is filmed twice, in shot order, with the run sheet, what to wear, what to bring, teleprompter cards,
  and a realistic time estimate. The step that turns written videos into filmed ones. Reads the scripts above
  it. This is about FILMING, not scheduling — scheduling finished posts is `shortform-batch-publish`. Text only;
  never posts.

  Trigger on: "batch my videos", "plan my filming day", "film day", "batch these", "how do I film all these",
  "set up my shoot", "I have scripts but haven't filmed", "teleprompter cards", or any request to plan a
  short-form filming session. (Scheduling/queuing the finished posts = shortform-batch-publish; scripting them
  = shortform-scripts.)
---

# Short-Form Film-Day Batch Plan

Turn scripts into filmed video. Almost nobody plans the shoot — they end up with twelve scripts, no filming
day, and a quiet feed. Your job is a run sheet they can follow with a phone in one hand.

> **Not to be confused with `shortform-batch-publish`:** that one *schedules finished posts* into Metricool.
> This one plans the *filming day* that produces them.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

## Step 1 — Load the Brain + FIND THE SCRIPTS FIRST
**If `~/realtor-brain/` is empty**, pull it first with **realtor-brain-sync**; only if the cloud has none, run
Brain Setup. Read `brain.md`, `identity/market.md` (communities/listings), `identity/profile.md`. **Find the
scripts** — the `shortform-scripts` output above you, in Drive, or pasted; say which you're batching. If they
only have ideas (not scripts), say so plainly: *"These aren't scripted yet — say 'script these' first, then
I'll batch them."* Never batch unwritten videos.

Ask at most ONE batched question if unknown: **how long they've actually got** (an hour / an afternoon / a day)
and **any location besides home/office** (a listing, an open house, a community nearby). Accept messy input.

## Step 2 — Output (use these exact section names)
- **THE SESSION AT A GLANCE** — a small table: # videos · # locations · # outfit changes · realistic total time
  (incl. setup + travel). Be honest about time — a realistic pace is **5–7 short videos/hour** once set up, plus
  ~20 min setup. If the list doesn't fit the hours they gave, cut it and say what you cut and why.
- **THE GROUPS** — videos grouped so nothing's filmed twice: by **location → outfit → format**. Each group:
  where · what to wear · which videos · roughly how long.
- **THE RUN SHEET** — the actual film order, bordered table: order · video # · the hook's first line · format ·
  location · rough minutes. Order within a group: **outdoors first** (light/weather), **the hardest one
  second** (warm but not tired), **easy talking heads last**.
- **WHAT TO WEAR** — one outfit per group + why (solids over busy patterns; nothing that blends into the
  background); note exactly where any change happens.
- **WHAT TO BRING** — the short list (phone, tripod/lean, mic if they have one, battery) + anything a specific
  video needs. Work with the gear they have — never a shopping list.
- **THE TELEPROMPTER CARDS** — each video's hook (word-for-word) + 4–5 short beat lines + CTA (word-for-word),
  sized to read at arm's length.
- **BETWEEN EVERY VIDEO** — the 20-second reset (check frame, change one thing, breath, say the hook once) so a
  batch doesn't look batched.
- **THE SAFETY NET** — 2–3 quick b-roll grabs while set up (street, building, a slow room pan) — solves next
  month's cutaway problem.
- **AFTER THE SHOOT** — check one clip's audio, confirm focus, name the files, note any re-takes.

## Step 3 — Deliver + hand off
Deliver in chat, and save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` (render `.docx` → the month's
Content folder, named `[YYYY-MM-DD] · Film-Day Plan`) — this one gets used standing up on a phone, so keep the
run sheet on page 1 and the teleprompter cards large. Close: *"Block the time in your calendar before you close
this — a filming day that isn't booked doesn't happen. Once filmed, say 'schedule my posts' and
`shortform-batch-publish` queues the month."*

## Rules
- **Be honest about time** — never plan a session that doesn't fit the hours given; cut and say what you cut.
- **Group ruthlessly** (same place + same outfit filmed an hour apart is a planning failure). Never invent a
  location — only places they named or in the Brain.
- **Permission:** never send them to film a listing/open house that isn't theirs, private property, or an
  occupied home without noting they need the owner's yes; never show a client's home/belongings without it.
- **Fair housing**; work with the gear they have. Text only — plan, never post/send/schedule.

## Quality checklist
- [ ] Brain + the scripts loaded (never batch unwritten videos)
- [ ] Time is realistic and the list was cut to fit the hours given
- [ ] Grouped by location→outfit→format; run sheet in film order (outdoors first, hardest second)
- [ ] Teleprompter cards + safety-net b-roll + after-shoot check included
- [ ] Permission + fair-housing flagged; saved to Drive; pointed to `shortform-batch-publish` for scheduling
