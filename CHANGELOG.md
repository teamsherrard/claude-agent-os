# Changelog

All notable changes to the Realtor AI Brain. Versions follow `MAJOR.MINOR.PATCH`.

## [0.21.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.7.0 — organized Drive output + great formatting
- **`shared/output-standard.md`** — every document the system makes now saves to the agent's Google Drive,
  in the right folder, with a consistent name, formatted to look genuinely good:
  - **Folder structure:** `[Agent Name] — Short-Form System/Content/[YYYY-MM · Month]/` for content +
    `/Performance/` for reviews (own library, parallel to the YouTube System folder).
  - **Naming convention:** content = `[YYYY-MM-DD] · [Format] · [Topic]`; reviews =
    `[YYYY-MM-DD–DD] · Performance Review`. ISO dates sort themselves; month folders made on demand.
  - **Formatting (the fix for the ugly docs):** Cowork's Drive connector only converts `text/plain`→Google
    Doc (`.docx`/HTML don't convert), so docs are built as **well-structured plain text** — title + meta
    line, ALL-CAPS headers with em-dash dividers, generous spacing, bullets, cues on their own lines.
    Clean and scannable, never a wall of text. (Mirrors the proven YouTube-System approach.)
- Wired the save step into green screen, talking head, carousel, and the analytics 2-week review; setup
  now provisions the Drive folder; house-rules §9 makes "save organized + well-formatted" universal.

### Brain (Plugin 1) → v0.16.0
- `brain.md` template now indexes `identity/publishing.md` (companion to the 0.19.0 `memory/performance.md`).

## [0.20.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.6.0 — wired to the real Metricool tools
- With Metricool connected, hardened the publish + analytics skills to call the **actual Metricool MCP
  tools by name** (referenced bare, since the per-connection server-id prefix varies): `getBrandSettings`,
  `getBestTimeToPostByNetwork`, `createScheduledPost`, `getScheduledPosts`, `updateScheduledPost`,
  `getAnalyticsAvailableMetrics`, `getAnalyticsDataByMetrics`.
- **Video confirmed:** `createScheduledPost.info.media` accepts public URLs to image *or video* files, so
  Reels/TikToks/Shorts schedule fully hands-off (Path A). Per-network rules encoded (Reels need video,
  IG/TikTok need media, YouTube needs title + madeForKids, X ≤280, Bluesky ≤300). Hybrid path kept only
  for videos not at a shareable URL.
- Analytics flow set to Metricool's real shape: `getBrandSettings` → `getAnalyticsAvailableMetrics`
  (discover metric IDs, incl. ads) → `getAnalyticsDataByMetrics` (brandId + date range + metric IDs).
- Brain: `identity/publishing.md` now scaffolded in the template + listed in `brain.md` (companion to the
  `memory/performance.md` added in 0.19.0).

## [0.19.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.5.0 — Metricool scheduling + analytics live
With the agent's **Metricool MCP connected**, the system now does the full publish + measure loop in
plain language:
- **`shortform-publish`** — "schedule this for tomorrow at 10am," "post these at my best times,"
  "post this to Instagram and TikTok." Confirms, schedules through the connected tool (Metricool /
  GoHighLevel / Buffer), uses best-time slots when no time is given, handles video (full-attach or
  hybrid), logs to the Brain. Never auto-posts without a clear go-ahead.
- **`shortform-analytics`** (+ `references/metrics-guide.md`) — the data brain. Handles any "analyze my
  last 10 posts / analyze my ads / how did my reels do / what's my data" by pulling real numbers from the
  connected tool and **interpreting them like a coach** (what's working, the weak link + why, the fix) —
  never a number dump. Also runs the **2-week performance review** and writes it to
  `memory/performance.md`, which the content workflows read so each round leans on what worked (the
  improvement loop is now closed).
- Both connector-agnostic (Metricool default, GoHighLevel for agents who have it) and screenshot-fallback
  for analytics if no connector.

### Brain (Plugin 1) → v0.15.0
- Added **`memory/performance.md`** to the Brain (template + `brain.md` index + write-back law) — the home
  for content performance, written by the 2-week review and read before planning new content.

## [0.18.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.4.0 — publishing wired
- **`shared/publishing-guide.md`** — the system can now schedule/post once the agent connects a tool,
  connector-agnostic: **Metricool** (default), **GoHighLevel** (Social Planner, for agents who have it),
  **Buffer** (fallback), or **manual**. Golden rule baked in: **never post without showing the post and
  getting explicit approval.** Handles best-time scheduling, the free-plan 20-post guardrail, and the
  media/video fallback (Path A full-attach vs Path B hybrid: schedule caption+slot, agent drops the video).
- Wired into green screen, talking head, and carousel (their "offer to schedule" step) + setup's connect step.
- **Metricool MCP endpoint verified** (`https://ai.metricool.com/mcp`): live, standard OAuth 2.1 with
  Dynamic Client Registration + PKCE (scopes `mcp:read`/`mcp:write`) → one-click sign-in in Cowork, no
  tokens. Can view brands, pull analytics, and create/schedule posts; works on the free plan (20-post
  cap). Only open item: confirm video-on-schedule live (both paths are handled either way). Details +
  the ~10-min live check in `docs/shortform-publishing-layer.md`.

## [0.17.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.3.0 — the advisor
- **`shared/advisor-playbook.md`** + house-rules #8: the system now acts as the agent's **short-form
  expert** when they're unsure. Realtors often say *"I don't know,"* *"what do you think?"*, *"you pick,"*
  or *"is this any good?"* — the skills now **lead with a confident, data-grounded recommendation** (never
  bounce the question back, never dump a menu on an overwhelmed agent), default to action, and give honest
  expert feedback with a spine. Includes the real short-form-for-realtors point of view (hook is 90%,
  local+timely beats generic, consistency > perfection, 80/20 reach, don't sell every post) and decision
  heuristics for the common "I'm not sure" moments.
- Wired into every workflow at its decision point (setup, green screen, talking head, carousel) so the
  advisor move fires exactly where agents hesitate.

## [0.16.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.2.0 — the three workflows + onboarding
- **`shortform-talkinghead`** — batched value videos: an 80/20 topic list (80% broad reach, 20% niche)
  → scripts with 15/30/45-second cuts + a teleprompter version + a bullet version → per-platform
  packaging. (Absorbs the doc's "Script Builder.")
- **`shortform-carousel`** — no-film value posts, **spec only**: cover hook + 6–9 slides of copy +
  design direction in words + Instagram/Facebook caption. The agent builds slides in claude.ai/design;
  nothing is rendered here.
- **`shortform-setup`** — one-time onboarding mirroring the YouTube setup pattern: reads the Brain,
  re-asks nothing, captures only short-form specifics (platforms, cadence, lead magnets if missing,
  posting method), explains the system plainly, and gets the agent to their first post.
- **`shared/house-rules.md`** — the plugin's standard, applied by every skill: **talk to the agent
  plain and warm, never technical** (realtors aren't developers and overwhelm fast); read the Brain
  first / never re-ask; map-don't-design; stay compliant; earn the "why not just use ChatGPT" test.
- **Optimizer hardened** (from the QA sweep): now also outputs **cover/thumbnail text + on-screen text**
  for video formats, and carries the **full CTA map** (DM "BUYER"/"SELLER"/"RELOCATION", market report,
  neighbourhood guide) routed to real lead magnets. All workflows read the full Brain (added `offer.md`
  + `voice-samples.md`).
- **Posting is bring-your-own-platform:** GoHighLevel (its official MCP Social Planner) for agents who
  already use it, Metricool as the easy default, Buffer as a fallback, or manual — never forced onto a
  new platform. (Publish + 2-week analytics loop wired in a later release; see
  `docs/shortform-publishing-layer.md`.)

### Brain (Plugin 1) → v0.14.0
- **Lead magnets are now first-class Brain data.** Added a "Lead magnets" section to the `offer.md`
  template + a capture step (Q7) in `realtor-offer-usp` (interview guide + USP knowledge template), so
  the agent's free guides/checklists (with DM keywords) are stored at setup. This is what content CTAs
  point to — and it closes the "don't make the agent re-answer" gap the QA sweep found.
- **Removed `realtor-article-greenscreen`** — fully superseded by `shortform-greenscreen` (its only
  unique value was PNG green-screen backgrounds, which are dropped under the map-don't-design rule).
  Brain plugin is now 16 skills.

## [0.15.0] — 2026-06-13

### Added
- **Realtor Short-Form System joins the shelf as Plugin 4** (`plugins/realtor-shortform-system/`,
  v0.1.0) — the first slice of the routine-based short-form OS (sibling to the YouTube System).
  Ships two skills:
  - `shortform-greenscreen` — the **Daily Green Screen** workflow: finds the single most timely local
    article and delivers a word-for-word hook + 4–6 talking points (deliberately NOT a script, for
    natural reactive delivery) + on-screen text + per-platform captions. Reactive/daily by design;
    never batched. **Text only — no PNG backgrounds or designs** (agent holds the article on their
    phone or builds a background in claude.ai/design).
  - `shortform-optimizer` — the **shared Platform Optimizer** every short-form workflow calls: one
    post → Instagram+Facebook (caption + hashtags), TikTok (one-line caption, no line breaks),
    YouTube Shorts (title + description + tags). Canonical platform rules in
    `references/platform-rules.md`; reads voice/market/compliance from the Brain.
- Design principle locked across the system: **map, don't design** — short-form skills output copy,
  frameworks, and direction as text; claude.ai/design renders. Consequence: `realtor-article-greenscreen`
  (Plugin 1) is superseded by `shortform-greenscreen` and slated for retirement (its only unique value
  was PNG generation, now dropped).
- Architecture: the agent thinks in **formats**; Claude silently maintains the **4-3-2-1 funnel
  balance** and **80/20 reach split**. Full build spec in `docs/shortform-os-build.md`; publish +
  analytics layer (Metricool MCP) in `docs/shortform-publishing-layer.md`.

### Notes
- Plugin 1 (the Brain) is unchanged in this release (no version bump); the short-form skills live in
  Plugin 4, not the Brain.
- Coming next: talking-head + carousel (spec-only) workflows, the weekly menu/balance tracker, and
  `shortform-analytics` (the 2-week performance loop). Pending: the 30-min Metricool Cowork connector
  test before publish wiring.

## [0.14.0] — 2026-06-12

### Added
- **Realtor YouTube System joins the shelf as Plugin 3** (`plugins/realtor-youtube-system/`, v0.3.0,
  16 skills) — vendored from its standalone build; display name numbered; marketplace + README
  updated. Anyone who previously installed it as a Local-uploads zip should REMOVE that copy and
  install Plugin 3 from this marketplace instead (duplicate skill names would collide), gaining
  auto-updates. Plugin 4 (Short-Form OS) joins this same shelf when built.

## [0.13.1] — 2026-06-12

### Changed
- **Repo renamed: `teamsherrard/realtor-ai-brain` → `teamsherrard/claude-agent-os`** — the one
  marketplace link clients paste. GitHub redirects the old slug, so existing installs keep syncing;
  all docs and plugin homepages now point at the new name. (Brand note: the marketed product name is
  "Agent OS" — "built on Claude" goes in copy, not in the product name.)

## [0.13.0] — 2026-06-12

**Jarvis is now its own plugin** — the marketplace becomes the numbered cohort journey.

### Changed
- **`realtor-jarvis` split out of the Brain plugin into Plugin 2** (`plugins/realtor-jarvis/`,
  starts at v0.1.0). Product decision: one system = one plugin = one training module — the agent
  installs Plugin 1 (Brain), completes it, then installs Plugin 2 (AI Admin) when they reach that
  module. Same single marketplace link; the marketplace now lists plugins numbered in journey order
  (YouTube System and Short-Form OS join the same shelf as Plugins 3–4 when shipped).
- Jarvis's missing-Brain message now routes to installing Plugin 1 + "Set up my Brain" (it still
  never interviews). Brain plugin description, README, START-HERE, Brain Contract, and blueprint
  updated to the two-plugin journey.
- `scripts/build-plugin-zip.sh` now builds a zip per plugin on the marketplace.

## [0.12.0] — 2026-06-12

Public release prep — first version pushed to GitHub.

### Added
- **LICENSE.md** — proprietary, source-visible: public only to enable Cowork marketplace install;
  licensed clients may use it for their own business; no redistribution/resale/derivatives. The
  agent's Brain data is theirs and not covered by the license.

### Changed
- **Docs swept to the Drive-era reality:** Setup's "Brain you are building" map now shows the permanent
  Drive home, all 13 identity files, and the three laws (incl. push-after-write); brain-spec's old
  "fixed local home" decision marked superseded (BRAIN-CONTRACT is the authority); migrate uses sync
  language; README/START-HERE state the Brain lives in the agent's Google Drive and show Express/Full
  timings; maintainer contract pointer now targets BRAIN-CONTRACT.md.
- Removed the v0.1-era `test/sample-brain` fixture (stale schema; git history keeps it).

## [0.11.2] — 2026-06-12

Everything the agent produces now persists to their Google Drive — the desktop is never the destination.

### Fixed
- **`exports/` now syncs to Drive.** Deliverables (offer guidebook, market-update packages, listing
  kits, the welcome doc) were saved locally and skipped by sync — wiped with the sandbox unless the
  agent downloaded them in-session. `realtor-brain-sync` PUSH now includes `exports/` as the agent's
  **deliverables archive** (`Realtor AI Brain → exports` in their Drive); PULL skips it by default
  (no skill reads exports — agents open deliverables directly in Drive). Sync confirms where the
  document landed. Contract + blueprint + exports README updated; the principle is now a contract
  rule: *brain data, memory, and deliverables all sync — the local sandbox is always disposable.*

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
