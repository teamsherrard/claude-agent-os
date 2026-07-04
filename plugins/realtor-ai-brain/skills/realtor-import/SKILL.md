---
name: realtor-import
description: >
  Imports the real estate agent's EXISTING materials into their Realtor AI Brain instead of making them
  retype everything — testimonials, reviews, a bio, past posts/emails/scripts, market reports/CMAs, lead
  magnets, workbooks, listing presentations. Two ways in: the agent UPLOADS files to the chat, or points
  to a Google Drive folder (or drops files in their `Realtor AI Brain/intake` folder) and Claude reads them
  via the Drive connector. Claude extracts what it can, maps each piece to the right Brain file, shows a
  summary, and writes only after the agent confirms. Never crawls the whole Drive; never fabricates. Runs as
  an optional accelerator at the START of Brain Setup, inside Voice & Proof / Offer, or anytime on demand.

  Trigger on: "import my materials", "import my files", "pull from my drive", "I have testimonials/reviews",
  "I have a bio / market reports / lead magnet / workbook", "use my existing stuff", "upload my files",
  "read my drive folder", "I already have this written", or any time the agent has existing materials to
  pull in instead of answering from scratch.
---

# Realtor Import — pull existing materials into the Brain

Most agents already have gold sitting in Google Drive or on their computer — testimonials, a bio, past
content, market reports, lead magnets. This skill pulls it IN so they answer far fewer questions. It
**augments the interview, never replaces it**: import what exists, then only talk through the gaps.

> **Two rules that never bend:**
> 1. **Confirm before writing.** Everything extracted is a DRAFT the agent approves — files can be stale or
>    wrong. Show a short summary, get a yes, then write.
> 2. **Scoped, never a full-Drive crawl.** Only read files the agent UPLOADS or a folder they point to (or
>    their `Realtor AI Brain/intake` folder). Never scan their whole Drive.

## Step 0 — Follow the setup principle
Read `${CLAUDE_PLUGIN_ROOT}/shared/ask-once-default.md`. Importing is an *accelerator*, never homework — if
the agent has nothing handy, "skip" is always fine and they can import anytime later.

## Step 1 — Load the Brain + pick the source
Read `~/realtor-brain/brain.md` (and any identity files already written, so you don't duplicate). Then offer
both ways in, in one message:
> "Two easy ways to skip a lot of typing: **upload files right here** (drag in PDFs, docs, screenshots), or
> **point me to a Google Drive folder** and I'll read what's there. Either way I pull what I can and you
> confirm before anything's saved. Or just say **skip** and we'll do it by talking."

- **Upload →** read the attached files directly.
- **Drive folder →** use the **Google Drive connector**: `search_files` to find the folder they named (or
  the `Realtor AI Brain/intake` subfolder), list the files inside, then `read_file_content` on each. The
  connector reads Google Docs, PDFs, Sheets, and image/screenshot files — **use the returned text directly;
  never pipe it through bash or local files** (it lives outside the shell sandbox). Read ONLY that folder.
- **Skip →** hand back to whatever called this, noting they can say "import my materials" anytime.

## Step 2 — Extract + map each piece to the right Brain file
For every file, work out what it is and pull the useful content. Map it:

| What the material is | Extract | Write to |
|---|---|---|
| Testimonials, reviews, screenshots of reviews | the quote + first name / client type + year | `identity/proof.md` |
| Stats sheet, "my results", awards/rankings | homes sold, DOM vs market, win rate, awards | `identity/proof.md` |
| Past emails, captions, posts, video scripts, blogs | the **verbatim** samples + what's distinctive | `identity/voice-samples.md` (+ refine `voice.md`) |
| Bio, "about me" | credentials, story, positioning | `identity/profile.md` |
| Market reports, CMAs, area guides | communities, price bands, local facts, trends | `identity/market.md` |
| Lead magnets, buyer/seller guides, workbooks, listing decks | the offer, process, what's promised | `identity/offer.md` (+ flag for Lead Capture / content-engine) |
| Anything about how/what they post | pillars, cadence, platforms | `identity/content-engine.md` |

Rules:
- **Extract only what's really there.** If a file is thin or off-topic, skip it — don't invent to fill a slot.
- **Verbatim for voice + testimonials.** Real wording is the whole point; don't paraphrase samples or quotes.
- **Flag uncertainty.** If a stat/claim might be outdated, note it for the agent to confirm — never let an
  unverified claim flow into published content (see `identity/compliance.md`).

## Step 3 — Summarize → confirm → write
Show a short, scannable summary of what you found and where it'll go:
> "Here's what I pulled: **4 testimonials** → your proof · **3 past posts** → your voice samples · a **market
> report on [areas]** → your market file · your **buyer guide** → your offer. Look right? I'll leave out
> anything you don't want."
On a yes (or after their edits), write to the mapped identity files. **Merge, don't clobber** — append to
what's already there and de-duplicate; never overwrite a fuller file with a thinner import.

## Step 4 — Push to Drive + name the gaps
> **Push to Drive after writing** — run `realtor-brain-sync` (PUSH). An unsynced write is a lost write.
Then tell them what's now covered and steer to what files couldn't give you:
> "Saved — that covered your proof, voice, and market. The couple of things files can't tell me — your niche
> positioning and your ideal client — let's nail those in about two minutes." → continue the relevant phase(s).

## When this runs
- **Start of Brain Setup** — offered once, up front, one-tap skip (the biggest typing-saver).
- **Inside Voice & Proof / Offer** — "upload or point me to Drive" offered right where files fit best.
- **On demand** — "import my materials" anytime after setup to top up the Brain.
