---
name: realtor-capture
description: >
  The on-the-go capture layer for the whole Realtor AI Brain — the agent talks while driving, at a
  showing, or between meetings, and whatever they say lands in the right place. Captures CONTENT IDEAS
  (video / reel / hook / outline), WINS (closings, reviews, milestones → the proof library), MARKET
  INTEL, new VENDORS, OFFER angles, and EDIT NOTES into the Brain, and routes anything actionable to
  the AI Admin. One line in, one line back, never a lost thought. The content systems (YouTube,
  Short-Form, Lead Capture, AI Editor) read what it captures when they plan.

  Trigger on: "I've got a video idea", "video idea", "reel idea", "content idea", "great hook",
  "hook idea", "outline this video", "lead magnet idea", "new offer angle", "just closed", "we just
  closed", "just got a review / testimonial", "quick win", "add a vendor", "great lender / contractor",
  "market note", "note for my market", "for the [video] edit add…", "remember this idea", "capture
  this", "add to my backlog", or any on-the-go idea / win / intel / vendor the agent wants saved.
  (Client notes, reminders, email drafts, and bookings are the AI Admin's dispatch — not this skill.)
---

# Realtor Capture — the system-wide on-the-go capture layer

The agent is mobile and can't sit in a chat. They just say it; you file it in the right place and
confirm in one line. This is the Brain's universal "just say it" front door — it feeds the Brain's
identity + memory, and the content systems read what you capture when they plan, so a thought from the
car becomes a finished video, a proof point, or a referral instead of evaporating at the next red light.

## Hands-free rules (the same discipline as the AI Admin's dispatch)
1. **Capture-first — never lose a thought.** If you can't classify it cleanly, still save it to
   `memory/capture-log.md` (create it if absent) so nothing evaporates. A lost capture is the only failure.
2. **Act, don't ask.** No clarifying questions — file it on your best read and state the assumption in
   the one-line confirm. Queue genuine ambiguity to the capture-log; don't block.
3. **Parse every intent.** One breath can hold several (a win AND a video idea) — capture each.
4. **Voice-tolerant.** Messy transcription in, clean entry out. Keep the idea **verbatim** plus a
   one-line cleanup; never lose their actual words.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`. If `~/realtor-brain/` is missing, PULL it from Drive
(**realtor-brain-sync**). If there's no Brain anywhere, tell them to run **"Set up my Brain"** and stop.

## Step 2 — Classify & route (one utterance → the right file)
| The agent says… | Type | Append to |
|---|---|---|
| "video idea / great hook / outline this video…" | content idea | `memory/ideas.md` — tag `youtube` |
| "reel idea / short idea / talking-head topic / saw a trend…" | content idea | `memory/ideas.md` — tag `shortform` |
| "lead-magnet idea…" | content idea | `memory/ideas.md` — tag `leadmagnet` |
| "for the [video] edit, add [b-roll / chart / zoom]…" | edit note | `memory/ideas.md` — tag `edit` (name the video) |
| "just closed / we closed / got a 5-star review / hit [milestone]…" | **win / proof** | `identity/proof.md` |
| "market note / new development / new school / prices doing X…" | local intel | `identity/market.md` |
| "add a vendor / great lender / great contractor: [name, contact]…" | vendor | `identity/vendors.md` |
| "new offer angle / I should emphasize…" | positioning | `identity/offer.md` (append a note — don't rewrite) |
| a client note, reminder, email, or booking | admin action | **hand to the AI Admin** (its dispatch). If it isn't installed, park the intent in `memory/deadlines.md` and say so |
| can't tell | — | `memory/capture-log.md` → the morning briefing asks |

## Step 3 — Write it (append, never overwrite)
- **`memory/ideas.md`** — one row: `| [date] | [tag] | [idea verbatim + one-line cleanup] | New |`.
  Create the file from its template header if it doesn't exist yet.
- **`identity/proof.md`** — the win/review with the date and, if known, the client + the number
  ("$50k under ask", "12 days on market"). Proof is reused across listings, lead magnets, and bios, so
  capture the specifics — but never invent a number you weren't given.
- **`identity/market.md`** — the intel, under the relevant community.
- **`identity/vendors.md`** — the partner: name · role · contact · one-line why.
- **`identity/offer.md`** — the positioning idea as an appended note.

## Step 4 — Sync
Push the changed files to Drive (**realtor-brain-sync** PUSH) once, at the end. An unsynced capture is
a lost capture.

## Step 5 — Confirm (one line, glanceable)
"Saved your video idea to your content backlog." · "Logged the Henderson close to your proof library."
· "Added Sarah (RBC) to your vendors." Several captures → one line each. Parked something → say so:
"Saved — I'll confirm which listing in your morning briefing."

## The boundary with the AI Admin (no double-handling)
This skill **captures knowledge** (ideas, wins, intel, vendors, offer angles, edit notes) into the
Brain. The **AI Admin's dispatch** takes **actions on connectors** (book, draft an email, reschedule,
set a reminder, client notes, post-showing debriefs, open-house leads). If a capture is really an
action and the Admin is installed, hand it there; if not, park it. For a full, structured proof-library
session (not a quick on-the-go win), that's **realtor-voice-proof**.
