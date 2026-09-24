# Own footage intake & matching

The agent's own footage is always **tier 1** — authentic, free, accurate, and (for listings) the *only* correct option. This is how the editor gathers and uses it in Riverside.

## Where own footage comes from

1. **Standing Google Drive B-roll library** — a folder the agent keeps with reusable clips. Browse it with the Google Drive connector (search / list / download); folder set in the editor config at setup. **Prerequisite: the Google Drive connector must be on.** Each chosen clip is pushed into Riverside's Your Media once (`media_create_media_upload` → `curl -T` → `media_finalize_media_upload` → poll `media_get_media`) where a shell exists; in Cowork, or when the push fails, ask the agent to drop the clip into Riverside's media panel and find it with `media_list_media`. Record the media id in the index so it's never re-uploaded.
2. **Files already in Riverside's Your Media** — the agent dropped clips into the editor's media panel. `media_list_media(productionId, search:"kitchen")` finds them by name. Zero upload work — the best path in a browser-only (Cowork) session.
3. **Per-video uploads** — clips the agent drops for *this* video: into Riverside's media panel (the route that works everywhere), or a local file pushed through the connector where a shell exists; ≤500 MB each (a bigger drone clip is trimmed by the agent in Riverside or by ffmpeg where available).
4. **Listing photos** — for property videos, JPG/PNG uploads become full-cover stills for 3–4 s, cut in hard (a 0.15 s `fadeIn` from `set_overlay_clip_animations` on the calm packs). No hand-written Ken-Burns keyframes: a keyframe partway through an overlay clip hangs the editor (`graphics-style.md`); a slow push on a still is a hand-finish item.

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

## The library index (owned by the B-roll Library skill)

One file in the Brain: `~/realtor-brain/editor/broll-library.md` (pulled before reading, pushed after writing — the persistence rule in `house-rules.md`). One line per clip, written the first time a clip is uploaded to Riverside and never again; a clip tagged `dim` is never placed over a lit talking head:

```
<plain name> · <riverside media id> · <length s> · <16:9 | 9:16 | still> · <bright | dim> · tags: <place, room, subject> · source: <drive path | upload | riverside>
```

- **Every edit reads this first.** A cutaway moment is matched against the tags before any stock search; stock fills only what the library cannot.
- **Never upload the same clip twice.** Check the index (and `media_list_media`) by name before any upload.
- **Report the gaps.** After indexing, name the 3 to 5 shots worth filming next ("no exterior of your office, no downtown skyline, no sign-in-the-yard"). A one-hour filming session fills a year of cutaways.
- A video's checkpoint log records which library clips it used, so the same clip is not leaned on week after week.
