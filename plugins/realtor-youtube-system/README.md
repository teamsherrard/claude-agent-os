# Realtor YouTube System

An always-on **YouTube brain for real estate agents.** It handles everything *around* the camera —
deciding what to film, why it'll work, what to say (in the agent's own voice), how to rank it, how to
turn views into leads, and how to coach the agent to keep going. It never films, edits, or designs.

Each agent installs this plugin once and runs it in **their own** Google + YouTube accounts. There is
no manual cloning — the setup skill provisions everything per agent.

## The realtor's experience — just two workflows

Everything the agent does collapses into two things. **One chat = one video.**

1. **Ideation** (`youtube-ideation`) — "what should I film?" → a few ready ideas → they pick one.
2. **Make This Video** (`youtube-make-video`) — they open a new chat (that chat *is* the video) → it
   produces the script, the SEO + 3 thumbnail texts, the lead magnet, and (after filming) the
   repurposing pack — all saved to that video's folder.

**Everything is on-demand.** The agent asks when they're ready to create — nothing scheduled, nothing to
break, and the data is fresh at the moment they ask. (An optional Monday Kickoff exists for agents who
explicitly want a scheduled email; off by default.)

Everything else (research, competitor intel, analytics, coaching) is the **engine** those two workflows
call — it runs invisibly and feeds better ideas into Ideation, so the agent never *has* to learn it.

**Flexible, but always organized the same way.** The agent can ask for just one piece anytime — *"just
write a script for my idea," "only do the SEO for a video I already made," "repurpose this one"* — and it
simply happens **inside that video's one chat.** One chat = one video, everything for it in one place;
nothing is a separate workflow.

---

## How it's delivered

A standalone Claude Code plugin distributed from this GitHub repo (which doubles as the marketplace).
An agent installs it with one line, runs **"set up my YouTube system,"** and they're live.

One repo = the single source of truth. Improve it once → every agent gets the update.

---

## Build phases

| Phase | What | Status |
|-------|------|--------|
| **1. Foundation** | Brain + Setup + Voice Capture + Drive provisioning | ✅ built |
| **2. Intelligence** | Research + Ideation engine + SEO + Outliers + Local triggers + Market Report | ✅ built |
| **3. Creation** | Script Studio + Lead Engine + Repurposing | ✅ built |
| **4. Growth loop** | Analytics + Coach + Consistency Engine | ✅ built |
| **5. Monday Kickoff** | Optional + off by default — the core is fully on-demand | ✅ built |
| 6. Ship | Marketplace packaging + self-serve onboarding | ⬜ next |

---

## Structure

```
realtor-youtube-system/
├── .claude-plugin/plugin.json     # plugin manifest
├── shared/                        # cross-skill references — every skill applies these
│   ├── house-rules.md             #   voice · compliance · formatting · state · plain talk · the standard
│   ├── seo-knowledge-base.md      #   2026 SEO: intent, titles, tags, keyword library
│   └── idea-templates.md          #   plug-and-play video idea templates
├── skills/                        # ★ = the two realtor-facing workflows; the rest are the engine they call
│   ├── youtube-ideation/          # ★ Workflow 1 — Ideation (the entry point; includes the idea engine)
│   ├── youtube-make-video/        # ★ Workflow 2 — Make This Video (one chat = one video)
│   ├── youtube-setup/             # onboarding: reads AI Brain, captures voice, provisions Drive
│   ├── youtube-research/          # Research Engine (market · news · trends — fresh at ask-time)
│   ├── youtube-outliers/          # Competitor intelligence (strict outliers + evergreen recreate list)
│   ├── youtube-market-report/     # Monthly Market Report (data → deck → agent records a Loom)
│   ├── youtube-triggers/          # Local-event triggers (newsjacking)
│   ├── youtube-seo/               # SEO Engine
│   ├── youtube-analytics/         # Analytics (reads her YouTube Studio export)
│   ├── youtube-script/            # Script Studio (voice-matched, ships complete)
│   ├── youtube-leads/             # Lead Engine (lead-magnet maps, inside the video's chat)
│   ├── youtube-repurpose/         # Repurposing Engine (blog/email/social/shorts)
│   ├── youtube-coach/             # Coach
│   ├── youtube-consistency/       # Consistency Engine (batch days · month plans · 30/60/90)
│   └── youtube-briefing/          # OPTIONAL Monday Kickoff (off by default)
└── README.md
```

Every skill reads the agent's **AI Brain** and applies `shared/house-rules.md`.

---

## The Brain

Everything reads one config — **the Brain** — so all output is unmistakably *that agent's*:
niche, market(s), avatars, offer, voice, channel, and goals. Swap the Brain = a different agent's
entire system. Phase 1 is what builds it.

## Agent vs Team — who touches what
The whole design keeps technical work off the realtor:
- **The realtor (in Cowork):** their Brain (a Claude Project) and the skills — all on-demand (plus an
  optional Monday kickoff). They never open a terminal, an API console, or this repo.
- **The team (in Claude Code):** builds + maintains this plugin, holds the single competitor-data API
  key (backend), and later the one-click "Connect YouTube with Google" OAuth app.
- **Analytics (V1):** the realtor exports a CSV from YouTube Studio and uploads it — no keys, no OAuth.

Positioning: *"We build advanced AI systems behind the scenes so it's simple for you"* — never *"learn Claude Code."*
