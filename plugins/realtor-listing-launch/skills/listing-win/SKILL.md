---
name: listing-win
description: >
  WIN IT — the listing presentation and pre-listing package that gets the signature, built before the
  listing exists. Writes the pre-listing package sent ahead of the appointment (so the seller arrives
  already sold), the presentation itself slide by slide with what to SAY on each, the pricing
  conversation scripted honestly, answers to the four objections that actually lose listings, and the
  follow-up if they don't sign in the room. Reads the Brain for their offer, proof, and voice — the
  whole thing argues their case, not a generic one.

  Trigger on: "listing presentation", "listing appointment", "I have a listing appointment",
  "pre-listing package", "how do I win this listing", "prep me for a listing appointment",
  "seller presentation", "what do I say to get the listing", "CMA presentation", "win the listing".
---

# WIN IT — the listing presentation

Everything else in this system assumes they got the listing. This is the part that gets it.

The agent has an appointment — often tomorrow, often tonight. Give them the package to send ahead,
the presentation to walk through, and the words for the two moments that decide it: the price, and
the ask. Written from their real offer and their real proof, so it argues *their* case.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, credentials, contact (never ask).
- `identity/offer.md` — **the most important file here.** Their services, guarantees, USP, and why
  someone hires them. The entire presentation is this file, made persuasive.
- `identity/proof.md` — testimonials, stats, case studies. Real proof beats every adjective. If it's
  empty, say so once and write the presentation around their process instead — never invent a stat.
- `identity/voice.md` — they're going to say these words out loud, across a kitchen table.
- `identity/market.md` — communities and price ranges, for the pricing section.
- `identity/compliance.md` — what they legally cannot claim to a seller.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Ask the four things only they know

The Brain has everything about *them*. It has nothing about *this seller*. One short message:

> Nice — let's win it. Four quick things:
>
> 1. Address, and roughly what it's worth: ____
> 2. Why are they selling, and when do they need to be out? ____
> 3. Are they interviewing other agents — or talking to anyone about listing it themselves? ____
> 4. Anything you already know they're worried about — price, commission, timing, a bad past
>    experience? ____
>
> Guesses are fine. Even "no idea" is fine.

**Never ask more than these four.** They're walking out the door. If they answer three, build on
three and mark the rest `[CONFIRM]`.

If the address is already in `memory/listings.md`, they've won it — say so and hand to
**Listing Launch Plan** instead of running this.

---

## Phase 1 — The pre-listing package (send it before the appointment)

The package that arrives the night before is what turns an interview into a formality. Write it as a
short document the agent emails or drops off — not a brochure, a case.

Six sections, in this order:

1. **A one-paragraph note** to the seller by name — thanks for the time, here's what to expect at the
   appointment, and how long it'll take. Warm, short, human.
2. **Who I am, in one page** — from `offer.md` and `profile.md`. Their record, their market, what
   they specialise in. Uses `proof.md` numbers if they exist.
3. **What actually happens when I list your home** — the marketing plan in plain steps. *This is
   where our own system becomes the pitch:* professional photos, MLS copy written to convert, a
   14-day launch plan, a property video and a cinematic tour, social and paid reach, an open house
   with a real follow-up. Concrete, sequenced, and true — never a feature list.
4. **What I need from you** — the short list of what makes it go smoothly. Sets expectations early.
5. **What to have ready for our appointment** — mortgage payoff ballpark, any recent work done,
   timeline. Makes the meeting productive and makes them feel organised.
6. **Two or three proof pieces** — real testimonials from `proof.md`, chosen to match this seller's
   situation (a relocation seller gets relocation proof). If `proof.md` is empty, replace this section
   with a short "how I'll keep you updated" section rather than a hollow one.

Close the package with the agent's contact block and the disclaimer from `compliance.md`.

## Phase 2 — The presentation, slide by slide

Ten to twelve sections. For each one: **what's on it** and **what to say** — because the slide isn't
the presentation, the sentence is.

Give them this as a table they can actually use in the room:

| # | Section | What's on it | What to say |
|---|---|---|---|
| 1 | The opening | Their name, the address, one photo | "Before I show you anything — tell me about the house." |
| 2 | What I heard | Their reason for selling, their timeline | Play back their own words. This is the whole rapport step. |

Cover, in this order:
1. **Open on them, not you** — one question, then listen. The best listing presentations are 70%
   the seller talking.
2. **What I heard** — repeat their situation back. Selling reason, timeline, worry.
3. **The market right now** — what's actually happening in their community. Only real numbers, cited.
4. **What your home has** — the specific features that will carry the marketing.
5. **The price** — see Phase 3. Don't rush it and don't bury it.
6. **How I market a home** — the launch plan, concretely. The strongest section they have.
7. **Where the buyers come from** — how their marketing actually reaches people.
8. **Proof** — past sellers, results, testimonials.
9. **What I charge and what it covers** — plain, unapologetic, itemised.
10. **What happens next** — the first 7 days after signing, step by step.
11. **The ask** — see Phase 4.

Write the "what to say" lines in their voice. One breath each, sayable across a table.

## Phase 3 — The pricing conversation

This is where listings are lost, so script it honestly.

- **Never invent a price or a CMA.** We don't have their comps. Write the *structure* of the
  conversation and leave `[YOUR NUMBER]` and `[YOUR COMPS]` where the agent's own analysis goes.
- **Give them the three-part frame:** here's what the market says · here's what I'd list at and why ·
  here's what happens if we go higher (with the real cost: days on market, the stale-listing problem,
  the eventual reduction that nets less than the honest price would have).
- **Script the hard moment** — the seller who wants more than the market supports. Write the actual
  words, respectful and firm, that hold the number without insulting their home.
- **No price predictions**, no "I can get you more than anyone else," no guarantees. Compliance
  applies at the kitchen table exactly like it applies in a caption.

## Phase 4 — The four objections, and the ask

Write real answers, in their voice, to the four that actually lose listings:

1. **"Another agent said they'd list it higher."**
2. **"Your commission is more than [other agent]."**
3. **"We want to think about it."** — the real one. The answer is a question, not a pitch.
4. **"Can we try it ourselves first?"**

Each answer: acknowledge honestly → one true reframe → one question that hands the conversation back.
Never a script that argues the seller into a corner. Never a fake scarcity line.

Then **the ask** — the closing words, written out. Short, direct, no throat-clearing. Plus the
"they didn't sign tonight" follow-up: a next-day message that adds one useful thing and asks for a
decision by a real date.

## Phase 5 — Compliance pass

- No guarantees of price, timeline, or outcome. No "I'll get you more than any other agent."
- Fair housing applies: describe the home and the market, never who will buy it or who lives nearby.
- Commission is negotiable and must never be described as fixed, standard, or set by anyone.
- Any market stat carries its source and month, or it doesn't appear.
- Append the brokerage disclaimer and licence number per `compliance.md`. Empty? Deliver and say so.
- Banned words: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage.

## Phase 6 — Deliver + save

In chat, in this order: **the pre-listing package** → **the presentation table** → **the pricing
script** → **the objections + the ask**. Lead with the package, because that's the thing they have to
send tonight.

Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`. This listing doesn't exist yet, so there's
no listing folder — save into `[Agent Name] — Listings/` as **`Listing Presentation — [Street
Address]`**, and note that the full folder gets created when they win it.

End with one plain line:

> Send the package tonight — the appointment goes differently when they've already read it. And when
> you sign it, say "I got the listing" and I'll start the launch.

If they come back having won it, hand to **Listing Intake**.

## Quality checklist
- [ ] Brain read; offer, proof, and voice pulled — the presentation argues THEIR case, not a generic one.
- [ ] Only four questions asked, in one message.
- [ ] Pre-listing package written as a sendable document, six sections, contact block and disclaimer.
- [ ] Presentation covers all 11 sections with **what to say** on each, in their voice.
- [ ] Opens on the seller talking, not on the agent's credentials.
- [ ] No price, no CMA, and no comps invented — `[YOUR NUMBER]` left for the agent's own analysis.
- [ ] Pricing script includes the honest "list too high" cost and the hard-moment words.
- [ ] All four objections answered, each ending in a question, none manipulative.
- [ ] The ask is written out, plus the didn't-sign-tonight follow-up with a real date.
- [ ] No guarantees, no commission-is-standard language, fair housing clean, proof real or omitted.
- [ ] Saved, and ends by pointing at the intake for when they win it.
