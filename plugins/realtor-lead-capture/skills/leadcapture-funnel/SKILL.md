---
name: leadcapture-funnel
description: >
  Step 2 of the Lead Capture System — maps the opt-in funnel (the landing page) that gives the lead magnet
  away. Reads the finished lead magnet so the page sells exactly what the guide delivers, then writes the
  full page copy section by section — Hero, About the agent, The offer, The opt-in — in the agent's voice,
  built to convert. Lead capture ONLY — name + email, never a call booking. COPY + STRATEGY ONLY — it writes
  the page's copy and structure (the design is a separate skill); it NEVER designs or hosts the page.

  Trigger on: "build my funnel", "map my funnel", "lead capture funnel", "opt-in page", "opt-in funnel",
  "landing page copy", "build my lead capture page", "the page that gives away my lead magnet", or any
  request to create the opt-in page for a lead magnet.
---

# Lead Capture Funnel Mapper (Step 2 — spec only)

The opt-in page. One job: get the visitor to grab the lead magnet (name + email). Every section pushes
toward that — and nothing else (house rules #4: **no call booking, ever**).

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

> **We write the copy + strategy; we never design or host (house rules #3).** This produces the page's *words
> and structure* — the design (turning it into a built page) is a **separate skill**, and hosting is the
> agent's own tool. Pour 100% of the effort here into making the copy + strategy genuinely great.

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
- `identity/offer.md` — the **WHY-WORK-WITH-ME / offer** section: their full services, USP, and why-hire-them
  (the richest part of the page — not just the guide's process). Present as a transformation, not a task list.
- `identity/proof.md` — real wins/testimonials/numbers for the About + offer sections (never invented).
- `identity/profile.md` — name, niche, credentials, what makes them amazing — **plus their socials/links**.
- `identity/content-engine.md` — the platforms they're active on + their YouTube/channels (drives the
  **conditional Socials section** — skip that section entirely if they have none).
- `identity/avatars.md` — the reader and their core fear (the copy speaks to it).
- `identity/voice.md` + `identity/voice-samples.md` — write the whole page in their real voice.
- `identity/market.md` — the **LOCAL MARKET** section: the real communities + areas they serve, price bands,
  new-build communities, local depth. The un-fakeable authority that makes the page feel like value, not a pitch.
- `identity/compliance.md` — disclaimer/claims rules (house rules #5).

**Read the Brain; never re-ask (house rules #2).**

## Step 3 — Read the references (this is where the quality comes from)
- `references/funnel-guide.md` — **read "The strategy underneath" FIRST** (the one big idea, desire + fear,
  the 3 objections to dissolve, the emotional arc), then the section-by-section structure. The strategy is
  what separates an "okay" page from one that converts.
- `${CLAUDE_PLUGIN_ROOT}/shared/copywriting-kb.md` — how to write each line so it persuades, not just informs.

---

## Phase 1 — Confirm what it's selling (and match its scope)
In one line, confirm the magnet this page gives away (its name + promise), so the agent sees the page and the
guide are the same story. If they want a different angle on the headline, note it — but the promise must
still match what the guide delivers. **Match the magnet's scope:** if it's **brand-led** (whole audience),
write the page to the agent's **personal brand and broad audience** of buyers and sellers; if it's
**audience-specific**, speak to that one reader. The page is always as general or as focused as the magnet.

## Phase 2 — Map the page (full copy — value-led, NOT a sales pitch)
Following `references/funnel-guide.md` + the copywriting KB, write the **complete copy** for each section, in
the agent's voice, compliance-safe. **Lead with genuine value + local authority, not hype** — the page earns
the opt-in by being the most useful, most *local* thing the reader has seen, not by pushing. **A thin page
reads salesy; a substantive one reads like an expert** — so pull the RICH stuff from the Brain: the real
communities from `market.md`, the full offer + USP from `offer.md`, real proof from `proof.md`. The sections:

1. **HERO** — the **headline** (= the magnet's core promise, benefit-led, for its audience — or the agent's
   whole brand if brand-led), a **subhead** (expand the promise + who + remove doubt), and the **CTA button**
   ("Send me the free guide"). 90% of whether they stay.
2. **THE PROBLEM** — name the reader's single most acute fear from `avatars.md` and agitate it honestly (the
   real cost of getting it wrong), then turn the corner: there's a better way, and this guide is it. Empathy
   + stakes, not a pitch.
3. **THE GUIDE — what's inside + its value (with the mockup)** — the value-stack: 4–7 concrete "here's exactly
   what you'll get" bullets from the magnet's pages (real outcomes, never teases) + why it beats generic advice.
   **Note the guide mockup/cover sits left or right** of this section. Repeat the CTA here (mid-page).
4. **ABOUT THE AGENT — WHO they are** — **what makes them amazing** (niche + why it matters to this reader),
   **why they're qualified** (one credibility line — save testimonials for Proof), **their process** (3 steps
   max). Humble-confident, human, specific.
5. **WHY WORK WITH [AGENT] — the OFFER + USP** — the real "why hire me," straight from `offer.md`, NOT just the
   guide's process: their **actual services** (as outcomes), their **USP** (what they do differently, tied to
   the reader's fear), and the **transformation** they get. Never a guarantee (house rules #5). **The section
   most pages are missing.** (Distinct from §4: that's WHO, this is WHAT they offer.)
6. **THE LOCAL MARKET — "your communities"** — the un-fakeable section, the strongest answer to "why not just
   Google it." From `market.md`: the specific **communities/areas they serve** by name, what's distinct in
   FACTS (price bands, the new-build communities, schools by name, commute — never "good area"/"family-friendly"
   proxies, Fair Housing), and why their local depth protects the reader. VALUE, not a pitch. (Real community
   photos go here at the design step — note it in the assets line.)
7. **PROOF / RESULTS** — a **dedicated** proof block from `proof.md` (real only): 2–4 short testimonials/results
   (name + situation + outcome), hard numbers, maybe a one-line case story — all tied back to the reader's fear.
   If proof is thin, keep it small and honest; **never invent** (house rules #5).
8. **AS SEEN ON / FOLLOW ALONG — socials + YouTube** — **CONDITIONAL: include ONLY if the agent has channels**
   (`profile.md` / `content-engine.md`). If none, **skip this section entirely** — no empty block. When they
   have a presence: their real channels (handles/links only), a "follow for more free value" framing (esp.
   YouTube), real follower counts if worth showing. **Opt-in stays the one primary CTA** — socials are a
   secondary trust signal, not a competing button.
9. **THE OPT-IN** — name the magnet + a one-line promise, a **quick recap of the top 3 "what you'll get"** (the
   full stack is in §3), the **form (name + email only)**, the **reassurance** ("Free. Instant. No spam."),
   and the **CTA button** (same as the hero). Then the **thank-you state** — a warm confirmation + **the guide
   as an instant download right on the page** (never "check your inbox"). **Instant download ONLY, never email
   delivery; never ask how to deliver it (house rules #4).** **No call booking** — follow-up is theirs.

## Phase 3 — Note the assets, then hand off (design is a SEPARATE skill)
This skill ends at the **copy + strategy** — that's the whole deliverable. **Do NOT write a design prompt;**
a separate design skill turns the copy into the built page. Just close with a short, plain **"assets to
gather"** line for that next step: the **guide mockup/cover** (for The Guide section — left/right — and
optionally the hero), real community/area photos (Local Market), their headshot (About), their social/channel
screenshots or handles (Socials, if used), and their logo. That's it — then hand off.

## Phase 4 — Compliance pass (house rules #5)
Run the full page through `~/realtor-brain/identity/compliance.md`: brokerage disclaimer + license # as a
footer line where the rule applies, strip guarantees and Fair-Housing proxies, keep every claim honest and
backed. Flag once if `compliance.md` is empty.

## Phase 5 — Deliver + save (paired with the magnet)
1. **Deliver in chat** — all the sections of copy, cleanly laid out and ready to use.
2. **Save to Drive** following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: into the **same campaign
   folder** as the magnet, save `Lead Capture Funnel — [Guide Name]` (`text/plain` → clean Google Doc).
   Confirm the location in plain words.
3. **Close the loop:** *"That's your funnel copy — every section, ready to go. Next, your design step turns it
   into the built page; then host it wherever you like. After someone opts in, the follow-up's all yours."*

---

## Quality checklist
- [ ] Read the actual magnet first; **page promise = magnet promise = what's delivered** (house rules #7)
- [ ] **Strategy applied first** (one big idea · desire + fear · the 3 objections dissolved · the emotional arc)
- [ ] All sections present, in order (Hero · Problem · The Guide · About · Why-Work-With · Local Market · Proof · [Socials] · Opt-in)
- [ ] Hero headline clear, benefit-led, specific, no hype; **ONE primary CTA repeats ~3× (hero · mid-page · opt-in)**
- [ ] PROBLEM names + agitates the avatar's real fear (from avatars.md) before any pitch
- [ ] THE GUIDE value-stacks the pages (concrete outcomes) + **notes the mockup sits left/right**
- [ ] ABOUT = WHO they are · WHY-WORK-WITH = the OFFER + USP — two distinct sections (from offer.md); no guarantees
- [ ] LOCAL MARKET pulls real communities from market.md (authority, not a pitch)
- [ ] PROOF is a dedicated block from proof.md — real only, nothing invented
- [ ] SOCIALS section included ONLY if the agent has channels (else omitted cleanly); opt-in stays the one primary CTA
- [ ] Opt-in asks for name + email only; reassurance present; **no call booking** (house rules #4)
- [ ] Voice matches `voice.md` + `voice-samples.md`; local and specific (why-not-ChatGPT)
- [ ] No design prompt written (design is a separate skill); assets-to-gather noted instead
- [ ] Compliance pass done
- [ ] Saved into the same campaign folder as the magnet; location confirmed in plain words
