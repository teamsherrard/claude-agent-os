---
name: realtor-brand-guide
description: Phase 3 of the Realtor AI Brain — generate a complete, professional brand style guide for a real estate agent and write their visual identity (colors, fonts, logo, headshot, tagline) into their Brain at identity/brand-visual.md + assets/. Produces a self-contained HTML guide as a keepsake render. Use this skill whenever a real estate agent wants to create their brand, define their visual identity, build brand guidelines, establish brand colors or fonts, create a style guide, or document how their brand should look and feel. Also trigger when someone says "build my brand," "I need brand guidelines," "create a brand kit," "make a style guide," "help me with my real estate brand," "I don't know what I want for my brand," "fix my existing brand," "I'm confused about my brand direction," or "audit my brand." MANDATORY TRIGGER for any request involving brand identity, brand consistency, visual guidelines, or brand direction for a real estate agent — including agents who are lost, confused, or starting from scratch.
---

# Brand Style Guide Skill

Produces a complete, agency-quality HTML brand style guide for a real estate agent. Professional enough to hand to any VA, designer, or social media manager. Handles every starting point: fresh start, completely lost, existing brand to fix, or inspiration-led.

---

## STEP 0: Scan and Detect

### 0A — Load the Brain first
Before asking anything, **read `~/realtor-brain/brain.md`** and the identity files Phases 1–2 already wrote:

- `~/realtor-brain/identity/profile.md` — name, market, niche, brokerage, title
- `~/realtor-brain/identity/avatars.md` — target client avatars (drives archetype + colour psychology)
- `~/realtor-brain/identity/voice.md` — personality words, communication style, tagline, UVP hints
- `~/realtor-brain/identity/offer.md` — value props and differentiators (use the agent's own language verbatim)

Extract all of it before asking a single question — then only ask for what's genuinely missing (logo,
colour direction, brokerage constraints, Canva templates, bilingual). **If `~/realtor-brain/` doesn't
exist, suggest the agent run _Realtor AI Brain — Setup_ first** — you can still proceed standalone.

### 0B — Detect mode
Read the agent's opening message and assign one mode:

- **MODE A — Fresh start, knows what they want.** Agent provides name, city, niche, and some color or vibe direction upfront.
- **MODE B — Lost / confused / no direction.** Signals: "I don't know," "just pick something," "help me figure it out," "I'm new," "I don't have a brand," "tell me what I should do."
- **MODE C — Has an existing brand to fix.** Signals: "fix my brand," "my brand is inconsistent," "audit what I have," mentions existing logo/colors/fonts they already use.
- **MODE D — Inspiration-led.** Signals: uploads images, references other brands they like, "make it look like X."

If the mode is genuinely unclear, ask one question only: "Are you starting from scratch, do you have a brand to improve, or do you have some inspiration to start from?"

---

## STEP 1: Intake

Collect everything needed in **one conversational message** — not drip-fed across multiple exchanges. Ask all questions together, get one answer, then proceed to build. The questions vary by mode.

### Mode A — Fresh start intake (one message):
1. Full name and brokerage
2. Primary market city AND state/province *(both required — never guess)*
3. Niche or specialty
4. 3 personality words / how they want clients to feel
5. Colors they use, or a vibe description *(if "I don't know" → handled in Step 1.5)*
6. **Logo:** "Do you have a logo? Upload it or send a screenshot from your website/Instagram. If not, we'll design one."
7. **Brokerage constraints:** "Any brokerage color rules? (eXp, RE/MAX, KW, etc.)"
8. **Canva templates needed:** "Which Canva templates do you want? Choose from: Reel cover / Open house / Just listed/sold / Business card / Email header / Instagram story / Facebook cover / YouTube banner / LinkedIn banner — or say all."
9. **Bilingual:** "Do you serve Spanish-speaking clients? I can add bilingual EN/ES content if so."

### Mode B — Discovery intake (one message):
Only ask: full name, brokerage, city/state. All other info comes from the 7-question discovery interview in Step 1B. Do NOT ask about colors, vibe, or niche upfront — that's the whole point of discovery mode.

Also ask: logo, brokerage constraints, Canva templates, bilingual (same as above).

### Mode C — Existing brand intake (one message):
Ask for: name, brokerage, city/state, logo file or screenshot, current color descriptions, current fonts if known, where the brand currently appears, what they feel isn't working.

Also ask: Canva templates, bilingual.

### Mode D — Inspiration intake (one message):
Ask for: name, brokerage, city/state. Images may already be uploaded — if so, confirm you'll extract the palette from them. If not yet uploaded, ask for them.

Also ask: logo, brokerage constraints, Canva templates, bilingual.

---

### Intake rules that apply to every mode:

**Niche rule:** If the agent says "I help everyone," "buyers and sellers," or names only a city — push back before continuing:
> "To build something that stands out, we need to get specific. What type of client do you love working with most? Even if you work with everyone, there's usually one type where you're at your best."
Do not proceed until the niche is specific enough to write a real UVP.

**Logo rules:**
- Agent uploads or describes a logo → use it, document it, build the whole guide around it. Do NOT redesign unless Mode C audit says replace.
- Agent cannot upload but describes it → document from description, flag in Canva brief that designer must source original file from agent.
- Agent has no logo → design a new SVG mark in Section 05.
- Logo must be embedded as inline base64 `<img>` or inline SVG in the HTML. **Never reference a file path** — the HTML is a standalone file and server paths will silently break.

**Brokerage rules:**
- eXp Realty → personal palette coexists with eXp blue (`#002AFF`), never incorporates it
- RE/MAX → RE/MAX red/white/blue confined to a designated co-brand zone, never mixed into personal brand elements
- Keller Williams → note KW constraints in guide
- Independent → no constraints

**Team detection:** If two names, "my partner," "husband and wife," "team," or any couple signal appears → open `references/team-brands.md` before proceeding. Teams need combined + individual + entity logos.

---

## STEP 1B: Discovery Interview (Mode B only)

Run as a flowing conversation — not a form. One question at a time. Goal: derive archetype, palette, and UVP from answers, because the agent can't articulate them directly.

**Q1:** "Tell me about your favourite client you've ever worked with — what made it feel great?"
*(Listening for: niche, client type, emotional connection)*

**Q2:** "When past clients refer you to someone, what do they say about you?"
*(Listening for: personality words, voice archetype)*

**Q3:** "What do you know about your market that most agents don't?"
*(Listening for: niche depth, differentiator)*

**Q4:** "Name 3 brands — real estate or anything else — whose look you admire. What do you like?"
*(Listening for: archetype, color direction)*

**Q5:** "What does a typical agent in your market look like? What do you NOT want to look like?"
*(Listening for: differentiation, colors to avoid)*

**Q6:** "When someone sees your brand for the first time, what 3 words do you want them to feel?"
*(Listening for: personality words, tone)*

After Q1–Q6: synthesise archetype from `color-strategy.md`, draft the UVP from Q1–Q3, note personality words from Q6, then proceed to Step 1.5. City and state were already collected in the Mode B intake (Step 1) — do not ask again.

---

## STEP 1C: Existing Brand Audit (Mode C only)

Run before designing anything. Present findings clearly to the agent.

**Logo audit (runs first):**
Score each: ✓ Strong | ~ Adequate | ✗ Problem
- Is the mark distinctive, or could it belong to any generic agent?
- Does it work at small sizes (profile picture, 40px)?
- Does it work on both dark and light backgrounds?
- Are logo colors compatible with a strong 5-colour system?
- Is it vector (SVG/AI/EPS) or raster only (PNG/JPG)?

Logo verdict: **Keep · Keep + Document · Refresh · Replace**

**Full brand audit (11 items):**
Present each as ✓ Keep | ✗ Fix | ~ Refresh:
1. Colour palette is 3–5 colours or fewer
2. Specific hex codes defined and used consistently across platforms
3. Primary/secondary/accent colour hierarchy is defined
4. Palette strategically matched to niche and target client
5. Exactly two fonts defined (display + body)
6. Fonts used consistently across all materials
7. Clear niche and UVP documented somewhere
8. Visual choices match what the target client expects
9. Brand looks different from the top 3 competitors in the market
10. Defined graphic elements system exists
11. Consistent mockup/template library in use

**Overall verdict:**
- **Full Rebuild** (5+ items ✗) → "The foundation needs replacing. We'll start fresh and keep only what's working."
- **Refresh** (2–4 items ✗) → "The bones are good. We'll tighten and document the system."
- **Document** (0–1 items ✗) → "Your brand is strong. We'll document it properly so your whole team executes it consistently."

---

## STEP 1D: Mood Board / Inspiration Extraction (Mode D only)

Apply the 5-step extraction from `color-strategy.md`:
1. Read the emotional temperature (warm/cool, high/low contrast, organic/geometric)
2. Identify the dominant background colour → becomes the 60%
3. Identify the primary brand colour → becomes the 30%
4. Identify the accent colour → becomes the 10%
5. Name all colours evocatively — never "dark blue" or "light beige"

Show the extracted palette to the agent for confirmation before building.

---

## STEP 1.5: Palette Presentation (when agent is uncertain)

If the agent is uncertain about colours, said "just pick something," or came from Mode B or D — present 3 distinct options before building. Never silently choose one.

**Option A — [Archetype Name]**
Colours: [Name] (#HEX) · [Name] (#HEX) · [Name] (#HEX) · [Name] (#HEX) · [Name] (#HEX)
Why: [1–2 sentences — what these communicate for this niche and market specifically]
Feels like: [3 adjectives]

**Option B — [Different archetype — genuinely different emotional direction, not a variation]**
**Option C — [Bolder or more unexpected — the one they might not expect but might love]**

Ask: "Which direction feels most like you? Mix elements from two if you want. Even 'I hate all of these' is useful."

---

## STEP 1.6: Tagline Workshop (if no tagline was provided)

Generate 5 options. All must be specific to this agent's niche, city, and market position. Zero generic real estate clichés.

**Aspirational:** [example]
**Direct / benefit-led:** [example]
**Local / market-specific:** [example]
**Emotional:** [example]
**Bold / unexpected:** [example]

Ask the agent to pick one or iterate. The tagline appears on the cover and closing section.

---

## STEP 2: Generate the Brand System

Read all reference files before designing:
1. `references/color-strategy.md` — 6 archetypes with hex+RGB palettes, 60-30-10 rule, colour psychology, harmony systems, mood board extraction
2. `references/brand-strategy.md` — UVP framework, 3 voice archetypes, 6-element bio structure, niches, common mistakes
3. `references/brand-examples.md` — 25+ real agent style sheets, quality benchmarks
4. `references/font-pairings.md` — 15 Google Font pairings with Canva availability

**Identify the archetype:**
- Luxury Authority → monochromatic or complementary, black/white/gold, high-contrast serif + clean sans
- Approachable Guide → analogous warm earthy, sage/terracotta/linen, warm serif + humanist sans
- Modern Hustler → complementary or monochromatic, concrete/slate + electric accent, condensed display + modern sans
- Coastal / Lifestyle Curator → analogous coastal, seafoam/teal/coral, delicate serif + rounded sans
- Classic Prestige → complementary, navy or forest/ivory/gold, classic serif + geometric sans
- Bold Disruptor → bold complementary, unexpected primary (plum/coral/forest) + neutral, geometric display + clean sans

**Write the UVP before any design decisions:**
> "I help [specific client] in [city/area] [specific outcome] by [unique differentiator]."

If the niche is still "everyone" — stop. Return to intake. A generic niche produces a generic guide.

**Differentiation check:** What do the top agents in this market typically look like? Choose deliberately to be distinct from that pattern.

**Font selection:** Use `references/font-pairings.md`. For each font document:
- ✓ Canva Free — available to all accounts
- ◐ Canva Pro — requires paid plan; always note a Free fallback
- ✗ Google Fonts only — not in Canva; always note a Canva fallback

**City skyline:** Check `references/city-skylines.md` first. If listed, use the SVG block exactly. If not listed, build a custom SVG from that city's actual known landmarks. If genuinely uncertain about the city's landmarks, ask the agent to name 1–2. If all else fails, use the Generic Fallback block from `city-skylines.md` and note it in the closing section. **Never hardcode any specific city name in the instructions — always use the agent's actual city.**

---

## STEP 3: Build the HTML Document

Not a webpage. A designed artifact. Agency quality. If it looks like a website → not right. If it looks like a branding studio PDF → right.

Quality benchmark: Aleaha Frigon, Abby Valencia Gooding, Steve Buzogany from `references/brand-examples.md`.

### Technical rules

**Single self-contained HTML file.** All CSS in one `<style>` block. Google Fonts via `<link>`. No external CSS files. No external image files.

**CSS variables — always define this exact set:**
```css
:root {
  --dominant: #...;     /* 60% — background, white space */
  --primary: #...;      /* 30% — main brand personality colour */
  --mid: #...;          /* supporting tone, labels, borders */
  --accent: #...;       /* 10% — CTAs, badges, highlights */
  --dark: #...;         /* near-black — primary text */
  --light: #...;        /* lightest surface — card backgrounds */
  --font-display: 'DisplayFont', serif;
  --font-body: 'BodyFont', sans-serif;
}
```

**Required base CSS — include in every guide:**
```css
@media print { .no-print { display: none !important; } }
* { margin: 0; padding: 0; box-sizing: border-box; }
body { background: var(--dominant); color: var(--dark); font-family: var(--font-body); overflow-x: hidden; }
.inner { max-width: 960px; margin: 0 auto; }
```

**No download button. No print button.** Both are blocked by Claude's sandbox CSP — they produce "content blocked" errors or do nothing. Do not add them. Instead include this instruction note once at the top of `<body>`:
```html
<div class="no-print" style="position:fixed;top:16px;right:16px;z-index:1000;background:rgba(0,0,0,0.78);color:#fff;font-family:sans-serif;font-size:11px;line-height:1.6;padding:8px 14px;border-radius:4px;max-width:210px;text-align:center;">To save as PDF:<br>Use the download link<br>in the chat above →<br>open in Chrome →<br>File → Print → Save as PDF</div>
```

**No server paths.** All assets must be inline. If the agent uploaded a logo: convert to base64 and embed as `<img src="data:image/png;base64,...">`. If base64 conversion is impractical, recreate faithfully as inline SVG. Never write `src="/mnt/..."` or any file path — it will silently break in the standalone HTML.

**File naming:** Always `firstname-lastname-brand-guide.html` — lowercase, hyphens, no spaces. Example: `james-kirby-brand-guide.html`

**Output length:** This HTML file is typically 800–1200+ lines. Write it completely in a single response. If it cannot fit in one response, output the full CSS and as many sections as possible, then immediately continue in the next response with a clear section marker: `<!-- CONTINUING FROM SECTION [N] -->`. Do not stop mid-section. Do not truncate silently.

---

### Section structure — 10 sections numbered 01 through 10

**01 — Cover**
Full viewport height (`min-height: 100vh`). Dark background (`var(--dark)` or `var(--primary)`). Agent name enormous (`font-size: clamp(4rem, 9vw, 8rem)`, `font-weight: 700`). Market city in small caps above name. UVP as styled blockquote with left border in `var(--mid)`. Tagline in italic display font. Row of small brand tags showing: archetype name · colour harmony type · differentiation score. Do NOT include the intake mode (A/B/C/D) on the cover or anywhere in the guide. Agent's actual city skyline SVG flush to bottom. 5-colour brand strip as the very last element (all 5 colours as equal-width divs, full width). Decorative depth elements matched to archetype (diagonal panels / circles / grid lines).

**02 — Brand Positioning**
Dark background. Voice words as oversized typographic statement — stack them with alternating solid / colour / outline CSS treatments. Archetype badge. UVP displayed prominently. 1 paragraph on why this positioning wins in this specific market. Differentiation score badge (X/14) with one-sentence rationale. Agent initials mark (not the full logo — just initials in a circle or frame).

**03 — Colour Palette**
Light background (`var(--dominant)` or `var(--light)`). Opens with a "Colour Strategy" callout box (2–3 sentences) explaining WHY these specific colours were chosen for this niche and market — not just what they are. 5 tall vertical swatches (min 155px height) — each with: evocative brand name, HEX, RGB (calculated correctly), role (60% Dominant / 30% Primary / Supporting / 10% Accent / Deep Neutral), usage note. 60-30-10 ratio bar with percentage labels. 4 usage rule cards: Primary Background · Text on Light · Text on Dark · CTAs & Badges. Brokerage note card if constraints apply.

RGB conversion formula (use for every colour): R = first 2 hex chars as decimal, G = middle 2, B = last 2. Example: `#C94B2C` → R: parseInt("C9",16)=201, G: parseInt("4B",16)=75, B: parseInt("2C",16)=44 → `RGB 201, 75, 44`. Do this arithmetic correctly every time.

**04 — Typography**
White background. Two font cards side-by-side. Each card shows: alphabet specimen (`Aa Bb Cc Dd Ee Ff Gg Hh`), number row (`0 1 2 3 4 5 6 7 8 9`), real niche-specific copy sample in that exact font, Canva availability badge (✓ Free / ◐ Pro with fallback / ✗ Google only with fallback). Pairing rationale paragraph — why these two fonts work for this archetype specifically. Type scale: H1 at 3.5rem → H2 → H3 → Label (small caps) → Body → Caption — every size uses real agent-specific copy, zero placeholder text.

**05 — Logo System**
Dark background. Three branches — use exactly one:

*Branch A — Agent provided an existing logo:*
Show logo in 4 context boxes: on dark background · on light background · on brand primary colour · at profile-picture scale (approximately 64px). Embed as inline base64 `<img>` or faithful inline SVG. Document: colours in the logo with hex codes, font used in wordmark (identify it or note "custom lettering"), mark type. Show clear space rules (minimum padding = cap-height of tallest letter on all 4 sides). State minimum sizes: 80px digital / 0.75 inch print. List 4 approved uses and 4 things to never do — specific to this logo, not generic. If raster only: prominent flag: "Your logo is a raster file (PNG/JPG). You need a vector file (SVG or AI) for professional print — flag this for your designer."

*Branch B — No existing logo:*
Design a new inline SVG mark. Choose style based on archetype:
- Framed monogram (diamond/arch/cut-corner frame + initials, stroke only) → Classic Prestige, Luxury Authority
- Large initial + decorative element (thin rule, icon, colour block) → Approachable Guide, Bold Disruptor  
- Abstract geometric mark + wordmark (chevrons, overlapping shapes, diagonal bars) → Modern Hustler, Coastal Curator
Show mark in 4 background variation boxes (dark / light / brand primary / outline-watermark). DO (4 rules) and DON'T (4 rules) specific to this mark.

*Branch C — Logo being replaced (Mode C, audit verdict: Replace):*
Old logo in a "Before" box (recreated as SVG from description if needed). New designed mark in "After" box. New mark in all 4 background variations. Brief note on what changed and why. Note that both exist during the transition period.

**06 — Graphic Elements**
Light background. 3 signature visual elements — rendered as live working CSS/SVG demos. Choose elements matched to archetype:
- Approachable Guide: circular arcs + warm dot grid + initials watermark
- Luxury Authority / Classic Prestige: architectural fine-line grid + gold vertical rules + initials watermark
- Modern Hustler / Bold Disruptor: diagonal slash panels + geometric dot grid + initials watermark
- Coastal Curator: organic wave shapes + scattered dots + initials watermark

Each element: name, live visual demo, description, and a list of where it's used (e.g. Reel covers / carousels / email headers).

**07 — Brand Voice**
Dark or primary brand background. Voice archetype badge (The Educator · The Negotiator / Advocate · The Local Insider). Voice table: 3 rows, columns = Voice Word | What it means for THIS agent specifically | Example in practice (never generic — must be niche and city specific). 3 content examples, each labeled with its pillar:
- Instagram caption: 150–200 words, written for their niche, hooks in first 2 lines
- 3 email subject lines: curiosity angle / local authority angle / story angle
- Reel hook script: first 3 seconds, punchy, niche-specific, direct-to-camera

All content must be so specific that it could only be for this agent — not swappable onto anyone else.

**08 — Agent Bio**
Light background. Bio written using the 6-element structure from `references/brand-strategy.md`:
1. Hook — addresses the client's problem first, not the agent's credentials
2. Niche + UVP — who they serve and the specific outcome
3. Credentials — framed as what they do FOR the client, never a bullet resume
4. Local expertise — specific neighbourhoods, suburbs, or market data named
5. Personal relatability — one genuine human detail
6. CTA — direct, no pressure, specific

Profile card with: initials circle (photo placeholder), name, title/niche, 4 stat numbers, contact row. Bio text is real and complete — never placeholder.

For stat numbers: use whatever the agent provided. If they didn't provide specific numbers, use format "X+" with a note — e.g. "200+ Clients", "12 Yrs", "5★", "[City] Expert". Never invent specific numbers the agent didn't give. If you have zero stats, use: years in market, city/area focus, star rating placeholder, and niche label — these are always available from the intake.

**09 — Social Media Profiles** · Light background (or white)
How the brand applies consistently across every platform. For each platform show: profile picture treatment (logo mark centred in a circle with brand background colour), banner/cover colour layout, grid or content aesthetic notes, tone adjustment for that channel. Use these exact dimensions:

| Platform | Profile pic | Banner / Cover |
|---|---|---|
| Instagram | 320 × 320px | N/A (grid is the "banner") |
| YouTube | 800 × 800px | 2560 × 1440px (safe zone: 1546 × 423px centre) |
| LinkedIn | 400 × 400px | 1584 × 396px |
| Facebook | 170 × 170px | 820 × 312px |
| TikTok | 200 × 200px | N/A |
| Google Business | 250 × 250px | 1332 × 750px |

For each platform include: which logo version to use (dark/light/brand-colour), dominant background colour, and one sentence on tone adjustment (e.g. "LinkedIn: more formal, emphasise credentials. TikTok: casual and direct, bilingual if applicable.")

**10 — Photography Direction**
Dark background. Headshot style (formal / candid / environmental — derived from archetype, not generic). Wardrobe: colours that work with the palette, what to avoid. Content photography style. Property photography direction. Colour grading direction (warm or cool — must logically match the palette). For Mode C: a "Stop doing immediately" list of specifics to change.

**10B — Bilingual Section (conditional — only if agent confirmed yes in Step 1)**
Primary brand background. Parallel EN/ES versions of: UVP, short bio paragraph, Instagram caption, Reel hook script. Written natively in both languages — never machine-translated. Label section: "Bilingual Brand Voice — English + Español."

**Closing (unnumbered — final element of the document)**
Dark background. Agent tagline large in italic display font, centred. Agent full name large below. Market city + niche in small caps. 5-colour brand strip as the absolute last element. Nothing else — no checklist, no instructions, no boxes. The guide ends confidently.

---

### Non-negotiable design rules

1. **Section dark/light assignment — follow this exactly:**
   - 01 Cover → DARK
   - 02 Brand Positioning → DARK
   - 03 Colour Palette → LIGHT (var(--dominant) or var(--light))
   - 04 Typography → WHITE (#fff or var(--light))
   - 05 Logo System → DARK
   - 06 Graphic Elements → LIGHT
   - 07 Brand Voice → DARK (use var(--primary) or var(--dark))
   - 08 Agent Bio → LIGHT
   - 09 Social Media Profiles → LIGHT (or white)
   - 10 Photography Direction → DARK
   - 10B Bilingual (if present) → use var(--primary) as background
   - Closing → DARK
   Sections 01, 02 being both dark is acceptable — the cover and positioning are one visual unit. All others strictly alternate.
2. **Every section has a label** — small caps, `letter-spacing: 0.24em`, `font-size: 0.62rem`, `font-weight: 700`, in `var(--mid)`, positioned above the section title.
3. **Oversized decorative type** — initials, section numbers, or key words at `8–15rem`, `opacity: 0.03–0.07`, present in at least 4 sections for depth.
4. **Padding:** `padding: 96px 64px` minimum on every section.
5. **Inner width:** `.inner { max-width: 960px; margin: 0 auto; }` wraps all section content.
6. **Real copy everywhere.** Niche-specific, city-specific, agent-specific. Zero Lorem ipsum. Zero "Agent Name Here." Zero "Your tagline here."
7. **All 5 colours used throughout** — not only in Section 03.
8. **No server paths.** All assets inline.
9. **No download button, no print button.** Instruction note only.
10. **Differentiation.** The guide must look unlike every other agent in this specific market.

---

## STEP 4: Differentiation Score

Score before finalising:

| Criterion | 0 · 1 · 2 |
|---|---|
| Niche is specific — not "buyers and sellers" | |
| UVP is specific — could only belong to this agent | |
| Colours are distinct from typical agents in this market | |
| Palette avoids the most overused RE combos (navy+gold, red+white, generic blue) | |
| Font pairing is distinctive — not Arial, Roboto, or Inter | |
| Voice and content examples are hyper-specific to niche and city | |
| The guide could only be for THIS agent — not swappable | |

**Total /14.** Below 10: identify specifically what to fix, fix it, state what changed and why. Do not deliver below 10.

---

## STEP 5: Canva Designer Handoff Brief

Open `references/canva-handoff.md`. Populate every bracketed field with actual values from the guide just built. No TBDs. No blanks.

Use the Canva template list collected in Step 1 intake — it was already gathered; do not re-ask.

**Hex to RGB** for every colour: R = first 2 hex chars in decimal, G = middle 2, B = last 2. Do this arithmetic correctly — do not estimate.

**Font Canva availability:** For each font document: ✓ Free / ◐ Pro with Free fallback / ✗ Google only with Canva fallback. Use `references/font-pairings.md` availability table.

**Logo section:** State clearly — existing logo (file status, vector/raster flag) OR new SVG mark (describe precisely enough that a designer can build it). Never leave this section ambiguous.

**Save as DOCX** using the docx skill. File name: `firstname-lastname-canva-brief.docx`

If the docx skill is unavailable or fails: save the brief as a clean `.md` markdown file using `create_file`, name it `firstname-lastname-canva-brief.md`, and tell the agent they can copy-paste it into a Word doc or Google Doc. Do not skip the brief entirely — it is a required deliverable.

**Team brands:** Include Team Logo Usage Matrix from `references/team-brands.md` if applicable.

---

## STEP 6: Bilingual (if yes in intake)

Already determined in Step 1. If yes: include Section 10B in the HTML with parallel EN/ES versions of UVP, short bio, Instagram caption, Reel hook — written natively in both languages.

---

## STEP 6.6: Write to the Brain

This is **Phase 3** of the agent's Brain — the visual identity every other skill *and the AI Video
Editor* reads. Before delivering, write it into the Brain:

**1. Write `~/realtor-brain/identity/brand-visual.md`** — the machine-readable source of truth (the
HTML is a *render*; this file is what skills actually read). From the brand system you built:
- **Colors:** all 5 with hex + role (dominant / primary / supporting / accent / deep neutral)
- **Fonts:** display (heading) + body, with Canva availability/fallback noted
- **Logo:** `assets/` path + mark type + wordmark font + vector-or-raster flag
- **Headshot:** `assets/` path
- **Tagline**, monogram, and visual style notes (archetype, 60-30-10 feel)

**2. Save assets to `~/realtor-brain/assets/`** — the logo file(s) and any uploaded headshot, and record
the two font names. (The HTML embeds logos as base64; the Brain keeps the real files so other skills and
the Video Editor can use them.)

**3. Save the HTML guide + Canva brief to `~/realtor-brain/exports/`.**

If `~/realtor-brain/identity/` doesn't exist yet, create it.

---

## STEP 7: Deliver

Present the brand guide and Canva brief (both saved in `~/realtor-brain/exports/`) using `present_files`:
1. `firstname-lastname-brand-guide.html`
2. `firstname-lastname-canva-brief.docx`

Tell the agent:
- **Your visual brand is now in your Brain** — every skill and your AI Video Editor will use these exact
  colours, fonts, and logo automatically.
- **To save as PDF:** Click the brand guide link in the chat above the preview to download the `.html` file. Open in Chrome or Safari → File → Print → Save as PDF. Do not use any button inside the preview — they are disabled by the sandbox.
- **Canva brief:** Send the `.docx` file directly to your Canva or Fiverr designer. Every decision is documented — they should not need to ask you anything.
- **Differentiation score** is visible in the Brand Positioning section.

If this skill was run as **Phase 3 of full Brain Setup**, hand control back to Setup to continue.

---

## Internal Quality Check (runs before Step 7 — never shown in HTML output)

### Intake
- [ ] Knowledge files scanned before any questions asked
- [ ] All intake collected in ONE message per mode — not drip-fed
- [ ] Mode correctly identified and mode-appropriate questions asked
- [ ] Logo question asked — existing logo used if provided, new mark only if not
- [ ] Niche confirmed specific — generic niche pushed back on
- [ ] UVP written using "I help [client] in [city] [outcome] by [differentiator]" framework
- [ ] Brokerage constraints identified and documented
- [ ] Tagline generated and confirmed by agent
- [ ] Palette confirmed by agent when uncertain (not silently chosen)
- [ ] Canva template list gathered in Step 1 (not asked mid-production)
- [ ] Bilingual determined in Step 1 (not asked mid-production)
- [ ] Team detection: team-brands.md opened if applicable

### HTML file
- [ ] File named `firstname-lastname-brand-guide.html` — lowercase, hyphens, no spaces
- [ ] Google Fonts `<link>` present in `<head>`
- [ ] CSS variables defined: `--dominant`, `--primary`, `--mid`, `--accent`, `--dark`, `--light`, `--font-display`, `--font-body`
- [ ] Base CSS present: `@media print { .no-print { display: none !important; } }` and `box-sizing: border-box`
- [ ] Instruction note present (no download/print button — instruction note only)
- [ ] No server paths anywhere — all assets inline (base64 or inline SVG)
- [ ] Exactly 10 numbered sections (01–10) plus optional 10B plus unnumbered Closing
- [ ] Section 01 cover uses agent's actual city skyline — not a placeholder or hardcoded city
- [ ] Sections alternate dark/light throughout
- [ ] Every section has a small-caps label
- [ ] Oversized decorative type present in at least 4 sections
- [ ] Section 03: RGB values are arithmetically correct, not estimated
- [ ] Section 05: correct branch used (A / B / C), no mixed branches
- [ ] Section 05 Branch A: logo embedded inline — no file path `src`
- [ ] Section 06: 3 graphic elements as live CSS/SVG demos, not described
- [ ] Section 07: voice content is hyper-specific to niche and city
- [ ] Section 08: bio uses 6-element structure, real copy throughout
- [ ] No "Brand Applications" mockup section
- [ ] No checklist section
- [ ] Closing: tagline + name + 5-colour strip only — nothing else

### Content
- [ ] Differentiation score 10/14 or above — if not, fixed before delivery
- [ ] Zero Lorem ipsum, zero placeholder text anywhere in the document
- [ ] All 5 brand colours appear throughout the document, not only in Section 03

### Canva brief
- [ ] All bracketed fields populated — no TBDs
- [ ] All 5 colours include both HEX and correctly calculated RGB
- [ ] Font Canva availability documented for both fonts with fallbacks where needed
- [ ] Logo section clearly states: existing file (with vector/raster status) OR new mark (with precise description)
- [ ] Template specs filled for agent's chosen templates only
- [ ] Saved as DOCX and presented alongside HTML

---

## Reference Files

**Read in this order:**

1. `references/color-strategy.md` — CORE. 6 brand archetypes with full hex+RGB palettes, 60-30-10 rule, colour psychology, harmony systems, mood board extraction, 2026 trends, usage rule templates.

2. `references/brand-strategy.md` — CORE. Niche positioning, UVP framework, 3 voice archetypes (Educator / Negotiator / Local Insider), 6-element bio structure, content pillars, common branding mistakes.

3. `references/brand-examples.md` — 25+ real agent style sheets. Quality benchmarks and design patterns.

4. `references/font-pairings.md` — 15 Google Font pairings matched to archetypes. Canva availability for all fonts. Use the availability table when populating the Canva brief.

5. `references/city-skylines.md` — SVG building blocks for 20+ North American cities. Includes generic fallback for unknown cities.

6. `references/canva-handoff.md` — Designer brief template. Populate after building the HTML guide.

7. `references/team-brands.md` — Team/couple logo architecture. Open only when team is detected.

**The Brain (read in Step 0A — overrides and enriches all of the above):**

- `~/realtor-brain/identity/profile.md` + `market.md` + `avatars.md` — name, market, niche, target avatars, personality. Extract before asking any Step 1 questions.
- `~/realtor-brain/identity/voice.md` + `offer.md` — use the agent's own language verbatim in the UVP, voice content examples, and bio. More authentic than anything inferred from an intake conversation.
