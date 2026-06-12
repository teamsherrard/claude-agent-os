# Jarvis v2 — Parked Systems (not in the shipped skill)

*Scope deferred from v1 (locked 2026-06-09). The v1 skill is `plugins/realtor-ai-brain/skills/
realtor-jarvis/` — Scheduling, Inbox, Client Memory + the two scheduled automations. These come next.*

## Meeting System — the Note-Taker (Automation)
After any call or meeting (buyer/seller consult, listing appt, client update, vendor, team), turn
the transcript or notes into a structured record:
- **Summary** — what happened, in a few lines
- **Client goals** — what they're trying to achieve
- **Concerns / objections** — what's holding them back
- **Action items** — concrete next steps (who / what / when)
- **Follow-up message** — a draft in the agent's voice, ready to approve
- **Reminders** — calendar event + a `memory/deadlines.md` row for the next touch

Write summary + goals + concerns into the client's block in `memory/clients.md`; action items and
next-touch date into `memory/deadlines.md`; push to Drive. Transcript source: Zoom for Claude /
tl;dv / Grain connectors (verify capabilities at build time).

## Transaction Coordinator System
- **Deal Timeline Builder** (Workflow) — "offer accepted, closing July 15" → back-calculate earnest
  money, inspection, appraisal, financing, walkthrough, closing → calendar events + `deadlines.md`
  rows → client stage = Under contract.
- **Party Coordination** (Workflow) — drafts the update emails to lender / title / inspector / client
  (vendors from `identity/vendors.md`).
- **Milestone Nudges** (Automation) — fold into the morning briefing's URGENT section.
- **Document Checklist** (Automation) — what's collected vs missing per deal.

## Document & File System
- **Auto-Filing** (Automation) — attachments → the right client/deal folder in Drive, named
  consistently. (Dropped from v1 scope 2026-06-09.)
- **Template Filling** (Workflow) — fill listing agreements / buyer reps with Brain + deal data.
- **Contract Data Extraction** (Workflow) — signed PDF → key terms → client record + timeline builder.

## Daily Command extensions
- **Productivity Scorecard** (Automation) — weekly "did-I-do-my-admin / what's slipping" report.
- Special-date surfacing is already in the v1 briefing prompt (reads client notes).
