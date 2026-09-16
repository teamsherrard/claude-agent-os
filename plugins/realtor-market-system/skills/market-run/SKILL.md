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
  my market update", "launch market update plugin", "launch the market plugin", "launch my market
  system", "start my market update", "open my market system", "market update plugin", or whenever the
  agent wants the whole monthly launch rather than one single piece. This is the DEFAULT entry point
  for the plugin — any vague or first-time market request lands here.
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

**Then run the auto-schedule check** (`${CLAUDE_PLUGIN_ROOT}/shared/auto-schedule.md`) — silently. If
this is their first time here, the monthly agent gets provisioned now; you mention it in one line at
the very end, never at the start.

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

## Phase 0 — Grade last month (only if there is one)

If `memory/market-data.md` has a previous month's block, hand to **Market Review** first. It grades
last month's on-camera prediction, reads what actually performed, and writes three concrete
instructions into `memory/performance.md` for this run to follow.

**This runs before the build, not after** — its whole value is sharpening this month's angles, and an
angle chosen before the review is an angle chosen blind. First month ever? Skip it silently.

## Phase 1 — Show the month

Before building, show them what this month actually says. Three lines, no more:

1. **The headline** — the one-sentence story of the month, in their voice.
2. **The condition** — seller's / balanced / buyer's, from months of supply.
3. **The one number that matters most** this month, and what it means.

That's the whole point of the system in three lines, and it tells them immediately whether the
angle is worth filming.

## Phase 2 — Build the launch

Offer the whole thing first, one piece second:

> That's the month. Want me to build the whole package now — your presentation, the PDF report,
> three shorts, your Instagram graphic and carousel, and the newsletter? Or just the deck so you can
> film today?

Then hand off **in this order**, one at a time, saying in plain words what's coming next:

| Order | Piece | Hand off to | Why this order |
|---|---|---|---|
| 1 | The presentation deck (+ talking points, email version) | **Market Presentation** | It publishes the Slide Map everything else is built against |
| 2 | The sendable PDF report + green-screen notes | **Market PDF** | The lead magnet and the thing that travels |
| 3 | Three short-form concepts | **Market Shorts** | Pulled from the deck's strongest numbers |
| 4 | The 1:1 infographic **and** the carousel | **Market Social** | Both from the glance slide's stats |
| 5 | Lead magnet + newsletter (2 CTAs) + captions + plan | **Market Distribution** | Points at the finished deck, PDF, and video |
| 6 | The month's cards on their content board | **Market Board** | Makes the month visible next to their other content |

**The word-for-word script is not in the default build.** The deck ships with talking points under
every slide, so it records on its own — no teleprompter. Mention once, at the end, in a single line:
*"Want the words written out too? I can script it line by line."* Then hand to **Market Script**.

- **You never write these yourself.** You sequence them and hand them over by name. Each one already
  reads the same data block, so the agent answers nothing twice and every number matches.
- If they asked for one piece only, hand straight to it and keep the rest warm for later.
- **The deck runs first, always.** It publishes the Slide Map, and everything else quotes it — the
  PDF, the carousel, and any script are all written against what's on those slides.
- Between pieces, one short line: *"Deck's done — script next?"* Never a status report.

## Phase 3 — Close the month

Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`:
- Everything lands in the month's Drive folder (the one the research made — find it, don't make a
  second).
- **Don't write the content log yourself.** Each skill logs its own rows as it finishes — the script
  logs the long-form, the shorts log three, the infographic logs one. Your job is to **check** the log
  has a row for everything that was built this month and fill only a genuine gap. Writing rows here
  would double-log every piece.
- **Push the Brain to Drive** (`realtor-brain-sync`). An unsynced write is a lost write.
- **Hand to Market Board last**, so the month lands on the same Notion board as their YouTube and
  short-form content. No board and no interest in one → skip it silently; it's never required.
- If the monthly agent was provisioned during this run, say so now — one line, at the end:
  *"Also set up: on the [Nth] of every month I'll have all of this built and waiting."*

## Quality checklist
- [ ] Brain read; nothing asked that the Brain already answers.
- [ ] Timing rule applied and said out loud — current month in the title, last complete month's data.
- [ ] The month's data block on file before anything was built; research run first if it wasn't.
- [ ] No searches run here — every figure came from the block.
- [ ] The month shown in three lines before the build started.
- [ ] Auto-schedule check run; if newly provisioned, mentioned in ONE line at the end.
- [ ] Hand-offs happened in order, by name — no piece written here; the deck ran first.
- [ ] The script was offered, not assumed — the deck records on its own.
- [ ] Review ran BEFORE the build when a previous month existed; its instructions shaped the angles.
- [ ] Board cards written last (or skipped cleanly if they have no board).
- [ ] All deliverables quote identical numbers.
- [ ] Everything saved to the month folder; content log checked (not re-written); Brain pushed.

## End every run with

"Film the script this week while the numbers are still the freshest thing anyone's seen — everything
else is already written and waiting behind it."
