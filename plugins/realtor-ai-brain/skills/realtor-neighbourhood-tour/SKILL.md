---
name: realtor-neighbourhood-tour
description: >
  Realtor Neighbourhood Tour Skill — researches a specific neighbourhood and builds a complete
  drive-and-talk filming package for a real estate agent. The agent provides the neighbourhood
  name, 3-5 spots they plan to film at, and their target buyer type. Claude researches prices,
  schools, amenities, restaurants, and local stats automatically, then delivers a hybrid
  YouTube script (word-for-word hook and closing line, structured talking points at each stop,
  natural transition lines between locations) plus 3 short-form video concepts pulled from the
  tour content. Everything compiled into a single clean Google Doc.

  Trigger on: "neighbourhood tour script", "neighbourhood tour video", "build a tour script",
  "filming a neighbourhood", "drive and talk script", "community tour video", "neighbourhood
  video for YouTube", "tour video script", "community spotlight video", "filming in [neighbourhood]",
  or any request where the agent wants to film a neighbourhood or community tour video.
---

# Realtor Neighbourhood Tour Skill

Research the neighbourhood, find the stats, and build a complete filming package the agent
takes on location. They show up, hit record, and follow the guide. No preparation needed
beyond knowing where they're going.

---

## Before You Start

### Step 1 — Load the Brain

**Read `~/realtor-brain/brain.md` first**, then open what this skill needs:

- `~/realtor-brain/identity/profile.md` — name, city, booking link, CTA
- `~/realtor-brain/identity/voice.md` — tone, voice, what they never want to sound like
- `~/realtor-brain/identity/avatars.md` — who their buyers and sellers are, what they care about
- `~/realtor-brain/memory/content-log.md` — recent tour/area content, so this one takes a fresh angle

Apply everything found here to the script tone, the stat selection, and the CTA. **If `~/realtor-brain/`
doesn't exist, tell the agent to run _Realtor AI Brain — Setup_ first.**

### Step 1b — Before you publish (always)
- **Compliance:** read `~/realtor-brain/identity/compliance.md`. Append the required brokerage disclaimer
  + license # to every public-facing output, and never make a claim on its "claims to avoid" list. *(If
  `compliance.md` is empty/unset, proceed but flag it to the agent.)*
- **No placeholders:** if any identity file you rely on still contains `[bracketed]` template text, treat
  that field as missing — ask the agent or skip it. **Never output bracketed placeholder text.**

### Step 2 — Read Skill Reference Files

1. `references/research-guide.md` — what data to find, where to find it, how to organize it
2. `references/script-guide.md` — how to write drive-and-talk scripts, stop structure, transition lines
3. `references/shortform-guide.md` — how to pull 3 short-form concepts from the tour content

---

## Phase 1: Intake

### Always required

1. **Neighbourhood name** — the specific community, suburb, or area being toured
2. **City** — if not already in the Brain
3. **3-5 filming stops** — specific spots the agent plans to film at
   (e.g. "the main park, the coffee strip on Oak Street, the new development on 5th, the school")
4. **Target buyer type** — who this video is for
   (e.g. first-time buyers, young families, downsizers, investors, out-of-town relocators)

### Optional — agent can add, but Claude will research if not provided
5. **Any specific stats or facts they already know** about the neighbourhood
6. **Any local spots, hidden gems, or insider knowledge** they want to highlight
7. **A hook angle they have in mind** — or Claude will determine the strongest one from research

### With the Brain loaded
Skip any questions the Brain already answers. Only ask for the 4 required inputs above.

---

## Phase 2: Neighbourhood Research

**Read:** `references/research-guide.md`

This is what makes the script credible. The agent shows up knowing more about their
neighbourhood than anyone watching — because Claude has already done the homework.

### Step 1 — Run Research Searches

Search for current, specific data on the neighbourhood. Run ALL of the following,
replacing [neighbourhood], [city], and [year] with the agent's specifics.

**Category 1 — Real Estate Data**
- `[neighbourhood] [city] average home price [year]`
- `[neighbourhood] [city] real estate market [year]`
- `[neighbourhood] [city] homes for sale [year]`
- `[neighbourhood] [city] property values [year]`
- `[neighbourhood] [city] housing stats [year]`

**Category 2 — Schools**
- `[neighbourhood] [city] schools`
- `best schools near [neighbourhood] [city]`
- `[neighbourhood] [city] elementary school middle school high school`
- `[neighbourhood] school ratings [city]`

**Category 3 — Amenities and Lifestyle**
- `[neighbourhood] [city] parks recreation`
- `[neighbourhood] [city] things to do`
- `[neighbourhood] [city] community centre gym fitness`
- `[neighbourhood] [city] shopping grocery stores`
- `[neighbourhood] [city] transit commute downtown`
- `[neighbourhood] [city] walkability`

**Category 4 — Restaurants and Coffee**
- `best restaurants [neighbourhood] [city]`
- `best coffee shops [neighbourhood] [city]`
- `[neighbourhood] [city] local food scene`
- `popular cafes [neighbourhood] [city]`

**Category 5 — Development and Growth**
- `[neighbourhood] [city] new development [year]`
- `[neighbourhood] [city] growth future plans [year]`
- `[neighbourhood] [city] new construction [year]`
- `[neighbourhood] [city] infrastructure investment [year]`

**Category 6 — Community Character**
- `[neighbourhood] [city] community vibe lifestyle`
- `living in [neighbourhood] [city]`
- `[neighbourhood] [city] pros cons`
- `[neighbourhood] [city] demographics population`

### Step 2 — Extract and Organize Research

Before writing anything, organize all findings into a clean internal data summary:

```
NEIGHBOURHOOD: [Name]
CITY: [City]
TARGET BUYER: [Type]
RESEARCH DATE: [Date]

REAL ESTATE DATA:
- Average/benchmark price: $[X]
- Price trend: [up/down/flat] vs last year
- Property types available: [detached/condo/townhouse/mix]
- Price range for target buyer type: $[X] – $[X]
- Notable: [anything specific worth mentioning on camera]

SCHOOLS:
- Elementary: [Name(s)] — [rating/reputation if available]
- Middle: [Name(s)] — [rating/reputation if available]
- High school: [Name(s)] — [rating/reputation if available]
- Notable: [any awards, catchment info, French immersion, etc.]

PARKS AND RECREATION:
- Parks: [Names and brief descriptions]
- Recreation centres: [Names]
- Sports facilities: [Any notable ones]
- Trails/paths: [If applicable]

RESTAURANTS AND COFFEE:
- Top restaurants: [3-5 names with one-line descriptions]
- Best coffee: [2-3 names]
- Local food vibe: [casual/trendy/family-friendly/diverse/etc.]

SHOPPING AND ERRANDS:
- Grocery: [Names]
- Shopping: [Mall, strip, boutiques]
- Transit: [Bus routes, LRT, commute time to downtown]

DEVELOPMENT AND GROWTH:
- Recent or upcoming developments: [Names/descriptions]
- Infrastructure improvements: [If any]
- Growth trajectory: [established/growing/up-and-coming]

COMMUNITY CHARACTER:
- Overall vibe: [2-3 words]
- Who lives here: [demographic notes]
- What makes it unique: [key differentiator vs other neighbourhoods]
- Any insider knowledge or lesser-known facts worth mentioning

FILMING STOPS PROVIDED BY AGENT:
1. [Stop 1]
2. [Stop 2]
3. [Stop 3]
4. [Stop 4 if provided]
5. [Stop 5 if provided]

BEST CONTENT ANGLE FOR THIS NEIGHBOURHOOD:
[Based on research — what's the single most compelling thing about this neighbourhood
that will make the video worth watching? This becomes the hook angle.]
```

Do not proceed to script writing until this summary is complete.

---

## Phase 3: Script Building

**Read:** `references/script-guide.md`

Build the full filming package in this order:

### 1 — Hook (Word-for-Word)

The first line the agent says on camera. Recorded at the start of the tour or as an
intro before they start driving/walking.

**Hook rules:**
- Word-for-word — agent reads or memorizes this exactly
- Opens with the single most compelling thing about this neighbourhood
- Names the neighbourhood and city in the first sentence
- Speaks directly to the target buyer type
- Under 30 seconds (about 60-75 words)
- Never opens with "Hey guys, welcome to my channel" or "Today we're going to..."

**Hook formula:**
```
[Compelling fact, stat, or observation about the neighbourhood.]
[One-sentence implication for the target buyer.]
I'm [Agent Name] — real estate agent in [City] — and today I'm taking you inside
[Neighbourhood] so you can see exactly what it's like to live here.
[One-line teaser of what they'll see in the video.]
Let's go.
```

---

### 2 — Stop-by-Stop Filming Guide

For each filming stop the agent provided, build a structured filming card.

**Each stop card contains:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STOP [#] — [LOCATION NAME]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WHAT TO SHOW ON CAMERA:
[1-2 sentences describing what to physically point the camera at — specific, visual,
actionable. What does the viewer see? What makes this spot worth filming?]

KEY TALKING POINTS:
• [Point 1 — stat, fact, or observation specific to this location]
• [Point 2 — lifestyle detail or local knowledge]
• [Point 3 — buyer-relevant insight or tip]
• [Point 4 if applicable]

STATS TO MENTION HERE:
[Pull the 1-2 most relevant stats from the research that fit naturally at this location.
e.g. at a school stop → school name and reputation. At a park → walkability score or
distance to amenities. At a coffee strip → number of local restaurants in the area.]

SUGGESTED LINE TO START THIS STOP:
"[One natural spoken line the agent can use to open this filming stop —
conversational, not scripted-sounding, references the specific location]"

FILMING TIP:
[One practical note about how to film this spot — e.g. "film while walking toward
the entrance," "pan left to show the park," "get out of the car for this one"]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

### 3 — Transition Lines Between Stops

For each transition between stops, write one natural spoken line the agent says
while driving or walking to the next location.

```
TRANSITION [Stop X] → [Stop Y]:
"[Natural line — references what they just saw and teases what's coming next.
Conversational. Like something they'd actually say, not read.]"
```

Transitions should:
- Feel like the agent is thinking out loud — not reading a script
- Reference something specific from the stop they just left
- Build anticipation for the next stop
- Be under 20 seconds (about 40 words max)

---

### 4 — Closing Line (Word-for-Word)

The final thing the agent says on camera. Word-for-word like the hook.

**Closing formula:**
```
[1-2 sentence summary of what makes [Neighbourhood] worth considering.]
[Who it's best for — reference the target buyer type specifically.]
[Soft CTA — not pushy. Natural and genuine.]
If you want to know more about [Neighbourhood] — or any other area in [City] —
[agent's primary CTA from `identity/voice.md` or default: "link in the description to book
a free call and I'll walk you through everything."]
[Subscribe line — "And if you want more neighbourhood guides like this one, subscribe
— I do one of these every month."]
```

---

### 5 — Stats Cheat Sheet

A single reference page the agent keeps on their phone while filming. All key stats
in one place so they never have to remember — they just glance down.

```
[NEIGHBOURHOOD] STATS CHEAT SHEET
────────────────────────────────
Average home price: $[X]
Price trend: [+/-X%] vs last year
Property types: [types]
Price range for [target buyer]: $[X]–$[X]

Schools:
• Elementary: [Name]
• Middle: [Name]
• High school: [Name]

Top spots to mention:
• [Restaurant/café 1]
• [Restaurant/café 2]
• [Park or amenity]
• [Any development or growth note]

Your hook opener:
"[First sentence of the hook — so they can glance and remember it]"
────────────────────────────────
```

---

## Phase 4: Short-Form Video Concepts

**Read:** `references/shortform-guide.md`

Pull 3 short-form concepts from the tour content. Each is a standalone 30-60 second
Reel/TikTok the agent films at one of their stops — not a teaser for the YouTube video,
a complete piece of content on its own.

### Concept 1 — The Stat Hook
Built around the single most compelling number from the research.
Filmed at whichever stop best illustrates that stat visually.

### Concept 2 — The Local Gem
Built around the most interesting restaurant, café, park, or hidden feature discovered
in research. The agent films at that specific spot and talks about why it matters to
buyers considering this neighbourhood.

### Concept 3 — The Buyer Take
The agent's direct advice to the target buyer type. "If you're a [target buyer] looking
at [Neighbourhood], here's what I'd want you to know." Filmed at the most visually
compelling stop — ideally somewhere that shows the neighbourhood's character.

**Each concept includes:**
- Which stop to film it at
- Word-for-word hook line
- 4-5 bullet point talking points
- CTA line
- Instagram/TikTok caption with hashtags

---

## Phase 5: Save as a clean Google Doc

**Read `${CLAUDE_PLUGIN_ROOT}/shared/doc-formatting.md` first.** Build this as well-structured plain text
and create it as a Google Doc via the Drive connector — do NOT render a `.docx` (it won't convert in
Cowork and lands as a broken file).

### Document Structure

```
COVER PAGE
  [Neighbourhood Name] Tour Guide
  Agent name | Date | Target buyer

─────────────────────────────────
SECTION 1: NEIGHBOURHOOD OVERVIEW
  Research summary in plain English
  Key stats at a glance

─────────────────────────────────
SECTION 2: YOUTUBE FILMING GUIDE
  Hook (word-for-word, boxed)
  Stop 1 card
  Transition 1→2
  Stop 2 card
  Transition 2→3
  Stop 3 card
  [Continue for all stops]
  Closing line (word-for-word, boxed)

─────────────────────────────────
SECTION 3: STATS CHEAT SHEET
  (Designed to be screenshot and kept on phone)

─────────────────────────────────
SECTION 4: SHORT-FORM CONCEPTS
  Concept 1 — The Stat Hook
  Concept 2 — The Local Gem
  Concept 3 — The Buyer Take

─────────────────────────────────
DATA SOURCES
  List of sources used with URLs
```

### Formatting (per the doc-formatting standard)
- Title + meta line ([Neighbourhood] · agent · date · target buyer), then ALL-CAPS section headers each
  with an em-dash divider above and a blank line below.
- Hook and closing line set off with a label + dividers above and below (plain text can't shade) so
  they're clearly word-for-word.
- Stop cards clearly separated with a divider between each; transition lines on their own line, labelled.
- Stats cheat sheet kept clean and minimal — all key info in a tight block the agent can screenshot.
- `•` bullets, one per line; generous blank-line spacing.
- No brand colours — every doc renders to one clean neutral standard (visual brand design lives in the agent's design tool).

Create the Google Doc in the agent's Drive **`Realtor AI Brain` → `exports`**, named
`Tour · [Neighbourhood] · [City]`, and tell the agent the location + link.

---

## Phase 6: Write Back to the Brain

**The second law.** Append one row per deliverable to `~/realtor-brain/memory/content-log.md` — the
tour YouTube video + the 3 short-form concepts — Status `Scripted`, Listing/Area = the neighbourhood:

```
| [date] | YouTube | Tour | [Neighbourhood] drive-and-talk tour | [Neighbourhood] | Scripted | — |
| [date] | Reels   | Short — [concept] | [angle] | [Neighbourhood] | Scripted | — |
```

Then tell the agent: *"Logged your [neighbourhood] tour to your Brain."*

**Then push to Drive:** run `realtor-brain-sync` (PUSH) so this write survives the session — the local
copy is wiped when the session ends; an unsynced write is a lost write.

---

## Quality Checklist

### Research
- [ ] Real estate prices found and sourced
- [ ] At least 2 schools identified by name
- [ ] At least 3 amenities (parks, rec centres, trails) found
- [ ] At least 3 restaurants or cafés found by name
- [ ] Development or growth notes included
- [ ] Community character described with specifics — not just "great neighbourhood"
- [ ] All data sources listed at the end of the document

### YouTube Script
- [ ] Hook is word-for-word, under 75 words, opens with a compelling stat or observation
- [ ] Hook names the neighbourhood and city in the first sentence
- [ ] Every stop has a filming card with talking points, stats, suggested opening line, and filming tip
- [ ] Transition lines written for every gap between stops
- [ ] Transition lines sound natural and conversational — not scripted
- [ ] Closing line is word-for-word and includes the agent's CTA and subscribe ask
- [ ] Stats cheat sheet includes all key numbers on one page

### Short-Form Concepts
- [ ] All 3 concepts are standalone — don't reference "the full YouTube video"
- [ ] Each concept is filmed at a specific named stop
- [ ] All 3 hooks use different formulas
- [ ] Each concept speaks to the target buyer type
- [ ] All 3 include caption with local hashtags

### Voice
- [ ] Talking points sound like something a real person would say while driving or walking
- [ ] No "in today's market" or generic real estate filler language
- [ ] Neighbourhood name used specifically throughout — never "this area" or "around here"
- [ ] Target buyer type referenced at least once per stop
