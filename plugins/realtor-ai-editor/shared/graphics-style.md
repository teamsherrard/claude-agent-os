# Graphics in Descript — minimal, clean, off the face

Graphics are done **natively in Descript**, and kept **MINIMAL** — cards are the most credit-expensive thing Descript does, so use just what each format needs. On a **short-form reel** the karaoke captions (with the brand-accent active word) already carry the keyword emphasis, so you rarely need extra text cards. On **long-form** there's no karaoke — so the emphasis lives in **pop-up cards every ~2–3 min** (a key-phrase callout; ~3–5 on a 10-min video; see below). (See `${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md` for the credit rationale.)

## What to add — and ONLY this, by default

- **A hook card** — first ~1.5–2.5s: the claim or number.
- **A CTA card** — at the end: the agent's call-to-action (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`).
- **(Optional, only if it truly adds value)** ONE stat/number card on a key figure, or numbered chips on a clear list/ranking video.

On a **short-form reel** that's **2, maybe 3 cards total** — the karaoke captions do the emphasis work, so don't pile on more. On **long-form**, also add an **emphasis pop-up every ~2–3 min** — a key-phrase callout from the transcript (long-form has no word-by-word karaoke, so these ARE the emphasis layer; ~3–5 on a 10-min video). Beyond that, the agent adds more by hand (credit discipline). Never sparse-panic into piling on cards.

## Every card must be (the quality bar)

- **On a rounded, brand-coloured panel** with a soft drop shadow — **NEVER a flat hard black box, and NEVER bare text floating on the footage** (bare text vanishes on bright/busy footage — the recurring contrast complaint). Which colour exactly → **"Panel colour" below** (don't improvise it).
- **OFF THE FACE — absolute** (see placement below).
- **Big & bold** — fill a real part of the frame, heaviest weight (800–900).
- **On-brand** — colours/fonts from the Brain (`brand-wiring.md`); never a tool default (it once defaulted to green). One accent colour, used for the one thing the eye should land on.
- **Animated in** (pop / slide ~0.3s) and out; nothing blinks on.
- **Text fits its panel** (even padding, no overflow); **no collisions** with captions, other cards, or the CTA.
- **⚠️ THE 4K OVERFLOW TRAP — the #1 way cards ship broken.** In a 4K composition (3840×2160) Descript sizes **fonts at 1080p scale** but treats the **background box in 4K pixels** — so a card asked for at "90pt" renders roughly **DOUBLE** its box and the words spill out above and below the panel, as bare unreadable text. Seen live on a real client video: the hook card overflowed AND landed across the speaker's eyes. **The rule:** never specify a card in raw pt. Specify **cap height ≈ 3.5% of frame height** (~75px in 4K terms), demand the **background box be ≥30% wider and ≥60% taller than the text bounding box**, and tell Descript to **measure the text bbox against the panel and shrink the font until it's contained**. Keep each card to **ONE short line** where possible — multi-line wraps are what overflow. Then prove it on a full-res frame (`final-check.md` blocker 12).
- **Typography is DESIGNED, not assembled — this is the bar cards keep failing.** Every line centred relative to the panel AND to each other (two stacked lines with different centres read broken); **single spaces only** (a double space like "MORE IN␣␣90 DAYS" is instantly sloppy); a deliberate size hierarchy; and the **panel HUGS the text** — tight, even padding (~40–60px), never an oversized slab of empty colour. **ALWAYS build a card as ONE single text object** (a text layer with its own background colour) — never separate text layers stacked on a rectangle: stacked layers drift out of alignment, which is exactly how the rejected "horrible" hook card happened (it was four separate layers). **And NEVER use Descript's library templates/layouts for a card — live-tested and banned:** a "title template" applied via Underlord is a LAYOUT object that hijacks the scene — it zoomed the footage into a giant close-up and ran its text off the edge of the frame, while reporting the video "untouched." One text object is the ONLY approved build.
- **No cramped multi-box grids** — Descript renders 2×2 quadrants / packed grids BROKEN (overlapping, cut-off). For a multi-part idea use **sequential cards** (one at a time) or a simple stacked list, full-size.

## Panel colour — pick it deterministically (never "some brand colour")

The panel is **always DARK**, so white text always reads. Pick it in this order and take the first one that passes the dark test:

1. `brand.colors.bg` — if dark
2. `brand.colors.primary` — if dark
3. **`#1F2A37`** (the neutral dark fallback)

**The dark test:** convert to greyscale — `(0.2126·R + 0.7152·G + 0.0722·B) / 255`. **Below ~0.35 = dark enough.** Above that, it will not carry white text; move to the next option.

- **Text on the panel is always `brand.colors.text` (default `#FFFFFF`).** Never light text on a light panel — that's the exact contrast failure banned everywhere else in this plugin.
- **If ALL their brand colours are light** (cream / gold / pastel — common in luxury real estate), **do not force it.** Use `#1F2A37` and put the brand colour to work as a thin accent rule or underline instead. Say it once, plainly: *"Your brand colours are light, so I've put them on a dark panel — light-on-light doesn't read on video."*
- **`brand.colors.accent` does NOT go inside a card.** A single text object can't do per-word colour (live-tested), so the accent lives in the karaoke captions' active word (`brand.caption.accent`), not the card.

## Style packs — so 100 agents don't look identical

Read `brand.style_pack` from the config (`${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md`). It shifts the *look and energy*, never the safety rules — off-face, contrast, containment, and the caps hold in every pack. Default is `bold-kinetic`.

| Pack | Cards | Type | Energy |
|---|---|---|---|
| **`bold-kinetic`** *(default)* | hook + CTA, punchy pop-in | heaviest weight (800–900) | 2–3 punch-ins, swooshes, snappy transitions |
| **`clean-minimal`** | fewest possible — hook + CTA only, gentle fade | lighter weight, more padding, more air | 1–2 punch-ins, one soft SFX, soft dissolves |
| **`data-rich`** | favours the optional **stat card**; numbers get their own moment; a touch more long-form emphasis pop-ups | heavy, numerals prominent | punch-ins land on the stats |
| **`cinematic`** | sparing, elegant, slow fade | condensed, refined | slow dissolves, minimal SFX, fewer punch-ins, slightly richer grade |

These align with the named caption looks in `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md` — keep a agent's card pack and caption look in the same family.

## OFF THE FACE — how (FORMAT-AWARE; this is the rule that kept getting broken)

**Never assume a zone — LOOK first.** Before placing any card, extract one frame of the actual footage (free — costs no credits) and see where the speaker really sits. The safe zone is different for vertical and horizontal, and it changes with how the agent framed themselves. Placing by habit is what put a card across a real client's eyes.

### VERTICAL 9:16 (reels)
The head sits **HIGH**, but there is usually a sliver of room above it.
- **Default: pin the card to the extreme TOP edge, above the hairline** — just inside the top ~8–10% platform-chrome margin (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md` is canonical for the vertical safe zones). *Tested and working.*
- **Or time it over a B-roll moment** (no face on screen — the safest option in any format).
- Captions own the bottom (≈0.82–0.86) — a card must never collide with them.
- **Stay inside the vertical safe zones**: out of the right ~12% icon rail and the top/bottom UI bars; **centre-align, never flush-right** — widen a panel by shrinking the text, not by pushing into the rail.

### HORIZONTAL 16:9 (long-form YouTube)
⚠️ **The top is usually NOT available — do not default to it.** On a 16:9 talking head the speaker's head routinely reaches or nearly reaches the top of frame. Pinning "above the hairline" here is exactly what landed a card across a real client's eyes in live testing.
- **Default: the LOWER THIRD — vertical centre ~75–80% down.** Below the chin, above the bottom ~10% (YouTube's player controls and progress bar appear there on hover). *This is the tested-working zone.*
- **Use the width.** 16:9 gives you lots of horizontal room — prefer **ONE wide line** over two stacked lines. It reads better and it dodges the overflow trap.
- **If the speaker is framed off-centre** (sitting left or right in frame), the empty side is an excellent card zone — use it.
- **The vertical safe zones do NOT apply.** There is no icon rail on a YouTube 16:9 video — don't shrink a card to dodge a rail that isn't there. The only margin that matters is the bottom ~10% player chrome.
- **Or time it over a B-roll cutaway** — still the safest option.

### Both formats
- **Never** over the face. **Never** over the captions.
- **Frame-QA every card at full resolution** and confirm nothing touches the face (`final-check.md` blockers 7 and 12). Claude can't see the live render — verify on a frame, and the agent eyeballs it before posting.

## Be explicit with Descript

Out of the box Descript makes a small flat centred box (right on the face). Tell it exactly what to do every time: rounded brand panel, big size, weight 900, drop shadow, ~0.3s pop-in, and the **exact off-face position**. It won't do it on its own. **Spell out the typography too**: "one text object, all lines centre-aligned to each other and the panel, single spaces, tight even padding — never separate drifting text layers, and never a library template/layout (see the ban above)." Know the single-text-object limits (live-tested): **no per-word colour and no mixed sizes inside one object** — a card is one colour of text at one size, so design within that (the gold accent lives in the karaoke captions, not the card).

## Premium & minimal — and that's the point, not a compromise

A couple of strong, clean, on-brand cards + great karaoke captions + good B-roll = a premium-feeling reel. This is the deliberate, credit-smart, Descript-only look: clean and professional. (Fancier animated motion-design isn't a Descript capability — and that's fine; it's the agent's optional manual 20%, or simply out of scope.)
