# Riverside playbooks (the tested recipes)

Claude edits directly; Riverside renders; the agent approves. These use the Riverside connector's **real tools** — names as the connector exposes them (the `editing_` / `platform_` / `exports_` / `social_` / `media_` prefixes are dropped here for readability). The full crosswalk from the Descript editor is `${CLAUDE_PLUGIN_ROOT}/shared/tool-map.md`.

## The tools you actually call

**Find & read (free, change nothing)**
- `platform_list_recordings` → the agent's videos. **A recording whose `status` is `uploading` or still processing is not editable yet** — say *"still uploading, give it a few minutes"* and wait; don't create an edit against it. Uploads and single-take recordings use `id` as the `sessionId`.
- `platform_get_recording(recordingId)` → the recording plus its `project.id` and `studioId` (you need both). `platform_get_project(projectId)` → recordings + existing edits in one call. `platform_list_edits(projectId)` → edits already made (filter `deleted: true`).
- `platform_get_transcript(sessionId)` → prose with `Speaker (m:s.mmm)` per sentence — for the pre-flight read. `read_aligned_transcript(editId)` → compact rows (`spanId`, `playableStartMs/EndMs`, `fillerCount`, `pauseCount`, `startsMidSentence/endsMidSentence`) — for cut planning; `detail:"words"` in a window for exact boundaries. Both return the current `revision`.
- `read_timeline_in_range(editId, startTime?, endTime?)` → tracks (`uniqueId` = `trackId`), clips (`uniqueId` = `clipId`), scenes, keyframes, and `settings.canvas` (width/height). Read a narrow window; don't dump the whole timeline.
- `get_revision(editId)` → cheap "did anything change?" check. `compare_revisions(editId, from, to)` → the diff: cuts/mutes/scenes created/modified/deleted with the feature that made each (`removeFillerWords` / `removePauses` / `smartMute` / null = ours), toggles, volume changes, duration before/after. **This is how you verify a pass.**
- `get_captions_presets(studioId)` / `get_brand(studioId)` / `list_layouts(aspectRatio, participantCount)` / `get_stock_media(query, mediaType)` / `get_stock_music(collection, section)` / `media_list_media(productionId, search)` / `get_asset_metadata(assetId)`.

**Make the working copy**
- `create_edit_from_recording(sessionId, projectId, title)` → `editId`. The recording is never modified. **Not gated on Grow (live-tested).** If it ever returns `FAILED_PRECONDITION`, fall back: *"Open the recording in Riverside and hit Edit once — I'll take it from there,"* then `platform_list_edits(projectId)` and use the newest one. Don't retry the gated call.
- `clone_edit(sourceEditId, title)` → a full copy. The **snapshot** before the first destructive pass when the recording exists nowhere else (recorded straight in Riverside and never downloaded). Continue on the ORIGINAL edit; the clone is the safety copy. Say *"I saved a copy of your original first."*

**Cut (destructive — one reviewed pass)**
- `resolve_transcript_selection(editId, intent:"remove", selections:[...], revision)` → `payload.tool` + `payload.input` when `readyToApply: true`. Selections: `boundary_range` with `text` anchors (opening quote → closing quote; add `occurrence` if a quote repeats), `span` (a whole row), `word_range`, or `time_range`. Warnings fail closed with `payload: null` — disambiguate, never guess timestamps.
- `cut_time_ranges(editId, cuts:[{startMs,endMs,source:"user"}], expectedRevision)` → execute the resolver payload **unchanged**. Ordering and source-time conversion are handled server-side. This is the only ungated cut route — always use it for removals.
- `remove_fillers(editId, method:"Cut", expectedRevision)` — transcript-labelled ums/uhs/disfluencies. `"Smart"` (mute <500 ms, cut ≥500 ms) if the Cut result reads choppy on a fast talker. **No audio is ever synthesised** — the voice-clone trap from the Descript editor cannot happen here.
- `remove_pauses(editId, thresholdMs, expectedRevision)` — 1500 long-form (avoid harsh cuts), 1000 on a reel (cut tighter).
- Undo any of the three: `restore_audio_cleanup(editId, cleanup:"fillers"|"pauses"|"smart_mutes")`.

**Audio & look (non-destructive)**
- `set_magic_audio(editId, trackId, enabled:true, mixLevel, expectedRevision)` — on **every speaker track** (read `trackId`s from the timeline). **0.55** default; **0.85** phone/echoey; 1.0 only for a bad room. If the response says the enhanced audio is unavailable/skipped, the recording hasn't finished processing — wait, don't loop.
- `set_color_correction(editId, target:{kind:"track", id}, adjustments:{brightness, contrast, saturation, colorTemperatureKelvin?}, expectedRevision)` — the bare-minimum values in `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md`.
- `apply_smart_mutes(editId)` — multi-speaker only (mutes the non-speaker's track). Skip on a solo talking head.

**Format & layout**
- `batch` op `update_aspect_ratio {ratio:"9:16"}` — **FIRST, before any overlay exists** (it's rejected once an overlay has size keyframes). Then `apply_smart_layout(editId, style:"FullScreen")` — a solo speaker lands on `solo-fullscreen-1-tile-portrait`. Read the timeline after to confirm the canvas is now portrait.
- Face centring / headroom: `batch` op `update_scene_slot_settings {sceneId, updates:{<tileId>:{offset:{x,y}, scale}}, overwrite:false}` — small offsets only, never crop the head.
- Split-screen (horizontal b-roll on a vertical reel): `batch` op `change_layout {layoutId:"solo-half-vertical-side-1-tile-portrait", sceneIds:[…]}` (speaker in the top half; captions move to middle-centre in that layout — re-set caption `position.y` ≈ 0.47 for those scenes via `update_scene_caption_settings`, or keep it simpler and time the b-roll over a cutaway instead).

**Captions**
- `set_captions(editId, show, position:{x,y}, style:{…}, presetId?, studioId?, expectedRevision)` — one call, merged onto current settings. The karaoke recipe is in `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`. **Long-form: `set_captions show:false` is a MANDATORY pass, not an omission** — an edit the agent created in Riverside can arrive with captions already ON (live-tested: the Riverside-made edit rendered big boxed uppercase captions on top of the pop-ups until they were switched off).

**Graphics & text**
- **Brand-kit card (preferred when `brand.assets` is populated):** `insert_overlay(editId, assetId, startMs, durationMs, position:{x:{n,d},y:{n,d}}, expectedRevision)` — the PNG's media id comes from `brand.assets.riverside_media_ids` (registered at setup). Full-frame → position centre; the kit's reserved zones were designed off-face. **The full recipe, LIVE-TESTED 2026-09-21 on a real edit:** `insert_overlay` (returns `clipId`; lands at 90% size) → one `batch`: `modify_scale {clipId, time:{n:0,d:1}, scaleW:W, scaleH:H, canvasWidth:W, canvasHeight:H}` (true full-frame) + `set_overlay_clip_animations` (slide or pop in, fade out) → the words as ONE `insert_text_overlay` with `effect:"shadow"`, `trackZIndex:30`, starting 0.3 s after the panel and ending with it → `modify_position` into the panel (vertical centring rule in `graphics-style.md`). An icon is the same `insert_overlay` with `position` given as canvas fractions, then `modify_scale` to about 36 canvas px on 16:9 (a 100 px badge at 1080p).
- **Native card:** `batch` op `insert_text_overlay {desiredInsertionTime:{n,d}, duration:{n,d}, name, trackZIndex:10, text, role:"TITLE", fontFamily, fontSize, color:"#FFFFFF", effect:"boxed", animation:[{name:"popIn",type:"in",duration:0.3,offset:0},{name:"popOut",type:"out",duration:0.25,offset:0}]}` → the op's result carries the new clip's id (`data.clipId`, LIVE-TESTED) → `batch` op `modify_position {clipId, time:{n:0,d:1}, positionX, positionY, canvasWidth, canvasHeight}` to the format zone (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`). One card = ONE text object. The `boxed` effect is the panel — its colour is Riverside's default (dark on white text); **you cannot brand the panel colour natively** (seen in the tool surface: no box-colour field) — which is exactly why the brand-kit PNG is preferred.
- `add_text_overlay(editId, text, role:"title"|"subtitle"|"body"|"speaker", startMs, durationMs, style:{color, effect, fontFamily, fontSize})` — the same built-in presets without positioning; fine for a centred title over B-roll, not for an off-face card on a talking head.
- `add_lower_third(editId, name, title, startMs, durationMs)` — built-in speaker style (Inter 64, shadow, two centred lines). **LIVE-TESTED: it inserts DEAD CENTRE on the face, not lower-left.** Always follow it with `batch` `modify_position {clipId:<returned clipId>, time:{n:0,d:1}, positionX:200, positionY:305, canvasWidth:640, canvasHeight:360}` (bottom-left over the desk/shelf, clear of hands). Long-form only.
- Emphasis pop-up = a native card with the key phrase (or the kit's `emphasis_*` PNG + one text object), ~3–4 s, lower third on 16:9.

**Energy**
- Punch-in (**LIVE-TESTED 2026-09-21, the only form that works**): a punch-in is a short SCENE with a zoomed slot, not a keyframe. (1) `batch` two `split_scene_at_time {splitTime:{n,d}}` ops at the SOURCE-time start and end of the key line (word-level `assetStart` of its first word, and of the first word after it; one split only when the line runs to the end of the video). (2) `read_timeline_in_range` inside that window → the new scene's `uniqueId`, its tile id (the key under `slotSettings`, `fullscreen` on a solo layout) and the `trackUniqueId` in it. (3) `batch` `update_scene_slot_settings {sceneId, updates:{"<tileId>":{trackId:<trackUniqueId>, positioning:{scale:1.08, offset:{x:0,y:0}}}}, overwrite:true}`. It is a HARD-CUT zoom (the jump-zoom every talking-head channel uses), so it must start and end on a phrase boundary and hold for the whole line (about 2.5–6 s). Read the scene back and confirm `positioning.scale` is there, then verify one on a frame (no edge, comfortable headroom). **What does NOT work (all return `success` and write nothing):** `modify_scale` on the recording track or clip at any time, `set_visual_crop` on a split recording clip, a duplicated recording clip scaled on its own track, and `updates:{tile:{trackId, scale}}` without the `positioning` wrapper. Never report a punch-in you have not read back.
- Swoosh: `insert_audio(editId, assetId:<config.sfx.swoosh_media_id>, startMs:t, durationMs, dB:-10)` — only if that id exists.
- Logo: `apply_brand(editId, studioId)` places the kit logo (+ design + captions preset + intro/outro if the kit has them — read the response: it lists what applied and what skipped). Logo alone: `batch` op `insert_logo {assetId, placement:"topRight", opacity:0.7, width:{n:1,d:8}}`.

**B-roll & music**
- Stock: `get_stock_media(query, mediaType:"video"|"image", count)` → `insert_stock_media(editId, externalSourceId, mediaType, startMs, durationMs, position)` (imports + places server-side). **LIVE-TESTED:** every overlay lands as a CLIP on the single "Default Overlay Track" at **90% of the canvas with a 5% border** (`video.size` 0.9×0.9). Full-cover it with ONE batch after all inserts: `modify_scale {clipId:<overlay clip uniqueId>, time:{n:0,d:1}, scaleW, scaleH, canvasWidth:640, canvasHeight:360}` — the timeline's reference canvas is **640×360** regardless of export resolution; use aspect-correct cover sizes (16:9 clip → 640×360; a 1.9:1 clip → 683×360; a 2.37:1 clip → 854×360). Verified on frames: edge-to-edge, no bars.
- Own footage: `media_create_media_upload(fileName, mimeType, fileSizeBytes, productionId, studioId)` → `curl -T <file> -H "Content-Type: <mime>" "<uploadUrl>"` → `media_finalize_media_upload(mediaId, thumbnailUploadUrl for video)` → poll `media_get_media(mediaId)` until `transcoded`/`done` → `insert_overlay(editId, assetId, startMs, durationMs)` → full-cover scale as above. ≤500 MB per file. This works in Code mode (local filesystem); in a browser-only chat, have the agent drop the file into Riverside's Your Media panel instead and find it with `media_list_media`.
- Music bed: `get_stock_music(collection, section:"underscore", count)` → `insert_audio(editId, assetId:<mediaId>, startMs:0, dB:-18, fadeInMs:800, fadeOutMs:1500)`. Free library, licensed. Mood table in `${CLAUDE_PLUGIN_ROOT}/shared/music.md`. If the bed is shorter than the video, insert it again at its end (or pick the Long variant).

**Chapters, export, publish**
- `batch` ops `add_chapter {time:{n,d}, title}` — native chapter MARKERS. **The Studio never names a chapter** (`${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`): it produces the **section map** (timestamps on the final cut + a plain note of what is said) for the YouTube System, and writes the SEO Package's chapter titles onto the timeline once they exist (first at 0, ≥3, ≥10 s apart). **LIVE-TESTED: a Riverside-made edit already carries 3–4 AI-generated chapters** (`chapters[]` in the timeline). Leave them alone during the edit. `add_chapter` / `move_chapter` run ONLY after the YouTube System's SEO Package exists: replace the AI set with the package's titles at the section-map times, so there is one set. It is never part of a pass.
- `exports_create_export(sourceEditId, composeSettings:{export:{quality:"1080p", fileName:"<slug>"}}, creationSource:"web")` → returns the export `id` immediately → poll `exports_get_export(id)` every ~30–60 s until `COMPLETED` (minutes for a long video; `FAILED` is terminal → report, don't re-fire blindly). **Always `1080p`** — on a 9:16 edit that renders 1080×1920. 4K only if the source is 4K AND the agent asks. The result is an **S3 key, not a link** — the agent gets the file from Riverside's Exports (it lands in their Downloads), and that file is what you frame-QA if reachable (`${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md`).
- Publishing: `${CLAUDE_PLUGIN_ROOT}/shared/publishing.md` (gated).

## Time axes — the one conversion you must get right (live-tested twice)

**The clean way (run 2):** `read_aligned_transcript(detail:"words", startMs, endMs)` returns `assetStart`/`assetEnd` per word — those ARE source times. Place cards, cutaways, lower thirds, and keyframes at `assetStart.n / assetStart.d` seconds of the word they belong to. No offset arithmetic, no drift. Read the words in windows (the response caps at ~64 KB ≈ 90 words) around the moments you picked from the compact rows.

**The fallback:** the compact rows speak **playable** ms (post-cut). The placement tools (`insert_stock_media`, `insert_overlay`, `add_text_overlay`, `add_lower_third`, batch `insert_text_overlay`, `add_chapter`, keyframe `time`) speak **source** time. After any cut, convert: `source = playable + (total duration of synced cuts whose source start < that point)` — read `syncedCuts[]` from the timeline once and build the offset table (11 filler cuts on a 12-min video added up to 4.6 s by the end, i.e. a card placed by playable time would drift ~4 s late by the CTA). `cut_time_ranges` and `insert_audio` are the exceptions: they take playable ms and convert for you.

## Getting the video IN — read this first (it's where edits fail)

There is **no import-by-URL** on this connector. The main recording gets into Riverside one of three ways, and you only ever *find* it:

1. **Recorded in Riverside** (the natural fit — Riverside is a recorder first). `platform_list_recordings` → it's there.
2. **Uploaded in the Riverside dashboard** — the agent drags the file into their project (Riverside handles multi-GB 4K uploads in the browser). Until `status` stops saying `uploading`/processing, the transcript and Magic Audio don't exist yet → **wait; say so in one line; don't create the edit early.**
3. **Not in Riverside at all** → *"Upload it to your Riverside project first — drag it onto the project page — and tell me when it's done."* Never try to push a big local file through the media upload (500 MB cap, and it lands in Your Media, not as a recording).

Then: `platform_get_recording` → `project.id` + `studioId` → `create_edit_from_recording` → `read_aligned_transcript`. If the transcript read returns `FAILED_PRECONDITION` with `transcript_load_failed`, it's still processing — wait a few minutes and try once more; `no_session_ids` means the edit has no recording behind it — wrong edit, pick again.

## General habits (always)

- **Work on ONE edit.** Create it once, keep the `editId`, keep the last `revision`. Never create a second edit "to try something" — the agent ends up with mystery duplicates in their project. The one exception is the pre-destruction snapshot via `clone_edit` (only when the recording exists nowhere else).
- **Clean starts & ends — OPEN ON THE HOOK.** Resolve a cut from `0` to the first word of the confirmed hook line; trim the camera-off reach / dead air at the end — but NEVER cut into the hook or the CTA. End on a complete thought.
- **Magic Audio — its own step, on every speaker track, confirmed.** Read the timeline after: the track should show an `audio.enhancedAudioMix` keyframe / magic-audio flag. If it silently didn't apply (recording still processing), say so — don't ship "cleaned audio" that isn't.
- **Verify each pass with a diff**, not a vibe: `compare_revisions(startRev, endRev)`. Log the pass.
- **NEVER enable background removal / blur / eye correction on a talking head.** `modify_background` and `modify_eye_correction` exist in the batch surface — they are banned here (`${CLAUDE_PLUGIN_ROOT}/shared/cost-discipline.md`).
- **Overlay keyframes live at time 0 only.** Size and position right after the insert: fine. Anything later on an overlay clip hangs the editor (live-tested) — use `set_overlay_clip_animations` for motion.
- **Publishing is gated** — never `social_upload_create` without the summary + explicit yes.
- **A timeout is not a failure** — `get_revision` first; if it advanced, diff it.
- **`CONFLICT` = the agent is probably in the editor right now.** Stop, say *"looks like you're in the editor too — want me to keep going from where it is now?"*, re-read on their yes.

## THE PASS PLANS — fewest passes (the speed + correctness lever)

**Start with the free pre-flight** (`${CLAUDE_PLUGIN_ROOT}/shared/preflight-check.md`) — read the transcript, find the duplicate takes, quote the plan + time, get one yes. Then the passes. Each pass = a small group of writes with ONE diff to verify and ONE checkpoint line.

**SHORT-FORM reel — 4 passes:**
1. **CLEAN** — `update_aspect_ratio 9:16` (batch) → `apply_smart_layout FullScreen` → the reviewed cuts (`cut_time_ranges` from the resolver: open-on-hook, duplicate/bad takes, tail) → `remove_fillers Cut` → `remove_pauses 1000` → `set_magic_audio` on the speaker track(s). Preview the cuts (from the free transcript read) and get a yes BEFORE firing; verify with `compare_revisions` + a fresh `read_aligned_transcript` (does it open on the hook? does it end on the last word?).
2. **CAPTIONS** — `set_captions` karaoke (brand style, big, y≈0.84, inside the safe zones). Spelling check: read the aligned transcript for the agent's name / brokerage / city — if wrong, they fix it in the Riverside transcript panel first (free, a minute), then re-read.
3. **B-ROLL** — ≤3: `insert_stock_media` / `insert_overlay` on the exact words, each full-cover scaled, never over hook/face/CTA.
4. **FINISH** — `set_color_correction` bare-minimum → 2–3 punch-in scenes on key lines (+ swoosh if present) → music bed at -18 dB (`insert_audio` maps the bed onto SOURCE time across the cuts; a 37 s library track covers 37 s of PLAYABLE reel — insert it again at `startMs:<track length>` to cover the rest) → hook card (first ~2 s, top-edge zone, `fontSize 72`, ≤25 chars) → CTA card (last ~4 s, same zone) → the logo with `insert_logo` if the kit has one (NOT `apply_brand` on a reel: it can also apply the kit's caption preset over the captions you just set). Diff, log, **ONE export at 1080p**, frame-QA, deliver. **Live-tested reel recipe (46 s from a 70 s raw intro): 18 revisions, ~12 min, zero credits; `create_edit_from_recording` was NOT gated.**

**LONG-FORM — ≤6 passes:** ① open-on-hook + filler words (`cut_time_ranges` for the pre-hook + `remove_fillers Cut`; verify the first 40 s) · ② dead air + duplicate/bad takes (`remove_pauses 1500` + the resolved cuts — the reviewed destructive pass; snapshot first if the recording exists nowhere else) · ③ Magic Audio 0.55 + bare-min grade (two non-destructive calls) · ④ B-roll (~1 per 45–60 s, all placed in one go, each full-cover) · ⑤ energy (a couple of punch-in pairs on key beats + optional swoosh) · ⑥ text (lower third on first appearance + hook card + CTA + an emphasis pop-up every ~2–3 min, all in the LOWER THIRD zone on 16:9) + `apply_brand`. The section map and frame-QA are FREE Claude work; titles, descriptions, chapter names, and tags belong to the YouTube System. **Budget one "text fix" round** — sizing usually needs a correction after the first frame-QA; that's normal.

**LISTING reel — ≈4 passes** (the short-form plan; address/price cards join FINISH; the room cutaways are the B-roll pass). A long YouTube tour follows the long-form plan.

**ONE RENDER:** `exports_create_export` once at `1080p` on approval; use it for both the frame-QA and the agent's review. Re-export only if a blocker fails.

## Concurrency & the revision rule (the Riverside equivalent of the query ceiling)

There is no documented per-session query limit. The thing that WILL bite is **optimistic locking**: every write should carry `expectedRevision` from your last read; if the agent nudges anything in the editor between your read and your write, the write returns `CONFLICT` and nothing is saved. Rules:
- Read → write → read the returned revision → next write. Don't reuse a stale revision across a pass.
- On `CONFLICT`: follow the one rule in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` — a harmless editor-tab re-save gets one retry; a real hand edit means stop and ask.
- Batches are atomic: on `failedOperationIndex`, nothing in that batch landed — fix that one op, re-send the whole batch.

### Checkpoint log — so a stopped edit resumes cleanly

`~/realtor-brain/editor/jobs/rs-<editId>.md`, ONE line per landed pass:

```
<pass name> · done · rev <revision>
```

(e.g. `clean · done · rev 7` / `captions · done · rev 8` / `broll · done · rev 12`). Write the line only AFTER the diff confirms it.

**At the START of any long-form or listing edit, check for this log first.** Log exists → one plain line, run only the unlogged passes. Log missing → `compare_revisions("1", head)` tells you the truth (toggles + cuts + scenes) — state it, one-word confirm, continue.

### Named failure modes (say the plain words, don't retry)

- **Still processing** (`FAILED_PRECONDITION` · `transcript_load_failed`, or Magic Audio "skipped"): *"Riverside's still finishing your upload — give it a few minutes and say 'go' and I'll start."*
- **Feature gated** (`FAILED_PRECONDITION` on `create_edit_from_recording` / `set_brand`): use the fallback in the tool list above; say what you did in one line.
- **Conflict**: *"Looks like you're in the editor at the same time — I've paused so nothing gets overwritten. Say 'go' and I'll pick up from where it is now."*
- **Export failed** (`FAILED`): report it; check `get_revision` still matches; re-fire ONCE only if the agent says so.

## Playbook A — long-form cleanup (≤6 passes)

1. Find the recording (`platform_list_recordings` → not `uploading`) → `platform_get_recording` → `create_edit_from_recording(sessionId, projectId, title:"<Video title> — edit")` (or the gated fallback). `read_aligned_transcript(editId)` → revision R0.
2. **FREE PREP:** read the compact rows; **IDENTIFY the hook line** (confirm it so the open-on-hook cut can't clip real content); find **duplicate takes** (same point twice — keeper is usually the later, complete one; quote the distinguishing line of each); note **section changes** (chapters + emphasis pop-up + B-roll spots); read `identity/compliance.md`; build the **spelling list** (name / brokerage / city) and check the transcript for it. Quote the plan + time; get the yes.
3. **PASS ① — open on the hook + filler words:** resolve `time_range 0 → hook first-word` (or `boundary_range` from the first spoken word to the word before the hook) with intent `remove` → `cut_time_ranges` → `remove_fillers Cut`. Re-read the first 40 s of the aligned transcript. Log.
4. **PASS ② — dead air + duplicate/bad takes (the reviewed destructive pass):** `remove_pauses 1500` → resolve each duplicate take as a `boundary_range` (opening quote → closing quote, `occurrence` where needed) → one `cut_time_ranges` with all of them. **The agent saw this list in the pre-flight — that was the hard gate.** Diff: `durationBeforeMs → durationAfterMs` should match the quoted cut. Log.
5. **PASS ③ — Magic Audio + grade:** `set_magic_audio` every speaker track at 0.55 (0.85 phone) → `set_color_correction` on the speaker track (bare minimum). Read back the track; confirm both keyframes exist. Log.
6. **PASS ④ — B-roll:** `studio-broll` picks every moment from the transcript first (free), then places them all: ~1 per 45–60 s, each 2.5–5 s, full-cover, unique, instantly recognisable, never over hook/face/CTA. Verify the count on the timeline. Log.
7. **PASS ⑤ — energy:** 2–3 punch-in scenes on key lines (slot scale 1.08, held for the line, phrase boundary to phrase boundary), + swoosh if available. Read one back and verify it on a frame. Log.
8. **PASS ⑥ — text + brand:** hook card (first ~2 s) → `add_lower_third` for ~5 s, starting at least half a second AFTER the hook card clears (they share the lower-third zone; never both at once) → CTA card (last ~4 s) → emphasis pop-ups every ~2–3 min → `apply_brand` (logo). **16:9 → everything in the LOWER THIRD (~75–80% down)**, one wide line each, sized per `graphics-style.md`. Compliance-check every word first. Diff; log.
9. **FREE:** the section map for the YouTube System (timestamps + plain notes — never titles, descriptions, or chapter names; `boundaries.md`) → **ONE export at 1080p** on approval → frame-QA (`frame-qa.md`) → fix + re-export only if a blocker fails → hand over as a review draft with the section map → offer the music bed → offer to publish.

## Playbook B — short-form / pull shorts

Two modes: **standalone reel** (steps 4–5 below) and the **repurpose batch** (one long video → N clips).

### B0 — Repurpose batch (long → N clips)

1. **Scope & confirm N** (default 3, cap 5). One number, one yes.
2. **ONE working edit for the source.** Create (or find) the edit for the long recording once. Read the aligned transcript once (revision R0).
3. **SCORE candidate spans (free):** every contiguous 20–60 s span, 0–2 on five criteria — self-contained · hook line · high-value/emotional · clean payoff · length-fit (30–45 s ideal). Keep ≤10.
4. **PICK the top N distinct** — no overlaps, no same-topic repeats. Can't find N strong ones → say so.
5. **Per clip = its own edit.** `clone_edit(sourceEditId, title:"Clip N — <hook line>")` → on the clone, `resolve_transcript_selection` the head (0 → clip first word) and the tail (clip last word → end) with intent `remove` → ONE `cut_time_ranges` with both (the connector documents this exact clone-then-trim recipe because `create_edit_from_segments` is unavailable). Then run the standalone 4-pass recipe on that clone. **Sequential, each to done**, checkpoint line per clip (`clip-1 <hook> · done · rev n` in the SOURCE edit's log).
6. **Frame-QA each clip**, then **deliver all N at once**, labelled by hook line. Export each at 1080p on approval.

### Standalone reel — 4 passes (also the per-clip recipe in B0)

1. Find/create the edit; read the aligned transcript (R0). **If the recording is 16:9 (it usually is), the reel becomes 9:16 in pass 1 — do the aspect change FIRST, before anything is overlaid.**
2. **FREE PREP:** the moment (hook → idea → payoff/CTA), the hook line, the spelling check, compliance.
3. **PASS 1 — CLEAN:** `update_aspect_ratio 9:16` → `apply_smart_layout FullScreen` → the reviewed cuts (`cut_time_ranges`: open on the hook, zero dead air via `remove_pauses 1000`, clean end; never cut the hook or the CTA) → `remove_fillers Cut` → `set_magic_audio 0.55/0.85`. Yes before firing; diff after.
4. **PASS 2 — CAPTIONS:** `set_captions` karaoke — brand font/accent, fontSize per `caption-style.md`, `position.y ≈ 0.84`, `widthRatio ≈ 0.8` (keeps text out of the right ~12% icon rail), `textAlign Center`.
5. **PASS 3 — B-ROLL:** ≤3, full-cover, on the words, never repeated, never over hook/face/CTA. Horizontal clip that dies when cropped → split-screen layout (`layouts.md`).
6. **PASS 4 — FINISH:** grade → 2–3 punch-ins → music bed -18 dB → hook card (top-edge zone, ~2 s) → CTA card (last ~4 s, above the captions) → the logo with `insert_logo` if the kit has one (not `apply_brand` on a reel). Diff; log.
7. **ONE export at 1080p** on approval → frame-QA → fix + re-export only on a blocker → review draft → offer to publish (`studio-publish`).

## Playbook C — build from a prompt (not offered)

Riverside has no script-to-video assembly on the connector, and AI-voiced drafts aren't something we make for a realtor anyway. If asked, say the closest yes: *"Record it once on camera — 90 seconds is plenty — and I'll do the rest."*
