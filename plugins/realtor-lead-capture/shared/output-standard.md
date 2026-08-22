# Output Standard — saving the lead magnet + funnel to the workspace, organized + well formatted

Both documents land in the agent's cloud workspace (Google Drive **or** OneDrive — the same place their Brain
lives), in one campaign folder, named consistently, and formatted so they look genuinely good. When a skill
says "save to the workspace (output standard)," it means this.

Two non-negotiables: **(1) the magnet and its funnel live together in one campaign folder; (2) each doc is
clean and scannable — never a wall of text.**

---

## 1. Where it goes — the workspace folder structure

Both docs live in the agent's workspace under **`03 · Content/Guides/`** (the Brain's drive map assigns lead
magnets and guides there) — one dated campaign folder per magnet, so a magnet and the funnel that gives it
away always sit together:

```
[Workspace]/                                   (located by ID — see §3)
└── 03 · Content/
    └── Guides/
        └── 2026-08-21 · Moving to Calgary Guide/      (one campaign — created when the magnet is built)
              ├── Lead Magnet — Moving to Calgary Guide.docx          (built first)
              └── Lead Capture Funnel — Moving to Calgary Guide.docx  (built second, sells the magnet)
```

A "campaign" = one magnet (relocation first; brand-led or audience-specific after) + the one funnel that
markets it. Build several over time — each gets its own dated folder. Find-or-create; never duplicate a
folder. **Legacy:** if an older `[Agent Name] — Lead Capture System/` folder exists at the Drive root, read
its campaigns too (resume detection) but create new campaigns under `03 · Content/Guides/`; never move the old ones.

## 2. Naming convention (use everywhere — no exceptions)

| Thing | Pattern | Example |
|---|---|---|
| Campaign folder | `YYYY-MM-DD · [Guide Name]` | `2026-08-21 · Moving to Calgary Guide` |
| Lead magnet doc | `Lead Magnet — [Guide Name]` | `Lead Magnet — Moving to Calgary Guide` |
| Funnel doc | `Lead Capture Funnel — [Guide Name]` | `Lead Capture Funnel — Moving to Calgary Guide` |

Guide Name = 2–5 plain words (Title Case). The date is the build date (ISO, so folders sort on their own).
The two docs share the same Guide Name so the pair is unmistakable.

## 3. How to create folders + docs (the agent's storage connector)
- **Which connector:** read `Storage provider` from `~/realtor-brain/config.md` — `google` → the Google Drive
  connector; `microsoft` → the Microsoft 365 / OneDrive connector. If it says `READ-ONLY (org-gated)`, don't
  attempt the save — deliver in chat and say once, plainly, that their admin needs to enable write access.
- **Locate the workspace the way realtor-brain-sync does:** `config.md → Workspace folder ID` when present
  (IDs survive renames — always locate by ID, never by name), else the sync skill's locate ladder. Then
  find-or-create `03 · Content` → `Guides` → the campaign folder inside it.
- **Folder (Google):** `create_file` with `mimeType: application/vnd.google-apps.folder` and the right
  `parentId`; capture the returned `id` to use as the parent for what goes inside it. (Microsoft: the
  connector's create-folder call under the same path.)
- **Document:** write the structured text to a temp file, then render it to a styled `.docx` and upload that:
  `python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "[Doc Name].docx" --title "[Title]" --subtitle "[Agent · City]"`,
  then upload the resulting **`.docx`** into the campaign folder. The structured text is only the
  renderer's input; the deliverable is the `.docx` — **never upload the raw text.**
- **Find-or-create:** before creating any folder, list the parent and reuse it if it already exists. The
  funnel doc saves into the **same campaign folder** the magnet created.

## 4. Formatting — the renderer makes it a clean, formatted `.docx`

The skill writes the **structured text** below; the shared renderer (`render_doc.py`) turns it into a clean,
formatted Word doc — real headings, bullet lists, light-grey rules — in **one neutral house style** (Arial,
pure-black text, no colour, no per-client branding). *(If `python-docx` is missing: `pip install python-docx`
ONCE; if that's not possible, build the same `.docx` with the **docx skill** ONCE, matching that look; if that
also fails, STOP — the copy in chat is the deliverable, say so plainly, never upload the raw text and never
retry installs in a loop.)* Write the structured text like this:
- **Title line**, a light **meta line** (agent · city · date), then **a one-line PURPOSE line** so the agent
  instantly knows what this is and what to do with it — e.g. *"Your page copy + structure, ready for your
  design step. This doc is the words; the page is built separately."* Then a blank line.
- **Section headers in ALL CAPS**, each wrapped by a divider rule (`────────────────────────────────────────────`).
  The appendix headings keep a `════════════════════════════════════════════` rule by convention (it reads as
  the "big break" in the source; the renderer styles both rules the same way). *(The renderer turns the
  ALL-CAPS bands into real headings.)*
- **Keep the deliverable clean; push the handoff + compliance to the END as a clearly-labelled appendix**
  (`▸ NEXT — HAND TO YOUR DESIGN STEP` and `▸ COMPLIANCE`). The reader goes top-to-bottom without tripping over
  instructions. **No design prompt — that's a separate skill;** the appendix just names the assets to gather.
- **Generous blank-line spacing**; **bullets** with `•`, one idea per line; real prices/numbers as digits.
- For the **funnel**, label each piece (`Headline:`, `Subhead:`, `CTA:`) on its own line — the renderer bolds the labels.

## 5. The two document skeletons

**Read the skeletons right:** `...` is where your copy goes. Any note in parentheses that names a Brain file,
says "only if / else delete / skip," or gives a count or a quality reminder is guidance for YOU — it is never
written into the doc. Band headings (the ALL-CAPS line after a rule) carry only the words shown. A section
marked conditional is either fully written or entirely absent — never a placeholder line.

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
(5–9 body pages of real value — the relocation guide is 7 — never a tease. Keep each page-title line in that
exact `── PAGE N - TITLE ──` form — a short title of plain words with the hyphen separator (`?`, `:` and `&`
are fine) and keep the text between the dashes under 70 characters — any longer and the renderer prints the
dashes literally as body text instead of making a subheading.)

────────────────────────────────────────────
HOW [AGENT] HELPS NEXT
A soft, no-pressure close in the agent's voice — where to reach them. (No call booking, no booking link.)

════════════════════════════════════════════
▸ NEXT — HAND TO YOUR DESIGN STEP
This doc is the guide content. Your design step — the Lead Magnet Designer skill in your Claude Design
Brand HQ — turns it into the branded PDF (upload this doc there, or let it read it from Drive).
Assets to gather:  logo · headshot · any photos for the guide.

════════════════════════════════════════════
▸ COMPLIANCE
The brokerage disclaimer + licence line, verbatim from compliance.md.   (ONLY when compliance.md is FILLED —
missing / empty / [bracketed] placeholder → omit this whole block; never paste a bracket token.)
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
CTA button: "Grab Your Free Guide"

────────────────────────────────────────────
SECTION 2 — THE PROBLEM
The fear, named: ...   (the reader's most acute fear, in their words — avatars.md, or the magnet's framing page + intake for the relocation guide)
What it costs to get wrong: ...
There's a better way: ...   (one line that bridges into the guide)

────────────────────────────────────────────
SECTION 3 — THE GUIDE  (what's inside + value · mockup left or right)
[ guide mockup / cover sits LEFT or RIGHT of this stack ]
What you'll get:
   •  ...   (4–7 concrete outcomes, one per guide page — never teases)
Why it's worth more than free: ...
CTA button: "Grab Your Free Guide"   (mid-page repeat)

────────────────────────────────────────────
SECTION 4 — ABOUT [AGENT]  (WHO they are)
What makes them amazing: ...
Why I'm qualified: ...   (one credibility line — testimonials live in Proof)
My process: ...   (3 steps max)
Welcome video: 30–60s, sits LEFT or RIGHT — optional; leave it out at the design step if there's no clip
   Talking outline (spoken voice): (1) who I am + who I help  (2) what the guide gives you  (3) "grab it below" — no pitch

────────────────────────────────────────────
SECTION 5 — WHY WORK WITH [AGENT]  (the OFFER + USP)
What I offer: ...   (the real services, as outcomes — from offer.md)
My USP / why me: ...   (what I do differently, tied to your fear)
The transformation: ...

────────────────────────────────────────────
SECTION 6 — THE LOCAL MARKET (your communities)
Communities I serve: ...   (the SAME communities the guide features, by name — from the magnet doc)
What's distinct (facts): ...   (price bands, what's being built, schools by name, commute, the honest trade-off — the place, never the people)
Why my local depth matters to you: ...

────────────────────────────────────────────
SECTION 7 — PROOF / RESULTS
Testimonials / results: ...   (2–4, real only from proof.md — name · situation · outcome)
The numbers: ...   (homes sold, $ saved, years in the niche)
Tied to your fear: ...
Proof photo strip: 8–12 real photos, auto-scrolling horizontal strip (slow) — wins/keys · working with
   clients · in the community · testimonial moments. Skip it if fewer than ~6 usable photos.
Photo types for the strip: ...   (the kinds of photos to pull — the agent picks the files at the design step; real, theirs to use, client OK where faces show)

────────────────────────────────────────────
SECTION 8 — AS SEEN ON / FOLLOW ALONG   (socials + YouTube)
(ONLY if they have channels — else delete this whole section.)
Channels: ...   (real handles/links from profile.md / content-engine.md — YouTube, IG, TikTok…)
Follow for more free value: ...   (esp. YouTube; real follower counts if worth showing)
(Opt-in stays the primary CTA — these are secondary trust links, not a rival button.)

────────────────────────────────────────────
SECTION 9 — THE OPT-IN   (flow: button → pop-up → thank-you page)
Top 3 you'll get: ...   (quick recap — full stack is in §3)
Mini-FAQ (3 one-liners, agent's voice):
   •  Is this a sales pitch?: ...
   •  Will I get spammed?: ...
   •  I'm not ready yet — is this for me?: ...   (relocation: "I haven't even decided if I'm moving")
CTA button: "Grab Your Free Guide"

THE OPT-IN POP-UP   (every CTA button on the page opens this)
Pop-up headline: ...   (the promise in one line)
Form: First name · Email · Phone
Contact line: ...   (one honest sentence under Phone — what the agent will do with it, from operations.md)
Reassurance: Free. Instant. No spam — unsubscribe anytime.
Submit button: "Grab Your Free Guide"

THE THANK-YOU PAGE   (where submitting lands)
Confirmation: ...   (warm, in the agent's voice)
Download button: ...   (the DIRECT LINK to the guide PDF — an INSTANT DOWNLOAD, NEVER "check your inbox" / email delivery)
Where to find me: ...   (one soft line — social handles / website; never the booking link, no call booking)
Footer: the same disclaimer + licence line as the page   (only when compliance.md is filled)

════════════════════════════════════════════
▸ NEXT — HAND TO YOUR DESIGN STEP
This doc is the copy + structure. Your design step — the Sales Funnel Pages skill in your Claude Design
Brand HQ — builds the page from these exact sections and takes it live on Netlify (upload this doc and
the magnet doc there, or let it read them from Drive); or host it yourself (your site / GoHighLevel / Carrd).
Assets to gather:  guide mockup/cover (The Guide §3, left/right) · 8–12 proof-strip photos (Proof §7 —
   wins, clients, community, testimonial moments) · community/area photos (Local Market) · headshot (About) ·
   30–60s welcome video (About §4, if filming one — outline's in the section) ·
   social/channel handles (Socials, if used) · logo (header/footer) · the finished guide PDF uploaded
   somewhere linkable (the thank-you page's download button points at it).   Real places + real photos only.

════════════════════════════════════════════
▸ COMPLIANCE
The brokerage disclaimer + licence line, verbatim from compliance.md.   (ONLY when compliance.md is FILLED —
missing / empty / [bracketed] placeholder → omit this whole block; never paste a bracket token.)
```

## 6. The save flow
1. Build the doc's structured text following §4–§5; write it to a temp file (e.g. `/tmp/doc.txt`).
2. Locate the workspace (§3), then find-or-create `03 · Content/Guides/` and the campaign folder
   `YYYY-MM-DD · [Guide Name]/`. (The funnel saves into the same campaign folder the magnet made.)
3. **Render** the text to a styled `.docx` via `${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py` (§3), then upload
   that `.docx` with the §2 name into the campaign folder. Read the finished `.docx` back once: no literal
   `────` lines as body text, every band a heading.
4. Confirm in plain language + give the location:
   *"Saved to your workspace → Content → Guides → [campaign]. Here's the doc: [link]."*
5. **If the folder, render, or upload fails** (an error, a missing connector, a write-gated Microsoft
   workspace): retry once. Still failing → say plainly, in one line — *"Your copy's all here in the chat; I
   couldn't save it to your workspace just now, so copy it somewhere safe or paste it straight into your
   design step."* — and **keep going** (compliance pass, hand-off). Never loop on retries, never upload the
   raw text, never treat a failed save as a failed build. The funnel can read the magnet from chat or from the
   agent pasting it if the doc isn't in the workspace.

Deliver the copy in chat too — the agent often takes it straight to their design step. The Drive docs are
the organized record they (and their VA) can always find.
