---
name: listing-revive
description: >
  REVIVE IT — the stage between live and sold, where most listings actually live and most get lost.
  Reads the showings and feedback honestly, says what the evidence actually points at (price,
  presentation, or patience), scripts the price-reduction conversation without insulting the seller's
  home, and builds the re-launch content that makes a reduced or refreshed listing legitimately new
  again. Also handles the expiry conversation before the expiry, and the re-list when a listing comes
  back. It never dresses a stalled listing up as an opportunity.

  Trigger on: "it's not selling", "no offers yet", "we need to talk about price", "price reduction",
  "reduce the price", "drop the price", "the listing is stale", "it's been on for 6 weeks",
  "my listing expires soon", "relaunch my listing", "back on market", "re-list", "revive it",
  "what do I do with a listing that isn't moving".
---

# REVIVE IT — when it isn't selling

Eight stages assume a listing works. This one is for when it doesn't — and it's the stage that
decides whether the agent keeps the listing, because a seller who feels ignored while their house
sits will blame the agent, not the market.

The rule that governs this whole skill: **tell the truth, early, in plain words.** A stalled listing
handled honestly in week five is a renewal. The same listing handled optimistically until week eleven
is an expiry.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Read the schema** (`${CLAUDE_PLUGIN_ROOT}/shared/listing-schema.md`) — this skill writes
`Price history:` and moves `Stage:`.

---

## Step 1 — Load the Brain and the evidence
Read `~/realtor-brain/brain.md`, then `identity/voice.md`, `identity/market.md`, and
`identity/operations.md`.

Read the listing block and pull **the evidence**, not just the facts: `Captured:` (days on market),
`Price:`, `Price history:`, **`Showings:`**, **`Feedback:`**, `Built:`, `Open house:`.

Read `~/realtor-brain/memory/market-data.md` — this month's local numbers are already sourced and
dated. **Average days on market is the single most useful figure in this conversation**, because it
turns "it feels slow" into "we're at 41 days in a market averaging 22." Never re-research it, and
never use a number you can't cite.

**Thin evidence?** If `Showings:` and `Feedback:` are empty, stop and get them first — hand to
**`listing-seller`**. A price conversation without showing data is an opinion, and the seller will
treat it as one.

---

## Phase 1 — The honest read (do this before writing anything)

Work out what the evidence actually says, and say it plainly to the agent first. There are only three
answers, and they're distinguishable:

| The evidence | What it means | What to do |
|---|---|---|
| **Showings, but no offers** | The price is wrong for what it is, or something specific is putting people off — the feedback says which | Price, or fix the thing |
| **Few or no showings** | Buyers aren't even looking — price is out of the search band, or the photos/copy aren't earning the click | Price band, or re-launch the presentation |
| **Normal activity, below-average time** | Nothing's wrong yet | **Patience.** Say so and stop |

**The third answer is a real answer.** A listing at 18 days in a 30-day market does not need a price
reduction, and recommending one to look busy is bad advice that costs the seller money. Say
plainly: *"This one's fine — you're inside the average. I'd give it two more weeks."* Then stop.

Give the agent the read in two or three sentences, with the numbers in it, before offering anything.

## Phase 2 — The price conversation

Only when the evidence points at price.

- **Never invent the new number.** Write the *structure* and leave `[YOUR NUMBER]` — the reduction
  has to come from the agent's own comps and their read of the search bands.
- **Lead with the evidence, not the ask.** The conversation opens with what the market said —
  showings, feedback themes with counts, days on market against the local average — and the number
  follows from it. A reduction that arrives before the evidence sounds like giving up.
- **Name the search-band effect** when it applies: a home at $505,000 is invisible to every buyer
  searching under $500,000, and moving under a round number often matters more than the size of the cut.
- **Script the hard moment** — the seller who says "we'll just wait." Respectful, firm, and honest
  about what waiting costs: more days on market, a staler listing, and usually a bigger reduction later.
  Write the actual words. **Never a script that corners them**, and never fake urgency.
- **One reduction, meaningful.** Write the plain case against a series of small cuts — they signal a
  falling price and teach buyers to wait.
- **No price predictions, no guarantees**, no "this will get it sold." The compliance gate applies at
  a kitchen table exactly like it applies in a caption.

**When the price changes**, write `Price:` to the new number and append to **`Price history:`**
(`$499,000 (2026-07-16) → $485,000 (2026-08-04)`). The re-launch content and the eventual sold post
both need to know a reduction happened.

## Phase 3 — The re-launch

A reduced or refreshed listing is legitimately new again — but only if it's presented as news, never
as a retreat.

- **The price-improvement post** — `listing-social` already wrote one as a **HOLD**. **Use it** (house
  rule 7) and update it with the real number. Frame it as opportunity and a real change, never as
  trouble. No "reduced!", no desperation, no "motivated seller."
- **The buyer-back list** — a short message to everyone who showed and didn't offer, and to the
  buyer-matches from `listing-outreach`. This is the highest-yield action in the whole stage: they
  already liked it, and now a real thing has changed. One line, no pressure.
- **The neighbour note** — only if the price moved enough to be genuinely newsworthy on the street.
- **What else to refresh**, chosen from what the feedback said: new photos if the photos are the
  problem, a re-shot lead image if the click-through is the problem, a different feature leading the
  MLS copy if the wrong thing is being sold. Hand to the skill that owns each — never rewrite here.

**If nothing has actually changed, don't re-launch.** Re-posting the same listing at the same price
teaches the feed to ignore the agent. Say that plainly.

## Phase 4 — The expiry conversation (before the expiry)

Two to three weeks before the listing agreement ends, this conversation is worth more than any post.

- **The honest position** — what happened, what was tried (from `Built:`), what the evidence says now,
  and the one thing that would change the outcome.
- **The three real options**, stated without spin: renew at a new price · take it off and re-launch
  later (seasonally, or after work is done) · stay the course, with what that costs.
- **Never pressure a renewal**, never imply another agent would do worse, never guarantee an outcome.
  An agent who is straight here often keeps the listing; one who spins loses it and the referral.

**If it expires anyway**, set the heading to `Expired` and stop. Per the schema, nothing fires on an
expired listing — no nagging, no content, no board nudges. Say one plain line and leave it alone.

## Phase 5 — Back on market (the deal that collapsed)

A pending sale that falls through is the one legitimate backward move: `Pending` → `Active`, with
`Stage: back on market`.

- **It is genuinely news** — write the back-on-market post, and the message to the buyers who lost out
  the first time (the under-bidders are the warmest list that exists).
- **Never explain why the deal collapsed** publicly. Not financing, not inspection, not the buyer.
  It's private, it can be defamatory, and it scares the next buyer off.
- Reset `Built:` expectations honestly with the agent — the launch doesn't run again from scratch.

---

## Compliance pass
Run the gate (`${CLAUDE_PLUGIN_ROOT}/shared/compliance-gate.md`). The ones that bite here:
- **No price predictions and no forecasts**, in the conversation or the content.
- **No "motivated seller," "must sell," "priced to sell," or "bring all offers"** — they broadcast the
  seller's position and can breach the agent's duty to them.
- **No stated reason** for a collapsed deal, ever.
- Nothing invented — every number from the listing block or `market-data.md`, cited and dated.

## Deliver + save
The honest read first, in plain words. Then only what the read calls for — never all five phases by
default. Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` as **`Revive — [Street Address]`**
and append `revive` to `Built:`. Update `Price:`, `Price history:`, and `Stage:` as they change, and
push the Brain immediately.

End on the honest line, not an upbeat one:

> Have the price conversation this week rather than next — the longer it sits, the more it costs them.

## Quality checklist
- [ ] Brain, listing block, **`Showings:` and `Feedback:`** all read — handed to `listing-seller`
      first if the evidence was thin.
- [ ] Days on market compared against a **cited** local average from `market-data.md`.
- [ ] **The honest read delivered first**, in two or three sentences, before anything was offered.
- [ ] **"It's fine, be patient" given as a real answer** when the evidence said so — no reduction
      recommended to look busy.
- [ ] New price never invented — `[YOUR NUMBER]` left for the agent's own analysis.
- [ ] Price conversation leads with evidence; search-band effect named; one meaningful cut, not a series.
- [ ] `Price:` and `Price history:` updated on any change.
- [ ] Re-launch uses the existing HOLD post (house rule 7); nothing re-launched when nothing changed.
- [ ] Buyer-back list written — the people who already showed.
- [ ] Expiry conversation honest, three real options, zero pressure; `Expired` set and then silent.
- [ ] Back-on-market handled without ever stating why the deal collapsed.
- [ ] No "motivated seller" / "must sell" language anywhere.
