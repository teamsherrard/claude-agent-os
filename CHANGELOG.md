# Changelog

All notable changes to the Realtor AI Brain. Versions follow `MAJOR.MINOR.PATCH`.

## [0.11.1] — 2026-06-12

The Brain is the hub — ecosystem boundaries made explicit (decision: do NOT slim the Brain plugin).

### Changed
- **Brain Contract** now defines the ecosystem: the Brain is the realtor's FIRST system; the Realtor
  YouTube System (separate plugin) reads the Brain at setup + per-video and should write published
  videos back to `memory/content-log.md`; Jarvis ships in-plugin; Video Editor + Short-Form System
  follow the same read/write pattern.
- **`realtor-yt-launch-system` defers to the dedicated YouTube System when installed** — removed the
  colliding "realtor YouTube system" trigger phrase; it remains the built-in quick launcher for agents
  without the full system.
- **Setup hand-off** now points to the ecosystem: after the Brain is built, it suggests "set up my
  YouTube system" (and notes the Brain powers every other Team Sherrard system).

## [0.11.0] — 2026-06-12

Critical fixes from the full pre-GitHub sweep — and **Jarvis (the AI Admin) ships in the plugin**.

### Added
- **`realtor-jarvis` skill** (The Agent Leverage OS, v1: Scheduling · Inbox · Client Memory):
  auto-booking with conflict guard + guest invites + automatic video links (Zoom → standing link →
  Google Meet — never asks), client self-booking with graceful degradation (Cal.com → own booking
  link → proposed times), rescheduling, route optimizer, email drafts in the agent's voice
  (draft-only by design — the approval model), thread summary, total client recall, silent
  auto-logging, and task/promise follow-ups. Obeys the **Mike Test** speed rules: one message in →
  one one-line confirmation with embedded proof, no clarifying questions in the common case.
- **"Set up my Jarvis" one-time flow**: connector checks (incl. Zoom create-capability probe),
  permission smoothing ("Always allow"), Gmail label taxonomy, dashboard artifact, and two
  scheduled automations — **Morning Briefing** (7am; delivered as the task's own output since the
  Gmail connector cannot send) and **Daily Inbox Sweep** (weekdays 8:30am: triage + auto-label +
  waiting-on + declutter in one pass). Runtime ids live in the brain's `config.md`.
- Jarvis follows the Drive-sync law: pull-if-missing at Step 0 (and ALWAYS in scheduled tasks),
  push after every memory write. `clients.md` treated as PII (stays in the agent's brain + their
  own Drive only).
- Brain template: `config.md` gains Zoom/Cal.com connector rows + a Jarvis runtime section;
  `realtor-operations` now captures a standing virtual-meeting link; Setup Step 6 lists Zoom
  (recommended) and Cal.com (optional).
- Docs: `jarvis-v2-parking.md` (meeting notes, transaction coordinator, document/file systems);
  `product-framing.md` (the Mike Test acceptance gate + 5 outcomes) moved into `docs/`; the
  drifted `docs/jarvis-retrofit/` staging folder is gone — the skill is the single source of truth.

### Fixed
- **Writes now survive the session (durability).** Every skill that writes to the Brain — all 7
  producers and all 6 content skills — now pushes to Drive via `realtor-brain-sync` immediately after
  writing, and the write law in `brain.md` carries the rule ("an unsynced write is a lost write").
  Previously only Setup's finalize step pushed, so standalone runs (e.g. "update my offer", a content
  skill's log write) were silently lost when Cowork wiped the sandbox.
- **Setup Step 0 now pulls from Drive before deciding fresh vs returning.** Checking only the local
  folder would re-onboard a returning agent (local is always empty at session start) and overwrite
  their real Brain in Drive with a fresh empty one. Rebuild-from-scratch now also requires explicit
  confirmation.
- **Trigger collisions resolved** — removed "set up my brain" from `realtor-brand-persona` (belongs to
  Setup); `realtor-brain-migrate` no longer claims "update my brain" (now "upgrade my brain", with an
  explicit do-not-trigger note for content edits like "update my offer/brand").

## [0.10.1] — 2026-06-10

### Fixed
- **Cowork zip-upload validation failure.** Diffed against a known-valid plugin zip: the experimental
  `"prompt"`-type hooks file and extra manifest fields (`skills`, `hooks`, `repository`) were the
  difference. `plugin.json` reduced to the proven minimal shape (skills auto-discover); hooks excluded
  from the zip build; `hooks/hooks.json` rewritten to the documented `command` type (ships via the
  GitHub install, pending live verification).

## [0.10.0] — 2026-06-09

The Brain now lives in Google Drive, so it persists across Cowork sessions, projects, and devices.

### Changed (foundational)
- **The Brain's permanent home is the realtor's Google Drive** (`Realtor AI Brain` folder), not the
  local sandbox. Cowork's local storage is wiped between sessions — so the brain syncs from Drive at
  session start and pushes back after changes. Local `~/realtor-brain/` is now just a working copy.
- **`realtor-brain-backup` → `realtor-brain-sync`** — two-way Drive⇄local sync (pull at start, push
  after writes, restore on a new machine). Supersedes one-way backup.
- **Google Drive is now REQUIRED** in Setup (was optional); Setup pushes the brain to Drive at the end.
- **SessionStart + Stop hooks** (`hooks/hooks.json`) — pull the brain from Drive at session start so
  EVERY session (even plain chat) is brain-aware, and push changes back on stop. ⚠️ *Hook firing in
  Cowork must be verified live — it's the one piece we couldn't test.*

### Added
- **`docs/BRAIN-CONTRACT.md`** (#6) — how any system (Video Editor, Jarvis, future agents) reads/writes the brain.
- **Privacy posture** (#10) — the brain (incl. client PII) is the agent's private data, lives only in their Drive; the agency never holds it.

## [0.9.0] — 2026-06-09

Bug fixes from the full quality sweep.

### Fixed
- **Compliance now enforced** — all 6 content skills read `identity/compliance.md` and append the
  required brokerage disclaimer + license # before publishing, and avoid the "claims to avoid" list.
  (Previously only `brain.md` mentioned it, which skills didn't reliably act on — content could ship
  with no disclaimer.)
- **Placeholder guard** — content skills now detect `[bracketed]` template text from a half-built brain
  and treat that field as missing (ask or skip) instead of emitting literal brackets in finished content.

## [0.8.0] — 2026-06-09

Phase 5 (Content Engine) simplified for week-one beginners.

### Changed
- **Phase 5 now asks only 2 things** (which platforms + how much they can post) and **generates the rest
  only when the agent is unsure** — pillars, signature series, and video default are drafted from the
  Brain and confirmed, never dumped over a real answer. ~3–5 min (was ~10).
- **Trimmed `content-engine.md`** to durable items only — pillars, platforms, cadence, series, video
  default. **Hashtags and hook styles are no longer stored** (the content skills generate those per
  piece; CTAs already live in `voice.md`).
- Added a system-wide setup principle: **"ask first, generate only when they're stuck"** — don't
  overwrite a real answer with a guess.

## [0.7.0] — 2026-06-09

Phase 3 re-scoped: brand **direction**, not design.

### Changed
- **Phase 3 is now `realtor-brand-direction`** (was `realtor-brand-guide`). It captures the brand
  *direction* only — colours, vibe, font + logo direction, tagline → `identity/brand-visual.md`. It no
  longer designs anything (no logo, no HTML brand guide, no Canva brief, no `assets/` generation). The
  agent takes the direction into **Claude Design (claude.ai/design)** to build the actual visuals.
- Removed the heavy design references (color-strategy, font-pairings, skylines, canva-handoff, etc.) —
  the old full-design version stays in git history.
- Updated conductor, brain template, `brain.md` index, and docs to match. Still 17 skills.

## [0.6.0] — 2026-06-09

Self-maintenance layer — the brain can now audit, back up, and upgrade itself.

### Added
- **`realtor-brain-health`** — audits brain completeness, scores it, recommends the highest-impact next add.
- **`realtor-brain-backup`** — backs up / restores the brain to the agent's Google Drive (durability +
  multi-device); updates "Last backup" in `config.md`.
- **`realtor-brain-migrate`** — the schema safety net: upgrades older brains to the current structure
  when we change it, without losing data. Includes a maintainer MIGRATIONS LOG process.
- **Brain schema version** + **Last backup** fields in `config.md` (the migration/durability anchors).

Plugin now bundles **17 skills**. The brain system is functionally complete — all 10 domains capturable,
read/write across all skills, and self-maintaining. Remaining: wire the Jarvis skill (needs its source)
and push to a public GitHub marketplace.

## [0.5.0] — 2026-06-09

The full brain — all 10 identity domains are now capturable. Phases 4–7 added.

### Added
- **Phase 4 — `realtor-voice-proof`**: real writing samples (authentic voice) + proof library
  (testimonials, stats, case studies) → `identity/voice-samples.md`, `proof.md`.
- **Phase 5 — `realtor-content-engine`**: pillars, cadence, platforms, hashtags, CTAs, hooks, video
  style → `identity/content-engine.md`.
- **Phase 6 — `realtor-operations`**: working hours, email signature, booking rules, follow-up cadence,
  vendor network, goals → `identity/operations.md`, `vendors.md`, `strategy.md` (the Jarvis foundation).
- **Phase 7 — `realtor-compliance`**: brokerage disclaimers, license display, fair-housing, claims to
  avoid → `identity/compliance.md`.
- Seven new identity template files; brain.md file-map updated.
- A **third law** in `brain.md` — **STAY COMPLIANT**: every skill reads `compliance.md` before
  publishing and appends the required disclaimer + license #. Propagates to all skills via `brain.md`.

### Changed
- **Setup conductor** now offers **Express (Phases 1–3, ~30 min)** vs **Full (Phases 1–7, ~60–75 min)**
  and runs Phases 4–7 as their real skills. Plugin now bundles **14 skills**.

## [0.4.0] — 2026-06-08

Phase 3 (Visual Brand) — the Brain now holds the agent's visual identity.

### Added
- **`realtor-brand-guide`** skill brought into the plugin and retrofitted: reads the Brain in Step 0A,
  designs the 5-colour palette + two fonts + logo + tagline, **writes `identity/brand-visual.md` and
  saves logo/headshot to `assets/`**, and renders the HTML brand guide + Canva brief to `exports/`.
  This is also the brand config the **AI Video Editor** consumes.

### Changed
- **Setup conductor** now runs Phase 3 (Brand Guide) as the real skill, replacing the lightweight
  embedded visual interview (removed `interview-visual.md`). Plugin now bundles 10 skills.

## [0.3.0] — 2026-06-08

Every skill is now Brain-native, and the producers write the Brain directly.

### Added
- **Full brain inventory** defined (10 domains: person, voice+samples, market, avatars, offer+proof,
  visual+assets, content engine, operations/vendors, strategy, compliance) with a phased-setup roadmap.
- **All 6 consumer skills** retrofitted to the Brain contract — `realtor-market-update`,
  `realtor-listing-content-kit`, `realtor-neighbourhood-tour`, `realtor-trending-articles`,
  `realtor-yt-launch-system`, `realtor-article-greenscreen`: each loads `brain.md` (Step 1) and writes
  back to `memory/` (content-log; listing-kit also writes `listings.md`). Outputs save to `exports/`.
- **Both producer skills** retrofitted — `realtor-brand-persona` now writes the four `identity/` files
  (profile, market, avatars, voice); `realtor-offer-usp` writes `identity/offer.md`. The `.docx`
  becomes a *render* in `exports/`, not the source of truth. No more "upload to a Claude Project."

### Changed
- **Setup wizard is now a thin conductor** — it runs the real Brand Persona and Offer USP skills in
  sequence (single source of truth) instead of carrying duplicate copies of their questions. Removed
  the embedded `interview-brand.md` / `interview-offer.md`.

## [0.1.0] — 2026-06-08

First working foundation.

### Added
- **Brain spec** (`docs/brain-spec.md`) — the contract: fixed `~/realtor-brain/` structure, the
  identity-vs-memory split, and the two laws (read `brain.md` first; write back to `memory/`).
- **Brain template** — the scaffold the setup wizard fills (bundled in the setup skill's references).
- **`realtor-brain-setup`** skill — the one front-door wizard: scaffolds the Brain, runs the brand +
  offer + visual interviews in order, connects Gmail/Calendar, writes `brain.md`. Resumable.
- **`realtor-market-update`** skill — retrofitted to the Brain contract as the reference pattern:
  loads the Brain (Step 1), checks the content log to avoid repeats, writes deliverables back to
  `memory/content-log.md` (Phase 7).
- **Plugin + marketplace** packaging — installable via `/plugin marketplace add` + `/plugin install`,
  auto-updating on push.
- **Test fixture** — a fully-filled sample Brain (`test/sample-brain/`).

### Not yet done
- Retrofit remaining consumer skills (listing-kit, neighbourhood-tour, local-content, yt-launch,
  greenscreen).
- Retrofit producer skills (brand-persona, offer-usp, brand-guide) to write into `identity/`.
- Fold Jarvis's memory into the Brain's `memory/`.
- New-client provisioning flow for the agency.
