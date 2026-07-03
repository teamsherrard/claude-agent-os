# AI Brain Contract

The YouTube System is a **layer on top of the shared Realtor AI Brain.** It must READ from the Brain,
never duplicate it. The Brain's structure is locked (Plugin 1 — `realtor-ai-brain`): it lives at
**`~/realtor-brain/`** with `brain.md` (the index) + `identity/*.md`, and its permanent home is the
agent's Google Drive ("Realtor AI Brain" folder), synced by `realtor-brain-sync`. **Keep this file in
sync with the AI Brain plugin.**

---

## Where to find the AI Brain (discovery order)
1. **`~/realtor-brain/brain.md`** — the local working copy. If it exists, read it (+ the `identity/`
   files below) and go.
2. Not there? **Restore it from Drive** — the Brain's permanent home is the agent's "Realtor AI Brain"
   folder in Google Drive; pull it down via `realtor-brain-sync` (the local sandbox is wiped between
   sessions, so a missing local copy is normal, not a missing Brain).
3. Not in Drive either → the agent has no Brain yet. Route them to **`realtor-brain-setup`**: *"I couldn't
   find your AI Brain — let's set it up first so everything else knows who you are."* Never collect the
   fields ad-hoc instead — the Brain is captured once, centrally.

## Fields the YouTube System reads (and their source)
| What YouTube needs                       | AI Brain source (`~/realtor-brain/identity/`)  |
|------------------------------------------|------------------------------------------------|
| Identity (name, brokerage)               | `profile.md`                                   |
| Market / cities / communities served     | `market.md`                                    |
| Niche & positioning + angle              | `profile.md`                                   |
| Avatars / target viewers                 | `avatars.md`                                   |
| Voice & tone (+ real writing samples)    | `voice.md` + `voice-samples.md`                |
| Offer, USP, CTA, booking link            | `offer.md`                                     |
| Existing lead magnets                    | `offer.md`                                     |
| Proof (testimonials, wins, stats)        | `proof.md`                                     |
| Business goals (drive the goal-math)     | `strategy.md`                                  |
| Posting cadence + content pillars        | `content-engine.md`                            |
| Disclaimers + claims rules               | `compliance.md`                                |
| Brand kit (colors/fonts/logo direction)  | `brand-visual.md`                              |

## Rules
- Field exists in the AI Brain → **use it silently. Never re-ask.**
- Field missing → ask ONLY that one field, then suggest adding it to the AI Brain (capture once, centrally).
- **Never write** identity / niche / avatars / offer / voice into the YouTube Layer — only reference them.
- AI Brain updates → the YouTube System reflects them automatically (no re-onboarding).
