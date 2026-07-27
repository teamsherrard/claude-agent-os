---
name: listing-intake
description: >
  The keystone of the Listing Launch System — captures a new listing ONCE so nothing is ever re-asked.
  Runs one short form (address, beds/baths, price, features, the story, launch stage), writes the
  listing block into the agent's Brain, and creates the listing's Drive folder. Every other skill in
  this plugin reads that block, so the agent enters the property one time and gets a whole launch.

  Also the Dispatch door: a single sentence on the go — "Just listed 14 Oak, start the content" —
  captures the address, asks only for the gaps, and starts the launch without a form.

  Trigger on: "I just got a listing", "new listing", "add my listing", "set up my listing",
  "capture this listing", "I'm listing [address]", "just listed [address]", "start the content for
  [address]", or automatically as the first step whenever a Listing Launch skill is asked to build
  something for a property that isn't on file yet.
---

# Listing Intake (the keystone — run once per property)

Every other skill in this plugin reads what this one writes. Capture the home once, well, and the
agent never types the address again.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, contact (never ask for these).
- `identity/voice.md` — how they talk, for everything built later.
- `memory/listings.md` — what's already on file. If this address is already there, don't re-capture:
  show what you have and ask if anything changed.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — The Dispatch door (one sentence, on the go)

An agent driving away from a listing appointment says one line: *"Just listed 14 Oak — start the
content."* That's a valid intake. Don't answer it with a seven-line form.

**Pull what the sentence already gave you** — the address, and the intent to start now. Then ask only
for what the first piece genuinely needs, in **one short message, three lines maximum**:

> On it. Three things and I'll start:
> price, beds/baths, and the one feature that sells it?

- **Never ask for more than three things in the Dispatch path.** Everything else gets filled in later
  by the skill that actually needs it — the brochure can ask about square footage when it's building
  a brochure.
- **Capture the launch stage from their words.** "Just listed" = live now. "Listing next week" =
  coming soon. Don't ask what they already said.
- If they reply with even less, take it and go. A listing block with an address and one feature is
  enough to write a just-listed post — and a post tonight beats a complete file next week.
- Write the block, then hand straight to **Listing Launch Plan**. No confirmation screen, no summary.

If they came in with a full sentence but the address is ambiguous (*"the Oak one"*), match it against
`memory/listings.md` first. Only ask if there's a real collision.

**Otherwise — the full form below.** Use it when they're at a desk, when they said "set up my
listing," or when the launch is being built properly rather than urgently.

## Step 3 — Ask once (one message, nothing else)

Skip any line their message already answered. Say it warm and quick — they're busy and probably
standing in the driveway.

> Congrats on the listing 🎉 Give me the basics once and I'll have everything ready to launch —
> posts, description, brochure, ads, all of it.
>
> 1. Address: ____
> 2. Beds / baths / square footage: ____
> 3. Price: ____
> 4. Top 3–5 features — what makes this one worth seeing: ____
> 5. Anything a buyer would love or a neighbour would talk about — the reno, the lot, the street,
>    the view (optional): ____
> 6. Where are we? **Coming soon** · **Live now** · **Open house on [date]**: ____
> 7. Anything the seller wants known or avoided — timeline, tenant, as-is, no sign (optional): ____
>
> Short, messy answers are perfect — reply in one message.

**Never invent a fact to fill a gap.** Anything they skip stays blank and shows as `[CONFIRM]` later.

## Step 4 — Write the listing into the Brain

Append a block to `~/realtor-brain/memory/listings.md` (create the file if missing). Use this exact
shape so every skill can read it:

```
## 412 Maplewood Drive  ·  captured 2026-07-16  ·  status: live now
- Beds/baths/sqft: 3 / 2.5 / 1,840
- Price: $485,000
- Features: renovated kitchen · fenced yard · quiet cul-de-sac near the greenway
- The story: sellers relocating; kitchen redone two years ago
- Seller notes: wants a Saturday open house
- Drive folder: [link]
- Built so far: (updated by each skill as it runs)
```

Then confirm in one plain line: *"Saved — I've got 412 Maplewood on file. I won't ask again."*

## Step 5 — Create the listing's Drive folder

Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: find-or-create `[Agent Name] — Listings/`,
then create `YYYY-MM-DD · [Street Address]/` inside it. Save the folder link into the listing block.
No Drive connector? Say so kindly, keep going, and note that connecting it means everything saves
itself next time.

## Step 6 — Hand off to the launch

Offer the whole thing first, the pieces second:

> Want me to build the full launch — the 14-day plan, MLS description, posts, ads, the video, the
> shorts, and the open house kit? Or just one piece to start?

If they say the full launch, hand to **Listing Launch Plan**. If they name a piece, hand straight to
that skill. Either way, they never re-enter the property.

**Came in through the Dispatch door?** Skip the offer entirely — they already said "start the
content." Hand straight to **Listing Launch Plan** and let it lead.

## Quality checklist
- [ ] Brain read; nothing asked that the Brain already answers.
- [ ] **Dispatch sentence handled as a Dispatch sentence** — address taken from their words, three
      questions maximum, straight to the launch. Never a seven-line form for a one-line request.
- [ ] Full form used only when they're at a desk or asked for proper setup.
- [ ] Launch stage inferred from their words ("just listed" = live now), never re-asked.
- [ ] Every skipped answer left blank — nothing invented.
- [ ] Listing block written in the exact shape above, with the date and status.
- [ ] Drive folder created (or the connector gap explained kindly).
- [ ] Ends by offering the full launch or a single piece — or, on the Dispatch path, just starts.
