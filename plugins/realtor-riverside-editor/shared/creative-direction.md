# Creative direction — the edit brief (decide before you touch anything)

A human editor asks three questions before opening the timeline: who is this for, what should they feel, and what is the one thing they must remember. This craft answers them in a short **edit brief**, so every later decision (what to cut, where B-roll goes, how loud the energy is) has a reason. It changes nothing on the video.

## Build the brief from what already exists (ask almost nothing)

Read, in this order: the transcript (`preflight-check.md`), the Brain (`identity/avatars.md`, `identity/voice.md`, `identity/content-engine.md`, `identity/brand-visual.md`), the editor config (`style_pack`, `caption_style`, saved preferences from past revisions), the video's script or outline if the YouTube or Short-Form System made one, and `memory/ideas.md` (tag `edit`) for notes the agent captured on the go.

Ask at most ONE question, only if the format is genuinely unclear: *"Is this a YouTube video or a reel? (I'd guess YouTube from the length.)"*

## The brief (say it back in five plain lines, get one yes)

1. **Who and why** — "This is for relocating families deciding on Phoenix; the takeaway is that the honest downsides are manageable."
2. **Shape** — format and target length: "16:9, about 12 minutes from 15" / "a 40-second reel."
3. **What comes out** — the repeated takes, the dead air, any tangent that does not serve the takeaway. Named, with the line quoted.
4. **What gets featured** — the 3 to 5 moments that carry the video, chosen from what the agent said AND how they said it (Riverside's emotion events: the laugh, the surprise, the serious turn): they get the biggest zooms, the pop-ups, the best B-roll.
5. **Feel** — the style pack in plain words (below) and the music call.

The recipe per video type (market update, listing, tips, testimonial, interview) is in `${CLAUDE_PLUGIN_ROOT}/shared/content-types.md`.

## Style packs in plain words

| Pack | Say it like this | What it changes |
|---|---|---|
| `bold-kinetic` (default) | "Punchy and confident" | the high end of the zoom rate (sizes up to 1.14), pop-in cards, heaviest type |
| `clean-minimal` | "Calm and premium" | the low end of the rate (1.06), fade-in cards, more air |
| `data-rich` | "Numbers-forward" | zooms land on the stats, one stat card |
| `cinematic` | "Slow and elegant" | the low end of the rate, slow fades, slightly richer colour |

A pack shifts look and energy only. It never overrides a safety rule (off the face, contrast, the caps, compliance).

## Rules

- The brief is a plan, not a pitch: five lines, no jargon, numbers included.
- Do not invent preferences. Unknown and it matters → the one question. Unknown and it does not → the conservative default, stated.
- Save the brief as the first lines of the checkpoint log so every later pass (and any resumed session) reads the same direction.
- If the agent's note contradicts itself ("keep it short but add all of this"), name the trade-off and recommend.
- Humor, warmth, and personality are protected material: keep the full setup and payoff, never just the punch line.
