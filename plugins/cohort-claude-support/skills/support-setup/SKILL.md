---
name: support-setup
description: >
  One-time configuration for Cohort Claude Support itself — two minutes, run once after
  installing the plugin. Records the little that support needs to personalize itself: the
  member's cohort start date (so "what week am I in" works), their name if the Brain doesn't
  have it, and a snapshot of what's installed today. Creates support's two memory files
  (support-log and claude-updates) and confirms the escalation doors from the cohort knowledge
  base. Reads everything it can from the Brain first and never re-asks what's already known.
  Trigger on: "set up my support", "set up cohort support", "configure support", "support
  setup" — or OFFERED at the END of a support session when the member has a Brain but no support
  config yet. Never as a detour before their actual question is resolved, and never when no
  Brain exists (the Brain comes first; this is not the first step).
---

# Support Setup — two minutes, once

Support mostly works with ZERO setup — help, teaching, and diagnosis need nothing. This skill adds
the personal layer: week tracking, the log files, and a confirmed escalation path.

**Read first:** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`,
`${CLAUDE_PLUGIN_ROOT}/shared/plain-language.md`.

## Preflight

The Brain must exist (`~/realtor-brain/` with `config.md`) — support's files live inside it so
`realtor-brain-sync` carries them to the member's cloud drive automatically. **Pull first** if
sync is installed (house rule #6 — the local desk may be stale or empty). No Brain → this isn't
the first step; route `support-onboard` (which routes `realtor-brain-setup`) and come back
after.

## The steps

1. **Read before asking.** From the Brain: name (`identity/profile.md`), timezone (`config.md`).
   From `${CLAUDE_PLUGIN_ROOT}/shared/cohort-kb.md`: program doors (support portal, community).
   Never re-ask any of it.
2. **Ask the ONE real question:** *"What date did your cohort start? (It's on your welcome email —
   a Monday. If you're not sure, tell me roughly when you joined and I'll work it out.)"* Rolling
   or unknown → store their best answer with `approx: true`; `support-cohort` phrases weeks
   softly when approximate.
3. **Write the config block** — append to `~/realtor-brain/config.md` (this block is the ONE
   sanctioned support write outside the two log files; it touches nothing else in the file):

   ```markdown
   ## Cohort Support (Plugin 9)
   - Cohort start: YYYY-MM-DD  (approx: false)
   - Configured: YYYY-MM-DD · plugin vX.Y.Z
   - Snapshot at setup: [plugins seen installed, one line]
   - Escalation doors: portal [from cohort-kb] · community [from cohort-kb or NOT SET]
   ```

4. **Create the two support files** (with headers, if missing):
   - `~/realtor-brain/memory/support-log.md` — `| date | category | question | fix | resolved |`
   - `~/realtor-brain/memory/claude-updates.md` — *"Digest of Claude changes that matter to this
     system. Newest first."*
5. **Confirm the doors.** The support portal comes from cohort-kb (never mention any support
   email — Mike's rule; the portal is the only Mike-side channel). Any door still `[NOT SET]`
   (community, recordings, office hours) → say so honestly: *"That link isn't wired into me yet —
   check your welcome email, and I've noted the gap for Mike's team."* (Logged; it shows up in
   Mike's insights.)
6. **Hand them the habit:** *"You're set. One thing to remember, ever: when anything confuses or
   breaks, say* **'help'** *— I'll take it from there. Works great in voice mode from your phone
   too."*

Re-running later is safe: it updates the existing block in place (correcting a start date,
refreshing the snapshot) — it never duplicates the block and never touches anything else in
`config.md`. Close per house rule #6: log `setup` complete.
