# The AI Brain System for Real Estate Agents — Master Blueprint

**Status:** FOR TEAM APPROVAL · **Version:** 1.0 (blueprint) · **Date:** 2026-06-09
**Owner:** Team Sherrard · **Prepared for:** internal review before full build

> **One line:** We give every realtor a private **AI Brain** — a single source of truth about their
> business that they build once and that then powers every AI tool they use (admin, YouTube,
> short-form, market updates, listings, video editing, and everything we build next) — delivered as
> one installable, auto-updating package.

---

## 1. The Problem We're Solving (the "Before")

Today our skills are powerful but they live as **separate zip files**. The realtor's experience is:

- "Run the brand persona skill. Now run the offer skill. Now download this zip, that zip, this one…"
- Each skill re-asks the same questions — *"what city are you in? who's your client?"* — every time.
- Knowledge lives in `.docx` files the agent has to manually upload into a Claude Project and hope
  the next skill reads.
- Nothing remembers anything. The YouTube tool doesn't know what you filmed last week. The admin
  doesn't know your brand voice. Every tool starts cold.
- When we improve a skill, we have to tell 100 agents to re-download a new zip.

It's a **pile of disconnected tools**, not a system. It doesn't scale to us, and it overwhelms them.

---

## 2. The Transformation (Before → After)

| | **Before (today)** | **After (the AI Brain)** |
|---|---|---|
| Install | 12 separate zips | **One link, one install** |
| Setup | Run skill after skill, juggle files | **One guided onboarding** builds the whole brain |
| Knowledge | `.docx` files manually uploaded to a Project | **One private brain** every tool reads automatically |
| Memory | None — every tool starts cold | **Compounds** — tools remember clients, listings, content |
| Consistency | Each tool guesses your brand | **Every tool** uses the same voice, colours, offer |
| Updates | "Re-download the new zip" × 100 agents | **Push once → everyone auto-updates** |
| Our delivery | Manual, messy, per-client | **One repo, cloned per agent** |

---

## 3. The Big Idea: Brain ≠ Skills ≠ Package

The whole system rests on separating three things we currently treat as one pile. Think of it like an
**operating system**:

```
┌─────────────────────────────────────────────────────────────┐
│  LAYER 3 — THE PACKAGE   (how it's delivered & updated)      │
│  One GitHub repo → one plugin → installs in Cowork,          │
│  auto-updates when we push.            = the App Store       │
├─────────────────────────────────────────────────────────────┤
│  LAYER 2 — THE SKILLS    (the apps that do the work)         │
│  Setup · Brand · Offer · Market · Listings · YouTube ·       │
│  Short-form · Jarvis · Video Editor …  = the installed apps  │
├─────────────────────────────────────────────────────────────┤
│  LAYER 1 — THE BRAIN     (the agent's data — THE PRODUCT)    │
│  Identity + Memory + Assets at ~/realtor-brain/              │
│                                        = the hard drive /    │
│                                          user profile        │
└─────────────────────────────────────────────────────────────┘
```

**Why this matters:** skills become interchangeable apps. The Brain is the product. We can add,
improve, or swap any skill without ever disturbing the agent's data — and every new agent we build in
future just plugs into the same brain.

---

## 4. What the Agent Gets

**The outcome (what they feel):** *"I set this up once, and now every AI tool I use already knows my
business, my market, my voice, my clients, and what I've already made. It gets smarter every time I
use it."*

**The deliverable (what they install):**
- One plugin → a full suite of AI skills.
- A guided onboarding that builds their **Brain**.
- A private brain folder on their machine that is theirs forever.
- Tools that read the brain automatically and write back to it.
- Free, automatic improvements whenever we ship them.

**The engine (what's actually running):** every skill obeys **two laws** —
1. **READ the brain first** (never re-ask what's known).
2. **WRITE back what you learn** (so the system compounds).

That second law is the magic: the brain gets richer every single time the agent works.

---

## 5. The Full Inventory — What Lives in the Brain

The brain holds **three kinds of things**, governed by **one rule**.

| Kind | What | Format |
|---|---|---|
| **Identity** | Durable truths about the agent | markdown (`identity/`) |
| **Memory** | Things that accumulate as they work | markdown, written by skills (`memory/`) |
| **Assets** | Brand binaries — logos, headshots, photos, fonts, templates | files (`assets/`) |

> **The rule:** the brain stores *durable agent-truth*, never *volatile data*. It stores "Tuscany is a
> lake community with top schools" (always true). It does **not** store "June benchmark price =
> $612k" — skills fetch that live each run, or it's stale by July. This keeps the brain from rotting.

### The 10 identity domains (+ memory)

🟢 core (setup captures) · 🔵 high-value enrich (paste/accumulate) · ⚪ later

| # | Domain | What's in it | Powers |
|---|---|---|---|
| 1 | **Person & Business** 🟢 | name, preferred name, title, license #, brokerage, years, designations, awards, production stats, contact, booking link, socials, languages | every CTA/bio, SEO, Jarvis signature |
| 2 | **Voice & Personality** 🟢 + **writing samples** 🔵 | tone, never-sounds-like, signature phrases, sign-offs, humor + 3–5 real past captions/emails | every script & caption (samples = authentic voice) |
| 3 | **Market & Local Intelligence** 🟢 | communities, price ranges, property types, niche, secondary market, schools, hidden gems, why people move/leave, misconceptions, which board to pull | market updates, tours, listings, local SEO |
| 4 | **Audience / Avatars** 🟢 | buyer/seller/investor avatars: pains, desires, objections, journey stage | who every piece speaks to |
| 5 | **Offer, Services & USP** 🟢 + **proof library** 🔵 | buyer/seller offers, guarantees, signature process, vendor value-adds, commission philosophy, lead magnets + testimonials, stats, case studies | listings, lead magnets, "why hire me", Jarvis emails |
| 6 | **Visual Brand & Assets** 🟢 / 🔵 | colours (hex), fonts, logo variants, multiple headshots, tagline + brand photography, b-roll, music, content + print templates | ALL graphics, thumbnails, **the AI Video Editor**, print |
| 7 | **Content Engine** 🔵 | content pillars, platform priority, realistic cadence, signature series, default video style *(hashtags + hook styles are generated per-piece by the content skills, not stored)* | consistency + what to post when |
| 8 | **Operations & Admin (Jarvis)** 🔵 | working hours, email templates + signature, booking rules, objection scripts, follow-up sequences, **vendor/partner network** | Jarvis scheduling/emails/follow-ups, referrals |
| 9 | **Strategy & Goals** 🔵 | annual GCI/transaction goals, what they want to be known for, growth focus | what the AI prioritizes & suggests |
| 10 | **Compliance & Legal** 🟢 | required disclaimers, license-display rules, fair-housing constraints, claims they can't make, brokerage logo rules | keeps every public output compliant — protects the agent |
| — | **Memory** (accumulates) 🟢 | clients (ledger), listings/deals + buyer search criteria, content-log, deadlines, interaction history | no repeats, Jarvis recall, matching, pipeline awareness |

### Where it physically sits

```
~/realtor-brain/                  ← the agent's private brain (NEVER in the repo)
├── brain.md                      ← the index every skill reads first
├── identity/                     ← set once, changes rarely
│   ├── profile.md   market.md   avatars.md
│   ├── voice.md     offer.md     brand-visual.md
│   ├── voice-samples.md  proof.md          (Phase 4)
│   ├── content-engine.md                   (Phase 5)
│   ├── operations.md  vendors.md           (Phase 6)
│   ├── strategy.md                         (Phase 6/9)
│   └── compliance.md                       (Phase 7)
├── memory/                       ← grows every day
│   ├── clients.md   listings.md   content-log.md   deadlines.md
├── assets/                       ← logo variants, headshots, fonts, b-roll, templates
├── config.md                     ← connectors, timezone, brain schema version
└── exports/                      ← rendered .docx/HTML/PDF (NOT source — disposable)
```

---

## 6. The Engine — How the Brain Powers Everything

Every skill reads the brain and writes back. Each downstream system consumes only the domains it
needs. This is the dependency map:

```
                          ┌──────────────────────┐
                          │   ~/realtor-brain/    │
                          │  identity · memory ·  │
                          │       assets          │
                          └──────────┬───────────┘
        ┌──────────┬───────────┬─────┴─────┬───────────┬──────────┐
        ▼          ▼           ▼           ▼           ▼          ▼
   Market      Listing     YouTube /    Jarvis     AI Video    Lead
   Update       Kit       Short-form   (admin)     Editor     Magnets
   reads:      reads:      reads:       reads:      reads:     reads:
   market      voice       profile      profile    visual +   offer
   voice       offer       avatars      voice       assets    proof
   visual      avatars     voice        offer                 avatars
              visual      content       operations
   writes:     writes:     engine       vendors     writes:    writes:
   content-    listings    visual       writes:       —          —
   log         content-    writes:      clients
               log         content-     deadlines
                           log
```

Build a brand-new agent later (lead-gen, DM responder, transaction coordinator) and it just declares
which domains it reads. It never re-interviews the agent. **The brain is the substrate; every agent is
an app on top of it.**

---

## 7. The Workflows (in detail)

The brain has a lifecycle. Seven workflows run on it:

### 7.1 BUILD — onboarding (phased setup)
The agent runs **"Set up my Brain"** once. A conductor runs the real skills in order, each writing its
own part of the brain. Resumable — they can stop after any phase and continue later.

```
Set up my Brain (conductor)
  Phase 1 → Brand Persona ─→ identity/profile, market, avatars, voice   [~15 min]
  Phase 2 → Offer & USP ───→ identity/offer  (+ guide → exports/)        [~10 min]
  Phase 3 → Brand Direction → identity/brand-visual (direction→Claude Design) [~5–10 min]
  Phase 4 → Voice & Proof ─→ identity/voice-samples, proof               [~5 min]
  Phase 5 → Content Engine → identity/content-engine                     [~3–5 min]
  Phase 6 → Operations ────→ identity/operations, vendors, strategy      [~15 min]
  Phase 7 → Compliance ────→ identity/compliance                         [~5 min]
  Connect → Gmail · Calendar · (Drive · Pexels)
  Finalize → write brain.md index + welcome doc → DONE
```
Express path option: a 10-minute "minimum viable brain" (Phases 1–3 only) so they get value fast and
enrich later.

### 7.2 USE — read (every skill, every run)
**Step 1 of every skill:** read `~/realtor-brain/brain.md`, open the specific identity files it needs.
Never ask what the brain already knows. If the brain is missing, the skill says "run Setup first."

### 7.3 GROW — write-back (every skill, every run)
After a skill produces work, it logs to memory: a published video → `content-log.md`; a new listing →
`listings.md`; a client note → `clients.md`. **This is what makes the system compound** — next month's
content avoids last month's angles; Jarvis remembers every client.

### 7.4 UPDATE / ENRICH — change one thing
"Update my offer", "add this testimonial", "I rebranded", "new headshot" → edits one domain; everything
downstream instantly reflects it. No full re-setup.

### 7.5 PROVISION — clone per agent (OUR workflow)
We spin up a fresh brain for a new client in minutes (see §10).

### 7.6 BACKUP / SYNC
The brain is the agent's most valuable asset. It syncs to their Google Drive so it survives a dead
laptop and follows them across devices. *(Proposed as core, not optional — see §15.)*

### 7.7 HEALTH-CHECK
"What's missing from my brain?" → audits completeness and tells them to add a headshot, writing
samples, a compliance disclaimer, etc. A brain that improves itself over time.

---

## 8. Where Everything Lives

| Thing | Lives | Why |
|---|---|---|
| The **agent's brain** (their data) | **the agent's Google Drive** (`Realtor AI Brain` folder); local `~/realtor-brain/` is a per-session working copy synced from Drive | Private, portable across sessions/devices, never in our repo |
| The **skills + template** (the system) | our GitHub repo → installed plugin | One source, auto-updates |
| **Rendered outputs** (docx, video, graphics) | `~/realtor-brain/exports/` | Disposable; regenerated from source |
| The **agent runs everything** in | **Claude Cowork** (the friendly door) | Non-technical; full power, calm UI |
| **We build/publish** in | **Claude Code** (the workbench) | Developer surface; agents never see it |

> **Decision locked:** realtors live 100% in Cowork; we build in Claude Code. Same engine, two doors.
> Claude Chat is out — we want systems & automations, not a chat box.

---

## 9. How It's Delivered + Why the GitHub Repo Matters

The repo is **not just storage — it's the update pipeline**. This is the single most important
operational decision.

```
        WE (Team Sherrard)                         EACH REALTOR
   ┌────────────────────────┐                  ┌────────────────────┐
   │  GitHub repo            │   install once   │   Cowork           │
   │  realtor-ai-brain       │ ───────────────► │                    │
   │  (marketplace + plugin) │                  │  install via UI    │
   └───────────┬────────────┘                  └─────────┬──────────┘
               │  we push an improvement                 │  auto-update
               │  (bump version, commit, push)           │  on next session
               └────────────────────────────────────────►│
                                                          ▼
                              their ~/realtor-brain/ is UNTOUCHED
                              (only the skills improve)
```

- **One repo is both the marketplace and the plugin.** It bundles all skills + the brain template.
- **The repo is a *plugin*, not a clone-and-run project.** Realtors never clone or download anything —
  Cowork installs the plugin *from* the repo. (A clone-and-run repo like the AI Video Editor does NOT
  work in Cowork; a packaged plugin does.)
- **Install (Cowork is UI — no slash commands):** Customize → Personal Plugins → Add marketplace →
  paste `teamsherrard/realtor-ai-brain` → Install → toggle **Sync automatically**.
- **Updates:** we bump the version and push → agents with auto-sync on get it automatically; others
  click **Update** on the marketplace card. **No re-downloads, no "edit your file" to 100 people.**
- **Versioned & auditable:** `VERSION`, `CHANGELOG.md`, tagged commits (`v0.4.0 — …`) — same discipline
  as the AI Video Editor repo.

**Resolved by the platform:** Cowork can only add **public** GitHub marketplaces — end users cannot add
a private repo. So for self-serve realtor install, **the repo must be public** (the only private path is
Enterprise/org-admin workspace deployment, which individual agents won't have). We accept that the skill
source is readable; the moat is the system + brand + support + the agent's own brain, not secret prompts.

---

## 10. How It's Cloned Per Agent

Each realtor gets their **own brain**; the **system is shared**. Cloning is two independent things:

```
THE SYSTEM (shared, one repo)        THE BRAIN (private, per agent)
   every agent installs the      +      every agent runs Setup once →
   same plugin from our repo            their own ~/realtor-brain/ filled
                                        with THEIR identity + memory
```

For us delivering to many clients, a **Provisioning workflow**:
1. Agent installs the plugin (same for everyone).
2. Agent runs "Set up my Brain" → scaffolds a fresh `~/realtor-brain/` from the bundled template and
   fills it through onboarding.
3. (Optional, agency-assisted) We pre-seed parts of their brain from an intake form / their existing
   materials, then hand off.
4. Their brain backs up to *their* Drive — we never hold their data.

This scales: 1 agent or 100, the system is identical; only the brains differ.

---

## 11. How the Agent Gets Onboarded (their first hour)

```
1. Get the link from us.
2. In Cowork (UI): Customize → Personal Plugins → Add marketplace →
   paste teamsherrard/realtor-ai-brain → Install → toggle "Sync automatically"
3. Say:        "Set up my Brain"
4. Answer the guided questions (phased, ~30–60 min, pause anytime).
   → builds identity/, saves logo + headshot to assets/
5. Connect Gmail + Calendar when prompted.
6. Done. A welcome doc lands in exports/.
7. Immediately try:  "Run my market update"
                     "Create content for my new listing"
                     "Set up my Jarvis"
```
From that point on, every tool already knows them. To change anything: *"update my brand."*

---

## 12. Connectors & Integrations

| Connector | Purpose | Tier |
|---|---|---|
| **Gmail** | Jarvis: morning briefing, client emails in their voice | 🟢 core |
| **Google Calendar** | Jarvis: book showings/consults/open houses | 🟢 core |
| **Google Drive** | Brain backup + portability | 🔵 strongly recommended |
| **Pexels / stock** | B-roll for video skills | ⚪ if using video |
| **AI Video Editor** | Consumes `brand-visual` + `assets` as its brand config | 🔵 (their other product) |
| Future: **CRM** (Follow Up Boss, kvCORE) | Sync clients/leads into `memory/clients` | ⚪ future |
| Future: **MLS / listing feed** | Auto-pull listing data into `listings.md` | ⚪ future |
| Future: **Outlook** | Tier-2 alternative to Gmail for non-Google agents | ⚪ future |

> **Known limitation:** Claude plugins can declare MCP servers but can't *auto-provision* Gmail/Calendar
> — the agent approves each on first use. Onboarding must walk them through it (see §15).

---

## 13. Build Roadmap & Status

| Phase | What | Status |
|---|---|---|
| 0 | Brain spec + template + contract | ✅ done |
| Pkg | Plugin + marketplace repo, auto-update | ✅ done |
| 1 | Foundations — Brand Persona → identity | ✅ done |
| 2 | Offer & USP → identity/offer | ✅ done |
| 3 | Brand Direction → brand-visual (direction, feeds Claude Design) | ✅ done |
| — | All 6 content skills retrofitted (read + write-back) | ✅ done |
| 4 | Voice samples + Proof library | ⬜ next |
| 5 | Content Engine | ⬜ |
| 6 | Operations + Jarvis into the brain (+ vendors) | ⬜ |
| 7 | Compliance | ⬜ |
| — | Provisioning workflow (agency) | ⬜ |
| — | Brain backup/sync + schema-migration system | ⬜ (see §15) |
| — | Push to **public** GitHub marketplace (Cowork requires public) | ⬜ |

*Current: v0.4.0, 10 skills, committed locally, not yet pushed.*

---

## 14. Future Ideas (not finalized — the vision)

- **More agents on the same brain:** lead-gen/nurture agent, DM responder, transaction coordinator,
  review-requester, sphere/database re-engagement, expired/FSBO outreach.
- **A live Brain Dashboard:** one artifact showing today's schedule, pipeline, content calendar,
  brain completeness — the cockpit.
- **Content performance loop:** feed published-content results back into the brain so it learns what
  works for this agent and proposes more of it.
- **Team / brokerage brains:** a shared brokerage brain + individual agent brains underneath; shared
  vendors, compliance, brand; private clients.
- **Brain analytics for us:** anonymized, opt-in patterns across agents to improve the skills.
- **Voice/likeness cloning:** the brand voice extends to a cloned on-camera/voice avatar for video.
- **Auto-provisioning from an intake form:** client fills a form → we generate a pre-seeded brain.
- **A skills marketplace:** agents add optional skills (luxury, commercial, property management).
- **Mobile / voice interface:** talk to the brain on the go.
- **Brain portability / export:** the agent owns and can export their entire brain anytime.

---

## 15. What the Plan Might Be Missing (honest gaps & risks)

These are the things to resolve *before* we scale to 100 agents:

1. **Brain schema migration (biggest gap).** When we change the brain's structure (add a domain, split
   a file), 100 agents already have brains in the *old* shape. We need a **versioned brain** (`config.md`
   already has a schema version) + a **migration skill** that upgrades an old brain to the new schema on
   update. Without this, a structural change breaks existing agents.
2. **Backup & durability.** The brain is local files. A dead laptop = a lost brain. **Drive sync should
   be core, not optional**, and updates must never touch `~/realtor-brain/`.
3. **Data privacy & security.** `clients.md` holds client PII. We need a clear stance: it stays on the
   agent's machine/Drive, we never hold it, and we note privacy-law obligations (PIPEDA/CCPA).
4. **Connector friction.** Gmail/Calendar can't be auto-provisioned — onboarding must hand-hold the
   approval, or first runs fail silently.
5. **Cowork dependency.** The whole product assumes realtors can use Cowork reliably and affordably.
   Platform availability, pricing, and stability for non-technical users is an adoption risk to validate.
6. **Onboarding drop-off.** Even phased, a full brain is a 60-min commitment. The **express "minimum
   viable brain"** path (Phases 1–3) is the mitigation — get them to value fast, enrich later.
7. **Quality assurance per brain.** Garbage in → garbage out. A weak interview makes a weak brain. The
   **health-check** workflow should score brain completeness/quality and nudge improvements.
8. **Support model.** Who helps a realtor when something breaks? Self-serve health-check + docs +
   (maybe) a support channel. Needs an owner.
9. **Compliance liability.** If our compliance module misses a rule and an agent gets fined, what's our
   exposure? Position it as *assistance, not legal advice*, with a disclaimer; agent stays responsible.
10. **Public repo is required (platform-decided).** Cowork only installs from *public* marketplaces, so
    the repo must be public and the skill source is readable. Accept it, or use Enterprise org-deploy for
    managed workspaces. The earlier "public vs private" debate is effectively settled by the platform.
11. **Multi-device & teams.** One brain per machine doesn't fit agents on multiple devices or teams
    sharing clients — Drive sync partially solves devices; teams need the brokerage-brain model.
12. **Business model.** Pricing/packaging/licensing (subscription? bundled with coaching?) — a team
    decision, but it shapes the build (e.g., per-seat provisioning, license checks).

---

## 16. The Ask (what we need approval on)

1. **Direction:** approve the Brain-as-product model and the 3-layer architecture.
2. **Scope:** approve "full brain, phased setup" (10 domains) with an express path.
3. **Surface:** confirm Cowork-for-agents / Code-for-us.
4. **Delivery:** approve the one-repo plugin + auto-update model; **decide public vs private**.
5. **Gaps:** greenlight building the **schema-migration + backup** system as part of v1 (not later).
6. **Resourcing:** who owns support, compliance review, and the business model.

Approve these and we continue the build: Phases 4–7, provisioning, backup/migration, then push.
