---
name: listing-social
description: >
  Every social post one listing needs, written to post — coming soon, just listed, feature spotlight,
  open house invite, plus a price improvement and a just sold post held for later. Each caption comes
  with 5–8 hashtags anchored to the agent's market, and five story slides with the native sticker for
  each, ending on a DM-starter. Reads the listing from the Brain, so the agent never re-enters the home.

  Trigger on: "posts for my listing", "just listed post", "social for [address]", "captions for my new
  listing", "story slides for the listing", "social pack for [address]".
---

# Listing Social Pack

The listing is live in the agent's hand and dead in their feed until somebody posts it. You write the
whole run of posts at once — captions they can paste, in their voice, about THIS home.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, contact (never ask for these).
- `identity/voice.md` — how they actually talk. Every caption sounds like them, not like a brochure.
- `identity/content-engine.md` — which platforms they post on and their hashtag sets. If it names
  their platforms, adapt caption length and hashtag placement per platform (Phase 1). If it's missing,
  write one caption per post that works on Instagram and Facebook and say so plainly.
- `identity/compliance.md` — brokerage disclaimer and licence number, if it's set.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md` and pull the block for this address — beds/baths/sqft,
price, features, the story, the status, the open house date. **Never re-ask any of it.**

- Not on file → hand to **Listing Intake**, then come straight back and build. One short form, once.
- Several listings on file and they didn't name one → ask which address, in one line, and nothing else.
- Status drives the pack: **coming soon** → write the coming soon post; **live now** → skip it.
  No open house date → skip the open house invite and say why in one line.

---

## Phase 1 — Write the six posts

Each post = the caption, written to post, plus 5–8 hashtags anchored to their market (their city, their
neighbourhood, their brand tag from the content engine — not generic #realestate filler).

1. **Coming soon** — build the wait. Tease the one best feature, no full reveal, no price unless they
   gave it. *Skip entirely if the listing is already live.*
2. **Just listed** — the announcement. Address or street, beds/baths, the two or three features that
   actually sell it, price, and the next real step (open house date, DM to see it).
3. **Feature spotlight** — the ONE thing that sells this home. Pick the single strongest feature from
   the listing block and write the whole caption around it. Not a list — a story about that one thing.
4. **Open house invite** — date, time, address, and what's worth the drive. *Skip if there's no open
   house.* Urgency comes from the real date, never from "won't last."
5. **Price improvement** — pre-written for later. Frame it as news and opportunity, never as trouble.
   Label it clearly: **HOLD — post only if the price changes.**
6. **Just sold** — pre-written for the finish. Thank the sellers, name what buyers responded to, close
   with the soft "thinking of selling on this street?" line. Label it clearly: **HOLD — post after it
   closes.**

**Platform adaptation** (only if the content engine names their platforms):
- **Instagram** — caption ~125–150 words max, hook in the first line before the "more" cut, hashtags
  in the first comment or dropped below a line break.
- **Facebook** — a little longer and more conversational, 2–3 hashtags inline at most, no hashtag wall.
- **TikTok** — under 150 characters, hook-first, 3–5 hashtags inline. Written to sit under a video.

## Phase 2 — The story slides

Five slides, in order, each with the text on the slide and the **native sticker** to use:

1. **The tease** — one strong photo, one line. Sticker: **poll** ("Guess the price: under / over $X").
2. **The walk-through** — the best room, named. Sticker: **question** ("What would you change first?").
3. **The feature** — the same one thing from the spotlight post. Sticker: none, let the photo carry it.
4. **The open house / see it** — date and time if there is one. Sticker: **countdown** to the open
   house, or **link** to the listing if there's no open house.
5. **The DM-starter** — end on the ask: "Want the full photo set? Tap here and I'll send it." Sticker:
   **question** or a DM prompt.

Keep every slide to one line of text — it gets read at a walking pace, one thumb, in three seconds.

## Phase 3 — Compliance pass

Run every caption and slide through this before it ships:
- Sell the **property, the lifestyle, and the location**. Never the neighbours, never who would "fit"
  here, never schools as code for anything, never demographics.
- Nothing invented — no room, finish, view, lot size, or number that isn't in the listing block.
  Missing fact the caption genuinely needs → **[CONFIRM]** and keep going.
- No price predictions, no guarantees, no "won't last." Urgency = a real date or nothing.
- Banned words: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage (as a verb).
- Append the brokerage disclaimer and licence number where compliance calls for it. If that file is
  empty, deliver anyway and mention in one line that it's unset.

## Phase 4 — Deliver + save

Deliver in chat as labelled copy blocks — one block per post, ready to paste from a phone. Put the two
HOLD posts last, under their own heading, so nothing gets posted by accident.

Save to Drive (`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`) as **Social Pack — [Street Address]**
in the listing's folder. No Drive connector? Deliver in chat, say kindly that connecting Google Drive
means it saves itself next time, and never block on it.

Then update the listing block in `~/realtor-brain/memory/listings.md` — add `Social pack` to
**Built so far** with today's date.

Close warm and short:

> That's your whole run of posts. Post the just listed tonight — the first 72 hours are where a
> listing gets its traffic. Want the three shorts to go with it?

## Quality checklist
- [ ] Brain and listing block read; nothing re-asked that either one answers.
- [ ] Every caption names something real about THIS home — the kitchen, the cul-de-sac, the street.
      If a line could sell any house in any city, it gets rewritten.
- [ ] Coming soon skipped if live; open house invite skipped if there's no date — and the skip is said.
- [ ] 5–8 hashtags per post, anchored to their market, not generic filler.
- [ ] Platform lengths and hashtag placement adapted if the content engine names their platforms.
- [ ] Five story slides, each with its sticker, ending on the DM-starter.
- [ ] The hold-until posts are clearly labelled and delivered last.
- [ ] Compliance pass run; nothing invented; [CONFIRM] used instead of a guess.
- [ ] Saved to the listing's Drive folder and logged in the listing block.
