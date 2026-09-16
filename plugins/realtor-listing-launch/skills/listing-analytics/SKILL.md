---
name: listing-analytics
description: >
  Closes the loop on listing marketing — reads back what the agent's finished listings actually did
  and what their listing content actually got. Answers "how did my listing posts do?" from their own
  posting tool, and "do my listings with a video sell faster?" from their own closed-listing history.
  Writes the patterns to the Brain so WIN IT stops arguing from anecdote and starts arguing from the
  agent's own track record. Honest about small samples — with four listings it says so rather than
  inventing a trend.

  Trigger on: "how did my listing posts do", "how is my listing performing", "listing analytics",
  "did the tour help", "do my listings sell faster with video", "my listing track record", "what's
  working on my listings", "average days on market for my listings", "listing scorecard".
---

# Listing Analytics — what actually worked

Every other skill in this plugin makes something. This one is the only skill that checks whether any
of it worked — and it runs entirely on the agent's own data, not on benchmarks from the internet.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, then `identity/publishing.md` (their posting tool),
`~/realtor-brain/memory/listings.md` (every block, including sold ones),
`~/realtor-brain/memory/performance.md` (outcomes CLOSE IT wrote), and
`~/realtor-brain/memory/content-log.md` (what went out for each property).

(If `~/realtor-brain/` is empty — a fresh session — **pull it first with realtor-brain-sync**.)

---

## Job 1 — Post performance (the live numbers)

*"How did the 14 Oak posts do?"*

Read the numbers from the agent's connected posting tool per
`${CLAUDE_PLUGIN_ROOT}/shared/publishing-guide.md` — Metricool and GoHighLevel both expose analytics;
Buffer is thinner. Filter to this property's posts using the `content-log.md` rows.

Report in plain words, not a dashboard:

> 14 Oak's announcement got 3,100 views and 41 saves — your best listing post this year. The
> neighbourhood short did 1,800. The top-3-features one underperformed at 400.

- **Three lines maximum**, best first, one plain takeaway at the end.
- **Never present a platform metric as a lead.** Views are views; the enquiry is the thing that matters,
  and this skill can't see enquiries. Say so if they conflate them.
- **No posting tool connected?** Say so once, plainly, and go straight to Job 2 — which needs no
  connector at all and is the more useful half anyway.

## Job 2 — The track record (the half that compounds)

*"Do my listings with a video sell faster?"* This runs on `performance.md` and the closed blocks —
**no connector required.**

Compare closed listings on what's actually recorded: days on market, at/over/under asking, and which
`Built:` tokens each one had.

| Pattern worth checking | Why it matters |
|---|---|
| Listings **with** `tour` or `walkthrough` vs without — days on market | The video question, answered with their own data |
| Listings with an `openhouse` kit vs without — showings | Whether the open house work pays |
| Listings that needed `revive` — what they had in common | The early-warning pattern |
| Average days on market vs the local average in `market-data.md` | The number for the listing presentation |

**The honesty rules, and they are the whole point of this skill:**
- **Say the sample size every single time.** *"Across your 6 closed listings…"* — never a percentage
  with no denominator.
- **Under ~8 closed listings, report observations and refuse to call them trends.** Say it plainly:
  *"Your three with video averaged 14 days and the two without averaged 22 — that's a hint, not a
  pattern. Ask me again at ten."*
- **Never claim causation.** Faster listings may have been better priced. Say that out loud when it's
  plausible — an agent who repeats a false claim to a seller gets caught by a seller who asks.
- **Never compare the agent to other agents**, and never use a benchmark that isn't from
  `market-data.md` with its source and month.

## Job 3 — Write the patterns back

Append what was found to `~/realtor-brain/memory/performance.md`: the date, the sample size, and the
observation in one line. This is what makes the next run a comparison instead of a snapshot.

**And the payoff:** when a pattern is real and the sample supports it, append it to
`~/realtor-brain/identity/proof.md` as a usable proof line — *"Across 11 listings, averaged 16 days on
market against a market average of 24 (CREB, Aug 2026)."* **That line is what `listing-win` reads into
the next listing presentation**, and it's the difference between "I market your home well" and a
number. Nothing goes into `proof.md` that isn't literally true and countable.

---

## Compliance pass
Run the gate (`${CLAUDE_PLUGIN_ROOT}/shared/compliance-gate.md`). Here the risk is unusual — it's
**making a claim the agent will repeat to a seller**:
- **No performance claim without its sample size and its source.**
- **No causation claims**, no "my marketing sells homes 30% faster."
- **No forecast.** Past days on market is a fact; "I'll sell yours in 14 days" is a guarantee and
  isn't allowed.
- Any market average carries its source and month from `market-data.md`.

## Deliver + save
Plain words first, numbers second, one takeaway last. Save a doc only if they ask — this is usually a
conversation, not a document. Update `performance.md` (and `proof.md` when it's earned), then push.

End with one plain line:

> That days-on-market number is the strongest thing in your listing presentation — I'll use it next
> time you've got an appointment.

## Quality checklist
- [ ] Brain, `performance.md`, `content-log.md`, and every listing block read.
- [ ] Post numbers pulled from their own tool — or the missing connector said once, then Job 2 run anyway.
- [ ] **Sample size stated on every comparison**; under ~8 closed listings, called an observation and
      explicitly not a trend.
- [ ] **No causation claimed**; the pricing confound named out loud where it's plausible.
- [ ] No benchmark used that isn't from `market-data.md` with source and month; no agent-vs-agent comparison.
- [ ] Views never presented as leads.
- [ ] Patterns appended to `performance.md`; only literally-true, countable lines added to `proof.md`.
- [ ] Three lines, best first, one takeaway — not a dashboard.
