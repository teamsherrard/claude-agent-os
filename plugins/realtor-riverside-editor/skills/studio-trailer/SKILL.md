---
name: studio-trailer
description: Trailer for the AI Editing Studio. Cuts a 15 to 25 second teaser from a long-form video's cut-only master for Stories, Reels, the YouTube community tab, and the feed the day before the video goes live: the hook line, the stake, and a tease that opens a question without answering it, with brand captions, an energetic music bed, the hook card, and a closing card that says when and where the full video lands. Built vertical first, with a 16:9 copy for the community post. On request the same build becomes a 15-second ad that ends on the agent's call to action with the compliance line on screen. Makes the video only; the Story caption and the community post belong to the Short-Form and YouTube Systems. Trigger on: "make a trailer", "teaser for this", "something for my story the day before", "promo clip for the video", "tease the video", "make this an ad". Part of the REPURPOSE stage; usually reached through studio-navigator or offered at the end of a long-form edit.
---

# Trailer

One job, done well. Run the craft contract (`${CLAUDE_PLUGIN_ROOT}/shared/craft-contract.md`), and do the work from this skill's one reference: **`${CLAUDE_PLUGIN_ROOT}/shared/trailer.md`**. Respect the ownership rules in `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md` and the house rules in `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## The job

1. Start from the finished long-form edit; a trailer from a raw take carries the fillers into it.
2. Pick three lines from the transcript: hook, stake, tease. Quote them with lengths and get one yes.
3. Clone, 9:16 first, one cut pass that keeps only the three lines, captions, the two cards, the music bed.
4. Verify on frames: each card and the join between lines two and three; 15 to 25 seconds; closing card on the last frame.
5. Clone again for the 16:9 copy, export both at 1080p, hand the links and the three lines to the owners of the posts.

## Remember

Never include the payoff. The video is the payoff. The closing card needs the go-live day; ask once if no plugin knows it.

If they actually want several things, or "make it good," say so and hand to the full edit: `studio-longform`, `studio-reel`, `studio-listing`, or `studio-batch`.
