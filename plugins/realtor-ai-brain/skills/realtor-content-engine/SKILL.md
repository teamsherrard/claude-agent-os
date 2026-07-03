---
name: realtor-content-engine
description: >
  Phase 5 of the Realtor AI Brain — sets the agent's simple content plan: pillars, which platforms they
  focus on, a realistic posting cadence, signature series, and a default video style. Built for week-one
  beginners: it asks the two things only the agent knows (platforms + capacity), and for everything else
  it ASKS first but GENERATES a ready-to-use draft the moment the agent is unsure — so nobody freezes on
  a blank question. Writes identity/content-engine.md. Hashtags and hook styles are NOT stored here — the
  content skills generate those fresh per piece.

  Trigger on: "set up my content engine", "my content plan", "content pillars", "posting schedule",
  "what should I post", "phase 5", or any request to define how/what the agent posts.
---

# Realtor Content Engine (Brain Phase 5)

Sets a simple, durable content plan. Built so a brand-new agent in week one is never overwhelmed.
~3–5 minutes.

## The golden rule for this skill
*(This phase is the model the whole Brain follows — see `${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md`.)*
- **Ask each question first.** If the agent gives a real answer, **use it** — never overwrite their
  input with a guess (that wastes their time and risks being wrong).
- **Generate only when they're unsure** ("I don't know," "you pick," "not sure"). *Then* propose a draft
  from their Brain and let them react. Never dump a generated plan on someone who already has an answer.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, plus `identity/avatars.md`, `identity/voice.md`, `identity/market.md`,
`identity/offer.md`, `identity/profile.md`. This is what you generate from *when the agent is stuck*.
Also read `${CLAUDE_PLUGIN_ROOT}/shared/brand-doctrine.md` — the pillars must reflect Mike's niche/content
beliefs (below). If `~/realtor-brain/` doesn't exist, run **Setup** first.

## The niche/content mix rule (from `brand-doctrine.md` — apply when setting pillars)
- **Start ~20% niche / 80% general, and grow the niche ~20% each year.** Early on, most content should be
  broad, widely-searched, top-of-funnel — it builds momentum and brand awareness, then funnels people down
  to the niche. Over ~5 years the agent becomes THE go-to for their niche. So a week-one plan leans general,
  with **one clear niche pillar** seeded in — not an all-niche plan.
- **A few pillars, not a prison.** The niche is *one* pillar; the rest can be market-general topics. Don't
  force everything through the niche.
- **Think in search intent (AI-search era).** Favour pillars/topics people actually search — "relocating to
  [city]," "first home in [market]," "is [community] worth it" — so the agent gets found and recommended.

## The two questions only the agent can answer (always ask)
1. **Platforms** — "Which platforms are you actually on, or want to focus on?" (capture handles → `profile.md`).
2. **Capacity** — "Realistically, how much can you post right now?" Offer these as starting points — and
   note capacity can **differ by platform** (e.g. Heavy on video but Light on short-form) or ramp over time:
   - **Light** — ~1 video + 3 short posts / week
   - **Medium** — ~2 videos + 3–4 short posts / week
   - **Heavy** — daily
   - **Or tell me your own** — whatever's realistic. If it differs per platform, capture that split.

   *(Short-form's floor is ~3×/week — so even "Light" keeps 3 short posts/week; the Short-Form System
   plugin owns the detailed short-form cadence. Below 3 short/week, momentum stalls.)*

## The rest — ask once, generate only if they're unsure
For each: ask once. **They know → use it. They don't → generate from the Brain and confirm.**
- **Content pillars (3–5)** — if unsure, propose pillars from their niche + avatars + market + offer,
  following the 20/80 mix above: **one clear niche pillar + broader, widely-searched market pillars**
  (e.g. new-construction agent → niche: "New-build 101"; general: "Community spotlights," "Market reads,"
  "Buyer myth-busting"). Phrase them toward search intent so the agent gets found.
- **Signature series** — if unsure, propose one obvious recurring format (e.g. "Monthly [city] [niche] Update").
- **Default video style** — captions on/off, vibe, typical length. If unsure, default from their voice
  (e.g. calm/clean, captions on, 30–60s).

## Write + push to Drive + confirm

> **Push to Drive after writing** — run `realtor-brain-sync` (PUSH). The local copy is wiped when the
> session ends; an unsynced write is a lost write.
Write `~/realtor-brain/identity/content-engine.md` — pillars, platforms (+ priority), cadence, signature
series, default video style. **Do NOT write hashtags or hook lists** (content skills make those per
piece). Pull the default CTA from `voice.md` — don't re-ask. Confirm: *"Your content plan is set — every
content skill follows this now. Change it anytime as you find your groove."*
If run as **Phase 5 of Setup**, hand control back to Setup.
