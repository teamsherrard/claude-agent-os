# Descript playbooks (tested recipes)

Descript does the editing; Claude issues the instructions and verifies. These use Descript's **real MCP tools**.

## The tools you actually call

- `list_projects` / `get_project` — find and inspect the agent's projects (and their composition IDs).
- `import_media` — bring in the video and B-roll. **Import by URL** (a direct link, **Google Drive**, or **Dropbox**) whenever possible. Returns a `job_id` + `project_url`.
- `prompt_project_agent` — the natural-language editor (Underlord). **One clear instruction per call.** Pass `project_id` (+ optional `composition_id`).
- `publish_project` — render/export → returns `share_url` + `download_url` (480p–4K).
- `wait_for_job` — call after EVERY `import_media` / `prompt_project_agent` / `publish_project` (they run async and return a `job_id`). Always show the agent the `project_url`.

## Getting the video IN — read this first (it's where edits fail)

**Get the video to Descript without uploading it through the sandbox.** In order of preference:

1. **Is it already in Descript?** Best of all. If the agent recorded in Descript or dropped the file into the Descript app, don't import anything — use `list_projects` / `get_project` to find it and edit that project. Just ask: *"Is the video already in your Descript?"*
2. **Import by URL** — a **Google Drive** / Dropbox / direct link, fetched server-side with **no sandbox upload**. Works for normal videos (reels, typical YouTube files up to ~1–2 GB). For Drive, pass the direct-download form `https://drive.usercontent.google.com/download?id=FILE_ID&export=download&confirm=t` (not the `/view` page), shared "anyone with the link." Same for Pexels/Pixabay B-roll.
   - **Very large files (multi-GB 4K, ~10 GB+) won't import by link** — Google serves a "can't virus-scan" page instead of the file (you'll see *"returned an HTML page"*). Fix: have the agent **drag it into the Descript desktop app** (handles big local files), **export a 1080p copy first** (~2 GB, identical on YouTube), or host it on **Dropbox** (`?dl=1`).
3. **Never PUT a big local file's bytes from the sandbox** — it exceeds the shell time limit and the process dies between turns (the #1 live-test failure). **Compressing first doesn't fix it** — it still has to upload. Put the file in Drive (or drop it into Descript) instead.

After any import, `wait_for_job`; Descript auto-transcribes on import (don't re-transcribe).

## General habits (always)

- Work on the **original** composition in place — never create duplicate copies (they clutter the agent's Descript and confuse them about which version is which). Descript's own undo / version history is the safety net. Seed proper nouns first; **one `prompt_project_agent` instruction at a time**, verify after each (catches overreach).
- **Clean starts & ends — OPEN ON THE HOOK.** Cut the getting-settled / throat-clearing intro (adjusting in the chair, rubbing hands, "okay let's go", "let's do this", throat-clears) so the first frame is the first real line of content. Trim the camera-off reach / dead air at the end too — but NEVER cut into the hook itself or the CTA. The end lands the instant the last word finishes — and **never end mid-sentence**; end on a complete thought, then an outro / CTA.
- **Studio Sound — clean the audio (its own step) — and DON'T under-do it.** The sweet spot for a typical realtor setup (a decent mic in a normal, untreated room) is **~55%** — go too low (~30%) and a fishbowl / room echo survives (a real failure we hit). **Phone audio or echoey rooms → higher (~80–90%, 100% for bad rooms).** Only drop to ~40% or off if the audio is genuinely pristine (a pro mic in a treated space) AND high intensity is visibly thinning/brightening the voice. **Default to ~55% and adjust by ear.** If the agent has a separate high-quality mic recording, sync THAT in. Render-time effect — confirm on *playback*, not the scrub preview. Honest ceiling: a bad mic + reverberant room has limits → suggest a cheap lav mic at the source.
- **Verify each step landed** via the job result (`status: success`, `project_changed: true`) — not the project's `updated_at` (which doesn't move for in-clip edits like captions). Have the agent eyeball visible changes.
- **NEVER enable Background Removal / Green Screen on a normal talking-head.** It strips the room behind the speaker and renders a black void (the inspector shows Background: "None"). Only for an intentional green-screen shoot. It can get toggled on accidentally when you ask for side-by-side / picture-in-picture layouts — so build a "graphic beside the speaker" WITHOUT background removal, and after any layout change confirm his real background still fills the frame.
- **Publishing is gated** — never `publish_project` without the agent's yes (keep the connector's Publish on "needs approval").
- **"Unable to reach Descript" is usually a timeout, not a failure** — check with `list_projects` / `get_project` before retrying. Never blind-retry a paid job; stop after 1–2 failures and ask.

## Playbook A — long-form cleanup

1. Find/create the project; `import_media` the video **by URL**; `wait_for_job` (auto-transcribes).
2. `prompt_project_agent`: **open on the hook** (cut the settling-in / "let's go" / throat-clearing intro so it starts on the first real line), then remove filler words (conservative). Verify first 40s.
3. Remove silences > ~1.5s (avoid harsh cuts).
4. Cut false starts / bad takes — review before applying; restore good bits.
5. **Studio Sound — ALWAYS, its own step.** Default **~55%** (the sweet spot for a decent mic in a normal room — ~30% leaves a fishbowl echo); **~80–90% for phone audio / echoey rooms** (100% for bad rooms); only lighter if the audio is already pristine. Mandatory on every video; confirm it's on (render-time effect — judge on playback, not the scrub preview).
6. **Colour grade (always — bare minimum, never over-saturated)** + B-roll (via `editor-broll`, on the words — **curated on long-form, never reused**) + Descript's **motion** layer (**MANDATORY energy — every video, on KEY beats, not every scene**): a couple of **zoom-in/out punch-ins** on key lines (each with a **swoosh SFX**), **smooth transitions** at scene changes, **at least a couple of SFX**, contextual animations matched to the words (price drop → down arrow; "tight" → a squeeze), chapters. Horizontal b-roll on a vertical reel → **split-screen, never over-zoomed** (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`). Minimal ≠ bare (`${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md`). **Graphics & on-screen text are done natively in Descript and OFF THE FACE — a hook card + a CTA card on a rounded brand panel (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`), plus an emphasis pop-up every ~2–3 min (a key phrase from the transcript) since long-form has NO word-by-word karaoke — a ~10-min video ≈ 3–5 pop-ups; optionally one stat card on a key figure. If the agent wants more, they add it by hand (free).** No word-by-word karaoke captions by default (YouTube auto-captions cover accessibility); full captioning only if asked.
7. `publish_project` (on approval) → share + download URL + a title/description.

## Playbook B — short-form / pull shorts

1. Find/import as above (by URL).
2. `prompt_project_agent`: pick stand-alone moments (hook → idea → payoff/CTA); make a 9:16 composition per clip.
3. Reframe (face centred), cut hard, hook in first ~1.5s.
4. Karaoke captions on (brand style, big ~90pt+, below the face); B-roll on the words (**MAXIMUM 3 clips, never reused, never over the face** — more is the agent's manual 20%); **MANDATORY energy on KEY beats — a couple of zoom-in/out punch-ins (each with a swoosh SFX), smooth transitions at scene changes, a couple of SFX**; ducked music. **Graphics are done natively in Descript and kept MINIMAL — a hook card + a CTA card (2, maybe 3 cards total), each on a rounded brand panel and OFF THE FACE (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`). The karaoke captions already carry the keyword emphasis, so no separate keyword-pop cards by default.**
5. `publish_project` the set.

## Playbook C — build from a prompt (optional)

`prompt_project_agent` with `project_name` can assemble a project from a script (AI voice + stock). Label AI-voiced drafts; encourage the agent to record their own voice. Not a default for v1.
