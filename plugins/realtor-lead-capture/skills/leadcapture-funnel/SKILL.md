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
- `identity/profile.md` — name, niche, credentials, what makes them amazing.
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
   whole brand if brand-led — in this market), a **subhead** (expand the promise + who it's for + remove
   doubt), and the **primary CTA button** ("Send me the free guide"). 90% of whether they stay.
2. **ABOUT THE AGENT** — three beats, framed for the reader: **what makes them amazing** (niche + why it
   matters to this reader), **their wins** (real proof from `proof.md`), **their process** (3 steps max).
   Humble-confident, human, specific.
3. **THE LOCAL MARKET — "your communities"** — the section that makes the page feel local and un-fakeable, and
   the strongest answer to "why not just Google it." Pull the agent's real market from `market.md`: name the
   specific **communities/areas they serve**, what's genuinely distinct about each in FACTS (price bands, the
   new-build communities, schools by name, commute, amenities — never "good area"/"family-friendly" proxies,
   Fair Housing), and the local depth only they have ("the deep-south new-build communities I know inside
   out"). This is VALUE, not a pitch. (Real community photos belong here once it's designed — note that in the assets line.)
4. **WHY WORK WITH [AGENT] — the offer + USP** — the real "why hire me," straight from `offer.md`, NOT just
   the guide's process. Make it substantive: their **actual services/offer** (how they work with clients),
   their **USP** (what they do differently than any other agent), and the concrete **reasons to choose them**,
   each tied to the reader's fear (overpaying, mispricing, the unknown), plus one more real proof point.
   Present it as the transformation they get — never a guarantee (house rules #5). **This is the section most
   agents' pages are missing.**
5. **THE OPT-IN** — name the magnet + a one-line promise, **3–5 "what you'll get" bullets that match the
   guide's pages exactly**, the **form (name + email only)**, the **reassurance** ("Free. Instant. No
   spam."), and the **CTA button** (same as the hero). Then the **thank-you state** copy (warm confirmation
   + "check your inbox, your guide's on the way" in their voice). **No call booking** — follow-up is theirs.

## Phase 3 — Note the assets, then hand off (design is a SEPARATE skill)
This skill ends at the **copy + strategy** — that's the whole deliverable. **Do NOT write a design prompt;**
a separate design skill turns the copy into the built page. Just close with a short, plain **"assets to
gather"** line for that next step: real community/area photos (for the Local Market section), their headshot,
the guide cover, and their logo. That's it — then hand off.

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
- [ ] Read the actual magnet first; **page promise = magnet promise = opt-in bullets = what's delivered** (house rules #7)
- [ ] All five sections present (Hero · About · Local Market · Why-Work-With-Me · Opt-in), value-led not salesy
- [ ] Hero headline is clear, benefit-led, specific, no hype; CTA repeats in hero + opt-in
- [ ] About uses real wins/proof from the Brain (nothing invented); framed for the reader
- [ ] **Strategy applied first** (one big idea · desire + fear · the 3 objections dissolved · the emotional arc)
- [ ] LOCAL MARKET section pulls real communities from market.md (authority, not a pitch)
- [ ] WHY-WORK-WITH-ME section pulls the full offer + USP from offer.md (the real why-hire-them, not just the guide); no guarantees
- [ ] Opt-in asks for name + email only; reassurance present; **no call booking** (house rules #4)
- [ ] Voice matches `voice.md` + `voice-samples.md`; local and specific (why-not-ChatGPT)
- [ ] No design prompt written (design is a separate skill); assets-to-gather noted instead
- [ ] Compliance pass done
- [ ] Saved into the same campaign folder as the magnet; location confirmed in plain words
