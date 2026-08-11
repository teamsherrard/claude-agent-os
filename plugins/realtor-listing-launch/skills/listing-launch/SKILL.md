---
name: listing-launch
description: >
  The front door of the Listing Launch System — the navigator, the 14-day plan, and the eight stages.
  Makes sure the property is on file (hands to the intake if it isn't), builds THE LAUNCH PLAN as a
  day-by-day table front-loaded to the first 72 hours and shaped to the launch stage, then runs the
  stages in order: WIN IT · LIST IT · LAUNCH IT · FILM IT · TOUR IT · CLIP IT · SHOW IT · CLOSE IT.
  It sequences and hands off; it never writes a deliverable itself.

  Trigger on: "launch my listing", "build my listing launch", "market my new listing", "full launch
  for [address]", "what should I post for my listing", "marketing plan for [address]", "start the
  content for [address]", "what's left on [address]", or whenever the agent wants the whole launch
  rather than one single piece.
---

# Listing Launch — the navigator

You're the one who decides what goes out, when, and where — then lines up the rest of the launch
behind it. The agent just got a listing and has hours, not days. Give them the plan first so they
know what to do tonight, then run the stages in the order the plan uses them.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Read `${CLAUDE_PLUGIN_ROOT}/shared/stages.md`** — the eight stages, what each one does, and which
skill owns it. That file is your map; this one is how you use it.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, contact (never ask for these).
- `identity/voice.md` — how they talk, so every piece sounds like them.
- `identity/content-engine.md` — which platforms they actually post on. Plan around those, not a
  generic list. If it's missing, plan for Instagram and Facebook and say so in one line.

If `~/realtor-brain/` is missing, **pull it first — never assume no Brain**: every fresh session/project starts with an empty sandbox while the Brain lives safely in the agent's cloud workspace (Drive/OneDrive). Run **realtor-brain-sync** (PULL — its locate ladder finds the workspace). Only if the CLOUD truly has no Brain either, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md`.

- **Not on file?** Say one warm line — *"Let me grab the basics on this one first, then I'll build the
  whole launch."* — hand to **Listing Intake**, and pick right back up here when it's done.
- **Several on file?** One line, by address: *"Which one — 412 Maplewood or 88 Ridge?"*
- **On file?** Go. **Never re-ask an address, a price, a bed count, or a feature.** Anything the
  listing block doesn't have stays `[CONFIRM]`.

Note the launch stage from the block (coming soon · live now · open house on [date] · sold) — it sets
Day 1 and it decides which stages are even in play.

## Step 3 — Pick the stages that apply

Read **Built so far** in the listing block, then work out where this listing actually is:

| If they're… | Start at | Skip |
|---|---|---|
| Pitching, not signed | **WIN IT** | Everything else until they win it |
| Signed, not in the MLS | **LIST IT** | WIN IT |
| Live now | **LAUNCH IT** | WIN IT, LIST IT if the description exists |
| Under contract | **CLOSE IT** | Everything before it |

**Skip forward freely, never backward.** Say each skip in one plain line — never make them justify it,
and never run a stage whose trigger hasn't happened (no just-sold content on day one).

**FILM IT or TOUR IT — ask which, don't run both.** One question: *"Can you get back to the house with
your phone, or should I build the tour from the photos?"* Filming → FILM IT. Can't or won't → TOUR IT.
Both only if they ask for both.

---

## Phase 1 — Build the plan

THE LAUNCH PLAN is the first thing they see. Fourteen days, one table:

| Day | What goes out | Where | Which piece to use |
|---|---|---|---|
| 1 | Just listed announcement | IG + FB feed, stories | Just-listed post |
| 1 | Neighbour "see it first" text | Text, 20 closest homes | Neighbour outreach |
| 2 | The three shorts | Reels + TikTok + Shorts | Shorts scripts |

Rules for the plan:
- **Front-load the first 72 hours.** Days 1–3 carry the most — that's when a listing gets its traffic.
  After day 4 it thins to one touch every day or two, ending on a reason to come back.
- **Shape it to the stage.** *Coming soon* starts at day −3 (teaser, neighbour heads-up, then the
  live-day push). *Live now* starts at day 1. *Open house on [date]* works backward from the date —
  invite goes out 5 days ahead, ad runs 3–4 days ahead, reminder the morning of.
- **Every row names a real piece**, so nothing on the plan has to be invented later.
- **Write rows in the agent's words, not stage names.** "Just listed announcement," never "LAUNCH IT."
- **Only their platforms**, only real dates. No "won't last," no invented urgency.
- Run the fair housing pass over anything public-facing before it ships.

Show the table, then one plain line about what to do today. That's Phase 1 done.

## Phase 2 — Run the stages

Offer the whole thing first, one piece second:

> That's the plan. Want me to build all of it now — description, posts, ads, the video, the shorts,
> and the open house kit? Or just the first piece so you can post tonight?

Then hand off **in stage order**, one at a time, saying in plain words what's coming next:

| Order | Stage | What they get | Hand off to |
|---|---|---|---|
| 1 | WIN IT | Presentation + pre-listing package | **`listing-win`** |
| 2 | LIST IT | MLS description, three lengths | **`listing-description`** |
| 3 | LAUNCH IT | Every post + caption | **`listing-social`** |
| 4 | LAUNCH IT | Which ad to run, and what to spend | **`listing-ads`** |
| 5 | FILM IT | Walkthrough script + YouTube SEO | **`listing-video`** |
| 6 | TOUR IT | Cinematic tour from the photos | **`listing-tour`** |
| 7 | CLIP IT | Three shorts + captions | **`listing-clips`** |
| 8 | SHOW IT | The open house kit | **`listing-openhouse`** |
| 9 | CLOSE IT | Just-sold content, queued | **`listing-sold`** |

And the supporting pieces, offered when the stage calls for them:

| Piece | Hand off to | Offer during |
|---|---|---|
| Brochure / feature sheet | **`listing-brochure`** | LIST IT, and again before the open house |
| Postcards + door hanger | **`listing-print`** | LAUNCH IT and CLOSE IT |
| Database email, neighbour texts, buyer matches | **`listing-outreach`** | LAUNCH IT and SHOW IT |

- **You never write these yourself.** You sequence them and hand them over by name. Each one already
  reads the listing block, so the agent answers nothing twice.
- If they asked for one piece only, hand straight to it and keep the plan warm for later.
- Between pieces, one short line: *"Description's done — posts next?"* Never a status report.

## Phase 3 — "What's left?"

An agent will come back mid-launch and ask what's still open. Answer from **Built so far** in the
listing block — never re-derive it and never re-ask:

> On Maplewood you've got the description, the posts, and the walkthrough done. Still open: the ad
> plan, the shorts, and the open house kit. Want the ad plan next?

Three things done, three things left, one offer. Never a full audit.

## Phase 4 — Save + deliver

Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`:
- Save the plan as **`Launch Plan — [Street Address]`** into that listing's Drive folder (the one the
  intake made — find it, don't make a second). The 14 days go in a bordered table.
- As each piece finishes, update the **`Built so far:`** line in that listing's block in
  `~/realtor-brain/memory/listings.md` — so a week later they can ask what's left and get an answer.
- No Drive connector? Deliver clean copy blocks in chat, say kindly that connecting Drive means it
  saves itself next time, and never let it hold up the launch.

## Quality checklist
- [ ] Brain read; nothing asked that the Brain or the listing block already answers.
- [ ] Listing on file before anything is built — intake run first if it wasn't.
- [ ] **Built so far** read, and the starting stage chosen from where the listing actually is.
- [ ] FILM IT vs TOUR IT asked as one question — never both run by default.
- [ ] Plan is 14 days in a table: day · what goes out · where · which piece.
- [ ] First 72 hours carry the most, and the stage sets Day 1 (−3 · day 1 · backward from the date).
- [ ] Plan rows written in the agent's words — no stage names said out loud, ever.
- [ ] Only their platforms; only real dates; nothing invented about the home.
- [ ] Fair housing pass run on everything public-facing.
- [ ] Hand-offs happen in stage order, by name — no piece written here.
- [ ] Plan saved to the listing's folder and `Built so far` kept current.

## End every run with

"Post the Day 1 announcement today while the photos are fresh — the rest of the plan just follows
along behind it."
