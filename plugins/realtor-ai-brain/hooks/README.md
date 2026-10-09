# Brain hooks — why this file exists

Global brain-awareness.

SessionStart command output is injected into session context: if a local brain exists it loads the index; otherwise it instructs Claude to pull the brain from the agent's Google Drive via realtor-brain-sync.

NOTE: excluded from the zip-upload test build (zip validation rejected a hooks variant); verify live via the GitHub-marketplace install. Drive PUSH after writes is handled by skills per the Brain Contract, not by a hook.

**Keep `hooks.json` to the single `hooks` key.** Plugin validation rejects extra top-level keys (a `$comment` here was flagged on sync), so explanatory notes live in this README instead.
