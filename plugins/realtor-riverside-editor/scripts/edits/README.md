# Edits engine scripts (Instagram Edits for Mac)

Run these from Claude Code on the agent's Mac; they talk to Edits' automation server through the `insta-edits` bridge's saved token (never printed).

- `build_reel.py plan|build|resume` — the reel pass plan end to end (see `shared/edits-engine.md` § Reel). `--help` lists every flag.
- `edits_drive.py tools|schema|schemas|state|call` — one tool call at a time; frames come back as saved JPGs.
- `render_card.swift` — transparent 1080×1920 card/icon renderer (emoji ok). Build once: `swiftc -O render_card.swift -o render_card`.
- `frame_stats.swift` — measures a frame (luminance, contrast, colour cast, clipping) for the grade strategy. Build once: `swiftc -O frame_stats.swift -o frame_stats`.
- `dump_catalogs.py` — refreshes `shared/edits-catalogs.md` after an Edits update.

Python 3.9+ (Apple's), standard library only. Invoke with `python3 -I`.
