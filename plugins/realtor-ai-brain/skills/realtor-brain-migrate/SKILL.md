---
name: realtor-brain-migrate
description: >
  Upgrades an agent's Realtor AI Brain to the latest structure when the system changes how the brain is
  organized. The plugin (skills) auto-updates from the marketplace, but the agent's brain DATA does not
  reshape itself — this skill safely migrates an older brain to the current schema (renaming files,
  adding new sections, moving fields) without losing any of the agent's content.

  Trigger on: "upgrade my brain", "upgrade my brain structure", "migrate my brain", "is my brain up to
  date", "my brain looks out of date", "fix my brain structure", or run this after a plugin update if a
  skill reports the brain schema is behind. Do NOT trigger when the agent wants to change their
  information ("update my offer", "update my brand", "update my profile") — those edit identity
  content via the phase skills, not the brain's structure.
---

# Realtor Brain Migration

**The problem this solves:** when we ship a structural change (rename a file, add a required section,
move a field), the new *skills* arrive automatically via the marketplace — but each agent's *brain*
(`~/realtor-brain/`) is still in the old shape. This skill upgrades the brain to match, safely.

## Step 1 — Compare versions
1. Read `~/realtor-brain/config.md` → **Brain schema** (the version the brain is currently in).
2. The **current schema this skill targets is: `2`** *(maintainers: bump this line when you add a migration below)*.
3. **If brain schema == current →** tell the agent "Your brain is up to date — nothing to migrate." Stop.
4. **If brain schema < current →** apply each migration below in order, from the brain's version up to current.
5. **Always protect first:** before changing anything, push the current brain to Drive via
   `realtor-brain-sync` (and optionally copy `~/realtor-brain/` to `~/realtor-brain.bak/`). Never
   migrate without a safety copy in Drive.

## Step 2 — Apply migrations (in order)
Apply only the steps newer than the brain's current schema. After each, update **Brain schema** in
`config.md`. Preserve ALL existing agent content — migrations move/rename/add, never delete data.

### MIGRATIONS LOG
*(Maintainers: every time the brain structure changes, bump the "current schema" above and add an entry
here describing the exact transformation. Each entry is idempotent and safe to re-run.)*

- **→ 1 (baseline, 2026-06):** initial structure — `identity/` (profile, market, avatars, voice, offer,
  brand-visual, voice-samples, proof, content-engine, operations, vendors, strategy, compliance),
  `memory/` (clients, listings, content-log, deadlines), `assets/`, `config.md`, `brain.md`, `exports/`.
  No migration needed; this is the starting point.

- **1 → 2 (2026-06):** the brain gained the capture / performance / publishing layer. Each step is
  idempotent — skip anything that already exists; never delete data.
  1. Create `memory/ideas.md` and `memory/performance.md` if missing — copy their headers from the
     shipped template (`realtor-brain-setup` skill → `references/brain-template/realtor-brain/memory/`).
  2. Create `identity/publishing.md` if missing (same template — it stays mostly blank until the
     Short-Form System's setup writes it).
  3. In `brain.md`: add the three files to "The files" map (descriptions per the template `brain.md` —
     `memory/ideas.md` capture backlog, `memory/performance.md` what's-working review,
     `identity/publishing.md` short-form posting setup), and add law 2's routing lines for performance
     reviews (→ `memory/performance.md`) and on-the-go captures (→ `memory/ideas.md` via
     **realtor-capture**) if they aren't already there.

## Step 3 — Finalize
- Confirm the brain now reports the current schema in `config.md`.
- Run a quick read of `brain.md` + a couple of identity files to confirm nothing broke.
- Tell the agent: *"Your brain is upgraded to the latest structure — every skill will keep working, and
  nothing was lost."* If a `.bak` copy was made and all looks good, offer to remove it.

## Note for maintainers
This is the safety net that lets us evolve the brain structure across hundreds of installed agents.
**Process when changing brain structure:** (1) change the template + skills, (2) bump "current schema"
in this skill, (3) add a MIGRATIONS LOG entry with the exact transform, (4) bump plugin version + ship.
Agents run "upgrade my brain" (or a skill prompts them) and upgrade safely.
