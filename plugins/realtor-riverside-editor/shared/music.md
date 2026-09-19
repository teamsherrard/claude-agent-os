# Music (bed + level)

A reel needs a music bed, always under the voice.

**Long-form: no bed by default — but OFFER it.** At delivery, one line: *"I left music off this one to keep it clean — want a subtle bed under it? Quick to add, or drop one in yourself in Riverside."*

## Where the music comes from

Riverside's **free built-in library** — `editing_get_stock_music(collection, section, count)`. Licensed, no key, no upload. Organised by COLLECTION (genre) and SECTION (where it plays); variants High/Low = intensity, Short/Long = length.

## Mood → collection (match the content)
- Market update / data / tips → `businessTech` or `educational`, section `underscore`, **Low** intensity.
- Listing / luxury → `lifestyle` underscore, Low; `cinematic` pack → `artsEntertainment`.
- Hype / just-listed / promo → `lifestyle` or `sportsRecreation`, High.
- Story / client win / mindset → `lifestyle` underscore, Low.
- Audience overrides genre — a luxury brand never gets `gaming`.
- `intro` / `outro` / `transition` sections are short stings — usable as an open/close sting on long-form if the agent wants one; not a bed.

## Placement & level

`editing_insert_audio(editId, assetId:<mediaId>, startMs:0, dB:-18, fadeInMs:800, fadeOutMs:1500)`.
- **-18 dB** under a normal voice (the -17 to -20 dB window); -20 for a soft speaker.
- Ducking (music dipping when they talk) isn't a connector operation — a static bed at -18 dB is the safe default. If the agent wants true ducking, it's a quick manual adjust in Riverside (their 20%).
- If the track is shorter than the reel, insert it again at its end, or pick the Long variant. Fade in/out at the ends; never start or stop abruptly.
- On a reel, insert the bed **after** the cuts (pass 4) so it spans the final length.

## Licensing
Riverside's library is licensed for the agent's use. Never a random copyrighted song — it kills reach and risks takedowns. If they insist on their own track, they must own the licence; it goes up via the media upload (MP3/WAV).
