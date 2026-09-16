---
name: listing-offers
description: >
  SELL IT — the offer moment, handled fast and handled right. Writes the offer-deadline announcement
  that brings the fence-sitters in, the "final calls" messages to every agent who showed the home,
  the multiple-offer instructions that keep the process clean and defensible, and the quiet
  under-bidder follow-up that turns a lost bidder into the agent's next buyer client. A listing gets
  one day like this — this is the skill that doesn't waste it.

  Trigger on: "we have an offer", "we got an offer", "multiple offers", "offer deadline", "reviewing
  offers", "setting an offer deadline", "we're in multiples", "highest and best", "call for offers",
  "final calls for my listing", "it's under contract", "we accepted an offer".
---

# SELL IT — the offer moment

Every other stage exists to produce this day. It's short, it moves fast, and what the agent does in
the next few hours decides the price. It's also the one stage where a careless message creates real
liability — so the process rules matter as much as the copy.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Read the schema** (`${CLAUDE_PLUGIN_ROOT}/shared/listing-schema.md`) — this skill moves `Stage:` to
`reviewing offers`, then the heading to `Pending`.

> **The boundary, stated once:** this skill writes **communication and process**. It does not advise
> on which offer to accept, does not compare terms, does not interpret contract language, and does not
> tell an agent or a seller what an offer is worth. Those are the agent's professional judgment and
> their brokerage's and lawyer's territory. If asked, say so plainly and help with the words instead.

---

## Step 1 — Load the Brain and the listing
Read `~/realtor-brain/brain.md`, then `identity/profile.md`, `identity/voice.md`, and
`identity/operations.md`. Read the listing block: price, stage, `Showings:`, `Built:`, `Open house:`.

Read `~/realtor-brain/memory/clients.md` — the buyers who matched this home. Some of them are about
to be under-bidders, and Phase 4 is the most valuable thing in this skill.

## Step 2 — Ask the two things that shape everything

> Quick — two things:
> 1. Is there a deadline, or are you reviewing as they come? ____
> 2. How many are you expecting — one, or are you in multiples? ____

Nothing else. **Never ask what the offers say**, and never record offer terms in the Brain — price,
conditions, and dates on a live negotiation are confidential to the seller, and a listing block is
not the place for them.

---

## Phase 1 — The offer-deadline announcement

Only when there's a real deadline. This is the post that brings in every buyer who was "thinking
about it."

- **The date and time, exactly**, and the address. Urgency comes from the real deadline and nothing else.
- **Never state how many offers exist**, in a post, a text, or a caption — not "already have two,"
  not "multiple offers received." Whether that can be disclosed at all is governed by the agent's
  board and brokerage rules and by what the seller has authorised. **Say that once to the agent** and
  leave the disclosure decision with them.
- **Never invent interest.** No "offers expected," no "huge response," if that isn't true.
- Feed + stories, their platforms, and one line for the listing update.

## Phase 2 — Final calls to the agents who showed

The highest-conversion message of the day, and the one most agents forget in the rush.

- **A short, plain note to every agent who showed the home** — the deadline, the address, and
  nothing else. Three lines, colleague to colleague, no hype and no exclamation marks.
- **A separate note to the buyer-matches** from `listing-outreach` and `clients.md` who never showed:
  one last "this is the deadline if you were considering it."
- **Never suggest a number**, never hint at what it'll take, never imply competition that doesn't
  exist. *"Offers are due Tuesday at 5"* is the entire message.

## Phase 3 — The multiple-offer process note (to the agent, never published)

When there are several, a clean process protects the seller and the agent. Write it as a short
checklist **for the agent**, explicitly not as anything to send:

- Confirm and follow the **brokerage's and the local board's rules** for multiple offers — they vary
  by jurisdiction and they govern this, not us.
- Treat every buyer's agent **identically**: same information, same deadline, same response time.
- Put the seller's instructions **in writing** before the deadline, and keep the paper trail.
- Acknowledge every offer received, in writing.
- **Never disclose offer terms between competing buyers** unless the rules and the seller explicitly
  allow it.

Then the line that matters: **"which offer to take is your call and your brokerage's — I'll write
whatever you need to say, but I won't weigh the terms for you."**

## Phase 4 — The under-bidder follow-up (where the next client comes from)

Usually skipped, and it's the most valuable message in the whole stage. Every buyer who lost has just
proven they're ready, funded, and looking in that exact area.

- **To the losing buyers' agents** — thank them plainly for a clean offer, and say honestly that it
  came down to terms. Short, respectful, no gloating, no detail about the winning offer.
- **To any unrepresented under-bidder** — only if they came through the agent directly: a warm,
  no-pressure note offering to send what else fits what they were after. This is a genuine lead, and
  the whole reason to do it well.
- **Never reveal what the winning offer was**, to anyone, ever.

## Phase 5 — Accepted: hand forward

When one is accepted:
- Move the heading to **`Pending`** and `Stage: under contract`. Append `offers` to `Built:`.
- Add the closing date and any condition-removal date to `~/realtor-brain/memory/deadlines.md` — that
  's what puts them in the agent's morning briefing.
- **Hand to `listing-sold`** so the closing-day content is written now, while the story is fresh,
  rather than on the day itself when they've moved on.
- **Say nothing publicly yet.** A "sold" post before closing is wrong and occasionally disastrous —
  conditional deals collapse. The just-sold content waits for the actual close. If it does collapse,
  **`listing-revive`** handles back-on-market.

---

## Compliance pass
Run the gate (`${CLAUDE_PLUGIN_ROOT}/shared/compliance-gate.md`). The ones specific to this stage:
- **Never state or imply the number of offers**, or any offer's terms, publicly.
- **Never invent interest or competition.** Fake urgency here isn't just bad copy — it's a
  misrepresentation in a live negotiation.
- **Never advise on which offer to accept**, or interpret contract terms.
- **No offer terms written into the Brain.**
- **No "sold" content before the deal actually closes.**
- Urgency comes only from the real deadline.

## Deliver + save
In chat, in the order they'll use it today: **the deadline post** → **the agent final-calls** →
**the buyer-match texts** → **the process checklist (marked: for you, not to send)** → **the
under-bidder follow-ups (marked: after it's decided)**. Label the timing on every piece — nothing here
should go out at the wrong moment.

Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` as **`Offers — [Street Address]`**, append
`offers` to `Built:`, and push the Brain.

End with one plain line:

> Text the agents who showed — that's the one that moves the number, and it takes four minutes.

## Quality checklist
- [ ] Brain, listing block, and `clients.md` read; only the two shaping questions asked.
- [ ] **No offer terms asked for, and none written to the Brain.**
- [ ] Deadline post carries the real date and time and **never the number of offers**; the disclosure
      decision left with the agent and their board rules named once.
- [ ] No invented interest or competition anywhere.
- [ ] Final-calls note written to **every agent who showed**, plus the buyer-matches.
- [ ] Process checklist marked clearly as **for the agent, never to send**, and defers to the
      brokerage's and board's rules.
- [ ] **Never advised which offer to take** — said so plainly if asked.
- [ ] Under-bidder follow-ups written; the winning offer never revealed.
- [ ] On acceptance: `Pending` + `Stage: under contract`, dates to `deadlines.md`, handed to
      `listing-sold`, and **nothing published until it actually closes**.
