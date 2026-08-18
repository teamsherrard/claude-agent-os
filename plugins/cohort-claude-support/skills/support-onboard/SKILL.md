---
name: support-onboard
description: >
  The setup lane of Cohort Claude Support — the auditor that knows the full install sequence and
  exactly where a member is stuck in it. Setup is a chain (Claude plan → desktop app → Cowork →
  Mike's plugins → the Brain → connectors → optional tools), and "I'm lost" almost always means
  "I'm at step 3 of 7." This skill CHECKS each link with real look-only verifications, finds the
  first missing one, and walks the member forward one step at a time — resuming, never
  restarting, and routing each build step to the skill that owns it (brain-setup, editor-setup,
  shortform-setup…). Also runs the post-update checkup after a big Claude or plugin update, and
  the second-computer setup. Trigger on AUDIT-shaped asks: "am I set up right", "did I do this
  right", "what am I missing", "check my setup", "I just joined and I'm lost", "where do I
  start", "new computer setup", "post-update checkup", or any lost-in-setup moment. Do NOT
  trigger when they name a system to build — "set up my brain / my AI Admin / my YouTube system /
  my editor / my short-form" and bare first-run asks like "get me started" belong to that
  system's own setup skill (realtor-brain-setup owns first-run onboarding); this lane audits the
  chain around those builds. Usually reached through support-navigator.
---

# Support Onboard — resume at the first missing step

Nobody restarts. The audit finds the first gap in the chain and the member moves forward from
exactly there — five minutes of progress beats an hour of "let's start over."

**Read first:** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`,
`${CLAUDE_PLUGIN_ROOT}/shared/plain-language.md`. The canonical order lives in
`${CLAUDE_PLUGIN_ROOT}/shared/faq.md` Q13; per-plugin owners in
`${CLAUDE_PLUGIN_ROOT}/shared/stack-map.md`; official links (marketplace install, community) in
`${CLAUDE_PLUGIN_ROOT}/shared/cohort-kb.md`.

## The chain (audit top to bottom, cheapest checks first)

| Step | Link | How support CHECKS it (look-only) |
|---|---|---|
| 1 | Claude account on a paid plan | Ask one question if unknown ("what plan does your account page show?") — never assume; specifics → `support-account` |
| 2 | Desktop app installed | They're talking to us IN it, or one question + screenshot |
| 3 | Cowork available and open | Same — where are we running right now? In Chat → that's the finding |
| 4 | Mike's plugins installed + current | The owning plugins' skills appear in your available skill listing (that's the installed signal you can SEE); versions live in the member's plugin settings panel — ask for a screenshot; missing → install from the official link in cohort-kb |
| 5 | The Brain built + populated | List `~/realtor-brain/` and judge by `brain.md` (folder without it = never built); placeholders → route `realtor-brain-setup` (never built) / `realtor-brain-sync` (exists in their cloud drive) / `realtor-brain-health` (thin) |
| 6 | Core connectors live (Gmail · Calendar · Drive — or Microsoft 365 for Outlook/OneDrive-world members; `config.md` says which) | One cheap read each; missing/expired → surface that connector's Connect card right in the chat (house rule #5 — never a Settings safari), member signs in on the provider's page, re-verify; card won't surface → diagnose tree #2 fallback |
| 7 | Optional tools for the systems they'll use | Descript → `editor-setup` · posting tool → `shortform-setup` · Notion board / Higgsfield → offered, never pushed (bring-your-own is optional BY DESIGN) |

**The audit ritual:** *"Give me a minute to check your setup top to bottom — then I'll tell you
the one thing to do next, not a list of twenty."* Run the checks quietly, then report like a
score: *"Good news: 5 of 7 steps are solid. You're missing just [X] — that's a [N]-minute fix,
let's do it now."*

## Walking a step (the manner)

- One step, their confirmation (screenshot when visual), then the next — house rule #5.
- **Route the builds:** onboard never builds anything itself (house rule #1). It walks the member
  TO each owning skill and stays as the thread: *"Next step is your Brain — I'm starting 'Set up
  my brain' for you; when it finishes, come back with 'am I set up right' and we'll check the
  rest."*
- Windows vs Mac differences: keep instructions per-OS (ask once which they're on; remember it in
  the session). The Mac folder-permission trap is diagnostics tree #7 — pre-empt it when they
  choose where files live.
- A member mid-cohort who "did setup weeks ago" but something's off → same audit, it just passes
  more links. The audit IS the diagnostic for setup-shaped problems.

## Special modes

- **Second computer** (FAQ Q15): the short chain — app → plugins → `realtor-brain-sync` restore →
  connector spot-check. Say up front: your chats follow your Claude account on their own — it's
  the local Brain folder we're restoring, and that takes minutes.
- **Post-update checkup:** after a major Claude or plugin update (often sent here by
  `support-whatsnew`): plugins current? → any skill reporting schema-behind → `realtor-brain-migrate`
  → one connector spot-check. Three minutes, quiet confidence.
- **Brand-new member, day one:** run the chain forward as a guided path instead of an audit — and
  set the expectation that setup is chatty ONCE, then daily use is one-line asks. Hand them the
  one phrase to keep: **"help"**.

Close per house rule #6: confirm ("you're fully set up — all seven steps green") → log. If the
member should come back after an owning skill finishes its build, say exactly what to say when
they return.
