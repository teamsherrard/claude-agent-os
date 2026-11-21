<!-- Vendored from https://github.com/iamjeeth/claude-edits-skill (MIT), dumped by its author from Edits for Mac build 454 on 2026-11-05. Our own live dump (build 456) is in catalogs.md; re-dump tool schemas with scripts/edits_drive.py tools after an Edits update. -->
# Edits automation server: tool reference

Dumped from the live server (`tools/list`, editor screen, 274 tools) on 2026-11-05. Edits ships no public docs; these descriptions are the manual. Args with `?` are optional. Re-dump with `python3 -c "import edits_client as e; e.init(); print(e.tools())"` after an app update.

## ai

| Tool | Args | What it does |
|---|---|---|
| `describeClip` | frames, id | List what's in a clip with on-device MetaAISceneX: caption categories, captions, topics and vibes with scores, plus an aesthetic score. Use the labels as trackObject prompts |
| `trackObject` | id, prompt, sampleEvery, saveMasks | Track an object described in words through a clip with SAM 3; returns its normalized box (origin top-left) per sampled frame |
| `transcribeClip` | mergeSplitWords, id, language | Transcribe a clip's audio with the captions model, in parallel 3-minute pieces for long recordings; returns each word with start and end (timeline seconds for a clip, source seconds for a library item), without adding ca |

## analysis

| Tool | Args | What it does |
|---|---|---|
| `audioChords` | path, id, hop, minDuration, start, duration | Chords over time from 12-bin chroma matched to major, minor, sus and seventh shapes |
| `audioLevels` | path, duration, hop, id, start | RMS level envelope in dBFS for a clip, library item or file, with its noise floor and speech level |
| `audioOnsets` | start, duration, id, path | Note and hit onsets in a clip's audio, and the tempo that best fits them |
| `audioSpectrum` | path, start, resolutionHz, limit, duration, minHz, maxHz, id, minProminenceDb | Steady tones that stand out of a clip's average spectrum (hum, whine), with frequency, level and prominence |
| `detectCuts` | duration, sensitivity, id, start, path | Camera cuts in a clip, library item or file, and its shots grouped by angle (e.g. wide and two close-ups) |
| `findPauses` | start, duration, id, minDuration, path, thresholdDb | Stretches of near-silence in a clip, library item or file |
| `frameSheet` | times, id, path, columns, cellWidth | A labelled contact sheet of frames in one image (returned inline, and saved as a PNG): the rendered edit at timeline times, or a clip, library item or file |
| `loudness` | id, path | Integrated loudness (LUFS, ITU-R BS.1770) and sample peak of a clip's span, a library item or a file |
| `probeMedia` | path, id | What a file holds: duration, whether it has audio and video, channels, sample rate, size and frame rate |
| `quietPoint` | window, path, id, seconds | The quietest 10 ms near a time, for landing a cut between words |
| `sampleFrames` | id, times, maxEdge, path | Source frames of a clip, library item or file at given times, as PNGs (the unedited media; use frameSheet with no id, or captureFrame, for the edit) |

## audio

| Tool | Args | What it does |
|---|---|---|
| `getSound` | id | Read a clip's volume in dB and its Voice Enhance settings (reduce noise, enhance voice, 0-100) |
| `processAudio` | mode, id, chain | Render a clip's or library item's audio through EQ, notches, voice isolation, gain and loudness normalisation, keeping the picture untouched |
| `setSound` | enhanceVoice, reduceNoise, id, volumeDb | Set a clip's volume in dB (boosts above 0 dB) and its Voice Enhance settings, as the Sound panel does |

## automation

| Tool | Args | What it does |
|---|---|---|
| `jobStatus` | id | Poll a job that outlived its request: waits briefly for it, then returns the final result, or running with progress |

## captions

| Tool | Args | What it does |
|---|---|---|
| `captions` |  | Get all caption elements with id, text, startTime, endTime |
| `deleteCaptions` | id? | Delete captions (single by id or all) |
| `editCaption` | text, id | Edit the text of a caption element |
| `generateCaptions` | source, curseWords, language | Generate captions from the composition audio |
| `mergeCaptions` | direction, id | Merge a caption with an adjacent caption |
| `setCaptionHighlightColor` | color | Set the highlight color on every caption |
| `setCaptionHighlights` | id, words | Highlight exactly these words of a caption, as clicking words in the transcript does |
| `setCaptionStyle` | style, id?, dryRun? | Set caption style preset |
| `splitCaption` | time, id | Split a caption element at the given time |

## color

| Tool | Args | What it does |
|---|---|---|
| `getColor` | id | Read a clip's colour tools in model units: grade sliders, colour wheels, HSL per band, and tone-curve knots |
| `setColorWheel` | id, intensity?, hue?, wheel | Set the hue or intensity of one of a clip's colour wheels (shadows, midtones, highlights, global) |
| `setCurve` | channel, knots, id | Replace one channel of a clip's tone curve with the given knots; other channels are kept |
| `setHSL` | band, id, hue?, saturation?, luminance? | Set hue, saturation or luminance for one colour band of a clip's HSL tool; other bands and fields are kept |

## editing

| Tool | Args | What it does |
|---|---|---|
| `addAdjustmentLayer` | kind, durationSeconds, startSeconds | Insert an adjustment layer, at the Insert-menu default geometry or an explicit one |
| `addBeatMarker` | seconds, id | Add a hand-placed beat marker to an audio element (timeline core) |
| `addOverlay` | y, path, x, scale, startSeconds | Import media as a picture-in-picture overlay |
| `addShape` | width, cornerRadius, x, height, color, y, startSeconds, duration, opacity | Add a filled rectangle (optionally rounded and translucent) as an overlay on a new top layer, e.g. a box behind a title or a scrim |
| `addSticker` | sticker, atSeconds?, path, duration | Add a bitmap sticker overlay at the playhead |
| `addStickerFromCutout` | id | Cut the subject out of an element into a masked overlay |
| `addText` | duration, text, atSeconds? | Add a text overlay at the playhead |
| `addTransition` | fromId?, durationSeconds?, toId?, dryRun?, filterId? | Add a transition at a video-track boundary |
| `applyEffect` | id, effect, dryRun? | Apply a catalog video effect to a clip |
| `applyFilter` | id, intensity?, dryRun?, filter | Apply a catalog filter to a video clip |
| `applyLUT` | dryRun?, table | Apply a built-in Adjust LUT as an Adjust > Presets tile tap does: to the selected clips, else a selected Adjust layer, else a new adjustment layer |
| `applySubjectEffect` | effect, id, storePath | Import a CutoutMaskStore as a clip's subject mask and apply a subject effect |
| `applyTextPreset` | dryRun?, name, id?, ids? | Apply a named text style preset (font, colour, effect, animation) from the app's text styles, e.g. to all titles at once |
| `autoReframe` | subject?, wideThreshold?, ids?, motion?, wideShotPolicy? | Fill the canvas with each video element while keeping its subject in frame, in one undo step; wide shots can become stack2 split screens |
| `beatMarkers` | id | List an audio element's visible beat markers with timeline and source times |
| `clearSelection` |  | Clear the current selection |
| `convertToMain` | id | Convert an overlay clip back to a main lane |
| `convertToOverlay` | id | Convert a main-track clip to an overlay lane |
| `copy` |  | Copy selected elements to clipboard |
| `cut` |  | Cut selected elements to clipboard |
| `delete` |  | Delete the currently selected elements |
| `dismissToast` |  | Dismiss the currently visible tool-toast, if any |
| `duplicate` | rippleMainTrack?, id, placement? | Duplicate a timeline element by id as one undo step |
| `editText` | id, text | Set a text element's content |
| `extractAudio` | id | Extract a video clip's audio onto a music track (timeline core) |
| `getTransform` | id | Read an element's position, scale, rotation, and mirror flags |
| `getTransformKeyframes` | id | List an element's transform keyframes in time order |
| `move` | id, toSeconds | Move an element to a new start time |
| `moveToLayer` | id, toLayer | Move an element to another layer at the same start time |
| `paste` |  | Paste clipboard elements at the playhead |
| `redo` |  | Redo the last undone operation |
| `removeBeatMarker` | id, markerId, index | Remove a beat marker by index from an audio element (timeline core) |
| `removeCatalogItem` | elementId, instanceId | Remove one applied catalog item (filter, LUT, effect) by instance id, without undoing other work |
| `removeTransformKeyframe` | id, time | Remove the transform keyframe at a timeline time |
| `reorderClip` | id, position | Move a main-lane clip to a position index |
| `select` |  | Select the clip at the current playhead position |
| `selectAll` |  | Select all elements across all tracks |
| `selectById` | id, addToSelection | Select an element by its UUID |
| `setBeatDensity` | density, dryRun?, id | Set the beat-marker density filter on an audio element (timeline core) |
| `setCanvas` | aspect?, frameRate? | Set the project canvas aspect and/or frame rate in one undo step; transforms keep their normalized positions |
| `setColorGrade` | exposure?, whites?, contrast?, id, saturation?, tint?, clarity?, temperature?, highlights?, shadows?, blacks?, vibrance?, brightness? | Grade a video clip or adjustment layer's color (exposure, contrast, saturation, ...) |
| `setEmphasis` | style, dryRun?, color?, id | Set a text element's emphasis style, e.g. `backgroundPill` for a background behind the text |
| `setFlip` | vertical?, horizontal?, id | Mirror an element horizontally and/or vertically |
| `setLayerVisibility` | layer, visible | Set a timeline layer visible or hidden by index |
| `setMediaPanelFilter` | filter | Set the Media Panel type filter |
| `setMediaPanelSort` | criterion, ascending? | Set the Media Panel sort through the real UI path (fires persist) |
| `setRippleTiers` | tier2, tier1 | Set both ripple tier toggles |
| `setTextAnimation` | animation, dryRun?, id | Set a text element's entrance animation |
| `setTextFont` | family, id | Set a text element's font family |
| `setTextPosition` | x, id, y | Move a text element to normalized canvas coordinates |
| `setTextStyle` | color?, size?, id, bold?, italic?, alignment? | Set a text element's size, bold, italic, color, or alignment |
| `setTransform` | fitMode?, x?, y?, focusY?, id, rotationDegrees?, scale?, focusX?, keyframes, allowBeyondCanvas | Pose an element's position, scale, and rotation |
| `setTransformKeyframe` | y?, rotationDegrees?, scale?, id, x?, easing?, time | Add or update one transform keyframe at a timeline time |
| `setTransformKeyframes` | id, keyframes | Replace a clip's keyframes with position, scale and rotation keyframes at clip-relative times |
| `setTransforms` | items | Pose many elements in one undo step; per-item results, ok false if any item failed |
| `slipClip` | id, deltaSeconds | Slip a clip's content window without moving timeline bounds |
| `split` |  | Split the selected clips, or the main-track clip if none is selected, at the playhead |
| `splitAt` | snap?, id, times | Split one element at many times in one undo step; playhead untouched, a selected element's pieces stay selected |
| `splitClip` | id | Split a clip by id at its midpoint: seeks there, selects it, then splits at the playhead |
| `splitScreen` | background, id, panels, gap, layout | Build a two-panel layout from one element in one undo step: panel 1 is a muted copy on a new track above, a blur/colour background a muted filled copy below |
| `trim` | id, side, deltaSeconds | Trim an element's in or out point |
| `trimEnd` |  | Trim selected clip from playhead to end (remove content after playhead) |
| `trimStart` |  | Trim selected clip from start to playhead (remove content before playhead) |
| `undo` |  | Undo the last operation |
| `updateCatalogItem` | intensity, elementId, instanceId | Change one applied catalog item's intensity by instance id |

## export

| Tool | Args | What it does |
|---|---|---|
| `cancelExport` |  | Cancel an in-progress export |
| `export` | path | Export the current project to a video file |
| `exportStatus` |  | Get current export progress and state |
| `setExportSettings` | aspectRatio?, codec?, bitrate?, frameRate?, dynamicRange?, quality?, resolution?, resolutionType? | Set encoder settings for the next export |

## inspection

| Tool | Args | What it does |
|---|---|---|
| `captureFrame` | times?, maxWidth?, atSeconds? | Render the exact composition frame at the playhead as a base64 JPEG (export-pipeline, like previewVideo) |
| `captureSourceFrames` | grid?, aliasId?, tile?, times, id?, maxWidth? | Raw source frames of a library item or timeline element at given times, ignoring transform, crop and effects, as images in request order |
| `clips` | limit?, trackId?, rangeStart?, offset?, rangeEnd?, fields? | Get video clips (id, trackId, startTime, endTime, duration, source in/out), filtered and paged |
| `detectShots` | includeDissolves?, id?, sensitivity?, aliasId?, minShotSeconds? | Shot changes in a video library item or timeline element: exact source-frame cut times, project-grid timeline times, shots and dissolves |
| `detectSubjects` | start?, end?, id?, sampleEvery?, kinds?, aliasId? | Faces and people in a library item or timeline element, sampled over a time range, with boxes and per-shot track ids |
| `elements` | rangeEnd?, offset?, rangeStart?, limit?, trackId?, fields? | Get elements across all tracks with full metadata, filtered and paged |
| `exactElementValues` |  | Report each element's stored opacity, volume and alpha keyframe values as exact text and bits |
| `getAdjustState` | id | Get Adjust filter state for selected element , verifies sliders at default (0) |
| `getCanvas` |  | Get the project canvas width, height, aspect (e.g. 9:16) and frame rate |
| `getCapabilities` |  | Global rules for driving the editor: schema version, time/canvas/rotation/color conventions, catalogs and recipes |
| `getCatalogItem` | id, kind | Describe one catalog item: its apply tool/param plus the params the apply tool accepts for it |
| `getElement` | id | One element by id, with applied catalog items and (for text) content, color, alignment, animation |
| `getMediaPanelItems` |  | List the Media Panel grid's items in display order |
| `getMediaPanelSort` |  | Get Media Panel sort/filter UI state plus the persisted Project.db values |
| `getToast` |  | Read the currently visible tool-toast, if any |
| `licensedMusicStatus` |  | Per licensed-music clip: the alias's resolved asset (licensed flag, audioAssetID, availability, window completeness) and the library's managed rows for the song |
| `listCaptionStyles` |  | List caption style preset names setCaptionStyle accepts, by category |
| `listCatalog` | limit, category, kind, query, cursor | List items of one catalog kind, with query / category filtering and cursor paging |
| `listCatalogKinds` |  | List every catalog kind listCatalog serves, with the tool and param that applies each kind |
| `listEffects` |  | List catalog video effects applyEffect accepts, including none to clear |
| `listFilters` |  | List catalog filters applyFilter accepts, including normal to clear |
| `listSpeedCurvePresets` |  | List speed curve preset ids setSpeedCurve accepts |
| `listTextAnimations` |  | List text animation ids setTextAnimation accepts |
| `listTextPresets` |  | List text style preset names applyTextPreset accepts, by category |
| `listTransitionsCatalog` |  | List Mac-authorable transition filter ids addTransition accepts, including normal to remove |
| `mediaBin` | includeReferenced? | List media-panel assets with name, duration, codec, and dynamicRange |
| `mediaStatus` |  | Get media status for all elements |
| `operationEntries` | id | List a clip's operation entries, oldest first, with status and progress |
| `previewVideo` | durationSeconds?, maxWidth?, includeClip?, frameCount?, startSeconds?, clipMaxWidth?, sourceStartSeconds?, aliasId? | Start rendering a composition range (or a media-bin asset range with aliasId) to sampled frames + optional MP4; returns the resultId it will publish (poll previewVideoStatus, then fetch previewVideoFrames by id) |
| `previewVideoFrames` | resultId | Fetch a finished previewVideo render's frames by resultId |
| `previewVideoStatus` | includeFrames? | Poll previewVideo render state (lightweight by default; includeFrames=true for the full result) |
| `rippleState` |  | Get the ripple tier toggles plus the magnet and snap flags |
| `sampleOutputLevel` | seconds | Sample the playback output metering tap for N seconds and report peak levels; start playback first |
| `speedPanel` |  | Read the presented Speed panel's tab, Curves tab visibility and reversed-clip state |
| `state` |  | Get current editor state (time, duration, playing, clip count, boundaries) |
| `tracks` |  | Get all tracks with type, behavior, and element count |
| `transitions` |  | List all transitions on the composition, per track |
| `valueFields` |  | List the text each visible tool value field (MCEDraggableValue) shows |

## media

| Tool | Args | What it does |
|---|---|---|
| `addGif` | path | Import a GIF file as a true gif element |
| `addLibraryMedia` | ids? | Append media library items to the timeline, as a media-panel drop does |
| `addMedia` | path, audioKind | Import a media file and add it to the composition |
| `addMediaPanelItemsToTimeline` | sourceOut?, aliasIds, asOverlay?, sourceIn?, trackId?, startTime? | Add Media Panel items to the timeline, as the cell + (one) or Add N (several) does; startTime/sourceIn/sourceOut/trackId place one alias off the main track |
| `addMusicTrack` | type, track | Add music track , now imports real asset via addMediaFromPath (was stub) |
| `addSongToComposition` | track, audioAssetId | Add a library song to the composition , full file for royalty-free, obfuscated window for licensed |
| `addSoundEffect` | effect | Add a sound effect onto the timeline , bundled name or catalog id/title from searchSoundEffects |
| `applyAdjust` | adjust, id, value | Apply adjust , writes a real slider value (was stub) |
| `browseMusicCategories` |  | Browse music categories , now fetches real feeds (was stub) |
| `clipMetadata` | id | Capture metadata from a clip's source file: date and time shot, GPS location, camera and lens, resolution, frame rate, codec, HDR, audio format |
| `cropClip` | rect?, id? | Crop clip , applies a real crop rect through setElementCrop |
| `deleteSoundEffect` | id | Delete sound effect , now removes the real element (was stub) |
| `dismissVolumePanel` |  | Dismiss volume panel , real toolPresenter.dismiss, presentedTools readback |
| `dragSoundEffectTrack` | newTrack, delta, id | Drag sound effect track , now moves the real element (was stub) |
| `expandMusicClip` | id, duration | Expand music clip , now moves element via moveElement (was stub) |
| `favoriteMusicTrack` | track | Favorite music track , now bookmarks via the real API (was stub) |
| `getAudioState` | id | Get audio state , real speed/volume read (stub fallbacks dropped) |
| `getMusicTrackDetails` | track | Get music track details from the track catalog by id or exact title |
| `getMusicTrackList` | tab | Get music track list for a tab from the track catalog |
| `getSavedTracks` |  | Get saved tracks , now fetches the real Saved tab (was stub) |
| `getSyncState` |  | Get sync state , reads real playback and mix state (was hardcoded) |
| `getVolume` | id | Get volume for an element as a linear gain fraction in 0...10 (0 = silent, 1 = unity/0 dB neutral, 10 = +20 dB max boost); same scale as /elements, `getAudioState`, and `exactElementValues` |
| `importMedia` | path | Import media , uses real addMediaFromPath |
| `importToMediaBin` | path | Import a media file into the media panel without placing it on the timeline |
| `importToMediaPanel` | path, folderId? | Import a media file into the Media Panel only (opening the panel if closed), as its Import button does |
| `listMusicTracks` | license, tab, query | List music library tracks with full metadata. A query searches across tabs (it overrides tab); license filters to any/royaltyFree/licensed. Each track carries license {type, importPath} , royaltyFree wins when both serve |
| `listSoundEffects` |  | List bundled sound-effect names; searchSoundEffects discovers the server catalog |
| `muteSoundEffect` | id | Mute sound effect , now zeroes real volume (was stub) |
| `muteTrack` | id | Mute track , real volume-0 write (stub echo dropped) |
| `openMediaManager` | type | Open media manager , launches the real media tool |
| `openMusicLibrary` |  | Open music library , now launches real media tool (was stub) |
| `openSoundEffectsLibrary` |  | Open sound effects library , now launches real SFX tool (was stub) |
| `openVolumePanel` | id | Open volume panel , real tool launch, UI-unit readback (scales fixed) |
| `previewMusicTrack` | track | Preview a catalog track by id or exact title through the product preview player |
| `previewSoundEffect` | effect | Preview sound effect , plays the real preview for a catalog id/title (was stub) |
| `removeMusicTrack` | id | Remove music track , now actually deletes selected element (was stub) |
| `replaceAudio` | id, path | Replace a music clip's audio, as the audio tool's replace flow does |
| `replaceElementMedia` | id, path | Replace a clip's media, as a media-panel drop onto the clip does |
| `replaceSoundEffect` | effect, id | Replace sound effect , now swaps real media (was stub) |
| `searchMedia` | query, kind | Search the project's imported timeline media by name |
| `searchMusic` | query | Search music , now queries the real library search (was stub) |
| `searchSoundEffects` | category, query | Search the server sound-effects catalog or browse one category |
| `showAdjust` | id | Show Adjust , scrolls right side panel to bring Adjust tool into view and opens panel with sliders at default |
| `splitSoundEffect` | position?, id | Split sound effect , now splits the real element (was stub) |
| `trimClip` | delta, trim?, side, id | Trim clip , trims via adapter trimElement |
| `trimMusicClip` | trimEnd, id | Trim music clip , now trims via real adapter (was stub) |
| `unmuteTrack` | id | Unmute track , restores recorded gain (stub echo dropped) |

## navigation

| Tool | Args | What it does |
|---|---|---|
| `appState` |  | Get current app screen (home/editor/loading) |
| `closeProject` |  | Close the current project and return to home |
| `deleteProject` | id | Delete a project by ID |
| `homeSelection` |  | Get home-grid bulk selection (mode + selected project IDs) |
| `newProject` |  | Create and open a new project |
| `openProject` | name, id | Open an existing project by ID or name |
| `projects` |  | List available projects with names and dates |
| `renameProject` | id, name | Rename a project by ID |
| `saveProject` |  | Save the current project composition to the library database |
| `setTitle` | name | Rename the current project |
| `title` |  | Get the current project title |
| `toggleFavorite` | id | Toggle favorite status on a project |
| `togglePin` | id | Toggle pinned status on a project |

## playback

| Tool | Args | What it does |
|---|---|---|
| `getLoop` |  | Get whether looping is enabled |
| `jumpToNextClip` |  | Jump playhead to the next clip boundary |
| `jumpToPreviousClip` |  | Jump playhead to the previous clip boundary |
| `pause` |  | Pause playback |
| `play` |  | Start playback |
| `playFromStart` |  | Seek to the beginning and start playback |
| `seek` | seconds | Seek the playhead to a position. Pass 'seconds' (e.g. 2.5 = 2.5s into the timeline). Do NOT use 'time' , the parameter is called 'seconds'. |
| `setLoop` | enabled | Set looping on or off |
| `step` | frames?, direction? | Step forward or backward by frames |
| `togglePlayback` |  | Toggle between play and pause |

## settings

| Tool | Args | What it does |
|---|---|---|
| `projectDynamicRange` |  | Get the open composition's dynamic range |
| `setAspectRatio` | ratio | Set the project aspect ratio (canvas shape) |
| `setFrameRate` | fps | Set the project frame rate |
| `setProjectDynamicRange` | range | Set the project dynamic range (SDR/HDR picker); confirm with projectDynamicRange |

## text

| Tool | Args | What it does |
|---|---|---|
| `applyTextToSpeech` | id, voice | Synthesize a text element's content and attach it as voiceover |
| `createTextSticker` |  | Create text sticker , now inserts a real sticker (was stub) |
| `deleteAccountFont` | id | Delete an entry from the account's imported-font library |
| `dragTextHorizontallyBlocked` |  | Drag text horizontally blocked , now verifies real element count via getAllElements (was stub) |
| `importAccountFont` | path | Import a font file into the account's imported-font library |
| `listAccountFonts` |  | List the account's imported fonts with the md5 of each stored file |
| `listFonts` | query, tab, limit | List the product font catalog by tab |
| `setTextVisibility` | id, visible | Set text visibility , now backed by real opacity (was stub) |

## tools

| Tool | Args | What it does |
|---|---|---|
| `cancelReverse` | id | Cancel an in-flight reverse transcode for a clip |
| `clearCrop` | id | Remove the crop from an element |
| `dismissOpacityPanel` |  | Dismiss opacity panel , real toolPresenter.dismiss, presentedTools readback |
| `dismissSpeedPanel` |  | Dismiss speed panel , real toolPresenter.dismiss, presentedTools readback |
| `dismissTool` |  | Dismiss the currently active tool in the sidebar |
| `dismissTransformPanel` |  | Dismiss transform panel , real toolPresenter.dismiss, presentedTools readback |
| `dragSpeedPanelCurve` | preset, settle | DEPRECATED: prefer setSpeedCurve({id, preset}). This drives the Speed panel's internal callback, which is currently refused (it crashed the app twice via reflection). |
| `editValueField` | text?, match, index?, arrow? | Type into, or arrow-step, a tool value field through the field's own delegate callbacks |
| `removeSpeedPanelCurves` |  | Clear the curves of the presented Speed panel's selection, as its Remove speed curve button does |
| `reverseClip` | id | Start reversing a video clip without waiting for the transcode |
| `scrollToTool` | tool | Scroll the right sidebar so the given tool panel is at the top (or closest) |
| `selectSpeedPanelPreset` | preset | DEPRECATED: prefer setSpeedCurve({id, preset}) , the direct path. This drives the Speed panel's internal callback, which is currently refused (it crashed the app twice via reflection). |
| `selectSpeedTab` | tab | Switch the presented Speed panel's tab, as its tab bar does |
| `selectTool` | tool | Activate a tool by identifier and show it in the sidebar |
| `selectVolumeTab` | tab | Switch the presented Volume panel's tab, as its tab bar does |
| `setCrop` | top, id, right, bottom, left | Crop zooms the element into a normalized 0-1 rect; the element's on-canvas size is unchanged |
| `setDucking` | level?, id, behavior | Set auto-ducking behavior on an audio element |
| `setFade` | id, fadeOut, fadeIn | Set the audio fade in/out durations of an element |
| `setKeyframeEasing` | id, seconds, preset | Set the easing preset on the media keyframe at a time |
| `setMask` | shape, sizeH?, cornerRadius?, dryRun?, sizeW?, id, rotation?, centerX?, feather?, centerY?, invert? | Set a parametric shape mask on an element; rectangle masks in place (size kept, outside transparent) |
| `setOpacity` | opacity, id | Set the opacity of an element |
| `setReversed` | id, reversed | Toggle reversed playback on a video element |
| `setSoundBypass` | enabled | Flip the presented Volume panel's on/off toggle for the selection, as its header switch does |
| `setSpeed` | speed, id | Set the playback speed of an element |
| `setSpeedCurve` | preset, id | Apply a speed-ramp curve preset to a video element , the canonical speed-curve path (use over the DEPRECATED panel preset actions) |
| `setVoiceEnhance` | enhanceVoice, reduceNoise | Commit both Voice Enhance amounts for the selection through the presented Volume panel |
| `setVolume` | id, volume | Set the volume of an element as a linear gain fraction in 0...10 (0 = silent, 1 = unity/0 dB neutral, 10 = +20 dB max boost) |
| `toggleKeyframe` | property, id | Toggle a media keyframe for a property at the playhead |
| `toggleMaskKeyframe` | active | Add or remove the mask keyframe at the playhead through the open mask tool |
| `tools` |  | List available tools in the sidebar |

## tts

| Tool | Args | What it does |
|---|---|---|
| `listTTSVoices` |  | List all available text-to-speech voices |

## utility

| Tool | Args | What it does |
|---|---|---|
| `wait` | seconds? | Wait for a specified duration (server-side sleep for deterministic timing in batch mode) |

## voiceover

| Tool | Args | What it does |
|---|---|---|
| `cancelVoiceoverRecording` |  | Cancel the current voiceover recording without saving |
| `closeTeleprompter` |  | Close the teleprompter overlay |
| `deleteVoiceoverClip` | id | Delete a voiceover clip by its element UUID |
| `getCountdownEnabled` |  | Get whether the recording countdown is enabled and its duration |
| `getTeleprompterText` |  | Get the current teleprompter text and settings |
| `getVoiceoverAudioLevels` |  | Get the current voiceover audio level |
| `getVoiceoverPanelState` | enabled?, applyAll? | Get voiceover panel state , reads the panel mode (no product backing) |
| `getVoiceoverRecordingState` |  | Get the current voiceover recording state, duration, and audio level |
| `getVoiceoverState` |  | Get voiceover state , reads real voiceover volumes (stub fallback dropped) |
| `listTeleprompterScriptKeys` |  | List persisted teleprompter scripts by composition ID |
| `listVoiceoverClips` |  | List all voiceover clips in the composition |
| `openTeleprompter` |  | Open the teleprompter overlay |
| `recordVoiceover` | effect?, duration, count? | Record voiceover , now imports count clips as real voiceover (was stub) |
| `setCountdownEnabled` | enabled, duration? | Enable or disable the recording countdown |
| `setTeleprompterText` | fontSize?, text, scrollSpeed? | Set the teleprompter text content |
| `setVoiceoverVolume` | applyAll?, volume, id | Set voiceover volume , now writes real element volumes (was stub) |
| `slipVoiceover` | id, offset | Slip voiceover , now moves element via real moveElement (was stub) |
| `startVoiceoverRecording` |  | Start recording voiceover audio |
| `stopVoiceoverRecording` |  | Stop recording voiceover audio and save the clip |
| `toggleApplyAll` | enabled | Toggle apply all , sets the voiceover panel mode (no product backing) |

## zoom

| Tool | Args | What it does |
|---|---|---|
| `getZoom` |  | Get the current zoom level |
| `setZoom` | level | Set the zoom level |
