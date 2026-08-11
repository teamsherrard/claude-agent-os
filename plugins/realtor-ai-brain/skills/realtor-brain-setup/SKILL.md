---
name: realtor-brain-setup
description: >
  Realtor AI Brain — Setup. The ONE skill a real estate agent runs first. It builds their entire
  AI Brain in a single guided session: scaffolds ~/realtor-brain/, interviews them about who they
  are, who they serve, what they offer, and how their brand looks, writes all of it into their
  Brain, walks them through connecting Gmail + Calendar, and hands them a finished, working Brain
  that every other skill (AI Admin, YouTube, market updates, listings) reads automatically.

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

**Permanent home: the agent's cloud WORKSPACE** — the folder map in
`${CLAUDE_PLUGIN_ROOT}/shared/drive-map.md`, built on **Google Drive or OneDrive** per their provider
(`shared/connectors.md`). The Brain's engine lives inside it at **`01 · AI Brain/_engine/`**. The local
`~/realtor-brain/` is just the session's working copy (the sandbox is wiped between sessions). The empty
scaffold ships at `references/brain-template/realtor-brain/` — copy it into place, fill it through the
phases, and **push after every phase**. Local engine structure:

```
~/realtor-brain/   (mirrored to the workspace's 01 · AI Brain/_engine/)
├── brain.md                  # index — quick-reference + map + the laws (you write this LAST)
├── identity/                 # filled by the phase skills
│   ├── profile.md  market.md  avatars.md  voice.md  offer.md  brand-visual.md     (Phases 1–3)
│   ├── voice-samples.md  voice-print.md  proof.md  story-bank.md  content-engine.md  (Phases 4–5 + spoken layer)
│   ├── operations.md  vendors.md  strategy.md  business-plan.md  compliance.md    (Phases 6–7 + capstone)
│   └── publishing.md             # scaffolded empty — the Short-Form System's setup writes it
├── memory/                   # scaffolded empty — skills fill these over time
│   └── clients.md  listings.md  content-log.md  deadlines.md  ideas.md  performance.md  market-data.md
├── intake/                   # drop zone — agent uploads materials here, then "import my materials"
├── assets/                   # logo, headshot, fonts
├── config.md                 # provider, workspace ID/link, timezone, locale, schema version
└── exports/                  # local staging for deliverables (their cloud home is per drive-map.md)
```

**The laws every skill obeys — state these to no one, but build the Brain so they hold:**
1. Skills READ `brain.md` first.
2. Skills WRITE back to `memory/` as the agent works — **then PUSH to Drive** (an unsynced write is a
   lost write).
3. Skills STAY COMPLIANT — read `identity/compliance.md` before publishing.

---

## Step 0 — Provider first, then pull, then check for an existing Brain

**Never trust the local folder to tell you whether this agent has a Brain.** The local sandbox is wiped
between sessions — a fully onboarded agent will still show an empty `~/realtor-brain/` at session
start. Checking only locally would re-onboard a returning agent and **shadow their real Brain in
the cloud with a fresh empty one** at the finalize push. So:

0. **Detect their world FIRST** (per `${CLAUDE_PLUGIN_ROOT}/shared/connectors.md`): **Google** (Drive
   connector) or **Microsoft** (Microsoft 365 connector)? Detect from what's connected; if both or
   neither, ask plainly — *"Are you a Google person or an Outlook/Microsoft person?"* — and help them
   connect that provider's connector now (storage is required for the Brain). Never tell a Microsoft
   agent that Google Drive is required.
1. **Pull.** Use the **realtor-brain-sync** skill to locate their workspace **via its locate ladder**
   (marker file → legacy `Realtor AI Brain` name — never assume a folder name) on the **storage
   connector for their provider**, and pull the brain to `~/realtor-brain/`.
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
   - **"Review it" / "show me my Brain" / "regenerate my Brain document"** → don't re-interview; just
     **rebuild the master "Your AI Brain" document** from the current identity files (per
     `${CLAUDE_PLUGIN_ROOT}/shared/brain-doc.md`), save it to the workspace's `01 · AI Brain/` (dated
     filename), and share it. It always reflects the latest Brain, including the Business Plan section
     once that's built.

---

## Step 1 — Set expectations (30 seconds)

Say something like:

> Welcome — I'm building your complete AI Brain. We do this once, and from then on every tool already
> knows you — your market, your voice, your offer — so you never have to re-explain yourself again.
>
> It takes about **45 minutes**, and we **save as we go**, so you can pause anytime and pick up exactly
> where you left off. Nothing is lost. I'll connect your Google Drive, email, and calendar at the end.
>
> Ready? Let's build it properly.

**Always build the full Brain — there is no fast-track and no "how deep" choice.** Every agent gets the
complete version. First-run runs **Phases 1–5 + 7**, then connectors, then finalize. Don't offer a
shorter path; if an agent is short on time, reassure them they can **pause and resume** (we checkpoint
after every phase) — never by skipping phases.

**Operations (Phase 6) + Vendors are the one thing NOT in first-run** — not to save time, but because
they're used *only* by the AI Admin, so they're captured just before "Set up my AI Admin" (correct
sequencing, not a shortcut). Everything else is built now.

Then **scaffold locally AND create the cloud workspace NOW — before any interviewing.** This is what
makes "save as we go" actually true (the sandbox can die at any minute; the cloud can't):
1. **Scaffold locally** — copy `references/brain-template/realtor-brain/` to `~/realtor-brain/`.
2. **Name the workspace** — *"Your workspace folder will be called **'Social Agent OS'** — or name it
   after your business (you can rename it anytime; I'll always find it)."* Use their answer.
3. **Create the workspace in their cloud** (Drive or OneDrive per Step 0's provider) — build the folder
   map per `${CLAUDE_PLUGIN_ROOT}/shared/drive-map.md` (01–06 + the Content sub-buckets), and make the
   **very first file you write the `_workspace.md` marker** (workspace name · folder ID · link · owner
   account) in the workspace root. **On `microsoft`, this first write IS the write-actions probe** — if
   it fails org-gated, surface it now (per `shared/connectors.md`) *before* 45 minutes of interviewing,
   and offer the free-Google-account fallback.
4. **Capture into `config.md`:** storage provider · workspace name · **folder ID** · link · owner
   account. Push the scaffold to `01 · AI Brain/_engine/` (write → push → verify) and confirm.
**From here on, PUSH AFTER EVERY PHASE** — each checkpoint below ends with a push (write → push →
verify, per `realtor-brain-sync`). A pause, crash, or closed tab never costs more than the current phase.

---

## Step 1.5 — Offer to import existing materials first (the big typing-saver)

Before the interview, offer the **realtor-import** skill **once** — most agents already have gold in Drive
or on their computer, and pulling it in means they answer far fewer questions:

> "Quick one before we start: do you already have materials — testimonials, a bio, past posts, market
> reports, a lead magnet or workbook? You can **upload them right here**, or **point me to a Google Drive
> folder**, and I'll pull what I can so you're mostly confirming instead of typing. Or just say **skip** and
> we'll talk it through."

- **Yes / they have materials →** run **realtor-import** (it extracts, shows a summary, confirms, and writes
  to the relevant identity files). Then continue the interview and **only ask what the import didn't already
  cover** — read what got written before each phase so you never re-ask.
- **Skip →** proceed to Phase 1 as normal.

Either way the **full interview still runs** — import just pre-fills it. It never replaces a phase; it means
some phases become "here's what I pulled, look right?" instead of a blank question.

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

---

## Step 5 — Complete the Brain (Phases 4, 5, 7 — always run)

Run these as their own skills, in order, checkpointing after each. The agent can stop after any one and
resume later — every one **defaults gracefully** if they're unsure (per `shared/ask-once-default.md`).
These are **not optional** — they're part of every setup. (Graceful defaults keep them fast, not skipped.)

- **Phase 4 — Voice & Proof** (`realtor-voice-proof`): real writing samples + testimonials/stats →
  `identity/voice-samples.md`, `proof.md`. *(~5 min — biggest lever on content quality; fully skippable.)*
- **Phase 5 — Content Engine** (`realtor-content-engine`): a simple content plan → `identity/content-engine.md`.
  Asks just 2 things; generates the rest if the agent's unsure. *(~3–5 min.)*
- **Phase 7 — Compliance** (`realtor-compliance`): brokerage disclaimer, license display, claims to avoid →
  `identity/compliance.md`. *(~2 min — mostly confirming safe defaults.)*

**Operations (Phase 6) + Vendors are deliberately NOT here** — they're only needed by the AI Admin, so
they run just before **"Set up my AI Admin"** (mostly one-click defaults, ~3 min). Leaving them out of
first-run keeps onboarding short.

Tell the agent they can deepen anytime — "add my writing samples", "set up my content engine", "set up my
compliance" — and "set up my operations" when they're ready for their AI Admin.

---

## Step 6 — Confirm your tools (most are already connected)

**First, set the provider** (per `${CLAUDE_PLUGIN_ROOT}/shared/connectors.md`): is this agent a **Google**
person (Drive · Gmail · Google Calendar) or a **Microsoft** person (OneDrive · Outlook, via the
Microsoft 365 connector)? Detect from what's already connected; if both or neither, ask plainly —
*"Are you a Google person or an Outlook/Microsoft person?"* Write `Storage provider:` in `config.md`.
Every skill (including the AI Admin) uses that flag from now on — never re-ask.

**Most agents reach this step with their connectors already set up** — in the cohort flow, tools are
connected *before* the Brain build. So **check what's already connected and just confirm it — don't
re-walk them through connecting things they've already done.** Something like: *"Looks like your Google
Drive, Gmail, and Calendar are already connected — you're all set."* Tick what's connected in `config.md`.

Only step in for what's **missing**:
- **Storage — REQUIRED. This is where the Brain lives** (Cowork's local storage is wiped between
  sessions): **Google Drive** on `google`, **Microsoft 365 (OneDrive)** on `microsoft`. If it's somehow
  not connected, help them connect it before finishing — never skip this one.
- **Email + Calendar** (AI Admin — inbox sweep, drafts, booking): **Gmail + Google Calendar** on `google`;
  on `microsoft` the same **Microsoft 365** connector covers Outlook Mail + Calendar (drafts-only policy
  either way). If missing, note "set up later" in `config.md` and proceed.
- **Zoom** (optional — meeting links; Google Meet/Teams is the fallback) · **Cal.com** (optional — client
  self-booking) · **Pexels** (optional — video skills) — missing → note it and move on.

Set their **timezone**, their **locale** (country · currency · units — e.g. Canada · CAD · sq ft; every
skill formats prices, dates, and measurements to this), and pull the **default CTA** from
`identity/voice.md` into `config.md`.

---

## Step 7 — Finalize the Brain

1. **Write `brain.md`** — the index. Fill the quick-reference block (name, market, primary avatar,
   voice-in-one-line, primary CTA, brand colors, fonts, booking link, socials) by pulling from the
   identity files. Keep the laws (read-first · write-back · stay-compliant) and the file map intact.
   This is the file every skill reads first — make the quick-reference genuinely complete so most skills
   never need to open another file.
2. **Stamp `config.md`** — version, created date, timezone, locale, storage provider.
3. **Final full sync + snapshot — do NOT skip.** The workspace already exists (created in Step 1) and
   every phase already pushed; now run a final **write → push → verify** of the whole brain to
   `01 · AI Brain/_engine/`, then take a **snapshot** (`realtor-brain-sync` SNAPSHOTS — the setup-finalize
   restore point). Confirm it's saved before continuing.
   **Hand them the link again:** *"This is your home base — bookmark it. Everything the system builds
   lives here, and you can rename the folder to your business name anytime; I'll still find it."*
4. **Build the master "Your AI Brain" document** — the single, organized deliverable the agent keeps. Follow
   `${CLAUDE_PLUGIN_ROOT}/shared/brain-doc.md`: assemble every section (Snapshot → Who You Are → Market → Offer →
   Voice/Proof → Brand Direction → Content Plan → **Business Plan** → Operations → Compliance) from the identity
   files, render it premium via `shared/render_doc.py`, and save it to the workspace's **`01 · AI Brain/`** as
   "[Agent] — AI Brain — [YYYY-MM-DD]" (dated — regenerations never collide; newest = current). Sections not
   built yet (Business Plan, Operations) render as a friendly placeholder so the agent sees what's still open —
   the Business Plan section fills in the moment they build it.
5. **Hand them the Project Seatbelt.** Read `${CLAUDE_PLUGIN_ROOT}/shared/project-instructions.md` and
   deliver its paste block exactly as that file instructs (copyable code fence + the one-line explanation:
   *"your project seatbelt — paste into any project's Project Instructions so every chat there loads your
   Brain first, even when you're freestyling"*). Every agent leaves setup holding it.
6. **Confirm and hand off.** Show them the finished structure and tell them what to do next:

> 🎉 Your AI Brain is built. From now on, every skill already knows you — you'll never re-explain your
> market, your voice, or your offer again.
>
> **Recommended first move — "Build my business plan."** Now that your Brain knows you, let's point it at a
> goal: I'll turn your income target into the exact number of deals, where they come from, and the three
> weekly moves to hit them — a real 90-day plan with a dashboard. Want to do that now?
>
> Then, anytime:
> • "Set up my AI Admin" — your AI assistant (uses the email + calendar you just connected). It takes
>   ~3 quick minutes first to learn how you operate — hours, booking rules — mostly just confirming defaults.
> • "Run my market update" — your first piece of content
> • "Create content for my new listing" — when you have a listing to launch
> • Have the Realtor YouTube System installed? Say "set up my YouTube system" — it reads this Brain,
>   so it already knows your market, niche, and voice. (Same for the Short-Form System and any other
>   Team Sherrard system — the Brain you just built powers all of them.)
>
> To deepen your brain anytime: "add my writing samples" · "**capture my speaking voice**" (so scripts
> sound like YOU) · "**build my story bank**" (the stories only you can tell) · "set up my content
> engine" · "set up my operations" · "set up my compliance". To change anything: "update my brand" or
> "update my offer".

*(Front-door rule: if an agent with several systems installed says "set up everything" / "onboard me,"
Brain Setup runs FIRST — then list the other systems' setups in order: AI Admin, YouTube, Short-Form.)*

---

## Principles

- **One question at a time. Always.** Never dump a list of questions.
- **Save progressively — to the CLOUD.** Checkpoint after each phase and **push it** (write → push →
  verify); local disk alone is wiped between sessions. A pause never loses more than the current phase.
- **Never re-ask what's known.** Each phase reads what earlier phases wrote.
- **Ask first, generate only when they're stuck.** If the agent gives a real answer, use it — never
  overwrite their input with a guess. When they don't know, propose a draft from the Brain and let them
  react. (Applies to every phase — it's why beginners aren't overwhelmed and experts aren't second-guessed.)
- **Specific over generic.** Real city names, real client language, real differentiators.
- **Beginner-friendly.** Many agents are new. Offer defaults, reassure, keep momentum.
- **The Brain is the product.** Everything you write here powers every future session. Make it good.
