# Realtor AI Brain marketplace — working rules for Claude

This is `teamsherrard/claude-agent-os`, Team Sherrard's PUBLIC Claude Code plugin marketplace for realtors (marketplace name `teamsherrard-realtor`, the "Social Agent OS" plugins). Realtors install from it in Cowork; the agency maintains it here. Every push to `main` is a release that real agents will pull.

## Read first
- `START-HERE.md` and `README.md` (install, update, maintainer notes)
- `CHANGELOG.md` and `VERSION` for the current release and the recent history of every plugin
- `docs/BRAIN-CONTRACT.md` before touching anything that reads or writes the Brain
- `docs/` holds specs and walkthrough decks, several of them historical snapshots (`docs/SYSTEM-MAP.md` is an archived v0.21 map; `docs/MASTER-BLUEPRINT.md` is a June 2026 blueprint). Check a doc's header before trusting it over the code.

## Layout
- `.claude-plugin/marketplace.json` — the registry. Every plugin's version here must equal its `plugins/<name>/.claude-plugin/plugin.json`.
- `plugins/<name>/` — one plugin each: `skills/*/SKILL.md`, `shared/`, `.claude-plugin/plugin.json`.
- `scripts/check-release.sh` — the release gate. `scripts/build-plugin-zip.sh` — builds `dist/` zips.
- `docs/` — specs and walkthrough decks. `dist/` — build output from `scripts/build-plugin-zip.sh`, gitignored (absent in a fresh clone).

## Release rules (the gate enforces most of these; the rest are house rules)
1. Releases go directly to `main`. One commit per release: code + version bump + `CHANGELOG.md` entry + `VERSION`.
2. Run `scripts/check-release.sh [plugin]` AFTER `git add` and BEFORE `git commit`, as its own command. Never pipe it inside a commit chain. It must be fully green before you commit.
3. Every skill `description:` must be ≤1024 characters. Over-limit skills are SILENTLY SKIPPED at install, so this is a hard rule. Prefer a YAML block scalar (`>` or `>-`) for new or edited descriptions; some older skills still use plain scalars, which is tolerated. Marketplace card descriptions in `marketplace.json` must be ≤500 characters.
4. Never let a folded description line split a hyphenated word. The gate checks lengths and hyphen splits; it does not check scalar style.
5. Every skill a plugin advertises must exist and be staged in the same commit as its version bump.
6. `plugins/realtor-ai-editor` (the Descript-based editor) is RETIRED by maintainer decision: do not develop it, wire other plugins to it, or revive it. It is still registered in `marketplace.json` and listed in `README.md` as Plugin 6 pending a cleanup release; removing or re-describing it there is a deliberate maintainer release, never a side edit. `plugins/realtor-riverside-editor` is the live editor plugin.
7. This repo is public. It never contains client names, pricing, credentials, or the maintainer's private notes. Those live in the private repo `teamsherrard/claude-workspace`.

## Working from a cloud session (claude.ai/code, the Claude app, iPad)
- Plugins cannot be installed or invoked as `/skill-name` in a cloud session. To test a skill's logic, read its `SKILL.md` and follow it step by step as if it had been invoked. The gate script and its Python checks run normally.
- The maintainer's project memory lives in `teamsherrard/claude-workspace` (`memory/MEMORY.md`). Three ways to reach it, in order of preference: (a) if `claude-workspace` is attached to this session as a second repository, read its clone directly (look for a sibling `claude-workspace/` folder next to this repo's clone); (b) if the environment variable `WORKSPACE_TOKEN` is set, fetch a file with the command below; (c) otherwise, when a task depends on decisions recorded there, say so and ask the user to paste the file instead of guessing.
  `GH_TOKEN="$WORKSPACE_TOKEN" gh api repos/teamsherrard/claude-workspace/contents/memory/MEMORY.md -H "Accept: application/vnd.github.raw"`
- Work on a branch and open a PR when a change is risky or untested. Push to `main` only for a release that passed the gate.
- `gh pr` and `gh issue` do not work in cloud sessions (GraphQL is blocked). Use the web UI's Create PR button or `gh api` REST calls.

## Sibling repos (never edit them from here)
- `teamsherrard/claude-agent-attraction-os` — the agent-attraction cohort marketplace (public). Its `realtor-riverside-editor` is vendored FROM this repo; fix here, then re-vendor there.
- `teamsherrard/claude-agent-attraction-knowledge` — private references for that cohort.
- `teamsherrard/realtor-ai-video-editor` — private HyperFrames render engine, not part of the marketplace.
- `teamsherrard/claude-workspace` — private: memory, demos, upload-zip skill banks, brand assets.
