---
name: listing-print
description: >
  Everything that gets printed and mailed for one listing — the Just Listed postcard, the Just Sold
  postcard pre-written for after it closes, an open house door hanger when there's a date on file,
  and the mailing plan for who gets what and when. Each card ships with a paste-ready Claude Design
  brief in their brand colours and fonts, plus a print-compliance note to the agent that never
  appears on the card itself.

  Trigger on: "postcard for my listing", "just listed postcard", "just sold postcard",
  "door hanger for the open house", "what do I mail for this listing".
---

# Listing Print Pack

Mail is how a listing turns into the next listing. The neighbours who get the card are the people
who hire the agent when they sell — so the cards have to be true, short, and look like a real brand.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, phone, email (never ask for these).
- `identity/voice.md` — how they write; the cards sound like them, not like a print shop.
- `identity/offer.md` — their CTA, for the contact block on every card.
- `identity/brand-visual.md` — colours, fonts, logo notes for the design briefs. Missing or empty →
  clean neutral defaults (charcoal + warm white + one accent, serif headline over a clean sans body),
  and say once, plainly, that setting their brand colours makes this match next time.
- `identity/compliance.md` — brokerage name, licence number, required disclaimer.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md`. Pull the block for this address — beds/baths/sqft, price,
features, the story, seller notes, launch stage, open house date, Drive folder. **Never re-ask it.**

- Not on file → hand to **Listing Intake** first (one short form), then come straight back and build.
- Several listings on file and they didn't say which → ask by address, one line, nothing else.

## Phase 1 — Write the cards

Every line names something real about THIS home — the kitchen, the cul-de-sac, the greenway. If a
sentence could sell any house in any city, rewrite it. **Count every limited piece and show the
count under it.** Every card ends with the same **contact block**: name, title, phone, email, their
CTA, then `[Brokerage Name]` and `[Licence #]` — filled from `compliance.md` or left as placeholders.

**JUST LISTED POSTCARD**
- **Front headline — 5 words max**, counted. Plain and specific: "Just Listed on Maplewood"
  (4 words). Never "Beautiful Family Home."
- **Back copy — 60–90 words**, counted. Open on the feature that sells it, one line on how the home
  lives, the address and price, then the ask (call, text, or come see it).

**JUST SOLD POSTCARD** — the same card, pre-written for after it closes, marked plainly
**"hold until it closes."** This is the one that farms the street.
- **Front headline — 5 words max**, counted. "Just Sold on Maplewood" reads as proof, not a brag.
- **Back copy — 60–90 words**, counted. What sold, how it went in true terms only (days on market or
  "sold above asking" *only if the agent gives the number*), then the neighbour ask — "curious what
  yours would sell for today?" No price predictions, ever.

**OPEN HOUSE DOOR HANGER / INVITE CARD** — **only when there's an open house date on file.** No
date, no card; say so in one line and move on.
- **Front — 6 words max**, counted: "Open House Saturday, 1–3pm" plus the street name.
- **Back — 40–60 words**, counted: the address, the date and time, one true reason to walk over, and
  "come by, no appointment needed." Neighbour-friendly, not a sales pitch.

## Phase 2 — The mailing plan

Who gets it, when it drops, roughly how many — quantities are estimates they adjust to their street.

| When | Who gets it | Which card | Rough quantity |
|---|---|---|---|
| Before launch (3–5 days out) | The closest 20 homes — either side, across, behind | Just Listed (or "coming soon" wording) | ~20 |
| Launch week | The wider farm — the surrounding blocks | Just Listed | ~100–250 |
| Open house week | Doors within a short walk | Door hanger | ~50–75 |
| After it closes | The whole street plus the farm | Just Sold | ~150–300 |

Close with two plain lines: hand-deliver the first 20 if they can (it lands differently), and order
the Just Sold at the same time as the Just Listed so it's ready the day it closes.

## Phase 3 — The Claude Design briefs

Per house rule 4's design-brief exception, this skill ships paste-ready briefs — **one block per
side, front and back separately**, for each card built. The agent pastes each into
**claude.ai/design**. The brief must reproduce the card, never summarize it. Each block, in order:

1. **What to make** — postcard front (or back), 6×4 inches landscape, print-ready at 300dpi, 0.125"
   bleed, 0.25" safe margin. Door hanger: 4.25×11 inches with a 1.75" hook cutout at top.
2. **Brand** — exact hex colours and font names from `brand-visual.md` (or the neutral defaults
   above), plus logo placement if they have one.
3. **Layout** — *front:* one hero photo full bleed, headline over the calm part of the image, small
   brand mark in a corner. *Back:* copy block left, contact block and headshot right, the right
   third kept clear as the address panel for the mailing label and postage.
4. **The copy, verbatim** — the headline and back copy exactly as written above, word for word,
   under its section name. Placeholders stay as placeholders.
5. **Rules for the designer** — nothing smaller than 9pt, headline readable at arm's length at the
   mailbox, one accent colour, generous white space, no stock icons, nothing in the address panel.

## Phase 4 — Compliance pass

Before delivery, read every card back against house rule 5:
- Fair housing: the property, the lifestyle, the location. Never the neighbours, never who would
  "fit" here, never schools as code, never demographics.
- Every fact traces to the listing block; anything that doesn't is deleted or marked `[CONFIRM]`.
- No "won't last," no price predictions, no guarantees. Urgency only from a real date.
- Banned words gone: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage.

**PRINT COMPLIANCE — a note to the agent, never printed on the card.** After the cards, say plainly:
brokerage name and licence number have to appear on every mailed piece, plus any required disclaimer
from `compliance.md`. If it's unset, leave `[Brokerage Name]` and `[Licence #]` in the contact block
and tell them once to confirm the exact wording with their broker before it goes to print.

## Phase 5 — Deliver + save

Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: write the structured text, render it, upload
the `.docx` to this listing's folder as `Postcard — [Street Address]`:

```
python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/print.txt "Postcard — [Street Address].docx" \
  --title "Listing Print Pack" --subtitle "[Street Address] · [Agent Name]"
```

No Drive connector? Deliver the same content in chat as clean copy blocks and mention once that
connecting Google Drive means it files itself next time. Never block the launch on setup. Either
way, add `Print pack` to **Built so far** in the listing block, show the card copy in chat, give
each design brief its own copy block, then close with one line and offer the next piece — the
brochure, the social pack, or the neighbour outreach texts:

> Order the Just Listed and the Just Sold together — the sold card is the one that gets you the
> next listing on that street.

## Quality checklist
- [ ] Brain and listing block read; the address, price, and features were never re-asked.
- [ ] Just Listed front headline **5 words max** and back copy **60–90 words**, both counts shown.
- [ ] Just Sold card written to the same counted limits, marked "hold until it closes."
- [ ] Door hanger built only when an open house date is on file; front ≤6 words, back 40–60, counted.
- [ ] Contact block on every card carries their CTA plus brokerage name and licence-number lines.
- [ ] Mailing plan names the closest 20 before launch, the wider farm at just-listed, the whole
      street at just-sold, with rough quantities called estimates.
- [ ] A design brief per side (front and back) per card, copy verbatim, brand colours and fonts
      baked in — not a summary.
- [ ] Compliance pass run before anything was shown; print-compliance note given to the agent,
      never printed on the card.
- [ ] Saved as `Postcard — [Street Address]` in the listing's Drive folder; listing block updated.
