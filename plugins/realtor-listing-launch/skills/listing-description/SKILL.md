---
name: listing-description
description: >
  Writes the MLS description for a captured listing — sized to THEIR MLS character limit, plus two
  shorter cuts (roughly 500 and 250 characters) and a syndication-safe version for the portals. Leads
  with the single strongest feature, shows the character count under every version, and never ships a
  version that's over its limit. Asks for the MLS character limit once, saves it to the Brain, and
  never asks again. Fair-housing strict — this is the piece most likely to break it.

  Trigger on: "write my MLS description", "listing description for [address]", "description for my
  listing", "MLS copy", "write the remarks".
---

# Listing MLS Description

You write the public remarks — the paragraph a buyer's agent skims and a buyer reads twice. One home,
one strongest feature up front, three lengths so it fits wherever they paste it, and every word true
to what's on file. This is the piece most likely to trip fair housing, so it gets a real compliance
pass before it ships.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, contact (never ask for these).
- `identity/voice.md` — how they write; the description sounds like them, not like a template.
- `identity/compliance.md` — brokerage disclaimer and licence number, if it exists.
- `config.md` — their **MLS character limit**, if it's already saved.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md` and pull the block for this address — beds/baths/sqft,
price, features, the story, seller notes, status. **Never re-ask a property fact that's already there.**

- Not on file? Hand to **Listing Intake** first, then come straight back and keep going.
- Several listings on file and they didn't say which? Ask once, by address, in one line.

**The character limit.** Check `config.md` and the listing block. If it's there, use it silently. If
it isn't, ask once — one line, nothing else:

> Quick one: what's your MLS's character limit for the description? (Most are 1,000 — if you're not
> sure, I'll use that.)

Then **save it to the Brain** (`config.md`, as `MLS character limit: 1,000`) so it's never asked
again. No answer or "not sure" → default to **1,000 / 500 / 250** and say that's what you used.

**Sizing the three cuts:** the long version is their limit. The cuts are roughly 500 and 250. If
their limit is already 500 or less, step the cuts down proportionally instead (e.g. a 400 limit →
400 / 200 / 100).

## Phase 1 — Write the long version

Sized to their limit. Structure that works every time:

- **Open on the single strongest feature** — the one thing from the listing block that sells this
  home. Never open with "Welcome to" or the address. First seven words carry the whole thing.
- **Then the home** — beds, baths, square footage, and the features in the order a buyer cares, not
  the order they were typed.
- **Then the location and lifestyle** — the street, the walk, the commute, the greenway. What it's
  like to live there, never who lives there.
- **Close on the real next step** — the open house date, the showing instructions, the status. If
  there's no real date, close on the home, not on urgency.

Rules while writing: every sentence names something true about THIS home. If a line could sell any
house in any city, rewrite it with the actual kitchen, the actual cul-de-sac. Missing fact the copy
needs → `[CONFIRM]`, never a guess. No banned words (see house rules). No "won't last."

## Phase 2 — Cut it down

The two shorter versions are **written fresh, not truncated.** A cut version that trails off mid-
thought reads as broken — each one has to stand on its own with a real open and a real close.

- **~500** — strongest feature, the core specs, one location line, the close.
- **~250** — strongest feature, beds/baths/sqft, price or open house, done.
- **Syndication-safe short version** — for Zillow, Realtor.com, Redfin and the rest: no phone number,
  no email, no website, no agent name, no "call me" — most portals strip or reject contact details in
  the remarks. Keep it property-only, roughly 250–400 characters, and say plainly that's why.

**Count every version before you show it.** If one is over its limit, trim and recount — do not ship
an over-limit version and do not round the count.

## Phase 3 — Compliance pass

Run this on all four versions before delivering. This is where MLS copy usually breaks:

- **No "perfect for families,"** no "great for young couples," "ideal for retirees," "bachelor pad,"
  "empty nesters." Describe the home, never who should live in it.
- **No school-quality claims.** Naming a school district as a factual boundary is fine; "top-rated
  schools," "great schools," "excellent school district" is not.
- **No neighbourhood-character-as-code** — no "safe," "exclusive," "quiet family neighbourhood,"
  "up-and-coming," "traditional," no religious references (churches, "close to temple"), no
  demographic hints of any kind.
- **No "walking distance"** or ability-based framing (`"steps from"` → say the distance).
- **Fair Housing Act / equal-opportunity wording** and the **brokerage disclaimer + licence number**
  from `identity/compliance.md` — append where their MLS requires it. If that file is empty, deliver
  anyway and say in one line that their disclaimer isn't set yet.
- No price predictions, no income or investment-return claims, no guarantees.

Anything flagged gets rewritten, not deleted — replace the coded phrase with a true, concrete fact.

## Phase 4 — Deliver + save

In chat, four clean copy blocks in this order, each with its count on the line underneath:

> **MLS Description — [limit] characters** · *[actual count] characters*
> **Short cut — ~500** · *[actual count] characters*
> **Short cut — ~250** · *[actual count] characters*
> **Syndication version (no contact info)** · *[actual count] characters*

Then save to Drive per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md` — `MLS Description — [Street
Address]` in that listing's folder, character counts in a bordered table. No Drive connector? Deliver
in chat and mention once that connecting it means this saves itself next time.

Update the listing block in `~/realtor-brain/memory/listings.md` — add `MLS description` to
"Built so far." Then offer the next piece in one line: the brochure, the social pack, or the full launch.

## Quality checklist
- [ ] Brain and listing block read; no property fact re-asked.
- [ ] MLS character limit read from the Brain, or asked exactly once and saved back to it.
- [ ] Long version sized to their limit; cuts sized ~500 / ~250 (or stepped down proportionally).
- [ ] **Every version counted and under its limit** — counted before showing, trimmed and recounted if over.
- [ ] Shorter versions written fresh and stand alone — no truncations, no trailing-off.
- [ ] Opens on the single strongest feature, not "Welcome to" and not the address.
- [ ] Nothing invented — missing facts marked `[CONFIRM]`.
- [ ] Compliance pass run: no family/school/neighbourhood-character language; disclaimer + licence appended (or flagged as unset).
- [ ] Syndication version carries zero contact info.
- [ ] Saved to the listing's Drive folder and noted in the listing block.
