---
name: market-run
description: >
  The front door of the Monthly Market System — one command, one complete monthly launch. Confirms
  which month, makes sure that month's numbers are on file (hands to the research if they aren't),
  grades last month's prediction if there was one, then builds every piece off those exact figures in
  order: the presentation they screen-record (talking points on every slide — no script needed), the
  sendable PDF report, three short-form videos, the Instagram infographic and carousel, the newsletter
  with both CTAs, and the month's cards on their content board. It sequences and hands off; it never
  researches or writes the pieces itself. The agent's only job at the end is to film the deck.

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

*(The monthly agent is set up at the **end** of this run, as its own visible step — Phase 3, last step.
Don't do it here; a silent step at the start of a long run is exactly how it got skipped before.)*

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
- **Set up the monthly agent — every run checks, the first run creates it.** Follow
  `${CLAUDE_PLUGIN_ROOT}/shared/auto-schedule.md` → *Provisioning*, step by step, with the real tools:
  `list_scheduled_tasks` → `create_scheduled_task` (monthly `cronExpression` in local time, on the
  board's release day + 1, the task prompt verbatim) → **`list_scheduled_tasks` again to verify it
  saved** → write the `Market Update task:` line to `config.md` → push the Brain.
  This is **not optional and not silent.** If it's already set up, confirm it in one line with the
  next run date. If this session has no scheduling tool, say so plainly and tell them the one phrase
  that sets it up from the desktop app. **Never tell the agent the schedule exists unless you just saw
  it in `list_scheduled_tasks`.**

## Phase 4 — Hand them the next move (don't end at "saved to Drive")

A run that ends with "everything's in your Drive" leaves the agent staring at a folder. End with
what they can do **now**, in this chat — short, as a menu, in plain words:

> **Your month is ready. Here's what you can do next, right here:**
> - 🎬 **"Walk me through the deck"** — I'll take you slide by slide so you're ready to film
> - 🎨 **"Help me build the slides"** — I'll get the deck into Claude Design with your brand
> - ✍️ **"Write the script"** — every line word-for-word, if you want it
> - 💬 **"What do I tell a seller who asks about the market?"** — ask me anything about your numbers
> - 📅 **"Schedule my posts"** — the shorts and carousel into your posting tool, on the plan's dates
> - 📧 **"Draft my newsletter email"** — ready to send from your inbox
> - 📊 **"How's [a community] doing?"** — a street-level read from this month's numbers

Show **four or five of these, not all seven** — pick the ones that fit what they have connected (no
posting tool → leave out scheduling; no Gmail → leave out the draft). Then stop and let them choose.

## Quality checklist
- [ ] Brain read; nothing asked that the Brain already answers.
- [ ] Timing rule applied and said out loud — current month in the title, last complete month's data.
- [ ] The month's data block on file before anything was built; research run first if it wasn't.
- [ ] No searches run here — every figure came from the block.
- [ ] The month shown in three lines before the build started.
- [ ] Monthly agent provisioned at the END with the real tools, and **verified with `list_scheduled_tasks`** before being claimed.
- [ ] Ended on the next-move menu, not on "saved to Drive."
- [ ] Hand-offs happened in order, by name — no piece written here; the deck ran first.
- [ ] The script was offered, not assumed — the deck records on its own.
- [ ] Review ran BEFORE the build when a previous month existed; its instructions shaped the angles.
- [ ] Board cards written last (or skipped cleanly if they have no board).
- [ ] All deliverables quote identical numbers.
- [ ] Everything saved to the month folder; content log checked (not re-written); Brain pushed.

## End every run with

The Phase 4 menu, then one line: *"Film the deck this week while the numbers are the freshest thing
anyone's seen — everything else is already written and waiting behind it."*
