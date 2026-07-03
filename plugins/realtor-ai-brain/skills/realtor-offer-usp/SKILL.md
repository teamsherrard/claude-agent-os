---
name: realtor-offer-usp
description: >
  Realtor Offer USP Skill — guides the real estate agent through a focused 10-minute
  conversation to capture their full service offering and unique value proposition. Reads
  the agent's Realtor AI Brain so nothing is repeated. Only asks what it doesn't already
  know — specifically what the agent offers, what makes them different, and why someone
  should hire them over every other agent in their market. Produces two outputs: a polished
  public-facing Google Doc guidebook the agent uses as a lead magnet or sends to prospects, and
  the structured offer written into their Brain (identity/offer.md) to power every other skill.

  Trigger on: "build my offer", "create my USP", "build my offer guide", "why work with me
  document", "create my value proposition", "offer guidebook", "build my USP file",
  "create my offer knowledge file", "what's my offer", "build my agent offer", or any
  request where the agent wants to document what they offer and why someone should hire them.
---

# Realtor Offer USP Skill

A focused interview that captures the agent's full service offering and unique value proposition.
Reads their existing Brain so nothing is repeated. Asks 5-6 broad questions.
Takes under 10 minutes. Produces two documents — one for prospects, one for Claude.

---

## Before You Start

*Follow `${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md` — if the agent is unsure, propose a strong
offer/USP draft from their Brain and let them react; honour "skip" / "use defaults". Defaults stay
full-quality and specific, never thin.*

*This skill owns the **Edge** pillar of the A.G.E.N.T. Brand OS (`${CLAUDE_PLUGIN_ROOT}/shared/brand-doctrine.md`) —
the USP is literally "what makes your perspective different." Hold the bar there: reject generic answers
("great service," "I work hard") and push to a real, specific, provable edge tied to their niche.*

### Step 1 — Load the Brain

Before asking anything, **read `~/realtor-brain/brain.md`** and the identity files Phase 1 (Brand
Persona) already wrote:

- `~/realtor-brain/identity/profile.md` — agent name, city, title, brokerage
- `~/realtor-brain/identity/market.md` — market geography, price ranges, niche
- `~/realtor-brain/identity/avatars.md` — target avatars and what they care about
- `~/realtor-brain/identity/voice.md` — brand voice, differentiator hints, primary CTA

**Do not ask about anything already in the Brain.** This skill only adds what's not yet documented —
their offer and USP.

If the Brain doesn't exist yet (the agent jumped straight to the offer), note it and still proceed —
the offer questions work standalone — then create `~/realtor-brain/identity/` so there's somewhere to
write the result. Ideally suggest they run **Brain Setup** (or the Brand Persona skill) first.

### Step 2 — Read Reference Files

1. `references/interview-guide.md` — the 6 questions, follow-up prompts, handling guidance
2. `references/guidebook-template.md` — structure of the public-facing Google Doc guidebook
3. `references/usp-knowledge-template.md` — structure for the offer written to `identity/offer.md`

---

## Phase 1: Set Expectations

Open with a brief, clear explanation:

```
You've already told me who you are and who you serve. Now I want to understand
what you actually offer — what someone gets when they hire you, and why they
should choose you over every other agent in [city].

I have [X] questions. This takes less than 10 minutes.
Let's go.
```

If no brand persona file exists, adjust:
```
I'm going to ask you a few focused questions about your offer and what makes
you different as an agent. This takes under 10 minutes.
Let's go.
```

---

## Phase 2: The Interview

**Read:** `references/interview-guide.md`

Ask all 6 questions in order, plus the quick lead-magnet question (Q7). One question at a time — never stack them.
Use follow-up prompts from the interview guide when answers are vague or surface-level.
The goal is specificity. Generic answers produce a generic guidebook. Push for the real details.

---

## Phase 3: Clarification Pass

After all 6 questions, do a quick internal check before building anything.

If any of the following are missing, ask one targeted follow-up:

**No concrete offer specifics** — "You mentioned you provide great support — can you
give me one or two specific, tangible things you do for clients that most agents don't?
Even something small counts."

**No differentiator that's actually different** — "When you say [what they said], is that
something other top agents in [city] also offer, or is that genuinely unique to you?"

**No proof or results** — "Do you have any numbers you can share — homes sold, years of
experience, average days on market for your listings, client satisfaction — anything
that backs up what you just described?"

**Offer is vague for one avatar but specific for another** — "You described your offer
really well for [avatar 1] — what does that look like specifically for [avatar 2]?"

Maximum 2 follow-up questions. Move forward with what's available.

---

## Phase 4: Write the Offer to the Brain + Build the Guidebook

Build both outputs from the interview answers combined with everything already in the Brain.

### Output 1 — Write `identity/offer.md` (the source of truth)
**Read:** `references/usp-knowledge-template.md` for the structure.

Write the structured offer into `~/realtor-brain/identity/offer.md` — third person, detailed and
specific: core offer, buyer/seller offers, **lead magnets** (with their DM keywords), guarantees,
signature process, USP, and proof. **This is what every other skill reads** — the lead magnets are what
content CTAs point to. If `~/realtor-brain/identity/` doesn't exist yet, create it.

### Output 2 — Public-Facing Guidebook (a clean Google Doc)
**Read:** `references/guidebook-template.md` for the content, and
`${CLAUDE_PLUGIN_ROOT}/shared/doc-formatting.md` for how to save it.

Build the guidebook as well-structured plain text and create it as a clean Google Doc in the agent's
Drive **`Realtor AI Brain` → `exports`**, named `Why Work With Me · [Agent Name]`. Do NOT render a
`.docx` — it won't convert in Cowork and lands as a broken file. This is a *render* for humans; the
source of truth is `offer.md`. The clean Doc is ready to send as-is; for a fully branded, visually
designed PDF, tell the agent to drop this copy into their design tool (claude.ai design).

---

## Phase 5: Push to Drive, Confirm and Deliver

> **Push to Drive first** — run `realtor-brain-sync` (PUSH) so `identity/offer.md` survives the
> session. The local copy is wiped when the session ends; an unsynced write is a lost write.

After writing the offer and rendering the guide:

```
Done — two things:

1. Your offer is now in your Brain (identity/offer.md). Every skill — listing content,
   lead magnets, AI Admin emails — now knows exactly what you offer and why clients hire you.

2. Your "Why Work With Me" guide is saved to exports/ — send it to prospects, use it as a
   lead magnet, or share it at consultations.

To change your offer later, just say "update my offer" and I'll edit it directly.
```

If this skill was run as **Phase 2 of full Brain Setup**, hand control back to Setup to continue.

---

## Quality Checklist

### Interview
- [ ] Brain (identity/) read before any questions were asked
- [ ] No questions repeated from what's already in the Brain
- [ ] All 6 questions answered
- [ ] At least one concrete, specific offer detail captured
- [ ] At least one genuine differentiator captured (not just "great service")

### Guidebook
- [ ] Reads like something a prospect would actually want to read
- [ ] Written in the agent's voice from `identity/voice.md`
- [ ] Every offer item is specific — not vague ("I handle all negotiations"
      not "I provide full-service support")
- [ ] Speaks directly to the agent's target avatars from `identity/avatars.md`
- [ ] CTA on the final page
- [ ] Agent name and city on every page

### Offer File (identity/offer.md)
- [ ] Written in third person
- [ ] Every offer item captured with specifics
- [ ] Differentiators documented with evidence where available
- [ ] Works alongside the brand persona file — no overlap, all additive
- [ ] Complete enough that any skill reading it knows exactly what this agent offers
