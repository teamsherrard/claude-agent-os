---
name: admin-scheduling
description: >-
  The AI Admin's Scheduling system — books showings, consults, open houses and closings on the agent's real calendar with guests invited at their verified email and a video link attached automatically (Zoom → standing link → Meet/Teams); sends booking links; reschedules and cancels truthfully (organizer vs attendee), including the bulk sick-day cancel; orders the day's showings by geography. Conflict-Guarded, always. Trigger on: book a showing / consult / open house / inspection / closing, "put it on my calendar", reschedule, cancel, "cancel everything this afternoon", "send a booking link", "plan my route".
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# Scheduling

## Auto-Booking
1. Parse who / what / where / when — **in the agent's timezone** (`operations.md`). Duration from
   `operations.md` booking rules (fallbacks: showing 30m, buyer/seller consult 60m, open house
   180m, inspection 60m, closing 60m, else 30m).
2. **Conflict Guard** (below) before creating anything.
3. Create the event — clear title, address in location. **If the request names a guest, invite
   them**: resolve their email via the **Name-Resolution Ladder** (Brain → Gmail → Calendar →
   Contacts) and add as attendee with notifications on. Skip only if no email is resolvable or the
   agent says "just block the time." **An invite actually emails that person** — two guards:
   (a) in dispatch, if the ladder resolved the guest outside the Brain and more than one
   candidate matched, book WITHOUT the guest and park the invite; (b) **everywhere: if the TIME
   was assumed rather than stated** ("book the Hendersons Thursday" — no time), book the hold
   WITHOUT guests and flag it ("held Thu 2:00 — my guess; say 'invite them' to send") — a
   client must never receive an invite for a time nobody agreed to. **Delegation:** if the
   request names another person as the one RUNNING the appointment ("book Sarah to show it"),
   check their free/busy where the calendar allows; where it can't, say so plainly in the
   confirmation ("I can't see Sarah's calendar — confirm she's free").
4. **Virtual meetings get a video link automatically — NEVER ask for one.** Priority: Zoom
   connector creates a meeting (if setup verified it can) → standing virtual link from
   `operations.md` → Google Meet (`addGoogleMeetUrl: true`). On `microsoft`: Zoom → standing
   link → Teams link (only if `config.md` says setup verified Teams attachment works); if no
   path works, book anyway and flag "no video link" in the confirmation — never silently
   linkless, never blocked on it.
5. **Write back** one line to the client's block in `memory/clients.md`; if the booking implies
   a future obligation, add a `deadlines.md` row. Sync.
6. Confirm in one line with the proof — and when a guest was invited, include the exact email
   you invited ("Hendersons (henderson@…) invited"), since that invite already went out.

## One-Tap Client Booking ("send them a link to pick a time")
Use the best available path — never dead-end:
1. **Cal.com connected** → create the right event-type / single-use scheduling link.
2. Else **booking link in the Brain** (`operations.md` / `profile.md` — their Calendly etc.) → use it.
3. Else **propose times natively**: find 2–3 open slots via the calendar (suggest_time / free gaps
   within working hours) and draft a short email offering them.
Whatever the path: draft the message in the agent's voice, log to `clients.md`, sync, confirm.

## Rescheduling & Cancelling
Find the event (match client/time) → move it (re-run Conflict Guard) → attendee update emails
out automatically → update the client's Last contact / Next action → sync → one-line confirm.
**Cancelling — organizer vs attendee matters:** if the AGENT organized the event, delete it
(that cancels for everyone). If someone ELSE organized it (an inspection the title company set
up, a co-op agent's showing), deleting only removes the agent's copy and **notifies nobody** —
instead DECLINE the event AND draft a note to the organizer, and never claim people were
notified when they weren't. Either way: log to the client's block → create a one-line draft
note to the client and mention it in the confirmation (drafts are free — never ask "want me to
draft one?"). **Recurring events:** touch only that one instance unless the agent says the
whole series.
**Bulk cancel ("cancel everything this afternoon, I'm sick"):** list the matched events with
their attendees and confirm ONCE before touching anything — a multi-event destructive op earns
a sanctioned confirm, and fold cancel-vs-reschedule into that same line ("cancel outright, or
move them to tomorrow?"). Apply the organizer/attendee rule per event; skip client-logging for
personal blocks.

## Route Optimizer
Group the day's showings by area, order them sensibly, add travel buffers from `operations.md`
(default 20–30 min). **Buffers are estimates from local geography, not live traffic** — say so
and confirm the order before placing events (the ONE sanctioned confirm: a whole day is being
rearranged). **In dispatch: propose-only** — report the recommended order, place nothing.

## Conflict Guard (inside every booking / reschedule)
Read the calendar for the target window first. Overlap with an appointment, personal block, or
required buffer → do NOT book; surface the clash + offer the nearest open slots instead. Check
every calendar the agent actually uses (primary by default; any extras noted in `config.md`).
An ALL-DAY event whose title implies unavailability (closing, vacation, conference) counts as
busy even when the calendar marks it "free."

---

