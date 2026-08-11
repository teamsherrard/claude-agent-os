---
name: listing-sold
description: >
  CLOSE IT — the just-sold content, written now and queued for closing day. The sold post that proves
  the agent sells rather than just lists, the client story told as the seller's win instead of the
  agent's, the review request timed and worded to actually get written, the thank-you note, and the
  "thinking of selling on this street?" neighbour follow-up that turns one closing into the next
  listing. Reads the whole launch so the sold post closes the story the just-listed post opened.

  Trigger on: "just sold post", "it closed", "we closed on [address]", "sold content", "ask for a
  review", "review request", "client story", "close it", "what do I post now that it sold",
  "just sold content for [address]".
---

# CLOSE IT — the content that closes the loop

A closing is the only proof an agent has that any of this works — and it's the piece most of them
never post, because by closing day they've moved on to the next thing. Write it now, queue it, and
turn one sold sign into the next listing on that street.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, contact (never ask).
- `identity/voice.md` — the client story lives or dies on this.
- `identity/proof.md` — where the finished review and result get written back to.
- `identity/offer.md` — their CTA.
- `identity/content-engine.md` — their platforms.
- `identity/operations.md` — follow-up cadence and signature, if set.
- `identity/compliance.md` — sold-price display rules, disclaimer, licence.

If `~/realtor-brain/` is missing, **pull it first — never assume no Brain**: every fresh session/project starts with an empty sandbox while the Brain lives safely in the agent's cloud workspace (Drive/OneDrive). Run **realtor-brain-sync** (PULL — its locate ladder finds the workspace). Only if the CLOUD truly has no Brain either, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing and its history
Read `~/realtor-brain/memory/listings.md` — address, features, list price, status, and **Built so
far**. **Never re-ask the property.**

The launch history matters here: **the sold post should close the story the just-listed post opened.**
If the launch led on the kitchen, the sold post pays off the kitchen. Read what was built before you
write.

## Step 3 — Ask the three things only closing day knows

One short message, nothing else:

> Congrats 🎉 Three quick things and I'll have everything ready:
>
> 1. Did it sell at, over, or under asking — and can you share the number? ____
> 2. How long was it on market? ____
> 3. Anything about the sellers or the buyers worth telling — a relocation, first home, a bidding
>    situation, something that went sideways and got fixed? ____

**Sold price is not always publishable.** Some markets and brokerages restrict it, and some sellers
don't want it out. If they hesitate or `compliance.md` restricts it, write every piece **without the
number** — "sold above asking" carries the same weight and breaks no rules. Never publish a price the
agent didn't clear.

**Never name buyers or sellers** in public content without the agent confirming they've asked. Default
to "my sellers."

---

## Phase 1 — The sold post

The one that proves they sell. Written to post on closing day.

- **Hook** — the result, not the ritual. Never "SOLD!" as the opener. *"Nine days. Over asking. And
  the sellers are already unpacking in Calgary."*
- **The middle** — what buyers actually responded to, named specifically (the same feature the launch
  led on). One line on what the sellers did right, so it reads generous rather than boastful.
- **The close** — the soft neighbour line: *"If you're on [street] and wondering what yours would go
  for now, ask me."* This is the whole reason the post exists.
- 5–8 hashtags anchored to their market. Adapt length per platform if `content-engine.md` names them.

## Phase 2 — The client story

Longer, for a feed post, a newsletter, or a website case study. **Told as the seller's story, not the
agent's.**

- **Where they started** — the situation and the worry. Real, specific, from what the agent said.
- **What was hard** — the honest middle. A story with no friction reads like an advertisement, because
  it is one. If nothing was hard, say what was uncertain.
- **What we did** — the agent's actual work, told plainly, without adjectives.
- **Where they landed** — the outcome and what it meant.
- **One line of what it means for the reader**, then the CTA.

The agent is a supporting character in this. If a draft has them as the hero, rewrite it.

## Phase 3 — The review request

Most reviews never get written because the ask is vague and badly timed. Fix both.

- **Timing:** 2–4 days after closing — past the chaos, still inside the warmth. Say so.
- **The message** — short, personal, references the specific thing about *their* sale. Includes the
  direct link and one honest line on why it matters to a small business.
- **The unlock:** give them something to answer instead of a blank box. *"If it helps — a lot of
  people just write about what it was like when [the hard part] came up."* A prompt gets a review;
  "would you mind leaving a review" gets a maybe.
- **One follow-up**, ten days later, once, warm, and then never again. Write it, and say plainly that
  it's the last one.
- **Never** offer anything of value in exchange for a review, and never write the review for them.

## Phase 4 — The thank-you note and the neighbour follow-up

**The thank-you** — a real note, handwritten or emailed, sent at closing. Three or four sentences,
specific to them, asking for nothing. This is the one that doesn't convert and matters most.

**The neighbour follow-up** — the "just sold on your street" message to the same neighbours who got
the open house invite. What it sold for (if publishable), what that means for their street, and a
plain offer to tell them what theirs is worth. **One message, not a campaign.**

If the agent wants it mailed, hand to **`listing-print`** for the Just Sold postcard rather than
writing a competing one here.

## Phase 5 — Write the result back to the Brain

This is the step that compounds, and the one everyone skips.

- Update the listing block in `memory/listings.md`: status `sold`, the date, days on market, and the
  outcome (at / over / under asking).
- Append the result to `~/realtor-brain/identity/proof.md` — the outcome as a usable proof line, and
  the review text once it arrives. **This is what makes the next listing presentation stronger**, and
  what `listing-win` reads.
- Add `Sold content` to **Built so far**.

Say it plainly in one line: *"I've added this one to your proof — your next listing presentation just
got better."*

## Phase 6 — Compliance pass

- **Sold price only if cleared** by the agent and `compliance.md`. When in doubt, leave it out.
- No client names without confirmed permission. No photos of clients unless the agent says they asked.
- Fair housing: describe the home, the sale, and the market — never who bought it, never who the
  street suits.
- No market predictions off one sale. "Over asking" is a fact; "the market's back" is a forecast.
- Nothing invented — no days-on-market, no offer count, no number the agent didn't give.
- Disclaimer and licence per `compliance.md`. Unset? Deliver and say so once.
- Banned words: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage.

## Phase 7 — Deliver + save

In chat: **the sold post** → **the client story** → **the review request (+ the one follow-up)** →
**the thank-you note** → **the neighbour follow-up**. Mark clearly what sends on closing day and what
waits 2–4 days.

Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` as **`Sold — [Street Address]`** in the
listing's folder.

End with one plain line:

> Send the thank-you the day it closes and the review ask three days later — that order is the whole
> trick.

## Quality checklist
- [ ] Brain and listing block read, **including Built so far** — the sold post pays off what the
      launch led on.
- [ ] Only three questions asked, in one message.
- [ ] Sold price used only if the agent cleared it and compliance allows; every piece works without it.
- [ ] No client names or photos without confirmed permission.
- [ ] Sold post opens on the result, not "SOLD!", and closes on the neighbour line.
- [ ] Client story has the seller as the hero and an honest hard middle — not an advertisement.
- [ ] Review request is timed (2–4 days), specific, gives them something to answer, and has exactly
      one follow-up.
- [ ] Nothing offered in exchange for a review; no review written for the client.
- [ ] Thank-you note asks for nothing.
- [ ] Neighbour follow-up is one message, and hands to `listing-print` if they want it mailed.
- [ ] **Result written back to `proof.md`** and the listing block marked sold.
- [ ] Compliance pass run; no forecasts off one sale; nothing invented.
