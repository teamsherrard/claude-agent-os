---
name: studio-listing
description: Listing Edit for the AI Editing Studio — the full line for a property or home tour video. Listing videos are special: every property moment must show THE ACTUAL PROPERTY (the agent's own room clips, drone shots, or the listing photos as gently moving stills), never generic stock, which would misrepresent the home and is a compliance risk. Gathers whatever footage exists (Riverside's media panel, uploads, a Drive folder, the listing photos), matches each clip to the line that mentions it, handles having all, some, or none, places the address, price, and call-to-action cards with compliance checked, and saves a review draft as a vertical reel or a 16:9 tour. Trigger on "edit my listing video", "edit my home tour", "edit my tour footage", "edit my property video", "I have a walkthrough of a home", and on resuming one — "finish my tour". Usually reached through studio-navigator.
---

# Listing Edit — the director

A listing tour is about one specific property, so its footage rules differ. **Read up front (only these):** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`, `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`, and `identity/compliance.md`. Format decides the line: a social listing reel follows `studio-reel`'s 4 passes; a long YouTube tour follows `studio-longform`'s line. This skill adds only what is different.

## What is different for a listing

1. **Footage check, one question:** *"Do you have footage of the home — clips in your Riverside media panel, files to upload, a Drive folder, or just the listing photos?"* Gather and tag it (`footage-intake.md`). Capture the **exact street address** and the **community name**; check how the transcript heard them, and have the agent correct the transcript in Riverside before captions if it is wrong.
2. **Facts come from their owners.** Price, beds and baths, and the disclaimer are read from Listing Launch's listing record and `identity/compliance.md` exactly as written. Never restate a price from memory; never write a disclaimer (`boundaries.md`).
3. **Property B-roll only.** Kitchen clip on the kitchen line, drone on the address reveal, one clip per spot, no repeats. Stills are full-cover for 3 to 4 seconds, cut in hard (a short fade on the calm packs); never a hand-written mid-clip zoom, which hangs the editor. A reel keeps the cap of 3; a long tour carries the room-by-room footage (exempt from the per-minute scale). Stock is allowed only for non-property lines ("great trails nearby").
4. **All, some, or none.** All → their clips. Some → their clips plus listing photos for the gaps. None → listing photos as stills, or ask for a few uploads, or a clean talking head with address, price, and feature cards. Never fake the home.
5. **Cards:** address or title, price, and the book-a-showing CTA (at most 3), placed by `graphics-style.md` and `cta-pack.md` (the kit's `book` banner if registered, held to the end). Vertical → top zone or over property footage; 16:9 → lower third. Fair-housing language: describe the home and its features, never who should live there.
6. **Compliance three states:** missing or an unfilled placeholder → withhold claim-bearing cards including the disclaimer card, never stamp a `[placeholder]`, deliver safely, nudge once.

## Deliver

A review draft with the edit link and the spec. Hand the section map (long tour) to the YouTube System and the hook line (reel) to the Short-Form System; Listing Launch's schedule decides the slot. Offer `studio-publish`. Write "Edited" back to the listing's record on the shared board.

## Resume

Checkpoint log `rs-<editId>.md`. A room-by-room tour stacks up placements: group them (one batch for all room cutaways and their scale steps, one for cards), diff after each, log each.
