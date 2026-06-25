# AI Admin · Dispatch Spec — "On-the-Go Capture"

*The game plan for the AI Admin's third mode. The operational instructions live in
`plugins/realtor-ai-admin/skills/realtor-ai-admin/references/dispatch-capture.md`; this is the why + plan.*

## The angle
The realtor is mobile — driving, at showings, walking out of open houses — and can't sit in a chat.
They just talk: *"remember this, remind me that, draft this, just showed the Lees 14 Oak…"*. Dispatch
is the lane that lets them fire a request and have it handled autonomously, with a glanceable report
when it's done. This is where the Admin saves the most time, because it captures the moments a realtor
would otherwise forget by the time they're back at a desk.

## The core insight
Dispatch needs **no new systems** — it's a new **mode** over the three the Admin already has
(Scheduling, Inbox, Client Memory). "Remember the Lees loved the kitchen, follow up Thursday, draft a
thank-you" is just Client Memory + a deadline + an email draft. So this is purely additive: a
capture-and-route lane, no new plumbing, no v2.

## The five rules (what makes it work hands-free)
1. **Capture-first** — never lose a thought (unresolved → `memory/capture-log.md`).
2. **Act, don't ask** — zero clarifying questions; assume + state, queue ambiguity to the briefing.
3. **Parse every intent** — one breath can hold several tasks.
4. **Voice-tolerant** — messy transcription in, intent out.
5. **Safe by default** — emails = drafts, bookings = conflict-guarded, notes/reminders = just done.

## The dispatch jobs
Quick Capture · Quick Reminder · Quick Draft · Quick Book · **Post-Showing Debrief** ·
**Open-House Capture** · Multi-Intent catch-all. (The last two are the highest-value — they're the
exact moments the agent is mobile.) Each reuses an existing system. Full table in `dispatch-capture.md`.

## "When the Brain doesn't know a name" — SOLVED (the key decision)
The Brain is NOT the contact database — **Google is**, and the Admin is already connected to it. When a
name comes up that `clients.md` doesn't have, resolve down this ladder and stop at the first hit:
1. Brain `clients.md` (active record) → 2. **Gmail search** (resolves almost everyone — if they're a
real lead, you've emailed them) → 3. **Calendar** (anyone met with) → 4. **Google Contacts** (the phone
address book, if connected) → 5. **create the record from what you found** → 6. truly nothing → park in
the capture-log and confirm in the briefing.
- **No CRM integration** (too many CRMs, no native connector, no-Zapier rule — and not needed).
- **No CSV** (re-uploading is a non-starter; Google is already live and current). *Decided: dropped.*
- The Brain's `clients.md` = the **active working set + history**, not the full address book. It
  compounds; Google stays the live source. Auto-create is safe because it's built from real Google data.

## What's built / updated (all inside the AI Admin plugin — no brain-plugin change)
- **NEW** `references/dispatch-capture.md` — the operational lane (rules, flow, jobs, report, capture-log).
- **SKILL.md** — dispatch triggers added to the description; a **Name-Resolution Ladder** section (used
  everywhere, not just dispatch); a **DISPATCH — On-the-Go Capture** section pointing to the reference.
- **`references/briefing-prompt.md`** — the 7am briefing now reads `memory/capture-log.md` and surfaces
  anything needing a decision.
- **`memory/capture-log.md`** — created on demand by the Admin; syncs to Drive with the rest of `memory/`.
  No brain template/plugin change required.
- **No new connectors. No new systems. No v2.** Voice input = the agent's own phone/Cowork dictation.

## Game plan / status
1. Lock the spec ✅
2. Write `dispatch-capture.md` + SKILL.md playbook + triggers + name-resolution ladder ✅
3. Add the capture-log + briefing surfacing ✅
4. Cold-test on the go (dispatch a debrief, a multi-intent, an ambiguous name) — **pending live test**
5. Ship as AI Admin **v0.3.0**
