# Changelog

All notable changes to the Realtor AI Brain. Versions follow `MAJOR.MINOR.PATCH`.

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
