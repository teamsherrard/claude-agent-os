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

## How you speak — plain language, ALWAYS

The agent sees a warm onboarding, never the machinery. **Do the mechanics silently; narrate only
human milestones:** *"✓ Connected to your Google Drive"* · *"✓ No existing Brain found — building
yours fresh"* · *"✓ Your workspace is ready — here's the link."* NEVER surface internal vocabulary
in anything the agent sees: no step numbers ("Step 0 —"), no "locate ladder", "marker",
"`_workspace.md`", "`config.md`", "sandbox", "scaffold", "probe", "schema", "provider detected",
"sync/pull/push/verify", no file paths, no notes-to-self about what you're skipping or why. If a
decision is worth telling the agent, say it in their words (*"I found an older folder from before —
I'm leaving it completely untouched"*) — otherwise don't say it at all. This binds every phase,
every regenerate, and ESPECIALLY demo builds, which get recorded for training videos.

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
├── intake/                   # LEGACY local staging only — the real drop zone is the workspace's 06 · Materials
├── assets/                   # session-only staging — real brand files live in the workspace's 02 · Brand
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
   - **Brain exists but incomplete** → tell the agent "Looks like we started this before — want to pick
     up where we left off?" and resume at the first incomplete phase. **"Incomplete" is judged ONLY on the
     first-run ten** (`profile · market · avatars · voice · offer · brand-visual · voice-samples · proof ·
     content-engine · compliance`) — `operations`, `vendors`, `strategy`, `business-plan`, `publishing`,
     `voice-print`, and `story-bank` are placeholders BY DESIGN after a perfect first run; never count
     them. (Best: read the `Setup progress:` line in `config.md` — a stamped fact beats inference.)
     **On ANY resume, skip Step 1's scaffold-and-create entirely** — the workspace, marker, and files
     already exist; re-running Step 1 would overwrite the pulled Brain with template placeholders.
   - **Brain exists and complete** → ask what they want: "Your Brain's already set up. Want to **update
     one part** (brand, market, offer, visuals), **review it**, or **rebuild from scratch**?" Then run
     only the relevant phase. **Never silently overwrite a complete Brain — and never push a fresh
     empty Brain over a real one in Drive.** Rebuild-from-scratch requires the agent's explicit
     confirmation after you tell them their existing Brain will be replaced.
   - **Explicit DEMO request** ("build a demo/mock/fake/fictional/test agent brain") → run the normal
     flow on the fictional agent they describe, in **demo mode** per `brain-book-spec.md`'s DEMO BRAINS
     section: NO live research (skip the research mandates + grounding audit — a demo takes minutes),
     every number tagged "(illustrative — demo)" with NO fabricated source attributions, NO real
     competitor/vendor names, and the Book watermarked ("… — DEMO — [date]" filename + demo cover
     line). Full structure and formatting gates still apply — the demo shows the real product. Demo
     mode only ever triggers on THEIR explicit fictional framing about a persona who is NOT them —
     demo keywords aimed at their own identity or market ("mock something up for MY market", "test
     run on my brain") are a REAL build, and any doubt about the subject gets the one question
     ("Fictional demo agent, or your real Brain?"). **Isolation:** demo builds scaffold locally at
     `~/realtor-brain-demo/` and create their OWN workspace named "[name] — DEMO" — never into an
     existing real workspace, and the demo Book never lands in a real `01 · AI Brain/`. And if Step
     0's pull ever finds a brain whose `config.md` says `Demo brain: yes`, say so up front ("this is
     a DEMO brain — fictional [name]") and offer demo continuation or a fresh real setup — never
     resume it as their real Brain. **A demo build NEVER modifies, renames, retires, or "cleans up"
     ANYTHING outside its own — DEMO workspace** — not markers, not folders, not files, no matter how
     it might tidy the locator: other workspaces are read-never-touch, and multiple markers are fine
     (the demo stamp disambiguates). Demo pushes are LIGHT: create the files, then verify with one
     listing of the demo folder — no per-file verification, no housekeeping, no snapshots.
   - **"Review it" / "show me my Brain" / "regenerate my Brain document"** → don't re-interview; just
     **rebuild the master "Your AI Brain" document** from the current identity files (per
     `${CLAUDE_PLUGIN_ROOT}/shared/brain-book-spec.md` — the canonical Book contract, incl. its research-refresh rules), save it to the workspace's `01 · AI Brain/` (dated
     filename), and share it. It always reflects the latest Brain, including the Business Plan section
     once that's built.

---

## Step 1 — Set expectations (30 seconds)

Say something like:

> Welcome — I'm building your complete AI Brain. We do this once, and from then on every tool already
> knows you — your market, your voice, your offer — so you never have to re-explain yourself again.
>
> It takes about **45 minutes**, and we **save as we go** — to your cloud, after every step — so you can
> pause anytime and pick up exactly where you left off. Nothing is lost. Your Drive/OneDrive is already
> connected, so I'm setting up your workspace right now; email and calendar we'll confirm at the end.
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
makes "save as we go" actually true (the sandbox can die at any minute; the cloud can't).
**This whole step runs ONLY on a genuinely fresh setup (Step 0 found no Brain anywhere) — on a resume,
skip it entirely.** Every action here is find-or-create, never re-create:
1. **Scaffold locally — copy ONLY files that don't already exist** in `~/realtor-brain/`. **Never
   overwrite a pulled file with the template** — that replaces a real Brain with placeholders.
2. **Name the workspace** — *"Your workspace folder will be called **'Social Agent OS'** — or name it
   after your business (you can rename it anytime; I'll always find it)."* Use their answer.
3. **Create the workspace in their cloud** (Drive or OneDrive per Step 0's provider) — **find-or-create:
   if a `_workspace.md` marker already exists anywhere in their storage, adopt that folder and NEVER
   write a second marker** (two markers make every future cold-start ambiguous). Otherwise: create the
   workspace **root folder**, then **immediately write `_workspace.md`** (workspace name · folder ID ·
   link · owner account) into it — **on `microsoft`, THIS write is the write-actions probe**: if it fails
   org-gated, stop and surface it now (per `shared/connectors.md`), *before* 45 minutes of interviewing,
   with the free-Google-account fallback. Only after the marker succeeds, build the rest of the map per
   `${CLAUDE_PLUGIN_ROOT}/shared/drive-map.md` (01–06 + the Content sub-buckets) — and drop a signpost
   file at the TOP of `_engine/` named **"⚙️ WHAT IS THIS FOLDER — read me.md"** containing exactly this:
   *"This is your AI Brain's ENGINE — the working files Claude reads and writes to power every tool. You
   never need to open, edit, or organize anything in here. Everything in these files, in readable form,
   lives in your 📕 Business Brain Book (one folder up). Please don't rename, move, or delete these files —
   your AI depends on them. The snapshots folder is your automatic backup."*
4. **Capture into `config.md`:** storage provider · workspace name · **folder ID** · link · owner
   account · **`Setup progress: Step 1 done`**. Push the scaffold to `01 · AI Brain/_engine/`
   (write → push → verify) and confirm. **Stamp `Setup progress:` at every later checkpoint too**
   (Phase 1 done, Phase 2 done, …) — resume reads that stamp, never guesses.
**From here on, PUSH AFTER EVERY PHASE** — each checkpoint below ends with a push (write → push →
verify, per `realtor-brain-sync`). A pause, crash, or closed tab never costs more than the current phase.
**And keep `brain.md` LIVE, not placeholder:** at each phase's push, also fill the quick-reference fields
that phase produced (Phase 1 → name·market·avatar·voice-line·CTA; Phase 3 → colours·fonts) and push
brain.md too — the session-start hook injects brain.md everywhere, so it must never sit as `[First Last]`
templates while identity/ is rich. Step 7 only *finalizes* it.

---

## Step 1.5 — Offer to import existing materials first (the big typing-saver)

Before the interview, offer the **realtor-import** skill **once** — most agents already have gold in Drive
or on their computer, and pulling it in means they answer far fewer questions:

> "Quick one before we start: do you already have materials — testimonials, a bio, past posts, market
> reports, a lead magnet or workbook? You can **upload them right here**, or **point me to a folder in
> your Drive/OneDrive**, and I'll pull what I can so you're mostly confirming instead of typing. Or just say **skip** and
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
runs its 6 questions, and writes `identity/offer.md`. **No separate document is produced in setup** — the
full Why-Work-With-Me content becomes the 📕 Book's "Your Offer & USP" section (the client-ready
standalone guide is available on demand later: "build my Why Work With Me guide"). Then return here and
checkpoint: "Phase 2 done — your offer is locked in." 

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
  `identity/voice-samples.md`, `proof.md`. *(~5 min — biggest lever on content quality; if they have nothing handy, capture what's real and move on — the phase always runs, no field is forced.)*
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

**The provider was already set in Step 0 and lives in `config.md` — do NOT re-detect and do NOT re-ask.**
This step just confirms the right connectors for that provider and ticks the boxes.

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
   lives here, and you can rename the folder to your business name anytime; I'll still find it. One thing
   you'll notice: a folder called `_engine` — that's your AI's internal memory. You never need to touch
   it; everything in it, readable, is in your 📕 Business Brain Book."*
4. **Build the master "Your AI Brain" document — the agent's BUSINESS BOOK. This is the flagship
   deliverable; treat it like the product it is.** **The canonical contract is
   `${CLAUDE_PLUGIN_ROOT}/shared/brain-book-spec.md` — follow it in full** (its four-part, fifteen-chapter
   arc with the strategic + researched chapters, its Book structure — cover page, linked CONTENTS page,
   `CHAPTER N — TITLE` bands, `>> ` callouts — its GROUNDING LAWS, its build pipeline, and its verify
   gate; it supersedes
   `brain-doc.md` and contains every rule below as a strict superset). The gates below remain the floor:
   follow `brain-book-spec.md` for the section order (Snapshot → Who You Are → Who You Serve → Market → Offer & USP → Voice & Proof → Brand
   Direction → Content Plan → **Business Plan** → Operations → Compliance), and obey these NON-NEGOTIABLES:
   - **RENDER THE FULL CONTENT of every identity file — never summarize, never compress.** Each section
     carries everything its file holds, written out for the agent: **Who You Serve** = EVERY avatar in full
     (their situation, motivations, fears, what they want from an agent, their words); **Market** = a
     **sub-section PER COMMUNITY**, each a real researched breakdown: sourced current prices + how they've
     moved, who buys there and why, schools/amenities/commute, what's being built right now, and the
     angle — plus **surrounding/nearby communities worth knowing** beyond the ones the agent named
     (numbers always carry source + date). **If `market.md` holds only one-liners for any community
     (captured before the research mandate, or thin), RUN THE RESEARCH NOW — during this build or any
     regenerate — write it back to `market.md` first, then render.** *(Demo brains: no live research —
     demo mode per the spec's DEMO BRAINS section; illustrative labels instead of sources.)* And **RESTRUCTURE, don't append**:
     keeping the agent's one-line community list and adding a separate research block at the end does
     NOT satisfy this — the community list itself must BECOME the per-community sub-sections, each
     merging the agent's own view ("your underrated pick") WITH the researched data (sourced prices,
     buyer profile, schools, what's being built) under one sub-heading per community. A
     one-bullet-per-community list surviving anywhere in the section is a FAILED render. **Overall length: the Book is as long as the Brain is deep — 15+ pages
     is normal and welcome; never compress to fit a page count**; **Offer & USP** = the complete Why-Work-With-Me narrative in full — the offer, guarantees,
     process, and USP; **Voice & Proof** = the full tone rules, never-sound-like list, signature phrases,
     samples, testimonials, and stories; **Business Plan** = the whole plan with the math and KPIs.
   - **FORMAT IT LIKE THE $8,000 DOCUMENT IT IS.** Use the renderer's full grammar deliberately, per
     content type — never walls of plain paragraphs: **tables** for structured data (brand colours + roles,
     the business plan's KPI dashboard and money math, avatar-at-a-glance rows, the content-plan cadence),
     **bullets** for every list (services, guarantees, never-say, communities), **sub-headings** inside big
     sections (one per avatar, per pillar), **callouts** for testimonials and signature phrases, and clean
     line breaks between every idea. Prose where prose persuades; structure where structure clarifies.
   - **HARD GATE — 3,000+ words for a complete brain, properly formatted, and the RENDERED FILE is what
     uploads.** Upload the `.docx` produced by `render_doc.py` (or the docx skill) — NEVER the raw
     structured text (if the doc in Drive shows literal `════`/`────` lines as text, you uploaded the
     renderer's input: re-render and re-upload). After rendering, extract the
     text back out of the `.docx` and CHECK: (a) COUNT — 3,000+ words; (b) **ALL ELEVEN section headings
     present** (Snapshot · Who You Are · Who You Serve · Your Market · Your Offer & USP · Your Voice &
     Proof · Your Brand Direction · Your Content Plan · Your 90-Day Business Plan · How You Operate ·
     Compliance) — a missing section (especially Offer & USP or Voice & Proof) = failed; (c) the byline
     appears ONCE (title block) — don't repeat the full credential line again in Snapshot; (d) the
     linked **CONTENTS page renders on page 2** with all FIFTEEN chapter rows, each carrying its
     one-line summary written for THIS agent — a summary any other agent could reuse = failed; (e)
     chapter bands read **CHAPTER 1 through CHAPTER 15, sequential**, inside the four PART I–IV bands;
     (f) the render's stderr showed **ZERO unresolved-TOC warnings** — any warning means a contents row
     and a chapter band don't match: fix the structured text, re-emit, re-render; (g) the spec's
     **GROUNDING LAWS hold** — the pre-render grounding audit ran (its "N facts traced, M cut" tally
     goes in the hand-off message), no community outside the agent's named/confirmed list is presented
     as theirs (researched adjacents labeled, introduced in the Market chapter, ≤4), no competitor is
     named without a sourced + dated verification, and nothing about the agent appears that isn't in
     their Brain. Under 3,000
     words, a missing section, ANY `<w:` markup in the text, a missing or incomplete contents page,
     out-of-sequence chapter labels, an unresolved-TOC warning, a grounding-law breach, or
     wall-of-text sections with no tables/bullets where the data is clearly tabular = **FAILED render —
     rebuild immediately by writing each section from the full identity-file contents with the formatting
     grammar above, then re-verify. Never upload a failed render, and never narrate the retry to the
     agent** — they only ever see the finished book. **Retry caps and the exhaustion STOP in
     `brain-book-spec.md` govern:** a build that exhausts its bounded retries (research refresh once
     per chapter · TOC re-render twice · rebuild cycles twice) STOPS and tells the agent plainly
     what's blocking — that stop is the honest terminal state, not narration, and it never uploads
     the failed render.
   - Render premium via `shared/render_doc.py`, save to the workspace's **`01 · AI Brain/`** — and name it
     so it's UNMISSABLE: **"📕 [Agent]'s Business Brain Book — [YYYY-MM-DD]"** (the emoji + the words
     "Business Brain Book" make it instantly findable in a folder; dated so regenerations never collide —
     newest = current). Sections not built yet (Business Plan, Operations) render as a friendly placeholder —
     the Business Plan section fills in the moment they build it. The same standard AND the same name apply
     to EVERY regeneration ("show me my Brain" / after the Business Plan).
   - **Hand them the DOC, not just the folder.** After uploading, give the agent the **direct link to the
     Book itself** and say exactly where it lives: *"Your **Business Brain Book** is in your workspace →
     01 · AI Brain — here's the direct link. This is your business bible; everything the system knows about
     you, in one book."* Never make an agent hunt through Drive for their flagship document.
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
