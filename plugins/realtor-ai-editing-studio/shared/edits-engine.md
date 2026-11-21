# The Instagram Edits engine — how every craft runs when `default_engine` is `"edits"`

Edits is Meta's free video editor for Mac. Edits for Mac (November 2026) ships a built-in automation server that speaks MCP, and Claude Code on the SAME Mac drives it through the `insta-edits` bridge. The agent sees every change live in the Edits window and finishes by hand there. Measured on Edits 456 and bridge 0.1.2; Edits updates weekly, so `shared/edits-quirks.md` is the living record.

**Read with this file:** `edits-tool-map.md` (the 274 tools by job and the argument shapes that work), `edits-catalogs.md` (every effect, filter, transition, animation, preset, caption style, music and sound-effect name), `edits-quirks.md` (what bites), `edits-grade-strategy.md` (the Adjust panel). The craft rules (hook, captions, zooms, music, graphics, final check…) are the same files as the Riverside engine: this file only says how Edits gets there.

## What this engine is, and is not

| | Riverside engine | Edits engine |
|---|---|---|
| Runs where | any Claude surface, cloud included | **Claude Code on the agent's Mac** (Apple silicon, macOS 15.1+). Cowork cloud tasks and claude.ai cannot reach it. |
| Cost | Grow plan or higher | **free** app, free bridge |
| Footage in | recorded or uploaded into Riverside | any file under `~/Movies` (Edits is sandboxed: Downloads and Desktop are refused) |
| Captions | karaoke, brand font, placed by us | 73 styles, accent colour, **no position or size control**, lower third by default |
| Zooms | zoomed scenes | transform keyframes (hard in / hard out) |
| Transitions, SFX | none | 51 transitions, a sound-effect library, text animations |
| Music | Riverside's licensed library, ducking off | royalty-free library (only `license.isRoyaltyFree: true` songs render through automation), **ducking on** |
| B-roll / stock | Riverside stock + own footage | own footage + stock we download (Pexels key optional); no stock search inside the server |
| Graphics | kit PNGs + native text | kit PNGs via `addOverlay`, native text with a pill, emoji/icon cards from our renderer |
| Grade | brightness / contrast / saturation + Kelvin | the full Adjust panel: exposure, clarity, highlights, shadows, contrast, brightness, whites, blacks, saturation, vibrance, white balance, HSL, wheels |
| Export | one 1080p render | one 1080×1920 (or 1920×1080) SDR export to `~/Movies` |
| Publish | Riverside posts on a yes | **never posts**: the agent shares from the Edits window, or the Short-Form System's posting tool takes the file |
| Proven live | long-form, reel, listing, repurpose | **reel (talking head)**. Long-form 16:9 works on the same tools but is not yet proven end to end; interview layouts and podcast export are not available. |

## Setup (once per Mac) — what `studio-setup` walks them through
1. Install Edits for Mac from Instagram's site, sign in, keep it OPEN, switch on Settings › Automation › Enable Automation Server.
2. `pip3 install --user insta-edits`, then the agent types the token themselves: `~/Library/Python/3.9/bin/insta-edits set-token` in a terminal, pasting ONCE (the prompt is hidden; a double paste is rejected). Never in chat.
3. `claude mcp add --scope user --transport stdio edits -- /usr/bin/python3 -m insta_edits serve`, then `insta-edits doctor` all ✓. Footage folder: `~/Movies/<something>`.
4. Config: `default_engine: "edits"` and an `edits` block (`bridge_installed`, `footage_dir`, `exports_dir`, `cards_dir`, `caption_style`, `music_db`, `preferred_music`, `pexels_key` optional). Brand block shared with Riverside.
A direct `claude mcp add --transport http` to the Edits endpoint leaves Claude on the 32 home-screen tools: always the bridge. The plugin's keychain route needs an interactive `/plugin configure` the desktop app's Code tab cannot run, so the pip + `set-token` route is the one.

## Session rules
- Edits must be open with a project loaded; `appState` says `home` or `editor`. The tool list is 32 at home and 274 in the editor.
- One `newProject` per video, named after it. `setProjectDynamicRange SDR` and `setCanvas` (9:16 @ 30 for a reel, 16:9 @ 30 for long-form) BEFORE importing. The export's frame rate follows the canvas.
- Every destructive step ends with `clearSelection` (and `dismissTool` after a panel). A stale selection makes imports fail "no commit".
- If any import answers "no commit" after an error, `closeProject` → `openProject` and carry on (`build_reel.py resume`).
- Check with rendered frames (`captureFrame`), never screenshots. The exported FILE is the truth for text size (`frameSheet(path)`).
- Checkpoint log as always: `~/realtor-brain/editor/jobs/ed-<projectId>.md`, one line per landed pass (`build_reel.py` writes it after every pass; the export line names the file). Log missing → read `elements`, `captions()` and the exports folder, say what you believe is done, get a one-word confirm, then `build_reel.py resume`.

## The reel line on Edits (`scripts/edits/build_reel.py` does all of it)
`plan` = import, transcript, pause map, proposed cuts, CTA cue, nothing destructive. Show the cuts; get the yes. `build` = every pass below, check frames, ONE export, file verification, hand-back. `resume` = music → graphics → check → export on the open project.

| Pass | Edits calls | Rule it serves |
|---|---|---|
| 0 Prep | `probeMedia`, `loudness`, `newProject`, `renameProject`, `setProjectDynamicRange SDR`, `setCanvas 9:16 30`, `addMedia`, `transcribeClip` | brief, 9:16 first |
| 1 Clean | `findPauses(minDuration 1.0, −45 dB)` → cuts LAST → FIRST with `splitAt` + `selectById` + `delete` (gap closes itself); lead-in to the first word − 0.15 s; tail to the last word + 0.45 s; `setSound(volumeDb +0.5, reduceNoise 50, enhanceVoice 30)` | clean-cut.md, hook.md, audio.md |
| 2 Captions | `generateCaptions(en, video)` → ONE `setCaptionStyle` (**Word Highlight Box** default) → `setCaptionHighlightColor(brand.caption.accent)` → read every caption, `editCaption` the agent's name, brokerage, city, and brand words (the model wrote "CLOD" for "Claude") | caption-style.md |
| 3 Energy | beats from the caption phrases (numbers, $, reveals, contrasts, questions); one per 12–20 s; 1.06 / 1.10 / 1.14 once; hold 2.5–5 s; four `setTransformKeyframe`s (hard in, hard out); a whoosh per zoom: `seek` → `addSoundEffect("24752205027742799")` → `setVolume 0.22`; 1.06 static on alternate cut pieces | effects-menu.md |
| 4 Grade | `applyAdjust` brightness 4 · contrast 12 · saturation 8 per piece, then the strategy in `edits-grade-strategy.md` for anything the frame measurement asks for | footage-look.md |
| 5 Music | royalty-free, FULL `audioAssetId`, `license.isRoyaltyFree` must be true; `setSound −26 dB` (library masters ≈ −14.6 LUFS), `setDucking(video, 0.5)`, `setFade(0.8, 1.5)`; placed again at its end when shorter; the audition recipe below when the agent wants a say | music.md |
| 6 Graphics | hook card ≤ 25 chars, top zone (y 0.12–0.14), 2.5 s: a rendered PNG (`render_card` → `addOverlay(x .5, y .5, scale 1)`, 3 s default, `trim right +0.5`) or native `addText` + `setEmphasis backgroundPill` + `setTextAnimation fligPop` + `setTextPosition(0.5, 0.12)`; CTA native text from the CTA line's first word to the last frame; one stat card on THE line; max 3 pieces | graphics-style.md, cta-pack.md |
| 7 Check + export | `captureFrame` on the hook, each zoom, a caption, the CTA, the last frame → look; `setExportSettings(SDR, 1080x1920, HD, nineBySixteen, High)` → `export(~/Movies/…)` → `exportStatus` → `probeMedia`, `loudness` (peak < −1 dBFS), `frameSheet` on the file | final-check.md, frame-qa.md |

Measured on a 96 s talking head: 23–53 s per export, about 4 minutes wall-clock for the whole line.

## The crafts, one by one (the section each craft skill opens)

**Direction, transcript read, section map.** `transcribeClip(id, en, background false, mergeSplitWords true)` gives words with timeline seconds; `findPauses`, `loudness`, `audioLevels` are free reads. The section map's times come from the caption phrases after the cut. Markers: `manageMarkers` is not in the Edits tool set; write the section times into the hand-back instead.

**Record coach.** Engine-neutral; add: film in 4K 30 fps vertical, land the file under `~/Movies`.

**Remove the fluff.** Pauses: `findPauses` → `splitAt` + delete, last → first. Fillers: Edits has no filler tool; cut by transcript words with `splitAt` only when the agent asks, never synthesised audio. Blooper hunt: a silence over 2.5 s followed by the same opening words in the transcript.

**Hook.** Trim the lead-in to the hook's first word; no reorder. The hook card line is the agent's own words.

**Rescue cut.** Same tools as the fluff pass; keep the best pass of every point by transcript; `duplicateProject` before a risky cut.

**Interview.** Not available: Edits has no speaker-aware layouts through the server. Say so and offer Riverside for interviews.

**Audio.** `setSound(id, volumeDb, reduceNoise 0–100, enhanceVoice 0–100)` per piece; enhance alone lifts ≈ 5 dB, so keep `volumeDb` near 0 and verify the export's peak with `loudness`. The ear test is the agent's.

**Colour and look.** `edits-grade-strategy.md`: measure the frame with `scripts/edits/frame_stats`, then `applyAdjust` in the panel's order. `applyFilter` / `applyLUT` only in cinematic packs; never `setColorGrade` raw units.

**Captions.** One style call for all captions; the accent colour explicitly; names fixed with `editCaption`; no per-word highlight (`setCaptionHighlights` is a no-op), no position or size tool: cards stay in the top zone so nothing collides.

**Music.** The level and licence rules above. Audition when the agent wants a say: `muteTrack(id)` the video clip and every sound effect (element ids), add the song at 0 dB, wait for `licensedMusicStatus` `isAvailable` + `windowComplete`, export 720p Low (≈ 11 s), `audioOnsets` / `audioLevels` / `loudness` on the file, delete the song, `unmuteTrack`. Silence in the file = not royalty-free: drop it. Name the chosen track in the hand-back and swap on the agent's word. Proven renderers: "Unplayed Guitar" (mellow guitar, 66 s), "Hypnotized (Instrumental)" (172 s). Titles are the only search key: mood words return nothing.

**B-roll and library.** Own footage first: files under `~/Movies` placed with `addOverlay(path, startSeconds, x .5, y .5, scale)` full-cover (scale to cover; a 16:9 clip on 9:16 needs scale ≈ 1.78 to fill, or the split-screen rule in layouts.md). Stock: Edits' stock panel is not reachable through the server; download from Pexels with the agent's key (`edits.pexels_key`) into `~/Movies/broll/` with "daytime bright" in every query, then place the same way. Max 3 on a reel, 2.5–5 s each, bright, never over the hook, face or CTA. Icons and emoji: `render_card <png> "💰" 220 "#FFFFFF" none … 1080 1920 <yFrac>` makes a transparent icon; place it in an UPPER CORNER (x 0.2 or 0.8, y 0.2 — never centred, that lands on the face) with a pop: keyframes scale 0.4 → 1.08 → 1.0 over 0.4 s, out the same way. One icon per spoken noun at most, three per reel.

**Graphics.** Hook, CTA, one stat card. Kit PNGs: `addOverlay` full-frame transparent, 3 s default, `trim right +N` to shorten; a negative trim does not extend an image, so for a long CTA use native text with `duration`. Text size: ≤ 25 chars → 26, ≤ 32 → 22; `applyTextPreset` needs `selectById` + `selectTool('textPresets')` first and overrides size.

**Energy.** The keyframe recipe above; never on every sentence; never two in a row at the same size; a size change on every editorial cut.

**Podcast.** Not available (no audio-only export). Offer Riverside.

**Long-form line on Edits** (not yet proven end to end: say so in one line and get the yes). `setCanvas('16:9', 30)` before import; the same clean cut; captions OFF (do not `generateCaptions`); emphasis pop-ups every 2–3 minutes as native pill cards in the lower third (y ≈ 0.78); zooms one per 45–75 s; bed −26 dB with ducking, no stingers; B-roll ~1 per 45–60 s via `addOverlay`; the section map's times go into the hand-back (no timeline markers); `duplicateProject` is the cut-only master when reels will be cut from it; export 1920×1080.

**Trailer on Edits** (not yet proven). `duplicateProject` the cut master; `splitAt` + delete to the 15–25 s span (hook, stake, tease); `generateCaptions` + the reel style; a closing native card with the CTA; the bed −26 dB; export 9:16, then `duplicateProject` again, `setCanvas('16:9')`, re-place the cards, export 16:9.

**Trailer, repurpose, batch.** Repurpose = one `newProject` per reel from the same source file: `build_reel.py build --start <s> --end <e> --beats …` builds each reel from its span (the script trims the import to the span before anything else). Batch = a folder (or an "anyone with the link" Drive folder: `curl -L "https://drive.google.com/uc?export=download&id=<id>&confirm=t"` into `~/Movies/batch/`) run one clip after another, 4–5 minutes each, each with its own hook and CTA from its transcript, one review draft per clip.

**Quality check.** The gates in `final-check.md` apply unchanged; the evidence on Edits is: blocker 1 `getSound` per piece + the file's `loudness` peak; 2 `getColor(id).grade`; 3 the captions re-read + the `ed-` log; 4 and 5 the first and last caption text; 6 the music elements (coverage, −26 dB, royalty-free); 7 `getTransformKeyframes` (zoom pairs) + whoosh elements; 8 overlay elements (count, no repeated path); 9 `getCanvas` + the log; 10 `captions()` (style set, accent set) + a viewed frame, position/width N/A; 11–16 the viewed frames from `captureFrame` and `frameSheet(exported file)`. Any blocker not fixable in one pass: stop and say which.

**Review and revise.** Diagnose on a frame or `audioLevels` first; the project is still open in Edits so a change is one call and one re-export; cap at two rounds; the agent finishes by hand in Edits, free.

**Publish.** Edits cannot post through the server. Deliver the file path; the agent shares from Edits' share sheet (Export → Share to Instagram), or the Short-Form System schedules the file through the posting tool. Never claim a post happened.

## Hand-back (plain language)
"Your reel is a review draft, take a look before you post. It's vertical, captions light up as you speak, six gentle zooms with a whoosh, a colour lift, a soft guitar bed under your voice, your hook card at the top, a card on the big number, and your CTA on the last stretch. Check the music sits right under your voice, nothing sits near your face when you move, and the hook lands. The project's open in Edits if you want to tweak anything by hand, free."
