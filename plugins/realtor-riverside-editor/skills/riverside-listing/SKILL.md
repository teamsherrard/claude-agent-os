---
name: riverside-listing
description: Edit a property / home / listing tour video directly in Riverside on the agent's own account. Listing tours are special — the B-roll must be of THE ACTUAL PROPERTY (the agent's own room clips, drone shots, or the listing photos as Ken-Burns motion stills), never generic stock, which would misrepresent the home and is a compliance risk. This skill gathers whatever footage the agent has (a Google Drive folder, files already in Riverside's media panel, uploads for this video, or the listing photos), matches each clip to the right moment (the kitchen clip on the kitchen line, the drone on the address reveal), handles all / some / none, and adds the address, price, and CTA cards — compliance-checked. Trigger on: "edit my listing video", "edit my home tour", "make a listing tour", "edit my property video", "I have a walkthrough of a home". ALSO handles RESUMING a stopped listing edit — "finish my video", "finish my tour", "pick up where we left off" — by reading the checkpoint log and running only the passes that never landed. Usually reached through riverside-navigator.
---

# Edit a listing / home tour (Riverside)

A listing tour is *about a specific property*, so its footage rules differ: property moments need property footage — never generic stock for the home. **Read up front (only these):** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md` (the footage branches), and `identity/compliance.md` (price/claims, fair housing). **Open the rest at the step that uses them:** grade `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` · info cards `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` · layouts `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md` · captions `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md` · tool shapes `${CLAUDE_PLUGIN_ROOT}/shared/riverside-playbooks.md` · frames `${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md` · final check `${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`. **Pass count:** a short listing reel runs as **≈4 passes** (the short-form PASS PLAN; the address/price cards join FINISH); a long YouTube tour follows the **long-form ≤6-pass plan** (the room cutaways are its B-roll pass). **Before you write ANY on-screen text — address/title card, price card, feature cards, the CTA, captions, any pop-up — re-read `identity/compliance.md`**: no banned claims (no "best deal", no guaranteed-value language), the required brokerage disclaimer + license # where the Brain says, price exactly as listed, fair-housing-safe (describe the property and its features, never who "should" live there). **THREE states:** (1) MISSING, (2) FILLED, (3) UNFILLED PLACEHOLDER (any `[bracketed]` token / template heading). **Treat (3) EXACTLY like MISSING:** withhold claim-bearing cards (including the disclaimer card), plain spoken captions, **NEVER stamp a `[placeholder]` disclaimer onto the listing**, do NOT stop — deliver safely, nudge ONCE: *"I left the brokerage disclaimer off since your compliance isn't set yet — say 'set up my compliance' to lock it for your listings."* Not legal advice. Follow the 80/20 (`${CLAUDE_PLUGIN_ROOT}/shared/cost-discipline.md`).

## The always-done core (the 80% — never skip)

Every listing video ALWAYS gets: a **clean cut**, **open ON THE HOOK**, a **clean ending**, **Magic Audio (0.55; 0.85 phone — most tours are shot on phones)**, a **bare-minimum grade**, the property B-roll matched room-to-room (capped — below), **energy on key beats** (a couple of punch-ins), the brand info cards (minimal), and the closing CTA. **SHORT social reel:** also **9:16 first** + **karaoke captions** (mandatory — watched on mute). **LONG YouTube tour:** 16:9, **no karaoke** — the info cards plus an occasional emphasis pop-up carry the text. Beyond this is the agent's manual 20%.

## Step 0 — Pre-flight (free — before changing anything)

`${CLAUDE_PLUGIN_ROOT}/shared/preflight-check.md`: find the recording (ready, not uploading), make the working edit, read the transcript free, report in one paragraph — length, duplicate takes / dead air, whether the hook lands, **time to finish** — get the go-ahead. Check the checkpoint log (`rs-<editId>.md`) first; resume if it exists.

## Step 1 — Footage check (one simple question)

*"Do you have footage of the home — clips in your Riverside media panel, files to upload, a Google Drive folder, or just the listing photos?"* Then gather it:
- **Already in Riverside** → `media_list_media(productionId, search:"kitchen")` etc. Best case, zero upload.
- **Uploads / Drive** → download locally → media upload (≤500 MB each; trim long drone clips first) → note the media ids. **Google Drive prerequisite:** confirm the Drive connector is on before browsing; if not, don't dead-end — *"To pull from your Drive folder I need the Google Drive connector on — Settings → Connectors — or drop the clips into your Riverside media panel and I'll grab them there."*
- **Listing photos** → JPG/PNG uploads → Ken-Burns stills.
Tag each clip (kitchen, backyard, drone, exterior…).

**Also capture (required):** the **exact street address** and the **community / neighbourhood name**. They go on the address card exactly as written. Check the Riverside transcript for how it heard them; if wrong, the agent corrects the transcript in Riverside before captions (there's no correction tool on the connector). A misspelled address on a client's reel is an embarrassing, noticed error.

## Step 2 — Clean it up first

**Before the FIRST destructive pass, protect the original:** if the tour was recorded straight into Riverside (no file anywhere else), `clone_edit` once — *"I saved a copy of your original before I start cutting."* Uploaded files ARE the backup — no clone needed. **Reviewing the proposed cuts before applying them is a HARD GATE** — the pre-flight paragraph is where they see it. Then: reel → `update_aspect_ratio 9:16` + `apply_smart_layout FullScreen` FIRST; open ON THE HOOK (`resolve_transcript_selection` → `cut_time_ranges`), `remove_fillers Cut`, `remove_pauses` (1000 reel / 1500 tour), `set_magic_audio` **0.85 for phone audio**, 0.55 for a decent mic; `set_color_correction` bare-minimum (`footage-look.md`). Diff; log.

## Step 3 — Structure the tour

Intro / exterior (drone or hero shot + address) → room by room → outdoor / yard → neighbourhood (optional) → CTA (book a showing). Build the cut from the agent's narration.

## Step 4 — Match footage to the moment

Kitchen clip on the kitchen line, backyard on the yard mention, drone over the intro and the address reveal. One clip per spot; don't reuse. Each placed with `insert_overlay` then **scaled to cover** (or Ken-Burns 1.00→1.08 for a still). **Short listing reel: hard cap MAXIMUM 3 clips**; a long tour carries the room-by-room footage (exempt from the per-minute scale; no repeats). Horizontal b-roll on a vertical reel → **split-screen, never over-zoomed** (`layouts.md`).

**Long YouTube home tour — batching:** a room-by-room tour stacks up placements. Group them: one batch for all room cutaways (+ their scale ops), one for all cards/pop-ups, one for grade + punch-ins. Diff after each; log each. There's no query ceiling here, but there IS optimistic locking — one revision per batch, read between them.

## Step 5 — Has all / some / none

- **Has it all:** their clips, matched room to room.
- **Has some:** own clips where they exist; fill gaps with the **listing photos** (Ken-Burns) for that room; generic stock only for non-property lines.
- **Has none:** do **not** fake the property with stock. Listing photos as stills; or ask for a few uploads; or a clean talking-head with **address / price / beds-baths / feature** cards. Be honest about the limit.

## Step 6 — Brand cards, captions, deliver

Cards kept minimal (`graphics-style.md`): an **address/title card**, a **price card**, and the **closing CTA** — beds/baths and features ride in the captions or one small card. Kit PNGs when registered; otherwise native boxed text moved into the format zone. **PLACEMENT depends on the format:** a **vertical listing reel** → the top edge above the hairline, or over property B-roll; a **long 16:9 tour** → the **LOWER THIRD (~75–80% down)**. Best in either: over the property B-roll, where there's no face. Karaoke captions on a social reel are **mandatory** (big, y≈0.84, brand accent, `caption-style.md`); a long tour gets none. End on the book-a-showing CTA. `apply_brand` for the logo if the kit has one. **ONE export at 1080p, then the final check on the export** (`final-check.md`, via `frame-qa.md`) — fix + re-export any blocker — then hand over a review draft with the title/description including the address. Offer to publish (`riverside-publish`) — Listing Launch's schedule decides the slot if that plugin is installed. Deliver once.

## Resuming a half-done edit (checkpoint log)

- `~/realtor-brain/editor/jobs/rs-<editId>.md`, ONE line per landed pass: `<pass name> · done · rev <revision>` (e.g. `room-cutaways · done · rev 9`).
- **At the START, check for it.** Exists → ONE plain line, run ONLY the unlogged passes. **Never re-run a logged pass.** Missing → `compare_revisions("1", head)` + a timeline read tell the truth; confirm in a word; continue.
- **`CONFLICT`** → the agent's in the editor: pause, ask, resume on their word. **Still processing** → wait; say so.
