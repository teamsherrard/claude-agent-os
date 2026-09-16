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

If `~/realtor-brain/` is missing, **pull it first — never assume no Brain**: every fresh session/project starts with an empty sandbox while the Brain lives safely in the agent's cloud workspace (Drive/OneDrive). Run **realtor-brain-sync** (PULL — its locate ladder finds the workspace). Only if the CLOUD truly has no Brain either, send them to **Realtor AI Brain — Setup** and stop.

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
  coming soon. "Open house Saturday" = an open house date. Don't ask what they already said.
- **Write the block in the canonical shape anyway** (`${CLAUDE_PLUGIN_ROOT}/shared/listing-schema.md`),
  just with fewer lines filled. A short block is fine; a differently-shaped block is not.
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
> posts, description, video, ads, all of it.
>
> 1. Address: ____
> 2. What kind of place — house, townhouse, condo, acreage: ____
> 3. Beds / baths / square footage: ____
> 4. Price: ____
> 5. Top 3–5 features — what makes this one worth seeing: ____
> 6. Who's it really for — a first move out of a condo, a family needing space, someone downsizing
>    (optional): ____
> 7. Anything a buyer would love or a neighbour would talk about — the reno, the lot, the street,
>    the view (optional): ____
> 8. Where are we? **Coming soon** · **Live now** · **Open house on [date and time]**: ____
> 9. Are the photos back yet? Drop the folder link if you have one (optional): ____
> 10. Anything the seller wants known or avoided — timeline, tenant, as-is, no sign (optional): ____
>
> Short, messy answers are perfect — reply in one message.

**Never invent a fact to fill a gap.** Anything they skip stays blank and shows as `[CONFIRM]` later.

**Why the four newer questions earn their place** — each one stops a later skill re-asking:
- **Type** changes the copy in every stage. A condo launch is not a detached launch.
- **Who it's for** drives the angle of every piece. Keep it a *situation* (downsizing, relocating),
  **never** a protected class — fair housing applies to this field like any other.
- **The open house date and time** is what SHOW IT and the door hanger gate on.
- **The photos** are what TOUR IT, the brochure photo plan, and the editor hand-off all need. Asked
  here, never asked again.

## Step 4 — Write the listing into the Brain

Append a block to `~/realtor-brain/memory/listings.md` (create the file if missing), in the one
canonical shape defined by **`${CLAUDE_PLUGIN_ROOT}/shared/listing-schema.md`** — that file is the
authority, and this is what it looks like filled in:

```
## 412 Maplewood Drive — Active
- Captured: 2026-07-16 · Stage: live now
- Type: Detached · Beds/baths/sqft: 3 / 2.5 / 1,840
- Price: $485,000
- Target buyer: move-up family, first move out of a condo
- Features: renovated kitchen · fenced yard · quiet cul-de-sac near the greenway
- The story: sellers relocating; kitchen redone two years ago
- Seller notes: wants a Saturday open house
- Open house: 2026-07-25 · 1–3pm
- Photos: not yet
- Drive folder: [link]
- Built:
```

- **The heading's status word is `Active` · `Pending` · `Sold`** — the same vocabulary the Brain's own
  listings template uses, so one file holds one shape no matter which plugin wrote the block.
- **`Stage:` carries the launch stage** (`coming soon` · `live now` · `open house` · `under contract`
  · `sold`) — the finer detail this plugin runs on.
- **Omit a line entirely rather than inventing a value.** A missing optional field is not a question.
- **This address already on file?** Don't write a second block — show what's there and ask if
  anything changed. Two blocks for one property is the one thing that breaks every later skill.

Then confirm in one plain line: *"Saved — I've got 412 Maplewood on file. I won't ask again."*

**Write the dates where the AI Admin can see them.** If there's an open house date, or the seller
gave a possession or closing date, add them to `~/realtor-brain/memory/deadlines.md` too — that's
what puts the open house on the agent's morning briefing instead of only in this plugin.

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

**First listing ever? Offer setup — but only at the END, and only once.** Read `config.md` for a
`Listing Launch setup:` line. If it's missing, add one line *after* the launch is under way — never
before, and never as a gate:

> One more thing when you've got two minutes — say *"set up my listing system"* and I'll lock in your
> MLS limit, your farm, and your brokerage disclaimer so I stop asking.

That routes to **`listing-setup`**.

Line present (`done` or `declined`) → say nothing. **Never interrupt a launch to run setup** — the
listing is time-sensitive and the setup is not.

## Quality checklist
- [ ] Brain read; nothing asked that the Brain already answers.
- [ ] **Dispatch sentence handled as a Dispatch sentence** — address taken from their words, three
      questions maximum, straight to the launch. Never a seven-line form for a one-line request.
- [ ] Full form used only when they're at a desk or asked for proper setup.
- [ ] Launch stage inferred from their words ("just listed" = live now), never re-asked.
- [ ] Every skipped answer left blank — nothing invented.
- [ ] Listing block written in the **canonical schema shape**, with the status word, the stage, and
      no invented values — and **no second block** for an address already on file.
- [ ] Type, target buyer, open house date, and photos captured (or left out, never guessed).
- [ ] Open house / possession / closing dates also written to `memory/deadlines.md`.
- [ ] Drive folder created (or the connector gap explained kindly).
- [ ] Ends by offering the full launch or a single piece — or, on the Dispatch path, just starts.
