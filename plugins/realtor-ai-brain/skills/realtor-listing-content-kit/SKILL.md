---
name: realtor-listing-content-kit
description: >
  Realtor Listing Content Kit — takes a new listing's details and generates a complete
  content package for launch across YouTube and short-form platforms. Produces a YouTube
  walkthrough script (room by room), full YouTube SEO package (title, description, tags,
  hashtags), and 3 short-form Reel/TikTok scripts (just listed announcement, top 3 features,
  neighbourhood angle) each with a ready-to-post caption. Everything compiled into one
  clean Google Doc. Agent inputs the address, key features, price, neighbourhood, and target
  buyer type — Claude does the rest.

  Trigger on: "listing content kit", "new listing content", "create content for my listing",
  "listing video script", "YouTube for my listing", "reels for my listing", "listing launch
  content", "just listed content", "content for [address]", "listing content package",
  or any request where the agent wants to create YouTube or short-form content for a
  specific property listing.
---

# Realtor Listing Content Kit

When a new listing goes live, this skill builds the complete content package — a YouTube
walkthrough script and 3 ready-to-film Reels — so the property gets maximum exposure
across both platforms from day one.

The agent provides the listing details. Claude builds the content.

---

## Before You Start

### Step 1 — Load the Brain

**Read `~/realtor-brain/brain.md` first**, then open what this skill needs:

- `~/realtor-brain/identity/profile.md` — name, city, booking link, CTA, brokerage
- `~/realtor-brain/identity/voice.md` — tone, voice characteristics, what they never want to sound like
- `~/realtor-brain/identity/avatars.md` — buyer profiles, to target the listing content
- `~/realtor-brain/identity/offer.md` — services/guarantees worth mentioning in listing content
- `~/realtor-brain/identity/brand-visual.md` — brand context (the Doc itself is clean plain text)
- `~/realtor-brain/memory/listings.md` — **has this address been worked before? what content already
  exists for it?** Don't re-script content already marked done.

Apply everything found here to the tone, CTA, and voice of every output. Never ask for anything the
Brain already holds. **If `~/realtor-brain/` doesn't exist, tell the agent to run _Realtor AI Brain —
Setup_ first.**

### Step 1b — Before you publish (always)
- **Compliance:** read `~/realtor-brain/identity/compliance.md`. Append the required brokerage disclaimer
  + license # to every public-facing output, and never make a claim on its "claims to avoid" list. *(If
  `compliance.md` is empty/unset, proceed but flag it to the agent.)*
- **No placeholders:** if any identity file you rely on still contains `[bracketed]` template text, treat
  that field as missing — ask the agent or skip it. **Never output bracketed placeholder text.**

### Step 2 — Read Skill Reference Files

1. `references/listing-research-guide.md` — what to research about the property and neighbourhood
2. `references/youtube-script-guide.md` — how to write a room-by-room walkthrough script
3. `references/reels-guide.md` — how to write the 3 short-form scripts
4. `references/seo-guide.md` — how to write the YouTube SEO package for a listing video

---

## Phase 1: Intake

### Always required

1. **Address** — full street address including city and neighbourhood
2. **Key features** — everything notable about the property. The agent should list as many
   as they want: bedrooms, bathrooms, square footage, lot size, finishes, recent renovations,
   unique features, outdoor space, garage, basement, views, special upgrades, appliances,
   age of home, anything that makes this listing stand out
3. **Asking price** — the listed price
4. **Neighbourhood** — if not obvious from the address, confirm which community/area
5. **Target buyer type** — who is this home for?
   (e.g. first-time buyers, young families, upsizers, downsizers, investors, relocators)

### Optional — enhances the output significantly
6. **Open house details** — date, time, if applicable
7. **Any specific angle or hook** the agent has in mind
8. **Competing listings context** — is this priced well vs the competition? Any urgency?
9. **Agent's personal take** — what do they love most about this property?

### With the Brain loaded
Skip any questions the Brain already answers (city, voice, CTA, buyer avatars). Focus only on the
listing-specific details above. If `memory/listings.md` already has this address, confirm with the
agent whether they want to add to it or refresh it — don't silently duplicate.

---

## Phase 2: Listing Research

**Read:** `references/listing-research-guide.md`

Before writing any content, Claude researches the listing's context. This adds
credibility and specificity that the agent's input alone can't provide.

### Step 1 — Neighbourhood Research

Search for current data on the property's specific neighbourhood:

- `[neighbourhood] [city] average home price [year]`
- `[neighbourhood] [city] days on market [year]`
- `[neighbourhood] [city] schools`
- `[neighbourhood] [city] amenities parks restaurants`
- `[neighbourhood] [city] walkability transit`
- `[neighbourhood] [city] new development [year]`

Extract:
- Average/benchmark price for this neighbourhood (context for the asking price)
- Days on market average (to frame urgency if applicable)
- Top schools within the catchment
- 2-3 notable nearby amenities, restaurants, or parks by name
- Any notable community features (trail systems, LRT access, upcoming development)

### Step 2 — Comparable Context

- Is the asking price above, at, or below the neighbourhood average?
- What does this price point typically get in this neighbourhood?
- Any relevant market conditions worth mentioning (seller's market, inventory levels)?

### Step 3 — Organize Research Summary

```
LISTING: [Address]
NEIGHBOURHOOD: [Name]
CITY: [City]
ASKING PRICE: $[X]
TARGET BUYER: [Type]

PROPERTY DETAILS (from agent input):
- Bedrooms: [X]
- Bathrooms: [X]
- Square footage: [X]
- Key features: [bulleted list from intake]
- Agent's favourite feature: [if provided]

NEIGHBOURHOOD CONTEXT:
- Average price in [neighbourhood]: $[X]
- This listing vs average: [above/below/at] by [%/$]
- Average DOM in area: [X] days
- Catchment schools: [Names]
- Nearby highlights: [2-3 named spots]
- Community notes: [any development, trail, transit worth mentioning]

MARKET CONTEXT:
- Current conditions: [seller's/balanced/buyer's market]
- Relevant urgency factors: [if applicable]
- Open house: [date/time if provided]
```

---

## Phase 3: YouTube Walkthrough Script

**Read:** `references/youtube-script-guide.md`

A room-by-room walkthrough script the agent films while physically moving through
the property. Structured, specific, and designed to make a buyer feel like they've
been inside the home before they book a showing.

### Script Structure

**HOOK (word-for-word, 30-45 seconds)**

Opens with the listing's single most compelling feature or the most relevant thing
for the target buyer — not "hey guys, welcome back."

Formula:
```
[Most compelling feature or price context for this buyer type.]
[One sentence on why this listing matters to the target buyer right now.]
I'm [Agent Name] — real estate agent in [City] — and today I'm taking you
inside [Address] in [Neighbourhood].
[Price + brief property summary in one sentence.]
Let's walk through it.
```

**EXTERIOR / ARRIVAL (60-90 seconds)**
- Curb appeal description
- Lot size, driveway, garage if applicable
- Street context — what does the block feel like?
- Talking points: [specific to this property's exterior features]
- Transition line into the home

**ENTRYWAY / FOYER (30-60 seconds)**
- First impression — what hits you when you walk in?
- Ceiling height, flooring, natural light
- Layout preview — what can you see from here?

**MAIN LIVING AREAS (2-3 minutes)**
Cover each main living space: living room, dining room, family room
For each:
- What's visually notable (windows, fireplace, built-ins, views)
- Size and flow
- Key features or upgrades
- Buyer-relevant observation (e.g. "big enough for a sectional and still have room")

**KITCHEN (60-90 seconds)**
This is always a priority room — spend time here.
- Counter space, storage, island
- Appliances (brand/age if notable)
- Finishes
- Any recent renovation or upgrade
- Connection to dining or outdoor space

**BEDROOMS (60-90 seconds per bedroom)**
Primary bedroom first — longest coverage.
- Size, natural light, closet
- Ensuite details if applicable
Additional bedrooms:
- Size context ("fits a queen plus a desk")
- Natural light, closet

**BATHROOMS (30-45 seconds each)**
- Finishes (tile, fixtures, vanity)
- Any renovations or upgrades
- Practical context (double vanity, soaker tub, heated floors, etc.)

**BASEMENT / BONUS SPACES (if applicable, 60-90 seconds)**
- Finished vs unfinished
- Ceiling height
- Current use and potential

**OUTDOOR SPACE (60-90 seconds if applicable)**
- Deck, patio, yard size
- Privacy, fencing
- Any outdoor features (hot tub, garden, shed)
- Seasonal context ("south-facing — sun all afternoon")

**NEIGHBOURHOOD CLOSE (60-90 seconds)**
Agent steps outside or stays on camera.
- Named schools in catchment
- Named nearby amenities (use research data)
- Commute context
- Why this neighbourhood fits the target buyer

**CLOSING LINE (word-for-word, 30-45 seconds)**
```
[One-sentence summary of what makes this property the right fit for the target buyer.]
[Honest framing — who is this home perfect for?]
It's listed at $[X]. If you want to book a private showing or have any questions —
[agent's primary CTA].
And if you're searching for homes in [City] — subscribe. I post new listings and
market updates every week.
```

### Script Formatting Notes
- Label each section clearly with [ROOM: Name] headers
- Include [POINT CAMERA AT: description] directions in brackets throughout
- Every room ends with a transition line to the next room
- Written in natural spoken language — how the agent would actually talk while walking
- Agent's name, city, and booking link as placeholders throughout

---

## Phase 4: YouTube SEO Package

**Read:** `references/seo-guide.md`

Generate immediately after the script — uses the same property details and research.

Produce:
- **5 title variations** — optimized for local search with neighbourhood and city name
- **Full description** (150-300 words) — keyword-rich, conversational, property highlights,
  neighbourhood context, CTA with booking link appearing twice (top and bottom)
- **Short description** — condensed version
- **15 tags** across 5 tiers: exact match → broad → neighbourhood → property type → long-tail
- **8 hashtags** — mix of local, property type, and audience tags

After generating all 5 titles, explicitly identify the primary working title that will
anchor the description and tags.

---

## Phase 5: 3 Reel/TikTok Scripts

**Read:** `references/reels-guide.md`

Three standalone short-form scripts — each a completely different angle on the same
listing. All word-for-word ready to film. Each works without requiring the viewer to
have seen the YouTube video.

### Reel 1 — Just Listed Announcement

**Purpose:** Maximum reach and immediate awareness. The first content posted when
the listing goes live. Energy is excited but not salesy.

**Format:** Talking head or quick property walkthrough highlights. 30-45 seconds.

**Script structure:**
```
HOOK (word-for-word):
"Just listed in [Neighbourhood], [City] — and this one [compelling one-liner
about what makes it stand out for the target buyer]."

PROPERTY HIGHLIGHTS (15-20 seconds):
[3-4 punchy bullet points spoken out loud — bedroom count, price, top feature,
neighbourhood context. Fast, factual, conversational.]

CTA (5-10 seconds):
[Single action — link in bio, DM for details, book a showing]
```

Caption: Hook adapted for reading + 3 lines of property details + CTA + hashtags.

---

### Reel 2 — Top 3 Features

**Purpose:** Showcases the listing's most compelling selling points to the target buyer.
More detailed than the announcement. Designed to drive showing requests.

**Format:** Filmed inside the property, moving through the 3 best features.
45-60 seconds.

**Script structure:**
```
HOOK (word-for-word):
"Three things that make [Address / 'this [neighbourhood] home'] different from
everything else in this price range."

FEATURE 1 (10-15 seconds):
[Bold feature name spoken first]
[What it is, what it looks like, why it matters to this buyer]
[ON SCREEN: Feature name in text overlay]

FEATURE 2 (10-15 seconds):
[Same format]

FEATURE 3 (10-15 seconds):
[Same format — save the best for last]

CTA (5-10 seconds):
[Single action]
```

Caption: Hook + the 3 features listed out + price + CTA + hashtags.

---

### Reel 3 — Neighbourhood Angle

**Purpose:** Sells the location and lifestyle, not just the property. Targets buyers
who are evaluating the neighbourhood as much as the home itself. Filmed outside —
on the street, at a nearby amenity, or in front of the home.

**Format:** Talking head, filmed outside the property or at a nearby landmark.
30-45 seconds.

**Script structure:**
```
HOOK (word-for-word):
[Opens with the neighbourhood, not the listing — something specific about where
this home is located that matters to the target buyer]
"[Neighbourhood] in [City] is [specific quality relevant to buyer type]."
OR
"You're not just buying [Address] — you're buying into [Neighbourhood].
Here's what that actually means."

NEIGHBOURHOOD TAKE (20-25 seconds):
[3 neighbourhood facts pulled from research — schools, amenities, commute,
lifestyle. All named specifically — no "nearby schools" or "local amenities."]

LISTING BRIDGE (5-10 seconds):
[Connect the neighbourhood context back to the listing]
"And this specific home puts you [distance/relationship] to all of that."

CTA (5-10 seconds):
[Single action]
```

Caption: Neighbourhood-first hook + 3 named local highlights + listing details + CTA + hashtags.

---

## Phase 6: Save as a clean Google Doc

**Read `${CLAUDE_PLUGIN_ROOT}/shared/doc-formatting.md` first.** Build this as well-structured plain text
and create it as a Google Doc via the Drive connector — do NOT render a `.docx` (it won't convert in
Cowork and lands as a broken file).

### Document Structure

```
COVER PAGE
  [Address] — Listing Content Kit
  Agent name | Date | Listed at $[X]

─────────────────────────────────────
SECTION 1: LISTING & NEIGHBOURHOOD OVERVIEW
  Property summary
  Neighbourhood context and research findings
  Price context vs neighbourhood average

─────────────────────────────────────
SECTION 2: YOUTUBE WALKTHROUGH SCRIPT
  Hook (shaded box — word-for-word)
  Exterior section
  Room-by-room walkthrough
  Neighbourhood close
  Closing line (shaded box — word-for-word)

─────────────────────────────────────
SECTION 3: YOUTUBE SEO PACKAGE
  5 title variations (primary title marked)
  Full description
  Short description
  15 tags
  8 hashtags

─────────────────────────────────────
SECTION 4: REEL/TIKTOK SCRIPTS
  Reel 1 — Just Listed Announcement
    Script + Caption
  Reel 2 — Top 3 Features
    Script + Caption
  Reel 3 — Neighbourhood Angle
    Script + Caption

─────────────────────────────────────
DATA SOURCES
  Research sources used with URLs
```

### Formatting (per the doc-formatting standard)
- Title + meta line ([Address] · agent · date · price), then ALL-CAPS section headers each with an
  em-dash divider above and a blank line below.
- Hook and closing line set off with a clear label + dividers above and below (plain text can't shade) so
  they're visually distinct and obviously word-for-word.
- Room labels as their own lines through the walkthrough; `[POINT CAMERA AT]` directions on their own line.
- Reel scripts each under a clear `REEL 1 / 2 / 3` label; captions separated from scripts by a divider.
- `•` bullets, one per line; generous blank-line spacing between blocks.
- No brand colours — every doc renders to one clean neutral standard (visual brand design lives in the agent's design tool).

Create the Google Doc in the agent's Drive **`Realtor AI Brain` → `exports`**, named
`Listing Kit · [Address]`, and tell the agent the location + link.

---

## Phase 7: Write Back to the Brain

**The second law — do not skip it.** This listing and its content now become part of the agent's
memory so other skills (and AI Admin) know about it and nothing gets re-made.

**1. Update `~/realtor-brain/memory/listings.md`.** If a block for this address exists, update it;
otherwise add one. Tick the content you just produced:

```markdown
## [Address] — Active
- Price: $[X] · Beds/Baths: [X]/[X] · Type: [type]
- Key features: [top 3–5 from intake]
- Target buyer: [avatar]
- Content made: [x] YouTube walkthrough  [x] Reels (3)  [ ] Just-listed graphic  [ ] Email
- Notes: [open house date if any]
```

**2. Append to `~/realtor-brain/memory/content-log.md`** — one row per deliverable (the YouTube
walkthrough + the 3 Reels), Status `Scripted`, Listing/Area = the address:

```
| [date] | YouTube | Walkthrough | [Address] room-by-room | [Address] | Scripted | — |
| [date] | Reels   | Short — just listed | [Address] just-listed | [Address] | Scripted | — |
| [date] | Reels   | Short — top 3 features | [Address] features | [Address] | Scripted | — |
| [date] | Reels   | Short — neighbourhood | [Neighbourhood] angle | [Address] | Scripted | — |
```

Then tell the agent: *"Logged [address] to your Brain — walkthrough + 3 Reels recorded so we won't
duplicate them."*

**Then push to Drive:** run `realtor-brain-sync` (PUSH) so this write survives the session — the local
copy is wiped when the session ends; an unsynced write is a lost write.

---

## Quality Checklist

### Research
- [ ] Neighbourhood average price found and compared to asking price
- [ ] At least 2 schools identified by name
- [ ] At least 2 named amenities or local spots found
- [ ] Market conditions noted
- [ ] Research sources listed at end of document

### YouTube Script
- [ ] Hook opens with the listing's most compelling feature — not a greeting
- [ ] Every room has a [POINT CAMERA AT] direction
- [ ] Every room ends with a transition line to the next space
- [ ] Kitchen covered in detail — it's always a priority room
- [ ] Neighbourhood close uses named schools and amenities from research
- [ ] Closing line is word-for-word with price, CTA, and subscribe ask
- [ ] Written in spoken language — not a property description

### SEO Package
- [ ] All 5 titles include neighbourhood and city name
- [ ] Primary title explicitly identified
- [ ] Description opens with a keyword-rich hook sentence
- [ ] Booking link appears twice in the full description
- [ ] 15 tags using 5-tier hierarchy
- [ ] Year (2026) included in titles and tags

### Reel Scripts
- [ ] All 3 hooks use different formulas
- [ ] All 3 are completely standalone — no "watch my full YouTube video"
- [ ] Reel 1 feels like an announcement — energy and speed
- [ ] Reel 2 names and describes 3 specific features
- [ ] Reel 3 opens with the neighbourhood, not the listing
- [ ] All 3 captions have different opening lines
- [ ] All captions include local hashtags (#[Neighbourhood], #[City]RealEstate)

### Voice
- [ ] Sounds like a knowledgeable agent talking about a specific home — not a listing brochure
- [ ] No "stunning," "gorgeous," "dream home," "nestled" or hollow descriptors
- [ ] Target buyer referenced at least once per section
- [ ] Agent's city and neighbourhood named specifically throughout

### Brain
- [ ] `memory/listings.md` updated for this address with the "Content made" boxes ticked (Phase 7)
- [ ] All deliverables appended to `memory/content-log.md`
