# Own footage intake & matching

The agent's own footage is always **tier 1** — authentic, free, accurate, and (for listings) the *only* correct option. This is how the editor gathers and uses it in Riverside.

## Where own footage comes from

1. **Standing Google Drive B-roll library** — a folder the agent keeps with reusable clips. Browse it with the Google Drive connector (search / list / download); folder set in the editor config at setup. **Prerequisite: the Google Drive connector must be on.** Each chosen clip is downloaded locally, then pushed into Riverside's Your Media (`media_create_media_upload` → `curl -T` → `media_finalize_media_upload` → poll `media_get_media`) — once; record the media id in a small index so it's never re-uploaded.
2. **Files already in Riverside's Your Media** — the agent dropped clips into the editor's media panel. `media_list_media(productionId, search:"kitchen")` finds them by name. Zero upload work — the best path in a browser-only (Cowork) session.
3. **Per-video uploads** — clips the agent drops for *this* video. In Code mode a local file goes straight up; ≤500 MB each (trim a big drone clip to the 5 s you need first).
4. **Listing photos** — for property videos, JPG/PNG uploads become Ken-Burns motion stills (`insert_overlay` for ~4 s + `modify_scale` keyframes 1.00 → 1.08 across the still).

## Tag & match

- Tag each clip by filename first (`kitchen.mp4` → "kitchen"), then by a quick look (a frame via ffmpeg if local) if unclear. Build a small index: `name → mediaId → duration`.
- Match clips to transcript moments: kitchen clip on the kitchen line, backyard on the yard mention, drone on the intro / exterior / address reveal.
- Index the standing library once (media ids persist in Riverside); only upload new files.

## Listings — capture the address & neighbourhood (not just rooms)

For a **listing**, the intake must capture the **full street address** and the **community / neighbourhood name**. They go on the address card exactly as written, and you check the Riverside transcript for how it heard them — a misspelled address on a client's reel is an embarrassing, noticed error. If the transcript has it wrong, the agent corrects it in the Riverside transcript panel before captions run.

## Has all / some / none

- **Has all:** use own footage, matched to the moments.
- **Has some:** own footage where it exists; fill gaps — property lines get the **listing photos** (motion stills); generic lines can use stock. Tell the agent briefly what was filled.
- **Has none:**
  - *Property content:* never fake the home with generic stock. Listing photos as stills, or ask for a few uploads, or a clean talking-head with info cards.
  - *Generic content:* Riverside stock + real-place imagery is fine — that's what it's for.

## The rule

**Property-specific moments need property-specific footage or photos. Generic moments can use stock. Never imply stock footage is the actual listing.**
