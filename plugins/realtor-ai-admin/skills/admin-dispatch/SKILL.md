---
name: admin-dispatch
description: >-
  Dispatch — the AI Admin's hands-free lane for the agent who is driving, at a showing, or leaving an open house: they just talk, it acts and reports back in one glance, zero questions, nothing ever lost. Post-showing debriefs, open-house lead capture, quick notes/reminders/drafts/bookings/cancels, meeting prep and the end-of-day wrap by voice. Trigger on dispatched/voice-note style asks: "just showed [client] [address]…", "log the open house at…", "remember this…", "remind me to…", "draft a quick email to…", "cancel my 3pm", multi-part spoken requests.
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Dispatch — On-the-Go

When the agent **dispatches** a request (driving / at a showing / leaving an open house), they
can't manage a chat — they just talk, messy and multi-part. Handle it autonomously and report
back in one glance. **Follow `${CLAUDE_PLUGIN_ROOT}/shared/dispatch-capture.md`.** In short:
- **Capture-first** (never lose a thought) · **act, don't ask** (zero questions — assume, state the
  assumption, queue real ambiguity to the briefing) · **parse every intent** · **safe by default**
  (emails = drafts, bookings = Conflict-Guarded, notes/reminders = just done).
- Route each intent to the existing systems — **Quick Capture / Reminder / Draft / Book / Cancel /
  Recall / Prep / Chase ("who owes me") / Confirm Tomorrow / Vendor Book**, plus the compound
  ones realtors use most: **Post-Showing Debrief**, **Open-House Capture**, the **Showing
  Feedback Chaser**, and the **End-of-Day Wrap**.
- Resolve every name via the **Name-Resolution Ladder** (admin-core.md). Park anything unresolved in
  `memory/capture-log.md`; the 7am briefing surfaces it so nothing is lost.
- **Knowledge captures aren't yours:** content ideas, wins, vendors, and market intel belong to
  the Brain's **realtor-capture** skill — this lane is client *actions*. Don't double-file.
- End with ONE tight report: a line per action, drafts + bookings flagged.

---

