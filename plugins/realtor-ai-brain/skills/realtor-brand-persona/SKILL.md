---
name: realtor-brand-persona
description: >
  Realtor Brand Persona Skill — guides the real estate agent through a friendly 15-minute
  interview-style conversation to capture who they are, who they serve, and what makes them
  different. Then writes it straight into the agent's Realtor AI Brain (~/realtor-brain/identity/)
  so every other skill automatically knows their brand, their market, their target avatars,
  and their voice. This is Phase 1 of Brain setup — it powers everything else.

  Trigger on: "build my brand persona", "set up my knowledge file", "create my agent profile",
  "build my target market profile", "who is my target market",
  "brand persona skill", "set up my profile", "agent knowledge base", "build my Claude profile",
  or any request where the agent wants to define who they are, who they serve, or set up the
  foundation of their Realtor AI Brain.
---

# Realtor Brand Persona Skill

A guided interview that captures everything Claude needs to know about a real estate agent —
who they are, who they serve, where they work, and how they sound. It writes the result straight
into the agent's Realtor AI Brain at `~/realtor-brain/identity/`, so every other skill runs with
full context automatically.

This is a one-time setup. Do it once, and every skill they run after that already knows them.

---

## How This Skill Works

This skill is different from every other skill in the system. It does not search the web.
It does not generate content. It asks questions, listens carefully, and builds a document
from the agent's answers.

The conversation should feel like a smart colleague asking good questions — not a form,
not an interrogation, not a corporate intake process. Warm, conversational, encouraging.
When an agent gives a vague answer, ask a follow-up. When they give a rich answer, capture
it fully. The quality of the output is directly proportional to the quality of what the
agent shares.

**Total conversation target:** 15 minutes. Not longer.
**Output:** The four identity files (`profile`, `market`, `avatars`, `voice`) written into
`~/realtor-brain/identity/` — plus an optional polished `.docx` keepsake in `~/realtor-brain/exports/`.

---

## Before You Start

Read `references/interview-guide.md` — this contains the full question bank, follow-up
prompts, and guidance on how to handle common agent responses.

---

## Phase 1: Set Expectations

Before asking anything, explain what's about to happen in plain terms:

```
Before we dive into all the other skills, I need to get to know you — who you are,
who you work with, and what makes you different as an agent.

I'm going to ask you some questions. Some will feel obvious. Some might make you
think. Just answer as honestly and specifically as you can — the more specific you
are, the better every piece of content and every skill will perform for you.

This takes about 15 minutes. Ready? Let's start.
```

---

## Phase 2: The Interview

Ask questions in the order below. Ask ONE question at a time — never stack multiple
questions in one message. Wait for the answer before moving to the next question.

If an answer is vague or generic, use a follow-up prompt from `references/interview-guide.md`
to draw out more specificity. The goal is always to get to the real, specific answer —
not the polished marketing version.

**Read:** `references/interview-guide.md` for the full question set, follow-up prompts,
and guidance on handling each section.

### BLOCK 1 — The Basics (2-3 minutes)
Questions 1-5: Name, city, years in the business, brokerage, primary property types.
These are fast and easy — warm the agent up before going deeper.

### BLOCK 2 — Their Market (3-4 minutes)
Questions 6-12: The specific cities, communities, neighbourhoods, and price ranges they
work in. Their niche if they have one. Any secondary markets.
This is critical — get very specific on geography and price range.

### BLOCK 3 — Their Target Avatars (5-6 minutes)
Questions 13-24: Who are their best clients? What's driving people to buy or sell?
Why are people moving to or from their city? What are buyers and sellers worried about?

This is the most important block. Take the time needed here.

If the agent serves multiple distinct audiences (e.g., new construction buyers AND
luxury sellers, or two separate geographic markets), capture each one separately.
Ask: "Is there a second type of client you work with regularly that looks completely
different from what you just described?" If yes, run through the avatar questions again
for that second group.

### BLOCK 4 — Their Brand & Voice (3-4 minutes)
Questions 25-32: How they describe themselves, what makes them different, how they
sound on camera, what they never want to sound like, any signature phrases.
Keep this accessible — no marketing jargon. Ask it like a conversation.

### BLOCK 5 — Their Content (1-2 minutes)
Questions 33-36: What topics they want to create content around, what they're
comfortable talking about on camera, any topics they want to avoid.

---

## Phase 3: Clarification Pass

After completing all blocks, do a quick internal review of the answers collected.

If any of the following are missing or vague, ask one targeted follow-up before building
the document:

- **City/market is not specific** — "You mentioned [city] — are there specific neighbourhoods
  or communities within that city that you focus on, or is it the whole city?"

- **Target avatar is still generic** — "When you picture your absolute best client — the
  person you loved working with most — what was their specific situation? Were they a first-time
  buyer? A family upsizing? Someone relocating from out of town?"

- **No clear differentiation** — "What's something you do or know that other agents in
  [city] don't? It doesn't have to be a big thing — even a specific area of knowledge or
  a type of client you're especially good with counts."

- **Multiple markets not fully captured** — "You mentioned [market 1] and [market 2] —
  do those attract different types of buyers and sellers, or is your client profile pretty
  similar across both?"

Do not ask more than 2-3 follow-up questions. If something is still unclear after one
follow-up, use the best available answer and note it as something the agent can update
later.

---

## Phase 4: Write to the Brain

You are writing the **foundation** of the agent's Realtor AI Brain. Everything captured now goes into
`~/realtor-brain/identity/` as markdown — the source of truth every other skill reads.

**First, make sure the Brain exists.** If `~/realtor-brain/` is missing, create the folder structure
(`identity/`, `memory/`, `assets/`, `exports/`). If the agent reached this skill through **Brain
Setup**, the structure already exists — just write into it.

**Read** `references/knowledge-file-template.md` for the full content structure, then map it to the
four identity files. Write in **third person** ("Sarah is a real estate agent in Calgary…") — these
are reference documents for Claude, not for the agent to read about themselves.

| Interview content | Write to |
|---|---|
| Agent profile — name, city, **title/designations**, brokerage, years, focus, property types, booking link, socials | `~/realtor-brain/identity/profile.md` |
| Market — communities, price ranges, niche, secondary market + local intelligence | `~/realtor-brain/identity/market.md` |
| Target avatars — each one captured separately | `~/realtor-brain/identity/avatars.md` |
| Voice — tone, never-sounds-like, signature phrases, CTA + content topics | `~/realtor-brain/identity/voice.md` |

Each file must be specific and complete enough that any other skill — market update, YouTube launch,
trending articles — runs with zero additional intake beyond what's video- or campaign-specific.

**Optional keepsake:** render a polished combined `.docx` to `~/realtor-brain/exports/` (using the
docx skill) so the agent has a human-readable copy. The `.docx` is a *render* — the markdown in
`identity/` is the source of truth skills actually read.

---

## Phase 5: Push to Drive + Confirm

> **Push to Drive first** — run `realtor-brain-sync` (PUSH) so the files you just wrote survive the
> session. The local copy is wiped when the session ends; an unsynced write is a lost write. (If this
> ran inside full Brain Setup, Setup's finalize step also pushes — pushing here too is safe.)

After writing the files, confirm simply — there is no "upload to a Project" step anymore:

```
Done — I've written the foundation of your Brain:
• identity/profile.md — who you are
• identity/market.md — your market and communities
• identity/avatars.md — who you serve
• identity/voice.md — how you sound

Every skill you run from now on already knows all of this. To change anything later,
just say "update my brand" and I'll edit these files directly.
```

If this skill was run as **Phase 1 of full Brain Setup**, hand control back to Setup to continue with
the offer. Otherwise, point them to the natural next step: *"Want to lock in your offer next? Just say
'build my offer.'"*

---

## Quality Checklist

### Interview
- [ ] All 5 blocks completed
- [ ] No two questions asked in the same message
- [ ] Vague answers followed up with clarifying questions
- [ ] Multiple target avatars captured separately if applicable

### Brain Files (identity/)
- [ ] All four files written to `~/realtor-brain/identity/` — profile, market, avatars, voice
- [ ] Written in third person (for Claude to read, not the agent)
- [ ] Agent's full name, city, and primary market in the first paragraph
- [ ] Every community/neighbourhood they mentioned is listed
- [ ] Every price range they work in is listed
- [ ] At least one target avatar fully built out
- [ ] If multiple avatars exist — each one captured separately with its own pain points and motivations
- [ ] Agent's tone described with specific words and "sounds like / never sounds like" examples
- [ ] At least one differentiator captured
- [ ] Content topics listed
- [ ] CTA preference noted
- [ ] Complete enough that no other skill needs to ask "what city are you in?" or "who is your target client?"
