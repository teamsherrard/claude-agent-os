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
- **Never fabricate** — no invented voice samples, stories, testimonials, or statistics. **Every
  researched number carries its source + as-of date** ("researched [Month YYYY], [source]"). These
  numbers flow into published content and on-camera scripts — **an unsourced stat in published content
  is a compliance incident, not a shortcut.** Can't verify it? Write what you verified, omit the rest,
  and say so.
- **Written FOR the agent** — second person, warm, clear headings, genuinely useful as a reference
  (identity files are third-person for Claude; the Book converts the voice).
- **Never narrate a failed render or the retry to the agent** — they only ever see the finished Book.
- **Placeholder behavior for unbuilt sections is unchanged** (see Placeholders below).

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
4. **Assemble the structured text** per `doc-formatting.md`'s grammar — and ONLY that grammar (the
   renderer knows nothing else): title line + meta line; each PART and each CHAPTER as a CAPS band
   wrapped in divider rules; **sub-headings inside chapters as sub-bands** (`──── Label ────` — one per
   community, per avatar, per Strategic-Position section); `•` bullets; numbered steps as `1.  …` lines;
   `Label:` lead-ins — this is also how the Book's "callout" treatment is written (a bold `Label:` line
   introducing the quoted text on the same or next line; the renderer has no separate callout block);
   pipe-row tables (optional `| --- |` separator); generous blank-line spacing. No Markdown
   `#`/`**`/backticks in the body.
5. **Render** with `render_doc.py` to `.docx`.
6. **Verify** against the hard gate (below). FAIL → rebuild from the full brain-file contents and
   re-verify. Never upload a failed render.
7. **Upload to `01 · AI Brain/`, push, hand over the direct link.**

---

## The chapter contract — four parts, fifteen chapters

The Book runs a deliberate arc: **who you are → the market you play in → how you win → what you do
about it.** Each PART opens with its CAPS band and a 2–4 sentence consultant-voiced bridge (what this
part establishes and why it feeds the next). Chapter headings are exact — the verify gate checks all
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
each written as a **`Label:` lead-in line** with the phrase (the Book's callout treatment — the renderer
bolds the label), spoken voice-print if built, the writing samples from `voice-samples.md`, then proof:
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

## Placeholders (unchanged behavior)

Only **Business Plan** and **Operations** may render as placeholders — they are unbuilt-by-design after
a perfect first run. Each renders its CAPS heading + one friendly line:
- YOUR 90-DAY BUSINESS PLAN → *"Run 'build my business plan' and this section fills in — your income
  target turned into deals, KPIs, and the three weekly moves."*
- HOW YOU OPERATE → *"Set up when you build your AI Admin — say 'set up my operations'."*
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
2. **All FIFTEEN chapter headings present** (Snapshot · Who You Are · Who You Serve · Your Voice &
   Proof · Your Brand Direction · Your Market · Your 12-Month Market Outlook · Your Competitive &
   Content Landscape · Your Search & Content Opportunity · Your Offer & USP · Your Strategic Position ·
   Your Content Plan · Your 90-Day Business Plan · How You Operate · Compliance) + the four Part bands.
   A missing chapter = FAIL. (The fifteen include Setup Step 7.4's eleven, so passing this check always
   satisfies Setup's eleven-heading gate.)
3. **Byline appears once** (title block only).
4. **No `<w:` markup** anywhere in the text.
5. **Market structure** — one sub-heading per named community, ≥2 adjacent communities marked
   "adjacent", and NO surviving one-line community list.
6. **Source discipline** — every number in Chapters 6–9 carries source + as-of date. One unsourced
   researched stat = FAIL (it's a compliance incident waiting to publish).
7. **Tables rendered where the contract says table** (Snapshot card, avatar-at-a-glance, colours,
   price bands, outlook indicators, competitive table, query-family table, cadence, money math + KPIs
   when built) — tabular data as wall-of-prose = FAIL.
8. **Anti-fluff spot check** — read Chapters 7–9 + 11: any paragraph failing the swap test = FAIL that
   chapter; rebuild it from the agent's data.
9. **Placeholders only where allowed** (rule above).
On any FAIL: rebuild the failing chapters from the full brain-file contents and re-verify. **Never
upload a failed render. Never narrate the retry** — the agent only ever sees the finished Book.

---

## Regeneration rules

- **When:** end of Setup (Step 7.4) · immediately after the Business Plan is built · "show me my Brain" /
  "regenerate my Brain document" · whenever the Brain materially changes (new avatar, new offer, brand
  change, migration).
- **Refresh, don't fork:** same name pattern, new date, saved beside the old — newest = current; the old
  dated copies are the version history. Never a second differently-named master doc.
- **Research staleness on regenerate** (check the as-of stamps in the brain files; refresh only what's
  stale or missing — never re-run everything blindly): market prices + 12-month outlook older than
  **3 months** → refresh; competitive landscape + search demand older than **6 months** → refresh;
  anything missing → run it now (research-on-render). Refreshed research writes back to the brain files
  first, always (write → push → verify).
- **Strategic Position is re-synthesized on every build** (step 3) so it always reflects the current
  brain + current research — and always lands in `identity/strategy.md` before it lands in the Book.
- After upload: push, then hand the agent the direct link with the standing line — this is their
  business bible; everything the system knows about them, in one book.
