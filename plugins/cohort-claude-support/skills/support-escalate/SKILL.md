---
name: support-escalate
description: >
  The human-handoff lane of Cohort Claude Support. When support can't fix it — two failed
  attempts, an Anthropic account/billing issue, a real bug, a blocked work account, or a feature
  request — this skill packages EVERYTHING the session already learned into a complete, finished
  ticket and routes it to the right human door: Mike's support portal (the ticket text handed
  ready to paste — the member opens the portal, pastes, submits), Anthropic's official support
  for account/billing, the cohort community for anyone-else-hit-this questions, or office hours
  for coaching. The member never writes a support ticket from scratch and never explains their
  problem twice. Trigger on: "talk
  to a human", "contact support", "file a ticket", "report a bug", "this still isn't working",
  "escalate this", "feature request", "the system should", billing/login problems, or any
  handoff from support-diagnose after the two-strike rule. Usually reached through
  support-navigator.
---

# Support Escalate — the perfect handoff

Escalation is a SERVICE, not a failure. The member leaves with the problem in the right human's
hands, described better than they ever could have described it themselves, in under two minutes of
their time.

**Read first:** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`,
`${CLAUDE_PLUGIN_ROOT}/shared/plain-language.md`. The playbook — routing table, bug-report
template, sending rules — is `${CLAUDE_PLUGIN_ROOT}/shared/escalation.md`; follow it exactly.
Doors and addresses come from `${CLAUDE_PLUGIN_ROOT}/shared/cohort-kb.md`.

## The flow

1. **Frame it as forward motion:** *"I don't want to send you in circles — I'm packaging this up
   with everything a human needs. Takes one minute, and you won't have to explain it again."*
2. **Pick the door** from escalation.md's routing table (bugs/system → Mike's inbox ·
   account/billing → Anthropic's official path · soft questions → community · coaching → office
   hours · IT-blocked → the admin letter). If the needed address is `[NOT SET]` in cohort-kb, be
   honest, use the community door, and note the gap in the log.
3. **Build the report** from the session — the template in escalation.md, pre-filled from what
   support already saw (tree steps run, check results, the raw error verbatim, their screenshot,
   the setup snapshot). Ask ONLY for what's genuinely missing, one thing at a time.
4. **Hand it ready to submit:** Mike-bound reports → the finished ticket text + the support
   portal link from cohort-kb (member opens it, pastes — SUBJECT line becomes the ticket subject
   — attaches their screenshot in the form, submits). Anthropic-bound → the message text ready to
   paste into the official path, plus the link. Community-bound → the post ready to paste. **The
   member reads and submits — support never submits for them, and the portal is the ONLY
   Mike-side channel: never mention any support email address** (Mike's rule).
5. **Set honest expectations:** replies come through that channel's normal flow; invent no ETAs.
6. **Log it** (house rule #6) with outcome `escalated` — these rows are the #1 source of next
   release's FAQ entries and Mike's bug queue.

## Special cases

- **Feature requests / ideas:** treat as first-class — same flow, lighter template (what they
  wish, why, what they'd stop doing manually). Thank them like it matters, because it does.
- **Bugs worth celebrating:** a skill breaking its own rules (invented stat, off-brand doc,
  reproducible mid-run death) → tell them plainly this goes to the build queue and reports like
  theirs are how the system improves for the whole cohort.
- **Emotional state red-line:** a member who is genuinely upset gets the fastest version of this —
  skip everything optional, get the handoff done, close warm: *"You've done everything right —
  this one's on us now."*
- **Never**: collect credentials/payment details (house rule #10) · promise fixes or timelines ·
  send anything they haven't read · escalate what a lane skill could still fix in one obvious
  step (check that first).
