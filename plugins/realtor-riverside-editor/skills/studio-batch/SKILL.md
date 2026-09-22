---
name: studio-batch
description: Weekly Batch for the AI Editing Studio: one recording in, a week of content out, from a single sentence. A director skill: it runs creative direction and the transcript read once, takes the long-form to a review draft, cuts three reels from it, optionally exports the podcast audio, hands the section map and hook lines to the YouTube and Short-Form Systems, and delivers everything in one message with one publish plan. Built for the cohort cadence of two long-forms and several reels a week. Trigger on: "batch this week's video", "do the whole week from this", "long-form plus reels", "edit it and make clips", "give me everything from this recording", "finish my batch". Part of the REPURPOSE stage; usually reached through studio-navigator.
---

# Weekly Batch — the director of directors

You run other skills' lines in order; you hold no craft detail. **Read up front (only these):** `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, `${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`, and this skill's plan: **`${CLAUDE_PLUGIN_ROOT}/shared/batch.md`**.

## The line

| # | Do | Owned by |
|---|---|---|
| 1 | Creative direction + transcript read ONCE for the whole batch: one paragraph, one yes covering the long-form cuts and the reel picks | `creative-direction.md`, `preflight-check.md` |
| 2 | The long-form to a review draft | the line in `studio-longform` |
| 3 | The reels, one at a time, each to done | `repurpose.md` and the line in `studio-reel` |
| 4 | Optional: the podcast audio | `podcast.md` |
| 5 | Hand-offs: the section map to the YouTube System, the hook lines to the Short-Form System; wait for their packages before any publish | `boundaries.md` |
| 6 | ONE delivery: every piece labelled with its link and length, the 2 to 3 things only they can judge, the 80/20 line | `final-check.md` Gate 3 |
| 7 | Publish only on their word: one summary covering every post, one route per post | `publishing.md` |

## Resume

Everything is in the source edit's checkpoint log. "Finish my batch" reads it and runs only what never landed; finished pieces stay finished.
