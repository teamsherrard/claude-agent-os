---
name: realtor-brain-sync
description: >
  Keeps the realtor's AI Brain in their cloud workspace (Google Drive OR Microsoft OneDrive — its
  permanent home) and in sync with the local working copy. PULLS the brain's text files down at session
  start; PUSHES every write back up IMMEDIATELY — write → push → verify, as one atomic step — because
  Cowork's local sandbox is wiped between sessions and an unsynced write is a lost write. Handles the
  connector's create-only reality (no update-in-place: reads are newest-wins, pushes are changed-only,
  older copies act as version history), never downloads media (brain text only), detects Microsoft
  org-gated write permissions, and recovers when the workspace is renamed, moved, missing, or in the
  wrong account. Also restores the brain onto a new machine.

  Trigger on: "sync my brain", "load my brain", "pull my brain", "save my brain", "back up my brain",
  "restore my brain", "is my brain saved", or run automatically at session start and after any brain write.
---

# Realtor Brain Sync (cloud workspace ⇄ local)

**The Brain's permanent HOME is the agent's cloud workspace folder** — Google Drive or OneDrive, per
`config.md → Storage provider` (see `${CLAUDE_PLUGIN_ROOT}/shared/connectors.md` for the mapping). The
local `~/realtor-brain/` is only a fast working copy for the current session — Cowork's sandbox is
ephemeral. This skill keeps the two in sync so the brain never disappears.

## Requires
The **storage connector** for the agent's provider (Google Drive connector, or Microsoft 365 for
OneDrive). If it isn't connected, walk the agent through connecting it first — never fail silently or
assume the local copy is safe.

## Locating the workspace (rename-proof — NEVER by name alone)
Agents may rename the workspace folder to their business name. Locate it in this order:
1. **Folder ID from `config.md`** (`Workspace folder ID`) — **a within-session cache only**: `config.md`
   lives inside the workspace, so on a cold start (wiped sandbox, no local config) this rung simply isn't
   available — skip straight to the marker. When local config IS present, the ID is fastest; IDs survive
   renames AND moves.
2. **Marker search — the canonical cold-start locator.** Search the agent's storage for the
   `_workspace.md` marker file (setup writes it as the workspace's FIRST file); its parent folder IS the
   workspace, whatever it's called now. Re-cache the ID + current name + link into `config.md`.
   **Self-heal:** after ANY successful locate, if the marker is missing, drop it.
3. **Legacy name** — a folder named `Realtor AI Brain` (pre-workspace brains). If found, adopt it: cache
   its ID into `config.md` and drop the `_workspace.md` marker into it for next time.
   **Legacy brains stay legacy-layout permanently** — the connector cannot move files, so never try to
   relocate one into `01 · AI Brain/_engine/`; resolve the engine path from where the files actually are
   (root = legacy · `01 · AI Brain/_engine/` = new map) and record it in `config.md → Brain home`.
4. **Not found → RECOVERY (never assume "new agent"):**
   - **Wrong account?** `config.md` (if present locally) records the workspace **owner account** — ask:
     *"Your Brain lives in the [account] Drive — are you connected to that same account right now?"*
   - **Local copy exists?** Offer to **rebuild the workspace in Drive from the local brain** (a full push).
   - **Genuinely nothing anywhere** → they're new (or it was deleted): route to **"Set up my Brain"** —
     and say plainly that no existing Brain could be found, so they can stop you if that's wrong.

## PULL — cloud → local *(at session start, or before any brain operation if local is missing)*
1. Locate the workspace (above). The brain's engine lives at `01 · AI Brain/_engine/` (new map) or the
   workspace root (legacy layout) — detect whichever exists.
2. **Download ONLY the brain's text files:** `brain.md`, `config.md`, `identity/*.md`, `memory/*.md` →
   `~/realtor-brain/`, preserving structure.
   **The allowlist above is exhaustive — everything else is NEVER pulled:** no `03 · Content/`,
   `04 · Listings/`, `06 · Materials/` (or legacy `Content/`/`exports/`), and no image/video files from
   `assets/` (list `assets/` names only — fetch a specific asset only when a skill actually needs that
   file). One agent's videos can be gigabytes; pulling them would stall every session.
3. **Duplicate names = newest wins.** Because the connector is create-only, a file can exist in several
   copies with the same name. For every file, **use the copy with the latest modified/created time** —
   older copies are harmless version history, never read them by accident.
4. **Schema check (the migration trigger — agents never know the word "migrate"):** compare
   `config.md → Brain schema` with the current schema in `realtor-brain-migrate`. If behind, add one warm
   line: *"Your Brain is on an older structure — say **'upgrade my brain'** and I'll bring it current.
   Nothing is lost."* Never block on it.
5. Confirm quietly: *"Brain loaded from your Drive — ready."* (OneDrive: say OneDrive.)

## PUSH — local → cloud *(IMMEDIATELY after every write — this is part of the write, not a batch)*
> **The law: write → push → verify is ONE atomic step.** Never hold local writes for an end-of-session
> sync — a crash, timeout, or closed tab between write and push loses the work forever.
1. **Push only what changed** this session (compare against what was pulled). The connector can't
   update-in-place, so every push **creates a new copy** — changed-only keeps the copies from piling up.
   Engine `.md` files upload as **plain files with auto-conversion disabled** so they read back exactly.
2. **Verify each push:** search for the file and confirm the new copy exists (newest timestamp = yours).
   - Verify fails → retry once. Still failing → **tell the agent their work is NOT saved yet**, keep the
     written content visible in chat so nothing is silently lost, and troubleshoot the connector.
   - **Microsoft org-gating:** a permission-style failure on `microsoft` = write actions disabled by
     their admin. Use the exact message in `shared/connectors.md`, record `Storage: READ-ONLY
     (org-gated)` in `config.md`, and surface it on every save until fixed. Never fail silently.
3. Deliverables (rendered `.docx`, etc.) push to their mapped workspace folder
   (`shared/drive-map.md`); legacy brains use `exports/`. Tell the agent where it landed, with the link.
4. Update **Last synced** in `config.md` (and push config too when it changed).
5. Confirm quietly: *"Saved to your Drive."* / *"Saved to your OneDrive."*

## Housekeeping (the duplicate copies)
Old copies of a file are **version history** — correct reads always take the newest. They're tiny text
files; leave them. If an agent asks about duplicates, explain that plainly and (only if they want a tidy
folder) note they can delete older copies themselves in Drive/OneDrive — the connector cannot delete, so
never promise to clean up for them.

## SNAPSHOTS — deliberate backup + restore *(trigger: "back up my brain" · also monthly)*
Accidental copies are a crude safety net; snapshots are the real one:
- **Take a snapshot:** concatenate the whole brain (brain.md + config + every identity/ + memory/ file,
  clearly delimited per file) into ONE file — `Brain Snapshot — [YYYY-MM-DD].md` — and push it to
  **`_engine/snapshots/`** (inside the hidden engine, never beside the agent's polished docs). Take one
  on **"back up my brain"**, after **major milestones** (setup finalize — Step 7 takes it · business plan
  built), and roughly **monthly** when a sync notices the newest snapshot is >30 days old.
- **Restore:** on "restore my brain" (or when a bad write is discovered), list the snapshots by date, let
  the agent pick one, and rebuild the local files from it — then push the restored state as normal. A bad
  overwrite is now always undoable.

## Rules
- **The cloud workspace is the source of truth.** When in doubt, PULL before you PUSH. Never delete the
  cloud copy.
- **Freshness check before PUSH (two devices / two sessions).** If the cloud copy of a file is NEWER than
  what this session pulled, another session pushed in between — **pull that newer version first**, re-apply
  this session's change on top, then push. Never blind-push over someone's newer write. If the two changes
  genuinely conflict, show the agent both and let them pick — never silently discard either.
- **Restore on a new machine = a PULL.** Setting up on a new device just pulls the existing brain.
- If the storage connector drops mid-session, tell the agent their changes aren't saved yet and help
  them reconnect — don't lose their work silently.
