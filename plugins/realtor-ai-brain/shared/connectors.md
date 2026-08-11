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
| **Email — search / read inbox** | Gmail connector | Microsoft 365 (Outlook Mail) |
| **Email — draft a message** | Gmail (drafts) | Microsoft 365 (Outlook drafts) |
| **Calendar — read / create / update events** | Google Calendar connector | Microsoft 365 (Outlook Calendar) |

## Hard truths every skill must respect (both providers)
1. **Assume NO update-in-place and NO delete.** The Google Drive connector can only **create** new files —
   it cannot overwrite, delete, move, or rename (verified). Treat Microsoft the same way unless a real
   update succeeds. Consequence: **"saving" a file again creates a SECOND copy with the same name.**
   The sync skill's rules (newest-wins reads · changed-only pushes — see `realtor-brain-sync`) exist
   because of this. Never write a skill that assumes it replaced a file.
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

## Choosing the provider (setup does this once)
- If **Google Drive is connected** → `google`. If **Microsoft 365 is connected** (and Drive isn't) →
  `microsoft`. If **both**, ask which world they live in. If **neither**, ask — *"Are you a Google
  person or an Outlook/Microsoft person?"* — then connect that provider's connector(s).
- Write the choice to `config.md` → `Storage provider:`. Every skill reads it from there — never re-ask.
- **AI Admin note:** on `microsoft`, every Gmail / Google Calendar instruction in the AI Admin (briefing,
  inbox sweep, drafts, booking) maps to Outlook Mail / Outlook Calendar per the table above.
