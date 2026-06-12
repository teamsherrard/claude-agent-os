---
name: realtor-brain-setup
description: >
  Realtor AI Brain — Setup. The ONE skill a real estate agent runs first. It builds their entire
  AI Brain in a single guided session: scaffolds ~/realtor-brain/, interviews them about who they
  are, who they serve, what they offer, and how their brand looks, writes all of it into their
  Brain, walks them through connecting Gmail + Calendar, and hands them a finished, working Brain
  that every other skill (Jarvis, YouTube, market updates, listings) reads automatically.

  This replaces running brand-persona, then offer-usp, then brand-direction separately. One door,
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

## Step 0 — Pull from Drive FIRST, then check for an existing Brain

**Never trust the local folder to tell you whether this agent has a Brain.** The local sandbox is wiped
between sessions — a fully onboarded agent will still show an empty `~/realtor-brain/` at session
start. Checking only locally would re-onboard a returning agent and **overwrite their real Brain in
Drive with a fresh empty one** at the finalize push. So:

1. **Pull first.** Use the **realtor-brain-sync** skill to look for a `Realtor AI Brain` folder in the
   agent's Google Drive and pull it to `~/realtor-brain/`. (If the Drive connector isn't connected,
   ask them to connect it now — it's required for the Brain anyway.)
2. **Then decide:**
   - **No Brain in Drive (and none locally) →** fresh setup. Go to Step 1.
   - **Brain exists but incomplete** (some `identity/` files are still template placeholders) → tell the
     agent "Looks like we started this before — want to pick up where we left off?" and skip the phases
     already complete.
   - **Brain exists and complete** → ask what they want: "Your Brain's already set up. Want to **update
     one part** (brand, market, offer, visuals), **review it**, or **rebuild from scratch**?" Then run
     only the relevant phase. **Never silently overwrite a complete Brain — and never push a fresh
     empty Brain over a real one in Drive.** Rebuild-from-scratch requires the agent's explicit
     confirmation after you tell them their existing Brain will be replaced.

---

## Step 1 — Set expectations (30 seconds)

Say something like:

> Welcome — I'm setting up your AI Brain. This is a one-time thing. I'll ask you about your business,
> then build a "brain" that every tool you use after this already knows. We save as we go, so you can
> pause anytime.
>
> Two options:
> • **Express (~30 min)** — the essentials: who you are, who you serve, what you offer, how your brand
>   looks. Enough to start creating immediately.
> • **Full (~60–75 min)** — all of the above PLUS your real writing samples + proof, your content plan,
>   how you operate (for your AI admin), and your compliance rules.
>
> We can always do Express now and deepen later. Which would you like? Either way, I'll connect your
> email and calendar at the end. Ready?

Remember their choice — **Express** runs Phases 1–3 then skips to connectors; **Full** runs Phases 1–7.

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

## Step 4 — Phase 3: Your brand direction (Brand Direction)

Run the **Brand Direction** skill (`realtor-brand-direction`) — it reads Phases 1–2 and captures the
agent's brand **direction** (colours, vibe, font + logo direction, tagline) → `identity/brand-visual.md`.
**It does NOT design anything** — the agent takes this direction into **Claude Design (claude.ai/design)**
to build the actual logo and visuals. The colours + fonts also feed the **AI Video Editor**. Follow that
skill's flow, then checkpoint: "Phase 3 done — your brand direction is set."

*(If the agent has no clue on branding, the skill proposes 2–3 directions to react to, or writes safe
defaults — black / dark gold `#B8860B` / white — so nothing downstream hits an empty file. They can
re-run "set my brand direction" anytime.)*

**→ If they chose Express, skip to Step 6 (Connect your tools) now.**

---

## Step 5 — Phases 4–7: Deepen the Brain *(Full only — skipped in Express)*

These four make the brain dramatically richer. Run each as its own skill, in order, returning here
after each and checkpointing. The agent can stop after any one and resume later.

- **Phase 4 — Voice & Proof** (`realtor-voice-proof`): real writing samples + testimonials/stats →
  `identity/voice-samples.md`, `proof.md`. *(~5 min — the biggest lever on content quality.)*
- **Phase 5 — Content Engine** (`realtor-content-engine`): a simple content plan — pillars, platforms,
  cadence, series, video default → `identity/content-engine.md`. Asks just 2 things (platforms +
  capacity); generates the rest *only if the agent's unsure*. *(~3–5 min.)*
- **Phase 6 — Operations** (`realtor-operations`): hours, signature, booking rules, vendor network,
  goals → `identity/operations.md`, `vendors.md`, `strategy.md`. *(~15 min — the Jarvis foundation.)*
- **Phase 7 — Compliance** (`realtor-compliance`): disclaimers, license display, claims to avoid →
  `identity/compliance.md`. *(~5 min — protects the agent.)*

In Express, tell the agent they can run any of these anytime ("add my writing samples", "set up my
content engine", "set up my operations", "set up my compliance").

---

## Step 6 — Connect your tools

Open `config.md` and walk the agent through connecting the core connectors, ticking each box as it's
done:

- **Google Drive** — **REQUIRED. This is where the Brain lives.** Cowork's local storage is wiped
  between sessions, so the Brain must be saved to the agent's Drive or it disappears next time. Connect
  this — don't skip it.
- **Gmail** (required for Jarvis — inbox sweep + client email drafts; note: draft-only, it cannot send)
- **Google Calendar** (required for Jarvis — booking showings/consults)
- **Zoom** (recommended for Jarvis — auto-creates meeting links on virtual bookings; Google Meet is the
  automatic fallback, so this can be added later)
- **Cal.com** (optional — client self-booking links; Jarvis falls back to their own booking link or to
  proposing times by email)
- **Pexels** (optional — only if they'll use video skills)

If Gmail/Calendar/Zoom/Cal.com/Pexels aren't available, note "not connected — set up later" in `config.md` and
proceed. **Drive is the exception — without it the Brain can't be saved** — so if it's missing, help the
agent connect it before finishing. Set their **timezone** and pull the **default CTA** from
`identity/voice.md` into `config.md`.

---

## Step 7 — Finalize the Brain

1. **Write `brain.md`** — the index. Fill the quick-reference block (name, market, primary avatar,
   voice-in-one-line, primary CTA, brand colors, fonts, booking link, socials) by pulling from the
   identity files. Keep the laws (read-first · write-back · stay-compliant) and the file map intact.
   This is the file every skill reads first — make the quick-reference genuinely complete so most skills
   never need to open another file.
2. **Stamp `config.md`** — version, created date, timezone.
3. **Save the Brain to Google Drive — do NOT skip.** Use the **realtor-brain-sync** skill to create the
   `Realtor AI Brain` folder in the agent's Drive and push the whole brain up. This is what makes it
   persist; the local copy is gone next session. Confirm it's saved before continuing.
4. **Render a welcome doc** to `exports/` — a short, friendly .docx the agent can keep: "Here's your
   Brain — here's what's in it, and here's what to try first." (Use the docx skill.)
5. **Confirm and hand off.** Show them the finished structure and tell them what to do next:

> 🎉 Your AI Brain is built. From now on, every skill already knows you — you'll never re-explain your
> market, your voice, or your offer again.
>
> Try these next:
> • "Set up my Jarvis" — your AI admin (uses the email + calendar you just connected)
> • "Run my market update" — your first piece of content
> • "Create content for my new listing" — when you have a listing to launch
> • Have the Realtor YouTube System installed? Say "set up my YouTube system" — it reads this Brain,
>   so it already knows your market, niche, and voice. (Same for the Short-Form System and any other
>   Team Sherrard system — the Brain you just built powers all of them.)
>
> To deepen your brain anytime: "add my writing samples" · "set up my content engine" · "set up my
> operations" · "set up my compliance". To change anything: "update my brand" or "update my offer".

---

## Principles

- **One question at a time. Always.** Never dump a list of questions.
- **Save progressively.** The Brain is on disk — checkpoint after each phase so a pause never loses work.
- **Never re-ask what's known.** Each phase reads what earlier phases wrote.
- **Ask first, generate only when they're stuck.** If the agent gives a real answer, use it — never
  overwrite their input with a guess. When they don't know, propose a draft from the Brain and let them
  react. (Applies to every phase — it's why beginners aren't overwhelmed and experts aren't second-guessed.)
- **Specific over generic.** Real city names, real client language, real differentiators.
- **Beginner-friendly.** Many agents are new. Offer defaults, reassure, keep momentum.
- **The Brain is the product.** Everything you write here powers every future session. Make it good.
