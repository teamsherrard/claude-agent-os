# Agent OS — Complete System Map
*Everything in the system, generated from the live repo. Snapshot: marketplace build v0.21.0 ·
Brain v0.16.0 · AI Admin v0.2.0 · YouTube v0.3.0 · Short-Form v0.7.0.*

**What it is:** one Cowork marketplace (`teamsherrard/claude-agent-os`) containing **4 plugins** that
install in journey order. The realtor builds **Plugin 1 (the Brain) first** — it's the foundation every
other plugin reads. **39 skills total.**

| # | Plugin | Skills | What it does | When the agent installs it |
|---|---|---|---|---|
| **1** | **Realtor AI Brain** | 16 | Builds & holds the agent's identity + memory; powers everything | **First — always** |
| **2** | **Realtor AI Admin** | 1 | The AI assistant: scheduling, inbox, client memory, briefings | After the Brain |
| **3** | **Realtor YouTube System** | 15 | End-to-end YouTube: ideas → script → SEO → repurpose → coach | When they reach the YouTube module |
| **4** | **Realtor Short-Form System** | 7 (+4 shared) | Reels/TikTok/Shorts: create → optimize → publish → measure | When they reach the short-form module |

---

# 🧠 PLUGIN 1 — The Realtor AI Brain (the foundation)

The realtor's single source of truth. Built once, read by every other plugin. **16 skills, 3 jobs:**

### A. The front door (1)
| Skill | What it does |
|---|---|
| `realtor-brain-setup` | The ONE skill run first. Guided onboarding — Express (~30m) or Full (~60–75m) — that runs the 7 phases in order, connects Drive/email/calendar, and saves the Brain to Google Drive. |

### B. The 7 build phases (each its own skill — writes one part of the Brain)
| Phase | Skill | Captures → writes |
|---|---|---|
| 1 | `realtor-brand-persona` | Who they are, market, who they serve, voice → `profile, market, avatars, voice` |
| 2 | `realtor-offer-usp` | Services, USP, proof, lead magnets → `offer` |
| 3 | `realtor-brand-direction` | Brand *direction* (colours, fonts, logo direction, tagline — NOT design) → `brand-visual` |
| 4 | `realtor-voice-proof` | Real writing samples + testimonials/stats → `voice-samples, proof` |
| 5 | `realtor-content-engine` | Content plan: pillars, platforms, cadence, series → `content-engine` |
| 6 | `realtor-operations` | Hours, signature, booking rules, vendors, goals → `operations, vendors, strategy` |
| 7 | `realtor-compliance` | Brokerage disclaimers, license display, claims-to-avoid → `compliance` |

### C. Content skills (read the Brain, make content, write back)
| Skill | Outcome |
|---|---|
| `realtor-market-update` | Monthly market-update package: visual report + 15-min YouTube script + short-form concepts |
| `realtor-listing-content-kit` | New-listing launch pack: room-by-room YouTube walkthrough + SEO + 3 Reels |
| `realtor-neighbourhood-tour` | Drive-and-talk neighbourhood filming package (script + SEO + shorts) |
| `realtor-trending-articles` | 5 ready-to-record short-form video packages from timely local news |
| `realtor-yt-launch-system` | Every written deliverable to launch + repurpose one video *(quick launcher; defers to Plugin 3 if installed)* |

### D. Maintenance & infrastructure
| Skill | What it does |
|---|---|
| `realtor-brain-sync` | The Drive engine — pulls the Brain from Google Drive at session start, pushes every change back. Makes it persist across sessions/projects/devices. |
| `realtor-brain-health` | Audits the Brain's completeness, scores it, recommends the highest-impact thing to add next |
| `realtor-brain-migrate` | Safely upgrades an older Brain to a new structure when we change it — without losing data |

### What the Brain stores (in the agent's Google Drive → `Realtor AI Brain/`)
**`identity/` (14 — who they are, set once):** `profile · market · avatars · voice · offer · brand-visual ·
voice-samples · proof · content-engine · operations · vendors · strategy · compliance · publishing`
**`memory/` (5 — what they've done, grows daily):** `clients · listings · content-log · deadlines · performance`
**Plus:** `assets/` (logo, headshot, fonts) · `config.md` (connectors, schema version, automations) ·
`brain.md` (the index every skill reads first) · `exports/` (deliverables archive — also synced to Drive)

### The 3 laws every skill obeys
1. **READ** `brain.md` first — never re-ask what's known.
2. **WRITE** back to `memory/` — then **push to Drive** (an unsynced write is a lost write).
3. **STAY COMPLIANT** — read `compliance.md` before publishing anything public-facing.

---

# 🤖 PLUGIN 2 — Realtor AI Admin (Jarvis)
*1 skill: `realtor-ai-admin` — "The Agent Leverage OS."* The agent's assistant, reading the Brain's
`operations`, `vendors`, `voice`, and `offer`, writing to `memory/clients` + `deadlines`.
- **Scheduling:** books showings/consults with conflict-checking, guest invites, and automatic video
  links (Zoom → standing link → Google Meet); rescheduling; route optimization.
- **Inbox:** drafts emails in the agent's voice (draft-only — never auto-sends); a daily inbox sweep
  (triage, auto-label, declutter).
- **Client memory:** total recall of every client; silent auto-logging.
- **Automations:** Morning Briefing (7am) + Daily Inbox Sweep (weekdays 8:30am), ids stored in `config.md`.

---

# 📺 PLUGIN 3 — Realtor YouTube System (15 skills)
Reads the Brain (market, niche, avatars, voice, offer); never re-interviews.

- **Onboarding:** `youtube-setup`
- **The 2 core workflows:** `youtube-ideation` (W1 — ranked, packaged video ideas) · `youtube-make-video`
  (W2 — one chat = one video: packaging → script → SEO → repurpose)
- **Production engines:** `youtube-script` · `youtube-seo` · `youtube-repurpose` (1 video → blog, email,
  social, shorts) · `youtube-leads` (lead magnet map + comment-to-lead)
- **Intelligence / research:** `youtube-research` · `youtube-outliers` (competitor intel) ·
  `youtube-triggers` (local-event newsjacking) · `youtube-market-report` (monthly market video)
- **Performance & coaching:** `youtube-analytics` · `youtube-coach` · `youtube-consistency` (batch days,
  streaks, 30/60/90 ramp)
- **Optional:** `youtube-briefing` (Monday kickoff — off by default)

---

# 🎬 PLUGIN 4 — Realtor Short-Form System (7 skills + 4 shared)
Reels / TikTok / Shorts. Reads the Brain; "map, don't design" (outputs copy + direction, claude.ai/design renders).

- **Onboarding:** `shortform-setup`
- **Content workflows:** `shortform-greenscreen` (daily, reactive — timely local article → hook + talking
  points) · `shortform-talkinghead` (batchable value videos, 80/20 reach split) · `shortform-carousel`
  (no-film swipe posts, spec only)
- **Shared engine:** `shortform-optimizer` (one post → per-platform captions/hashtags/titles)
- **Publish + measure:** `shortform-publish` (schedules via Metricool / GoHighLevel / Buffer — never posts
  without approval) · `shortform-analytics` (real numbers interpreted like a coach + the 2-week review →
  `memory/performance.md`, closing the improvement loop)
- **Shared modules:** `advisor-playbook.md` (lead with a confident rec when the agent's unsure) ·
  `house-rules.md` · `output-standard.md` (organized, well-formatted Google Drive saves) · `publishing-guide.md`

---

# 🔗 How it all connects
```
                 ┌──────────────────────────────────────┐
                 │  PLUGIN 1 — THE BRAIN                 │
                 │  (Google Drive: Realtor AI Brain/)    │
                 │  identity · memory · assets           │
                 └──────────────────┬───────────────────┘
        ┌──────────────┬────────────┼────────────┬──────────────┐
        ▼              ▼             ▼            ▼              ▼
   AI Admin       YouTube       Short-Form    Brain's own    AI Video Editor
   (Plugin 2)     (Plugin 3)    (Plugin 4)    content skills  (separate)
   reads ops,     reads market, reads voice,  read all       reads brand-visual
   vendors,voice  niche, voice  market, perf  domains        + assets
        └──────────────┴────────────┴────────────┴──────────────┘
              all WRITE back to the Brain (content-log, performance, clients…)
```
Every system reads the one Brain and writes back to it. The realtor builds the Brain once; nothing ever
re-interviews them.

# 📦 Where it lives & how it's delivered
- **The plugins (the tools):** installed from one Cowork marketplace — `teamsherrard/claude-agent-os` —
  in journey order. Auto-update when synced.
- **The Brain (their data) + every deliverable:** the realtor's own **Google Drive** (`Realtor AI Brain/`),
  persistent across sessions, projects, and devices. The desktop is never the destination.
