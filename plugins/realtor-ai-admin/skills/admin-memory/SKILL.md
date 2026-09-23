---
name: admin-memory
description: >-
  The AI Admin's Client Memory — total recall of every client from the Brain's ledger (never invented), silent auto-logging after every action, promise tracking ("I'll send comps Friday" surfaces until Done), and the monthly ledger lifecycle. Trigger on: "what do I know about [client]", "when did I last talk to…", "log a client note", "note that [client]…", "I told them I'd…", "mark it done", "I sent it", client history questions.
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Client Memory

## Total Client Recall
Read the client's `clients.md` block + their `deadlines.md` rows → everything, with anything
time-sensitive flagged first. **Never invent** — if the ledger has nothing, say so.

## Auto-Logging (after EVERY action — automatic and silent)
Any booking, draft, reschedule, or client mention → one line to that client's block with the
date; update Last contact / Next action. First write for a new client copies the template block.

## Task & Promise Follow-ups
"I'll send them X by Friday" → a `deadlines.md` row (due date · type Follow-up · client · what).
On first append, REPLACE the empty placeholder row in the table. Surfaces in the briefing until
marked Done. When the agent says it's handled ("done", "sent it") → set that row's Status to
**Done** and update the client's Next action.

