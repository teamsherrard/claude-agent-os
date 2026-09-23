---
name: admin-confirmations
description: >-
  Tomorrow Confirmations — the no-show killer. Reads tomorrow's client appointments and drafts a
  short confirmation to each client: time, address or video link, anything to bring — one draft
  per appointment, one glanceable report. Drafts only; the agent reviews and taps send on the
  drive home. Trigger on: "confirm tomorrow", "confirm my appointments", "confirm tomorrow's
  showings", "send confirmations", "reconfirm my day", "confirm Friday", "confirm my 10am".
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Tomorrow Confirmations

No-shows are a silent tax, and re-confirming is exactly the tedious chore agents skip. One
phrase in the evening puts a confirmation draft behind every client appointment.

1. **Read the day.** Tomorrow by default; "confirm Friday" or "confirm my 10am" narrows it.
   Take only **client-facing events**: a resolvable client counterpart via the ledger or the
   Name-Resolution Ladder. Skip personal blocks, internal/team events, and **guestless holds**
   — a guestless hold is an assumed, unconfirmed time (admin-core booking rules); confirming
   it to the client would turn a guess into a promise. Flag those instead: "your 2pm with the
   Patels is still a held guess — want me to propose it to them properly?"
2. **Skip what's already confirmed.** If sent mail shows a confirmation for that event today
   or yesterday, leave it out and say so.
3. **Draft one short confirmation per event**, in the agent's voice: the time, the address
   (or the video link for virtual), and anything the client should bring — pulled from their
   block's Next action / Notes (documents, pre-approval, ID for a signing). Two to four
   sentences, signature from `operations.md`. Never invent logistics that aren't on the event
   or in the ledger.
4. **Report in one glance:** "3 confirmation drafts in your Gmail — Hendersons 10:00 ·
   Lees 1:30 (Zoom) · Patel 4:15." Nothing to confirm → say that in one line, done.

No ledger writes needed — this lane reads, drafts, and gets out of the way.

**In dispatch** ("confirm tomorrow" from the car): identical, zero questions, the report is the
confirmation.
