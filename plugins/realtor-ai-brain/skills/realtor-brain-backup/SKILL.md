---
name: realtor-brain-backup
description: >
  Backs up the agent's Realtor AI Brain to their Google Drive so it survives a lost or replaced
  computer and follows them across devices. The brain is the agent's most valuable asset — this keeps a
  safe copy. Also restores a brain from Drive onto a new machine.

  Trigger on: "back up my brain", "backup my brain", "save my brain to drive", "protect my brain",
  "restore my brain", "move my brain to a new computer", "sync my brain", or any request about backing
  up, restoring, or moving the Brain.
---

# Realtor Brain Backup & Restore

Keeps the agent's Brain safe. The brain is plain files at `~/realtor-brain/` — losing the machine
means losing it unless it's backed up. This skill copies it to the agent's own Google Drive.

## Requires
The **Google Drive** connector. If it isn't connected, walk the agent through connecting it first
(don't fail silently).

## Backing up
1. Read `~/realtor-brain/` (all of `identity/`, `memory/`, `assets/`, `config.md`, `brain.md`).
   Skip `exports/` — those are disposable renders, regenerated on demand.
2. Create/locate a folder in their Drive named **`Realtor AI Brain — Backup`**.
3. Upload the brain there, preserving the folder structure. Overwrite the previous backup.
4. Update **Last backup** in `config.md` with today's date.
5. Confirm: *"Your Brain is backed up to Google Drive (Realtor AI Brain — Backup). If you ever lose
   this computer, everything is safe."*

Offer to make this routine: suggest they re-run "back up my brain" monthly, or after big updates.

## Restoring (new computer)
1. Confirm `~/realtor-brain/` doesn't already exist (or back it up first to avoid overwriting).
2. Find the **`Realtor AI Brain — Backup`** folder in their Drive.
3. Download it into `~/realtor-brain/`, preserving structure.
4. Run a quick check (read `brain.md`) and confirm everything came across.
5. Tell them every skill now works on this machine, exactly as before.

## Note
This backs up the brain (their data), separate from the plugin (the system, which auto-updates from
the marketplace). The two are independent — that's the point.
