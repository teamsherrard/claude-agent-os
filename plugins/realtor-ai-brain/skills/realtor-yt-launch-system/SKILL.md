---
name: realtor-yt-launch-system
description: >
  Realtor YouTube Launch System — takes a YouTube video topic or transcript from a real estate agent
  and generates every written deliverable needed to launch and repurpose the video. Produces a single
  clean, formatted doc containing: YouTube SEO package (titles, description, tags), two launch emails
  (launch-day + 3-day follow-up), 3 short-form Reel/TikTok scripts with captions, platform captions
  for Instagram, TikTok, Facebook, and LinkedIn, and a launch checklist. Designed for real estate
  agents who are beginners — every output is word-for-word ready to use. Reads the agent's Brain
  automatically if present (brand, market, persona) so nothing needs to be re-entered each run.

  Trigger on: "launch my video", "YouTube launch package", "video launch kit", or any time an agent
  shares a video topic, outline, or transcript and wants launch content created from it. BOUNDARY: if
  the dedicated Realtor YouTube System plugin is installed, defer to it for YouTube ideation, scripting,
  SEO, and repurposing ("what should I film", "make this video", "repurpose this") — this skill is the
  built-in quick launcher for agents who don't have the full YouTube System.
---

# Realtor YouTube Launch System

One-shot generation engine for real estate agents. When triggered, you produce every written deliverable
needed to launch a YouTube video AND repurpose it into short-form content — compiled into a single
clean, formatted doc the agent can hand directly to a VA or use themselves.

This skill is built for beginners. Every output must be word-for-word ready to copy, paste, or read.
No agent should have to figure anything out after receiving this document.

---

## Before You Start

### Step 1 — Load the Brain
**Read `~/realtor-brain/brain.md` first**, then open these and extract everything relevant. Do NOT ask
the agent for anything already in the Brain:

- `~/realtor-brain/identity/profile.md` — name, city/market, booking link, social handles, credentials
- `~/realtor-brain/identity/avatars.md` — ideal client, neighbourhoods, buyer/seller pain points
- `~/realtor-brain/identity/voice.md` — tone, what they never want to sound like, tagline, signature phrases
- `~/realtor-brain/identity/brand-visual.md` — brand context (the doc itself renders in the neutral house style — no brand colours)
- `~/realtor-brain/memory/content-log.md` — what's already been launched/repurposed, to avoid overlap

**Applying what you find:** apply this context actively across every single deliverable — not just as
background awareness. Specifically:
- **voice.md:** Match the agent's tone, use their signature phrases, avoid anything they've flagged as
  off-brand. If they're bold and direct, every script and caption should reflect that.
- **avatars.md:** Every hook, script, and caption should speak to the specific buyers, sellers, or
  investors in the agent's market — using their pain points, neighbourhoods, and local conditions.
- **profile.md:** Use their real name, city, booking link, and credentials naturally throughout.

**If `~/realtor-brain/` doesn't exist, tell the agent to run _Realtor AI Brain — Setup_ first** — then
the intake questions below collect only what's video-specific.

### Step 1b — Before you publish (always)
- **Compliance:** read `~/realtor-brain/identity/compliance.md`. Append the required brokerage disclaimer
  + license # to every public-facing output, and never make a claim on its "claims to avoid" list. *(If
  `compliance.md` is empty/unset, proceed but flag it to the agent.)*
- **No placeholders:** if any identity file you rely on still contains `[bracketed]` template text, treat
  that field as missing — ask the agent or skip it. **Never output bracketed placeholder text.**

### Step 2 — Read Skill Reference Files
Read these in order before generating anything:

1. `references/realtor-avatar.md` — Who this content speaks to. Every word flows from this.
2. `references/realtor-voice.md` — How an authentic local real estate agent sounds. Not corporate. Not generic.
3. `references/realtor-seo-guide.md` — How to write titles, descriptions, and tags that rank locally.

You will read additional reference files as you generate each section (noted below).

---

## Phase 1: Intake

Before generating, check what's already known from the Brain (see Before You Start). Only ask for information that isn't already covered. Keep it conversational — not a form.

### Always Required (Video-Specific — Not in the Brain)

1. **Video topic or transcript** — What is this specific video about? Paste outline, transcript, or a 2-3 sentence summary.
2. **Target viewer for this video** — Who is this video specifically for? (e.g., first-time buyers, home sellers, move-up buyers, investors, people relocating — may differ video to video even if the agent has a general target market)
3. **Primary CTA for this video** — What should viewers do after watching this specific video? (e.g., book a free consultation, DM the agent, download a resource, subscribe)

### Only Ask If the Brain Is Missing It

4. **Agent name** — First name for CTAs and sign-offs (skip if in `identity/profile.md`)
5. **City / market** — Their primary market (skip if in `identity/profile.md`)
6. **Brand colors / style** — For document formatting (skip if in `identity/brand-visual.md`)

### If the agent pastes a full transcript
Extract everything you can directly from it. Only ask for what's genuinely missing after reading it.

---

## Phase 2: Generation Sequence

Generate deliverables in this exact order. Each section builds on the ones before it.

**Formatting rule for ALL sections:** Every section ends up in one clean, formatted doc. Format output so that
each paragraph, bullet, and label is on its own line separated by line breaks. No walls of text.
See Phase 3 for full formatting rules.

---

### Step 1: YouTube SEO Package
**Read:** `references/realtor-seo-guide.md`

Generate first — the primary keyword and title cascade into thumbnails, emails, and captions.

Produce:
- 5 title variations (local SEO + click-worthy, using the agent's city)
- Full YouTube description (150-300 words, keyword-rich, readable)
- Short YouTube description (condensed version)
- 15 keywords/tags using the 5-tier hierarchy (local + broad mix)
- 8 hashtags

The selected primary title and keyword will anchor every downstream deliverable. After generating
all 5 titles, explicitly identify which one is the working primary title and state it clearly before
moving to the next step — this is what all emails, captions, and scripts will reference.

---

### Step 2: Promotional Emails
**Read:** `references/email-guide.md`

Generate two emails for this launch — a launch-day email and a 3-day follow-up.

**Email 1 — Launch Day**
Goes out the day the video publishes. Drives the first wave of views. Direct, warm, feels like
it's from a real person — not a marketing department.

Produce:
- 3 subject line options
- 3 preview text options
- Email body (80-150 words)
- P.S. line (connects to lead magnet or bonus, if applicable)

**Email 2 — 3-Day Follow-Up**
Goes out 3 days after launch to anyone who didn't open or click Email 1. Re-engages with a
different angle — not a repeat of the same pitch. Shorter, softer, curiosity-driven.

Produce:
- 2 subject line options (different angle from Email 1 — question or curiosity gap format)
- Email body (60-100 words)
- Single CTA line

---

### Step 3: Short-Form Repurposing — 3 Reel/TikTok Scripts
**Read:** `references/short-form-guide.md`, `references/hook-formulas.md`

This is the core repurposing engine. Pull the 3 best moments, angles, or insights from the
YouTube video and turn each one into a standalone 30-60 second Reel/TikTok script.

Each script must be:
- Word-for-word ready to read to camera
- Structured: Hook (3 sec) → Value (20-45 sec) → CTA (5-10 sec)
- Written in plain, conversational language — how the agent would actually talk
- Designed to work WITHOUT watching the YouTube video (standalone content)

For each of the 3 scripts, produce:
- Script title / concept angle
- Recommended length (15s / 30s / 60s)
- **Delivery format:** Label each script as one of: `Talking Head` / `Green Screen — pair with article or stat background` / `B-Roll Voiceover` — or a hybrid/custom format if the video content calls for it. Base this on the content type — stat-heavy or article-based scripts suit green screen; personal opinion or story scripts suit talking head.
- Hook line (what they say first — must stop the scroll)
- Full word-for-word script
- On-screen text suggestions in [BRACKETS] (what to show while talking)
- CTA line at the end
- Caption for Instagram/TikTok (with hashtags)

---

### Step 4: Platform Captions (4 Platforms)
**Read:** `references/platform-rules.md`, `references/hook-formulas.md`

Standalone captions for promoting the YouTube video on each platform. These are separate from
the Reel captions in Step 3 — these promote the long-form YouTube video directly.

Produce:
- Instagram caption (story hook → value tease → CTA with link in bio)
- TikTok caption (short, native, trending energy)
- Facebook post (conversational, link in first comment)
- LinkedIn post (authority angle, longer format, link in first comment)

Each caption adapts the core message natively. Do not copy-paste across platforms.

---

### Step 5: Launch Checklist

Generate a launch checklist for this specific video by pulling the relevant items from the master
list below. Only include items that apply — omit anything not relevant to this launch (e.g. skip
lead magnet items if no lead magnet was created). Group into the four phases below.

**MASTER TASK LIST — Pull from this:**

PRE-LAUNCH (Before Publishing)
- [ ] Video edited and exported at 1080p or higher
- [ ] Video uploaded to YouTube as Unlisted (not public yet)
- [ ] Primary title selected from SEO package and entered in YouTube Studio
- [ ] Full description copied in with booking link confirmed (replace [LINK] with real URL)
- [ ] All 15 tags entered in YouTube Studio
- [ ] End screen added (subscribe button + suggested video)
- [ ] Cards added at key moments in the video
- [ ] Custom thumbnail uploaded
- [ ] Chapters added using the timestamps from the description
- [ ] Email sequences loaded into email platform and scheduled (launch day + 3-day follow-up)
- [ ] All social captions drafted and ready to schedule or post

LAUNCH DAY
- [ ] Video set to Public in YouTube Studio
- [ ] Launch-day email sent to list
- [ ] Instagram caption posted (Reel or feed post)
- [ ] TikTok posted (if applicable)
- [ ] Facebook post published with link in first comment
- [ ] LinkedIn post published with link in first comment
- [ ] Stories posted on Instagram and Facebook pointing to the new video

POST-LAUNCH (Days 2-7)
- [ ] Reply to all YouTube comments within 24 hours of publishing
- [ ] Reply to all Instagram comments and DMs from launch day
- [ ] 3-day follow-up email sent to non-openers
- [ ] Check YouTube analytics at 48 hours — note CTR, watch time, and top traffic sources
- [ ] Pin a comment on YouTube with the lead magnet link or a key takeaway

ONGOING
- [ ] Add video to relevant YouTube playlist
- [ ] Link to this video from older related videos (update descriptions)
- [ ] Save top-performing caption for future reference

---

## Phase 3: Save as a clean, formatted doc

After all sections are generated, save them as one clean, formatted doc.

**Read `${CLAUDE_PLUGIN_ROOT}/shared/doc-formatting.md` first.** Build this as well-structured text (the
grammar in that file), write it to a temp file (e.g. `/tmp/doc.txt`), and render it to a styled `.docx`:
`python3 "${CLAUDE_PLUGIN_ROOT}/shared/render_doc.py" /tmp/doc.txt "YouTube Launch · [Video Topic].docx" --title "[Video Topic] — YouTube Launch Package" --subtitle "[Agent] · [City]"`
Then upload the `.docx` via the Drive connector.

### Formatting (per the doc-formatting standard)
- Title + meta line (video title · agent · date · "YouTube Launch Package"), then ALL-CAPS section
  headers each with an em-dash divider above and a blank line below.
- Separate paragraphs with blank lines; `•` bullets one per line; numbered items each on their own line
  (never inline — e.g. title variations stacked, not run together); checklist items as `— [ ]` on their
  own line.
- Script lines each on their own line — never run dialogue together; **bold labels** like `Subject Line:`
  on their own line.
- Script/email sections set off with a clear label + dividers above and below so they're visually
  distinct from the copy.
- Omit any section that doesn't apply.
- No brand colours — every doc renders to one clean neutral standard (visual brand design lives in the agent's design tool).

Upload the rendered `.docx` to the agent's Drive **`Realtor AI Brain` → `exports`** (find-or-create
`exports`), named `YouTube Launch · [Video Topic]`, and tell the agent the location + link.

---

## Phase 4: Write Back to the Brain

**The second law.** This video and its repurposed pieces become part of the agent's memory. Append to
`~/realtor-brain/memory/content-log.md` — the YouTube long-form plus each short-form Reel generated —
Status `Scripted`:

```
| [date] | YouTube | Long-form | [video topic] | [area] | Scripted | — |
| [date] | Reels   | Short — repurpose | [angle from the video] | [area] | Scripted | — |
```

Then tell the agent: *"Logged this launch to your Brain — the video and its Reels are on record."*

**Then push to Drive:** run `realtor-brain-sync` (PUSH) so this write survives the session — the local
copy is wiped when the session ends; an unsynced write is a lost write.

---

## Quality Checklist (Run Before Delivering)

### Avatar Alignment
- [ ] Every deliverable speaks to one specific type of buyer/seller/investor — not "everyone"
- [ ] Tone is warm, local, and knowledgeable — not corporate or generic
- [ ] Content makes the viewer feel informed, not sold to

### Voice and Authenticity
- [ ] Sounds like a real person from that city — not a generic AI real estate post
- [ ] City/market name appears naturally throughout (not just in titles)
- [ ] No phrases like "in today's ever-changing market" or "as a real estate professional"
- [ ] No corporate language, no hollow motivational fluff

### Short-Form Scripts
- [ ] Each script works as fully standalone content — no "as I mentioned in my YouTube video"
- [ ] Hook stops the scroll — specific, not generic
- [ ] On-screen text suggestions are actionable (stats, lists, key phrases)
- [ ] Each of the 3 scripts has a meaningfully different angle/hook — not 3 versions of the same thing

### CTA Accuracy
- [ ] Instagram captions direct viewers to link in bio or a simple "DM me" CTA
- [ ] LinkedIn posts have NO links in body — link in first comment only
- [ ] Facebook posts have link in comments, not body
- [ ] Each email has exactly ONE link CTA
- [ ] All [LINK] placeholders flagged — agent must replace with real URLs before sending
- [ ] Agent name is correct and consistent throughout

### Emails
- [ ] Launch-day email and 3-day follow-up both generated
- [ ] Follow-up email has a different angle/subject from the launch email — not a repeat

### SEO
- [ ] Agent's city appears in title, description, and tags
- [ ] Primary keyword leads the description
- [ ] Current year included in titles and tags
- [ ] 15 tags using 5-tier hierarchy

### Consistency
- [ ] Same core message adapted natively across all platforms
- [ ] Email hook connects to video hook
- [ ] Reel scripts pull from actual video content — not invented separately
