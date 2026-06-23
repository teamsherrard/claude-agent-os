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
2. **Import by URL** — a **Google Drive** / Dropbox / direct link. Pass it to `import_media` as the `url`; Descript fetches it server-side, **no upload and no size limit**, even for a 500 MB file. (Drive link = "anyone with the link can view.") Same for Pexels/Pixabay B-roll.
3. **Never PUT a big local file's bytes from the sandbox** — it exceeds the shell time limit and the process dies between turns (the #1 live-test failure). **Compressing first doesn't fix it** — it still has to upload. Put the file in Drive (or drop it into Descript) instead.

After any import, `wait_for_job`; Descript auto-transcribes on import (don't re-transcribe).

## General habits (always)

- Work on a copy; seed proper nouns first; **one `prompt_project_agent` instruction at a time**, verify after each (catches overreach).
- **Publishing is gated** — never `publish_project` without the agent's yes (keep the connector's Publish on "needs approval").
- **"Unable to reach Descript" is usually a timeout, not a failure** — check with `list_projects` / `get_project` before retrying, so you don't redo a paid pass.

## Playbook A — long-form cleanup

1. Find/create the project; `import_media` the video **by URL**; `wait_for_job` (auto-transcribes).
2. `prompt_project_agent`: remove filler words (conservative). Verify first 40s.
3. Remove silences > ~1.5s (avoid harsh cuts).
4. Cut false starts / bad takes — review before applying; restore good bits.
5. Studio Sound (~80%).
6. B-roll (via `editor-broll` → import by URL, place on the words); sparse emphasis + chapters. No captions by default.
7. `publish_project` (on approval) → share + download URL + a title/description.

## Playbook B — short-form / pull shorts

1. Find/import as above (by URL).
2. `prompt_project_agent`: pick stand-alone moments (hook → idea → payoff/CTA); make a 9:16 composition per clip.
3. Reframe (face centred), cut hard, hook in first ~1.5s.
4. Karaoke captions on (brand style); B-roll on the words; punch-ins; ducked music.
5. `publish_project` the set.

## Playbook C — build from a prompt (optional)

`prompt_project_agent` with `project_name` can assemble a project from a script (AI voice + stock). Label AI-voiced drafts; encourage the agent to record their own voice. Not a default for v1.
