---
name: market-infographic
description: >
  Designs the branded 1:1 Instagram infographic for the month — the single square post that carries
  the month's numbers in a form people actually save and share. Produces a paste-ready Claude Design
  brief (brand colours and fonts from the Brain, laid out zone by zone with the real values in it),
  plus the caption, the hashtags, the story-frame version, and an optional carousel expansion. Reads
  the month's data block — never researches, and never renders the image itself.

  Trigger on: "make my market infographic", "the Instagram graphic for my market update", "square
  market graphic", "market update infographic", "design my market post", "the 1:1 for this month", or
  as step 4 of a full monthly run.
---

# Market Infographic

The square post is the piece with the longest life. People screenshot it, send it to their partner,
and still have it three months later. It has to be readable at thumbnail size and correct at full
size.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — including #6: we write the
brief, the agent builds the image. **Never render or generate the graphic here.**

---

## Step 1 — Load the numbers and the brand
1. `~/realtor-brain/memory/market-data.md` — this month's block. Not there? Hand to **Market
   Research** first.
2. `~/realtor-brain/identity/brand-visual.md` — colours, fonts, logo direction, tagline. **If it's
   unset or still template text**, say so plainly in one line and specify a clean neutral instead
   (near-black on off-white, one accent, one type family in two weights). Never output bracketed
   placeholder colours.
3. `identity/profile.md` (name, handle, brokerage), `identity/voice.md` (the caption),
   `identity/offer.md` (the CTA), `identity/compliance.md` (disclaimer and licence display).

---

## Phase 1 — Choose what goes on it

A square holds **five numbers, maximum.** More than that and none of them get read. Pick the five
that tell this month's story, in this priority order:

1. The benchmark or average price, with its YoY change *(almost always in)*
2. The number that changed most this month — the reason someone should care
3. Days on market or months of supply — whichever better shows the condition
4. Sales or inventory — whichever supports the headline
5. The market condition itself, as words rather than a figure

Then write **the headline** — the one-line story of the month, ≤8 words. Not "July Market Update."
Something like *"More choice than you've had in two years."* The month goes in small type; the
headline earns the stop.

## Phase 2 — The design brief (the deliverable)

Paste-ready for claude.ai/design or Canva. 1080×1080. Lay it out **zone by zone with the real values
already in it** — never "insert stat here."

```
CANVAS  1080×1080 · [background colour] · [type family]

ZONE 1 — TOP BAR (0–140px)
  Eyebrow, small caps, letter-spaced: "[CITY] MARKET UPDATE · [MONTH YEAR]"
  Agent handle, right-aligned, same size

ZONE 2 — HEADLINE (140–360px)
  "[the ≤8-word headline]" — largest text on the canvas, 2 lines max, [colour]

ZONE 3 — THE STATS (360–800px)
  A [2×2 grid + one wide tile] / [single hero number + 4 supporting] — pick and specify one.
  Each tile:
     value    — [the real number], large and bold
     label    — [the real label], small, above the value
     change   — [↑/↓ the real YoY], small, below, in [accent]
  Tile 1: [real value] · [real label] · [real change]
  Tile 2: …   (all five, with actual figures)

ZONE 4 — THE MEANING (800–930px)
  One sentence, the interpretation: "[the real line]"
  This is the zone that separates this from every other agent's stat post. Never cut it.

ZONE 5 — FOOTER (930–1080px)
  Agent name · brokerage · booking link or "link in bio"
  Source line, small: "Source: [board], [data period]"
  [Disclaimer + licence # if the display rule applies]
```

Rules baked into the brief:
- **The meaning line is not optional.** A grid of numbers with no interpretation is the most common
  and most forgettable real estate post there is.
- **Arrows show direction only** — don't colour them good/bad. Inventory up is good news for a buyer
  and bad for a seller, and both follow this account.
- **Thumbnail test:** the headline and the hero number must be readable at 160×160. If a tile needs
  small type to fit, cut a tile.
- **Source line always present.** It's what makes it credible enough to share.

## Phase 3 — The caption + the story frame

**Caption** — in the agent's voice from `voice.md`:
- Opens with the headline adapted for reading, not repeated verbatim
- 3–4 short lines: what the numbers say, what it means for buyers, what it means for sellers
- One CTA, pointing at something real from `offer.md` (usually the full report)
- 8–10 hashtags, at least 3 local
- Disclaimer and licence per `compliance.md` where the display rule applies

**Story frame** — a 1080×1920 cut of the same design: headline, the single hero number, the meaning
line, and a "tap for the full report" sticker prompt. One line of brief, not a second full spec.

## Phase 4 — Optional carousel expansion
Offer once, in one line: the same month as a 5-slide carousel — cover (headline) · the numbers ·
what it means for buyers · what it means for sellers · the CTA. Only build it if they say yes, and
build it from the same five numbers so nothing diverges.

## Phase 5 — Save + log
Save into the month folder as `Infographic Brief — [Month Year]`
(`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`). Append one row to `memory/content-log.md`
(Instagram · Graphic · the headline · `Scripted`), then **push the Brain to Drive**.

Close with where to take it: *"Paste that into claude.ai/design and it'll build the square for you —
takes about two minutes."*

## Quality checklist
- [ ] Every figure came from the data block; nothing researched here.
- [ ] Five numbers maximum, chosen by the priority order.
- [ ] Headline is ≤8 words and isn't just the month.
- [ ] Brief is zone by zone with **real values** — no placeholders anywhere.
- [ ] Brand colours and fonts pulled from the Brain, or a stated neutral if unset.
- [ ] The meaning line (Zone 4) is present.
- [ ] Arrows are direction-only, not colour-coded good/bad.
- [ ] Passes the thumbnail test at 160×160.
- [ ] Source and data period on the graphic.
- [ ] Caption in the agent's voice, one real CTA, 8–10 hashtags with 3 local.
- [ ] Story frame specified; carousel offered once, not built unasked.
- [ ] No image generated here — brief only.
- [ ] Compliance done; logged; Brain pushed.
