---
name: market-run
description: >
  The front door of the Monthly Market System — one command, one complete monthly launch. Confirms
  which month, makes sure that month's numbers are on file (hands to the research if they aren't),
  then runs every piece off those exact figures in order: the market report, the YouTube script, the
  three short-form concepts, the Instagram infographic brief, and the distribution pack. It sequences
  and hands off; it never researches or writes the pieces itself. The agent's only job at the end is
  to film the script.

  Trigger on: "run my market update", "run my market update for [month]", "my monthly market update",
  "build my market package", "market update for [month]", "do my market update", "it's the 1st — run
  my market update", or whenever the agent wants the whole monthly launch rather than one single piece.
---

# Run My Market Update

One command should end with the agent holding everything they need for the month and one job left:
hit record. You decide what gets built and in what order, then hand each piece to the skill that
owns it.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — especially the timing
rule (§2) and interpret-don't-recap (§3).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, city, booking link, handles (never ask for these).
- `identity/market.md` — the communities, price ranges, and niche that scope every search.
- `identity/voice.md` — how they talk, so every piece sounds like them.
- `identity/offer.md` — offers and lead magnets, so the CTAs point at something real.
- `identity/content-engine.md` — which platforms they actually post on. Build for those.
- `memory/content-log.md` — last month's angles, so this month's are fresh.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Settle the month (one line, then move)

Apply the timing rule: **the current month goes in the title; the previous complete month is the
data.** Default to that and say it in plain words — don't make them work it out:

> *"Running your July update — built on June's finished numbers, since that's the last full month
> on the board. That's the one people are searching for right now."*

Only ask if they said something ambiguous ("do last month's"). Never ask anything else here.

## Step 3 — Get the numbers on file
Read `~/realtor-brain/memory/market-data.md`.

- **This month not there?** One warm line — *"Let me pull the numbers first, then I'll build
  everything off them."* — hand to **Market Research**, and pick right back up here when it's done.
- **Already there?** Check the date it was pulled. Same month, still fresh → go. Older than the
  current board release → offer to refresh in one line.
- **Never run your own searches.** Research owns that, and everything downstream quotes its block.

---

## Phase 1 — Show the month

Before building, show them what this month actually says. Three lines, no more:

1. **The headline** — the one-sentence story of the month, in their voice.
2. **The condition** — seller's / balanced / buyer's, from months of supply.
3. **The one number that matters most** this month, and what it means.

That's the whole point of the system in three lines, and it tells them immediately whether the
angle is worth filming.

## Phase 2 — Build the launch

Offer the whole thing first, one piece second:

> That's the month. Want me to build the whole package now — the report, your YouTube script, three
> shorts, the Instagram graphic, and the newsletter and captions? Or just the report and script so
> you can film today?

Then hand off **in this order**, one at a time, saying in plain words what's coming next:

| Order | Piece | Hand off to | Why this order |
|---|---|---|---|
| 1 | The screen-share report + email version | **Market Report** | Everything else references its pages |
| 2 | The word-for-word YouTube script | **Market Script** | Built to walk through the report page by page |
| 3 | Three short-form concepts | **Market Shorts** | Pulled from the report's strongest numbers |
| 4 | The branded 1:1 Instagram infographic brief | **Market Infographic** | Uses the glance page's stats |
| 5 | Lead magnet + newsletter + captions + CTAs | **Market Distribution** | Points at the finished report and video |

- **You never write these yourself.** You sequence them and hand them over by name. Each one already
  reads the same data block, so the agent answers nothing twice and every number matches.
- If they asked for one piece only, hand straight to it and keep the rest warm for later.
- Between pieces, one short line: *"Report's done — script next?"* Never a status report.

## Phase 3 — Close the month

Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`:
- Everything lands in the month's Drive folder (the one the research made — find it, don't make a
  second).
- Append one row per deliverable to `~/realtor-brain/memory/content-log.md` — the long-form and each
  short — status `Scripted`, so next month picks fresh angles.
- **Push the Brain to Drive** (`realtor-brain-sync`). An unsynced write is a lost write.
- If they haven't set up the monthly routine yet, offer it once in one line and hand to
  **Market Routine**. Don't push it twice.

## Quality checklist
- [ ] Brain read; nothing asked that the Brain already answers.
- [ ] Timing rule applied and said out loud — current month in the title, last complete month's data.
- [ ] The month's data block on file before anything was built; research run first if it wasn't.
- [ ] No searches run here — every figure came from the block.
- [ ] The month shown in three lines before the build started.
- [ ] Hand-offs happened in order, by name — no piece written here.
- [ ] All deliverables quote identical numbers.
- [ ] Everything saved to the month folder; content log updated; Brain pushed.

## End every run with

"Film the script this week while the numbers are still the freshest thing anyone's seen — everything
else is already written and waiting behind it."
