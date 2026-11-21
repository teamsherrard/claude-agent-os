# Edits tools by job (editor screen, 274 tools; arg shapes as they actually work on 456)

Conventions: time = seconds on the composition timeline; canvas normalised 0–1, origin top-left, x/y = element CENTRE; colours `#RRGGBB(AA)`; rotation degrees clockwise. All ids are UUID strings returned by the tools.

## Navigation (home + editor)
- `appState()` → `{screen: home|editor|loading}`. `projects()`, `openProject(id|name)`, `newProject()` → `{id}`, `renameProject(id, name)`, `closeProject()`, `duplicateProject(id)`, `deleteProject(id)` (ask first).

## Project settings
- `setProjectDynamicRange(range='SDR')`, `projectDynamicRange()`; `setCanvas(aspect='9:16', frameRate=30)`, `getCanvas()`; `setAspectRatio(ratio)`.

## Media
- `addMedia(path, audioKind?)` → `{id, trackId}`; audioKind `music|soundEffect|voiceover` puts an audio file on its own track. `importMedia(path)` is the same import. `replaceElementMedia(id, path)` swaps media (resets in-point; re-`slipClip`). `addOverlay(path, startSeconds, x, y, scale)` → picture-in-picture on a new track, 3 s default for stills. `addGif(path)`, `addSticker(sticker, path, duration, atSeconds)`.
- Library: `listMusicTracks(tab, license, query)` (ids!), `searchMusic(query)` (titles only), `addSongToComposition(audioAssetId | track=title)`, `licensedMusicStatus()`, `searchSoundEffects(query | category)`, `addSoundEffect(effect)` at the playhead.

## Transcript and analysis (free, read-only)
- `transcribeClip(id, language='en', background=false, mergeSplitWords=true)` → words with start/end in timeline seconds.
- `findPauses(path|id, minDuration, thresholdDb, start?, duration?)` → `pauses[{start,end}]`.
- `loudness(path|id)` → LUFS + peak; `audioLevels(path|id, start, duration, hop)` → dB envelope + noise floor + speech level; `audioOnsets`, `audioSpectrum`, `audioChords`; `detectCuts`, `detectShots`, `probeMedia(path)`, `quietPoint`, `sampleFrames`, `frameSheet(path|id, times, columns, cellWidth)` → contact-sheet image.
- AI: `describeClip(id)`, `trackObject(id, prompt)` (SAM 3 boxes per frame).

## Timeline inspection
- `elements(limit=5000, trackId?, rangeStart?, rangeEnd?, fields?)` → every element with startTime/endTime/duration/content/trackType. `clips(trackId?)` video clips only. `tracks()` → ids, type, behavior (video track is `magnetic`). `getElement(id)`, `getTransform(id)`, `getTransformKeyframes(id)`, `getColor(id)`, `getSound(id)`, `captions()`, `transitions()`, `rippleState()`, `valueFields()`.

## Cutting
- `splitAt(id, times=[t1, t2], snap?)` → `pieces[{id,start,end}]`. `selectById(id)` → `delete()` → `clearSelection()`. `trim(id, side='left'|'right', deltaSeconds)` positive = remove. `seek(t)` + `selectById` + `trimEnd()/trimStart()`. `move(id, toSeconds)`, `slipClip`, `reorderClip`, `setSpeed`, `setSpeedCurve(id, preset)`, `reverseClip`, `undo()`, `redo()`.

## Captions
- `generateCaptions(language='en', source='video'|'voiceover'|'importedAudio'|'all', curseWords?)`; `captions()` → id/text/start/end/tokens; `setCaptionStyle(style, id?)`; `setCaptionHighlightColor(color)`; `editCaption(id, text)`; `splitCaption`, `mergeCaptions`, `deleteCaptions`. (`setCaptionHighlights` is a no-op on 456.)

## Text and graphics
- `addText(text, atSeconds, duration)` → `{id}` (centred: move it). `editText(id, text)`. `setTextStyle(id, size, bold, italic, color, alignment)`. `setTextPosition(id, x, y)`. `setTextFont(id, family)` (PostScript name; `importAccountFont(path)` for brand fonts). `setEmphasis(id, style='backgroundPill'|'outline'|'invertedOutline'|'invertedBackgroundPill'|'none', color)`. `setTextAnimation(id, animation)`. `applyTextPreset(name, id)` after `selectById` + `selectTool('textPresets')`. `addShape`, `moveToLayer`, `setOpacity(id, value)`, `setLayerVisibility`.

## Motion and effects
- `setTransformKeyframe(id, time, scale, x, y, rotationDegrees?, easing?)`; `setTransformKeyframes(id, keyframes=JSON array)` replaces all; `removeTransformKeyframe`. `applyEffect(id, effect)`, `applyFilter(id, filter, intensity)`, `applyLUT`, `addTransition(fromId, toId, filterId, durationSeconds)`, `autoReframe`, `setMask`, `cropClip`, `setFlip`.

## Grade
- `applyAdjust(id, adjust, value −100…100)` for exposure/contrast/saturation/temperature/tint/highlights/shadows/vibrance/brightness/clarity/whites/blacks. `setColorGrade(id, …)` raw units (see quirks). `setColorWheel`, `setCurve`, `setHSL`, `addAdjustmentLayer`.

## Audio
- `setSound(id, volumeDb, reduceNoise 0–100, enhanceVoice 0–100)`; `setVolume(id, linear)`; `setDucking(id, behavior='video'|'voiceover'|'any'|'none', level)`; `setFade(id, fadeIn, fadeOut)`; `muteTrack/unmuteTrack`; `extractAudio`; `processAudio`; `setVoiceEnhance`.

## Voiceover and TTS
- `openTeleprompter`, `setTeleprompterText`, `startVoiceoverRecording`/`stop…` (needs a mic, agent-driven); `listTTSVoices`, `applyTextToSpeech`.

## Playback and QA
- `seek(t)`, `play/pause`, `captureFrame(atSeconds | times="a,b", maxWidth)` → image blocks; `previewVideo` + `previewVideoStatus` + `previewVideoFrames(resultId)` for a full render of frames.

## Export
- `setExportSettings(dynamicRange='SDR', resolution='1080x1920', resolutionType='HD', aspectRatio='nineBySixteen', quality='High', frameRate=30)` → `export(path)` → `exportStatus()` `{state: preparing|exporting|complete, progress}` → `cancelExport()`. Then `probeMedia(path)`, `loudness(path)`, `frameSheet(path, …)`.
