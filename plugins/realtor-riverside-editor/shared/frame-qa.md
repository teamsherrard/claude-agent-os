# Frame-QA — how this editor actually looks at the picture

The connector never returns a frame. That does NOT mean the editor is blind — it means you climb a ladder, and you cite which rung you used. **The frame-read rule from `final-check.md` still stands: a visual PASS with no cited, actually-viewed frame is not a PASS — it is `UNVERIFIED`, and ships only with the matching sentence in the delivery.**

## The ladder (use the highest rung you can reach)

### Rung 1 — the exported file, read locally (best)
`exports_get_export` gives an S3 key, not a link, so the file reaches you when the agent downloads it from Riverside → it lands in their **Downloads** folder. On a machine where that folder is readable and a shell exists (the Code tab), run:

```bash
ffmpeg -ss 00:00:07 -i "<export>.mp4" -frames:v 1 -q:v 2 /tmp/qa-0007.png
```

Read the PNG. For a card, crop to the card region at full resolution (a small montage hides overflow):

```bash
ffmpeg -ss 00:00:02 -i "<export>.mp4" -frames:v 1 -vf "crop=iw:ih*0.35:0:ih*0.65" /tmp/qa-card.png
```

Contact sheet for a whole video (one frame every 20 s, 5 across):

```bash
ffmpeg -i "<export>.mp4" -vf "fps=1/20,scale=384:-1,tile=5x6" /tmp/qa-sheet.png
```

Ask for it in plain words: *"Hit Download on the export in Riverside — once it's in your Downloads I'll check every card and cutaway frame by frame."* In Cowork, where Downloads and ffmpeg are out of reach, skip to rung 2.

### Rung 2 — the editor preview in the browser (live-tested recipe)
`platform_get_edit(editId).riversideUrl` is the editor preview page. **Use a browser signed in to the agent's Riverside account: the Chrome extension on the Code tab, or Cowork's own browser once the agent has signed in to riverside.com there** (a browser with no session sees "You don't have access to this"). Recipe that worked: navigate → wait ~9 s for the canvas → click the timeline RULER to seek (at the default zoom the ruler runs ≈1 px per second, starting ≈275 px from the left of a 1518-px-wide window: `x ≈ 275 + seconds`) → wait 2.5 s → `zoom` on the preview region (≈ x 729–1180, y 100–540) at scale 0.8. Read the time label under the preview to confirm where you actually landed, then correct by the delta — the first pass is usually a few seconds off. **Reload the page after a batch of writes**; the editor does not always pick up remote changes live. Caveat: the editor preview is NOT the render — it drew a giant duplicate of each text overlay that did not exist in the timeline data; only the export (rung 1) is truth for text sizing. Use rung 2 for placement, coverage, and collisions; use rung 1 before you ship.

### Rung 3 — the raw recording (before any edit)
For the **LOOK-first** step (where does the speaker's head actually sit?), if the raw file is on disk, one ffmpeg frame of it tells you the safe zone. If not, rung 2 on the untouched edit does the same job.

### Rung 4 — rule-based + the agent's eyeball (last resort)
If no rung above is reachable in this session, you still have: the timeline read (exact positions of every overlay and caption block, the canvas size), the safe-zone numbers in `layouts.md`, and the format zone in `graphics-style.md`. Place by rule, then say plainly: *"I placed everything by the rules but couldn't look at the frames myself this time — please eyeball the hook card and the captions before you post."* **Never claim a visual PASS on rung 4.** Mark those blockers `UNVERIFIED (rule-placed, agent to eyeball)` — that's an honest state, and it ships only with that sentence in the delivery.

## What each rung can and can't tell you

| Check | Rung 1 | Rung 2 | Rung 4 |
|---|---|---|---|
| Card on the face / captions on the face | yes | yes | no (rule only) |
| Text contained in its panel | yes (full-res crop) | mostly | no |
| Black bars / exposed edge after a zoom | yes | yes | no |
| Cutaway as bright as the speaker's shot | yes | yes | no |
| B-roll recognisable in a 4-s glance | yes | yes | no |
| Grade not orange/pale | yes | roughly (preview compression) | no |
| Audio feel, pacing, the swoosh landing | **no rung can** — the agent's ear | | |

## Cost of looking

Every frame you read costs tokens, not credits. A dozen well-chosen stills per edit is right; a frame-by-frame watch is not. Pick: the open, each banner and pop-up, each cutaway's midpoint, one frame per zoom size used, a skin-and-shadow frame for the grade, the CTA, the last frame.
