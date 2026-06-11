---
name: realtor-brain-sync
description: >
  Keeps the realtor's AI Brain in their Google Drive (its permanent home) and in sync with the local
  working copy. PULLS the brain down from Drive at the start of a session so every Cowork session — in
  any project — has it; PUSHES changes back up after any skill updates it. This is what makes the brain
  persist across sessions, projects, and devices (Cowork's local sandbox is wiped between sessions, so
  the local copy alone is not safe). Also restores the brain onto a new machine.

  Trigger on: "sync my brain", "load my brain", "pull my brain", "save my brain", "back up my brain",
  "restore my brain", "is my brain saved", or run automatically at session start and after any brain write.
---

# Realtor Brain Sync (Google Drive ⇄ local)

**The Brain's permanent HOME is the realtor's Google Drive folder `Realtor AI Brain`.** The local
`~/realtor-brain/` is only a fast working copy for the current session — Cowork's sandbox is ephemeral,
so the local copy can vanish between sessions. This skill keeps the two in sync so the brain never
disappears.

## Requires
The **Google Drive** connector. If it isn't connected, walk the agent through connecting it first —
never fail silently or assume the local copy is safe.

## PULL — Drive → local *(run at session start, or before any brain operation if local is missing)*
1. Find the `Realtor AI Brain` folder in the agent's Google Drive.
   - If it doesn't exist → the brain hasn't been created yet; tell them to run **"Set up my Brain."**
2. Download its contents into `~/realtor-brain/` — `brain.md`, `identity/`, `memory/`, `assets/`,
   `config.md` — preserving the folder structure. This becomes the working copy for the session.
3. Confirm quietly: *"Brain loaded from your Drive — ready."*

## PUSH — local → Drive *(run after any skill writes to the brain)*
1. Upload changed files from `~/realtor-brain/` back to the `Realtor AI Brain` Drive folder, overwriting
   the old versions: `brain.md`, `identity/`, `memory/`, `config.md`, `assets/`. **Skip `exports/`** —
   those are disposable renders.
2. Update **Last synced** in `config.md`.
3. Confirm quietly: *"Saved to your Drive."*

## Rules
- **Drive is the source of truth.** When in doubt, PULL before you PUSH. Never delete the Drive copy.
- **Restore on a new machine = a PULL.** Setting up on a new device just pulls the existing brain from Drive.
- If the Drive connector is missing mid-session, tell the agent their changes aren't saved yet and help
  them connect it — don't lose their work silently.
