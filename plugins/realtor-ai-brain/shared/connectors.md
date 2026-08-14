# Connectors — the provider layer (Google OR Microsoft)

The agent's world is either **Google** (Drive · Gmail · Google Calendar) or **Microsoft** (OneDrive ·
Outlook Mail · Outlook Calendar, all via the **Microsoft 365 connector**). Skills never hardcode one:
they say "the **storage** / **email** / **calendar** connector," and this file maps those to the real
connector based on the **`Storage provider`** field in `config.md` (set once at setup; default `google`).

| Operation | `google` | `microsoft` |
|---|---|---|
| **Storage — find folder / list files** | Google Drive connector (search) | Microsoft 365 connector (OneDrive/SharePoint search) |
| **Storage — read a file's text** | Google Drive read-file | Microsoft 365 read/analyze file |
| **Storage — create a file** | Google Drive create-file | Microsoft 365 create/update file |
| **Storage — create a folder** | Google Drive create-file with the folder mime type | Microsoft 365 create folder (if a folder create fails, create the first file with the folder in its path — most storage APIs create the path; if that also fails, say so and save flat, never lose the file) |
| **Email — search / read inbox** | Gmail connector | Microsoft 365 (Outlook Mail) |
| **Email — draft a message** | Gmail (drafts) | Microsoft 365 (Outlook drafts) |
| **Email — tag / organize a thread** | Gmail labels | Microsoft 365 (Outlook **categories** — same names; archive = move to Archive folder; if writes are org-gated, the inbox sweep runs report-only and says so) |
| **Calendar — read / create / update events** | Google Calendar connector | Microsoft 365 (Outlook Calendar) |

## Hard truths every skill must respect (both providers)
1. **NO content update-in-place — but rename/move/trash DO exist (live-verified 2026-08).** The Google
   Drive connector cannot overwrite a file's CONTENT — "saving" a file again still creates a SECOND copy
   with the same name, so the sync rules (newest-wins reads · changed-only pushes) remain law. BUT the
   connector's `update_file` can **rename and MOVE** a file (metadata), and `trash_file` can **move a file
   to trash** (recoverable). Use them for HOUSEKEEPING only: after a verified push of a new copy, you MAY
   trash the superseded older copy of the same file (never snapshots — those are the deliberate backups);
   and moving files between folders is now possible (legacy-brain migration, misfiled deliverables).
   If either operation is unavailable in a session (older environments, Microsoft untested), fall back to
   the create-only rules — they always remain the safety net.
2. **Email is DRAFT-ONLY as policy, on both providers.** Gmail literally cannot send. Outlook *can* send —
   but we never do: every email lands as a **draft the agent reviews and sends themselves**. No exceptions.
3. **Markdown/text files must round-trip.** When creating `.md` engine files, keep them as plain files
   (disable auto-conversion to Google Docs) so the sync can read back exactly what it wrote. Rendered
   deliverables (`.docx`) upload as-is.

## Microsoft write-gating (detect it — NEVER fail silently)
On brokerage-managed Microsoft 365 accounts, an IT admin can leave the connector's **write actions
disabled** — Claude can *read* their OneDrive but every create fails. The rule:
- **Probe at setup:** on `microsoft`, the FIRST write (the workspace marker file) doubles as the probe.
- **If a write fails with a permission-style error**, stop and say it plainly:
  > *"Your Microsoft account can read files but isn't allowed to save them yet — your admin has 'write
  > actions' turned off for Claude's Microsoft 365 connector. Ask your IT/broker admin to enable write
  > actions for the Microsoft 365 connector, or I can set you up on a free Google account instead so
  > nothing is blocked today."*
- Record `Storage: READ-ONLY (org-gated)` in `config.md` so every skill knows saves are blocked, and
  **surface it on every attempted save** until it's fixed. Never let an agent think work was saved when
  it wasn't.
- **The rescue path (if gating is discovered AFTER content exists):** dump the full brain contents into
  the chat as a clearly-delimited copyable block, say plainly it is **NOT saved**, and offer the switch:
  set `Storage provider: google` in `config.md`, connect Google Drive (free account is fine), then re-run
  the save. Setup probes at its FIRST write precisely so this rescue is almost never needed.

## Choosing the provider (setup does this once)
- If **Google Drive is connected** → `google`. If **Microsoft 365 is connected** (and Drive isn't) →
  `microsoft`. If **both**, ask which world they live in. If **neither**, ask — *"Are you a Google
  person or an Outlook/Microsoft person?"* — then connect that provider's connector(s).
- Write the choice to `config.md` → `Storage provider:`. Every skill reads it from there — never re-ask.
- **AI Admin note:** on `microsoft`, every Gmail / Google Calendar instruction in the AI Admin (briefing,
  inbox sweep, drafts, booking) maps to Outlook Mail / Outlook Calendar per the table above.
