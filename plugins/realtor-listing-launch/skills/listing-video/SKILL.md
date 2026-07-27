---
name: listing-video
description: >
  FILM IT — the room-by-room YouTube walkthrough plus the full SEO package that makes it findable.
  Writes the 3–5 minute walkthrough script room by room (hook, the walk, price, CTA), a shot list in
  FILMING order so the whole home is captured in one pass, and the complete YouTube package: title
  options with character counts, a description with the address-and-price block and timestamps, tags,
  hashtags, and a thumbnail brief. Written for speech — one breath per line, filmable while walking
  the home, alone, on a phone.

  Trigger on: "video script for [address]", "walkthrough script", "YouTube video for my listing",
  "property video", "what do I say in the listing video", "film my listing", "listing video for
  [address]", "room by room script", "SEO for my listing video", "film it".
---

# FILM IT — the walkthrough and its SEO

The YouTube walkthrough is the piece of listing content that keeps working after the home sells —
it's the one a buyer finds in six months searching the neighbourhood. So it gets written to be
walked, and packaged to be found.

Short vertical clips are a different job — that's **CLIP IT** (`listing-clips`). This skill is the
long one.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market (never ask for these).
- `identity/voice.md` — how they actually talk. This one matters most here: it's their mouth saying
  these words on camera. If a line doesn't sound like them, it doesn't ship.
- `identity/offer.md` — their CTA, so every video ends the way the rest of their content does.
- `identity/market.md` — the community name, which the SEO package is built around.
- `identity/compliance.md` — disclaimer, licence, claims to avoid.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md` and pull the block for this address — beds/baths/sqft,
price, features, the story, launch stage, seller notes. **Never re-ask any of it.**

- Not on file? Hand to **Listing Intake** first, then come straight back and build.
- Several listings on file and they didn't say which? One line: *"Which one — Maplewood or Birch?"*
- **Has the agent actually been inside?** If the listing block only carries what the seller told them
  over the phone, say it plainly: *"Heads up — I've only got what you gave me, so I've written this
  around the kitchen and the yard. Everything I wasn't sure about is marked [CONFIRM] — swap in what
  you see when you walk it."* Then write the script that way. **Never invent a room, a finish, a
  view, or a number to fill a beat.**

**Can't film it at all?** If they say they don't have time, can't get back to the house, or don't want
to be on camera — offer **TOUR IT** (`listing-tour`), which builds a cinematic tour from the listing
photos instead. One line, no lecture.

---

## Phase 1 — The walkthrough script

Three to five minutes, room by room, for YouTube and Facebook — where people will actually watch a
full lap of the house.

- **Hook (0–10s)** — the single strongest feature in the listing block, said before the tour starts.
  It names *this* home: the kitchen, the cul-de-sac, the yard. Never "check out this stunning
  property." Then one line on what they're about to see.
- **The walk** — room by room, in the order someone would actually walk it: exterior → entry → main
  living → kitchen → bedrooms → bathrooms → basement/bonus → outside.
  Each room gets **2–3 spoken lines**: what it is, the one detail worth mentioning, and why it matters
  to how someone lives there. Only details from the listing block.
- **Each room carries its shot**, written as a direction:
  `[shot: walk in from the entry, phone at chest height]` · `[shot: pan slow across the counters]`.
  The movement carries the edit — walk into rooms, don't stand in doorways.
- **The neighbourhood beat** — one short section near the end on the street and what's around it.
  This is what makes the video findable by people searching the area, not the address.
- **The close** — price, launch stage, the CTA, and on this cut their name and brokerage said out loud.

Format it so they can read it off their phone between takes:

```
HOOK (0–10s)
"This kitchen is why this one won't feel like a starter home."
[shot: walk in from the entry, pan to the counters]

KITCHEN (0:35–1:10)
"Redone two years ago — and they didn't cheap out on the counters."
"Gas range, and enough room that two people aren't fighting over the sink."
[shot: pan left to right, slow]
```

One breath per line. If a line needs a comma to survive, cut it in two. Longer sentences are fine
here — this one breathes, unlike a short.

## Phase 2 — The shot list (filming order)

**This is the part that saves the second trip.** Reorder every shot into the order they'd be captured
walking the home once — outside-in, floor by floor — not the order the script says them. Number them.

| # | Shot | How to film it | Room |
|---|---|---|---|
| 1 | Exterior front | Slow walk toward the door, phone steady, chest height | Opening |
| 2 | Entry walk-in | Push straight in, don't stop at the threshold | Entry |
| 3 | Kitchen counters | Pan left to right, slow — this is the hero shot, film it twice | Kitchen |

Close the list with three plain filming notes: shoot horizontal for this one, film the hero shot
twice, and get one clean exterior at the end in case the light changed.

## Phase 3 — The YouTube SEO package

The script gets it made. This gets it found. Build the whole package around **the community name plus
the property type** — that's what people actually search, not the street address.

**Titles — give five, with character counts.** Under 60 characters so nothing truncates.
- Lead with the community, not the address: *"Inside a $485K Home in Bridgeland | 3 Bed, 2.5 Bath"*
- One title carries the price, one carries the beds/baths, one carries the standout feature.
- No clickbait, no "you won't believe." Show the count under each: `(54 characters)`.

**Description**, in this exact order:
1. **First two lines** — the only part visible before "show more." The community, the price, and the
   single best feature.
2. **The address-and-price block** — address, beds/baths/sqft, price, status, on their own lines.
3. **Two or three paragraphs** on the home and the neighbourhood, written from the listing block.
4. **Timestamps** — one per room, matched to the script's sections. Start at `0:00 Intro`.
   Mark them `[approximate — adjust after the edit]`, because the real times come from the cut.
5. **The CTA and contact block** — the Brain's CTA, their phone, email, and booking link.
6. **The brokerage disclaimer and licence number** per `compliance.md`.

**Tags — 15 to 20**, ordered most to least specific: the community, the city, the property type, the
price band, "homes for sale in [city]", the agent's name and brokerage. No tag stuffing, nothing
unrelated to this home.

**Hashtags — 3 to 5** for the description, market-anchored.

**Thumbnail brief** — which shot to use (almost always the hero room or the exterior), the 3–5 words
of overlay text, and their brand colours from `brand-visual.md`. A brief, not a design — the agent
builds it, or hands it to their design tool.

## Phase 4 — Compliance pass

Before anything ships:
- Sell the home, the lifestyle, the location — never the neighbours, never who'd "fit" here, never
  schools as code. Fair housing applies to spoken words exactly like written ones, and to tags and
  descriptions exactly like captions.
- Every claim traces to the listing block. Anything that doesn't is `[CONFIRM]` or gone.
- No "won't last," no price predictions, no invented urgency — urgency is the open house date or
  nothing.
- The description carries the brokerage/licence line where their market requires it. Empty
  `compliance.md`? Proceed and say once that it's unset.
- Banned words: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage.

## Phase 5 — Deliver + save

In chat, in this order: **the walkthrough script** → **the shot list** → **the SEO package** (titles,
description, tags, hashtags, thumbnail brief).

Then save to Drive per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` as
`Walkthrough + SEO — [Street Address]` in the listing's folder, and add `Walkthrough script + SEO` to
**Built so far** in the listing block. No Drive connector? Deliver in chat, say so kindly, keep moving.

End with one plain line: *"Film the kitchen twice — that's your hook, and it's the only shot worth a
second take."*

Then offer what's next: the three shorts (**CLIP IT**), or the ad plan.

**If the agent has the Realtor YouTube System plugin**, say in one line that its `youtube-seo` skill
can take this further with live search data — this package is complete on its own, and that one goes
deeper.

## Quality checklist
- [ ] Brain and listing block read; nothing re-asked.
- [ ] **Spoken-word test:** every line said out loud in one breath, while walking. Any line needing a
      pause mid-sentence gets split or cut.
- [ ] Hook lands in 10 seconds and names something real about THIS home.
- [ ] Every room gets 2–3 lines and a named shot the agent can film on a phone, alone.
- [ ] A neighbourhood beat is in the script — the video has to be findable by area, not just address.
- [ ] Shot list is in FILMING order, not script order, and covers the whole home in one pass.
- [ ] Nothing invented — unseen rooms marked `[CONFIRM]`, and the agent told plainly why.
- [ ] Five titles, each under 60 characters, with the count shown.
- [ ] Description leads with community + price + best feature in the first two lines, and carries the
      address block, timestamps, CTA, contact, and disclaimer.
- [ ] Timestamps marked approximate.
- [ ] 15–20 tags ordered specific → broad; 3–5 hashtags; thumbnail brief with overlay words.
- [ ] Compliance pass run over script, description, AND tags; CTA matches the Brain.
- [ ] Offered TOUR IT if they can't film, and CLIP IT for the shorts.
- [ ] Saved to the listing's folder and logged in **Built so far**.
