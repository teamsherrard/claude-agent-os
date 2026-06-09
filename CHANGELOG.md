# Changelog

All notable changes to the Realtor AI Brain. Versions follow `MAJOR.MINOR.PATCH`.

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
