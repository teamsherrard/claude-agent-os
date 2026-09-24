# Music (bed + level)

A reel needs a music bed, always under the voice.

**Long-form gets a bed too (changed 2026-09-23; a 10-minute video with no music anywhere read as unfinished).** Long-form: an `underscore`, **Low** intensity, at **-22 dB** (quieter than a reel), placed after the cut so it spans the final length, faded at both ends. Leave it off only when the agent says so, or on a serious or legal topic where music would feel wrong; say which.

## Sound design (the layer that makes it feel edited)

The connector has no sound-effect library, but two things work, both live-tested on 2026-09-23:
- **Section stingers.** Riverside's free library has `transition` tracks (7 to 19 s). A short slice of one is a clean section hit: `insert_audio(assetId:<transition mediaId>, startMs:<section start, playable>, durationMs:1800, dB:-12, fadeOutMs:600)`. One per section change on long-form (the section map's times, `sections.md`), none on a reel. Same collection as the bed so they belong together. The slice inserts correctly; whether it lands musically is the agent's ear, so ask once at hand-back.
- **Swoosh on zooms.** Only from the agent's own uploaded SFX (`config.sfx.swoosh_media_id`), `insert_audio` at the zoom's start, -10 dB. Say once that a licensed swoosh dropped into their Riverside media makes every zoom land, then never nag.
Pick the stinger with `get_stock_music(collection:<the bed's collection>, section:"transition", count:4)` and use the Low variant; the same `mediaId` at every section change is fine (it is the video's signature). One stinger per section change; if two section changes fall within 30 seconds, skip the second. Never a hit over a spoken number or the CTA line. Reels get the bed only, no stingers.

## Where the music comes from

Riverside's **free built-in library** — `editing_get_stock_music(collection, section, count)`. Licensed, no key, no upload. Organised by COLLECTION (genre) and SECTION (where it plays); variants High/Low = intensity, Short/Long = length.

## Mood → collection (match the content)
- Market update / data / tips → `businessTech` or `educational`, section `underscore`, **Low** intensity.
- Listing / luxury → `lifestyle` underscore, Low; `cinematic` pack → `artsEntertainment`.
- Hype / just-listed / promo → `lifestyle` or `sportsRecreation`, High.
- Story / client win / mindset → `lifestyle` underscore, Low.
- Audience overrides genre — a luxury brand never gets `gaming`.
- `intro` / `outro` / `transition` sections are short stings: `transition` slices are the section hits above, `intro`/`outro` can open and close a long-form. Not a bed.

## Placement & level

`editing_insert_audio(editId, assetId:<mediaId>, startMs:0, dB:-18, fadeInMs:800, fadeOutMs:1500)`.
- **-18 dB** under a normal voice on a reel (the -17 to -20 dB window); -20 for a soft speaker; **-22 dB on long-form**.
- Ducking (music dipping when they talk) isn't a connector operation — a static bed at -18 dB is the safe default. If the agent wants true ducking, it's a quick manual adjust in Riverside (their 20%).
- If the track is shorter than the reel, insert it again at its end, or pick the Long variant. Fade in/out at the ends; never start or stop abruptly.
- On a reel, insert the bed **after** the cuts (pass 4) so it spans the final length.

## Licensing
Riverside's library is licensed for the agent's use. Never a random copyrighted song — it kills reach and risks takedowns. If they insist on their own track, they must own the licence; it goes up via the media upload (MP3/WAV).
