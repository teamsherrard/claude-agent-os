# Podcast — the same recording, audio-first

> **Engines.** This file is the craft rule for both engines; the Riverside calls in it are the Riverside engine's. On the Instagram Edits engine (`default_engine: "edits"`), the same rule is carried out with the moves in `edits-engine.md` § Podcast.

Many agents' long-form interviews are a podcast already; they just never published the audio.

## The recipe

1. Work from the finished long-form edit (so the cuts and Magic Audio are already done). If B-roll and cards are on it, that is fine: an audio export ignores the picture.
2. `exports_create_export(sourceEditId, composeSettings:{export:{quality:"MP3", fileName:"<slug>"}}, creationSource:"web")` — `"WAV"` when they ask for a master. Poll `exports_get_export` to `COMPLETED`.
3. **Level check by rule** — Magic Audio on every speaker, no music bed louder than -18 dB under the voice, a clean open and a clean end.
4. **Hosting** — Riverside's podcast hosting (Pro and up; Grow hosts 2 shows) distributes to Spotify and Apple from the Riverside dashboard. The connector cannot publish an episode to hosting; the agent does that once in Riverside (Publish episode). Say the 3 clicks plainly.

## What the Studio does not write

Episode title, show notes, and description are marketing: they come from the YouTube System's SEO Package or the agent (`boundaries.md`). The Studio supplies the section map and the final length.
