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
- **Document:** `create_file` with **`contentMimeType: text/plain`** + `textContent`. The connector
  auto-converts `text/plain` into a clean Google Doc.
- **Find-or-create:** before creating the top folder or a campaign folder, list the parent and reuse it if
  it already exists. The funnel doc saves into the **same campaign folder** the magnet created.

## 4. Formatting — make the brief genuinely clean (within what actually converts)

**The hard constraint (verified — not a plugin limit):** the Drive connector only turns **`text/plain`** into a
Google Doc. `.docx`/HTML uploads don't convert; there's no API to add colour, fonts, or real headings. **A
Google Doc can only ever be well-structured text. The *designed* version is what the agent builds in
claude.ai/design — that's the premium output; this doc is the clean brief that feeds it.** So make the brief
genuinely clean and well-organized:
- **Title line**, a light **meta line** (agent · city · date), then **a one-line PURPOSE line** so the agent
  instantly knows what this is and what to do with it — e.g. *"Your page copy + a brief to build the page in
  claude.ai/design. The designed version is what you build there."* Then a blank line.
- **Section headers in ALL CAPS**, wrapped in a clean **box-drawing rule** `────────────` (U+2500) — NOT
  em-dashes; the solid line reads far cleaner. Use a **heavy rule** `════════════` (U+2550) only for the big
  structural break into the appendix.
- **Keep the deliverable clean; push the build-prompt + compliance to the END as a clearly-labelled appendix**
  (under a heavy `═` rule: `▸ NEXT — BUILD THIS IN CLAUDE.AI/DESIGN` and `▸ COMPLIANCE`). The reader should
  read the actual content top-to-bottom without tripping over instructions — it reads as a finished piece, not
  a mix of content + how-to.
- **Generous blank-line spacing**; **bullets** with `•`, one idea per line; real prices/numbers as digits so they pop.
- For the **funnel**, label each piece (`Headline:`, `Subhead:`, `CTA:`) so the agent can grab and paste — but
  keep labels minimal and the copy prominent.
- **No** Markdown (`#`, `**`, backticks) or tables — plain-text import mangles them. Caps, rules, spacing, bullets only.

## 5. The two document skeletons

**Lead Magnet doc** — the guide content (the agent builds the designed PDF in claude.ai/design):
```
LEAD MAGNET — [GUIDE NAME]
[Agent Name] · [City] · [Date]
Your guide content + a brief to build it in claude.ai/design. The designed PDF is what you build there.

────────────────────────────────────────────
THE PROMISE
What this guide delivers, in one or two lines · who it's for.

────────────────────────────────────────────
THE GUIDE   (page by page)
PAGE 1 — [title]
   •  ...the actual, genuinely useful content...
PAGE 2 — [title]
   •  ...
(5–9 pages of real value — never a tease)

────────────────────────────────────────────
HOW [AGENT] HELPS NEXT
A soft, no-pressure close in the agent's voice — where to reach them. (No call booking.)

════════════════════════════════════════════
▸ NEXT — BUILD THIS IN CLAUDE.AI/DESIGN
[paste-ready design prompt — layout + brand colours/fonts from brand-visual.md + which photos to upload]

════════════════════════════════════════════
▸ COMPLIANCE
[disclaimer + license # if the rule applies]
```

**Lead Capture Funnel doc** — the opt-in page copy, section by section:
```
LEAD CAPTURE FUNNEL — [GUIDE NAME]
[Agent Name] · [City] · [Date]   ·   Sells: [the magnet above]
Your page copy + a brief to build the page in claude.ai/design. The designed page is what you build there.

────────────────────────────────────────────
SECTION 1 — HERO
Headline: ...        (= the magnet's promise)
Subhead: ...
CTA button: "Send me the free guide"

────────────────────────────────────────────
SECTION 2 — ABOUT [AGENT]
What makes them amazing: ...
Wins / proof: ...
Their process: ...

────────────────────────────────────────────
SECTION 3 — THE LOCAL MARKET (your communities)
Communities I serve: ...   (real areas/neighbourhoods from market.md, by name)
What's distinct (facts): ...   (price bands, new-build communities, schools by name, commute — no FH proxies)
Why my local depth matters to you: ...

────────────────────────────────────────────
SECTION 4 — WHY WORK WITH [AGENT]  (offer + USP)
What I offer: ...   (the real services, as outcomes — from offer.md)
My USP / why me: ...   (what I do differently, tied to your fear)
The transformation: ...
Proof: ...

────────────────────────────────────────────
SECTION 5 — THE OPT-IN
What you'll get:
   •  ...   (matches the guide's pages exactly)
Form: Name + Email
Reassurance: Free. Instant. No spam.
CTA button: "Send me the free guide"
Thank-you state: ...

════════════════════════════════════════════
▸ NEXT — BUILD THIS IN CLAUDE.AI/DESIGN
[paste-ready design prompt — page layout, section order, brand colours/fonts]
📷 Upload these photos in the chat:  community/area shots → Local Market · headshot → About ·
   guide cover → hero · logo → header/footer.   (Real places only.)
Host it: build the page in claude.ai/design, then publish on your site / GoHighLevel / Carrd.

════════════════════════════════════════════
▸ COMPLIANCE
[disclaimer + license # if the rule applies]
```

## 6. The save flow
1. Build the doc text following §4–§5.
2. Find-or-create `[Agent Name] — Lead Capture System/` then the campaign folder `YYYY-MM-DD · [Guide Name]/`.
   (The funnel saves into the same campaign folder the magnet made.)
3. Create the Google Doc with the §2 name (`text/plain`).
4. Confirm in plain language + give the location:
   *"Saved to your Drive → Lead Capture System → [campaign]. Here's the doc: [link]."*

Deliver the copy in chat too — the agent often pastes into claude.ai/design right away. The Drive docs are
the organized record they (and their VA) can always find.
