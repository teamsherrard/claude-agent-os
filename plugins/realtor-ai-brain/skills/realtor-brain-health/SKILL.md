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

## How you speak
**Read `${CLAUDE_PLUGIN_ROOT}/shared/how-we-speak.md` first — it binds this skill.** Plain language only:
never show file names, paths, or schema/version talk in what the agent reads ("I haven't captured how you
*talk* yet", never "voice-print.md is missing"). A health check must read as an encouraging progress
report, not a defect list — lead with what's strong, and never call by-design emptiness a problem (§3).

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md`, then scan every file in `identity/` and `memory/` plus `config.md`.
If `~/realtor-brain/` doesn't exist, tell them to run **Realtor AI Brain — Setup** first.

## Step 2 — Score each domain
For each, mark ✅ complete · 🟡 thin (present but sparse/generic) · ⬜ empty (placeholder/`[brackets]`):

**The completeness bar is the FIRST-RUN ELEVEN only** (per `how-we-speak.md` §3): profile · market ·
avatars · voice · offer · brand-visual · voice-samples · proof · content-engine · business-plan ·
compliance. Score those.
**NEVER counted against them, never called "missing"** — these are unbuilt BY DESIGN after a perfect
first run: operations · vendors (built with the AI Admin) · voice-print · story-bank (optional depth
layers) · strategy · publishing (written by other systems when those run) · and **everything in
`memory/`** (clients, listings, content-log, deadlines, ideas, performance, market-data — they start
empty and fill as the agent works; an empty memory on a new Brain is a healthy new Brain).
**Assets:** logo present? · headshot present?
**Connectors** (from `config.md`): Gmail · Calendar connected?

Compute an overall completeness % (weight the 🟢-core domains heaviest) and a one-line grade.

## Step 3 — Report + recommend
Present:
- **Overall:** "Your brain is 72% complete — strong foundation."
- **✅ Solid:** the domains that are good.
- **🟡 Could be richer:** thin ones, with what to add.
- **⬜ Worth adding — biggest wins first:** only from the first-run eleven, ordered by impact, each
  named in plain words with the exact phrase that fills it. Frame every one as an UPGRADE, never a
  defect or a gap.
- **The optional depth layers** (spoken voice, story bank) get ONE friendly offer if absent — *"one
  thing that would make every script sound more like you…"* — never a ⬜ and never a score penalty.
- **One recommended next action:** the single highest-impact thing, with the exact phrase to trigger it
  (e.g. *'add my writing samples'*).
- **Housekeeping LAST, one line** (how-we-speak §4): if the structure is behind, *"whenever you've got a
  spare minute, say 'upgrade my brain' — nothing is lost, takes a minute."* Never version/schema talk,
  never the lead item.

Keep it warm and specific. Don't invent data — only report what's actually in the files. A complete
first-run Brain should score as COMPLETE — if the math says otherwise, the scoring is wrong, not the agent.
