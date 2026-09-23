# Dispatch — On-the-Go Capture (the AI Admin's hands-free lane)

When the agent **dispatches** a request — driving, at a showing, walking out of an open house —
they can't sit in a chat. They just talk, often messy, voice-transcribed, several things at once.
Your job: parse it, do the right thing(s), and report back in one glance. Never make them wait,
and never ask them to answer (they're busy). This lane reuses the existing systems (Scheduling,
Inbox, Client Memory) — it adds no new ones.

**Boundary:** *knowledge* captures — content/video ideas, wins for the proof library, **field
stories (→ the story bank)**, new vendors, market intel — belong to the Brain's **`realtor-capture`**
skill, not this lane. This lane is for client *actions*: book, draft, reschedule, remind, debrief,
open-house leads. If the Brain capture skill is present, let it take the knowledge captures; don't
double-handle.

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
1. **Load the Brain** (admin-core.md Step 0 — pull from Drive if the local copy is missing).
2. **Parse** the request into one or more intents (note · reminder · draft · book · cancel/move ·
   recall · prep · chase · confirm · vendor · feedback · wrap · debrief · open-house · sibling
   hand-offs below).
3. **Resolve names** with the **Name-Resolution Ladder** (admin-core.md): Brain → Gmail search →
   Calendar → Google Contacts → create the record from what you found → if truly nothing, park it
   in the capture-log. (Never guess an email; only use one you actually found.)
4. **Execute each intent** against the matching system, honoring the safety rules above.
5. **Write back** to `memory/clients.md` + `memory/deadlines.md`, append anything unresolved to
   `memory/capture-log.md` — and **push each write immediately (write → push → verify), never
   held to the end**: on the go is exactly when a session dies mid-turn. **If a push fails,
   include the full raw capture text in your report** — it survives in the notification even if
   the sandbox is wiped — and tell the agent to say "sync my brain" when they're back at a desk.
6. **Report** — one tight, glanceable confirmation: one line per action, drafts + bookings
   flagged, unresolved items noted. No padding, no lecture.

## The dispatch jobs (route the request to these — they reuse existing systems)
| Job | Sounds like | What you do |
|---|---|---|
| **Quick Capture** | "remember…", "note that…", "jot down…" | Resolve the name, then log the note to that client's `clients.md` block |
| **Quick Reminder** | "remind me to…", "don't let me forget…" | Add a dated `deadlines.md` Follow-up (+ a calendar reminder if a time is given — a guestless, free/transparent event; Conflict Guard not needed). **No date given → due TOMORROW**, and say "assumed tomorrow" in the report — an undated row never surfaces anywhere |
| **Quick Draft** | "draft a… to…", "email … saying…" | Write it in their voice → save a Gmail **draft** → log it |
| **Quick Book** | "book…", "put … on my calendar" | Auto-Booking (Conflict Guard, guest invite, auto video link). If Conflict Guard blocks: don't ask — skip the booking, park the clash + the nearest open slots in the capture-log, and flag it in the report. **If the time was assumed, hold WITHOUT guests and park the invite** — a client never gets an invite for a guessed time |
| **Quick Cancel / Move** | "cancel my 3pm", "push the Lees to 4" | Rescheduling & Cancelling flow — organizer rule applies: agent's own event → delete (cancels for all); someone else's → decline + draft a note to the organizer, and never claim people were notified when they weren't. Log it |
| **Quick Recall** | "what do I know about…", "when did I last talk to…" | Total Client Recall — answer inside the report (read-only) |
| **Quick Prep** | "prep me for my next…", "prep me for [client]" | Meeting Prep 5-line brief (WHO · LAST · OPEN · WATCH · SAY) — answer inside the report (read-only) |
| **End-of-Day Wrap** | "wrap my day — [outcomes…]" | Log each stated outcome as a mini-debrief, mark mentioned promises Done, roll today's leftovers to tomorrow, then report: tomorrow's first appointment (with prep line) + follow-ups due + one first move. Never ask for missing outcomes in dispatch — note them as unreviewed |
| **Post-Showing Debrief** | "just showed [client] [address] — [reaction], [next step]" | Log the showing + reactions to the client, set the next action / follow-up, and optionally draft the follow-up email. **If the debrief holds a story-worthy moment** ("she cried at closing") hand that story to the Brain's realtor-capture (story bank) too — capture it, don't lose it |
| **Open-House Capture** | "log the open house at [address] — [groups], [hot leads]" | Create/update a record for each named lead; start a follow-up for each |
| **Quick Chase** | "who owes me?", "chase the lender" | The Chase lane (admin-chase): ranked waiting-on list + polite nudge drafts, never twice in 2 business days |
| **Quick Confirm** | "confirm tomorrow" | Tomorrow Confirmations (admin-confirmations): one draft per client appointment; guestless holds flagged, never confirmed |
| **Quick Vendor** | "book the photographer for Tue at 123 Main" | Vendor Dispatch (admin-vendors): request draft from `vendors.md` + guestless hold + await-confirm row |
| **Feedback Chase** | "get feedback on [address]" | Showing Feedback Chaser (admin-feedback): one request draft per showing agent + await-feedback rows |
| **Multi-Intent** | several of the above in one breath | Parse all, execute each, then ONE combined report |
| **Sibling hand-offs** | "just listed [address]" / "start the content" → the Listing Launch intake's dispatch door · "schedule/post this" → the Short-Form publisher | Route to the sibling plugin if installed; otherwise park in the capture-log with a note — never file a new listing as a client note |

## The report (what they see when it's done)
Plain text, glanceable. **Format fork: 1–2 intents → one warm sentence. 3+ intents → one
tagged line per action** (Booked: · Drafted: · Reminder: · Cancelled: · Parked:), any recall
or prep answer last after a blank line — never a comma-joined run-on at volume. Example (two
intents):
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
