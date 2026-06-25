# Graphics engine (json2video) — the authoritative graphics skill

This is the **single source of truth** for how the Realtor AI Editor puts premium on-screen graphics into a video. Descript edits; **json2video renders the premium graphic overlays**; Claude directs. This split exists because Descript's own AI graphics fail the bar — it puts cards on the face, breaks multi-box grids, renders ugly flat boxes, and a single count-up pass cost ~167 credits. json2video renders premium, on-brand, exact-positioned, animated graphics for ~free.

> Read this WHOLE file before adding any graphic. The companion file `shared/graphics-templates.md` is the copy-ready element library — use those templates, do not hand-improvise graphics.

---

## 1. The Descript + json2video hybrid — exact division of labour

**Descript does the EDITING** (what it is genuinely good at, and where the footage/stock/voice live):

- cut (open-on-hook, filler words, dead air) · Studio Sound / audio cleanup · **B-roll** · **color grade** · **reframe / punch-in / zoom the speaker** · transitions · SFX · **and CAPTIONS**.

**json2video does the PREMIUM GRAPHIC OVERLAYS only:**

- hook title · lower-thirds (name/role) · upper-third topic bars · numbered section chips · stat cards · icon/bubble popups · keyword callouts · framework / numbered-list reveals · CTA card.

**The flow (memorize this):**

1. Descript edits the cut, adds B-roll, color grade, audio, and **captions**.
2. Export the edited video: `publish_project` → `download_url`.
3. json2video composites the graphic overlays ON TOP of that exported footage (the footage is the base `video` layer; each graphic is an `html` overlay element).
4. json2video renders the final reel.

json2video **flattens** the overlays onto the footage, so they composite with NO dependence on Descript preserving an alpha channel. The Descript export already contains the voice, B-roll, grade, and captions baked in; json2video only adds the floating premium graphics.

**One-line rule:** Descript = the EDIT + the captions. json2video = the premium graphic overlays. Neither does the other's job.

---

## 2. HARD RULES (enforced — not optional)

These exist because the user has reported each failure many times and is furious about it. Every one of these must become impossible.

1. **Every text element sits on a CONTRAST PANEL.** A rounded, semi-transparent dark or brand-coloured box with a `box-shadow` behind the text. **NEVER bare text floating over the footage.** White text on a bright sky is invisible; navy text on a dark wall is invisible. The panel guarantees readability on ANY background. The numbered chips worked because they had a panel; bare hook titles and bare callouts failed.
2. **CAPTIONS = DESCRIPT, never json2video.** json2video's subtitle sizing is unreliable — it renders tiny and ignores `font-size`. Karaoke captions (big, white, the active word RECOLOURED — text colour, not a filled box — positioned below the face) are ALWAYS done in Descript, governed by `caption-style.md`. Do NOT add a json2video subtitle track. Captions are not optional: a reel with no captions is a failure (recurring mistake #1).
3. **B-roll: 3–5 clips total on a short-form reel, NEVER duplicated back-to-back.** B-roll is moderate and themed to the line being spoken. Too many clips drains credits; the same clip twice in a row is the recurring duplicate-B-roll failure. (B-roll lives in Descript; this rule is enforced there and re-checked in frame-QA.)
4. **Sync to the EXACT spoken word.** Pull WORD-level timecodes and set each graphic's `start` to the exact word/phrase — NOT the paragraph start. Paragraph timing fires the graphic seconds early (a visible lag). When a phrase is sync-fragile, prefer a **section-level chip** timed to the section start over a phrase-timed callout.
5. **Color grade — ALWAYS.** Every video gets a subtle, flattering grade (done in Descript). No raw, ungraded footage ships.
6. **Off the face.** Graphics live in the TOP zone or a clearly empty area — never covering the speaker's face. The bottom third is reserved for Descript captions.
7. **Big, enforced minimum sizes** (1080-wide canvas): title text ≥ 80px · chip/label ≥ 46px · stat number ≥ 100px · keyword callout ≥ 80px. Never shrink below these to "fit more" — shorten the copy instead, never the font.
8. **On-brand.** Exact hex + font from the agent's brand block (`brand-wiring.md` → `colors`/`fonts`), every time. High contrast: panel vs text vs footage must never be the same colour family. One accent colour, used sparingly, for the ONE thing the eye should land on.
9. **Everything animates IN (and out).** Every graphic slides / pops / fades in, and uses `fade-out` so nothing hard-cuts off screen. Nothing static-blinks.
10. **On-brand panels, never ugly flat boxes.** Rounded corners, gradient or brand-tinted panel, soft shadow. A plain grey rectangle or an off-brand colour is a failure.

---

## 3. GRAPHICS COVERAGE REQUIREMENT (the #1 current gap)

**A video with almost no graphics is a FAILURE.** Sparse graphics — missing lower-thirds, no stat cards, no keyword popups — is the single most common current miss and the user is furious about it. "Restraint" never means "barely any graphics." It means each graphic is strong and on-brand — not that the reel is empty.

**Every short-form reel MUST include, at minimum:**

- **1 hook title** on the opening hook line.
- **≥ 3 lower-thirds / chips** (numbered section chips for list videos, topic bars, or name/role lower-third).
- **≥ 1 stat card** (any number the agent says — price, tax, %, days-on-market — becomes a stat card).
- **≥ 2 keyword popups** (the single most important word in a line, big, in the accent colour, on a panel).
- **1 CTA card** at the end.

**Long-form / YouTube:** all of the above, MORE of it — graphics throughout (a chip or callout roughly every meaningful beat / section), plus framework / numbered-list reveals for any list, repeated stat cards for every number, and lower-thirds for the speaker and any guest. A 10-minute video with three graphics is a failure.

If a draft does not hit this coverage floor, it is not done. Before delivery, count the graphics against this list (see frame-QA, section 6).

---

## 4. The template library — use it, do not improvise

**`shared/graphics-templates.md` is the copy-ready json2video template library. Use those templates. Do NOT hand-improvise graphics.**

It contains, before the templates: an intro (what it is + how to use it — paste element → swap brand values → time `start` to the exact spoken word → render), the **brand value table** (the CSS custom properties every template shares, sourced from the agent's brand block), the **movie shell** to wrap any template in, the mechanics, and the gotchas.

The templates themselves (each a complete, working `type:"html"` element that already obeys every rule above):

1. **Hook title** — big opening statement on the hook line.
2. **Lower-third (name + role)** — identifies the speaker; low but to the side, off the face.
3. **Upper-third / topic bar** — section marker chip at the top.
4. **Numbered section chip** — numbered chip for list videos.
5. **Stat card** — big number + label on a panel.
6. **Icon / bubble popup** — small rounded pill with an emoji/icon + short word.
7. **Keyword callout** — one big accent word on a panel.
8. **CTA card** — the closing call-to-action.
9. **Framework / numbered-list reveal** — animated multi-line list (the safe replacement for Descript's broken grids).

There is also a "Quick reference — which template, when" table at the bottom of that file.

Workflow: pick the template for the graphic type → swap the brand values (one place per template) → set `x/y/width/height/start/duration/fade-out` → time `start` to the exact spoken word → render. The templates are pre-built to the hard rules; do not strip the panel, shrink the sizes, or swap in off-brand colours.

---

## 5. json2video mechanics (the working recipe)

- **POST** `https://api.json2video.com/v2/movies`, headers `x-api-key: <key>` + `Content-Type: application/json`, body = a movie JSON → returns `{"project":"<id>"}`.
- **Poll** `GET https://api.json2video.com/v2/movies?project=<id>` every ~15s until `movie.status == "done"` → `movie.url` is the rendered mp4.
- **Movie shell:** `{"resolution":"custom","width":1080,"height":1920,"quality":"high","scenes":[{"duration":N,"elements":[...]}]}`. Canvas is **1080×1920** for vertical reels, **1920×1080** for YouTube. Match the Descript export format or the overlay won't line up.
- **Footage as the base layer:** `{"type":"video","src":"<descript download_url>","start":0,"duration":N,"resize":"cover"}` — this carries the voice audio, B-roll, grade, and captions already baked in by Descript.
- **A graphic overlay:** `{"type":"html","x":0,"y":0,"width":1080,"height":1920,"start":S,"duration":D,"fade-out":0.3,"html":"<div…><style>…</style>"}`. Full HTML5 + CSS3 — rounded panels, gradients, `box-shadow`, `@keyframes` entrance animations, Google Fonts via `@import`. Use **single-quoted HTML attributes** so the JSON `html` string needs no escaping. A **contrast PANEL** = a rounded div with a semi-transparent dark or brand-coloured background + `box-shadow` behind the text; this is mandatory behind every text element.
- Stack multiple `type:"html"` overlays in one scene's `elements` array (each with its own `start`/`duration`) to fire several graphics over one continuous clip. Always add `fade-out` (≈0.3).
- **Gotchas learned live:** for a `text`-type element the colour field is **`color`** (not `font-color`, which is silently ignored) — but the templates sidestep this by using `type:"html"` for full control; keep it that way. A preset `style` overrides your settings, so NEVER attach a preset `"style"` — your `<style>` block is the source of truth. Scene `background-color` works for full-frame cards. A render costs ≈ its duration in render-seconds (free tier 600s/mo; paid tiers cheap). **CAPTIONS are NOT rendered in json2video** — its subtitle sizing is unreliable/tiny; captions are always Descript.

---

## 6. FRAME-QA before delivery (MANDATORY)

Claude can't watch video, but CAN read frames. **After EVERY render, before delivering:**

1. Download the rendered mp4 (`movie.url`).
2. Extract a frame at each graphic moment (plus at least one caption moment): `ffmpeg -ss <t> -i file.mp4 -frames:v 1 frame.png`.
3. **Read the frames** and verify, on each:
   - **Contrast** — text sits on a panel and is readable on that background (not invisible white-on-sky / dark-on-dark).
   - **Size** — meets the enforced minimums (title ≥ 80px, label ≥ 46px, stat ≥ 100px, keyword ≥ 80px feel).
   - **Sync** — the graphic is on the exact word it belongs to (not firing early).
   - **Coverage** — the reel hits the section-3 floor (hook + ≥3 chips/lower-thirds + ≥1 stat card + ≥2 keyword popups + CTA; more for long-form). Count them.
   - **No duplicate B-roll** back-to-back.
   - **Captions** present, big, and styled (and below the face).
   - **Off the face** — nothing covering the speaker.
4. Fix BEFORE delivering. Never declare a video good unseen, and never claim a visual is "perfect" when you have not looked at the frame.

---

## 7. The honest economics (say it straight)

The hybrid's credit saving vs a GOOD Descript edit is only the **graphics + captions portion** (~20–30%) — NOT a huge cut. The real win is **graphics quality + control**: exact brand, on a contrast panel, synced to the word, never on the face, never a broken grid — plus the graphics rendering ~free.

The single biggest credit drain is the **iteration loop** — over-correcting (too little B-roll → swing to too much; tiny captions → guess again) burns a paid Descript pass per swing. Follow these rules the FIRST time and frame-QA before delivery; don't swing.

---

## 8. The Remotion plan = json2video ONLY for now

The render engine is **json2video, full stop, right now** — hosted, cheap, no infra, no licence. Self-hosted **Remotion** (Lambda) could one day render the same templates for pennies at high volume, but it needs a company licence + infrastructure and is **NOT in use today**. Do not route any graphics through Remotion. The engine is swappable later when volume justifies it; until then it is json2video only. The agent never touches either — it is the agency's render service, invisible to them (like FFmpeg inside Descript).
