# Output Standard — saving the lead magnet + funnel to Drive, organized + well formatted

Both documents land in the agent's Google Drive, in one campaign folder, named consistently, and formatted
so they look genuinely good. When a skill says "save to Drive (output standard)," it means this.

Two non-negotiables: **(1) the magnet and its funnel live together in one campaign folder; (2) each doc is
clean and scannable — never a wall of text.**

---

## 1. Where it goes — the Drive folder structure

The agent's lead-capture work lives in its own library folder (parallel to the YouTube and Short-Form
folders). One folder per campaign, so a magnet and the funnel that gives it away always sit together:

```
[Agent Name] — Lead Capture System/
└── 2026-06-13 · New-Build Buyer Guide/          (one campaign — created when the magnet is built)
      ├── Lead Magnet — New-Build Buyer Guide      (Doc — built first)
      └── Lead Capture Funnel — New-Build Buyer Guide   (Doc — built second, sells the magnet)
```

A "campaign" = one magnet (brand-led or audience-specific) + the one funnel that markets it. Build several over time (a buyer
campaign, a seller campaign) — each gets its own dated folder. Find-or-create; never duplicate a folder.

## 2. Naming convention (use everywhere — no exceptions)

| Thing | Pattern | Example |
|---|---|---|
| Campaign folder | `YYYY-MM-DD · [Guide Name]` | `2026-06-13 · New-Build Buyer Guide` |
| Lead magnet doc | `Lead Magnet — [Guide Name]` | `Lead Magnet — New-Build Buyer Guide` |
| Funnel doc | `Lead Capture Funnel — [Guide Name]` | `Lead Capture Funnel — New-Build Buyer Guide` |

Guide Name = 2–5 plain words (Title Case). The date is the build date (ISO, so folders sort on their own).
The two docs share the same Guide Name so the pair is unmistakable.

## 3. How to create folders + docs (Cowork Google Drive connector)
- **Folder:** `create_file` with `mimeType: application/vnd.google-apps.folder` and the right `parentId`;
  capture the returned `id` to use as the parent for what goes inside it.
- **Document:** write the structured text to a temp file, then render it to a styled `.docx` and upload that:
  `python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "[Doc Name].docx" --title "[Title]" --subtitle "[Agent · City]"`,
  then `create_file` the resulting **`.docx`** into the campaign folder. The structured text is only the
  renderer's input; the deliverable is the `.docx`.
- **Find-or-create:** before creating the top folder or a campaign folder, list the parent and reuse it if
  it already exists. The funnel doc saves into the **same campaign folder** the magnet created.

## 4. Formatting — the renderer makes it a clean, formatted `.docx`

The skill writes the **structured text** below; the shared renderer (`render_doc.py`) turns it into a clean,
formatted Word doc — real headings, bullet lists, light-grey rules — in **one neutral house style** (Arial,
pure-black text, no colour, no per-client branding). *(If `python-docx` is unavailable, build the same `.docx`
with the **docx skill**, matching that look.)* Write the structured text like this:
- **Title line**, a light **meta line** (agent · city · date), then **a one-line PURPOSE line** so the agent
  instantly knows what this is and what to do with it — e.g. *"Your page copy + structure, ready for your
  design step. This doc is the words; the page is built separately."* Then a blank line.
- **Section headers in ALL CAPS**, each wrapped by a divider rule (`────────────────────────────────────────────`);
  use a **heavy rule** (`════════════════════════════════════════════`) for the big break into the appendix.
  *(The renderer turns these into real headings.)*
- **Keep the deliverable clean; push the handoff + compliance to the END as a clearly-labelled appendix**
  (`▸ NEXT — HAND TO YOUR DESIGN STEP` and `▸ COMPLIANCE`). The reader goes top-to-bottom without tripping over
  instructions. **No design prompt — that's a separate skill;** the appendix just names the assets to gather.
- **Generous blank-line spacing**; **bullets** with `•`, one idea per line; real prices/numbers as digits.
- For the **funnel**, label each piece (`Headline:`, `Subhead:`, `CTA:`) on its own line — the renderer bolds the labels.

## 5. The two document skeletons

**Lead Magnet doc** — the guide content (the designed PDF is built separately at the design step):
```
LEAD MAGNET — [GUIDE NAME]
[Agent Name] · [City] · [Date]
Your guide content, ready for your design step. This doc is the words; the PDF is built separately.

────────────────────────────────────────────
THE PROMISE
What this guide delivers, in one or two lines · who it's for.

────────────────────────────────────────────
THE GUIDE   (page by page)
── PAGE 1 - [TITLE] ──
   •  ...the actual, genuinely useful content...
── PAGE 2 - [TITLE] ──
   •  ...
(5–9 pages of real value — never a tease. Keep each page-title line in that exact `── PAGE N - TITLE ──`
form — a short title of plain words (a few words, ~30 characters max, no punctuation), hyphen separator —
so the renderer makes it a real subheading.)

────────────────────────────────────────────
HOW [AGENT] HELPS NEXT
A soft, no-pressure close in the agent's voice — where to reach them. (No call booking.)

════════════════════════════════════════════
▸ NEXT — HAND TO YOUR DESIGN STEP
This doc is the guide content. Your design step turns it into the branded PDF.
Assets to gather:  logo · headshot · any photos for the guide.

════════════════════════════════════════════
▸ COMPLIANCE
[disclaimer + license # if the rule applies]
```

**Lead Capture Funnel doc** — the opt-in page copy, section by section:
```
LEAD CAPTURE FUNNEL — [GUIDE NAME]
[Agent Name] · [City] · [Date]   ·   Sells: [the magnet above]
Your page copy + structure, ready for your design step. This doc is the words; the page is built separately.

────────────────────────────────────────────
SECTION 1 — HERO
Headline: ...        (= the magnet's promise)
Subhead: ...
CTA button: "Get my free guide"

────────────────────────────────────────────
SECTION 2 — THE PROBLEM
The fear, named: ...   (the avatar's most acute fear, in their words — from avatars.md)
What it costs to get wrong: ...
There's a better way: ...   (one line that bridges into the guide)

────────────────────────────────────────────
SECTION 3 — THE GUIDE  (what's inside + value · mockup left or right)
[ guide mockup / cover sits LEFT or RIGHT of this stack ]
What you'll get:
   •  ...   (4–7 concrete outcomes, one per guide page — never teases)
Why it's worth more than free: ...
CTA button: "Get my free guide"   (mid-page repeat)

────────────────────────────────────────────
SECTION 4 — ABOUT [AGENT]  (WHO they are)
What makes them amazing: ...
Why I'm qualified: ...   (one credibility line — testimonials live in Proof)
My process: ...   (3 steps max)

────────────────────────────────────────────
SECTION 5 — WHY WORK WITH [AGENT]  (the OFFER + USP)
What I offer: ...   (the real services, as outcomes — from offer.md)
My USP / why me: ...   (what I do differently, tied to your fear)
The transformation: ...

────────────────────────────────────────────
SECTION 6 — THE LOCAL MARKET (your communities)
Communities I serve: ...   (real areas/neighbourhoods from market.md, by name)
What's distinct (facts): ...   (price bands, new-build communities, schools by name, commute — no FH proxies)
Why my local depth matters to you: ...

────────────────────────────────────────────
SECTION 7 — PROOF / RESULTS
Testimonials / results: ...   (2–4, real only from proof.md — name · situation · outcome)
The numbers: ...   (homes sold, $ saved, years in the niche)
Tied to your fear: ...

────────────────────────────────────────────
SECTION 8 — AS SEEN ON / FOLLOW ALONG   (socials + YouTube)
(ONLY if they have channels — else delete this whole section.)
Channels: ...   (real handles/links from profile.md / content-engine.md — YouTube, IG, TikTok…)
Follow for more free value: ...   (esp. YouTube; real follower counts if worth showing)
(Opt-in stays the primary CTA — these are secondary trust links, not a rival button.)

────────────────────────────────────────────
SECTION 9 — THE OPT-IN
Top 3 you'll get: ...   (quick recap — full stack is in §3)
Form: Name + Email
Reassurance: Free. Instant download. No spam.
CTA button: "Get my free guide"
Thank-you state: ...   (warm confirmation + the guide as an INSTANT DOWNLOAD on this page — NEVER "check your inbox" / email delivery)

════════════════════════════════════════════
▸ NEXT — HAND TO YOUR DESIGN STEP
This doc is the copy + structure. Your design step turns it into the built page; then host it
(your site / GoHighLevel / Carrd).
Assets to gather:  guide mockup/cover (The Guide §3, left/right) · community/area photos (Local Market) ·
   headshot (About) · social/channel handles (Socials, if used) · logo (header/footer).   Real places only.

════════════════════════════════════════════
▸ COMPLIANCE
[disclaimer + license # if the rule applies]
```

## 6. The save flow
1. Build the doc's structured text following §4–§5; write it to a temp file (e.g. `/tmp/doc.txt`).
2. Find-or-create `[Agent Name] — Lead Capture System/` then the campaign folder `YYYY-MM-DD · [Guide Name]/`.
   (The funnel saves into the same campaign folder the magnet made.)
3. **Render** the text to a styled `.docx` via `${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py` (§3), then upload
   that `.docx` with the §2 name into the campaign folder.
4. Confirm in plain language + give the location:
   *"Saved to your Drive → Lead Capture System → [campaign]. Here's the doc: [link]."*

Deliver the copy in chat too — the agent often takes it straight to their design step. The Drive docs are
the organized record they (and their VA) can always find.
