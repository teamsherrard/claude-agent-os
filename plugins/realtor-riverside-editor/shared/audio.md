# Audio enhance — bad sound loses viewers faster than bad picture

One job: make the voice clean, present, and natural.

## The recipe

1. Read the timeline for every speaker track (`trackType: "recording"`, `uniqueId` = `trackId`).
2. `set_magic_audio(editId, trackId, enabled:true, mixLevel, expectedRevision)` on EACH speaker track.

| The recording | `mixLevel` |
|---|---|
| A decent mic in a normal room (most agents with a USB or lav mic) | **0.70** (raised from 0.55 on 2026-09-23: at 0.55 the agent could not hear a difference on a real edit; 0.70 is audibly cleaner and still natural) |
| Phone audio, laptop mic, an echoey room | **0.80 to 0.90** |
| A genuinely bad room | 1.0 |
| A pro mic in a treated space, and full strength thins the voice | 0.40, or off |

3. **Confirm it landed AND that it is audible** — re-read the track: an `audio.enhancedAudioMix` keyframe with `enabled: true` and your level. A level under 0.70 on an ordinary mic is not "safe", it is inaudible; only a pro mic in a treated room earns a lower level, and that reason goes in the log. If the write says unavailable or skipped, the recording is still processing: wait and say so. Never report clean audio that is not there.
4. **Multi-person** — also `apply_smart_mutes` (see `interview.md`).
5. **Levels against music** — the bed sits at -18 dB under the voice (`music.md`). If the agent says the music fights the voice, lower the bed, never raise the voice.

## What this engine cannot do

No EQ, no de-esser, no manual noise gate, no ducking automation from the connector. Magic Audio is the tool. A recording that is still poor at 1.0 has a source problem — say so kindly and point to the mic advice in `recording.md`. An export-time option (`audio.isNormalizeGain`, `audio.isRemoveBackgroundNoise`) exists for a last-resort second pass; use it only when asked.

## The ear test is theirs

You cannot hear playback. After any audio change, the hand-back always includes: *"Does the audio feel right to your ear? If it sounds thin, I'll ease it back; if there's still echo, I'll push it."* Save their answer to the config so the next video starts at their level.
