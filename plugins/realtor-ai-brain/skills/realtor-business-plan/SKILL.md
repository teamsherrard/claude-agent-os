---
name: realtor-business-plan
description: >
  Turns the agent's income goal into a real 90-day business plan — the money, the engine, the future. It
  reverse-engineers their GCI / income goal into the exact number of deals (using their real average sale
  price and commission), maps where those deals come from, and locks THREE weekly non-negotiable activities
  they'll actually do — then delivers a premium 90-day plan book plus a weekly dashboard to track it. Reads
  the Brain (goals, market, offer, content plan, capacity) so nothing is re-asked; feeds the AI Admin, which
  can nudge the weekly activities. Also runs a lightweight WEEKLY CHECK-IN that updates the dashboard,
  celebrates wins, and re-focuses the week. Offered right after Brain Setup, and refreshed every quarter.

  Trigger on: "build my business plan", "plan my next 90 days", "my 90-day plan", "how many deals do I need",
  "how do I hit my goal", "set my goals into a plan", "business planning", "weekly check-in", "review my
  plan", "am I on track", "refresh my plan", "plan my quarter", or right after setup as the first thing to do.
---

# Realtor Business Plan — the 90-day plan that makes the goal real (Brain)

Every other skill helps the agent *do* the work. This one tells them **which work, and how much**, to hit
their number. It turns a vague goal ("I want to make more this year") into: *you need **N deals**, they come
from **here**, so your three weekly moves are **X, Y, Z** — and here's your dashboard to stay on track.*

Built on the proven **Money → Engine → Future** structure. It reads the Brain, does the math *for* them, and
produces a premium plan book — not a worksheet. **~10–15 minutes for the plan; ~3 minutes for a weekly check-in.**

## Step 0 — Follow the setup principle
Read `${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md`: ask once, default-if-unsure, honour "skip"/"use
defaults". **Defaults are full-quality** — an agent who's unsure on every number still walks away with a real,
specific, math-checked plan built from sensible market assumptions they can adjust later.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, plus:
- `identity/strategy.md` — their **goals** (GCI / transaction target, priority, capacity). This is the input.
- `identity/market.md` — **average sale price** + price bands (drives the commission math).
- `identity/offer.md` + `identity/avatars.md` — buyer/seller mix, who they serve.
- `identity/content-engine.md` + `identity/operations.md` — their real **cadence + capacity** (so the weekly
  activities are realistic, not fantasy).
- `identity/proof.md` — last year's numbers if present (a baseline to plan from).

If `identity/strategy.md` has no goal yet (Operations phase not run), just **ask the goal directly** here —
this skill can set it. If `~/realtor-brain/` doesn't exist, run **Setup** first.

---

## Phase 1 — THE MONEY (do the math for them)
Reverse-engineer the goal into deals. Show the working — agents love seeing the number become concrete.

1. **The target.** Use `strategy.md`'s GCI / income goal. If it's an *income* (take-home) goal, gross it up
   to GCI (before splits/expenses) — ask their brokerage split if unknown, default a sensible one and label it.
2. **Average commission per deal.** `avg sale price` (from `market.md`) × `commission %`. Use their market's
   norm; if unsure default **~2.5% per side** and say it's an assumption they can change.
3. **Deals needed** = GCI goal ÷ avg commission per deal. Round up.
4. **Split it:** buyer/seller mix (from `offer.md`/persona), then break the year into **quarterly → monthly →
   the 90-day target** (deals in the next 90 days). Also translate to "**deals per month**" and "**closings
   you need in the pipeline now**" (account for the ~30–60 day close lag).

Present it as a clean, confidence-building readout: *"To hit $[goal], at your ~$[avg] average and [x]% commission,
that's **[N] deals this year** — about **[n]/quarter**. So your 90-day number is **[n] deals**. Here's how we get them."*
Every number is theirs and adjustable — if they say "my average is higher" or "I split 90/10," redo the math live.

---

## Phase 2 — THE ENGINE (where the deals come from → 3 weekly moves)
Deals don't come from hoping. Map them to sources, then convert sources into weekly activity.

1. **Lead sources.** Which of these actually produce for them (pick their real ones, add their own): sphere /
   database, past clients + referrals, content / YouTube / social, open houses, geographic farming, online
   leads, networking/events. Weight each: roughly how many of the [N] deals come from each?
2. **Convert to activity (planning assumptions, labelled as such).** Work backwards with reasonable ratios the
   agent can tune — e.g. sphere/referral ~ a handful of real conversations per opportunity; content ~ consistent
   volume compounding over the quarter; open houses ~ X per month → Y leads. The point isn't false precision —
   it's translating "[n] deals" into "**this many conversations / posts / open houses per week**."
3. **Lock THREE weekly non-negotiables.** The 20% of activity that drives 80% of the result — chosen around what
   they'll *actually* do (respect `operations.md` capacity + `content-engine.md` cadence). Examples: "10 sphere
   touches/week," "publish per your content plan," "1 open house/week." **Three, not ten** — this is the whole game.
   *The content one nests the existing plan:* if the Realtor YouTube / Short-Form systems are set up, point the
   content activity at those (hand off to the **YouTube Game Plan** for that engine rather than duplicating it).

---

## Phase 3 — THE 90-DAY PLAN + DASHBOARD
Assemble it into something they'll actually keep and revisit.
- **The one-line target** (the 90-day deal number + GCI).
- **The 3 weekly non-negotiables** (their commitments).
- **Monthly milestones** (month 1 / 2 / 3 — leading indicators, not just closings: conversations, appointments,
  content shipped, pipeline added).
- **The weekly dashboard** — a small table they update each week:

  | Week | Conversations / leads | Appointments set | Deals in pipeline | Content shipped | 3 moves done? |
  |---|---|---|---|---|---|

## Write to the Brain + deliver the plan book
> **Push to Drive after writing** — run `realtor-brain-sync` (PUSH). An unsynced write is a lost write.
- Write the structured plan to **`~/realtor-brain/identity/business-plan.md`** (target, math, engine, 3 moves,
  milestones, dashboard). Every skill can now read what the agent is driving toward.
- **Render a premium plan-book doc** to the agent's Drive `Realtor AI Brain → exports` (per
  `${CLAUDE_PLUGIN_ROOT}/shared/doc-formatting.md` → structured text rendered via `shared/render_doc.py`) — a
  clean 3–4 page "[Agent] — 90-Day Business Plan" they can keep and print. The markdown is the source of truth;
  the doc is the keepsake.
- Confirm: *"Your 90-day plan is set — [N] deals, three weekly moves, and a dashboard to track it. I'll check in
  weekly. Your AI Admin can remind you of your three moves in your morning brief."*

---

## WEEKLY CHECK-IN mode (trigger: "weekly check-in" / "review my plan" / "am I on track")
Keep the plan alive — a plan nobody revisits is wallpaper. ~3 minutes:
1. Read `identity/business-plan.md` + pull real progress from memory: `memory/clients.md` (pipeline / new
   opportunities), `memory/content-log.md` (content shipped), `memory/deadlines.md`, `memory/performance.md`.
2. **Update the dashboard** row for this week. Compare to the milestone pace — are they on/ahead/behind?
3. **Celebrate what moved**, name the ONE thing that matters most next week, and re-commit the 3 moves. Warm,
   coach-like, honest — if they're behind, adjust the plan, don't guilt-trip.
4. Push to Drive. *(The AI Admin's 7am brief can surface "your 3 moves" daily; this weekly check-in is the review.)*

## QUARTERLY REFRESH
After ~90 days: archive the finished plan to `exports/`, celebrate results vs target, and run Phases 1–3 again
for the next quarter (their averages + what worked update the assumptions). Growth compounds when the plan does.

## When this runs
- **Right after Brain Setup** — offered as the recommended first move (the Brain now knows them; this points it
  at a goal).
- **On demand** — "build my business plan" anytime.
- **Weekly** — "weekly check-in" (or the AI Admin prompts it).
- **Quarterly** — refresh for the next 90 days.
