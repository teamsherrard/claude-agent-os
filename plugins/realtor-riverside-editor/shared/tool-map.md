# Tool map — Descript → Riverside (the crosswalk)

One page so anyone who knows the Descript editor can read this plugin instantly. Left = what Plugin 6 did; right = how this plugin does the same job in Riverside. **Every right-hand entry is a real tool on the Riverside connector** (verified against the connector's own editing guide, Sept 2026).

| Job | Descript engine | Riverside engine |
|---|---|---|
| Find the video | `list_projects` / `get_project` | `platform_list_recordings` (status must not be `uploading`) → `platform_get_recording` → `platform_get_project` (recordings + edits in one call). Search by spoken words: `search_riverside` / `search_recording_transcripts_exact`. |
| Get the video in | `import_media` by URL | **Not via the connector.** The main recording is recorded in Riverside or uploaded in the Riverside dashboard. The connector's `media_create_media_upload` → `curl -T` → `media_finalize_media_upload` handles B-roll / music / images / logo only (≤500 MB each; MP4/WEBM/MPEG, WAV/MP3/OGG, JPG/PNG). |
| Make the working copy | edit the original composition in place | `editing_create_edit_from_recording` (sessionId = recording id, projectId, title) → `editId`. May be gated → fall back to an edit the agent creates in Riverside, found via `platform_list_edits`. Snapshot before destructive work: `editing_clone_edit`. |
| Read the transcript (free) | `export_transcript` | Prose for understanding: `platform_get_transcript(sessionId)`. Cut-grade: `editing_read_aligned_transcript(editId)` → compact rows with `spanId`, `playableStartMs/EndMs`; `detail:"words"` in a window for `wordId`s. |
| Cut a passage | prompt Underlord | `editing_resolve_transcript_selection(intent:"remove", boundary_range start/end text anchors)` → execute the returned `cut_time_ranges` payload unchanged. Reverse-chronological is handled server-side. |
| Filler words | prompt ("CUT, don't voice-clone") | `editing_remove_fillers(method:"Cut")` — transcript-labelled, no audio synthesis exists. Undo: `editing_restore_audio_cleanup(cleanup:"fillers")`. |
| Dead air | prompt | `editing_remove_pauses(thresholdMs)` — 1500 long-form, 1000 reels. Undo: `restore_audio_cleanup(cleanup:"pauses")`. |
| Studio Sound | prompt ("~55%") | `editing_set_magic_audio(trackId, enabled:true, mixLevel)` — 0.55 default, 0.85 phone/echoey, on every speaker track. Read `trackId` from `editing_read_timeline_in_range`. |
| Colour grade | prompt | `editing_set_color_correction(target track, {brightness, contrast, saturation, colorTemperatureKelvin})` — bare minimum values in `footage-look.md`. |
| Reframe to 9:16 | prompt | `editing_batch` op `update_aspect_ratio {ratio:"9:16"}` **BEFORE any overlay exists**, then `editing_apply_smart_layout(style:"FullScreen")` (solo → `solo-fullscreen-1-tile-portrait`). Face offset: batch `update_scene_slot_settings`. |
| Karaoke captions | prompt | `editing_set_captions(editId, show:true, position:{x:0.5,y:0.84}, style:{animation:{effect:"karaoke"}, contentPerSegment:"lines_1", effect:"outline", fontFamily:"Poppins ExtraBold", fontWeight:800, fontSize, primaryColor:"#FFFFFF", secondaryColor:<brand accent>, textAlign:"Center", widthRatio:0.8})`. Or a studio preset via `editing_get_captions_presets` + `presetId` + `studioId`. |
| Proper-noun glossary | prompt a find-and-correct pass | **No transcript-edit tool.** Captions render from Riverside's transcript as-is. Check the aligned transcript for misspellings; if the agent's name / brokerage / city / address is wrong, they correct it in the Riverside transcript panel (free, one minute) BEFORE captions — or captions go on with the spoken words and the card carries the correct spelling. |
| Hook card / CTA / emphasis pop-up | prompt (native text object) | Preferred: **Video Brand Kit PNG** via `editing_insert_overlay(assetId, startMs, durationMs, position)`. Native: batch `insert_text_overlay {role:"TITLE", effect:"boxed", text, fontFamily, fontSize, color, animation:[popIn/popOut], trackZIndex:10}` → read the timeline for the new clip's `uniqueId` → `modify_position` keyframe to the format zone. |
| Lower third | prompt | `editing_add_lower_third(name, title, startMs, durationMs)` — built-in speaker style. |
| Punch-ins | prompt ("~1.06×, with a swoosh") | batch `modify_scale` keyframe pairs on the speaker **track** (`{time:t, scaleW:1.06·W, scaleH:1.06·H}` then back to `W,H` at `t+2.5s`), canvas from `settings.canvas`. Swoosh only if `sfx.swoosh_media_id` exists → `editing_insert_audio` at `t`. |
| Transitions / SFX | prompt | **Not exposed.** Riverside's hard cuts are clean; energy = punch-ins (+ optional uploaded swoosh). Say so in the delivery, don't fake it. |
| B-roll (stock) | Descript built-in stock via prompt | `editing_get_stock_media(query, mediaType)` → `editing_insert_stock_media(externalSourceId, mediaType, startMs, durationMs, position)` → scale the new overlay track to the canvas (full-cover). |
| B-roll (own footage) | `import_media` + prompt | media upload → `editing_insert_overlay` (image/video) → full-cover scale. Listing stills: Ken-Burns = `modify_scale` 1.00→1.08 over the still's duration. |
| Split-screen (horizontal b-roll on vertical) | Descript Layout | batch `change_layout {layoutId:"solo-half-vertical-side-1-tile-portrait", sceneIds}` (speaker top 50%) + the b-roll overlay positioned at `y=3/4`, scaled to the lower band. |
| Music bed | prompt | `editing_get_stock_music(collection, section:"underscore")` → `editing_insert_audio(assetId, startMs:0, dB:-18, fadeInMs:800, fadeOutMs:1500)`. Ducking is not a tool — a static -18 dB bed is the safe default. |
| Logo / brand kit | prompt | `editing_apply_brand(editId, studioId)` (logo, design, captions, intro/outro from the studio kit). Kit written once at setup by `editing_set_brand`. Logo alone: batch `insert_logo`. |
| Chapters | description timestamps only | batch `add_chapter {time, title}` (native) **plus** description timestamps. |
| Verify a pass landed | `wait_for_job` → `status: success` | Every write returns a `revision`. `editing_compare_revisions(from, to)` lists the cuts/mutes/toggles/scenes that changed, with the feature that made them. `editing_get_revision` = cheap staleness check. |
| Snapshot / undo | Descript version history | `editing_clone_edit` before the first destructive pass (only when the recording exists nowhere else); `restore_audio_cleanup` for fillers/pauses/smart mutes; the agent's own undo in the Riverside editor. |
| Export | `publish_project` (1080p) | `exports_create_export(sourceEditId, composeSettings:{export:{quality:"1080p", fileName}}, creationSource:"web")` → poll `exports_get_export(id)` until `COMPLETED`. **Returns an S3 key, not a download link** — the agent downloads from Riverside (lands in ~/Downloads). |
| Frame-QA | ffmpeg on the export | Ladder in `frame-qa.md`: (1) the downloaded export via ffmpeg, (2) Chrome screenshots of `platform_get_edit.riversideUrl` scrubbed to timestamps, (3) rule-based + the agent's eyeball. |
| Publish | share link only | `social_get_connected_platforms(studioId)` → `social_get_publishing_guidelines` → `editing_get_export_publish_data` (YouTube Content-ID check) → **explicit confirmation** → `social_upload_create` → `social_get_upload_status` once. Scheduling via `scheduledAt`. |
| Query ceiling | 100 queries / session | None documented. The constraint is **optimistic locking**: pass `expectedRevision` from your last read on every write; `CONFLICT` → stop, re-read, ask. |
| Out of credits | HTTP 402 → stop | No credit meter. `FAILED_PRECONDITION` = a feature gate or a missing precondition (no transcript yet, still processing) — explain it, don't retry blindly. |

## Things that are simply not there (say so, don't pretend)

- `reorder_timeline`, `create_edit_from_segments`, the `keep` / `move` intents — unavailable. Rearranging = cuts only (or the agent does it by hand).
- Transitions, SFX library, count-ups, eye contact (exists as `modify_eye_correction` but is a banned heavy-AI effect here), background removal (`modify_background` — banned on a talking head, same as Plugin 6).
- A download URL for an export. The agent clicks Download in Riverside.
- Transcript word correction from the connector.
