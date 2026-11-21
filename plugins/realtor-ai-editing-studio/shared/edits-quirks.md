# Edits quirks (what bites on Instagram Edits for Mac, with the fix)

# Quirks (measured on Edits for Mac 455/456, bridge 0.1.2, 2026-11-15 → 21)

## Connection
- Tool list follows the screen: 32 tools at home, 274 in the editor; Edits never sends `tools/list_changed`. The bridge polls after every call. A direct `claude mcp add --transport http` connection leaves Claude on the 32 home tools.
- Token prompt is hidden: people paste it several times. The bridge then rejects it. Collapse the file to one copy or re-run `set-token`.
- HTTP 403 later = the token was regenerated in Edits. 401/403 from `doctor` = re-run `set-token`.
- The plugin/keychain install route needs the interactive `/plugin configure` dialog, which the desktop app's Code tab can't run. The standalone route (pip + `set-token` + `claude mcp add --transport stdio`) is the one for desktop users.
- Edits auto-updates (455 → 456 within a week). Re-check `doctor` and the catalogs after an update.

## Sandbox and paths
- Edits reads only `~/Movies/...` (and files picked in its UI). `~/Downloads`, `~/Desktop`, temp dirs fail with "Sandbox bookmark unavailable". Export under `~/Movies` too. Paths absolute, no `~`.

## Project and canvas
- New projects are HDR and 1440×2560 @ 60 fps. Call `setProjectDynamicRange SDR` and `setCanvas(frameRate 30)` first. The export's frame rate follows the CANVAS, not `setExportSettings.frameRate` (which is ignored).
- `newProject` works from the editor too; the previous project is left as is.

## Cutting
- `trim(id, side, deltaSeconds)`: a POSITIVE delta removes that many seconds from that side. A negative delta extends and is silently a no-op when the source has nothing left. Read `elements` back.
- `trimEnd` / `trimStart` act on the SELECTED clips at the PLAYHEAD: `seek` → `selectById` → `trimEnd` → `clearSelection`.
- `splitAt(id, times=[...])` returns `pieces` with new ids. Deleting a main-track piece closes the gap and ripples everything after it (captions, overlays, music end). Cut LAST → FIRST, and add captions/graphics AFTER the cuts.
- `elements` returns 200 rows per page by default; pass `limit=5000`.

## Captions and text
- `generateCaptions(language='en', source='video')` ≈ 16 s for 50 s of speech, 13 phrases. Returns `generatedCount`.
- `setCaptionStyle(style)` with no id restyles every caption in one call. `setCaptionHighlightColor` sets the active-phrase box colour for every caption.
- `setCaptionHighlights(id, words)` returns `highlighted: []` in every form tried (word, "word.", comma list, JSON array, with the captions tool open). Per-word emphasis is not available through the server on 456; the style's active phrase is the emphasis.
- Brand names: the speech model wrote "CLOD" for "Claude". Always read the captions and `editCaption`.
- `addText` inserts CENTRED (on the face). Always `setTextPosition`. Text size: 56 = four wrapped lines; 26 = one clean 19-char line; a 33-char line wraps at 30. Boxes have a max width; size down until one line.
- `applyTextPreset(name, id)` fails with "textPresets tool is not active" unless you `selectById(text)` then `selectTool('textPresets')` first; `dismissTool` after. The preset overrides size (set size after).
- `setTextAnimation(id, 'fligPop')` works directly. Typewriter-style presets show partial text in a single frame; that's the animation, not a bug.

## Motion
- `setTransformKeyframe(id, time, scale, x, y)` works on the main-track clip; four keyframes give a hard punch-in and out (t: 1.0, t+0.06: s, t+hold-0.06: s, t+hold: 1.0). `getTransformKeyframes` reads them back. Times must fall inside the piece.

## Grade
- `setColorGrade` takes RAW units: contrast is an offset (0.12 = +12 %), saturation a multiplier (1.08), brightness an offset (0.04). Passing 12/8/4 clamps to 1/2/1 and over-cooks the image badly.
- `applyAdjust(id, adjust, value)` takes the Adjust panel's −100…100 and maps it correctly: brightness 4 → 0.04, contrast 12 → 0.12, saturation 8 → 1.08. Use `applyAdjust`. `getColor(id).grade` reads back.

## Audio, music, SFX
- `addSongToComposition(audioAssetId)` needs the FULL id string from `listMusicTracks` (16 digits); a truncated id fails "no track with audioAssetId". It adds at the playhead and auto-trims to the composition length. `licensedMusicStatus` shows `isLicensedMusic true, isRoyaltyFree true`.
- Royalty-free library music SURVIVES the automation export on 456 (export level at a silent pause −35 dB vs −57 dB raw). The community note that library songs export silent was measured on 454/455; re-check after updates.
- `setSound(id, volumeDb, reduceNoise, enhanceVoice)` and `setDucking(id, behavior='video', level=0.5)` (reports `duckOnVideoAudio`) and `setFade(id, fadeIn, fadeOut)` all work.
- `addSoundEffect(effect=<id or exact title>)` lands at the playhead (`seek` first) on its own track; 1.55 s whoosh. `setVolume(id, 0.3)` (linear gain). Library SFX come in loud.
- `audioChords` finds nothing on speech or a quiet guitar bed; use `audioLevels` at a known pause to prove music is present.

## Export and QA
- `setExportSettings` needs `resolutionType`, `aspectRatio` AND `quality` together or `export` silently never starts. 1080×1920 SDR High: 50 s reel ≈ 23 s.
- `captureFrame(times="2,35", maxWidth=540)` returns image blocks (the driver saves JPGs). `frameSheet(path, times, columns, cellWidth)` works on the EXPORTED file: that is the truth for text sizing.
- `probeMedia(path)` and `loudness(path)` work on any file under `~/Movies`.
- No posting, sharing or scheduling tool exists (checked 454–456). The share sheet in Edits does it.

## Learned on the first full edit (Mike, 96 s talking head, 2026-11-21)
- `transcribeClip` sometimes answers with `words: []` on a later call for the same media; retry after a few seconds (the script retries three times) or fall back to `findPauses` for the cut map.
- `listMusicTracks(tab='royalty-free')` is a rotating recommendation list; look a track up with `listMusicTracks(query=title)` and take the exact-title hit. `addSongToComposition` auto-trims to the composition; when the window is shorter than the reel (90 s cap seen), add it again at its end.
- Caption styles compared at one frame: Word Highlight Box (heavy caps, accent box on the live word) > Word Highlight (smaller, no box) > Short Pop 1 (one word at a time) > Simple / Soft Lines / Simple V5 (thin, serif, low impact). Highlighter boxes the whole phrase in the accent with white text: weak contrast on gold.
- There is no caption-position or caption-size tool; captions sit at roughly y 0.72–0.75 in every style. Keep cards at the top.
- `setSound(enhanceVoice 30)` adds about +5 dB on its own: with `volumeDb +3.5` the export peaked at +1.3 dBFS (clipping); `+0.5` gave −1.6 dB peak at −21.8 LUFS.
- A full disk (`Macintosh HD is out of space`) fails `addSongToComposition` with "licensed window mint failed" and later the export. Edits keeps one shared copy of imported media, so `deleteProject` frees ~nothing; free real disk space instead.
- Pop-up cards as native text with `backgroundPill`: size 26 fits ≤ 25 chars on one line at the top (y 0.12); the PNG hook card at 72 pt reads well at phone size.
- **Wedged importer.** After a failed import (a full disk mid-build), every later import on that project (`addSoundEffect`, `addOverlay`, `addMedia`) answers `element count did not increase: the importer reported no commit`, even with disk freed and the selection cleared. `closeProject` → `openProject(id)` fixes it; probe with one throw-away import at a neutral time, delete it, then continue. The build script's `resume` mode is how you finish such a project without re-importing.
- Leave nothing selected between steps: `selectTool`/`selectById` flows (presets, trims) should end with `dismissTool` + `clearSelection`; several tools report `selectionBefore` and behave differently with a selection.
- `resume` mode's MEASURED line cannot see zooms/whooshes/music placed by the earlier run; count them from `getTransformKeyframes` and `elements` (content soundEffect / music) instead.

## Music, measured (2026-11-21, second pass)
- **Only truly royalty-free songs render through an automation export.** `addSongToComposition` returns `license.isRoyaltyFree`; when it is false the song is silent in the exported file even though it plays in Edits. Of eight calm-sounding picks only "Unplayed Guitar" (`2048792335726950`, 66 s) and "Hypnotized (Instrumental)" (`1852688158814799`, 172 s) rendered; "Beautiful Things (Piano Instrumental)", "Floating Cloud", "3:00 AM", "Vibing", "A Cautionary Tale (Instrumental)", "Day in the Life" exported as silence. "Something So Good (Instrumental)" renders but reads as bright synth-pop (the owner called it video-game music).
- **Library masters are hot (≈ −14.6 LUFS).** A bed at −18 dB with ducking 0.5 overpowered a −22 LUFS voice. Use **−26 dB** (bed ≈ 18 dB under the voice before ducking, ≈ 24 dB under during speech) with `setDucking(video, 0.5)` and fades 0.8 / 1.5. Lower the bed, never raise the voice.
- `listMusicTracks(query=…)` searches TITLES only: mood words (lofi, ambient, piano, cinematic) return nothing. Pick by title semantics, then measure.
- **Audition recipe (Claude cannot hear, but can measure):** `muteTrack(id)` takes an ELEMENT id (mute the video clip and every soundEffect element); add the song at 0 dB; wait until `licensedMusicStatus` shows `isAvailable` + `windowComplete`; export 720p Low (≈ 11 s); `audioOnsets` / `audioLevels` / `loudness` / `audioSpectrum` on the FILE; delete the song; `unmuteTrack(id)` restores the volumes. Silence in the file = not royalty-free. The ear test stays the agent's: name the track in the hand-back.
- A 66 s bed on a 94 s reel: place it again at its end (seam at 66 s, 0.8 s fade-in hides it). Prefer a track longer than the reel when one renders.
