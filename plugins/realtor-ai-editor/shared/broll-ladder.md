# B-roll ladder & sources

The point of going multi-source: stop recycling the same five clips. Query several free libraries together, de-duplicate, and prefer variety.

**B-ROLL IS NOT OPTIONAL — every long-form / YouTube video ALWAYS gets at least some B-roll.** Even with no agent footage and no stock keys, use **Descript's built-in stock library** (zero setup, already in their account) for a few topical cutaways. Never deliver a long-form as a bare talking-head with zero cutaways — it reads flat and unfinished. (Short-form reels get b-roll on the key lines too; the always-a-minimum rule is non-negotiable for long-form.)

## Sources

| Source | Gives you | Key needed | Commercial use | Attribution |
|---|---|---|---|---|
| Own footage — uploaded for this video | the exact rooms / property | no | yes | no |
| Own footage — Google Drive library | reusable clips they keep | no (Drive connector) | yes | no |
| Listing photos — as motion stills | the actual property | no | yes | no |
| Descript built-in stock | photos + video | no (in their account) | yes | no |
| **Pexels** | photos + video | free key | yes | no |
| **Pixabay** | photos + video + music | free key | yes | no |
| **Coverr** | video | free key | yes | no |
| **Unsplash** | high-quality photos | free key | yes | not required |
| Wikimedia Commons | real-place photos (+ some video) | no | varies per item | sometimes (CC-BY) |
| Openverse | huge CC aggregator (photos/audio) | free key | varies per item | sometimes |
| Google Street View / Maps | the exact real location | free tier, then paid | per Google terms | — |

## Own footage first (and the has / has-none branch)

Always prefer the agent's own footage — from a Google Drive library, per-video uploads, or (for listings) the listing photos. See `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`. The key rule: **property-specific moments need property-specific footage/photos; generic moments can use stock.** Never imply stock footage is the actual listing. If they have *no* footage for a property video, fall back to listing photos (motion stills), not generic stock.

**Safe defaults** (commercial-OK, no attribution, has video): Pexels + Pixabay + Coverr, plus Unsplash for stills. Turning on two or three of these is what fixes the "Pexels keeps repeating" problem.

## The rules

1. **Try the ladder in order:** own footage → Descript stock → free stock libraries (queried together + de-duped) → real-place imagery → AI-generated (last resort, capped, warn first).
2. **Topical first** — search terms come from the transcript so footage matches the words.
3. **Local realism** — real places use real imagery (own footage / Wikimedia / Street View). Never AI-fake or use generic foreign stock for a specific local landmark.
4. **Variety** — every cutaway in a video is unique; **NEVER the same clip twice in a row** (a duplicated back-to-back clip looks broken — it plays, cuts, replays — and wastes credits). De-dupe across all sources; track what's been used.
5. **Placement & amount** — 2.5–5s each, on the exact words; **full-cover cutaways — NEVER a partial clip floating over the speaker's face**; never over the hook or CTA. **Amount: a short-form reel gets 3–5 clips TOTAL (not more — over-b-roll drains credits and clutters); long-form gets more, but curated, not constant.**
6. **Licensing** — prefer no-attribution sources. If a CC-BY item is used, auto-add attribution to the description or skip it. When unsure, fall back to the agent's own footage.

## Adding more later

All stock keys are optional and free. The agent can add Pexels/Pixabay/Unsplash/Coverr anytime in `editor-setup`; more sources = more variety, never required to start.
