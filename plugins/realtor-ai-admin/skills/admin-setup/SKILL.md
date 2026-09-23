---
name: admin-setup
description: >-
  One-time onboarding for the Realtor AI Admin — run once, ~10 minutes. Verifies the Brain and connectors (Google or Microsoft world), names the assistant, catches timezone mismatches, creates the Gmail labels / Outlook categories, installs the TWO scheduled automations (7am Morning Briefing, weekday Inbox Sweep) with duplicate-proof and crash-proof guards, runs a live first-booking test, and hands over. Re-running is a health check, never a rebuild. Trigger on: "set up my AI admin", "build/start my AI admin", "check my AI admin", "is my admin set up right", "my briefing/sweep times", "change my briefing time", "change my sweep time".
---

**Apply `${CLAUDE_PLUGIN_ROOT}/shared/admin-core.md` FIRST, every session** — the Brain load, speed rules (the Mike Test), Google/Microsoft provider mapping, the Name-Resolution Ladder, the sync rule, sibling boundaries, and privacy law all live there and govern everything below.

# One-Time Setup

# ONE-TIME SETUP — "Set up my AI Admin"

Run when asked to set up / build / start AI Admin. Plain English, one step at a time.
**No mystery steps:** before creating anything (a label, a scheduled task, a folder) or asking
the agent to create/approve anything, say in ONE plain line what it is and why it exists —
"I'm creating 7 Gmail labels; they're how I sort your inbox every weekday morning." An agent
must never have to build something they don't understand.
**Re-run guard:** if `config.md` already holds the task ids, this is a health check, not a
rebuild — verify the connectors and both automations still work, repair what's broken, and
never create duplicate tasks or labels.

1. **Brain check.** Load the Brain (Step 0). If `identity/operations.md` is still placeholders,
   run the **realtor-operations** skill first (~3 min — most agents just confirm the standard
   defaults) — it captures hours, signature, booking rules, the standing virtual-meeting link,
   and vendors. Don't duplicate its questions.
2. **Name the assistant (optional, 10 seconds).** Ask once: "Want to give your assistant a name —
   or keep it simple and call it your AI Admin?" Save it in `config.md` (assistant name; default
   **AI Admin**). The briefing signs with it.
3. **Connector check.** Verify by making one trivial read each: **Gmail**, **Google Calendar**,
   **Google Drive** (required), **Zoom** (recommended — test whether it can CREATE meetings, not
   just read them; delete the test meeting; note the result in `config.md`), **Cal.com**
   (optional). Anything missing → walk them through Settings → Connectors, then re-verify.
   **Timezone guard:** read the calendar's own timezone while you're there and compare it to
   `operations.md`. If they disagree — or the Brain's timezone is a placeholder — ask ONCE
   ("Your Google Calendar is set to America/Chicago, but you're in Calgary — should I run
   everything on America/Edmonton?"), write the answer to `operations.md`, and tell them their
   Google Calendar setting may need fixing too (Google Calendar → Settings → Time zone). A wrong
   timezone silently shifts the 7am briefing, the sweep, and every booking — catch it here, once.
   **Calendars:** list the account's calendars and ask once which ones the agent actually uses
   (many teams keep a shared showings calendar) — write them to `config.md` so Conflict Guard,
   Day View, and the briefing check all of them, not just primary.
   **Shared inbox:** ask once — "Does a human assistant or VA also work this inbox?" If yes,
   record their address(es) in `config.md`; the sweep uses this to skip threads they've already
   answered.
4. **Permission smoothing.** During the first-run test below, permission dialogs will appear for
   calendar/Gmail/Drive tools. Tell the agent: choose **"Always allow"** — that's what makes
   daily use one-message-fast instead of a gauntlet of approval taps.
5. **Label taxonomy.** Create the seven if missing — Gmail labels on `google`, Outlook
   **categories** on `microsoft`: `Hot Lead`, `Active Client`, `Under Contract`, `Lender-Title`,
   `Brokerage`, `Personal`, `Promotions`. On `microsoft`, verify tagging actually works (apply
   one category to a thread, then remove it) — if writes are org-gated, record `Sweep:
   report-only` in `config.md` and tell the agent plainly (triage still runs; labels wait on
   their IT admin). Ask once whether the daily sweep may ARCHIVE junk mail or only label it;
   record the choice in `config.md`.
6. **Automations.** First check the scheduled-task list — if a Morning Briefing or Daily Inbox
   Sweep already exists, adopt/update it instead of creating a twin. Then create what's missing,
   in the agent's timezone (from `operations.md`), save both task ids in `config.md`, and **push
   `config.md` to Drive right away** (a setup crash must not orphan these ids into duplicates):
   - **Morning Briefing** — daily 7:00am, prompt from `${CLAUDE_PLUGIN_ROOT}/shared/briefing-prompt.md`
   - **Daily Inbox Sweep** — weekdays 8:30am, prompt from `${CLAUDE_PLUGIN_ROOT}/shared/daily-inbox-sweep.md`
   Ask once: "Briefing at 7am daily and sweep weekday mornings — good, or different times?"
   (skip = defaults; save the choice to `config.md`). Later requests like "change my briefing
   time" update the existing task via its saved id — never a second task.
   **Jarvis-era check:** if a scheduled task or ledger from the old course "realtor-jarvis"
   skill exists (a briefing task that emails, a separate client ledger, a dashboard artifact),
   offer the one-line migration — "found your old Jarvis briefing — replacing it with the
   Brain-backed one" — and retire the old task. This plugin supersedes the course skill.
7. **First-run test (do it WITH them).** Book a real test event ("book a showing at 123 Main
   tomorrow 2pm" — if that slot clashes, auto-pick the nearest free time and say so; the guard
   firing IS part of the demo) → confirm it's on their calendar → **on `microsoft`, also verify
   a Teams link can attach to the test event and record `Teams links: yes/no` in `config.md`**
   (this is the video-link probe — Zoom's is at step 3) → log a client note → run the briefing
   once → **delete the test event AND the test client note** (remove the test block and any
   deadlines row it created — a fictional client must not headline tomorrow's first real TOP 3;
   skip cleanup only if they used a real client/appointment). Then hand over: "Talk to me like
   an assistant. Every morning your briefing and a sorted inbox are waiting — and on the go, just
   send me a voice note: 'remember this, remind me Thursday, draft them a thank-you.' I'll handle
   it and report back."
8. **Push to Drive.** Sync the brain (config now holds the assistant name, task ids, and the
   sweep choice).

---

