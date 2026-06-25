# Graphics engine (json2video) — the premium-graphics handoff

Descript edits; **json2video renders the premium on-screen graphics**; Claude directs. This split exists because Descript's own AI graphics fail the bar — it puts cards on the face, breaks multi-box grids, renders ugly boxes, and a count-up pass cost ~167 credits. json2video renders premium, on-brand, exact-positioned graphics for ~free.

## The division of labour (memorize this)

**Descript does the EDITING** (what it's genuinely good at + where the footage/stock live):
- cut (open-on-hook, filler, dead air) · Studio Sound · **B-roll** · **color grade** · **reframe/zoom the speaker** · transitions · SFX · **and CAPTIONS**.

**json2video does the PREMIUM GRAPHIC OVERLAYS only:**
- hook title · numbered section chips · stat cards · framework/quadrant · keyword callouts · CTA card.

**Flow:** Descript edit → export the edited video (`publish_project` → `download_url`) → json2video composites the graphic overlays on top of that footage → final reel. (json2video flattens the overlays onto the footage, so they float transparently with NO dependence on Descript preserving an alpha channel.)

## CAPTIONS = DESCRIPT (never json2video)
json2video's subtitle sizing is unreliable — it renders **tiny** and ignores `font-size`. So **captions are always done in Descript** (proven big, brand-styled, governed by `caption-style.md`). Do NOT use json2video subtitles. Descript = captions; json2video = graphic overlays.

## HARD RULES for every json2video graphic (enforced — not optional)
1. **Every text element sits on a CONTRAST PANEL** — a rounded, semi-transparent dark or brand-coloured box behind the text. **NEVER bare text floating over the footage/b-roll** (white text on a bright sky = invisible; blue text on a dark wall = invisible). The panel guarantees readability on ANY background. (The numbered chips worked because they had a panel; the bare hook title and bare callouts failed.)
2. **Big, enforced minimum sizes** (1080-wide canvas): title text ≥ 80px, chip/label ≥ 46px, stat number ≥ 100px, keyword callout ≥ 80px. Never small.
3. **Synced to the EXACT spoken word** — pull WORD-level timecodes and place each graphic on the exact word/phrase, NOT the paragraph start (paragraph timing fires pops seconds early — a visible lag). When unsure, prefer **section-level chips** (timed to a section start) over phrase-timed callouts, which are sync-fragile.
4. **Off the face** — top zone or a clearly empty area; never covering the speaker's face. (Captions live at the bottom, in Descript.)
5. **On-brand** — exact hex + font from `brand.json`, every time. High contrast: panel vs text vs footage — never the same colour family.
6. **Restraint** — a few strong graphics beat many. Don't clutter.

## json2video mechanics (the working recipe)
- POST `https://api.json2video.com/v2/movies`, headers `x-api-key: <key>` + `Content-Type: application/json`, body = a movie JSON → returns `{"project":"<id>"}`. Poll `GET https://api.json2video.com/v2/movies?project=<id>` every ~15s until `movie.status == "done"` → `movie.url` is the rendered mp4.
- Movie shell: `{"resolution":"custom","width":1080,"height":1920,"quality":"high","scenes":[{"duration":N,"elements":[...]}]}` — 1080×1920 for vertical reels, 1920×1080 for YouTube. **Match the format or it won't line up in Descript.**
- Footage as base layer: `{"type":"video","src":"<descript download_url>","start":0,"duration":N,"resize":"cover"}` (keeps the voice audio).
- A graphic overlay: `{"type":"html","x":0,"y":0,"width":1080,"height":1920,"start":S,"duration":D,"fade-out":0.3,"html":"<div class='c'>…</div><style>…</style>"}`. Use full HTML5 + CSS3 — rounded panels, gradients, `box-shadow`, `@keyframes` entrance animations, Google Fonts via `@import`. Use **single-quoted HTML attributes** so the JSON string needs no escaping.
- Gotchas learned live: for a `text`-type element the colour field is **`color`** (not `font-color`, which is ignored), and a preset `style` overrides your settings — so for brand control use HTML elements, not preset text styles. Scene `background-color` works for full-frame cards. A render costs ≈ its duration in render-seconds (free tier 600s/mo; paid tiers cheap).

## Frame-QA before delivery (MANDATORY)
Claude can't watch video, but CAN read frames. After EVERY render: download the mp4, `ffmpeg -ss <t> -i file -frames:v 1 frame.png` at each graphic moment (plus a caption moment), then **Read the frames** and verify: text is on a panel + readable + big, off the face, synced to the right word, b-roll not duplicated back-to-back, captions present + sized, no clash. Fix BEFORE delivering. Never declare it good unseen — and never claim a visual is "perfect" you haven't looked at.

## The honest economics (say it straight)
The hybrid's credit saving vs a GOOD Descript edit is the **graphics + captions portion** (~20–30%) — NOT a huge cut. The real win is **graphics quality + control** (exact brand, on a contrast panel, synced, never on the face, never a broken grid) plus graphics being ~free. **The single biggest credit drain is the iteration loop** — over-correcting (too little b-roll → swing to too much; tiny captions → guess again) burns a paid pass per swing. Follow these rules the FIRST time and frame-QA before delivery; don't swing.

## The engine is swappable
json2video today (hosted, cheap, no infra, no license). At high volume, self-hosted **Remotion** (Lambda) renders the same templates for pennies but needs a company licence + infra — swap it in only when volume justifies it. The agent never touches either; it's the agency's render service, invisible to them (like FFmpeg inside Descript).
