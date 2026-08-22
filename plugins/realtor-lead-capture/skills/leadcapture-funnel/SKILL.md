---
name: leadcapture-funnel
description: >
  Step 2 of the Lead Capture System — maps the opt-in funnel (the landing page) that gives the lead magnet
  away. Reads the finished lead magnet so the page sells exactly what the guide delivers, then writes the
  full page copy section by section — Hero, The Problem, The Guide, About the agent, Why Work With (offer +
  USP), Local Market, Proof, Socials (only if they have channels), and The Opt-in — in the agent's voice,
  built to convert. Lead capture ONLY — a pop-up opt-in form (name, email, phone) and a thank-you page with
  the guide as an instant download; never a call booking. COPY + STRATEGY ONLY — it writes
  the page's copy and structure (the design is a separate skill); it NEVER designs or hosts the page.

  Trigger on: "build my funnel", "map my funnel", "lead capture funnel", "opt-in page", "opt-in funnel",
  "landing page copy", "build my lead capture page", "the page that gives away my lead magnet", or any
  request to create the opt-in page for a lead magnet.
---

# Lead Capture Funnel Mapper (Step 2 — spec only)

The opt-in page. One job: get the visitor to grab the lead magnet. Every section pushes toward that — and
nothing else (house rules #4: **no call booking, ever**). The opt-in itself is a **two-step flow**: every CTA
button opens the **opt-in pop-up** (name, email, phone), and submitting lands on the **thank-you page** with
the guide as an instant download.

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
- `identity/strategy.md` + `identity/business-plan.md` — the strategy chapters of their **AI Brain Book**
  (goals, what they want to be known for, the 90-day plan). The rendered "[Agent] — AI Brain" doc in their
  Drive/OneDrive is built from these files; the sync PULL at session start is what guarantees they're
  current. The page should sound like the agent the plan says they're becoming.

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
   ("Grab Your Free Guide"). 90% of whether they stay.
2. **THE PROBLEM** — name the reader's single most acute fear from `avatars.md` and agitate it honestly (the
   real cost of getting it wrong), then turn the corner: there's a better way, and this guide is it. Empathy
   + stakes, not a pitch.
3. **THE GUIDE — what's inside + its value (with the mockup)** — the value-stack: 4–7 concrete "here's exactly
   what you'll get" bullets from the magnet's pages (real outcomes, never teases) + why it beats generic advice.
   **Note the guide mockup/cover sits left or right** of this section. Repeat the CTA here (mid-page).
4. **ABOUT THE AGENT — WHO they are** — **what makes them amazing** (niche + why it matters to this reader),
   **why they're qualified** (one credibility line — save testimonials for Proof), **their process** (3 steps
   max). Humble-confident, human, specific. **CONDITIONAL: the WELCOME VIDEO slot** — if the agent has (or
   will film) a 30–60s face-to-camera clip, note it here beside the About copy (*"welcome video, 30–60s,
   sits left/right of this section"*) and write its **talking-script outline** (3 beats: who I am + who I
   help → what the guide gives you → grab it below, no pitch). A face on camera is the strongest trust
   element on the page — and these agents already film. **If they have no video and don't want one, skip the
   slot entirely** — never render an empty placeholder. The video must never autoplay with sound or compete
   with the CTA — it supports the opt-in, it isn't a second destination.
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
   **Note the PROOF PHOTO STRIP here** — a horizontal, auto-scrolling strip of the agent's real photos gliding
   across the section (a marquee/carousel; the design step builds the motion): clients getting keys, the agent
   working with people, out in the community, testimonial moments. Specify it structurally — *"photo strip:
   8–12 real photos, auto-scrolling"* — and list which of their photos go in it. **Real photos only, that they
   have the rights to use — and client faces need the client's OK** (house rules #5). If they have fewer than
   ~6 usable photos, skip the strip (a thin strip reads worse than none) and note it as an asset to gather.
   If proof is thin, keep it small and honest; **never invent** (house rules #5).
8. **AS SEEN ON / FOLLOW ALONG — socials + YouTube** — **CONDITIONAL: include ONLY if the agent has channels**
   (`profile.md` / `content-engine.md`). If none, **skip this section entirely** — no empty block. When they
   have a presence: their real channels (handles/links only), a "follow for more free value" framing (esp.
   YouTube), real follower counts if worth showing. **Opt-in stays the one primary CTA** — socials are a
   secondary trust signal, not a competing button.
9. **THE OPT-IN** — name the magnet + a one-line promise, a **quick recap of the top 3 "what you'll get"** (the
   full stack is in §3), a **3-question mini-FAQ** (three one-liners that dissolve the last-moment
   objections, right at the ask — no separate section: *"Is this a sales pitch?"* → no, it's the guide, the
   follow-up is human and easy to decline · *"Will I get spammed?"* → no, instant download + unsubscribe
   anytime · *"I'm 12 months out — is this for me?"* → early is exactly when it helps most. Answer each in
   the agent's voice, one line each), and the **CTA button** (same as the hero). Then write the two states
   that follow — the whole flow is **button → pop-up → thank-you page** (house rules #4):
   - **The OPT-IN POP-UP** — every CTA button on the page opens this one modal: a short headline (restate the
     promise in one line), the **form fields (name, email, phone number)**, the **reassurance** ("Free.
     Instant. No spam."), and the submit button. Write the pop-up's copy — headline, field labels, button,
     reassurance line.
   - **The THANK-YOU PAGE** — where submitting lands: a warm confirmation in the agent's voice + **the direct
     link to the guide (the PDF) as a big instant-download button right there** (never "check your inbox").
     **Instant download ONLY, never email delivery; never ask how to deliver it (house rules #4).** Write the
     thank-you copy: the confirmation line, the download button text, and one soft "here's where to find me"
     line. **No call booking** — follow-up is theirs.

## Phase 3 — Note the assets, then hand off (design is a SEPARATE skill)
This skill ends at the **copy + strategy** — that's the whole deliverable. **Do NOT write a design prompt;**
a separate design skill turns the copy into the built page. Just close with a short, plain **"assets to
gather"** line for that next step: the **guide mockup/cover** (for The Guide section — left/right — and
optionally the hero), **8–12 real photos for the proof strip** (clients at closings, working with people,
community moments, testimonial shots — theirs to use, client OK where faces show), real community/area photos
(Local Market), their headshot (About), their **30–60s welcome video if they're filming one** (About — the
script outline is in §4), their social/channel screenshots or handles (Socials, if used), their
logo, and **the finished guide PDF uploaded somewhere linkable** (their site or Drive share link — it's what
the thank-you page's download button points at). That's it — then hand off.

## Phase 4 — Compliance pass (house rules #5)
Run the full page through `~/realtor-brain/identity/compliance.md`: brokerage disclaimer + license # as a
footer line where the rule applies, strip guarantees and Fair-Housing proxies, keep every claim honest and
backed. Flag once if `compliance.md` is empty.

## Phase 5 — Deliver + save (paired with the magnet)
1. **Deliver in chat** — all the sections of copy, cleanly laid out and ready to use.
2. **Save to Drive** following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: into the **same campaign
   folder** as the magnet, save `Lead Capture Funnel — [Guide Name]` (rendered to a styled `.docx` via the
   shared renderer). Confirm the location in plain words.
3. **Close the loop:** *"That's your funnel copy — every section, ready to go. Next, your design step turns it
   into the built page; then host it wherever you like. After someone opts in, the follow-up's all yours."*
4. **Point traffic at it (one line, no new work):** once the page is live, the two free places to put the
   link — their **Google Business Profile** (the website/link field + one Google post announcing the free
   guide; GBP feeds Google Maps and the "best realtor in [city]" searches) and their **video descriptions +
   social bios** (the YouTube and Short-Form systems drive the traffic; this page catches it).

---

## Quality checklist
- [ ] Read the actual magnet first; **page promise = magnet promise = what's delivered** (house rules #7)
- [ ] **Strategy applied first** (one big idea · desire + fear · the 3 objections dissolved · the emotional arc)
- [ ] All sections present, in order (Hero · Problem · The Guide · About · Why-Work-With · Local Market · Proof · [Socials] · Opt-in)
- [ ] Hero headline clear, benefit-led, specific, no hype; **ONE primary CTA repeats ~3× (hero · mid-page · opt-in)**
- [ ] PROBLEM names + agitates the avatar's real fear (from avatars.md) before any pitch
- [ ] THE GUIDE value-stacks the pages (concrete outcomes) + **notes the mockup sits left/right**
- [ ] ABOUT = WHO they are · WHY-WORK-WITH = the OFFER + USP — two distinct sections (from offer.md); no guarantees
- [ ] Welcome-video slot noted + 3-beat script outline written (ONLY if they have/want one; else omitted cleanly)
- [ ] Mini-FAQ (3 one-liners) sits in the opt-in section, in the agent's voice
- [ ] LOCAL MARKET pulls real communities from market.md (authority, not a pitch)
- [ ] PROOF is a dedicated block from proof.md — real only, nothing invented
- [ ] SOCIALS section included ONLY if the agent has channels (else omitted cleanly); opt-in stays the one primary CTA
- [ ] Opt-in flow = button → pop-up (name, email, phone) → thank-you page with the instant-download link;
      reassurance present; **no call booking** (house rules #4)
- [ ] PROOF photo strip specified (8–12 real photos, auto-scrolling) — or skipped honestly if photos are thin
- [ ] Voice matches `voice.md` + `voice-samples.md`; local and specific (why-not-ChatGPT)
- [ ] No design prompt written (design is a separate skill); assets-to-gather noted instead
- [ ] Compliance pass done
- [ ] Saved into the same campaign folder as the magnet; location confirmed in plain words
