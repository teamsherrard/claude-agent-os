---
name: studio-library
description: B-roll Library for the AI Editing Studio. An agent's own footage (their neighbourhoods, their listings, their drone shots, their signage) is what makes a video look real instead of stock. This skill gathers it from a Google Drive folder, the Riverside media panel, or files they drop in, tags each clip once by what it shows, uploads it to Riverside one time, and keeps an index so every future edit reaches for their footage first and never uploads the same clip twice. Trigger on: "index my b-roll", "add this footage to my library", "use my own clips", "what footage do I have", "here's my drone footage", "set up my b-roll library". Part of the POLISH stage; usually reached through studio-navigator or called inside a full edit.
---

# B-roll Library

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Gather: the Drive folder (connector on), Riverside's media panel, or uploads. Trim anything over 500 MB to the seconds you need.
2. Tag by filename first, then by a quick look: place, room, subject, orientation.
3. Upload once; record name, media id, length, and tags in the library index in the Brain.
4. Report what is there and the gaps worth filming ("no exterior of your office, no downtown skyline").

## Remember

Property moments need property footage. Stock is never passed off as the actual listing.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
