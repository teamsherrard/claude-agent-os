---
name: leadcapture-magnet
description: >
  Step 1 of the Lead Capture System — builds the agent's lead magnet (a brand-led guide for their whole
  audience of buyers AND sellers, or a focused buyer/seller guide) straight from the offer in their AI Brain. Produces the full, genuinely useful guide content as clean copyable text, in
  the agent's voice. Saves it as a Google Doc in the campaign folder, then hands off to the funnel that gives
  it away. CONTENT ONLY — it writes the guide's content (the design is a separate skill); it NEVER designs the PDF.

  Trigger on: "build my lead magnet", "create a lead magnet", "lead magnet for my offer", "make my buyer
  guide", "make my seller guide", "make my brand guide", "set up my lead capture", "build my lead capture system", "I need a free
  guide to give away", or any request to create the downloadable freebie an opt-in gives away.
---

# Lead Magnet Builder (Step 1 — spec only)

The free guide an opt-in gives away. Built **from the agent's offer** so it naturally leads toward working
with them — and so the funnel (Step 2) has something specific and real to sell.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).

> **We write the content; we never design (house rules #3).** This produces the guide's *words* — the design
> (the built PDF) is a **separate skill**. Pour the effort here into making the guide genuinely valuable.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/offer.md` — **the anchor.** The magnet is built from the offer + the problem it solves.
- `identity/avatars.md` — who it's for and their single biggest fear/desire (the magnet answers it).
- `identity/proof.md` — real wins/testimonials/numbers to weave in (credibility, never invented).
- `identity/voice.md` + `identity/voice-samples.md` — write it in their real voice.
- `identity/market.md` — city, communities, price bands, local specifics (the magnet is full of these).
- `identity/profile.md` — name, niche, credentials, where to reach them.
- `identity/compliance.md` — the disclaimer/claims rules (house rules #5).
- `memory/ideas.md` (tag `leadmagnet`) — any lead-magnet ideas the agent captured on the go; build from these first, and mark each Used.

**Read the Brain; never re-ask what it knows (house rules #2).** If `identity/offer.md` is thin or empty,
stop and tell the agent kindly that the magnet is only as strong as the offer behind it, and point them to
**"build my offer"** first. If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup**.

## Step 2 — Read the references
- `references/magnet-guide.md` — magnet types, what makes one worth opting in for, the guide structure.
- `${CLAUDE_PLUGIN_ROOT}/shared/copywriting-kb.md` — how to write it so it's genuinely good, not AI filler.

---

## Phase 1 — Pick the magnet's focus (the shape that fits their brand)
A magnet can take one of two shapes. **Present both and let the agent choose** — they fit different brands:

- **A. Brand-led (general) — the default for most agents.** ONE comprehensive, on-brand guide that speaks to
  the agent's **whole audience and full offer suite** (buyers, sellers, relocations) and gives any prospect
  real value — built around their **personal brand**, not a single avatar. E.g. *"The Complete [City] Buying
  & Selling Playbook," "[Agent]'s [City] Market Insider Guide," "Thinking of Buying or Selling in [City]?
  Start Here."* It still needs **ONE clear brand-level promise** (so the funnel has a headline) — e.g. *"everything
  you need to make your next move in [City] with confidence."* General must stay genuinely valuable and
  **comprehensive — never vague filler.**
- **B. Audience-specific (niche) — when the agent has one dominant focus.** A focused buyer, seller, or niche
  guide (first-time buyer, new-build buyer, downsizer seller) matched to their strongest avatar + offer.
  Converts hardest for that one person; best when the agent genuinely leans into one niche.

**Advise (house rules #9):** read the Brain and recommend. If their brand/offer spans buyers AND sellers, or
they're generalist / brand-led → recommend **A**. If `avatars.md`/`offer.md` show one dominant niche →
recommend **B**. Lead with the ONE you'd pick + one line of why, and offer the other. If the agent named a
focus, use it. Lock the **single core promise** (brand-level or audience-level) — it becomes the funnel
headline. Confirm in one friendly line. *(Whatever they pick, the funnel in Step 2 matches that same scope.)*

## Phase 2 — Build the guide content
Following `references/magnet-guide.md` + the copywriting KB, produce as clean copyable text:
- **The promise** — what the guide delivers + who it's for, in a line or two. Specific and benefit-led.
- **The guide, page by page (5–9 pages)** — the **actual, genuinely useful content**, not a tease. Real,
  local, specific (real communities, real numbers, the real steps). Each page: a clear title + skimmable
  value. This has to be worth handing over an email for — deliver real value (house rules #8).
- **How the agent helps next** — a soft, no-pressure close in their voice: where they are now, how the
  agent makes the next step easy, and where to reach them. **No call booking** (house rules #4) — just a
  warm "here's where to find me."
- Weave in the relevant offer (the **full offer suite** for a brand-led guide, or the matching offer for a
  specific one) + one real proof point naturally near the end — never a hard sell.

## Phase 3 — Note the assets, then hand off (design is a SEPARATE skill)
This skill ends at the **guide content** — that's the whole deliverable. **Do NOT write a design prompt;** a
separate design skill turns it into the branded PDF. Just close with a short, plain **"assets to gather"**
line: their logo, headshot, and any photos they want in the guide. Then hand off.

## Phase 4 — Compliance pass (house rules #5)
Run the whole guide through `~/realtor-brain/identity/compliance.md`: disclaimer + license # where the rule
applies, strip any guarantees or Fair-Housing proxies, keep claims honest. Flag once if `compliance.md` is empty.

## Phase 5 — Deliver, save, hand off
1. **Deliver in chat** — the full guide content, cleanly laid out and ready to use.
2. **Save to Drive** following `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`: create
   `[Agent Name] — Lead Capture System/[YYYY-MM-DD · Guide Name]/` and save `Lead Magnet — [Guide Name]`
   (rendered to a styled `.docx` via the shared renderer). Confirm the location in plain words.
3. **Hand off to Step 2:** *"That's your free guide done. Want me to map the page that gives it away — the
   opt-in funnel? It'll sell this exact guide."* (runs `leadcapture-funnel`).

---

## Quality checklist
- [ ] Brain read; offer used as the anchor; nothing re-asked
- [ ] One clear core promise — brand-led (whole audience) OR audience-specific — ready to become the funnel's headline
- [ ] 5–9 pages of REAL, local, specific value — worth an email, not a tease (house rules #8)
- [ ] Offer + one real proof woven in near the end; soft close, **no call booking**
- [ ] Voice matches `voice.md` + `voice-samples.md`
- [ ] No design prompt written (design is a separate skill); assets-to-gather noted instead
- [ ] Compliance pass done
- [ ] Saved to the campaign folder (output standard); location confirmed in plain words
- [ ] Handed off to the funnel
