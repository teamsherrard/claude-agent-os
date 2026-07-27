---
name: listing-brochure
description: >
  The property brochure — the one-pager that sits on the counter at showings and gets emailed to
  buyers. Written section by section from the listing already on file: headline, opening paragraph,
  6–8 feature bullets, a "life here" lifestyle paragraph, a specs table, the agent block with their
  CTA, and photo notes they can hand straight to their photographer. Ships with a paste-ready
  Claude Design brief in their brand colours and fonts.

  Trigger on: "make my listing brochure", "feature sheet for [address]", "property flyer",
  "one-pager for my listing", "brochure for the open house", "something to leave on the counter".
---

# Listing Brochure

This is the piece a buyer picks up, folds, and takes home. It has to be true, easy to skim, and look
like a real brand — so we write it section by section, then hand over a design brief that rebuilds
it exactly.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market, phone, email (never ask for these).
- `identity/voice.md` — how they write; the brochure sounds like them.
- `identity/offer.md` — their CTA, for the agent block at the bottom.
- `identity/compliance.md` — brokerage disclaimer and licence number for the footer.
- `identity/brand-visual.md` — colours, fonts, logo notes for the design brief. Missing or empty →
  clean neutral defaults (charcoal + warm white + one accent, serif headline over a clean sans body)
  and say once, plainly, that setting their brand colours makes this match next time.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md`. Pull the block for this address — beds/baths/sqft, price,
features, the story, seller notes, launch stage, Drive folder. **Never re-ask any of it.**

- Not on file → hand to **Listing Intake** first (one short form), then come straight back and build.
- Several listings on file and they didn't say which → ask by address, one line, nothing else.

## Phase 1 — Write the brochure

Six sections, in this order. Every line names something real about THIS home — the kitchen, the
cul-de-sac, the greenway. If a sentence could sell any house anywhere, rewrite it.

- **Headline** — 4–8 words, the strongest true thing about the home. Not the address, not "Beautiful
  Family Home." Under it, one line: address · price · beds/baths/sqft.
- **Opening paragraph** — 3–4 sentences. Open on the feature that sells it, then how the home lives.
  Warm, plain, no adjective stacking.
- **6–8 feature bullets** — one line each, concrete, strongest first. A number or a detail in as many
  as the facts allow ("Kitchen redone 2024 — quartz counters, gas range"). Only what's on file.
- **"Life here"** — one short paragraph on the location: what's walkable, what's nearby, how a
  weekend goes. **Fair-housing hard line:** amenities, walkability, lifestyle, commute. Never who
  lives here, never "great for families," never schools as code, never demographics of any kind.
- **Specs table** — Beds · Baths · Square footage · Lot size · Year built · Property taxes (add
  HOA/parking/heating only if given). **Only what's in the listing block** — every gap is written
  **[CONFIRM]** in the cell. Never guess a year, a lot size, or a tax number.
- **Agent block** — name, title, brokerage, phone, email, and their CTA from the Brain in their own
  words ("Text me for a private showing"). Compliance line underneath; if `compliance.md` is unset,
  put `[Brokerage · Licence #]` and say so once after delivery.

## Phase 2 — The photo plan

A shot list the agent hands to their photographer — which shot goes where, by room type. Build it
from the features actually on file, never from rooms nobody mentioned.

| Slot | Shot | Note |
|---|---|---|
| Hero (top, full width) | Front exterior, straight on | Late afternoon, lights on |
| Feature 1 (large) | The headline feature — kitchen, view, the reno | The reason it sells |
| Feature 2–3 (paired) | Main living space · primary bedroom | Wide, corner-to-corner |
| Lifestyle (small) | Yard, deck, or the street | Sells the "life here" paragraph |
| Detail (small) | One close-up — counters, fixture, fireplace | Texture, not clutter |

Add or drop rows to match the home. Close with one line: shoot landscape, tidy the counters, take
two of everything.

## Phase 3 — The Claude Design brief

Per house rule 4's design-brief exception, this skill ships a paste-ready brief: one copy block the
agent pastes into **claude.ai/design**, with **the full brochure copy inside it**, section by
section. The brief must reproduce the piece, never summarize it. In order, the block contains:

1. **What to make** — a one-page property brochure, 8.5×11 portrait, print-ready, print + email.
2. **Brand** — exact hex colours and font names from `brand-visual.md` (or the neutral defaults
   above). Logo placement note if they have one.
3. **Layout** — hero photo top third · headline and price line · opening paragraph · feature bullets
   in two columns · specs table · "life here" beside the lifestyle photo · agent block footer with
   photo and compliance line.
4. **The copy, verbatim** — every headline, paragraph, bullet, and table cell written above, pasted
   in full under its section name. `[CONFIRM]` cells stay as `[CONFIRM]`.
5. **Photo slots** — the Phase 2 table, so the layout leaves the right holes.
6. **Rules for the designer** — generous white space, one accent colour, nothing under 9pt, text
   never over a photo's busy area, no stock icons.

## Phase 4 — Compliance pass

Before delivery, read it back against house rule 5:
- Fair housing: property, lifestyle, location only. Rewrite anything about people.
- Every fact traces to the listing block; anything that doesn't is cut or marked `[CONFIRM]`.
- No "won't last," no price predictions, no guarantees. Urgency only from a real date.
- Brokerage disclaimer and licence number present, or clearly placeheld.
- Banned words gone: unlock, supercharge, game-changer, revolutionary, secret weapon, leverage.

## Phase 5 — Deliver + save

Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: write the structured text, render it, upload
the `.docx` to this listing's folder as `Brochure — [Street Address]`:

```
python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/brochure.txt "Brochure — [Street Address].docx" --title "Listing Brochure" --subtitle "[Street Address] · [Agent Name]"
```

No Drive connector? Deliver the same content in chat as clean copy blocks and mention once that
connecting Google Drive means it files itself next time. Never block the launch on setup.

Then add `Brochure` to **Built so far** in the listing block. Show the copy in chat too (agents send
it from their phone), the design brief as its own block, close with one line — *"Paste the design
brief into Claude Design while your photos are fresh — that's tonight's job."* — and offer the next
piece: the MLS description, the postcard, or the social pack.

## Quality checklist
- [ ] Brain and listing block read; the address, price, and features were never re-asked.
- [ ] Headline is 4–8 words and true; the opening paragraph names the real selling feature.
- [ ] 6–8 bullets, concrete, strongest first, nothing invented.
- [ ] "Life here" sells amenities and location only — zero references to who lives there.
- [ ] Specs table uses only listing-block facts; every gap says `[CONFIRM]`.
- [ ] Agent block carries their real CTA plus the brokerage/licence line.
- [ ] Photo plan is a real shot list, room by room, matched to this home.
- [ ] Design brief contains the full copy verbatim with brand colours and fonts — not a summary.
- [ ] Compliance pass run before anything was shown; saved as `Brochure — [Street Address]` in the
      listing's Drive folder and the listing block updated.
