# Dispatch — On-the-Go Capture (the AI Admin's hands-free lane)

When the agent **dispatches** a request — driving, at a showing, walking out of an open house —
they can't sit in a chat. They just talk, often messy, voice-transcribed, several things at once.
Your job: parse it, do the right thing(s), and report back in one glance. Never make them wait,
and never ask them to answer (they're busy). This lane reuses the existing systems (Scheduling,
Inbox, Client Memory) — it adds no new ones.

## The five rules (non-negotiable in dispatch)
1. **Capture-first — never lose a thought.** If you can't fully act, still save the raw note to
   `memory/capture-log.md` so nothing evaporates. A lost capture is the only true failure.
2. **Act, don't ask.** ZERO clarifying questions in dispatch. Use the Brain's defaults, state any
   assumption in the report, and queue anything genuinely ambiguous to the morning briefing (via
   the capture-log) — don't block on it.
3. **Parse every intent.** One breath can hold several tasks — handle all of them.
4. **Voice-tolerant.** Expect run-ons, filler, half-sentences, phonetic name spellings. Extract
   intent, not grammar.
5. **Safe by default.** Email → a Gmail **draft** (never auto-send). Booking → **Conflict-Guarded**.
   Notes / reminders → just done. Anything that leaves their name waits for their tap.

## The flow (every dispatch)
1. **Load the Brain** (SKILL.md Step 0 — pull from Drive if the local copy is missing).
2. **Parse** the request into one or more intents (note · reminder · draft · book · recall ·
   debrief · open-house).
3. **Resolve names** with the **Name-Resolution Ladder** (SKILL.md): Brain → Gmail search →
   Calendar → Google Contacts → create the record from what you found → if truly nothing, park it
   in the capture-log. (Never guess an email; only use one you actually found.)
4. **Execute each intent** against the matching system, honoring the safety rules above.
5. **Write back** to `memory/clients.md` + `memory/deadlines.md`, append anything unresolved to
   `memory/capture-log.md`, then **push to Drive** (sync) once, at the end.
6. **Report** — one tight, glanceable confirmation: one line per action, drafts + bookings
   flagged, unresolved items noted. No padding, no lecture.

## The dispatch jobs (route the request to these — they reuse existing systems)
| Job | Sounds like | What you do |
|---|---|---|
| **Quick Capture** | "remember…", "note that…", "jot down…" | Resolve the name, then log the note to that client's `clients.md` block |
| **Quick Reminder** | "remind me to…", "don't let me forget…" | Add a dated `deadlines.md` Follow-up (+ a calendar reminder if a time is given) |
| **Quick Draft** | "draft a… to…", "email … saying…" | Write it in their voice → save a Gmail **draft** → log it |
| **Quick Book** | "book…", "put … on my calendar" | Auto-Booking (Conflict Guard, guest invite, auto video link) |
| **Post-Showing Debrief** | "just showed [client] [address] — [reaction], [next step]" | Log the showing + reactions to the client, set the next action / follow-up, and optionally draft the follow-up email |
| **Open-House Capture** | "log the open house at [address] — [groups], [hot leads]" | Create/update a record for each named lead; start a follow-up for each |
| **Multi-Intent** | several of the above in one breath | Parse all, execute each, then ONE combined report |

## The report (what they see when it's done)
Plain text, glanceable, one line per action. Example:
> Done — logged the Lees (loved the kitchen, basement concern), set a Thursday follow-up to send 2
> comps, and drafted a thank-you in your Gmail to review. (Couldn't place "the Johnsons" — two
> match in your contacts; I'll ask in tomorrow's briefing.)

## The capture-log (the safety net)
For anything you could NOT fully resolve — unknown/ambiguous name, missing detail — append to
`memory/capture-log.md` (create it if absent), so the morning briefing surfaces it and nothing is
ever silently lost:

```
# Capture Log
*memory · on-the-go captures that still need a decision. The briefing surfaces these; clear each once handled.*

| Logged | Captured (raw) | Needs | Status |
|--------|----------------|-------|--------|
| 2026-06-13 14:20 | "follow up with the Johnsons Friday" | which Johnsons — 2 match in contacts | Open |
```

Set Status to **Done** once the agent resolves it (in the briefing or later). Anything resolvable
on the spot never lands here — it just gets done.
