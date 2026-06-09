---
name: realtor-brain-health
description: >
  Audits a Realtor AI Brain for completeness and quality, then tells the agent exactly what to add to
  make every other skill work better. Scans all identity and memory files, scores how complete the
  brain is, flags empty or placeholder sections, and recommends the highest-impact next step. A brain
  that checks its own health.

  Trigger on: "check my brain", "is my brain complete", "what's missing from my brain", "brain health",
  "audit my brain", "how good is my brain", "brain checkup", or any request to review the state or
  completeness of the agent's Brain.
---

# Realtor Brain Health Check

Audits the agent's Brain and returns a clear, encouraging report of what's strong and what to add next.
Never scolds — frames gaps as easy wins.

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, then scan every file in `identity/` and `memory/` plus `config.md`.
If `~/realtor-brain/` doesn't exist, tell them to run **Realtor AI Brain — Setup** first.

## Step 2 — Score each domain
For each, mark ✅ complete · 🟡 thin (present but sparse/generic) · ⬜ empty (placeholder/`[brackets]`):

**Identity:** profile · market · avatars · voice · offer · brand-visual · voice-samples · proof ·
content-engine · operations · vendors · strategy · compliance
**Memory:** clients · listings · content-log · deadlines *(these fill over time — don't penalize a new brain)*
**Assets:** logo present? · headshot present?
**Connectors** (from `config.md`): Gmail · Calendar connected?

Compute an overall completeness % (weight the 🟢-core domains heaviest) and a one-line grade.

## Step 3 — Report + recommend
Present:
- **Overall:** "Your brain is 72% complete — strong foundation."
- **✅ Solid:** the domains that are good.
- **🟡 Could be richer:** thin ones, with what to add.
- **⬜ Missing — biggest wins first:** ordered by impact. Always surface these high-leverage gaps if
  empty: **writing samples** (voice quality), **proof** (reused everywhere), **compliance** (safety),
  **headshot/logo** (graphics), **operations** (Jarvis).
- **One recommended next action:** the single highest-impact thing, with the exact phrase to trigger it
  (e.g. *'add my writing samples'*).

Keep it warm and specific. Don't invent data — only report what's actually in the files.
