# Short-form repurpose — one long video into distinct reels

The Studio cuts the actual clips. It does not write the posts: captions, hashtags, and the calendar belong to the Short-Form System, and written repurposing (scripts, blog, newsletter) belongs to the YouTube System's Repurposing Pack (`boundaries.md`). If that pack exists, read its short-form scripts and hooks FIRST — they tell you which moments the strategy wants.

## The seven steps

0. **Scope** — lock N (default **3**, cap **5** per session). One sentence, one yes: *"I'll pull 3 standalone reels out of this. Sound good?"* That yes covers the trims on every clip.
1. **One source edit, one transcript read.** The source edit is never cut; it is the master every clip is cloned from.
2. **Score (free, transcript only).** Every contiguous 20 to 60 second span, 0 to 2 on FIVE criteria: self-contained · strong hook line · high-value or emotional · clean payoff · length-fit (30 to 45 s ideal). Keep at most 10, each with its opening and closing quote.
3. **Pick the top N, distinct.** No overlaps, no same-topic repeats; vary the angle (a tip, a number, a story). Not N strong ones? Say so: *"This video has 2 great standalone moments, not 3 — want 2 great ones, or should I stretch for a third?"* Show each as hook line + length; get the yes.
4. **Per clip, its own edit.** `clone_edit(sourceEditId, title:"Reel N — <hook line>")` (or a fresh `create_edit_from_recording` when the source has overlays you do not want). On the clone: resolve the head (start → the clip's first word) and the tail (the clip's last word → end), plus any housekeeping inside the span, and apply them in ONE `cut_time_ranges`.
5. **Build each clip to done, one at a time** — the reel recipe (`studio-reel`): 9:16 FIRST, clean cut at 1000 ms, audio, captions, up to 3 B-roll, energy, music, hook card + CTA card. A stop then leaves finished reels, never a pile of half-clips. Log each: `reel-N <hook> · done · rev n · <editId>` in the SOURCE edit's log.
6. **Quality check each** (`final-check.md`).
7. **Deliver all N at once**, labelled by hook line, each with its edit link and length. Hand the hook lines to the Short-Form System for captions and slots. Export each at 1080p on approval.

## Live-tested numbers

A 46-second reel from a 70-second raw intro: 18 small changes, about 12 minutes, no credits. `fontSize` on vertical: captions **84**, cards **72** (sizes are 1080p export pixels). A 37-second library music track covers 37 seconds of finished reel — place it twice for longer.
