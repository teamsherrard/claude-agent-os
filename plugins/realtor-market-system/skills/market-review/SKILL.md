---
name: market-review
description: >
  Closes the loop on the monthly market update — the thing that makes month twelve better than month
  one. Grades last month's on-camera prediction against the numbers that just landed (the prediction
  ledger — the segment almost no agent runs and the strongest trust device in the format), reads how
  last month's video, shorts, and carousel actually performed, names what worked and what didn't, and
  hands the next month a sharper angle instead of a blank page. Writes back to the Brain so every
  future run leans on real evidence. Reads performance data the YouTube and Short-Form systems already
  gathered — it never re-pulls analytics they own.

  Trigger on: "review my market update", "how did last month's market update do", "grade my
  prediction", "was I right", "my market update performance", "what worked last month", "market
  review", or automatically at the start of a monthly run once a previous month exists.
---

# Market Review

Two jobs: **tell the agent the truth about last month**, and **make this month's angle better because
of it**. Without this, the twelfth market update is written exactly the way the first one was.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`).

**Boundary — don't re-pull analytics other plugins own.** If the YouTube System (Plugin 3) or the
Short-Form System (Plugin 4) is installed, `memory/performance.md` already holds real numbers from
`youtube-analytics` / `shortform-analytics`. **Read that.** Only when neither has ever run do you ask
the agent for the handful of figures below — and then ask for four numbers, not a report.

---

## Step 1 — Load the history
1. `~/realtor-brain/memory/market-data.md` — **this month's block and last month's**, both. The
   comparison is the whole point.
2. `~/realtor-brain/memory/performance.md` — what the analytics skills recorded. Missing or empty?
   Note it and continue; this skill still works on the prediction and the angles.
3. `~/realtor-brain/memory/content-log.md` — which market pieces went out, and their status.
4. `identity/voice.md` + `identity/voice-print.md` (the graded-prediction segment is read aloud).

No previous month on file? Say so in one line — *"this is your first one, so there's nothing to grade
yet; I'll start the ledger this month"* — write the prediction section (Phase 2) and stop.

---

## Phase 1 — Grade the prediction (the ledger)

Find last month's `PREDICTION:` line in its data block — the forward-looking call the agent made on
camera. Grade it against the numbers that just landed:

| Verdict | When |
|---|---|
| **Right** | The direction and the rough magnitude both held |
| **Half right** | Direction held, magnitude didn't (or vice versa) |
| **Wrong** | The market did the other thing |
| **Too vague to grade** | The call had no testable claim — say so, and tighten this month's |

Then write the **on-camera segment**, word-for-word, 30–45 seconds, in their spoken voice:

> *"Last month I told you inventory would keep climbing and that sellers had about six weeks before it
> started to bite. Inventory went up 9% — so that part was right. The six weeks was wrong; it's biting
> already. Here's what I'd change about that call…"*

Rules that make this work instead of backfire:
- **A wrong call is the most valuable one.** Own it plainly and early in the segment — hedging is what
  destroys trust, not being wrong. Never bury it, never spin it.
- **Never grade generously.** If the numbers say wrong, it's wrong.
- **Never invent a prediction** that wasn't made. No `PREDICTION:` on file → say the ledger starts now.
- Keep it to the one call. A month with three graded predictions is a statistics lecture.

## Phase 2 — Set this month's prediction

One testable, falsifiable call for next month — direction **and** rough magnitude, so it can actually
be graded:

- ✅ *"I think inventory keeps rising, but slower — call it 5% rather than 10."*
- ❌ *"I think the market stays interesting."* (ungradeable, so worthless)

Write it into **this month's block** in `memory/market-data.md` as a `PREDICTION:` line, and tell the
agent it's what gets graded next month. Frame it as their call, not yours — offer a suggestion drawn
from the data, let them adjust, take whatever they land on.

## Phase 3 — What actually performed

From `performance.md` and `content-log.md`, in plain words — four lines, not a dashboard:
- **The best piece** of last month's market package, and the honest guess at why.
- **The weakest**, and what to change.
- **The hook style** that worked (and whether it's the same one as the month before).
- **The CTA** that actually produced something.

Nothing on file and no analytics plugin installed? Ask for exactly four numbers — video views, best
short, worst short, any leads from the report — and nothing more.

## Phase 4 — Hand the next month a sharper angle

The deliverable that matters. Write **three concrete instructions** for the next run, specific enough
to act on:

1. **The angle to lean into** — *"the relocation lens outperformed everything; give it two slides."*
2. **The thing to drop or change** — *"the contrarian hook has run twice and faded; go myth-buster."*
3. **The one experiment** — *"try the affordability number as the stat graphic instead of DOM."*

Append these to `memory/performance.md` as a dated block, so the next monthly run — including the
unattended one — reads them before choosing angles.

## Phase 5 — Write back + close
Append to `memory/performance.md`: the dated block with the grade, what performed, and the three
instructions. Write the new `PREDICTION:` into this month's data block. **Push the Brain.**

Close with the grade in one line: *"Last month's call: half right. Segment's written — it's a good
one to open with."*

## Quality checklist
- [ ] Last month's block and this month's both read; comparison is real, not remembered.
- [ ] `performance.md` read before asking the agent anything.
- [ ] Analytics not re-pulled if Plugin 3 or 4 owns them.
- [ ] Prediction graded honestly — a wrong call named as wrong, owned early, never spun.
- [ ] No prediction invented where none existed.
- [ ] Graded segment written word-for-word in their spoken voice, 30–45 sec.
- [ ] This month's prediction is testable — direction AND magnitude — and written to the block.
- [ ] Performance reported in four plain lines, not a dashboard.
- [ ] Three concrete instructions written for the next run, specific enough to act on.
- [ ] `performance.md` appended; Brain pushed.
