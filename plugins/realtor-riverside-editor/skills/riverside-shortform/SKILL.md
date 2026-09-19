---
name: riverside-shortform
description: Make short-form vertical video directly in Riverside on the agent's own account — either recycle one long video into several clips (each its own edit, cloned and trimmed) or edit a standalone reel. Sets 9:16 first, face-centred; opens on the hook; cuts tight; Magic Audio; karaoke captions in the brand accent (big, below the face, inside the safe zones); up to 3 B-roll full-cover; gentle punch-ins; a music bed; a hook card + CTA; ONE 1080p export each; every pass diff-verified. The agent reviews and can have the clips published or scheduled from the same tool. Trigger on: "make a reel", "make this vertical", "make shorts/clips from this", "repurpose my video", "cut this up into clips", "turn my long video into shorts". ALSO handles RESUMING a stopped reel or a half-finished repurpose batch — "finish my video", "finish my clips", "pick up where we left off" — by reading the checkpoint log and rebuilding only the clips/passes that never landed. Usually reached through riverside-navigator.
---

# Edit short-form (Riverside)

You are the editor; Riverside renders; the agent approves. **Read up front (only these three):** the Brain (`identity/`), `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, and `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md` — then follow **Playbook B** in `${CLAUDE_PLUGIN_ROOT}/shared/riverside-playbooks.md` (**THE PASS PLANS: a reel is 4 passes**). **Open the other refs at the step that uses them:** captions `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md` · graphics `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` · grade + flattering people `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` · effects `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md` · CTA `${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md` · the 80/20 `${CLAUDE_PLUGIN_ROOT}/shared/cost-discipline.md` · video type `${CLAUDE_PLUGIN_ROOT}/shared/content-types.md` · music `${CLAUDE_PLUGIN_ROOT}/shared/music.md` · layouts `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md` · frames `${CLAUDE_PLUGIN_ROOT}/shared/frame-qa.md` — and ALWAYS run the final check (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`) before delivery.

## The always-done core (the 80% — never skip)

Every reel ALWAYS gets: **9:16, face centred**, a **clean cut** (fillers / dead air / bad takes), **open ON THE HOOK**, a **clean ending**, **Magic Audio (0.55; 0.85 phone)**, a **colour grade (bare-minimum)**, **karaoke captions** (brand-accent active word), **energy on key beats** (2–3 gentle punch-ins; swoosh only if available), a **music bed at -18 dB**, a **hook card**, the **CTA**, and **up to 3 B-roll**. That clean core is the whole job. Anything beyond it is the agent's manual 20% in the Riverside editor.

## Run it as 4 passes

**P1 CLEAN** (aspect 9:16 → FullScreen layout → the reviewed cuts → fillers → pauses 1000 → Magic Audio) → **P2 CAPTIONS** (one `set_captions`) → **P3 B-ROLL** (≤3, full-cover) → **P4 FINISH** (grade → punch-ins → music → hook card → CTA → logo). Everything else — moment-picking, scoring, the spelling check, compliance, frame-QA — is **FREE Claude work** between the passes. One export at the end.

## Two modes

- **Recycle** — pull the best clips out of an existing long video (one long → N shorts). Follow **The recycle batch process**.
- **Standalone** — edit a single short the agent recorded. Use **The recipe** directly.

## The recycle batch process (long → N shorts)

**STEP 0 — Pre-flight + scope (free).** Run `${CLAUDE_PLUGIN_ROOT}/shared/preflight-check.md` on the long recording (its working edit is created once); lock **N** (default **3**, cap **5** per session). Say it back in one sentence and get the yes: *"Got it — I'll pull 3 standalone reels out of your long video. Sound good?"* That yes is the gate for the batch; STEP 3's approval of the chosen spans covers the destructive trims on every clip.

**STEP 1 — One source edit.** Create (or find) the edit for the long recording ONCE; `read_aligned_transcript` ONCE (revision R0). The source edit is never cut — it's the master every clip is cloned from.

**STEP 2 — Scan + score candidates (free).** Every contiguous 20–60 s span, scored 0–2 on FIVE criteria: (1) self-contained, (2) strong hook line, (3) high-value or emotional, (4) clean payoff, (5) length-fit (30–45 s ideal). Keep ≤10, each with its opening and closing quote (those become the `boundary_range` anchors).

**STEP 3 — Pick the top N, distinct.** No overlaps, no same-topic repeats — vary the angle (one tip / one number / one story). Not N strong ones? Say so: *"Your video has 2 strong standalone moments, not 3 — want 2 great ones, or should I stretch a 3rd?"* Show the N as hook line + ~length; get a quick yes.

**STEP 4 — Per clip = its own edit.** `clone_edit(sourceEditId, title:"Clip N — <hook line>")` → on the clone: resolve the head (`time_range 0 → clip's first word`) and the tail (`clip's last word → end`) with intent `remove` → ONE `cut_time_ranges` with both. (The connector documents this exact clone-then-trim recipe; `create_edit_from_segments` is unavailable.) Read the clone's aligned transcript: it should now be just the clip.

**STEP 5 — Build clips SEQUENTIALLY, each to done, with a per-clip checkpoint.** One clip fully (the 4-pass recipe below on its clone) before the next — a stop leaves N−1 finished reels, never a pile of half-clips. After each: diff, frame-QA, log `clip-N <hook> · done · rev n` in the SOURCE edit's log (`rs-<sourceEditId>.md`) with the clone's `editId`.

**STEP 6 — Frame-QA each clip** (`final-check.md`) — captions below the face, nothing in the right ~12% rail or the top/bottom bars, opens on the hook, ends clean.

**STEP 7 — Deliver all N at once,** in **one message**, each labelled by its hook line, each with its edit link. Export each at 1080p on approval. Offer to publish/schedule the set (`riverside-publish`) — the Short-Form System's calendar decides the slots if it's installed.

## The recipe (the WHAT — it executes as the 4 passes above)

1. **Pick the moment** (free) — must stand alone, start with a hook, end on a payoff/CTA. 20–60 s, ideal 30–45 s.
2. **9:16 FIRST** (**pass 1**) — `batch update_aspect_ratio {ratio:"9:16"}` **before any overlay exists** (rejected afterwards) → `apply_smart_layout(style:"FullScreen")` → read the timeline: portrait canvas, head has headroom (small `update_scene_slot_settings` nudge if not; never crop the head).
3. **Cut hard + clean the audio** (**pass 1**) — the reviewed cuts via `resolve_transcript_selection` → `cut_time_ranges` (open on the hook, clean end, never the hook or the CTA) → `remove_fillers Cut` → `remove_pauses 1000` (tighter than long-form) → `set_magic_audio 0.55` (**0.85 phone — most realtors**) on every speaker track. **Before firing: show the planned cuts, get the yes** (hard gate) — and if the reel was recorded straight in Riverside with no file elsewhere, `clone_edit` once first: *"I saved a copy of your original first."* Diff after.
4. **Hook in the first ~1.5 s** — 3–5 words, a claim or a number. **Before writing ANY on-screen text** read `identity/compliance.md` — THREE states: (1) MISSING, (2) FILLED, (3) UNFILLED PLACEHOLDER (any `[bracketed]` token / template heading). **Treat (3) EXACTLY like (1):** withhold claim-bearing cards, plain spoken captions only, **never stamp a `[placeholder]`**, do NOT stop — deliver safely, nudge ONCE: *"I kept the wording neutral since your compliance disclaimer isn't set yet — say 'set up my compliance' to lock it for future videos."* Not legal advice. The hook CARD lands in **pass 4**: kit PNG via `insert_overlay`, or native boxed text moved to the **top edge above the hairline** (centre ≈ 12–14% down, inside the top safe margin) or timed over a B-roll moment (`graphics-style.md`, `layouts.md`).
5. **Captions on, always — NO exceptions** (**pass 2**) — a reel without captions is an automatic FAIL. ONE `set_captions`: karaoke, `position.y ≈ 0.84` (**below the face — Riverside's default position is NOT ours; set it**), fontSize ~62, outline, white, `secondaryColor` = the brand accent set EXPLICITLY (never a preset's green/purple), `widthRatio 0.8`, centred (`caption-style.md`). Spelling checked on the transcript first; the agent fixes a misspelled name in Riverside's transcript panel before this pass.
6. **B-roll** (**pass 3**) — `riverside-broll`, on the words, **full-cover scaled, never over the hook/face/CTA, never the same clip twice**. **HARD CAP: MAXIMUM 3.** Horizontal clip that dies when cropped → split-screen layout (`layouts.md`).
   - **Graphics kept MINIMAL** (`graphics-style.md`): a **hook card + a CTA card** (2, maybe 3 total). Karaoke carries the keyword emphasis — no separate keyword cards. Kit PNGs preferred (the only way to a brand-coloured panel in Riverside); native boxed text otherwise.
7. **Energy (mandatory minimum — KEY beats)** (**pass 4**): 2–3 punch-in keyframe pairs on the speaker track (~1.06×, 2.5 s) + swoosh only if `sfx.swoosh_media_id` exists. No transitions/SFX exist on this connector — don't claim them. A flat, static reel is a fail; an effect on every cut is the opposite fail.
8. **Music** (**pass 4**) — `get_stock_music` underscore, Low → `insert_audio` at 0, `-18 dB`, fades. After the cuts, so it spans the final length.
9. **End with the CTA** (**pass 4**) — the CTA card on the closing line, above the caption block or over closing B-roll (`cta-pack.md`). Then `apply_brand` if the kit has a logo (optional on reels).
10. **ONE export at 1080p** (renders 1080×1920) → **final check on the export** via the highest reachable rung (`frame-qa.md`) — audio confirmed on, open/end, captions/cards clear of the face and the rail, framing; fix + re-export only on a blocker; hand back the review draft; offer to publish.

Target 20–60 s (ideal 30–45 s). Pay off the hook.

## Checkpoint log (shared convention — resume safely)

`~/realtor-brain/editor/jobs/rs-<editId>.md`, ONE line per landed pass: `<pass name> · done · rev <revision>`. In a recycle batch, per-clip lines live in the SOURCE edit's log with each clone's `editId`, so a resume rebuilds only the clips that never finished.

At the START (and on any resume), check the log. Exists → one plain line, run ONLY the unlogged passes/clips. Missing → `compare_revisions("1", head)` + a timeline read on each clone tells you the truth; confirm in a word; continue. `CONFLICT` → pause and ask (the agent's in the editor). Still processing → wait.

## Discipline

9:16 + cuts + captions + Magic Audio are the reliable core — lead with those. Everything past the hook card, CTA, and ≤3 B-roll is the agent's 20%. No AI B-roll, no eye-correction, no background tricks. Several clips = several clones of ONE source, sequential, each diff-verified. See `${CLAUDE_PLUGIN_ROOT}/shared/cost-discipline.md`.
