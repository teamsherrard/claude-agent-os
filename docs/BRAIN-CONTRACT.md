# The Brain Contract

**How any system reads and writes a realtor's AI Brain.** Every skill in this plugin follows it — and
so should every *external* system that wants to be brain-powered (the AI Video Editor, Jarvis, future
agents). If you're building something new that should "know the realtor," implement this and you're done.

---

## Where the Brain lives
**Permanent home: the realtor's Google Drive** (`Realtor AI Brain` folder). Cowork's local sandbox is
wiped between sessions, so `~/realtor-brain/` is only a **per-session working copy** — synced down from
Drive at session start and pushed back after changes (via the `realtor-brain-sync` skill / the
SessionStart+Stop hooks). One brain per realtor. Never in any repo. Structure (mirrored in Drive and the
local working copy):

```
~/realtor-brain/
├── brain.md          ← the index — READ THIS FIRST, always
├── identity/         ← who the agent is (profile, market, avatars, voice, offer, brand-visual,
│                        voice-samples, proof, content-engine, operations, vendors, strategy, compliance)
├── memory/           ← what they've done (clients, listings, content-log, deadlines)
├── assets/           ← logo, headshot, fonts
├── config.md         ← connectors, timezone, Brain schema version
└── exports/          ← rendered docs — DISPOSABLE, never source of truth
```

## The 3 laws (every system obeys)
1. **READ `~/realtor-brain/brain.md` first.** It's the index + quick-reference. Open the specific
   `identity/` files you need. Never ask the agent for anything the Brain already holds.
2. **WRITE back what you learn** → `memory/`: published/scripted content → `content-log.md`; new listing
   → `listings.md`; client note → `clients.md`; deadline → `deadlines.md`.
3. **STAY COMPLIANT.** Before publishing anything public-facing, read `identity/compliance.md`: append
   the required disclaimer + license #, and avoid its "claims to avoid" list.

## The read protocol
1. If `~/realtor-brain/` is missing → tell the agent to run **Realtor AI Brain — Setup** first. Don't proceed blank.
2. Read `brain.md`. For depth, open only the `identity/` files relevant to your task.
3. **Guard placeholders:** if a field still contains `[bracketed]` template text, treat it as missing —
   ask or skip; never emit brackets into output.
4. Respect `config.md` **Brain schema** — if it's older than your system expects, tell the agent to run
   **"update my brain"** (the migration skill) before relying on structure.

## The write protocol
- Append to `memory/` files in their existing format (tables/blocks). Don't rewrite history; add to it.
- Save finished deliverables to `exports/` (disposable). Source of truth always stays in `identity/`/`memory/`.

## For EXTERNAL systems specifically
- **AI Video Editor** → read `identity/brand-visual.md` for colours (hex) + fonts, and `assets/` for the
  logo/headshot. That's the "brand config." (Requires running on the same machine as `~/realtor-brain/`.)
- **Jarvis / AI admin** → read `identity/operations.md` (hours, signature, booking rules),
  `identity/vendors.md` (referrals), `identity/voice.md` (email tone), `identity/offer.md`; write to
  `memory/clients.md` + `memory/deadlines.md`.
- **Any future agent** → declare which `identity/` domains you read and which `memory/` files you write.
  You never re-interview the agent — the Brain already knows them.

## Privacy & ownership
The Brain — including client names and notes in `memory/clients.md` — is the **agent's private data.**
It lives only on their machine and in **their own** Google Drive. The system/agency never stores,
transmits, or holds it. Treat `clients.md` as PII: keep it inside `~/realtor-brain/` + the agent's own
Drive, never anywhere else.

## Don't
- Don't store volatile data in the Brain (live market stats, today's date-sensitive numbers) — fetch
  those live per run. The Brain holds *durable agent-truth* only.
- Don't treat `exports/` as source. Don't overwrite `memory/` history. Don't write brokerage-confidential
  or client PII anywhere outside the user's own `~/realtor-brain/` + their own Drive backup.
