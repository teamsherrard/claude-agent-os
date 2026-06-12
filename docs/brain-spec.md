# Realtor AI Brain — Phase 0 Spec (v0.1)

The **Brain** is the single source of truth for one real estate agent: everything Claude needs to
know about who they are, who they serve, and what they've done. Every skill and every agent
(Jarvis, the YouTube agent, the short-form agent, market updates, future systems) reads from it and
writes back to it. Skills become interchangeable apps; the Brain is the product.

This document locks the *contract* — the exact folder, every file's job, and the read/write rules —
before any skill is built or retrofitted. Get this right once; it's expensive to change after a
dozen skills depend on it.

---

## 1. Two laws every skill obeys

These two sentences are the entire system:

1. **READ `brain.md` first.** Never ask the agent something the Brain already knows.
2. **WRITE back what you learn.** A new listing updates `memory/listings.md`. A published video
   updates `memory/content-log.md`. A client conversation updates `memory/clients.md`.

Law 1 is what every existing skill already *tries* to do ("Step 1 — Read Agent Project Files") but
does fragile-y, by guessing filenames. Law 2 is brand new and is what makes the system compound:
the Brain gets smarter every time the agent uses it.

---

## 2. Identity vs. Memory — the core split

The Brain has two halves with different update cadences. Conflating them is why Jarvis's memory
today is an island, disconnected from the brand knowledge.

| | **Identity** | **Memory** |
|---|---|---|
| What | Who the agent *is* | What the agent has *done* |
| Examples | brand, voice, market, avatars, offer, colors | clients, listings, published content, deadlines |
| Changes | Once at setup; rarely after (rebrand) | Every single day |
| Written by | The setup wizard + brand/offer/brand-direction skills | Every content skill + Jarvis, automatically |
| Read by | Every skill | Skills that need to avoid repeats or recall context |

---

## 3. The canonical folder

One fixed structure. Every skill knows these exact paths. This is the integration layer.

```
realtor-brain/
├── brain.md                  # THE INDEX. Read first, always. Map + quick-reference + the two laws.
│
├── identity/                 # set once, changes rarely
│   ├── profile.md            # name, city, brokerage, booking link, socials, credentials, niche
│   ├── market.md             # communities, neighbourhoods, price ranges, why-people-move, misconceptions
│   ├── avatars.md            # target client types: pains, what-they-say, why-they-hesitate
│   ├── voice.md              # tone, never-sounds-like, signature phrases, primary CTA
│   ├── offer.md              # core offer, buyer/seller offers, guarantees, USP, why-hire-me
│   └── brand-visual.md       # colors (hex), fonts, logo path, tagline, monogram
│
├── memory/                   # grows every day
│   ├── clients.md            # per-client ledger (Jarvis owns this) — stage, notes, next action
│   ├── listings.md           # active + sold; key facts; which content has been made
│   ├── content-log.md        # everything published — date, platform, topic — prevents repeats
│   └── deadlines.md          # upcoming deadlines & follow-ups
│
├── assets/                   # the agent's real files
│   ├── logo.(png|svg)
│   ├── headshot.jpg
│   └── fonts/
│
├── config.md                 # connectors needed, timezone, default CTA, plugin version, last-updated
│
└── exports/                  # RENDERED views only — .docx lead magnets, guidebooks, dashboards
                              # NOT source of truth. Safe to delete & regenerate.
```

**Source of truth = the markdown in `identity/` and `memory/`.** The `.docx` files your skills produce
today (knowledge files, offer guidebooks, lead magnets) move to `exports/` — they become *renders for
humans*, regenerated from the markdown, never the thing skills parse.

---

## 4. `brain.md` — the index (most important file)

This is the only file a skill is *required* to read. It does three jobs:

1. **Quick-reference cache** — the 6–8 fields every skill needs (name, city, primary CTA, voice
   one-liner, brand hex colors, booking link). A lightweight skill gets everything from here without
   opening six files.
2. **The map** — what lives in each file, so a skill knows where to go for depth ("for neighbourhood
   detail → `identity/market.md`").
3. **The two laws** — restated, so even a skill that reads nothing else inherits the contract.

```markdown
# [Agent First Name] — Brain Index
*Last updated: [Month Year] · Plugin v[x.y]*

## How to use this Brain (read before running any skill)
1. READ this file first. For depth, open the specific file noted below.
2. WRITE back: new listing → memory/listings.md · published content → memory/content-log.md ·
   client note → memory/clients.md. Never let the agent repeat themselves.

## Quick reference (the fields every skill needs)
- Name: [First Last]
- Market: [City, Region]
- Primary avatar: [short name]
- Voice in one line: [e.g., "Direct, warm, locally rooted — never corporate"]
- Primary CTA: [e.g., "Book a free consult — link"]
- Brand colors: [#hex, #hex, #hex] · Fonts: [Heading / Body]
- Booking link: [url] · Socials: [@ig, @yt]

## The files
- identity/profile.md   — who they are, credentials, contact
- identity/market.md    — communities, price ranges, local intelligence
- identity/avatars.md   — target client types and their pains
- identity/voice.md     — full tone rules + never-sounds-like + signature phrases
- identity/offer.md     — services, guarantees, USP
- identity/brand-visual.md — colors, fonts, logo, tagline
- memory/clients.md     — client ledger (Jarvis)
- memory/listings.md    — listings + content-made status
- memory/content-log.md — everything published (avoid repeats)
- memory/deadlines.md   — what's due
```

---

## 5. The read contract (replaces every skill's "Step 1")

Today each skill has its own paragraph telling Claude to hunt for "Project files." We replace all of
them with one identical block:

> **Step 1 — Load the Brain.** Read `realtor-brain/brain.md`. It tells you who this agent is and where
> their detail lives. Open the specific `identity/` files you need for this skill (see per-skill map in
> §7). Never ask the agent for anything already in the Brain. If `realtor-brain/` does not exist, tell
> the agent to run **Brain Setup** first.

One block, pasted into every skill. No more guessing filenames.

---

## 6. The write contract (the new, compounding half)

Memory files use append-friendly, machine-parseable formats so any skill can safely add a row.

**`memory/content-log.md`** — a table. A content skill appends one row per piece it generates.
```markdown
| Date | Platform | Format | Topic / Angle | Listing/Area | Status | Link |
|------|----------|--------|---------------|--------------|--------|------|
| 2026-06-08 | YouTube | Long-form | June market update | Calgary | Published | url |
| 2026-06-08 | TikTok  | Reel | Top 3 features | 123 Main St | Scripted | — |
```
*Before generating, a skill scans this to avoid repeating a topic. After generating, it appends.*

**`memory/listings.md`** — one block per listing.
```markdown
## 123 Main St — Active
- Price: $X · Beds/Baths: X/X · Type: Detached
- Key features: [...]
- Content made: [x] YouTube walkthrough  [ ] Reels  [ ] Just-listed graphic
```
*The listing-content-kit checks "Content made" so it never re-scripts what's done, and ticks the box
after.*

**`memory/clients.md`** — one block per client (Jarvis is the primary writer).
```markdown
## Sarah & Tom — Buyers — Stage: Touring
- Looking: $600–700k, NW Calgary, 3bd
- Last contact: 2026-06-05 · Next action: send 3 listings by Fri
- Notes: pre-approved, relocating from Toronto, baby due Sept
```

---

## 7. Grounding: how the Brain feeds the REAL skills

This schema isn't theoretical — it's reverse-engineered from what your skills already consume and
should produce. Mapping proves the fit:

| Skill | Reads from Brain | Writes to Brain (new!) |
|---|---|---|
| **brand-persona** *(setup)* | — | `identity/profile, market, avatars, voice` |
| **offer-usp** *(setup)* | profile, avatars | `identity/offer.md` |
| **brand-direction** *(setup)* | profile, voice, avatars | `identity/brand-visual.md` (direction → Claude Design) |
| **market-update** | market, voice, brand-visual | `memory/content-log.md` |
| **listing-content-kit** | voice, offer, brand-visual | `memory/listings.md`, `content-log.md` |
| **neighbourhood-tour** | market, avatars, voice | `content-log.md` |
| **trending/local-content** | profile (city), avatars, voice | `content-log.md` |
| **yt-launch-system** | profile, avatars, voice | `content-log.md` |
| **article-greenscreen** | profile, voice, brand-visual | `content-log.md` |
| **Jarvis** | profile, voice, offer | `memory/clients, deadlines` |

Every skill's existing "look for the brand personality file / market file / offer file" maps cleanly
onto `identity/`. The right column is the upgrade: today all of these write nothing back.

---

## 8. Source of truth vs. rendered views

| Thing | Status |
|---|---|
| `identity/*.md`, `memory/*.md` | **Source of truth.** Canonical. What skills parse. |
| `.docx` knowledge file, offer guidebook, lead magnets, dashboard | **Renders.** Live in `exports/`, synced to the agent's Drive as their deliverables archive. Regenerable from source. |

This flips today's model, where the `.docx` *is* the knowledge and nothing can reliably parse it.

---

## 9. Decisions — LOCKED (2026-06-08)

1. **File granularity** — ✅ **Split** `identity/` into 6 files (maps to how skills think).
2. **Folder location** — ✅ Fixed home **`~/realtor-brain/`** (absolute, session-independent; every
   skill resolves the same path every run).
3. **Memory format** — ✅ **Markdown** tables/blocks (human-readable + parseable).
4. **Product name** — ✅ **Realtor AI Brain** (folder slug `realtor-brain/`).

---

## 10. What Phase 1 builds on top of this

- `realtor-brain-setup` — the one-door wizard that scaffolds this exact tree, runs the interviews in
  order, and connects Gmail/Calendar.
- Retrofit the 3 setup skills to write canonical markdown into `identity/`.
- Retrofit the content skills with the §5 read block and §6 write-back.
- Fold Jarvis's `memory.json` into `memory/`.
- Package everything as one Cowork plugin.
```
