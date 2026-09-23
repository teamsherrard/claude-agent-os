# Trailer — the 20-second teaser for the day before

A trailer is not a reel. A reel stands alone and pays off; a trailer makes a promise and points at the video. It goes on Stories, the YouTube community tab, and the feed the day before the long-form goes live, and it is the cheapest thing in the Studio: one clone, three cuts, a card.

## Shape (locked)

- **15 to 25 seconds.** Three lines from the long-form, each 3 to 8 seconds, in this order: the **hook** (the line the video opens on, or the single strongest claim), the **stake** (the number, the mistake, the thing they will lose), the **tease** (a line that opens a question and does NOT answer it: "and the third one is the one nobody talks about"). Never include the payoff; the video is the payoff.
- **Two formats from one build:** 9:16 for Stories and Reels, and 16:9 for the community post and X. Build 9:16 first; the 16:9 is a second `clone_edit` of the finished trailer with `update_aspect_ratio` back to 16:9 and the cards re-placed to the lower third.
- **Cards:** the hook card for the first 2 s, then a closing card for the last 3 to 4 s that says when and where: *"Full video Thursday"* or *"Link in bio Thursday 9am"*. The date comes from the YouTube System's planner or the Short-Form System's calendar if either has it; if neither, ask once: *"When does the full video go live?"* Brand-kit CTA card if registered, else a native card (`cta-pack.md`). No other pop-ups.
- **Captions on, music on** (a bed with more energy than the long-form's; `music.md`), audio enhance on, the colour grade carried from the source edit. No B-roll unless the source line already sits on a cutaway; the trailer is the agent's face.

## Steps

1. **Source.** The finished long-form edit (after its clean cut and audio). If it is not edited yet, say so and offer the trailer after the edit; a trailer from a raw take carries the fillers into it.
2. **Pick the three lines (free).** Read the compact transcript. Score candidates as in `hook.md` for the hook, then choose the stake and the tease. Quote all three with their lengths and get one yes: *"Hook: 'closing deals from social media has never been easier' (4 s) · stake: 'most agents post every day and get nothing' (5 s) · tease: 'the third step is the one that actually books the calls' (6 s). About 20 seconds with the end card. Go?"* If the YouTube System's SEO Package or Repurposing Pack exists, use its hook and its promise so the trailer and the title agree.
3. **Build.** `clone_edit(sourceEditId, title:"Trailer — <hook>")` → `update_aspect_ratio 9:16` FIRST (before any overlay exists) with the face centred → resolve the three keep-spans and cut everything else in ONE `cut_time_ranges` (head, the two gaps, the tail) → `remove_pauses 800` → captions in the brand look (`caption-style.md`, `fontSize 84`) → the hook card and the closing card (`graphics-style.md`, top-edge zone on 9:16) → the music bed at -16 dB, placed twice if the track is shorter than the trailer.
4. **Verify.** `compare_revisions`; a frame on each card and on the join between line two and three (the hardest cut). Length between 15 and 25 s; the last frame shows the closing card.
5. **16:9 copy.** Clone the finished 9:16 trailer, `update_aspect_ratio 16:9`, `modify_position` both cards to the lower third, one frame check.
6. **Export** both at 1080p on approval. Two files, labelled `trailer-9x16` and `trailer-16x9`.

## Hand-off (the boundary)

The Studio makes the video. The words around it belong to the owners: the Short-Form System writes the Story and feed caption and picks the slot (the day before, usually evening), the YouTube System writes the community post. Hand each the trailer's edit link, its length, and the three lines. Never write the post.

## Ad mode (on request only)

"Make this an ad" is the same build with two changes: the closing card is the agent's CTA (`brand.cta`) instead of the date, and the compliance line from `identity/compliance.md` must be on screen (three-state rule in `final-check.md`; missing means no ad, say why). 15 s, not 25. Still no payoff line: an ad sells the call, not the content.

Log: `trailer · done · rev <n> · <editId 9x16> · <editId 16x9>`.
