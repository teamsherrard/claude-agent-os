# Descript playbooks (tested recipes)

Descript does the editing; Claude issues the instructions and verifies. These use Descript's **real MCP tools**.

## The tools you actually call

- `list_projects` / `get_project` — find and inspect the agent's projects (and their composition IDs).
- `import_media` — bring in the video and B-roll. **Import by URL** (a direct link, **Google Drive**, or **Dropbox**) whenever possible. Returns a `job_id` + `project_url`.
- `prompt_project_agent` — the natural-language editor (Underlord). **One well-formed PASS per call** — a pass batches every additive change that belongs together (see THE PASS PLANS below); only destructive cut passes stay separate and reviewed. Never split one pass's work into many tiny calls — every call costs credits and a query. Pass `project_id` (+ optional `composition_id`).
- `publish_project` — render/export → returns `share_url` + `download_url` (480p–4K).
- `wait_for_job` — call after EVERY `import_media` / `prompt_project_agent` / `publish_project` (they run async and return a `job_id`). Always show the agent the `project_url`.

## Getting the video IN — read this first (it's where edits fail)

**Get the video to Descript without uploading it through the sandbox.** In order of preference:

1. **Is it already in Descript?** Best of all. If the agent recorded in Descript or dropped the file into the Descript app, don't import anything — use `list_projects` / `get_project` to find it and edit that project. Just ask: *"Is the video already in your Descript?"*
2. **Import by URL** — a **Google Drive** / Dropbox / direct link, fetched server-side with **no sandbox upload**. Works for normal videos (reels, typical YouTube files up to ~1–2 GB). For Drive, pass the direct-download form `https://drive.usercontent.google.com/download?id=FILE_ID&export=download&confirm=t` (not the `/view` page), shared "anyone with the link." Same for Pexels/Pixabay B-roll. For stock-library results, import the DIRECT asset/download URL from the API response (e.g. Pexels `video_files[].link`), NOT the human-facing web page URL — the page URL fails import_media.
   - **Very large files (multi-GB 4K, ~10 GB+) won't import by link** — Google serves a "can't virus-scan" page instead of the file (you'll see *"returned an HTML page"*). Fix: have the agent **drag it into the Descript desktop app** (handles big local files), **export a 1080p copy first** (~2 GB, identical on YouTube), or host it on **Dropbox** (`?dl=1`).
3. **Never PUT a big local file's bytes from the sandbox** — it exceeds the shell time limit and the process dies between turns (the #1 live-test failure). **Compressing first doesn't fix it** — it still has to upload. Put the file in Drive (or drop it into Descript) instead.

After any import, `wait_for_job`; Descript auto-transcribes on import (don't re-transcribe).

## General habits (always)

- Work on the **original** composition in place — never create duplicate copies (they clutter the agent's Descript and confuse them about which version is which). Descript's own undo / version history is the safety net. Seed proper nouns first; **run THE PASS PLANS — the fewest well-formed passes** — and verify each pass landed before the next (catches overreach).
- **Clean starts & ends — OPEN ON THE HOOK.** Cut the getting-settled / throat-clearing intro (adjusting in the chair, rubbing hands, "okay let's go", "let's do this", throat-clears) so the first frame is the first real line of content. Trim the camera-off reach / dead air at the end too — but NEVER cut into the hook itself or the CTA. The end lands the instant the last word finishes — and **never end mid-sentence**; end on a complete thought, then an outro / CTA.
- **Studio Sound — clean the audio (its own step) — and DON'T under-do it.** The sweet spot for a typical realtor setup (a decent mic in a normal, untreated room) is **~55%** — go too low (~30%) and a fishbowl / room echo survives (a real failure we hit). **Phone audio or echoey rooms → higher (~80–90%, 100% for bad rooms).** Only drop to ~40% or off if the audio is genuinely pristine (a pro mic in a treated space) AND high intensity is visibly thinning/brightening the voice. **Default to ~55% and adjust by ear.** If the agent has a separate high-quality mic recording, sync THAT in. Render-time effect — confirm on *playback*, not the scrub preview. Honest ceiling: a bad mic + reverberant room has limits → suggest a cheap lav mic at the source.
- **Verify each step landed** via the job result (`status: success`, `project_changed: true`) — not the project's `updated_at` (which doesn't move for in-clip edits like captions). Have the agent eyeball visible changes.
- **NEVER enable Background Removal / Green Screen on a normal talking-head.** It strips the room behind the speaker and renders a black void (the inspector shows Background: "None"). Only for an intentional green-screen shoot. It can get toggled on accidentally when you ask for side-by-side / picture-in-picture layouts — so build a "graphic beside the speaker" WITHOUT background removal, and after any layout change confirm his real background still fills the frame.
- **Publishing is gated** — never `publish_project` without the agent's yes (keep the connector's Publish on "needs approval").
- **"Unable to reach Descript" is usually a timeout, not a failure** — check with `list_projects` / `get_project` before retrying. Never blind-retry a paid job; stop after 1–2 failures and ask.

## THE PASS PLANS — fewest paid passes (the credit + speed lever)

Every `prompt_project_agent` call costs credits and a query, so the cheap, fast edit is the one with the **fewest, best-formed passes**. Proof from live edits: one batched clean pass (cuts + Studio Sound + reframe + grade in a single call) cost ~6 credits, while a fragmented cards-only session cost ~78. **Do ALL the free prep first** — reading/scoring the transcript, identifying the hook line, the proper-noun glossary, picking B-roll moments, the compliance read, chapters/title/description, frame-QA. Free work costs ZERO Descript credits; paid calls are only for changes to the video.

**SHORT-FORM reel — 4 paid passes:**
1. **CLEAN** — 9:16 composition + reframe (face centred) + open on the pre-identified hook + cut filler/dead-air/bad-takes + clean end + Studio Sound ~55% (80–90% phone/echoey). One instruction; review the cut after.
2. **CAPTIONS** — glossary corrections first, then karaoke ON (brand style, ~90pt+, below the face, inside the safe zones).
3. **B-ROLL** — `import_media` the ≤3 chosen clips, then ONE placement pass (full-cover, on the exact words, never over hook/face/CTA).
4. **FINISH** — bare-minimum grade + 2–3 punch-ins (each with a swoosh) + smooth transitions + 1–2 SFX + ducked music + hook card + CTA card (rounded brand panels, off the face, safe zones — spell out every position in the one instruction).

**LONG-FORM — ≤6 paid passes:** ① open-on-hook + filler words (verify the first 40s) · ② dead-air + bad takes (one reviewed destructive pass — hard gate; snapshot first if it's a Descript-only original) · ③ glossary corrections + Studio Sound ~55% + bare-min grade (one non-destructive call) · ④ B-roll placement (imports first) · ⑤ energy (punch-ins w/ swoosh + smooth transitions + SFX + contextual animations, key beats only) · ⑥ cards + emphasis pop-ups (hook + CTA + one every ~2–3 min + optional 1 stat — positions specified). Chapters, title + description, and frame-QA are FREE Claude work.

**LISTING reel — ≈4 passes** (the short-form plan; the address/price cards join the FINISH pass). A long YouTube tour follows the long-form plan (the room cutaways are its B-roll pass).

**ONE RENDER:** `publish_project` once (1080p, on approval) and use that single export for BOTH the frame-QA and the agent's review link. Re-render only if a fix was actually needed.

## Query budget & batching (long-form especially)

Descript enforces a hard per-session ceiling — **"Query count exceeded limit of 100."** A heavy long-form (lots of `prompt_project_agent` calls) can hit it and die **mid-edit, with credits already spent.** To stay under it:

- Keep the **early, sensitive passes one-at-a-time** (filler removal, dead-air, bad-takes — you review each before the next).
- **BATCH the later, additive passes** into single instructions: e.g. one pass for "colour grade + punch-ins + transitions + SFX," one pass for "all the cards + emphasis pop-ups." Target THE PASS PLANS above: **short-form ≈ 4 paid calls, long-form ≤ 6, listing reel ≈ 4** — not 30.
- If you see **"Query count exceeded limit of 100"**: STOP — do NOT blind-retry (it wastes a paid call). The work so far is saved in the project; continue the remaining passes in a fresh continuation, picking up where you left off (use `get_project` to see current state first).

### Checkpoint log — so a stopped edit resumes cleanly (no double-charging)

Keep a tiny per-project log at **`~/realtor-brain/editor/jobs/<project-id>.md`**. **Append ONE line per landed pass**, exactly:

```
<pass name> · done · <job_id>
```

(e.g. `studio-sound · done · job_8f2a` / `colour-grade+motion · done · job_a13c` / `cards · done · job_77de`). Write the line only AFTER `wait_for_job` confirms `status: success`.

**At the START of any long-form or listing edit, check for this log first.**
- If it exists, say ONE plain line — e.g. *"Picking up where we left off — audio and first cutaways are done, finishing the b-roll and cards now"* — then run **ONLY the passes not already logged**.
- **NEVER re-run a logged paid pass.** Re-running grade or Studio Sound double-applies it (over-saturated / over-processed audio) AND wastes credits. The log is the source of truth for what's already done.

### Credits / quota exhausted (named failure mode)

On ANY signal that the agent's Descript is out of edit credits / hit a plan limit / quota exhausted (distinct from the 100-query session ceiling above) — **do NOT retry.** Say, in plain words:

> "Your Descript is out of edit credits this cycle — your work is saved; add credits or wait for renewal, then say 'finish my video' and I'll pick up exactly where we stopped."

When they come back, read the checkpoint log and run only the unlogged passes.

## Playbook A — long-form cleanup (≤6 paid passes)

1. Find/create the project; `import_media` the video **by URL**; `wait_for_job` (auto-transcribes).
2. **FREE PREP (zero credits):** read the transcript and **IDENTIFY the hook line** (the first sentence that delivers a claim/value — confirm it so the open-on-hook cut can't clip into real content; applies to short-form and listing too); build the **proper-noun glossary** (name/brokerage/city from the Brain); note the **section changes** (they become the chapter timestamps + the emphasis-pop-up spots).
3. **PASS ① — open on the hook + filler words:** cut everything before the confirmed hook line (the settling-in / "let's go" / throat-clearing intro), then remove filler words (conservative — ums/uhs, leave natural speech). Verify the first 40s.
4. **PASS ② — dead air + bad takes (one reviewed destructive pass):** silences > ~1.5s (avoid harsh cuts) + false starts/bad takes — **review the proposed cuts (hard gate)**, restore good bits. Snapshot first if the project lives only in Descript.
5. **PASS ③ — glossary + Studio Sound + grade (one non-destructive call):** correct the glossary spellings; **Studio Sound ~55%** default (**~80–90%** phone/echoey, 100% bad rooms — ~30% leaves a fishbowl echo; render-time effect, judge on playback); **bare-minimum colour grade** (never over-saturated).
6. **PASS ④ — B-roll:** `editor-broll` sources + imports (**curated, never reused**, ~1 per 1.5–2 min), then ONE placement pass on the exact words. Horizontal b-roll on a vertical → **split-screen, never over-zoomed** (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`).
7. **PASS ⑤ — energy (KEY beats, not every scene):** a couple of **zoom-in/out punch-ins** on key lines (each with a **swoosh SFX**), **smooth transitions** at scene changes, **at least a couple of SFX**, contextual animations matched to the words (price drop → down arrow; "tight" → a squeeze). Minimal ≠ bare (`${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`).
8. **PASS ⑥ — cards + emphasis pop-ups (every position in the instruction):** a **hook card + a CTA card** on rounded brand panels + an **emphasis pop-up every ~2–3 min** (a key phrase from the transcript — a ~10-min video ≈ 3–5 pop-ups) + optionally ONE stat card — all **OFF THE FACE**, in the safe zones (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`). **No word-by-word karaoke on long-form** (YouTube auto-captions cover accessibility); full captioning only if asked.
9. **FREE:** chapters (00:00-format timestamps for the description) + title/description + frame-QA; then `publish_project` (on approval) → **ONE render** used for the QA and the review link, handed over with the title/description.

## Playbook B — short-form / pull shorts

Two modes: a **standalone reel** (one short → steps 4–5 below) and the **repurpose batch** (one long video → N clips). Standalone is the simple path. The repurpose batch is the careful one — follow it in order so you stay under the query ceiling and never double-spend credits.

### B0 — Repurpose batch (long → N clips)

1. **Scope & confirm N.** Ask how many clips they want (**default 3, cap 5** — more is the agent's manual 20%). Confirm the one number before doing anything paid.
2. **ONE shared import + transcribe.** Import the long video by URL once; `wait_for_job` (auto-transcribes). All clips come from this single project — never re-import per clip.
3. **SCORE candidate spans (read-only, on the transcript — no paid calls).** Skim the transcript and rate each candidate span **0–2 on each of 5 criteria**: (a) self-contained (makes sense with no setup), (b) has a hook line, (c) high-value or emotional, (d) clean payoff, (e) length-fit (~20–60s, ideal 30–45s). This is pure reading — it spends NO Descript queries.
4. **PICK the top N distinct spans.** Reject overlapping spans and same-topic repeats — each clip must stand on its own and cover a different idea. **If you can't find N strong distinct spans, say so plainly** (e.g. *"This video really only has 2 reel-worthy moments — want those 2, or should I stretch for a weaker third?"*) rather than forcing filler.
5. **BATCH the budget.** Plan **~4–5 `prompt_project_agent` calls per clip** (the 4-pass standalone plan; the B-roll pass only where used). **N=3 ≈ 13–17 calls** + the one shared import — comfortably under the hard **100-query ceiling**. If the running total nears **~80**, STOP and finish the rest in a fresh session (the checkpoint log makes this clean) — don't risk dying mid-clip with credits spent.
6. **BUILD clips SEQUENTIALLY, each to done, with per-clip checkpoints.** Use the **identical 4-pass recipe below for every clip** so they're consistent. Log each landed clip to the checkpoint log (`<clip-N hook> · done · <job_id>`) before starting the next — so a stop/resume picks up at the right clip and never rebuilds a finished one.
7. **FRAME-QA each clip** before moving on (safe zones, face framing, captions not clipped — see the safe-zone rule in step 4).
8. **DELIVER all N at once, labelled by hook line** (e.g. *"Clip 1 — 'The #1 mistake first-time buyers make'; Clip 2 — …"*) so the agent can tell them apart at a glance. `publish_project` the set on approval.

### Standalone reel — 4 paid passes (also the per-clip recipe used in B0 step 6)

1. Find/import as above (by URL).
2. **FREE PREP:** pick the moment (hook → idea → payoff/CTA), identify the hook line, build the glossary, read compliance.
3. **PASS 1 — CLEAN:** make the 9:16 composition, reframe face-centred, cut hard (open on the hook, zero dead air, clean end — never cut the hook or the CTA), Studio Sound ~55% (80–90% phone/echoey). One instruction; review the cut.
4. **PASS 2 — CAPTIONS:** glossary corrections, then karaoke ON (brand style, big ~90pt+, below the face, **inside the vertical safe zones — out of the right ~12% icon rail and clear of the top/bottom bars**).
5. **PASS 3 — B-ROLL:** import the ≤3 chosen clips, then ONE placement pass (**MAXIMUM 3, never reused, never over the hook/face/CTA** — more is the agent's manual 20%).
6. **PASS 4 — FINISH:** bare-min grade + **energy on KEY beats — a couple of zoom-in/out punch-ins (each with a swoosh SFX), smooth transitions, a couple of SFX** + ducked music + **a hook card + a CTA card (2, maybe 3 cards total), each on a rounded brand panel and OFF THE FACE** (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`; the karaoke captions already carry the keyword emphasis, so no separate keyword-pop cards).
7. Frame-QA (free), then `publish_project` on approval — **ONE render** for the QA + the review link.

## Playbook C — build from a prompt (optional)

`prompt_project_agent` with `project_name` can assemble a project from a script (AI voice + stock). Label AI-voiced drafts; encourage the agent to record their own voice. Not a default for v1.
