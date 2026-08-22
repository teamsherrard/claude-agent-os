---
name: leadcapture-magnet
description: >
  Step 1 of the Lead Capture System — writes the agent's lead magnet straight from the offer in their AI
  Brain. The FIRST one is always the relocation guide ("Moving to [City]? Start Here" — locked, never a
  menu), built from the 5-question intake; from campaign two the shape opens up (a brand-led guide for
  their whole audience, or a focused buyer/seller guide). Produces the full, genuinely useful guide content
  as clean copyable text, in the agent's voice. Saves it as a clean, formatted doc (styled .docx) in the
  campaign folder, logs it in the Brain so the other systems can point at it, then hands off to the funnel
  that gives it away. CONTENT ONLY — it writes the guide's content (the design is a separate skill); it
  NEVER designs the PDF.

  Trigger on: "build my lead magnet", "create a lead magnet", "lead magnet for my offer", "make my buyer
  guide", "make my seller guide", "make my brand guide", "I need a free guide to give away", or any request
  to create the downloadable freebie an opt-in gives away. ("Set up my lead capture", "make my relocation
  guide", and other system-level or first-time requests go through leadcapture-navigator — the front door —
  which checks the offer, locks the first campaign, and runs the intake first. "Make a lead magnet for this
  video" inside a video's chat belongs to the YouTube System's youtube-leads, not here.)
---

# Lead Magnet Builder (Step 1 — spec only)

The free guide an opt-in gives away. Built **from the agent's offer** so it naturally leads toward working
with them — and so the funnel (Step 2) has something specific and real to sell.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

> **We write the content; we never design (house rules #3).** This produces the guide's *words* — the design
> (the built PDF) is a **separate skill**. Pour the effort here into making the guide genuinely valuable.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first. **If `~/realtor-brain/` is missing, pull it first — never assume no
Brain** (house rules #2: realtor-brain-sync PULL; only a truly empty cloud goes to Setup). Then:
- `identity/offer.md` — **the anchor.** The magnet is built from the offer + the problem it solves. Apply
  **house rules #2's three states** (missing / placeholder → the warm detour and stop; thin → recommend
  sharpening after, default to building; filled → go) — unless the navigator already checked it this session.
- `identity/avatars.md` — who it's for and their single biggest fear/desire. (For the relocation guide the
  reader is a relocator from the intake's places and is usually NOT in here — use it only if an avatar is one.)
- `identity/proof.md` — real wins/testimonials/numbers to weave in (credibility, never invented).
- `identity/voice.md` + `identity/voice-samples.md` — write it in their real voice.
- `identity/market.md` — city, communities, price bands, local specifics, and the `## Relocation intake`
  block if the intake already ran (never re-ask what's in it).
- `memory/market-data.md` — the newest dated block, if one exists: benchmark price, days on market, months of
  supply. Quote these (with the named source + month) where the guide needs numbers — never re-research what's
  there, never estimate. Empty file → use `market.md`'s price bands and write the rest qualitatively.
- `identity/story-bank.md` (if present) — real client stories; a relocation story here feeds the "what good
  looks like" page.
- `identity/profile.md` + `identity/operations.md` — name, niche, credentials, social handles, and the
  website/email from their signature for "where to find me." **Never their booking link** (house rules #4).
- `identity/compliance.md` — the disclaimer/claims rules (house rules #5 — three states).
- `identity/strategy.md` + `identity/business-plan.md` — the strategy chapters of their **AI Brain Book**
  (their goals, what they want to be known for, and the 90-day plan this magnet feeds). The magnet should
  serve the plan: same niche, same audience the plan says they're chasing.
- `memory/ideas.md` (tag `leadmagnet`) — lead-magnet ideas the agent captured on the go. **These never change
  what campaign one IS** (house rules #11): fold any relocation-relevant idea into the guide's content, and
  hold the rest as candidates for campaign two. Mark an idea Used only when it's actually built in, then push
  (the write-back law).

**Read the Brain; never re-ask what it knows (house rules #2).**

## Step 2 — Read the references
- `references/magnet-guide.md` — the relocation structure, the second-campaign shapes, what makes a guide
  worth opting in for.
- `${CLAUDE_PLUGIN_ROOT}/shared/copywriting-kb.md` — how to write it so it's genuinely good, not AI filler.

---

## Phase 1 — Lock the magnet's focus (the first one is NOT a choice)

**First: do you have the intake answers in hand?** If `leadcapture-navigator` routed here with the
relocation guide locked and the 5 intake answers, **skip this phase entirely** — the focus is set, the
promise is *"Moving to [City]? Start Here"*-shaped, and the intake bundle joins the Brain as your source
material. Go straight to Phase 2.

**Otherwise, look at the workspace first** (the campaign folders per the output standard §1) and take the
first branch that matches:

- **A campaign with the Lead Magnet doc but no funnel doc** (they stopped halfway — same check as the
  navigator's Step 2)? Don't start another guide and don't re-lock the relocation guide over the one that
  already exists. One warm line — *"You've already got your [Guide Name] — let's finish the page that gives
  it away first. Your next guide comes right after."* — and hand to `leadcapture-funnel` (say which doc).
- **No campaign yet — this is their FIRST magnet** (entered directly, or pointed here without the intake)?
  **Apply house rules #11: the first magnet is the RELOCATION GUIDE. Locked, not a menu.** Check the offer
  (Step 1's three states), state the plan with the reason in one confident line — relocation is the #1
  highest-intent search traffic in every market, and it works every time — and run the relocation intake
  exactly as the front door does (`${CLAUDE_PLUGIN_ROOT}/skills/leadcapture-navigator/references/intake-questions.md`:
  saved-intake check first, then 5 questions, one at a time, each pre-answered from the Brain, write back
  what's new). If they push back, hold the line once, warmly; respect a second no and fall through to the
  open choice below.
- **Another system handed you a magnet concept** (e.g. the monthly market report from the Market System) and
  no finished campaign exists? Say in one plain line — no skill names (house rules #1) — that the first guide
  is always the Moving-to-[City] guide and their report becomes the second campaign right after; then run the
  branch above. If a finished campaign DOES exist, build the handed concept as campaign two.

**Second campaign onward** (a finished campaign already exists), the choice opens up — two shapes;
**recommend one and let the agent choose** (house rules #9):

- **A. Brand-led (general).** ONE comprehensive, on-brand guide that speaks to the agent's **whole audience
  and full offer suite** (buyers, sellers, relocations) — built around their **personal brand**, not a single
  reader. E.g. *"The Complete [City] Buying & Selling Playbook."* It still needs **ONE clear brand-level
  promise** (so the funnel has a headline). Comprehensive — never vague filler.
- **B. Audience-specific (niche).** A focused buyer, seller, or niche guide (first-time buyer, new-build
  buyer, downsizer seller, moving-from-[Place]) matched to their strongest reader + offer. Converts hardest
  for that one person. A "niche" is always a kind of move — never a protected class (house rules #5).

**Advise (house rules #9):** read the Brain and recommend — brand/offer spans buyers AND sellers → **A**;
one dominant niche in `avatars.md`/`offer.md` → **B**. Lead with the ONE you'd pick + one line of why, and
offer the other. **Say it in plain words — never the labels.** The agent never hears "brand-led",
"audience-specific", "shape A/B" or "niche"; they hear what the guide is *for*: *"Next I'd do a complete
[City] buying-and-selling playbook — it covers everyone you work with. Or we could go narrower with a
first-time buyer guide. I'd start with the playbook — want me to?"* Whatever the shape, lock the **single
core promise** — it becomes the funnel headline. Confirm in one friendly line. *(Whatever they pick, the
funnel in Step 2 matches that same scope.)*

## Phase 2 — Build the guide content
Following `references/magnet-guide.md` + the copywriting KB, produce as clean copyable text, in the output
standard's three bands:
- **The promise** — what the guide delivers + who it's for, in a line or two. Specific and benefit-led.
- **The guide, page by page (5–9 body pages; the relocation structure is 7)** — the **actual, genuinely
  useful content**, not a tease. Real, local, specific (real communities, sourced numbers, the real steps).
  Each page: a clear title + skimmable value. This has to be worth handing over an email for (house rules #8).
  Numbers only where sourced — otherwise say it qualitatively (house rules #5).
- **How the agent helps next** — a soft, no-pressure close in their voice: where they are now, how the
  agent makes the next step easy, and where to reach them (socials, website/email — **never the booking
  link, no call booking**, house rules #4). Only services that are actually in `offer.md`.
- Weave in the relevant offer (the **full offer suite** for a brand-led guide, or the matching offer for a
  specific one) + one real proof point naturally near the end — never a hard sell.

## Phase 3 — Note the assets (design is a SEPARATE skill)
This skill ends at the **guide content** — that's the whole deliverable. **Do NOT write a design prompt;** a
separate design skill turns it into the branded PDF — **the Lead Magnet Designer skill in the agent's Claude
Design Brand HQ reads this exact doc (uploaded, or via their Drive connector) and designs one page per
`── PAGE N - TITLE ──` block, copy verbatim.** Just close the doc with its short, plain **"assets to
gather"** line (the `▸ NEXT — hand to your design step` appendix from the output standard): their logo,
headshot, and any photos they want in the guide. The hand-off to the funnel happens in Phase 5, after the
compliance pass and the save.

## Phase 4 — Compliance pass (house rules #5)
Run the whole guide through **house rules #5**: the claims checks always (no guarantees, no Fair-Housing
proxies, real and sourced only — the place, never the people); then the disclaimer + licence lines **only
if `compliance.md` is filled** — missing, empty, or `[bracketed]` placeholder → no disclaimer, no
`▸ COMPLIANCE` block, one plain nudge. Never paste a bracket token into the doc.

## Phase 5 — Deliver, save, log, hand off
1. **Deliver in chat** — the full guide content, cleanly laid out and ready to use.
2. **Save to the workspace** following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: the campaign
   folder `03 · Content/Guides/[YYYY-MM-DD · Guide Name]/`, the doc `Lead Magnet — [Guide Name]` (rendered
   to a styled `.docx` via the shared renderer). Confirm the location in plain words. If the save fails, the
   output standard's fallback applies — the chat copy is the deliverable; say so and keep going.
3. **Log it in the Brain (silently — never narrate this or name a file, house rules #1).** In
   `~/realtor-brain/identity/offer.md → ## Lead magnets`, REPLACE any "none yet" / `[bracketed]` placeholder
   bullet with a real row: `- **[Guide Name]** — for [people relocating to [City] / first-time buyers / …] ·
   keyword: "[GUIDE]" · CTA: "Grab Your Free Guide" · built [YYYY-MM-DD]` — this is how the YouTube and
   Short-Form systems learn the guide exists and point their CTAs at it. Add one line to
   `memory/content-log.md` (`[date] · Lead magnet · [Guide Name] · [campaign folder]`). Mark any `leadmagnet`
   idea you built in as Used. Then **realtor-brain-sync PUSH** (write → push → verify).
4. **Hand off to Step 2:** *"That's your free guide done. Want me to write the page that gives it away?
   It'll sell this exact guide."* (runs `leadcapture-funnel`, pointing it at this magnet doc).

---

## Quality checklist
- [ ] Brain pulled + read; offer checked (three states); nothing re-asked
- [ ] First campaign = the relocation guide, locked (house rules #11; metro title if small market) — intake answers woven in; choice only from campaign 2, said in plain words
- [ ] One clear core promise — ready to become the funnel's headline
- [ ] 5–9 body pages (relocation = 7) of REAL, local, specific value — worth an email, not a tease (house rules #8)
- [ ] Every number sourced (market.md / market-data.md / a noted check) or written qualitatively; the place, never the people
- [ ] Offer (only what's in offer.md) + one real proof woven in near the end; soft close, **no call booking, no booking link**
- [ ] Voice matches `voice.md` + `voice-samples.md`
- [ ] No design prompt written (design is a separate skill); assets-to-gather noted instead
- [ ] Compliance pass done per house rules #5 (claims always; disclaimer only if filled; no bracket tokens)
- [ ] Saved to the campaign folder (output standard) or the fallback said plainly; location confirmed
- [ ] Logged in the Brain (offer.md Lead magnets row + content-log) and pushed
- [ ] Handed off to the funnel
