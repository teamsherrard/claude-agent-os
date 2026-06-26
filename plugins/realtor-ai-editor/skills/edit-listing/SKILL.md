---
name: edit-listing
description: Edit a property / home / listing tour video by directing Descript on the agent's own account. Listing tours are special — the B-roll must be of THE ACTUAL PROPERTY (the agent's own room clips, drone shots, or the listing photos as motion stills), never generic stock, which would misrepresent the home and is a compliance risk. This skill gathers whatever footage the agent has (a Google Drive B-roll folder, files they upload for this video, or the listing photos), matches each clip to the right moment (the kitchen clip on the kitchen line, the drone on the intro), and handles the cases where they have all, some, or none of the footage. Trigger on: "edit my listing video", "edit my home tour", "make a listing tour", "edit my property video", "I have a walkthrough of a home". Usually reached through editor-navigator.
---

# Edit a listing / home tour

A listing tour is *about a specific property*, so its footage rules differ: property moments need property footage — never generic stock for the home (a compliance + trust issue). Start from `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, and read `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`, `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` (always grade), the minimal native graphics guide `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` for the on-brand info cards, `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, and `identity/compliance.md` (price/claims, fair housing) first. You direct Descript; the agent watches and approves. Follow the 80/20 credit discipline (`${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`) — do the basics brilliantly, then stop.

## The always-done core (the 80% — never skip)

Every listing video ALWAYS gets: a **clean cut**, **open ON THE HOOK**, a **clean ending**, **Studio Sound (~55% default, higher for phone/echoey)**, a **colour grade (bare-minimum, never over-saturated)**, the property B-roll matched room-to-room (capped — see below), **energy on key beats (a couple of zoom-in/out punch-ins with a swoosh SFX, smooth transitions, a couple of SFX)**, the brand info cards (kept minimal), and the closing CTA. **For a SHORT social reel:** also **reframe to 9:16** + **karaoke captions** (brand-accent active word, mandatory — watched on mute). **For a LONG YouTube tour:** keep **16:9**, **NO word-by-word karaoke** — the info cards plus an occasional emphasis pop-up carry the on-screen text (per Step 6). Anything beyond this is the agent's manual 20% — added by hand in Descript for free.

## Step 1 — Footage check (one simple question)

Find out what they have, plainly: "Do you have footage of the home — clips you'll upload, a Google Drive folder, or just the listing photos?" Then gather it (uploads, the Drive B-roll folder via the Google Drive connector, and/or the listing photos). Tag each clip (kitchen, backyard, drone, exterior…).

## Step 2 — Clean it up first

Open ON THE HOOK (cut any settling-in / "let's go" intro), remove dead air and bad takes, and **always apply Studio Sound** — **~80–90% for phone audio (most agents shoot on phones)**, **~55% for a decent mic**; never so low it leaves a fishbowl echo (judge on playback). **Apply a subtle, bare-minimum colour grade — always** (`${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md`); never over-saturate, never ship flat ungraded footage. Never end mid-sentence.

## Step 3 — Structure the tour

Intro / exterior (drone or hero shot + address) → room by room → outdoor / yard → neighbourhood (optional) → CTA (book a showing). Build the cut from the agent's narration.

## Step 4 — Match footage to the moment

Kitchen clip on the kitchen line, backyard clip on the yard mention, drone over the intro and the address reveal. One clip per spot; don't reuse. On a short-form listing reel keep B-roll to the **hard cap of MAXIMUM 3 clips** (a longer YouTube tour can carry the room-by-room footage); if they want more, they add it by hand. Any horizontal b-roll on a vertical listing reel → **split-screen, never over-zoomed** (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`).

## Step 5 — Has all / some / none

- **Has it all:** use their clips, matched room to room. Best case.
- **Has some:** use own clips where they exist; fill gaps with the **listing photos** (Ken-Burns motion stills) for that room; use generic stock only for non-property lines (e.g. "great schools nearby").
- **Has none:** do **not** fake the property with generic stock. Use the listing photos as motion stills; if there are no photos either, ask them to upload a few, or keep it a clean talking-head with **address / price / beds-baths / feature** cards. Be honest about the limit.

## Step 6 — Brand cards, captions, deliver

Add the brand info cards **natively in Descript**, kept minimal (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`): an address/title card, a price card, and the closing CTA — beds/baths and key features can ride in the captions or one small card rather than a card each. Each card on a rounded brand panel, on-brand, big, synced to the line (the price card on the price line), animated, OFF the face — never a flat box on the face. Karaoke captions on a social listing reel are **mandatory** (watched on mute): big (~90pt+), below the face, high-contrast, brand accent on the active word (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`). A long YouTube home tour gets **no word-by-word karaoke** — the info cards (address/price/features) plus an occasional emphasis pop-up carry the on-screen text. End on the book-a-showing CTA. **Run the final check** (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`), then export + hand over a title/description with the address. Deliver once.
