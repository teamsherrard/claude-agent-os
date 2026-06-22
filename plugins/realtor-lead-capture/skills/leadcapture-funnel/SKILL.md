---
name: leadcapture-funnel
description: >
  Step 2 of the Lead Capture System — maps the opt-in funnel (the landing page) that gives the lead magnet
  away. Reads the finished lead magnet so the page sells exactly what the guide delivers, then writes the
  full page copy section by section — Hero, About the agent, The offer, The opt-in — in the agent's voice,
  built to convert, plus a ready-to-paste claude.ai/design prompt. Lead capture ONLY — name + email, never a
  call booking. SPEC ONLY — it writes the copy + design direction; it NEVER designs or hosts the page.

  Trigger on: "build my funnel", "map my funnel", "lead capture funnel", "opt-in page", "opt-in funnel",
  "landing page copy", "build my lead capture page", "the page that gives away my lead magnet", or any
  request to create the opt-in page for a lead magnet.
---

# Lead Capture Funnel Mapper (Step 2 — spec only)

The opt-in page. One job: get the visitor to grab the lead magnet (name + email). Every section pushes
toward that — and nothing else (house rules #4: **no call booking, ever**).

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

> **We map; we never design or host (house rules #3).** This writes the page's *copy* and a design
> *direction* — never the page itself. The agent builds it in **claude.ai/design** and hosts it on their own
> site / GoHighLevel / Carrd.

---

## Step 1 — Get the magnet first (alignment is non-negotiable — house rules #7)
This page sells a specific lead magnet, so it must read it:
- Look for the campaign's **Lead Magnet doc** (built by `leadcapture-magnet`, in
  `[Agent Name] — Lead Capture System/[campaign]/`). Read it — its **promise** and its **page list** drive
  the headline and the opt-in bullets.
- **If no magnet exists yet,** don't guess: build (or confirm) it first via `leadcapture-magnet`, then come
  back. The page and the guide must line up exactly.

## Step 2 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/offer.md` — for the Offer section (present it as a transformation, not a task list).
- `identity/proof.md` — real wins/testimonials/numbers for the About + Offer sections (never invented).
- `identity/profile.md` — name, niche, credentials, what makes them amazing.
- `identity/avatars.md` — the reader and their core fear (the copy speaks to it).
- `identity/voice.md` + `identity/voice-samples.md` — write the whole page in their real voice.
- `identity/market.md` — local specifics that make it credible.
- `identity/brand-visual.md` — colours/fonts/vibe for the design prompt (words only).
- `identity/compliance.md` — disclaimer/claims rules (house rules #5).

**Read the Brain; never re-ask (house rules #2).**

## Step 3 — Read the references
- `references/funnel-guide.md` — the section-by-section structure, what converts in each, and the flow.
- `${CLAUDE_PLUGIN_ROOT}/shared/copywriting-kb.md` — how to write each section so it actually converts.

---

## Phase 1 — Confirm what it's selling
In one line, confirm the magnet this page gives away (its name + promise), so the agent sees the page and the
guide are the same story. If they want a different angle on the headline, note it — but the promise must
still match what the guide delivers.

## Phase 2 — Map the page (the four sections, full copy)
Following `references/funnel-guide.md` + the copywriting KB, write the **complete copy** for each section,
in the agent's voice, compliance-safe. Every section flows toward the opt-in:

1. **HERO** — the **headline** (= the magnet's core promise, benefit-led, for this audience in this market),
   a **subhead** (expand the promise + who it's for + remove doubt), and the **primary CTA button**
   ("Send me the free guide"). This is 90% of whether they stay.
2. **ABOUT THE AGENT** — three beats, all framed for the reader: **what makes them amazing** (their niche +
   why it matters to this reader), **their wins** (real proof from `proof.md`), **their process** (the
   simple "here's how I make this easy," 3 steps max). Humble-confident, human, specific.
3. **THE OFFER** — present `offer.md` as a **transformation** (where the reader is now → where the agent
   gets them), **why this agent** (the USP tied to the reader's fear), and **one more proof point.** Makes
   the agent the obvious choice — no guarantees (house rules #5).
4. **THE OPT-IN** — name the magnet + a one-line promise, **3–5 "what you'll get" bullets that match the
   guide's pages exactly**, the **form (name + email only)**, the **reassurance** ("Free. Instant. No
   spam."), and the **CTA button** (same as the hero). Then the **thank-you state** copy (warm confirmation
   + "check your inbox, your guide's on the way" in their voice). **No call booking** — follow-up is theirs.

## Phase 3 — The design prompt (claude.ai/design)
Write a **ready-to-paste claude.ai/design prompt** for a one-page opt-in: the section order above, the
hero + form layout, where the CTA repeats, and the agent's brand colours/fonts/vibe from `brand-visual.md`.
Add the plain hosting note: build in claude.ai/design, then publish on their site / GoHighLevel / Carrd.
Words only — never a render.

## Phase 4 — Compliance pass (house rules #5)
Run the full page through `~/realtor-brain/identity/compliance.md`: brokerage disclaimer + license # as a
footer line where the rule applies, strip guarantees and Fair-Housing proxies, keep every claim honest and
backed. Flag once if `compliance.md` is empty.

## Phase 5 — Deliver + save (paired with the magnet)
1. **Deliver in chat** — the four sections of copy + the design prompt, cleanly laid out, ready to paste.
2. **Save to Drive** following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: into the **same campaign
   folder** as the magnet, save `Lead Capture Funnel — [Guide Name]` (`text/plain` → clean Google Doc).
   Confirm the location in plain words.
3. **Close the loop:** *"That's your full lead-capture set — the guide and the page that gives it away.
   Take both docs to claude.ai/design to build them, then host the page wherever you like. After someone
   opts in, the follow-up's all yours."*

---

## Quality checklist
- [ ] Read the actual magnet first; **page promise = magnet promise = opt-in bullets = what's delivered** (house rules #7)
- [ ] All four sections present, in order, each flowing toward the opt-in
- [ ] Hero headline is clear, benefit-led, specific, no hype; CTA repeats in hero + opt-in
- [ ] About uses real wins/proof from the Brain (nothing invented); framed for the reader
- [ ] Offer presented as a transformation + why-them + proof; no guarantees
- [ ] Opt-in asks for name + email only; reassurance present; **no call booking** (house rules #4)
- [ ] Voice matches `voice.md` + `voice-samples.md`; local and specific (why-not-ChatGPT)
- [ ] Design prompt paste-ready with real brand colours/fonts; hosting note included — words only, no render
- [ ] Compliance pass done
- [ ] Saved into the same campaign folder as the magnet; location confirmed in plain words
