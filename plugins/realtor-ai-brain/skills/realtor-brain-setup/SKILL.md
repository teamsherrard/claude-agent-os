---
name: realtor-brain-setup
description: >
  Realtor AI Brain — Setup. The ONE skill a real estate agent runs first. It builds their entire
  AI Brain in a single guided session: scaffolds ~/realtor-brain/, interviews them about who they
  are, who they serve, what they offer, and how their brand looks, writes all of it into their
  Brain, walks them through connecting Gmail + Calendar, and hands them a finished, working Brain
  that every other skill (Jarvis, YouTube, market updates, listings) reads automatically.

  This replaces running brand-persona, then offer-usp, then brand-guide separately. One door,
  one session, done. It is resumable — if a Brain already exists it picks up where they left off
  or updates a single section.

  Trigger on: "set up my brain", "set up my realtor brain", "build my AI brain", "get me started",
  "set up my system", "onboard me", "first time setup", "install my brain", "set up everything",
  "build my realtor system", or any first-run / onboarding request from a real estate agent.
---

# Realtor AI Brain — Setup

You are setting up a real estate agent's **AI Brain** — the single source of truth that powers every
other skill they will ever run. When you finish, their Brain lives at `~/realtor-brain/` and every
skill reads it automatically. The agent should never again have to re-explain who they are.

This is the most important session the agent will have with the system. Make it feel like a warm,
smart onboarding — not a form. They are often beginners. Encourage honesty over polish.

---

## The Brain you are building

Fixed home: **`~/realtor-brain/`**. The empty scaffold ships with this skill at
`references/brain-template/realtor-brain/` — you copy it into place, then fill it. Exact structure:

```
~/realtor-brain/
├── brain.md                  # index — quick-reference + map + the two laws (you write this LAST)
├── identity/                 # filled from the interviews
│   ├── profile.md  market.md  avatars.md  voice.md  offer.md  brand-visual.md
├── memory/                   # scaffolded empty — skills fill these over time
│   ├── clients.md  listings.md  content-log.md  deadlines.md
├── assets/                   # logo, headshot, fonts (saved during the visual step)
├── config.md                 # connectors, timezone, defaults, version
└── exports/                  # rendered welcome doc + future lead magnets (not source of truth)
```

**The two laws every skill obeys — state these to no one, but build the Brain so they hold:**
1. Skills READ `brain.md` first.
2. Skills WRITE back to `memory/` as the agent works.

---

## Step 0 — Check for an existing Brain (resumability)

Before anything, check whether `~/realtor-brain/` already exists.

- **No Brain →** fresh setup. Go to Step 1.
- **Brain exists but incomplete** (some `identity/` files are still template placeholders) → tell the
  agent "Looks like we started this before — want to pick up where we left off?" and skip the phases
  already complete.
- **Brain exists and complete** → ask what they want: "Your Brain's already set up. Want to **update
  one part** (brand, market, offer, visuals), **review it**, or **rebuild from scratch**?" Then run
  only the relevant phase. Never silently overwrite a complete Brain.

---

## Step 1 — Set expectations (30 seconds)

Say something like:

> Welcome — I'm setting up your AI Brain. This is a one-time thing. I'll ask you some questions about
> your business, then build a "brain" that every tool you use after this already knows. About 30–40
> minutes if we do it all at once, but we can pause anytime — I save as we go.
>
> We'll cover four things: **who you are**, **who you serve**, **what you offer**, and **how your
> brand looks**. Then I'll connect your email and calendar so your assistant can run. Ready?

Then **scaffold the folder structure now** — copy the bundled template
`references/brain-template/realtor-brain/` to `~/realtor-brain/` (this gives them every subfolder, the
empty `memory/` files, `config.md`, and the `assets/` + `exports/` placeholders in one step). Confirm
it's created.

---

## Step 2 — Phase 1: Who you are + who you serve (Brand Persona)

Run the **Brand Persona** skill (`realtor-brand-persona`) — it owns this interview and writes
`identity/profile.md`, `market.md`, `avatars.md`, and `voice.md` directly into the Brain. Follow that
skill's flow to completion (one question at a time, warm, conversational, dig on vague answers), then
return here.

This is the longest phase (~15 min) and a natural checkpoint — the agent can stop after it and resume
later. When it's done, confirm: "Phase 1 done — the foundation of your Brain is written."

*(The Brain Persona skill is the single source of truth for this interview — don't duplicate its
questions here.)*

---

## Step 3 — Phase 2: What you offer (Offer & USP)

Run the **Offer USP** skill (`realtor-offer-usp`) — it reads what Phase 1 wrote (so it never re-asks),
runs its 6 questions, writes `identity/offer.md`, and renders a "Why Work With Me" guide into
`exports/`. Follow that skill's flow, then return here and checkpoint: "Phase 2 done — your offer is
locked in."

---

## Step 4 — Phase C: How your brand looks (visual)

Read `references/interview-visual.md`. Keep it light (3–5 min). If they upload a logo or headshot,
**save the files to `~/realtor-brain/assets/`** and record the paths. Always write *something* for
colors and fonts — use the safe defaults (black / dark gold `#B8860B` / white, clean modern fonts) if
they don't know, so graphic skills never hit an empty file.

Write `identity/brand-visual.md`. If the agent wants a real designed identity, tell them they can run
the **Brand Guide** skill later — it will update this same file. Save and checkpoint: "Section 3 done."

---

## Step 5 — Phase D: Connect your tools

Open `config.md` and walk the agent through connecting the core connectors, ticking each box as it's
done:

- **Gmail** (required for Jarvis — morning briefing + client emails)
- **Google Calendar** (required for Jarvis — booking showings/consults)
- **Google Drive** (optional — Brain backup)
- **Pexels** (optional — only if they'll use video skills)

If a connector isn't available in their environment, note it in `config.md` as "not connected — set
up later" rather than blocking setup. Set their **timezone** and pull the **default CTA** from
`identity/voice.md` into `config.md`.

---

## Step 6 — Phase E: Finalize the Brain

1. **Write `brain.md`** — the index. Fill the quick-reference block (name, market, primary avatar,
   voice-in-one-line, primary CTA, brand colors, fonts, booking link, socials) by pulling from the
   identity files. Keep the "two laws" and the file map intact. This is the file every skill reads
   first — make the quick-reference genuinely complete so most skills never need to open another file.
2. **Stamp `config.md`** — version, created date, timezone.
3. **Render a welcome doc** to `exports/` — a short, friendly .docx the agent can keep: "Here's your
   Brain — here's what's in it, and here's what to try first." (Use the docx skill.)
4. **Confirm and hand off.** Show them the finished structure and tell them what to do next:

> 🎉 Your AI Brain is built. From now on, every skill already knows you — you'll never re-explain your
> market, your voice, or your offer again.
>
> Try these next:
> • "Set up my Jarvis" — your AI admin (uses the email + calendar you just connected)
> • "Run my market update" — your first piece of content
> • "Create content for my new listing" — when you have a listing to launch
>
> To change anything later, just say "update my brand" or "update my offer" and I'll edit your Brain.

---

## Principles

- **One question at a time. Always.** Never dump a list of questions.
- **Save progressively.** The Brain is on disk — checkpoint after each phase so a pause never loses work.
- **Never re-ask what's known.** Each phase reads what earlier phases wrote.
- **Specific over generic.** Real city names, real client language, real differentiators.
- **Beginner-friendly.** Many agents are new. Offer defaults, reassure, keep momentum.
- **The Brain is the product.** Everything you write here powers every future session. Make it good.
