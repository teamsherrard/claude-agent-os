# AI Brain Contract

The YouTube System is a **layer on top of the shared Realtor AI Brain.** It must READ from the Brain,
never duplicate it. Because the AI Brain is still evolving (built separately), this file is the agreed
interface between the two systems. **Keep it in sync with the AI Brain plugin.**

---

## Where to find the AI Brain (discovery order)
1. The active **Claude Project knowledge files** — brand persona, offer/USP, brand guide.
2. The **shared brain folder** (the agency/realtor brain location, e.g. a `realtor-brain/` folder).
3. If neither is found → tell the agent: *"I couldn't find your AI Brain — let's connect it first so
   we don't duplicate anything."* Only as a last resort, collect the minimum fields directly, and flag
   that they should run the AI Brain setup so it's captured centrally.

## Fields the YouTube System reads (and their source)
| What YouTube needs            | AI Brain source                |
|-------------------------------|--------------------------------|
| Identity (name, brokerage)    | Brand persona                  |
| Market / cities served        | Brand persona                  |
| Niche & positioning + angle   | Brand persona                  |
| Avatars / target viewers      | Brand persona (target market)  |
| Voice & tone                  | Brand persona (voice)          |
| Offer, USP, CTA, booking link | Offer / USP file               |
| Existing lead magnets         | Offer / USP file               |
| Brand kit (colors/fonts/logo) | Brand guide                    |

## Rules
- Field exists in the AI Brain → **use it silently. Never re-ask.**
- Field missing → ask ONLY that one field, then suggest adding it to the AI Brain (capture once, centrally).
- **Never write** identity / niche / avatars / offer / voice into the YouTube Layer — only reference them.
- AI Brain updates → the YouTube System reflects them automatically (no re-onboarding).

## TODO — align with the AI Brain team (still being built)
- [ ] Confirm the exact file names / folder path of the shared brain.
- [ ] Confirm the voice-profile format so on-camera refinement layers in cleanly.
- [ ] Confirm whether the Brain is a Project knowledge file, a folder, or both — and lock the discovery path.
