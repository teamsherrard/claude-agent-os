---
name: realtor-content-engine
description: >
  Phase 5 of the Realtor AI Brain — defines the agent's content system so every content skill stays
  consistent: their content pillars, which platforms they prioritize, posting cadence, recurring
  series, hashtag sets, CTA library, favourite hook styles, and video style preferences. Writes
  identity/content-engine.md, which the market-update, listing, tour, local, YouTube, and short-form
  skills all read.

  Trigger on: "set up my content engine", "define my content pillars", "my content strategy",
  "set my posting schedule", "my hashtags and CTAs", "content system", "phase 5", or any request to
  define how the agent posts and what themes they own.
---

# Realtor Content Engine (Brain Phase 5)

Defines *how the agent shows up* so every content skill produces on-brand, non-repetitive content on a
consistent rhythm. About 10 minutes.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, plus `identity/avatars.md`, `identity/voice.md`, `identity/market.md`.
Their avatars and voice shape the pillars and hooks. If `~/realtor-brain/` doesn't exist, tell them to
run **Realtor AI Brain — Setup** first.

## The interview (one question at a time, conversational)
1. **Content pillars** — "What 3–5 themes do you want to be known for?" (If stuck, propose pillars from
   their avatars + market + offer, e.g. market reads, neighbourhood spotlights, first-time-buyer
   education, behind-the-scenes.)
2. **Platforms & priority** — which platforms, ranked.
3. **Cadence** — realistic posting rhythm per platform.
4. **Recurring series / formats** — any signature repeatable formats (e.g. "Monthly Market Update").
5. **Hashtag sets** — their go-to hashtags per platform (offer to draft local ones from their market).
6. **CTA library** — the calls to action they like (pull the primary from `voice.md`, add others).
7. **Hook styles** — which hook types feel like them (contrarian, listicle, question, before/after).
8. **Video style prefs** — captions on/off, music vibe, typical length, b-roll vibe.

Keep it light — offer smart defaults from the rest of their Brain wherever they're unsure.

## Write + confirm
Write everything to `~/realtor-brain/identity/content-engine.md`. Confirm: *"Your content engine is
set — every content skill will now follow your pillars, cadence, hashtags, and style."* If run as
**Phase 5 of Setup**, hand control back to Setup.
