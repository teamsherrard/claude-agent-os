# System-Wide Capture Layer — Spec

*Dispatch graduates from an AI Admin feature to a universal capture layer across all six plugins.
The agent talks on the go; whatever they say lands in the right place. Capture once → route → never
lose it. Companion to `dispatch-spec.md` (the AI-Admin-only first version).*

## Where it lives — the architecture decision
**The capture layer belongs in the Brain (Plugin 1), not the AI Admin.** Three reasons:
1. **Everyone installs the Brain** — so capture works even for an agent who has YouTube but not the Admin.
2. **Capture is a memory function** — it writes to the Brain; that's its natural home.
3. **It's the shared front door** — one place to "just say it," routing to whichever plugins are installed.

So: a new Brain skill **`realtor-capture`** is the universal capture front door.

**Boundary with the AI Admin (no overlap):**
- **Brain `realtor-capture`** = capture & FILE *knowledge* (ideas, wins, intel, vendors, edit notes) into Brain memory.
- **AI Admin dispatch** = capture & EXECUTE *admin actions* (book, draft, reschedule, remind) on the connectors.
- A capture that needs an action AND the Admin is installed → hand off to it. If the Admin isn't installed → park the intent in `ideas.md` and say so.

## The router (how one utterance is classified)
| The agent says… | Type | Routes to |
|---|---|---|
| "video idea / great hook / outline this…" | content idea | `memory/ideas.md` (tag: youtube) |
| "reel idea / talking-head topic / saw a trend…" | content idea | `memory/ideas.md` (tag: shortform) |
| "lead-magnet idea / new offer angle…" | content idea | `memory/ideas.md` (tag: leadmagnet) |
| "just closed / great review / hit a milestone…" | **win / proof** | `identity/proof.md` |
| "note: [market fact / new development / school]…" | local intel | `identity/market.md` |
| "add a vendor: [name, role, contact]…" | vendor | `identity/vendors.md` |
| "for the [video] edit, add…" | edit note | `memory/ideas.md` (tag: edit) |
| "book / draft / reschedule / remind me…" | admin action | hand to the AI Admin (or park) |
| anything ambiguous | — | `memory/capture-log.md` → surfaced in the briefing |

Every capture confirms in ONE line ("Saved your video idea to your content backlog") and never blocks
on a question — same hands-free rules as the AI Admin dispatch.

## The new Brain memory: `memory/ideas.md` (the idea backlog)
One row per captured idea — the content/idea inbox that the creative plugins read:
```
# Ideas & Backlog
*memory · on-the-go captures of content ideas, hooks, and angles. Capture writes here; the YouTube,
Short-Form, and Lead-Capture plugins read it when planning and mark each one Used.*

| Logged | Tag | Idea | Status |
|--------|-----|------|--------|
| 2026-06-25 | youtube | 3 mistakes first-time buyers make in this market | New |
| 2026-06-25 | shortform | react to the Calgary rent article | New |
```

## The consume side (each plugin reads what's captured)
- **YouTube (3):** ideation + Game Plan read `ideas.md` (tag youtube) and surface the agent's own ideas
  alongside generated ones; develop on the spot; mark Used.
- **Short-Form (4):** setup + talking-head/green-screen read `ideas.md` (tag shortform) as the topic backlog.
- **Lead Capture (5):** the magnet skill reads `ideas.md` (tag leadmagnet) for concepts.
- **AI Editor (6):** reads edit-note captures for the relevant video when an edit starts.
- **The Brain (1):** wins → `proof.md`, intel → `market.md`, vendors → `vendors.md` — enriching identity,
  which then powers every plugin. **The win/proof capture is the sleeper hit** — it auto-builds the proof
  library from the car, the asset most agents never maintain.

## What gets built / updated
- **NEW** Brain skill `realtor-capture` (the router + Brain writes + the AI-Admin hand-off).
- **NEW** Brain memory `memory/ideas.md` (+ added to the brain template + indexed in `brain.md`).
- **Content plugins**: a small "read the idea inbox" step in their planning skills (YouTube ideation/gameplan,
  short-form setup/workflows, lead-capture magnet).
- **AI Admin**: its `dispatch-capture.md` defers *knowledge* captures to `realtor-capture` and keeps the
  *execution* jobs — clean boundary, no double-trigger.

## Game plan
1. Lock the spec + confirm the Brain-level home.
2. Build `realtor-capture` + `memory/ideas.md` in the Brain (the keystone).
3. Teach the content plugins to read the idea inbox (the consume side).
4. Refine the AI Admin dispatch boundary (knowledge → Brain; actions → Admin).
5. Cold-test on the go (capture a video idea, a win, a vendor — confirm each lands right).
6. Ship (Brain + touched-plugin version bumps).

## Concurrency note
The Brain plugin (and several others) is being actively developed in a parallel session. This build
touches Plugin 1 and the content plugins, so we commit it as one clean, coordinated change to avoid clashing.
