# Business Brain Book — the canonical chapter contract

*Supersedes `shared/brain-doc.md`. When any skill (Setup Step 7.4, "show me my Brain", post-Business-Plan
refresh, brain-health) builds or regenerates the master Brain document, THIS file is the contract.
`brain-doc.md`'s rules are all preserved here — nothing in it is weakened, everything in it is extended;
where Setup Step 7.4 already superseded an older `brain-doc.md` detail (the 📕 Business Brain Book name,
the word gate), Step 7.4's ruling is the one carried forward.*

The **📕 Business Brain Book** is the flagship deliverable of the whole system — the one document that
proves, in the agent's hands, what they paid for. It is a **premium render of the Brain's identity files
plus a researched strategic analysis of their market**: part identity dossier, part market-intelligence
report, part consultant's strategy memo. It is also **the "AI Brain file"** every Claude Design skill asks
the agent to upload — one doc, everywhere.

Two identities it must never lose:
1. **It is a RENDER, never a source.** The markdown files in `identity/` and `memory/` stay the source of
   truth. Everything in the Book must exist in a brain file first — including the research and the
   strategic synthesis, which are **written back to brain files before rendering** (see the pipeline).
   The Book is always rebuildable from the Brain; it never drifts, and it never holds facts the Brain doesn't.
2. **It is the product.** Agents pay a premium; the Book must read like a strategist built it for them
   personally — long, specific, researched, and impossible to mistake for anyone else's book.

---

## Non-negotiable invariants (carried forward — never weaken any)

- **Build ONLY via `shared/render_doc.py`** per `shared/doc-formatting.md` (fallback chain: `pip install
  python-docx` → the docx skill matching the same look → **never** "just upload the text"). Use
  `--eyebrow "Realtor AI Brain"`, `--title`, `--subtitle "[Agent] · [City]"`. Never hand-write document XML.
- **Upload the rendered `.docx`, never the raw structured text.** Literal `════`/`────` lines visible as
  text in Drive = the renderer's *input* was uploaded = FAILED delivery; re-render and re-upload.
- **Name:** **"📕 [Agent]'s Business Brain Book — [YYYY-MM-DD]"** — emoji + the words "Business Brain
  Book" + ISO date. Dated regenerations never collide; **newest = current**. Same name pattern on EVERY
  regeneration — refresh, don't fork. *(This is Setup Step 7.4's mandated name — for this one document it
  overrides `doc-formatting.md`'s generic `[Deliverable] · [Subject] · [Date]` naming scheme.)*
- **Save to the workspace's `01 · AI Brain/`** (legacy brains: `Realtor AI Brain → exports`), then push
  via `realtor-brain-sync`.
- **Hand the agent the DIRECT LINK to the Book itself** — never just the folder: *"Your Business Brain
  Book is in your workspace → 01 · AI Brain — here's the direct link. This is your business bible."*
- **Render the FULL content of every identity file — never summarize, never compress.** Rich brain +
  thin render = FAILED render. 15+ pages is normal and welcome; never compress to fit a page count.
- **Restructure, don't append** (Market chapter): the agent's community list must BECOME the
  per-community sub-sections — a one-bullet-per-community list surviving anywhere is a FAILED render.
- **Research-on-render backfill:** if the underlying brain file is thin for any researched chapter, run
  the research NOW — during this build or any regenerate — **write it back to the brain file first**,
  then render.
- **Per-community sub-sections + 2–4 adjacent communities** the agent didn't name, marked "adjacent".
- **Tables via pipe rows** for anything tabular (KPI dashboards, brand colours + roles, price bands,
  avatar-at-a-glance, money math). Prose where prose persuades; structure where structure clarifies —
  never walls of plain paragraphs.
- **Byline once** (title block) — never repeat the full credential line in the Snapshot or elsewhere.
- **No raw markup:** any `<w:` in the extracted text = corrupt build = rebuild.
- **Never fabricate** — no invented voice samples, stories, testimonials, or statistics. This invariant
  is expanded into the **GROUNDING LAWS** below — all seven bind every build and every regenerate. **Every
  researched number carries its source + as-of date** ("researched [Month YYYY], [source]"). These
  numbers flow into published content and on-camera scripts — **an unsourced stat in published content
  is a compliance incident, not a shortcut.** Can't verify it? Write what you verified, omit the rest,
  and say so.
- **Written FOR the agent** — second person, warm, clear headings, genuinely useful as a reference
  (identity files are third-person for Claude; the Book converts the voice).
- **Never narrate a failed render or the retry to the agent** — they only ever see the finished Book.
- **Placeholder behavior for unbuilt sections is unchanged** (see Placeholders below).

---

## GROUNDING LAWS — zero fabrication, true to THIS agent

Why this section exists: agents in other tools got books naming the **wrong competitor**, claiming
**neighbourhoods they don't serve**, in a voice that **doesn't sound like them**. Any one of those in a
premium deliverable is a refund-level error. These laws bind every build and every regenerate, and they
outrank style, length, and word targets: a Book that misses a word range is thin; a Book that breaks a
grounding law is wrong.

1. **Geography lock.** Only communities/neighbourhoods the agent themselves named or confirmed appear
   as THEIR areas — anywhere in the Book. Research may add adjacent communities ONLY in Chapter 6
   (Chapters 7–9 may reference an adjacent once it's introduced there), capped at the contract's 2–4,
   each explicitly labeled "adjacent" / expansion candidate, and only after verifying it actually
   borders the agent's stated city/region. On regenerate, a research refresh **REPLACES** the adjacent
   set — never grows it past 4; superseded adjacents retire from `market.md`. **Same-name-city guard:**
   every research query carries city + state/province ("Springfield, Illinois", never "Springfield");
   a result whose geography doesn't match the agent's market is discarded, never adapted.
2. **Competitor rule.** Name a competitor ONLY when research verified they actively serve this agent's
   market AND niche, with source + as-of date on the verification. Otherwise describe the landscape
   without names ("two established teams dominate [niche] in [city] as of [Month YYYY]"). **A missing
   name beats a wrong name** — a wrong competitor in a client deliverable is a refund-level error.
3. **Voice & identity fidelity.** Every claim about the agent — years, credentials, awards, story,
   philosophy, USP — traces to their interview answers or Brain files. Reuse their own phrasing
   wherever it exists. NEVER invent quotes, client anecdotes, testimonials, or stats about them. Where
   the Book paraphrases, it must still sound like `voice.md` / `voice-print.md`.
4. **Numbers.** Every figure is from their Brain (labeled as theirs) or from research (source + as-of
   date) — no third source, and no invented precision (a verified "the $400s" never becomes
   "$412,500"). Locale, currency, and units come from `config.md`.
5. **Uncertainty protocol.** Cannot verify → omit it, or mark it `[confirm: …]` inline for the agent.
   A wrong specific is worse than a gap; never fill silence with plausible detail. Markers go
   mid-sentence (never at line start), NEVER on researched numbers in Chapters 6–9 (omit those
   instead) — and more than 3 in the whole draft means the Brain isn't ready: capture the answers with
   the agent first, then render.
6. **Pre-render grounding audit** (pipeline step 6). Before rendering, enumerate every proper noun
   (community, competitor, school, employer, brokerage) and every number in the draft; trace each to a
   Brain file or a sourced research result; CUT anything untraceable. Trace the **PAIRING**, not just
   the noun — each fact verified in the context it's used (school↔community, employer↔metro): a real
   school attached to the wrong community fails the audit. And Brain-file provenance alone doesn't
   clear geography — re-verify city + state/province on every place-fact, so a wrong-city fact planted
   in a brain file earlier dies here instead of surviving because "it traces." If cuts drop a chapter
   below its word minimum, the owning brain file is thin: re-run that chapter's research mandate
   (pipeline step 2) — ONCE per chapter per build; if refreshed research still can't support the
   minimum, render the honest gap and what would fill it (the anti-fluff rule's honest-gap clause) —
   never pad, never loop on rebuild alone. Report the
   tally — "N facts traced, M cut" — to the agent in the hand-off message.
7. **Read-back check** (pipeline step 5). After assembly, re-read `identity/voice.md` +
   `voice-print.md` (if built) and confirm the Book's characterization of the agent matches those
   files; fix mismatches before rendering — ONE fix pass per build. A mismatch surviving it is flagged
   in the hand-off message, never re-fixed in a loop (`voice.md` and `voice-print.md` can legitimately
   differ — written voice vs spoken voice; don't ping-pong between them).

---

## DEMO BRAINS — explicitly fictional, for training + demos only

When the person in the session **explicitly asks for a fictional brain** — the words "demo", "mock",
"fake", "fictional", "test agent", "sample agent" in THEIR OWN request (a coach demoing for a cohort, a
test drive of the system) — the build runs in **demo mode**. Two conditions, both required:

- **The subject is fictional** — a named persona who is NOT the person in the session. Demo keywords
  aimed at their OWN identity or market ("mock something up for MY market", "let's just do a test run
  on my brain", "I'm kind of a test agent at my brokerage") are a REAL build — the grounding laws bind.
- **When there is ANY doubt who the subject is, ask the one question** — "Fictional demo agent, or
  your real Brain?" — before proceeding. An unambiguous fully-fictional framing (a named third-party
  persona + explicit demo/training intent) proceeds without asking.

In demo mode:

- **No live research.** Skip the research passes (pipeline step 2), the staleness rules, and the
  grounding audit's tracing entirely. Fill the researched chapters with plausible, clearly-labeled
  illustrative content instead — a demo build should take minutes, not research cycles.
- **Every number is tagged "(illustrative — demo)"** — and NEVER carries a fabricated source
  attribution. Putting "per [board], [Month YYYY]" on an invented number is exactly the compliance
  incident the grounding laws exist to prevent — demo or not.
- **No real competitor or vendor names.** Fictional names only ("the Lakeline team") — a demo must
  never put claims about a real person or business on a training screen.
- **Watermark it, unmissably:** filename **"📕 [Agent]'s Business Brain Book — DEMO — [YYYY-MM-DD]"**;
  eyebrow `Realtor AI Brain · Demo`; one meta line on the cover: *"Demo document — illustrative data,
  not researched."*
- **Total isolation from real Brains.** A demo scaffolds locally at `~/realtor-brain-demo/` and
  creates/pushes to its OWN workspace folder named **"[Workspace name] — DEMO"** (own marker, also
  demo-stamped) — NEVER into an existing real workspace. The demo Book saves inside that demo
  workspace only — never into a real `01 · AI Brain/`, and it is excluded from "newest = current":
  Claude Design's "upload your AI Brain file" must never be handed a demo Book by accident.
  Isolation cuts BOTH ways: a demo build never modifies, renames, retires, or "cleans up" anything
  outside its own workspace — not markers, not folders — multiple markers are expected (the demo
  stamp disambiguates; real sessions skip demo-stamped markers). Demo pushes are LIGHT: create the
  files, one folder-listing verify at the end — no per-file verification, housekeeping, or snapshots.
- **Every demo brain file opens with the banner line** `DEMO BRAIN — fictional agent, illustrative
  data — never publish.` — so ANY skill that ever reads the file (market update, YouTube scripts,
  listing kit, health, migrate) sees what it's holding before it quotes a single number.
- **Demo-to-real never converts.** "Love it — now build mine" starts a REAL build from a fresh
  template scaffold with every gate re-armed; demo files, demo answers, and demo mode's relaxations
  are never carried into a real build.
- **No placeholder chapters.** A demo Book renders all fifteen chapters FILLED — Chapters 13 and 14
  get illustrative content like everything else (a demo shows the finished product, and an
  almost-blank page on a training screen reads as broken).
- **Everything else holds at full strength:** the complete 15-chapter structure, the linked contents
  page, chapter bands, formatting gates, voice conversion — a demo shows the real product, just on
  fictional data. Word counts: the 3,000 absolute floor binds; the 4,400/5,000 bands are TARGETS in
  demo mode, not gates — never burn rebuild cycles padding fictional prose.
- **The demo marker travels with the BRAIN, not just the Book.** A demo build writes `Demo brain: yes`
  into `config.md` and keeps the "(illustrative — demo)" tags **inside the brain files themselves**
  (`market.md`, `market-intel.md`, `proof.md` …), so the label follows the data wherever it's quoted.
  Any build, regenerate, or skill that touches a brain whose `config.md` says `Demo brain: yes` STAYS
  in demo mode — research-on-render never fires on a demo brain, and real research is never mixed into
  a fictional identity. A real agent resuming setup on a brain marked demo is told plainly it's a demo
  brain and offered a fresh real setup — never a silent conversion.
- **Demo mode is NEVER inferred.** Thin answers, a rushed agent, "just fill it in", or "use defaults"
  do NOT trigger it — only the explicit fictional framing above does (and a `Demo brain: yes` already
  in `config.md`, which is that explicit request persisted). A real agent's Book never
  contains an illustrative number; when in doubt, it is a real build and the grounding laws bind.

---

## The build pipeline (run in this order, every build and every regenerate)

1. **Pull + read.** Sync the Brain (`realtor-brain-sync` PULL), then read every identity file that
   exists, plus `brain.md`, `memory/market-data.md` if present, and `shared/brand-doctrine.md`.
2. **Research pass — backfill the brain files FIRST.** Check each researched chapter's source file
   against its research mandate (below). For anything missing or stale (staleness windows in
   Regeneration rules): run the web research now, write it into the owning brain file
   (`identity/market.md` for market + outlook; `identity/market-intel.md` for competitive + search),
   with source + as-of date on every number. **Push the updated files before rendering — write → push →
   verify, as one atomic step per `realtor-brain-sync`** — an unsynced write is a lost write.
3. **Strategy synthesis — write `identity/strategy.md`.** Compose the Strategic Position analysis
   (Chapter 11 contract) from the captured brain + the now-current researched facts, and write/overwrite
   it to `identity/strategy.md` (already part of the Brain's scaffold). This keeps the Book rebuildable:
   even the analysis lives in the Brain, not only in the render. Push it (write → push → verify).
4. **Assemble the structured text** per the **Book structure** contract (below) — and ONLY that grammar
   (the renderer knows nothing else): the cover title block; the `[[TOC]] … [[/TOC]]` contents block;
   every PART and CHAPTER as a CAPS band (`PART I — …` / `CHAPTER N — TITLE`) wrapped in divider rules;
   **sub-headings inside chapters as sub-bands** (`──── Label ────` — one per community, per avatar, per
   Strategic-Position section); `•` bullets; numbered steps as `1.  …` lines; `Label:` lead-ins (e.g.
   testimonials, signature phrases, the compliance disclaimer); `>> ` lines for each chapter's 1–2
   key-insight callouts; pipe-row tables (optional `| --- |` separator); generous blank-line spacing.
   No Markdown `#`/`**`/backticks in the body.
5. **Read-back check** (Grounding Law 7). Re-read `identity/voice.md` + `voice-print.md` (if built) and
   confirm the draft's characterization of the agent — story, philosophy, phrasing, tone — matches those
   files. One fix pass; survivors are flagged in the hand-off message, not looped on.
6. **Pre-render grounding audit** (Grounding Law 6). Enumerate every proper noun (community, competitor,
   school, employer, brokerage) and every number in the draft; trace each — as the pairing it's used in —
   to a Brain file or a sourced research result; CUT anything untraceable. Keep the tally — "N facts
   traced, M cut" — for the hand-off message.
7. **Render** with `render_doc.py` to `.docx`. **Renderer stderr must show ZERO unresolved-TOC
   warnings** — a warning means a contents row and a chapter band don't match character-for-character:
   fix the structured text, re-emit, re-render (at most twice — it's a copy-paste alignment fix,
   never a rebuild).
8. **Verify** against the hard gate (below). FAIL → rebuild from the full brain-file contents and
   re-verify. Never upload a failed render.
9. **Upload to `01 · AI Brain/`, push, hand over the direct link** — with the grounding-audit tally
   ("N facts traced, M cut") in the hand-off message.

---

## Book structure — cover, contents, parts, chapters (the render grammar)

The Book must read and navigate like a real book, not a long memo. The renderer understands exactly this
grammar — emit it exactly; anything else renders as plain text.

**Page 1 — the cover.** The title block and nothing else:
- Eyebrow: `Realtor AI Brain` (pass `--eyebrow "Realtor AI Brain"` — the letter-spaced kicker).
- Title: `[Agent]'s Business Brain Book` (pass `--title`; no 📕 on the cover — the emoji lives in the
  filename).
- Byline: `--subtitle "[Agent] · [City]"`, with the full credential line as the meta line under it —
  this is the byline's ONE appearance (the byline-once invariant).
- Date: `[Month D, YYYY]` on its own meta line — the same date as the filename's ISO stamp.

**Page 2 — CONTENTS.** Immediately after the title/meta lines, emit one `[[TOC]] … [[/TOC]]` block —
the renderer builds a linked contents page (each row an internal link to its chapter's bookmark) and
page-breaks around it so CONTENTS is page 2. One row per chapter — all fifteen, in order — with the four
PART rows (no summary) grouping them:

[[TOC]]
PART I — WHO YOU ARE
CHAPTER 1 — SNAPSHOT :: [one line, written for THIS agent]
CHAPTER 2 — WHO YOU ARE :: [one line, written for THIS agent]
…
PART IV — EXECUTION
…
CHAPTER 15 — COMPLIANCE :: [one line, written for THIS agent]
[[/TOC]]

Each `::` summary is one line **written for that agent** — it names their actual niche, market,
community, or edge, pulled from the Brain. *"Why relocating tech families trust Sarah from Frisco to
Prosper — and what they're afraid of"* passes; *"An overview of the agent's target audience"* is a
FAILED contents page — the swap test applies to every row. The contents page alone must read like a book
about them. Row text left of `::` must match its chapter band **character-for-character** — that match
is what resolves the internal link (mismatch = unresolved-TOC warning on stderr = pipeline step 7 fails).

**PART and CHAPTER bands.** Every chapter heading is emitted as `CHAPTER N — TITLE` and every part as
`PART I — WHO YOU ARE` / `PART II — YOUR MARKET INTELLIGENCE` / `PART III — HOW YOU WIN` /
`PART IV — EXECUTION` — CAPS bands wrapped in divider rules, chapter numbers sequential 1–15 with no
gaps. The renderer gives these bands their eyebrow treatment, a page break before each, the bookmark
the contents page links to, and an outline level — so the converted Google Doc lists every part and
chapter in its outline sidebar, and navigation survives even where a viewer drops link conversion.
Sub-headings inside chapters stay sub-bands (`──── Label ────`).

**`>> ` callouts.** A line starting `>> ` renders as a shaded callout box. Each chapter surfaces its
**1–2 key insights** this way (placeholder chapters exempt) — the most decision-relevant, agent-specific
line in the chapter: a sourced fact plus what it means for them, or their own sharpest line. Where a
chapter already mandates a climax (Chapter 7's implications, Chapter 8's white space, Chapter 11's one
move), the callout carries the single sharpest one. Never more than two per chapter — a callout is a
spotlight, not a highlighter — and never generic advice (the swap test applies). Testimonials and
signature phrases keep their `Label:` lead-in treatment; `>> ` is reserved for insight.

**Tables** stay pipe rows, exactly where the chapter contract mandates them — the renderer shades the
header row itself; emit nothing extra.

---

## The chapter contract — four parts, fifteen chapters

The Book runs a deliberate arc: **who you are → the market you play in → how you win → what you do
about it.** Each PART opens with its CAPS band and a 2–4 sentence consultant-voiced bridge (what this
part establishes and why it feeds the next). Chapter headings are exact — emitted as `CHAPTER N — TITLE`
bands per the Book structure above — the verify gate checks all
fifteen, and the fifteen are a **strict superset of Setup Step 7.4's eleven required headings** (Snapshot
· Who You Are · Who You Serve · Your Market · Your Offer & USP · Your Voice & Proof · Your Brand
Direction · Your Content Plan · Your 90-Day Business Plan · How You Operate · Compliance), so any build
that passes this gate also passes Setup's. Word ranges are per-chapter minimums/targets for a fully
built brain; a placeholder chapter is exempt from its range but must still render its heading +
placeholder text.

| # | Chapter (CAPS band) | Source file(s) | Words | Researched? |
| --- | --- | --- | --- | --- |
| — | PART I — WHO YOU ARE | — | 40–80 bridge | no |
| 1 | SNAPSHOT | `brain.md` quick-ref | 100–150 | no |
| 2 | WHO YOU ARE | `identity/profile.md` | 200–350 | no |
| 3 | WHO YOU SERVE | `identity/avatars.md` | 500–900 | no |
| 4 | YOUR VOICE & PROOF | `voice.md` + `voice-samples.md` + `voice-print.md` + `proof.md` + `story-bank.md` | 400–700 | no |
| 5 | YOUR BRAND DIRECTION | `identity/brand-visual.md` | 200–350 | no |
| — | PART II — YOUR MARKET INTELLIGENCE | — | 40–80 bridge | — |
| 6 | YOUR MARKET | `identity/market.md` | 800–1,400 | yes |
| 7 | YOUR 12-MONTH MARKET OUTLOOK | `identity/market.md` (Outlook section) | 300–500 | yes |
| 8 | YOUR COMPETITIVE & CONTENT LANDSCAPE | `identity/market-intel.md` | 350–600 | yes |
| 9 | YOUR SEARCH & CONTENT OPPORTUNITY | `identity/market-intel.md` | 300–500 | yes |
| — | PART III — HOW YOU WIN | — | 40–80 bridge | — |
| 10 | YOUR OFFER & USP | `identity/offer.md` | 400–700 | no |
| 11 | YOUR STRATEGIC POSITION | `identity/strategy.md` (built step 3) | 400–700 | synthesis |
| — | PART IV — EXECUTION | — | 40–80 bridge | — |
| 12 | YOUR CONTENT PLAN | `identity/content-engine.md` | 250–450 | no |
| 13 | YOUR 90-DAY BUSINESS PLAN | `identity/business-plan.md` | 400–700 · placeholder OK | no |
| 14 | HOW YOU OPERATE | `operations.md` + `vendors.md` | 150–300 · placeholder OK | no |
| 15 | COMPLIANCE | `identity/compliance.md` | 150–250 | no |

**Total: target 5,000–6,500+ words for a complete brain** (chapter minimums plus the four Part bridges
sum to ~5,050 when everything is built). **The setup gate's 3,000 words remains the ABSOLUTE floor** —
below it the render fails regardless of state. A first-run Book (Business Plan + Operations still
placeholders) should land **≥ 4,400** (its minimums sum to ~4,500); if it doesn't, a rendered chapter is
thin — fix the chapter, never pad. Never compress.

### Chapter 1 — SNAPSHOT
The one-page "who is this agent" card. **Table** (pipe rows, Label | Value): name · market · niche ·
voice-in-one-line · primary CTA · booking link · socials · brand colours (hex). One prose line on how to
use the Book. **Byline rule:** the credential line lives in the title block only — do not repeat it here.

### Chapter 2 — WHO YOU ARE
Full `profile.md` content in prose: their path into real estate, brokerage, designations, years, focus,
property types. **Duo/team rule (kept):** when the Brain records a team, include the structure and the
full roster — each member's name · title · contact · licence # — as a **table** (the design suite reads
it for team branding).

### Chapter 3 — WHO YOU SERVE
Open with an **avatar-at-a-glance table**: | Avatar | Situation | Price band | Core fear | What they
want |. Then **one sub-band sub-heading per avatar**, each rendered IN FULL from `avatars.md`: their
situation, what's driving them, their fears and misconceptions in *their* words, what they need from an
agent, and how this agent specifically answers it. Every avatar in the file appears — skipping one is a
failed chapter. Prose per avatar; the table is the summary, never the substitute.

### Chapter 4 — YOUR VOICE & PROOF
Full tone rules (**bullets**), sounds-like / never-sound-like lists (**bullets**), signature phrases
each written as a **`Label:` lead-in line** with the phrase (the renderer bolds the label; the `>> `
shaded box is reserved for the chapter's key insights per the Book structure), spoken voice-print if
built, the writing samples from `voice-samples.md`, then proof:
testimonials as `Label:` lead-in quotes (verbatim, attributed as captured — never invented or
"improved"), stats with their provenance, and the story bank's stories written out in full.
If `voice-print.md` / `story-bank.md` aren't built, note in one friendly line how to add them ("say
'capture my speaking voice' / 'build my story bank'") — that line is not a placeholder chapter, the rest
still renders.

### Chapter 5 — YOUR BRAND DIRECTION
**Colour table**: | Colour | Hex | Role |. Fonts, logo direction, vibe/feel and tagline direction in
prose from `brand-visual.md` — in full. Keep the standing note: *take this chapter into Claude Design
(claude.ai/design) to build the actual visuals; the AI Video Editor reads these colours + fonts.*

### Chapter 6 — YOUR MARKET
The heart of Part II. **One sub-band sub-heading per community the agent named**, each merging **"what
you say"** (their positioning, verbatim — "your underrated pick") with **researched market intelligence**
(sourced), covering ALL of: current typical prices + how they've moved (source + as-of date) · who buys
there and why (buyer profile) · schools, amenities, commute · what's being built right now · the angle
(why it's interesting: growth, value, inventory). Then **2–4 adjacent communities** the agent didn't
name, same treatment, each marked "adjacent". Open the chapter with a **price-band table**: | Community |
Typical range | 12-mo move | Source · as-of |. **Restructure, don't append** (invariant): the community
list becomes these sub-sections — no one-line list survives. **Research mandate:** if `market.md` holds
one-liners for any community, research it now and write it back to `market.md` first (the
`realtor-brand-persona` Phase-4 research spec is the standard: prices+movement sourced+dated, buyer
profile, schools/amenities/commute, construction underway, the angle, adjacents).

### Chapter 7 — YOUR 12-MONTH MARKET OUTLOOK  *(new — strategic)*
Where their market is heading over the next 12 months, and what that means for THEIR niche
specifically. **Research mandate** (write back to a `## 12-Month Outlook` section of `market.md`):
mortgage-rate trajectory from named forecasters; the local board's / credible analysts' price and sales
forecasts for their metro; inventory trajectory; the construction/completion pipeline that will land
within 12 months; population/employment drivers. **Must appear:** a **table** of the key forecast
numbers (| Indicator | Current | 12-mo direction | Source · as-of |); prose on the trajectory; then
**3–5 "what this means for you" implications, each tied to a named niche/avatar AND a sourced fact**
(e.g. "completions in [community] double in Q2 [source, as-of] → your new-construction buyers gain
negotiating leverage — plan content on builder incentives"). Be honest about uncertainty — forecasts
are labeled as forecasts, disagreements between sources are stated, and nothing is presented as certain.
Anti-fluff rule applies (below).

### Chapter 8 — YOUR COMPETITIVE & CONTENT LANDSCAPE  *(new — strategic, researched)*
Who else serves this niche in this market, what their content presence looks like, and where the white
space is. **Research mandate** (write back to `identity/market-intel.md`): identify the visible
agents/teams serving the agent's market and niche; for each, what platforms they're actually active on,
what they publish, and how recently (as-of date); note the market's overall content saturation by
format (long-form YouTube, short-form, market updates, community tours). **Must appear:** a **table**
(| Who | Platform focus | What they publish | Last active (as-of) | The gap they leave |), prose on the
overall landscape, and a **"white space" sub-section**: 2–4 specific unclaimed positions this agent can
own, each justified by an observed gap + something the agent actually has (their edge, niche, or story).
**Honesty rules:** report only what was observed, with as-of dates; say plainly what couldn't be
verified ("no visible YouTube presence found as of [Month YYYY]" ≠ "they have no clients"); **never
disparage a named competitor or state anything about them beyond sourced, observable facts** — this
chapter is intelligence, not trash talk, and it may inform published content. If genuinely little can be
verified, say so and analyze the saturation level instead — an honest thin landscape is itself a finding
("nobody in [market] is visibly serving [niche] — that's the opportunity").

### Chapter 9 — YOUR SEARCH & CONTENT OPPORTUNITY  *(new — strategic, researched)*
What buyers and sellers in their market actually search — and how it maps onto their content pillars.
**Research mandate** (write back to `identity/market-intel.md`): the live query families for their
market ("moving to [city]", "living in [community]", "cost of living in [city] vs [feeder city]", "best
neighbourhoods in [city] for [avatar]", "[city] housing market forecast [year]", first-time-buyer /
program queries for their state/province, plus niche-specific families), what content currently answers
each, and where answers are weak or missing. **Must appear:** a **table** (| Query family | Demand
evidence (source · as-of) | Pillar it feeds | Example title in your voice |), and prose connecting the
findings to the **20% niche / 80% general doctrine** (labeled as doctrine, per `brand-doctrine.md`): the
broad, searched families are the 80% top-of-funnel; the niche families are the 20% that compounds — and
the AI-search belief (AI recommends what it can find) is why the niche families matter most. **Never
invent search-volume numbers** — where volume can't be verified, describe demand qualitatively and label
it ("consistently surfaced/autocompleted as of [Month YYYY]"). Example titles are written in the agent's
captured voice, ready to steal.

### Chapter 10 — YOUR OFFER & USP
The complete Why-Work-With-Me narrative from `offer.md`, in full: the offer, every guarantee
(**bullets**), the process (**numbered steps** — `1.  …` lines), and the USP with the reasoning behind
it. This is the client-facing argument, written out — persuasive prose, not a summary. (The standalone
client-ready guide remains available on demand; this chapter carries all of its substance.)

### Chapter 11 — YOUR STRATEGIC POSITION  *(new — the consultant's chapter)*
The synthesis: everything in Parts I–II pressed into an honest read of where this agent stands and what
to do about it. SWOT-grade rigor, consultant voice, zero horoscope. Written to `identity/strategy.md`
in pipeline step 3, then rendered. **Structure (each a sub-band sub-heading):**
- **Your edges — and how to press them.** 2–4 real advantages, each traced to something captured
  (their story, credential, niche, proof, or a researched market fact) — framed through A.G.E.N.T.
  (which pillar it strengthens) — with one concrete pressing move each.
- **Your gaps — and how to close them.** 2–4 honest gaps (a thin A.G.E.N.T. pillar, a missing proof
  system, a competitor owning their lane, no presence on the platform their avatar lives on), each with
  the specific closing move — usually a skill in this system, named ("build my story bank", the
  YouTube System, the Business Plan).
- **Your risks.** 2–3 real risks, each grounded in a sourced market fact (from Chapters 6–7) or a
  captured business reality (single lead source, single community concentration), with the hedge.
- **The one move.** One highest-leverage recommendation for the next 90 days, argued in a short
  paragraph from the above — and connected to the Business Plan chapter when it exists.
Prose throughout; no table required. Anti-fluff rule applies at full strength.

### Chapter 12 — YOUR CONTENT PLAN
Full `content-engine.md`: pillars (**bullets**, each with its one-line why), platforms, the cadence as a
**table** (| Day/Slot | Platform | Format/Series |), signature series, default video style. Then one
bridging paragraph tying each pillar to the search opportunities in Chapter 9 — the plan should visibly
answer the demand the research found. The 20/80 mix note appears here labeled as doctrine.

### Chapter 13 — YOUR 90-DAY BUSINESS PLAN
When built: the whole plan from `business-plan.md` with the math — the income target, the **money-math
table** (| Goal | Avg price | Commission | Deals needed |), where the deals come from, the **3 weekly
non-negotiables** (one is always content), and the **daily/weekly KPI dashboard table**. Never
summarize the math. When not built: the exact placeholder (below).

### Chapter 14 — HOW YOU OPERATE
When built: `operations.md` in full (hours, booking rules, communication preferences) + the vendor list
as a **table** (| Vendor | Role | Contact |). When not built: the exact placeholder (below).

### Chapter 15 — COMPLIANCE
`compliance.md` in full: the brokerage disclaimer **verbatim** under a clear `Label:` lead-in (this
exact text goes on published content), license display rules, the claims-to-avoid list (**bullets**),
fair-housing note, logo/co-brand rules. Skipped-and-flagged items render as flagged, never invented —
this chapter never guesses at legal text.

---

## `identity/market-intel.md` — the researched-intelligence file (new)

Owned by this spec's research pass (pipeline step 2); readable by any skill. Three sections:
`## Competitive Landscape` (Chapter 8's write-back), `## Search & Content Demand` (Chapter 9's
write-back), `## Research Log` (one line per pass: date · what was researched · key sources). Every fact
in it carries source + as-of date. It follows the same "researched intelligence vs what the agent says"
separation as `market.md`. If the file doesn't exist at build time, the research pass creates it and
`realtor-brain-migrate` adds it to older brains. It is brain data — synced like every other identity
file (write → push → verify).

---

## The anti-fluff rule (Chapters 7, 8, 9, 11 — and the Part bridges)

**Every claim in a strategy chapter must trace to exactly one of:**
- **(a) something the agent said** — captured in the Brain, ideally echoed in their words;
- **(b) a sourced, dated researched fact** — from `market.md` / `market-intel.md`;
- **(c) explicitly-labeled doctrine** — "per the system's branding doctrine…" (A.G.E.N.T., 20/80,
  AI-search), named as doctrine, never dressed up as market fact.

**The swap test:** if a sentence would be equally true for any agent in any market ("consistency is
key", "video is powerful", "relationships matter", "the market is always changing"), it is filler —
delete it. **A strategy chapter an unrelated agent could paste into their own book is a FAILED chapter**
— rebuild it from this agent's actual data. Better three specific, traceable insights than ten
generalities. When the Brain is genuinely too thin to support a claim, say what's missing and how to
capture it — an honest gap beats confident fluff every time.

---

## Placeholders (real builds only — demo brains NEVER placeholder)

Only **Business Plan** and **Operations** may render as placeholders — they are unbuilt-by-design after
a perfect first run. **Demo brains render NO placeholders** — Chapters 13 and 14 fill with illustrative
content like every other chapter; a demo shows the finished product.

A placeholder is a DESIGNED page, not an orphan line on white space — it sells the next step. Every
placeholder line is emitted as ONE line of structured text (never split mid-sentence — a wrapped source
line renders as two broken paragraphs). Exact treatment:

- **YOUR 90-DAY BUSINESS PLAN** → one lead line: *"This chapter is waiting on one 15-minute
  conversation."* Then the callout: `>> Say "build my business plan" — your income goal becomes the
  exact deals you need, your daily and weekly KPIs, and your three weekly non-negotiables, with all
  the math shown.` Then a short **"What will appear here"** bullet list: the money-math table · where
  your deals come from · the three weekly moves · the scenario table (conservative / target / stretch) ·
  your daily & weekly KPI dashboard · the month-by-month ramp.
- **HOW YOU OPERATE** → one lead line: *"This chapter fills in when you set up your AI Admin."* Then
  the callout: `>> Say "set up my operations" — your hours, booking rules, follow-up cadence, and
  trusted vendor list live here so your AI runs your day the way YOU run it.`
Voice-print and story-bank get the one-line "how to add" note inside Chapter 4, not a placeholder
chapter. (Strategy never placeholders — pipeline step 3 synthesizes it fresh on every build.) **No other
chapter may placeholder on a complete brain.** If a first-run identity file is genuinely missing, render
its heading + the honest one-line state + the command that fills it — never a fabricated section, never
a silently skipped heading.

---

## The verification gate (hard PASS/FAIL — run on EVERY build before upload)

Extract the text back out of the rendered `.docx` and check ALL of:
1. **Count** — complete brain: 5,000+ words (target band 5,000–6,500+); first-run with the two allowed
   placeholders: 4,400+; **absolute floor in all cases: 3,000** (the Setup gate — below it, always FAIL).
   An honest-gap chapter rendered per Grounding Law 6 is exempt from its per-chapter range, like a
   placeholder — the 3,000 absolute floor still binds.
2. **All FIFTEEN chapter headings present** (Snapshot · Who You Are · Who You Serve · Your Voice &
   Proof · Your Brand Direction · Your Market · Your 12-Month Market Outlook · Your Competitive &
   Content Landscape · Your Search & Content Opportunity · Your Offer & USP · Your Strategic Position ·
   Your Content Plan · Your 90-Day Business Plan · How You Operate · Compliance) + the four Part bands.
   A missing chapter = FAIL. (The fifteen include Setup Step 7.4's eleven, so passing this check always
   satisfies Setup's eleven-heading gate.)
3. **Byline appears once** (title block only).
4. **No `<w:` markup** anywhere in the text.
5. **Market structure** — one sub-heading per named community, 2–4 adjacent communities marked
   "adjacent" (more than 4 = FAIL — a refresh replaces the set, never accumulates), and NO surviving
   one-line community list.
6. **Source discipline** — every number in Chapters 6–9 carries source + as-of date. One unsourced
   researched stat = FAIL (it's a compliance incident waiting to publish). And no stale research: the
   number was **verified current within its staleness window** (research RUN within 3 months for
   market + outlook, 6 for competitive + search — the researched-stamp, NOT the source's publication
   date: boards lag and forecasts are quarterly, so when the newest published data is older than the
   window, cite it as the newest available and say so — that PASSES). At most ONE refresh per chapter
   per build (Grounding Law 6's cap): if refreshed research finds the same numbers, they ARE current —
   ship them, never re-research in a circle.
7. **Tables rendered where the contract says table** (Snapshot card, avatar-at-a-glance, colours,
   price bands, outlook indicators, competitive table, query-family table, cadence, money math + KPIs
   when built) — tabular data as wall-of-prose = FAIL.
8. **Anti-fluff spot check** — read Chapters 7–9 + 11: any paragraph failing the swap test = FAIL that
   chapter; rebuild it from the agent's data (a chapter rebuild spends a rebuild cycle; if the brain
   genuinely can't support specifics, the honest-gap render is the terminal state — never another loop).
9. **Placeholders only where allowed** (rule above).
10. **Contents page** — the linked CONTENTS renders on page 2 (exactly one CONTENTS page) with all
    FIFTEEN chapter rows, in order, each carrying its one-line summary written for THIS agent; any
    summary failing the swap test = FAIL.
11. **Chapter labels** — bands read `CHAPTER 1` through `CHAPTER 15`, sequential with no gaps, each
    inside its correct `PART I–IV` band.
12. **TOC resolution** — the render's stderr showed ZERO unresolved-TOC warnings (pipeline step 7). A
    warning = a contents row / chapter band mismatch: fix the structured text, re-emit, re-render.
13. **Grounding audit ran** (pipeline step 6) and its "N facts traced, M cut" tally is in the hand-off
    message.
14. **Grounding laws hold** — spot-check: no community outside the agent's named/confirmed list is
    presented as theirs (adjacents labeled, introduced in Chapter 6, ≤4); no competitor named without a
    sourced + dated verification of market AND niche; no quote, anecdote, testimonial, stat, or
    biographical claim about the agent that isn't in their Brain.
15. **`[confirm:]` discipline** — every marker enumerated in the hand-off message; none on researched
    numbers in Chapters 6–9; more than 3 total = FAIL (capture the answers with the agent, then render).

**Demo builds** (DEMO BRAINS above) swap checks 6, 13, and 14 for the demo checks: every number tagged
"(illustrative — demo)"; ZERO real source attributions; ZERO real competitor or vendor names; the
watermark present (filename + eyebrow + cover line). Every other check binds unchanged. **Real builds
get the mirror tripwire:** the string "(illustrative — demo)", a DEMO watermark, or the demo cover
line appearing ANYWHERE in a non-demo render = automatic FAIL — rebuild from the brain files.

On any FAIL: rebuild the failing chapters from the full brain-file contents and re-verify. **Never
upload a failed render. Never narrate the retry** — the agent only ever sees the finished Book.

**Bounded retries — a gate may fail a build, never trap one.** Research refresh: at most ONCE per
chapter per build. TOC re-render: at most TWICE (then align the contents rows to the bands by
copy-paste — it is a mechanical fix, never a rebuild). Rebuild cycles: at most TWO — **a cycle is ANY
post-gate rebuild + re-verify pass, full-book or single-chapter** (chapter rebuilds under checks 1 and
8 count; their terminal state is the honest-gap render, never another loop). A build still
failing a gate after its bounded retries **STOPS and tells the agent plainly** what's blocking (the one
gate, the one chapter, what would fill it) — a visible blocker beats an invisible loop. "Never upload a
failed render" still holds absolutely; "never narrate the retry" applies to retries that succeed, not
to a build that has exhausted them.

The same discipline covers the edges: **wrong file in Drive** (raw `════` text visible) = ONE
corrective re-upload of the already-rendered `.docx` — a second failure spends a rebuild cycle;
**push verify-fails** = TWO attempts per file, then `realtor-brain-sync`'s recovery path;
**renderer unavailable** = `pip install python-docx` once → the docx skill once → STOP and tell the
agent the renderer is unavailable (never upload raw text, never retry installs in a loop).

---

## Regeneration rules

- **When:** end of Setup (Step 7.4) · immediately after the Business Plan is built · "show me my Brain" /
  "regenerate my Brain document" · whenever the Brain materially changes (new avatar, new offer, brand
  change, migration). **A build's OWN write-backs** (its research, its `strategy.md` synthesis, the
  migrations it performs) **are never a material change and never trigger another regenerate** — one
  build per trigger, always.
- **Refresh, don't fork:** same name pattern, new date, saved beside the old — newest = current; the old
  dated copies are the version history. Never a second differently-named master doc.
- **Research staleness on regenerate** (check the as-of stamps in the brain files; refresh only what's
  stale or missing — never re-run everything blindly): market prices + 12-month outlook older than
  **3 months** → refresh; competitive landscape + search demand older than **6 months** → refresh;
  anything missing → run it now (research-on-render). Refreshed research writes back to the brain files
  first, always (write → push → verify). A refresh **REPLACES** the adjacent-community set in
  `market.md` (cap 4) — retire superseded adjacents rather than accumulating them.
- **Strategic Position is re-synthesized on every build** (step 3) so it always reflects the current
  brain + current research — and always lands in `identity/strategy.md` before it lands in the Book.
- After upload: push, then hand the agent the direct link with the standing line — this is their
  business bible; everything the system knows about them, in one book.
