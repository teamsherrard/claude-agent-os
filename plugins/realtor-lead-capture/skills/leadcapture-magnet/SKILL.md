---
name: leadcapture-magnet
description: >
  Step 1 of the Lead Capture System — builds the agent's lead magnet (a buyer or seller guide) straight from
  the offer in their AI Brain. Produces the full, genuinely useful guide content as clean copyable text, in
  the agent's voice, plus a ready-to-paste claude.ai/design prompt to build the PDF. Saves it as a Google
  Doc in the campaign folder, then hands off to the funnel that gives it away. SPEC ONLY — it writes the
  content + design direction; it NEVER designs the PDF.

  Trigger on: "build my lead magnet", "create a lead magnet", "lead magnet for my offer", "make my buyer
  guide", "make my seller guide", "set up my lead capture", "build my lead capture system", "I need a free
  guide to give away", or any request to create the downloadable freebie an opt-in gives away.
---

# Lead Magnet Builder (Step 1 — spec only)

The free guide an opt-in gives away. Built **from the agent's offer** so it naturally leads toward working
with them — and so the funnel (Step 2) has something specific and real to sell.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

> **We map; we never design (house rules #3).** This writes the guide's *content* and a design *direction* —
> never the PDF. The agent builds the visual in **claude.ai/design** from what you hand them.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/offer.md` — **the anchor.** The magnet is built from the offer + the problem it solves.
- `identity/avatars.md` — who it's for and their single biggest fear/desire (the magnet answers it).
- `identity/proof.md` — real wins/testimonials/numbers to weave in (credibility, never invented).
- `identity/voice.md` + `identity/voice-samples.md` — write it in their real voice.
- `identity/market.md` — city, communities, price bands, local specifics (the magnet is full of these).
- `identity/profile.md` — name, niche, credentials, where to reach them.
- `identity/brand-visual.md` — colours/fonts/vibe, for the design prompt only (words, not a render).
- `identity/compliance.md` — the disclaimer/claims rules (house rules #5).

**Read the Brain; never re-ask what it knows (house rules #2).** If `identity/offer.md` is thin or empty,
stop and tell the agent kindly that the magnet is only as strong as the offer behind it, and point them to
**"build my offer"** first. If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup**.

## Step 2 — Read the references
- `references/magnet-guide.md` — magnet types, what makes one worth opting in for, the guide structure.
- `${CLAUDE_PLUGIN_ROOT}/shared/copywriting-kb.md` — how to write it so it's genuinely good, not AI filler.

---

## Phase 1 — Pick the magnet (one audience, one promise)
Decide who this campaign serves: a **buyer guide**, a **seller guide**, or a niche cut of one (e.g. a
new-build buyer guide, a first-time-buyer guide, a downsizer's seller guide) — matched to the agent's
strongest avatar + offer. **One magnet = one audience** (so the funnel can speak to one person).

If the agent named it, use it. If not, or if they're unsure, **advise (house rules #9):** recommend the ONE
that best fits their offer + the avatar they most want, in one line of why — then offer 1–2 alternatives.
Lock the **single core promise** of the guide (this becomes the funnel's headline later). Confirm in one
friendly line.

## Phase 2 — Build the guide content
Following `references/magnet-guide.md` + the copywriting KB, produce as clean copyable text:
- **The promise** — what the guide delivers + who it's for, in a line or two. Specific and benefit-led.
- **The guide, page by page (5–9 pages)** — the **actual, genuinely useful content**, not a tease. Real,
  local, specific (real communities, real numbers, the real steps). Each page: a clear title + skimmable
  value. This has to be worth handing over an email for — deliver real value (house rules #8).
- **How the agent helps next** — a soft, no-pressure close in their voice: where they are now, how the
  agent makes the next step easy, and where to reach them. **No call booking** (house rules #4) — just a
  warm "here's where to find me."
- Weave the offer + one real proof point in naturally near the end — never a hard sell.

## Phase 3 — The design prompt (claude.ai/design)
Write a **ready-to-paste claude.ai/design prompt** to build the guide as a clean branded PDF: the page
order, the cover (title + promise), the agent's brand colours/fonts/vibe from `brand-visual.md`, and a note
to keep it simple and readable. Words only — never a rendered example.

## Phase 4 — Compliance pass (house rules #5)
Run the whole guide through `~/realtor-brain/identity/compliance.md`: disclaimer + license # where the rule
applies, strip any guarantees or Fair-Housing proxies, keep claims honest. Flag once if `compliance.md` is empty.

## Phase 5 — Deliver, save, hand off
1. **Deliver in chat** — the full guide content + the design prompt, cleanly laid out.
2. **Save to Drive** following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: create
   `[Agent Name] — Lead Capture System/[YYYY-MM-DD · Guide Name]/` and save `Lead Magnet — [Guide Name]`
   (`text/plain` → clean Google Doc). Confirm the location in plain words.
3. **Hand off to Step 2:** *"That's your free guide done. Want me to map the page that gives it away — the
   opt-in funnel? It'll sell this exact guide."* (runs `leadcapture-funnel`).

---

## Quality checklist
- [ ] Brain read; offer used as the anchor; nothing re-asked
- [ ] One audience, one clear core promise (ready to become the funnel's headline)
- [ ] 5–9 pages of REAL, local, specific value — worth an email, not a tease (house rules #8)
- [ ] Offer + one real proof woven in near the end; soft close, **no call booking**
- [ ] Voice matches `voice.md` + `voice-samples.md`
- [ ] Design prompt is paste-ready and uses their real brand colours/fonts — words only, no render
- [ ] Compliance pass done
- [ ] Saved to the campaign folder (output standard); location confirmed in plain words
- [ ] Handed off to the funnel
