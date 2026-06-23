# Descript playbooks (tested recipes)

Descript does the editing; Claude issues the instructions and verifies. These use Descript's **real MCP tools**.

## The tools you actually call

- `list_projects` / `get_project` — find and inspect the agent's projects (and their composition IDs).
- `import_media` — bring in the video and B-roll. **Import by URL** (a direct link, **Google Drive**, or **Dropbox**) whenever possible. Returns a `job_id` + `project_url`.
- `prompt_project_agent` — the natural-language editor (Underlord). **One clear instruction per call.** Pass `project_id` (+ optional `composition_id`).
- `publish_project` — render/export → returns `share_url` + `download_url` (480p–4K).
- `wait_for_job` — call after EVERY `import_media` / `prompt_project_agent` / `publish_project` (they run async and return a `job_id`). Always show the agent the `project_url`.

## Getting the video IN — read this first (it's where edits fail)

**Import by URL. Never stream a big local file through the sandbox.**

- Best path: the agent's video lives in **Google Drive** (their Brain already lives there). Get an "anyone with the link can view" share link and pass it to `import_media` as the `url`. Descript fetches it server-side — **no upload, no time limit**, even for a 500 MB file.
- Also fine: Dropbox links, any direct-download link, and Pexels/Pixabay B-roll URLs.
- **Big-file rule:** raw realtor videos are often 100–500 MB. Do **not** PUT the bytes from the sandbox — it exceeds the shell time limit and the process dies between turns (this was the #1 failure in live testing). Put the file in Drive and import the link.
- Local-only with no link? Ask the agent to drop it in their Google Drive first — faster than any upload.
- After import, `wait_for_job`; Descript auto-transcribes on import (don't re-transcribe).

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
