---
name: listing-clips
description: >
  CLIP IT — the three just-listed shorts, written to film in one pass. Three distinct 20–40 second
  vertical scripts from the listing on file: the just-listed announcement, the top 3 features, and
  the neighbourhood angle — each with its own hook, named shots, on-screen text, and a ready-to-post
  caption with hashtags. Ships with one combined shot list so all three are captured in a single trip
  to the house. Different angles on the same home, never three cuts of the same script.

  Trigger on: "shorts for my listing", "reels for my listing", "3 clips for [address]", "clip it",
  "short form for my listing", "tiktoks for my listing", "just listed reel", "quick videos for my
  listing", "what shorts should I make for this house".
---

# CLIP IT — three shorts, one trip to the house

One listing, three genuinely different shorts — because posting the same announcement three times is
how a feed learns to skip you. Each one takes a different angle at the same home, and the shot list
gets all three filmed in one pass.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market (never ask).
- `identity/voice.md` — **matters most here.** These are their words, on camera, at speed.
- `identity/market.md` — the community, for the neighbourhood clip.
- `identity/content-engine.md` — which platforms they post on, for caption lengths and hashtags.
- `identity/offer.md` — their CTA.
- `identity/compliance.md` — disclaimers and claims to avoid.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md` — beds/baths/sqft, price, features, the story, status, open
house date. **Never re-ask.** Not on file → **Listing Intake** first, then straight back.

**Has the agent been inside?** If the block is only what the seller said on the phone, say so plainly
and mark everything unconfirmed `[CONFIRM]`. Never invent a room to fill a beat.

---

## Phase 1 — Clip 1: the just-listed announcement

20–30 seconds. The news, said like news.

- **Hook (0–3s)** — the address or the street and the one thing that makes this home worth stopping
  for. Never "just listed!" as the opener — that's the caption's job, not the hook's.
- **3–4 beats** — beds/baths/sqft, the two strongest features, the price. Fast, factual, confident.
- **CTA** — the open house date if there is one; otherwise the Brain's CTA.
- **On-screen text** — the address and price on screen from the first second. It's watched on mute.

## Phase 2 — Clip 2: the top 3 features

30–40 seconds. The one that actually gets saved and sent.

- **Hook (0–3s)** — a count-in that promises a payoff: *"Three things about this house nobody expects."*
- **Three beats, one per feature**, pulled from the listing block in ascending order — save the
  strongest for last. Each beat: name it, show it, say why it matters to how someone lives there.
- **CTA** — short. The clip earned attention; don't spend it all on the ask.
- **On-screen text** — number each feature as it lands (1 / 2 / 3). The counter is what holds people.

## Phase 3 — Clip 3: the neighbourhood angle

30–40 seconds. This is the one that reaches people who aren't buying this house — which is most of
the audience, and the reason this clip exists.

- **Hook (0–3s)** — about the *area*, not the listing: the street, the walk, the thing locals know.
- **Beats** — what's actually around it, from `identity/market.md` and the listing block. If they gave
  a nearby landmark, park, or main street, build on it.
- **The turn** — one line, late, that connects the area back to the home: *"...and this one's right
  on it."*
- **CTA** — the Brain's CTA.
- **Research rule:** you may look up a genuinely public local fact (a park, a transit line, a main
  street) and cite it. **Never** invent an amenity, a school, a commute time, or a statistic. No
  school quality claims and no "great for families" — fair housing lives in this clip more than any
  other.

## Phase 4 — The combined shot list

Reorder every shot from all three clips into **filming order** — one walk of the home and the block,
outside-in. Number them, mark which clip each feeds.

| # | Shot | How to film it | Used in |
|---|---|---|---|
| 1 | Exterior front, slow walk-up | Phone chest height, steady, walk toward the door | 1, 2 |
| 2 | Street / block, slow pan | Stand at the curb, pan the street | 3 |
| 3 | Kitchen counters | Pan left→right, slow — film this one twice | 1, 2 |

Close with three plain notes: film vertical, film the hero shot twice, and get the neighbourhood
shots before leaving the street so there's no second trip.

## Phase 5 — Captions

One caption per clip, ready to paste, in their voice:
- **Clip 1** — address, beds/baths, price, next step. The most complete one.
- **Clip 2** — short and curiosity-led. Let the video carry it.
- **Clip 3** — about the area, ending on the home.

Each with **5–8 hashtags anchored to their market** — their city, their community, their brand tag.
Never generic `#realestate` filler. Adapt length per platform if `content-engine.md` names them:
Instagram hook-first before the "more" cut · TikTok under 150 characters · Shorts short and plain.

## Phase 6 — Compliance pass

- Sell the property, the lifestyle, the location. **Never** the neighbours, who'd "fit" here, schools
  as code, or demographics. The neighbourhood clip gets read twice for this.
- Nothing invented — every feature, number, and local fact traces to the listing block, `market.md`,
  or a cited source. Otherwise `[CONFIRM]`.
- No price predictions, no "won't last." Urgency is a real date or nothing.
- Append the brokerage disclaimer and licence per `compliance.md`; if unset, deliver and say so once.
- Banned words: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage.

## Phase 7 — Deliver + save

In chat: **three scripts** (each with hook, beats, shots, on-screen text) → **the combined shot list**
→ **three captions**. Label them clearly so nothing gets mixed up on a phone.

Save per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` as **`Shorts — [Street Address]`** in the
listing's folder, and add `3 shorts` to **Built so far**.

End with one plain line:

> Film all three in one trip — you're already at the house. Post the announcement tonight and space
> the other two over the week.

Then offer what's next: the YouTube walkthrough (**FILM IT**), or the open house kit if there's a date.

## Quality checklist
- [ ] Brain and listing block read; nothing re-asked.
- [ ] **Three genuinely different clips** — different hooks, different angles, no shared beats. If two
      could be swapped without noticing, rewrite.
- [ ] Every hook lands in 3 seconds and names something real about THIS home or THIS street.
- [ ] Every beat carries a named, phone-filmable shot.
- [ ] On-screen text specified — address and price on Clip 1, the 1/2/3 counter on Clip 2.
- [ ] **Spoken-word test:** every line said out loud in one breath while walking.
- [ ] Neighbourhood clip invents nothing and makes no school or "good for families" claim.
- [ ] Shot list is in FILMING order and covers all three clips in one pass.
- [ ] Three captions, 5–8 market-anchored hashtags each, platform lengths adapted.
- [ ] Compliance pass run; `[CONFIRM]` used instead of any guess.
- [ ] Saved to the listing's folder and logged in **Built so far**.
