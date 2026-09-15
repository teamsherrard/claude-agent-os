---
name: market-social
description: >
  Builds the month's branded Instagram assets — the 1:1 INFOGRAPHIC (the single square people save
  and forward) and the CAROUSEL (the swipe-through that earns the most reach and dwell time), plus
  the story frames. Each ships as a paste-ready Claude Design brief laid out panel by panel with this
  month's real numbers already in it, with captions, hashtags, and one CTA apiece. Both are built from
  the same figures as the deck, so nothing diverges. Reads the month's data block — never researches,
  and never renders an image.

  Trigger on: "make my market carousel", "the Instagram carousel for my market update", "make my
  market infographic", "the Instagram graphic for my market update", "square market graphic", "my
  market social posts", "design my market post", "the 1:1 for this month", or as part of a full
  monthly run.
---

# Market Social — the carousel and the square

Two assets, one set of numbers. **The carousel** earns reach and dwell time — Instagram rewards the
swipe, and each panel gets its own chance to stop someone. **The square** has the longest life —
people screenshot it, send it to their partner, and still have it three months later.

Both have to be readable at thumbnail size and correct at full size.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — including #6: we write the
brief, the agent builds the image. **Never render or generate the graphic here.**

---

## Step 1 — Load the numbers and the brand
1. `~/realtor-brain/memory/market-data.md` — this month's block. **Confirm the block's month is the
   month you're building.** Different month, or missing? Hand to **Market Research** — never post
   another month's numbers.
2. The month's **presentation**, if it's built — the infographic reuses the headline slide's line and
   the glance slide's stats rather than choosing again. Not built? Work straight from the block.
3. `~/realtor-brain/identity/brand-visual.md` — colours, fonts, logo direction, tagline. **If it's
   unset or still template text**, say so plainly in one line and specify a clean neutral instead
   (near-black on off-white, one accent, one type family in two weights). Never output bracketed
   placeholder colours.
4. `identity/profile.md` (name, handle, brokerage), `identity/voice.md` (the caption),
   `identity/offer.md` (the CTA), `identity/compliance.md` (disclaimer and licence display).

---

## Phase 1 — Choose the numbers (both assets share them)

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

## Phase 2 — The 1:1 infographic brief

Paste-ready for claude.ai/design or Canva. 1080×1080. Lay it out **zone by zone with the real values
already in it** — never "insert stat here."

*(Kit path: agents with the **Monthly Market Report Kit** design skill can instead upload the whole
`Instagram Pack — [Month Year]` doc to their Brand HQ design project — it builds the square, the
carousel, and the stories from it directly.)*

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

## Phase 3 — The infographic's caption + story frames

**Caption** — in the agent's voice from `voice.md`:
- Opens with the headline adapted for reading, not repeated verbatim
- 3–4 short lines: what the numbers say, what it means for buyers, what it means for sellers
- One CTA, pointing at something real from `offer.md` (usually the full report)
- 8–10 hashtags, at least 3 local
- Disclaimer and licence per `compliance.md` where the display rule applies

**Story frame** — a 1080×1920 cut of the same design: headline, the single hero number, the meaning
line, and a "tap for the full report" sticker prompt. One line of brief, not a second full spec.

## Phase 4 — The carousel (always build it)

The highest-reach asset of the month. Seven panels, 1080×1350 (4:5 — taller than square, so it takes
more of the feed and gets more dwell). Built from the **same five numbers** as the square, so the two
can sit in the same feed without contradicting each other.

| Panel | What's on it | Its job |
|---|---|---|
| 1 | **The hook** — the headline of the month, huge. A number or a claim, ≤10 words. No branding clutter | Earn the swipe |
| 2 | **The shape of the month** — 3 stats with YoY arrows | Deliver fast |
| 3 | **The one that matters** — the single biggest mover, huge, with its meaning line | The screenshot panel |
| 4 | **If you're buying** — 2 takeaways + one move | The buyer lens |
| 5 | **If you're selling** — 2 takeaways + one move | The seller lens |
| 6 | **If you're moving here** — 2 takeaways + one move | The relocation lens |
| 7 | **The CTA** — the offer, the handle, "save this / send it to someone who needs it" | Convert + spread |

Carousel rules that decide whether it works:
- **Panel 1 does one job: earn the swipe.** No logo, no "market update" label, no date. Just the
  thing that makes someone's thumb stop.
- **Every panel must survive alone** — people land mid-carousel from a share. Each carries the city
  and its own point.
- **A visual thread across all seven** — the same accent bar, corner mark, or panel number — so a
  reshared panel is recognisably theirs.
- **≤25 words per panel.** The number is always the largest element.
- **Never end on a stat.** Panel 7 asks for something.
- Same arrow convention as everywhere: **direction only**, never colour-coded good/bad.

**The design brief** — paste-ready, panel by panel, with the real values in it, exactly like the
square's brief in Phase 2. Never "insert stat here."

**The caption** — different opening line from the infographic's caption (they may run in the same
week), a swipe prompt in the first line (*"swipe — the third one surprised me"*), one CTA, 8–10
hashtags with at least 3 local.

## Phase 5 — Save + log
Save into the month folder as `Instagram Pack — [Month Year]`
(`${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`) — the shared numbers, then the infographic brief
+ caption + story frames, then the carousel brief + caption.

Append **two rows** to `memory/content-log.md` — one for the square, one for the carousel (Instagram ·
Graphic / Carousel · the headline · `Scripted`) — then **push the Brain to Drive**.

Close with where to take it: *"Upload the Instagram Pack doc to your Brand HQ design project and run
the Market Report Kit — or paste the briefs into claude.ai/design; the square takes about two
minutes, the carousel about five."*

## Quality checklist
- [ ] Data block's month verified as the month being built.
- [ ] Every figure came from the data block and matches the deck; nothing researched here.
- [ ] Five numbers maximum, chosen by the priority order.
- [ ] Headline is ≤8 words and isn't just the month.
- [ ] Brief is zone by zone with **real values** — no placeholders anywhere.
- [ ] Brand colours and fonts pulled from the Brain, or a stated neutral if unset.
- [ ] The meaning line (Zone 4) is present.
- [ ] Arrows are direction-only, not colour-coded good/bad.
- [ ] Passes the thumbnail test at 160×160.
- [ ] Source and data period on the graphic.
- [ ] Caption in the agent's voice, one real CTA, 8–10 hashtags with 3 local.
- [ ] Story frames specified.
- [ ] Carousel built (not offered) — 7 panels, 4:5, real values, panel by panel.
- [ ] Carousel panel 1 does nothing but earn the swipe — no logo, no label, no date.
- [ ] Every carousel panel survives alone and names the city; visual thread across all seven.
- [ ] Carousel ends on an ask, never on a stat.
- [ ] Carousel and square share the same five numbers and open with different lines.
- [ ] No image generated here — brief only.
- [ ] Compliance done; logged; Brain pushed.
