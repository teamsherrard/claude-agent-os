# The AI Editing Studio — build spec (Plugin 10, `realtor-riverside-editor`)

*Status: built as v0.2.0 on 2026-09-19. This is the design record: why it is shaped this way, what each piece owns, and what is left.*

## 1. The decision

Riverside is the primary editing engine for the cohort; Descript (Plugin 6) stays as an optional second engine.

- **Economics scale.** Riverside does not meter edits. At the cohort cadence (about 8 long-forms and 16 reels a month) Descript needs roughly 2,500–3,000 AI credits a month, above its 1,500-credit Business plan. Riverside Grow is flat.
- **Deterministic.** Claude performs each operation itself and proves it with a revision diff. No second AI interprets the request.
- **Closes the loop.** Record, edit, publish, and schedule in one account.
- **The honest gap.** Graphics and motion. Native text cards cannot take a brand panel colour; transitions, a sound-effect library, and motion graphics are not on the connector. Closed by the Video Brand Kit (designed PNGs, icons, full-frame animated cards) from Claude Design.

**Plan requirement:** Riverside Grow or higher. The Riverside connector is not available on Free or Pro.

## 2. The shape — two layers

The marketing goal is a plugin that reads as a full editing team. The engineering risk of many skills is overlapping triggers and duplicated rules. The design resolves both:

| Layer | Count | Contains | Rule |
|---|---|---|---|
| **Craft skills** | 20 | One job each; a thin `SKILL.md` over exactly ONE file in `shared/` | All run the same seven steps in `shared/craft-contract.md` |
| **Directors and front doors** | 5 | Orchestration, routing, onboarding | No craft detail; they open craft references in order |

A rule lives in one file. If craft detail appears in a director, it is in the wrong place.

## 3. The five stages and what each skill owns

| Stage | Skill | Owns (reference) | Writes to the video? |
|---|---|---|---|
| DIRECT | `studio-direction` | `creative-direction.md` | no |
| | `studio-record` | `recording.md` | no |
| | `studio-transcript` | `preflight-check.md` | no |
| CUT | `studio-fluff` | `clean-cut.md` | yes — the only destructive craft; hard review gate |
| | `studio-hook` | `hook.md` | yes (a cut) |
| | `studio-interview` | `interview.md` | yes |
| POLISH | `studio-audio` | `audio.md` | yes |
| | `studio-color` | `footage-look.md` | yes |
| | `studio-captions` | `caption-style.md` | yes |
| | `studio-music` | `music.md` | yes |
| | `studio-broll` | `broll-ladder.md` | yes |
| | `studio-library` | `footage-intake.md` | no (uploads + index) |
| | `studio-graphics` | `graphics-style.md` (+ `cta-pack.md`, `brand-wiring.md`) | yes |
| | `studio-energy` | `effects-menu.md` | yes |
| REPURPOSE | `studio-repurpose` | `repurpose.md` | yes (new edits) |
| | `studio-batch` | `batch.md` | yes |
| | `studio-podcast` | `podcast.md` | export only |
| SHIP | `studio-check` | `final-check.md` (+ `frame-qa.md`) | no |
| | `studio-review` | `revisions.md` | yes (narrow) |
| | `studio-publish` | `publishing.md` | publishes |
| FRONT DOORS | `studio-setup`, `studio-navigator`, `studio-longform`, `studio-reel`, `studio-listing` | `riverside-playbooks.md`, `tool-map.md`, `house-rules.md`, `dos-and-donts.md`, `cost-discipline.md`, `layouts.md`, `content-types.md`, `plain-language.md` | via the crafts |

## 4. One owner per output

`shared/boundaries.md` is the contract. The Studio edits video and never writes marketing.

- **YouTube System** owns titles, descriptions, chapter names, tags, hashtags, scripts, written repurposing. The Studio supplies the **section map** (timestamps on the final cut + plain notes) and places the SEO Package's chapter titles as native markers.
- **Short-Form System** owns reel captions, hashtags, the calendar. The Studio supplies each reel's hook line, length, and link.
- **Claude Design** owns every designed asset (Video Brand Kit, icons, animated cards, thumbnails). The Studio places them.
- **Listing Launch / Market System / the Brain** own listing facts, market numbers, compliance text.
- **The double-post rule:** one posting route per post (`publish_route` in the config), checked against the shared board and `memory/content-log.md`.
- **When an owner's package does not exist:** finish the edit, hand over what the owner needs, and post only under the agent's own words, unlisted, saying it has no SEO yet.

## 5. Facts established by live runs (do not re-derive)

1. Stock and media overlays insert at 90% of the canvas with a border → a scale batch is mandatory.
2. `add_lower_third` and every text overlay insert centred on the face → always `modify_position`.
3. `fontSize` is in 1080p export pixels: 16:9 cards 64; 9:16 cards 72, captions 84. Positions are canvas pixels (640×360 / 360×640).
4. `update_aspect_ratio` must run before any overlay exists.
5. Placement tools take source time; the transcript's compact rows speak playable time. Use word-level `assetStart`.
6. A Riverside-made edit can arrive with captions on and with AI chapters; long-form switches captions off and merges chapters.
7. `insert_audio` maps a bed onto source time across cuts; a 37 s track covers 37 s of finished video.
8. The Riverside editor tab re-saves the scene on load → a harmless `CONFLICT`; re-read and retry once.
9. `create_edit_from_recording` is not gated on Grow. Exports are 1080p, no watermark, and return a storage key, not a link.
10. Transparency: PNG overlays keep their alpha; WEBM with alpha is flattened to black by the transcode.
11. Overlay motion: `set_overlay_clip_animations` (`animationType` + `{n,d}` duration) works on PNG overlays and Riverside writes eased keyframes; a hand-written keyframe at time > 0 on an overlay clip hangs the editor. Punch-ins are NOT keyframes: `modify_scale` on the recording track or clip, `set_visual_crop` on a split recording clip, and a bare `scale` in `update_scene_slot_settings` all return success and write nothing (found 2026-09-21; the two earlier live edits therefore shipped with no punch-ins). The working form is a split scene with `update_scene_slot_settings … positioning:{scale, offset}`, verified on frames.
12. Visual checks: Claude in Chrome on the editor preview (the built-in browser has no access); the exported file via ffmpeg once the agent downloads it.

## 6. What is left

| Item | Why it matters |
|---|---|
| Video Brand Kit v2 in Claude Design (Riverside section, icon pack, full-frame animated cards) | Closes the graphics gap Mike flagged; the Studio side is already wired |
| ~~The transparent WEBM test~~ DONE 2026-09-19 | Transparent PNG keeps alpha; transparent WEBM is flattened to black. Moving name strips and pop-ups = PNG + timeline animation, never pre-rendered video |
| First live runs of Setup, brand-kit registration, Publish, Interview, Podcast, Library | Never executed against a live account |
| A calibrated seek recipe for Chrome frame checks | Every run so far needed a second pass to land on the right second |
| Confirm Riverside's storage limits and recording-hour wording with their support | Needed before a cohort plan guide is published |
| Partner asks to Riverside: Motion on the MCP, a panel colour on text, a download link on exports, transitions, SFX, transcript correction | Each removes a workaround |
| Cohort walkthrough deck | In the style of the YouTube System deck |
