# Graphics templates (json2video) — the copy-ready template library

This is the **drop-in template library** for the Realtor AI Editor's premium graphic overlays. Every template below is a complete, working json2video `type:"html"` element that **already obeys every house rule** in `graphics-engine.md` and `graphics-style.md`: a contrast PANEL behind every text element, enforced BIG sizes (title ≥ 80px, label ≥ 46px, stat number ≥ 100px), an animated slide/pop/fade entrance, brand colours via easy-to-swap values, and positioned OFF the face (top zone or a clear area; captions live at the bottom in Descript).

**How to use:** pick the template for the graphic type, paste the element into a scene's `elements` array, swap the brand values (see "Swap these" under each), set `x/y/width/height/start/duration/fade-out`, time `start` to the **exact spoken word** (word-level timecode), and render. Captions are NEVER done here — they are done in Descript (see "Gotchas").

Templates here are written for a **1080×1920 vertical reel** (the harder case). For **1920×1080 YouTube**, widen the panel `max-width`, drop the `top` zone to roughly `y:90–140`, and keep every size the same or larger. The contrast panel + entrance animation + off-face placement carry over unchanged.

---

## The brand value table (swap these everywhere)

Every template uses the same CSS custom properties at the top of its `<style>` block. Pull these from the agent's brand block (`~/realtor-brain/editor/config.json` → `colors`/`fonts`, resolved via `brand-wiring.md`). Change them in ONE place per template and the whole graphic re-skins.

| Property | Source field | Mike Sherrard | Daniel / Jenkins |
|---|---|---|---|
| `--brand` (primary panel/brand colour) | `colors.primary` | `#2E1A47` (purple) | `#3B5974` (slate-navy) |
| `--accent` (the punchy highlight colour) | `colors.accent` | `#F2C14E` (gold) | `#5B8CB3` (blue) |
| `--ink` (panel background, dark contrast) | `colors.bg` / dark | `#15101F` | `#1A2733` |
| `--text` (main readable text) | `colors.text` | `#FFFFFF` | `#FFFFFF` |
| `--font-head` (heading font) | `fonts.heading` | `Poppins` (SF Pro feel) | `Montserrat` |
| `--font-body` (body/label font) | `fonts.body` | `Poppins` | `Inter` |

The `@import` line in each template loads the Google Font — swap the font name in BOTH the `@import` URL and the `--font-head`/`--font-body` values. (json2video has no SF Pro; `Poppins`/`Montserrat` are the closest free stand-ins.)

---

## The movie shell (wrap any of these templates in this)

```json
{
  "resolution": "custom",
  "width": 1080,
  "height": 1920,
  "quality": "high",
  "scenes": [
    {
      "duration": 8,
      "elements": [
        {
          "type": "video",
          "src": "<DESCRIPT_DOWNLOAD_URL>",
          "start": 0,
          "duration": 8,
          "resize": "cover"
        },
        {
          "comment": "← paste a graphic element from this library here, set its start to the spoken word",
          "type": "html",
          "x": 0, "y": 0, "width": 1080, "height": 1920,
          "start": 1.4, "duration": 2.6, "fade-out": 0.3,
          "html": "…"
        }
      ]
    }
  ]
}
```

- The Descript-exported video is the base layer (it carries the voice audio). Graphics composite **on top** — json2video flattens them onto the footage, so no alpha dependency.
- One scene per continuous stretch of footage is fine; stack multiple `type:"html"` overlays in the same scene's `elements` array, each with its own `start`/`duration`, to fire several graphics over one clip.
- Match the format to the Descript export (1080×1920 vertical, 1920×1080 YouTube) or the overlay won't line up.

---

## Mechanics (the working recipe — same as graphics-engine.md)

- **POST** `https://api.json2video.com/v2/movies`, headers `x-api-key: <key>` + `Content-Type: application/json`, body = the movie JSON → returns `{"project":"<id>"}`.
- **Poll** `GET https://api.json2video.com/v2/movies?project=<id>` every ~15s until `movie.status == "done"` → `movie.url` is the rendered mp4.
- Every graphic is a `{"type":"html", …}` element with **single-quoted HTML attributes** (so the JSON `html` string needs no escaping) and a `<style>` block that `@import`s the Google Font.
- Position with `x`/`y`/`width`/`height`; time with `start`/`duration`; ALWAYS add `fade-out` (≈0.3) so nothing hard-cuts off screen.
- A render costs ≈ its duration in render-seconds (free tier 600s/mo). Keep graphic overlays short (2–3s each); render the whole reel once.
- **Frame-QA after EVERY render** (mandatory): download the mp4, `ffmpeg -ss <t> -i file -frames:v 1 frame.png` at each graphic moment, then Read the frames and verify panel + readable + big + off-face + synced. Fix before delivering.

---

## Gotchas (read before editing any template)

1. **`color`, NOT `font-color`.** For json2video `text`-type elements the colour field is `color`; `font-color` is silently ignored. These templates sidestep that entirely by using `type:"html"` (full CSS control) — keep it that way; don't downgrade to `text` elements.
2. **A preset `style` overrides your settings.** Never attach a preset `"style"` to these elements — it will stomp your fonts/colours/sizes. HTML + your own `<style>` block is the source of truth.
3. **Captions are DESCRIPT, never json2video.** json2video's subtitle sizing renders tiny and ignores `font-size`. Karaoke captions (big, white, active word recoloured, below the face) are always done in Descript (`caption-style.md`). Do NOT add a json2video subtitle track.
4. **Sync to the exact spoken WORD.** Set `start` from word-level timecodes, not paragraph start — paragraph timing fires the graphic seconds early (visible lag = recurring mistake #9). When a phrase is sync-fragile, prefer a section-level chip timed to the section start.
5. **Off the face, always.** Every template sits in the top zone (`y` ≈ 120–520) or a clear area. Never lower a panel onto the speaker's face. The bottom third is reserved for Descript captions.
6. **Big or nothing.** Don't shrink the sizes below the enforced minimums to "fit more." If text is too long, shorten the copy — never the font.
7. **Panel is mandatory.** Never delete the panel `div` to "make it cleaner" — bare text over footage (white on a bright sky) is invisible and is recurring mistake #3. The panel is what guarantees contrast on ANY background.
8. **One accent, used sparingly.** The accent colour is for the ONE thing the eye should land on (the number, the keyword, the chip index). Don't paint the whole panel accent — it stops being an accent.

---
---

# THE TEMPLATES

---

## (1) Hook title

The big opening statement that lands on the hook line. Top zone, two-line max, accent underline bar, slides down + fades in.

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<hook word>, duration:2.8, fade-out:0.4`
**Swap these:** `--brand`, `--accent`, `--ink`, `--text`, `--font-head`; the headline text; (optional) the eyebrow word.

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 1.2, "duration": 2.8, "fade-out": 0.4,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600;800;900&display=swap');:root{--brand:#2E1A47;--accent:#F2C14E;--ink:#15101F;--text:#FFFFFF;--font-head:'Poppins';}*{margin:0;box-sizing:border-box;}.wrap{position:absolute;top:200px;left:0;right:0;display:flex;justify-content:center;}.panel{max-width:900px;padding:46px 56px;border-radius:34px;background:linear-gradient(135deg,var(--ink) 0%,var(--brand) 100%);box-shadow:0 24px 60px rgba(0,0,0,.55);text-align:center;animation:slideIn .55s cubic-bezier(.2,.9,.25,1.2) both;}.eyebrow{font-family:var(--font-head);font-weight:800;font-size:40px;letter-spacing:6px;text-transform:uppercase;color:var(--accent);margin-bottom:14px;}.title{font-family:var(--font-head);font-weight:900;font-size:96px;line-height:1.04;color:var(--text);}.bar{height:10px;width:140px;background:var(--accent);border-radius:6px;margin:26px auto 0;}@keyframes slideIn{from{opacity:0;transform:translateY(-70px) scale(.94);}to{opacity:1;transform:translateY(0) scale(1);}}</style><div class='wrap'><div class='panel'><div class='eyebrow'>READ THIS FIRST</div><div class='title'>5 Towns With ZERO Income Tax</div><div class='bar'></div></div></div>"
}
```

---

## (2) Lower-third (name + role)

Identifies the speaker — name on top, role/brokerage underneath, accent tab on the left. Sits LOW but to the SIDE (off the face), slides in from the left. Use briefly at the start (and once more if a guest appears).

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<intro word>, duration:3.5, fade-out:0.4`
**Swap these:** `--brand`, `--accent`, `--text`, `--font-head`/`--font-body`; the name; the role line.

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 0.8, "duration": 3.5, "fade-out": 0.4,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500;700;900&display=swap');:root{--brand:#2E1A47;--accent:#F2C14E;--text:#FFFFFF;--font-head:'Poppins';--font-body:'Poppins';}*{margin:0;box-sizing:border-box;}.lt{position:absolute;left:60px;bottom:520px;display:flex;align-items:stretch;border-radius:22px;overflow:hidden;box-shadow:0 16px 44px rgba(0,0,0,.5);animation:slideL .5s cubic-bezier(.2,.9,.25,1.15) both;}.tab{width:18px;background:var(--accent);}.body{background:var(--brand);padding:24px 40px 24px 30px;}.name{font-family:var(--font-head);font-weight:900;font-size:64px;line-height:1;color:var(--text);}.role{font-family:var(--font-body);font-weight:500;font-size:46px;letter-spacing:1px;color:var(--accent);margin-top:10px;}@keyframes slideL{from{opacity:0;transform:translateX(-120px);}to{opacity:1;transform:translateX(0);}}</style><div class='lt'><div class='tab'></div><div class='body'><div class='name'>Mike Sherrard</div><div class='role'>Realtor · eXp Realty</div></div></div>"
}
```

---

## (3) Upper-third / topic bar

A persistent topic banner pinned to the top — tells the viewer what this segment is about. Wider, shorter than the hook; fades + drops in. Good for "the subject of the next 20 seconds."

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<topic word>, duration:4.0, fade-out:0.4`
**Swap these:** `--brand`, `--accent`, `--text`, `--font-head`; the topic text.

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 0.6, "duration": 4.0, "fade-out": 0.4,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700;900&display=swap');:root{--brand:#2E1A47;--accent:#F2C14E;--text:#FFFFFF;--font-head:'Poppins';}*{margin:0;box-sizing:border-box;}.bar{position:absolute;top:130px;left:50%;transform:translateX(-50%);display:flex;align-items:center;gap:22px;padding:24px 46px;border-radius:999px;background:var(--brand);box-shadow:0 14px 38px rgba(0,0,0,.5);animation:drop .5s cubic-bezier(.2,.9,.25,1.2) both;}.dot{width:26px;height:26px;border-radius:50%;background:var(--accent);box-shadow:0 0 0 8px rgba(242,193,78,.25);}.txt{font-family:var(--font-head);font-weight:900;font-size:52px;letter-spacing:2px;text-transform:uppercase;color:var(--text);}@keyframes drop{from{opacity:0;transform:translate(-50%,-60px);}to{opacity:1;transform:translate(-50%,0);}}</style><div class='bar'><span class='dot'></span><span class='txt'>Property Taxes</span></div></div>"
}
```

---

## (4) Numbered section chip

The list/ranking marker — a big index number + the item label, pinned top. One per item on a list video, timed to the line that names it. The number lives in an accent badge; the chip slides in from the right.

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<item word>, duration:3.2, fade-out:0.4`
**Swap these:** `--brand`, `--accent`, `--ink`, `--text`, `--font-head`; the index number; the item label.

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 0.5, "duration": 3.2, "fade-out": 0.4,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700;800;900&display=swap');:root{--brand:#2E1A47;--accent:#F2C14E;--ink:#15101F;--text:#FFFFFF;--font-head:'Poppins';}*{margin:0;box-sizing:border-box;}.chip{position:absolute;top:170px;left:50%;transform:translateX(-50%);display:flex;align-items:center;gap:0;border-radius:26px;overflow:hidden;box-shadow:0 18px 46px rgba(0,0,0,.5);animation:slideR .5s cubic-bezier(.2,.9,.25,1.2) both;}.num{display:flex;align-items:center;justify-content:center;min-width:128px;height:128px;background:var(--accent);font-family:var(--font-head);font-weight:900;font-size:84px;color:var(--ink);}.lbl{padding:0 44px;height:128px;display:flex;align-items:center;background:var(--brand);font-family:var(--font-head);font-weight:800;font-size:58px;letter-spacing:1px;color:var(--text);}@keyframes slideR{from{opacity:0;transform:translate(-50%,0) translateX(90px);}to{opacity:1;transform:translate(-50%,0) translateX(0);}}</style><div class='chip'><div class='num'>1</div><div class='lbl'>Frisco, TX</div></div></div>"
}
```

---

## (5) Stat card (big number + label)

The data hero — a giant number on top, the label underneath, on a dark panel. For "$900–1,000/mo · PROPERTY TAX" moments. Number ≥ 100px; pops in with a scale bounce.

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<stat word>, duration:3.0, fade-out:0.4`
**Swap these:** `--brand`, `--accent`, `--ink`, `--text`, `--font-head`; the big number; the label.

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 1.0, "duration": 3.0, "fade-out": 0.4,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600;800;900&display=swap');:root{--brand:#2E1A47;--accent:#F2C14E;--ink:#15101F;--text:#FFFFFF;--font-head:'Poppins';}*{margin:0;box-sizing:border-box;}.wrap{position:absolute;top:240px;left:0;right:0;display:flex;justify-content:center;}.card{padding:44px 70px;border-radius:34px;background:linear-gradient(160deg,var(--ink),var(--brand));box-shadow:0 24px 60px rgba(0,0,0,.55);text-align:center;border-top:8px solid var(--accent);animation:pop .55s cubic-bezier(.18,1.25,.4,1) both;}.stat{font-family:var(--font-head);font-weight:900;font-size:150px;line-height:.95;color:var(--accent);text-shadow:0 4px 18px rgba(0,0,0,.4);}.lbl{font-family:var(--font-head);font-weight:800;font-size:50px;letter-spacing:3px;text-transform:uppercase;color:var(--text);margin-top:16px;}@keyframes pop{0%{opacity:0;transform:scale(.6);}60%{opacity:1;transform:scale(1.06);}100%{transform:scale(1);}}</style><div class='wrap'><div class='card'><div class='stat'>$950/mo</div><div class='lbl'>Avg. Property Tax</div></div></div></div>"
}
```

---

## (6) Icon / bubble popup (emoji + word)

The small rounded pill — an emoji/icon + one or two words. The lightweight reaction graphic. Sits to the side in the top zone, pops in fast. Use sparingly (it's a garnish, not a headline).

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<word>, duration:2.2, fade-out:0.3`
**Swap these:** `--accent`, `--ink`, `--text`, `--font-body`; the emoji; the word.

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 1.0, "duration": 2.2, "fade-out": 0.3,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700;800&display=swap');:root{--accent:#F2C14E;--ink:#15101F;--text:#FFFFFF;--font-body:'Poppins';}*{margin:0;box-sizing:border-box;}.bub{position:absolute;top:300px;right:80px;display:flex;align-items:center;gap:18px;padding:22px 38px 22px 28px;border-radius:999px;background:var(--ink);border:4px solid var(--accent);box-shadow:0 14px 36px rgba(0,0,0,.5);animation:pop .45s cubic-bezier(.15,1.4,.45,1) both;}.emoji{font-size:64px;line-height:1;}.word{font-family:var(--font-body);font-weight:800;font-size:54px;color:var(--text);}@keyframes pop{0%{opacity:0;transform:scale(.4) rotate(-8deg);}65%{opacity:1;transform:scale(1.12) rotate(2deg);}100%{transform:scale(1) rotate(0);}}</style><div class='bub'><span class='emoji'>🔥</span><span class='word'>Hot Market</span></div></div>"
}
```

---

## (7) Keyword callout (one big accent word)

The single punchy word in the brand ACCENT colour, on a panel, brief. The emphasis hit when one word matters most. Centred top zone, snaps in with a quick scale.

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<the word>, duration:1.8, fade-out:0.3`
**Swap these:** `--accent`, `--ink`, `--font-head`; the keyword.

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 1.0, "duration": 1.8, "fade-out": 0.3,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@900&display=swap');:root{--accent:#F2C14E;--ink:#15101F;--font-head:'Poppins';}*{margin:0;box-sizing:border-box;}.wrap{position:absolute;top:280px;left:0;right:0;display:flex;justify-content:center;}.kw{padding:30px 60px;border-radius:28px;background:var(--ink);box-shadow:0 20px 52px rgba(0,0,0,.55);animation:snap .4s cubic-bezier(.15,1.5,.4,1) both;}.word{font-family:var(--font-head);font-weight:900;font-size:118px;line-height:1;letter-spacing:1px;text-transform:uppercase;color:var(--accent);text-shadow:0 4px 16px rgba(0,0,0,.45);}@keyframes snap{0%{opacity:0;transform:scale(.55);}70%{opacity:1;transform:scale(1.08);}100%{transform:scale(1);}}</style><div class='wrap'><div class='kw'><span class='word'>TAX-FREE</span></div></div></div>"
}
```

---

## (8) CTA card

The call-to-action — a directive line + the handle/URL, on a strong brand panel with an accent button. Use at the END (and never on the face). Slides up from the bottom region (still above the caption zone).

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<CTA line>, duration:3.5, fade-out:0.4`
**Swap these:** `--brand`, `--accent`, `--ink`, `--text`, `--font-head`/`--font-body`; the CTA line; the handle/URL.

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 0.6, "duration": 3.5, "fade-out": 0.4,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600;800;900&display=swap');:root{--brand:#2E1A47;--accent:#F2C14E;--ink:#15101F;--text:#FFFFFF;--font-head:'Poppins';--font-body:'Poppins';}*{margin:0;box-sizing:border-box;}.wrap{position:absolute;top:330px;left:0;right:0;display:flex;justify-content:center;}.cta{max-width:880px;padding:46px 56px;border-radius:34px;background:linear-gradient(135deg,var(--brand),var(--ink));box-shadow:0 24px 60px rgba(0,0,0,.55);text-align:center;animation:up .55s cubic-bezier(.2,.9,.25,1.15) both;}.line{font-family:var(--font-head);font-weight:900;font-size:84px;line-height:1.05;color:var(--text);}.btn{display:inline-block;margin-top:30px;padding:24px 52px;border-radius:999px;background:var(--accent);font-family:var(--font-body);font-weight:800;font-size:54px;letter-spacing:1px;color:var(--ink);}@keyframes up{from{opacity:0;transform:translateY(80px);}to{opacity:1;transform:translateY(0);}}</style><div class='wrap'><div class='cta'><div class='line'>Thinking of Moving to Texas?</div><div class='btn'>DM me \"TX\"</div></div></div></div>"
}
```

---

## (9) Framework / numbered-list reveal

The multi-line list on ONE panel — for "here are the 3 steps / 4 shifts." Each row reveals in sequence (staggered animation) with an accent index. This is the on-brand replacement for a cramped grid (never use a multi-box grid — recurring mistake). One panel, rows stack vertically, top-to-clear-area.

**Suggested placement:** `x:0, y:0, width:1080, height:1920, start:<list intro word>, duration:4.5, fade-out:0.4`
**Swap these:** `--brand`, `--accent`, `--ink`, `--text`, `--font-head`/`--font-body`; the title; each row's text (add/remove `.row` divs and bump the `animation-delay`).

```json
{
  "type": "html",
  "x": 0, "y": 0, "width": 1080, "height": 1920,
  "start": 1.0, "duration": 4.5, "fade-out": 0.4,
  "html": "<style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600;800;900&display=swap');:root{--brand:#2E1A47;--accent:#F2C14E;--ink:#15101F;--text:#FFFFFF;--font-head:'Poppins';--font-body:'Poppins';}*{margin:0;box-sizing:border-box;}.wrap{position:absolute;top:210px;left:0;right:0;display:flex;justify-content:center;}.panel{width:900px;padding:44px 48px;border-radius:34px;background:linear-gradient(160deg,var(--ink),var(--brand));box-shadow:0 24px 60px rgba(0,0,0,.55);animation:fade .4s ease both;}.head{font-family:var(--font-head);font-weight:900;font-size:64px;color:var(--accent);text-align:center;margin-bottom:30px;}.row{display:flex;align-items:center;gap:26px;margin:20px 0;opacity:0;animation:rin .5s cubic-bezier(.2,.9,.25,1.15) forwards;}.row:nth-child(2){animation-delay:.35s;}.row:nth-child(3){animation-delay:.7s;}.row:nth-child(4){animation-delay:1.05s;}.idx{flex:none;width:80px;height:80px;border-radius:18px;background:var(--accent);color:var(--ink);font-family:var(--font-head);font-weight:900;font-size:50px;display:flex;align-items:center;justify-content:center;}.rtxt{font-family:var(--font-body);font-weight:700;font-size:54px;color:var(--text);}@keyframes fade{from{opacity:0;}to{opacity:1;}}@keyframes rin{from{opacity:0;transform:translateX(50px);}to{opacity:1;transform:translateX(0);}}</style><div class='wrap'><div class='panel'><div class='head'>The 3 Steps</div><div class='row'><span class='idx'>1</span><span class='rtxt'>Get pre-approved</span></div><div class='row'><span class='idx'>2</span><span class='rtxt'>Tour 5–7 homes</span></div><div class='row'><span class='idx'>3</span><span class='rtxt'>Make a smart offer</span></div></div></div></div>"
}
```

> Note: a per-row reveal panel needs a `duration` long enough to clear the last row's `animation-delay` + read time (≈4.5s+ for three rows). For more rows, extend `duration` and add `.row:nth-child(n)` delays.

---
---

## Quick reference — which template, when

| # | Template | Use it when… | Min size honoured |
|---|---|---|---|
| 1 | Hook title | the opening line / strongest claim | title 96px |
| 2 | Lower-third | naming the speaker (or a guest) | name 64px / role 46px |
| 3 | Upper-third / topic bar | flagging the segment's subject | 52px |
| 4 | Numbered section chip | each item of a list/ranking video | num 84px / label 58px |
| 5 | Stat card | a number is the point ($, %, count) | stat 150px / label 50px |
| 6 | Icon/bubble popup | a light reaction garnish | word 54px |
| 7 | Keyword callout | ONE word must hit hard | word 118px |
| 8 | CTA card | the closing ask | line 84px |
| 9 | Framework / list reveal | "the N steps/shifts" (replaces grids) | head 64px / rows 54px |

Every template above already ships with: a contrast panel, an entrance animation (slide/pop/fade with `fade-out`), brand values at the top of `<style>`, sizes at/over the enforced minimums, and a top-zone / off-face position. Don't strip any of those out — they are the difference between premium and "Fiverr."
