---
name: market-pdf
description: >
  Builds the monthly market report as a designed, sendable PDF — the document the agent emails to
  their database, texts to a client asking "how's the market?", hands to a seller before a listing
  appointment, and gives away as the lead magnet. It doubles as the GREEN SCREEN asset: the agent
  pulls it up on screen behind them and talks through a page for a short-form video. Ships as a
  paste-ready Claude Design brief, page by page, with this month's real numbers already in it, plus
  the green-screen shot notes and the send-it copy (email, text, DM). Reads the month's data block and
  the deck — never researches, never renders the file itself.

  Trigger on: "build my market PDF", "the market report document", "something I can send people",
  "my monthly market report PDF", "the market report for my database", "green screen market report",
  "the PDF version", or as part of a full monthly run.
---

# Market Report PDF

The deck is for recording. **This is the thing that travels** — it gets forwarded, attached, texted,
and given away, and it's the one asset that keeps working after the video stops getting views.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`) — including #6: we write the
brief, the agent builds the file. **Never render a PDF here.**
**Apply the doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/market-doctrine.md`) — interpret-don't-recap
(§3), the three lenses (§4), the 2-CTA model (§9).

---

## Step 1 — Load the month
1. `~/realtor-brain/memory/market-data.md` — this month's block. **Confirm the block's month is the
   month you're building.** Different month, or missing? Hand to **Market Research** — never build a
   document on another month's numbers.
2. The month's **presentation**, if built — the PDF reuses the deck's headline and glance figures
   rather than choosing again, so the video and the document agree.
3. `~/realtor-brain/brain.md`, then `identity/brand-visual.md` (colours, fonts — this is the most
   forwarded thing they produce), `identity/profile.md` (name, brokerage, licence, booking link,
   headshot placement), `identity/voice.md` (the commentary), `identity/story-bank.md` (per Brain law
   4 — one real, anonymized story earns more trust than a page of stats; skip if empty),
   `identity/offer.md`, `identity/compliance.md`.

---

## Phase 1 — The document (7 pages)

Designed to be read on a phone, forwarded without explanation, and still make sense in six months.
**Different from the deck:** the deck is sparse because a voice carries it. This has no voice — it
has to say everything itself, in full sentences.

| Page | What's on it |
|---|---|
| 1 | **Cover** — "[City] Real Estate Market Report · [Month Year]", the headline of the month, agent name, brokerage, headshot, and the data-period line |
| 2 | **The month in one page** — the eight glance stats as a clean grid, each with its YoY and a one-line meaning. The page someone screenshots |
| 3 | **What's actually happening** — 3–4 short paragraphs of plain-English interpretation. This is the page the deck can't have |
| 4 | **If you're buying** — what the numbers mean, what to do, one concrete move |
| 5 | **If you're selling** — same, told honestly |
| 6 | **If you're moving here** — the relocation lens, written for someone who doesn't know the city |
| 7 | **Rates, real costs, and my take** — the payment examples, the agent's read in their voice, both CTAs, contact block, disclaimer + licence |

Rules:
- **Full sentences, not slide fragments.** Nobody is narrating this.
- Every stat still carries its meaning (doctrine §3).
- Property types and communities fold into pages 3–6 as supporting detail — this document has no
  conditional pages, so the page count never moves.
- If `story-bank.md` has a story that fits the month's theme, weave one short anonymized version into
  page 3 or page 7. Never fabricate one.
- Sources listed in small type on page 7.

## Phase 2 — The Claude Design brief

Paste-ready, **page by page, with the real values in it** — never a summary, never a placeholder.
Letter/A4 portrait, designed for screen reading first and printing second.

*(Kit path: agents with the **Monthly Market Report Kit** design skill can instead upload the whole
`Market Report PDF — [Month Year]` doc to their Brand HQ design project — it builds the 7-page PDF
from this doc directly; this brief stays as the Canva / kit-less fallback.)*

```
PDF — [City] Market Report · [Month Year]
Portrait, 8.5×11 (US Letter) / A4 · 7 pages
Palette: [hex from brand-visual.md]    Type: [heading] / [body]
Rules: readable at phone width · numbers large enough to read on a shared screen ·
       generous margins · no full-bleed dark pages (people print these)

PAGE 1 — COVER
  Layout: [describe]
  Headline: "[the real headline of the month]"
  Title: "[City] Real Estate Market Report · [Month Year]"
  Agent block: [name] · [brokerage] · headshot [placement]
  Small type: "Based on [Board] data for [data period]"
…
```

Brand colours unset in `brand-visual.md`? Say so in one line and specify near-black on off-white with
one accent. Never output bracketed placeholder colours.

## Phase 3 — Green screen notes

The second job of this document. The agent pulls the PDF up on screen, stands in front of it, and
talks. Give them what they need to actually do that:

- **Which pages work on camera** — page 2 (the stat grid) is the strongest; page 7's payment examples
  are second. Pages of paragraphs do not work behind a person.
- **What to point at** — the one number on that page worth gesturing to.
- **A 30–45 second talking track** for each of the two green-screen pages: the hook, the number, what
  it means, one move. Word-for-word, so it can be filmed immediately.
- **Framing note** — keep the agent on the left third, the page's key number visible over their right
  shoulder, and zoom to the region rather than showing the whole page (a full page is unreadable at
  phone size).

*(This is a different job from **Market Shorts** — that skill builds the three planned short-form
concepts for the month. This is the "I have five minutes and the PDF is already open" version.)*

## Phase 4 — The send-it copy

The document is useless sitting in a folder. Write the words that move it:

- **Email** — subject, one-paragraph body, the attachment line. For the database.
- **Text / DM** — two sentences, for the client who asked "how's the market?" Casual, no pitch.
- **Listing-appointment line** — how to send it ahead of a seller meeting so it does the pre-framing.
- **Lead-magnet delivery** — the line that goes out when someone opts in for the recurring report.

All four in the agent's voice. Every one names the city and one number.

## Phase 5 — Compliance pass
Run the whole document and all four copy blocks through `identity/compliance.md` — disclaimer and
licence number on page 7, nothing on the claims-to-avoid list, no forecast phrased as fact, fair
housing on every community line. Empty `compliance.md`? Proceed and flag it once.

## Phase 6 — Save + log
Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`, save into the month folder as
`Market Report PDF — [Month Year]`: the page-by-page content, then the design brief, then the green
screen notes, then the send-it copy, then Data Sources.

Log one row to `memory/content-log.md` (Document · Market report PDF · the month · `Scripted`), then
**push the Brain**.

Close with: *"Upload this doc to your Brand HQ design project and run the Market Report Kit (or paste
the brief into claude.ai/design), export the PDF, and you've got the thing you send all month — plus
a green screen video whenever you want one."*

## Quality checklist
- [ ] Data block's month verified as the month being built.
- [ ] Every figure came from the block and matches the deck exactly; nothing researched here.
- [ ] Full sentences throughout — this reads without a narrator.
- [ ] All three lenses have their own page.
- [ ] Every stat carries its meaning; no bare figures.
- [ ] Seven pages, fixed — no conditional pages.
- [ ] A real story woven in if `story-bank.md` had one; never fabricated.
- [ ] Design brief is page by page with real values — no placeholders.
- [ ] Green screen notes name the two usable pages, what to point at, and a word-for-word track each.
- [ ] All four send-it copy blocks written, in their voice, each naming the city and a number.
- [ ] Both CTAs present on page 7; disclaimer and licence there.
- [ ] Compliance and fair-housing pass done; logged; Brain pushed.
- [ ] No PDF rendered here — brief only.
