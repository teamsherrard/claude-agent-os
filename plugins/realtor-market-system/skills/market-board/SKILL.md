---
name: market-board
description: >
  Puts the month on the agent's Content Dashboard — the one Notion board they already share with the
  YouTube and Short-Form systems. After the monthly package is built, this writes the whole month in
  one batch: a Long-Form card for the market update video (Slide Map and talking points in the card
  body, the PDF report as its lead magnet), one card per short, and the carousel card — each with its
  recording date and its publishing date from the four-week plan. Because the monthly agent runs
  unattended, this is how the agent SEES the month waiting for them without opening Drive. Never
  creates a second board, never duplicates a card, never deletes anything.

  Trigger on: "put my market update on the board", "add this month to my content board", "my market
  cards", "update my board with the market update", "is the market update on my board", or
  automatically as the last step of a full monthly run.
---

# Market Board

Everything else in this plugin writes files. This is the one that makes the month **visible** — on the
same board the agent already uses to run their content, next to their YouTube videos and their shorts.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the board spec** (`${CLAUDE_PLUGIN_ROOT}/shared/notion-board-spec.md`) — it is the canonical
contract, shared identically with Plugins 3 and 4. Golden rules, find-or-create, two-way sync, and the
replace-never-stack rule all come from there. **Read it before touching Notion.**

**Bring-your-own Notion, never required.** The month is complete without it — the board is a premium
view, not the system. Drive and `content-log.md` stay the record.

---

## Step 1 — Is there a board?

Read `~/realtor-brain/identity/publishing.md` for the `Content board:` line **first**:

- **A URL** → go straight to it. Only search if the link is dead.
- **`declined`** → don't offer again. Finish silently and say nothing about Notion.
- **No line at all** → the board hasn't come up yet. Offer **once**, in one plain line (spec's
  "Connecting Notion" section), record their answer either way, and never block the month on it.

**Never create a second board.** If Plugins 3 or 4 already made one, this month's cards go on *that*
board.

## Step 2 — Load the month
1. `~/realtor-brain/memory/market-data.md` — this month's block. **Confirm its month matches the month
   you're carding.**
2. The month's built pieces — the presentation (for the Slide Map and talking points), the PDF report,
   the shorts, the Instagram pack, and the distribution pack (for the four-week publishing dates).
3. `identity/content-engine.md` (their pillars) · `identity/profile.md` · `identity/offer.md`.

Nothing built yet? Say so and hand to **Market Run** — don't card an empty month.

---

## Phase 1 — The cards (one batch, all at once)

| Card | Format | Status | System ID |
|---|---|---|---|
| The market update video | `Long-Form` | `Ready to Film` | `mk-YYYY-MM-lf` |
| Green screen article reaction | `Green Screen` | `Ready to Film` | `mk-YYYY-MM-gs` |
| Talking-head opinion | `Talking Head` | `Ready to Film` | `mk-YYYY-MM-th` |
| Stat graphic | `Graphic` | `Ready to Film` | `mk-YYYY-MM-gr` |
| Instagram carousel | `Carousel` | `Ready to Film` | `mk-YYYY-MM-car` |

**Find before you create — every time** (spec §two-way sync): match on System ID first, then exact
title, then near-match. Found → **update in place**. Not found → create. A card the agent deleted
stays deleted; note it once and move on.

Per card:
- **Topic** — the real title. For the long-form, the search-led title from the deck's publish kit
  (city + current month + payoff), not "Market Update."
- **Pillar** — their market-update pillar if `content-engine.md` names one, else `Market Update`.
  Shorts get their funnel role (`Reach` · `Value` · `Trust` · `Convert`).
- **Context** — the Mike-style two bullets: `• What: …` `• Outcome: …`
- **Recording Date** — inside the film-within-three-days window from the routine's rhythm.
- **Publishing Date** — straight from the distribution pack's four-week plan, so the month lands on
  the calendar already spaced out instead of stacked on one day.
- **Script / SEO / Post Package** — the Drive links for that piece.
- **Resource Assets** — the CTA, and **the PDF report as this month's lead magnet** with its link.

## Phase 2 — Fill the long-form card's body

The long-form card is the one they open on filming day. It carries the whole recording:

- **🎬 THE DECK** — the Slide Map (numbered, conditionals resolved) and the **talking points under
  every slide**, so the card alone is filmable. If a word-for-word script was built, it goes here too;
  if it wasn't, say plainly on the card that the talking points *are* the script.
- **🔍 PUBLISH KIT** — title options, description opening, chapters, thumbnail text.
- **🧲 LEAD MAGNET** — the PDF report, what it is, and the CTA lines that point at it.
- **📋 ASSETS & NOTES** — the data period, the source, and the disclaimer to say.

**Replace, never stack** — a re-run updates these sections in place. A card must never end up with two
🎬 THE DECK sections.

Short cards get the lighter body: hook, talking points or script, caption, hashtags, on-screen text.

## Phase 3 — Confirm, plainly

Count-check after the batch and say it in one line — *"this month's 5 cards are on your board ✓"*. If a
write failed, name which card and retry once. Never a status report.

Then one line on what they'll see: *"Your market update's sitting in Ready to Film with everything in
the card — deck, talking points, and the report."*

## Quality checklist
- [ ] `publishing.md` read first; `declined` honoured; board offered at most once.
- [ ] No second board created — existing board found and reused.
- [ ] Data block's month verified.
- [ ] Find-before-create run on every card; System IDs written; no duplicates.
- [ ] Deleted cards stayed deleted.
- [ ] 5 cards, correct Formats, Recording + Publishing dates set from the four-week plan.
- [ ] Long-form body carries the Slide Map + talking points, so the card is filmable alone.
- [ ] Sections replaced in place, never stacked.
- [ ] PDF report attached as the month's lead magnet.
- [ ] Count-check said in one plain line.
- [ ] Nothing else in their Notion touched; nothing published.
