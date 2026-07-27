---
name: listing-ads
description: >
  The ad plan for one listing — the strategy first, the copy second. Picks ONE ad to run (neighbour
  reach, buyer traffic, or open house attendance) and says why, names the runner-up, sets a plain
  starting budget and how long to run it, writes the primary text, headline and description with
  character counts, and carries the Meta Special Ad Category targeting note every single time. Reads
  the listing from the Brain so the property is never re-entered.

  Trigger on: "ads for my listing", "should I boost this listing", "facebook ad for [address]",
  "what ad should I run for my listing", "ad copy for my open house", "run an ad on this house".
---

# Listing Ad Plan

Most agents boost a post and hope. You do the opposite: tell them which **one** ad to run and why,
what to spend, and the two numbers that say keep it or kill it. The copy is the easy part.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then `identity/profile.md` (name, brokerage, market, contact —
never ask for these), `identity/voice.md` (so the ad sounds like them), and `identity/compliance.md`
(brokerage disclaimer and licence number, if it exists).

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md` and pull this property's block — address, beds/baths, price,
features, the story, launch stage, open house date.

- Not on file? Hand to **Listing Intake** first, then come straight back. Never re-ask the property.
- Several on file and they didn't say which? One line: *"Which one — Maplewood or Birch?"*
- On file? Say so and go: *"Got it — building the ad plan for 412 Maplewood."*

The **only** thing you may ask is budget, as an optional aside. Skipped → use the range below.

## Phase 1 — Pick the ad

Three ads exist. Recommend **ONE** as the primary, name the runner-up in a line, and say plainly why
it won. Choose from their goal and launch stage — don't ask which they want, tell them.

| The ad | What it does | Run it when |
|---|---|---|
| **Neighbour reach** — "just listed near you" around the property | Markets the home *and* wins the next listing on that street | Default. Coming soon or freshly live, no open house in 4 days |
| **Buyer traffic** — clicks to the listing page | Sends interested buyers to photos and details | The home is live and the goal is showings, not name recognition |
| **Open house attendance** | Fills the door on the date | An open house is 3–4 days out — start it then, not sooner |

**The default is neighbour reach** — say why in their terms: buyers come from everywhere, but the
neighbours are who hire them next. It's the only one of the three that pays twice. If an open house
is on file within four days, that becomes the primary and neighbour reach is the runner-up. Never
run two at once on a starting budget — one ad, one job.

## Phase 2 — Budget + duration

Plain numbers, said as a sentence, not a spreadsheet: *"Start at $75 over 5 days. If it's moving, add
to it."*

- **Starting range:** $50–$100 total for a first ad. If they gave a budget, use theirs.
- **Duration:** 4–6 days for neighbour reach or buyer traffic; 3–4 days for an open house ad, ending
  the morning of.
- **The rule:** start small, extend what works. Give it 2 full days before judging — day one is the
  platform figuring things out.

**Never promise leads, views, calls, or results.** Not a number, not a range, not implied.

## Phase 3 — Write the copy

Their voice, about **this** home — the kitchen, the cul-de-sac, the greenway. Never a line that could
sell any house in any city. Deliver exactly this, counts shown underneath each:

- **Primary text — Option A (short):** 2–3 lines. The street, the best feature, the price, the ask.
- **Primary text — Option B (story):** 4–6 lines from the listing block's story — the reno, why
  they're moving, the street. *(word count under both)*
- **Headline:** ≤40 characters. Count it, show the count, trim before showing if it's over.
- **Description:** ≤30 words. Show the count.
- **Suggested image:** name the shot from the features on file. Never invent one.

Anything the listing block doesn't have stays out — or **[CONFIRM]** if the ad genuinely needs it.

## Phase 4 — Compliance pass (Special Ad Category + fair housing)

Run this before you deliver. Every run, no exceptions. **The targeting note goes in every time**, in
plain words:

> Heads up on targeting: housing ads run under Meta's **Special Ad Category**, so the options are
> deliberately limited. No age selection, no gender selection, no ZIP-level or narrow-audience
> targeting, and a minimum radius applies — currently **15 miles in the US**. Location and broad
> interests only. Confirm the current rules in Ads Manager when you set it up, since Meta changes them.

Then check the copy itself:
- Sells the property, the lifestyle, the location. Never the neighbours, never who'd "fit" here,
  never schools as code for anything, never demographics.
- No "won't last," no invented urgency, no price predictions, no guarantees, no result promises.
  Urgency is the open house date or nothing.
- Append the brokerage disclaimer and licence number from `identity/compliance.md`. Empty file →
  deliver anyway and say plainly it's unset. Banned words: unlock, supercharge, game-changer,
  revolutionary, secret weapon, leverage.

## Phase 5 — Deliver + save

Lead with the recommendation, not the copy.

1. **Run this one** — the primary ad, one sentence on why, the runner-up named.
2. **Budget + duration** — the number and the days.
3. **The copy** — both primary texts, headline, description, counts under each.
4. **Targeting note** — the Special Ad Category block above.
5. **What to watch** — the 2–3 numbers, in plain English. These say extend or stop; they promise
   nothing:
   - **Cost per click (or per result)** — climbing day over day means the ad is tiring. Kill it or
     swap the image.
   - **Reach** — how many people actually saw it. Flat reach on a live budget means the audience is
     too small; widen the radius.
   - **What happened offline** — calls, texts, RSVPs, neighbours mentioning it. The realest signal.

Save as **`Ad Plan — [Street Address]`** in the listing folder per
`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`, and add "Ad Plan" to the **Built so far** line in
the listing block. No Drive connector? Clean copy blocks in chat, and say connecting Drive means it
saves itself next time. Then offer the next piece — the social posts, the postcard, or the neighbour
outreach texts that pair with a neighbour-reach ad.

## Quality checklist
- [ ] Brain and listing block read; the property was never re-asked.
- [ ] ONE primary ad recommended with a reason, runner-up named in a line.
- [ ] Budget range and duration as a plain sentence, with "start small, extend what works."
- [ ] Primary text ×2 (short + story), headline ≤40 characters, description ≤30 words, counts shown
      under each and counted before showing.
- [ ] Every line names something real about THIS home — nothing invented, gaps as [CONFIRM].
- [ ] The Special Ad Category note is present · what to watch included, in plain English.
- [ ] No result promises anywhere — no leads, views, clicks, or outcomes predicted.
- [ ] Fair-housing pass done; compliance block appended or its absence named.
- [ ] Saved as `Ad Plan — [Street Address]` in the listing folder (or the gap explained kindly).
