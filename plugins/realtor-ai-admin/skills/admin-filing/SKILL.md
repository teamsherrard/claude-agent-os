---
name: admin-filing
description: >-
  Filing — email attachments into the right client folder in Drive, and instant retrieval the
  other way. "File the inspection report" saves it to the client's folder with a sensible name;
  "pull up the Wus' pre-approval" finds it in seconds whether it lives in Drive or is still
  buried in a thread. Trigger on: "file this", "file the attachments", "save that PDF",
  "save the report to [client]'s folder", "find the [client]'s [document]", "pull up the
  inspection report", "where's the pre-approval", "do we have the condo docs".
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Filing — save it right, find it fast

Realtors lose absurd amounts of time hunting attachments in threads. Two directions, both one
sentence.

## Filing ("file the inspection report")
1. **Locate the email** — the one they named, or the most recent thread carrying an attachment
   that matches ("the inspection report" → search mail for it). More than one plausible match →
   one question with the top 2, never a guess.
2. **Resolve the client** (ledger or the Name-Resolution Ladder) and save the attachment(s) to
   the agent's Drive under **`Client Files/[Client Name]/`** — create the folder if missing.
   These are the agent's client documents, in the agent's own Drive; they do NOT live inside
   the Brain's folder (the Brain holds brain files only).
3. **Name it so it finds itself:** `[Client] — [Document type] — [YYYY-MM-DD]` (locale-formatted
   in conversation, ISO in the filename so folders sort).
4. **Log the pointer:** one line in the client's block (filed [doc] → [Drive link], [date]).
   Sync. Confirmation embeds the proof: "Filed — Hendersons' inspection report →
   Client Files/Hendersons (link)."

## Finding ("pull up the Wus' pre-approval")
1. Search **Drive first** (`Client Files/[Client]/`, then the whole Drive), then **mail
   attachments** — a document can predate this system.
2. Deliver the link (or the thread) in one line. Found it only in a thread → offer once:
   "want it filed properly? say 'file it'."
3. Truly nothing → say so plainly and where you looked. Never claim a document exists that you
   didn't find.

**Boundaries:** filing is not transaction coordination — deal stages, condition checklists, and
milestone tracking live with the Listing Launch plugin. And `clients.md` privacy law applies to
everything here: client documents stay in the agent's own Drive, never in a repo, export, or
message to anyone else.
