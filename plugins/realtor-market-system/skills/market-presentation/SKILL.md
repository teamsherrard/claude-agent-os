---
name: market-presentation
description: >
  Builds the market update PRESENTATION — the branded slide deck the agent shares on screen while
  recording their YouTube market update. Produces the Slide Map (the locked, numbered slide list the
  script is then written against), a paste-ready Claude Design brief that builds the deck slide by
  slide with this month's real numbers already in it, 2–4 talking points under every slide so they
  can film from the deck alone, and the email/distribution version of the same content for their
  database. The deck and the script are one package — this runs first and sets the structure the
  script follows exactly.

  Trigger on: "build my market presentation", "my market update deck", "the slides for my market
  update", "market report presentation", "build my market report", "the screen share for my market
  video", "make my market slides", or as step 1 of a full monthly run.
---

# Market Presentation

The agent opens this deck, hits record, shares their screen, and talks. That's the whole recording.
Build it so the slides carry the numbers and their voice carries the meaning.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Apply the deck spec** (`${CLAUDE_PLUGIN_ROOT}/shared/deck-spec.md`) — the canonical slide sequence,
the Slide Map contract, and the design rules. **This is the file that stops the deck and the script
from drifting apart.**
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — interpret-don't-recap
(§3) and the three audience lenses (§4) are the quality bar.

**Read `references/slide-guide.md`** — how each slide is written, and how the email version is built.

---

## Step 1 — Load the numbers, then the Brain
1. `~/realtor-brain/memory/market-data.md` — **this month's block.** Not there? Hand to
   **Market Research** first, then come back. Never search here.
2. `~/realtor-brain/brain.md`, then `identity/brand-visual.md` (colours and fonts — the deck is the
   most visible branded thing they make), `identity/profile.md` (name, brokerage, booking link),
   `identity/voice.md` + `identity/voice-print.md` (the talking points are **spoken** — write them
   for the ear, in their cadence), `identity/market.md` (which communities, and whether there's a
   niche worth its own slide), `identity/offer.md` (the two CTAs), `identity/compliance.md`.

Every figure comes from the block. If you want a number that isn't in it, it doesn't go on a slide.

---

## Phase 1 — Resolve the deck and publish the Slide Map

Work through the canonical sequence in `deck-spec.md` §3 and settle the two conditionals:

- **Community spotlight** — in only if the block has community-level data.
- **Niche slide** — in only if `market.md` names a niche **and** the block has real published data
  for it. Never a niche slide with no numbers on it.

Then **renumber the deck for real** and write the **Slide Map** — the numbered table from
`deck-spec.md` §2: slide number · slide title · the script beat it carries · running time.

**Publish the Slide Map before writing a single slide.** It is the first thing in the deliverable and
the first thing the script skill reads. It is the lock.

## Phase 2 — Write the slides

For every slide in the map, produce three things:

1. **The slide content** — the exact headline, the exact numbers, the exact lines. Real values, never
   "insert stat here."
2. **The meaning line** — what that number means, in one short line, on the slide itself.
3. **2–4 talking points** — conversational, in the agent's spoken voice, for what to say while it's
   up (`deck-spec.md` §5). Not an essay — what they'd actually say.

Hold the design rules from `deck-spec.md` §4 while writing: one idea per slide, **20 words maximum**,
the number is the biggest thing on it, arrows are direction-only, no animation.

`references/slide-guide.md` covers what belongs on each specific slide.

## Phase 3 — The Claude Design brief

This is what the agent pastes into claude.ai/design to get the actual deck. It reproduces the
presentation **slide by slide with the real values in it** — never a summary, never a template.

```
DECK — [City] Market Update · [Month Year]
16:9 · 1920×1080 · [N] slides
Palette: [hex values from brand-visual.md]    Type: [heading font] / [body font]
Rules: one idea per slide · ≤20 words · the number is the largest element ·
       arrows show direction only, never colour-coded · no animation or transitions

SLIDE 1 — TITLE
  Layout: [describe it]
  Headline: "[the real text]"
  Sub: "[the real text]"
  Small type, bottom: "Source: [board], [data period]"

SLIDE 2 — THE HEADLINE
  Layout: full-bleed single statement, centred
  Text: "[the real one-sentence story of the month]"
…
```

Every slide gets its own block with its own real content. If `brand-visual.md` is unset, say so in
one line and specify near-black on off-white with a single accent — never output bracketed
placeholder colours.

## Phase 4 — The email / distribution version

The same month, rewritten for someone who will never watch the video — built from the headline,
glance, three-lens, and CTA slides (`deck-spec.md` §6).

- **3 subject lines** — lead with the number, not the month
- **Preview text** — one line, ~90 characters, not a repeat of the subject
- **The body** — the headline story, the 4–5 stats that matter most in a scannable list, the three
  lenses in three short blocks, one line of the agent's take
- **One CTA** — the secondary CTA from doctrine §9, usually the recurring report itself
- 250–400 words. Longer than that and it's the deck, not an email.

## Phase 5 — Compliance pass
Run the slides, the talking points, and the email through `identity/compliance.md` — disclaimer and
licence number where the display rule applies (on a deck that's usually the CTA slide), nothing on
the claims-to-avoid list, no forecast phrased as fact, fair housing on every community line. If
`compliance.md` is empty, proceed and flag it once.

## Phase 6 — Save
Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`, save into the month folder as
`Presentation — [Month Year]`, in this order: **the Slide Map first**, then the slides with their
talking points, then the Claude Design brief, then the email version, then the Data Sources.

The Slide Map must be at the top — the script skill reads it from there.

Then one line: *"Deck's ready — want the word-for-word script that runs on it?"*

## Quality checklist
- [ ] Every figure came from the data block; nothing researched or invented here.
- [ ] Conditionals resolved deliberately; a niche slide only exists if it has real data.
- [ ] **Slide Map published first**, fully renumbered, with slide · script beat · running time.
- [ ] Every slide has real values — no placeholders anywhere in the brief.
- [ ] Every stat slide carries its meaning line; no bare numbers on any slide.
- [ ] ≤20 words per slide; the number is the largest element; arrows direction-only.
- [ ] All three lenses have their own slide — buyers, sellers, relocating in.
- [ ] 2–4 spoken talking points under every slide, in their voice.
- [ ] Design brief reproduces every slide individually with real content — not a summary.
- [ ] Both CTAs placed: primary on the headline slide, secondary on the CTA slide.
- [ ] Email version stands alone, leads with a number, 250–400 words, one CTA.
- [ ] Source and data period on the title and glance slides.
- [ ] Compliance and fair-housing pass done.

## End every run with

"That deck is the recording — share your screen, advance one slide at a time, and the script I write
next follows it exactly."
