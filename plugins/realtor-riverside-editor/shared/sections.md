# Section map — timestamps for chapters, markers for the editor

The Studio never names a chapter (`boundaries.md`): the YouTube System writes chapter titles inside its SEO Package. What the Studio owns is the **map**: where every section starts on the FINAL cut, with a plain note of what is said there. This craft produces that map, hands it over, and drops navigation markers onto the Riverside timeline so the agent can jump around their own edit.

## When it runs

After the cut is locked (fluff and hook done), never before: every cut moves every timestamp after it. Inside a full edit it is step 4b of the long-form line. On its own ("give me the timestamps") it runs on whatever the edit is now and says so if the cut is not done yet: *"These are on the current cut — if we trim more, I'll redo them."*

## Find the sections (free, transcript only)

1. `read_aligned_transcript` compact rows: the rows already speak **playable** (final-cut) time.
2. A section starts where the subject changes, and usually where the agent signals it: "number one", "the second thing", "now let's talk about", "so here's the mistake", a question the rest of the passage answers. Repeated takes are gone by now, so every remaining row counts.
3. Rules that make a YouTube chapter list valid: the first section is at `00:00`; at least 3 sections; each at least 10 seconds long. Aim for one section every 60 to 120 seconds on a 10 to 15 minute video (6 to 10 sections); a 3-minute video gets 3.
4. The note for each section is what the agent SAYS there, in plain words, ten words or fewer: *"why most agents post daily and still get no leads"*. It is a note for the SEO writer, not a title. No cleverness, no keywords, no caps.
5. Also mark, in the same list, the **hook** (the line the video opens on) and the **CTA** line at the end. The YouTube System uses both.

## Hand it over (the boundary)

Write the map in `00:00` form, one line per section, into the edit's checkpoint log and into the delivery message:

```
00:00  the hook — "closing consistent deals from social media has never been easier"
00:36  who Meg is and what she does with ChatGPT
02:10  how she writes the posts
05:48  how she records without a setup
09:02  keeping it organised so it stays consistent
11:40  CTA — free call, link below
```

Then one line: *"Your section map's ready. Say 'SEO for this' and your title, description, and chapters get written properly."* If the SEO Package already exists, say instead that its chapters can now be checked against these times.

## Markers on the Riverside timeline (navigation, not names)

The connector can **add** and **move** chapter markers, and cannot rename or delete them. A Riverside-made edit may already hold 3 or 4 AI-generated chapters. So:

- Markers are for the agent's own navigation in the editor. Their text is the section's **first spoken words, verbatim, in quotes** (spoken words are the picture, not the marketing, the same rule as the emphasis pop-ups). Never a title you composed.
- Read `chapters[]` from `read_timeline_in_range` first. Existing markers: `move_chapter {chapterId, newTime}` onto the nearest section start (source time). Sections with no marker: `add_chapter {time, title:"\"<first words>\""}`. Never add a second marker within 10 seconds of an existing one.
- **Time axis:** `add_chapter` and `move_chapter` take SOURCE time. Take each section's first word from `read_aligned_transcript(detail:"words")` and use its `assetStart` (`{n,d}`) directly. The map the YouTube System gets stays in playable time. Do not mix them.
- One batch, `expectedRevision` set; read the timeline back and confirm every marker is where you put it (a write that returns success is not proof on this connector).
- If the agent wants the SEO Package's chapter titles on the timeline too, that is a two-minute rename in Riverside's chapter panel; say so once. It is not something the connector can do.

## Verify

`read_timeline_in_range` shows the markers at the section times; the map's first entry is `00:00`; every gap is at least 10 seconds; the number of sections matches what you told them. Log: `sections · done · rev <n> · <count> sections`.
