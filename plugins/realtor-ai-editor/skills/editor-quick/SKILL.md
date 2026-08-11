---
name: editor-quick
description: One small fix on a video, done cheaply — not a full edit. For when the agent wants just ONE thing: "just add captions", "just clean up the audio", "just make this vertical", "just trim the start", "just add my CTA", "can you fix the audio on this", "add captions to this and that's it". Runs a single Descript pass (~10-25 credits instead of the ~70-270 a full edit costs), frame-QAs it, and hands it back. If they actually want the whole thing polished, it says so and routes to the full edit skill instead. Trigger on any request that names ONE specific fix, or that contains "just", "only", "quick", or "that's it" alongside a video task. Usually reached through editor-navigator.
---

# Quick fix — one job, one pass, cheap

The agent asked for **one thing**. Do that one thing well, spend almost nothing, and get out. This is the most common real request an agent makes, and running a full edit for it would waste 80% of their credits on work they didn't ask for.

Read `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` and `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`. Open the one reference the job needs — not the whole library.

## First: is this actually a quick fix?

**Yes → stay here** if they named ONE thing: captions, audio, vertical/reframe, a trim, the CTA, the colour grade, one card.

**No → hand off** if they want several things, or "make it good", or a full polish. Say it plainly and route: *"That's more of a full edit — want me to do the whole thing properly? It'll look much better."* → `edit-shortform` / `edit-longform` / `edit-listing`.

**If they're mid-way through a stopped edit** ("finish my video") → that's the resume path in `editor-navigator`, not this skill.

## The jobs (one paid pass each)

| They say | You do | Rough cost |
|---|---|---|
| "just add captions" | Karaoke captions to the caption bar (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`) — big, below the face, brand accent, inside the safe zones | ~10–20 credits |
| "just clean up the audio" | Studio Sound at ~55% (80–90% phone/echoey) — `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md` | ~10 |
| "just make it vertical" | 9:16 composition + reframe, face centred with headroom, no black bars | ~10–15 |
| "just trim the start/end" | Open on the hook / clean ending. **Show the cut and get a yes first** — destructive | ~10 |
| "just add my CTA" | The CTA card from their saved config values (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`), off the face, format-correct zone | ~15–25 |
| "just colour it / fix how it looks" | Bare-minimum grade (`${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md`) — never over-saturated | ~10 |
| "just add a bit of b-roll" | Up to 3 cutaways, one placement pass (`editor-broll`) | ~20–40 |

## How to run it

1. **Find the video.** Already in Descript? Use it. If you have to import, pass `add_media` **and `add_compositions`**, then `get_project` to confirm the duration isn't `0`.
2. **Quote it in one line and go.** *"Adding captions — about 15 credits, two minutes."* No interview, no plan document. If it's destructive (a trim), show what's coming out and get the yes.
3. **ONE `prompt_project_agent` call.** Everything the job needs, in a single well-formed instruction. Don't drift into fixing other things you notice — mention them at the end instead.
4. **Render once at `1080p`** and frame-QA the thing you changed (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md` — the blockers that apply to *this* job, not the whole gate).
5. **Hand back as a review draft** with the one-line what-changed and the 80/20 note.

## The rules that still apply

Even on a one-pass job: **never over the face** · captions big and below the face · cards on a dark brand panel, format-correct zone, text contained · **CUT, never voice-clone** · publish only on their yes · never blind-retry a paid pass.

## Say what you noticed — don't silently fix it

If you spot something else worth doing (no captions, flat audio, no CTA), **say it once at the end and let them choose** — don't spend their credits on it:

> *"Done — captions are on. I also noticed there's no call-to-action at the end and the audio's a bit roomy. Want me to sort either of those, or leave it here?"*

That's how a quick fix turns into a full edit **when the agent wants it** — never by surprise.
