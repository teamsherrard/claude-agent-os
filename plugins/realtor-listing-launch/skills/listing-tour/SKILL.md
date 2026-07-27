---
name: listing-tour
description: >
  TOUR IT — turns the listing photos into a cinematic animated home tour for Reels, TikTok, and
  Shorts, with no filming and no videographer. Takes the photos the agent already paid for, animates
  each room with a slow camera move on their own Higgsfield account, shows every clip for approval,
  then hands the set to the AI Editor to be cut, captioned, and scored. Built so the camera moves and
  the house never does — the room stays exactly as photographed, because a listing tour that invents
  a room is a misrepresentation, not a bad clip.

  Trigger on: "3D tour for my listing", "animate my listing photos", "tour video from photos",
  "I don't have time to film the listing", "make a video from the listing photos", "cinematic tour",
  "AI tour for [address]", "listing video without filming", "turn my photos into a video".
---

# TOUR IT — a cinematic tour from the photos alone

Most listings never get a video, because filming one means a second trip, a gimbal, and an hour the
agent doesn't have. This skill makes the tour from the photos that already exist.

**Apply house rules** (`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`).
**Read `${CLAUDE_PLUGIN_ROOT}/shared/tour-rules.md` before generating anything** — it carries the
prompt discipline, the safe camera moves, the review gate, and the cost rules. This skill does not
work without it.

---

## Step 1 — Load the Brain
Read `~/realtor-brain/brain.md` first, then:
- `identity/profile.md` — name, brokerage, market (never ask).
- `identity/voice.md` — for the caption that ships with the tour.
- `identity/brand-visual.md` — colours and fonts, passed to the editor for the address and price cards.
- `identity/compliance.md` — disclosure requirements. Read it before the tour ships, not after.

If `~/realtor-brain/` is missing, send them to **Realtor AI Brain — Setup** and stop.

## Step 2 — Load the listing
Read `~/realtor-brain/memory/listings.md` and pull this address — beds/baths/sqft, price, features,
status. **Never re-ask.** Not on file → hand to **Listing Intake**, then come straight back.

## Step 3 — Check the connection before promising anything

This stage runs on the agent's **own Higgsfield account** — their credits, their generations. Confirm
it's connected before you plan a tour they can't make:

- **Not connected?** Say it plainly and give them the way in: *"This one runs on your own Higgsfield
  account — connect it in Settings → Connectors and say 'go'."* Then offer the fallback that needs
  nothing: **FILM IT** (`listing-video`), the phone-filmed walkthrough. Never dead-end.
- **Connected?** Continue.

## Step 4 — Get the photos

Ask once, offering every route:

> Send me the listing photos — upload them here, or point me at the Drive folder they're in.

- **Uploaded / local files** → use the media upload path the connection provides. In a client with
  the upload widget, open the widget rather than asking them to paste files into chat.
- **Google Drive folder** → confirm the **Google Drive connector is on** before browsing it. If it's
  off, route them to Settings → Connectors, and meanwhile offer the upload route.
- **No photos yet** → stop here kindly. *"Once the photos are back, this takes about ten minutes."*
  Photos are the whole input; there's nothing to build without them.

Then **select the tour set** per `tour-rules.md`: 6–8 rooms in walk order, each the deepest photo of
that room. Say which rooms you picked in one line, and let them swap any.

## Phase 1 — Plan the tour before spending a credit

Show the shot plan as a table, and get a yes before generating:

| # | Room | Photo | Camera move | Why |
|---|---|---|---|---|
| 1 | Exterior front | `front.jpg` | Slow push-in | Opens the tour on the house itself |
| 2 | Entry | `entry.jpg` | Tilt-up reveal | Ceiling height is the first impression |
| 3 | Kitchen | `kitchen.jpg` | Slow pan left→right | The hero room — carries the whole listing |

Rules for the plan:
- **Moves come from the safe list in `tour-rules.md`.** Push-in is the default. No orbits, no
  fly-throughs, no doorway transitions — those make the model invent a house.
- **The hero room gets the pan**, everything else gets a push or a tilt. Variety is nice; accuracy is
  the job.
- **Open on the exterior, close on the yard or the best room.** A tour that ends in a bathroom feels
  like it ran out.

Then the cost line, in plain words, and a real yes:

> That's 7 clips on your Higgsfield account. Want me to build it?

**Never generate without an explicit yes.**

## Phase 2 — Generate, one room at a time

Per `${CLAUDE_PLUGIN_ROOT}/shared/tour-rules.md`:

- **9:16**, **5 seconds**, **sound off**, one photo as the start image per clip.
- **Every prompt carries the no-alteration constraint block verbatim** — the one in `tour-rules.md`.
  Never paraphrase it, never trim it to make room for style words.
- The prompt is: the camera move, then the constraint block. That's all. No "luxury," no "warm golden
  light," no "stunning" — style words are instructions to repaint, and repainting is the failure.
- **One photo, one clip.** Never chain one clip's end frame into the next room.
- Narrate progress like a person: *"Kitchen's done — three to go."* Never a status dump.

If generation fails or credits run out mid-tour: **stop, say exactly which rooms are finished**, and
hand over what exists. Never quietly deliver a short tour.

## Phase 3 — The review gate (never skip)

Show every clip and ask for a real look:

> Here are the clips. Take ten seconds on each — if anything looks like a room you don't recognise,
> tell me and I'll redo it. This goes out with your name on it.

- Flagged clip → regenerate **once**, with a gentler move (drop to a slow push-in).
- Still wrong → **drop that room from the tour** and say so. Two rooms lost is fine. One invented
  room is not.
- Nothing is assembled or handed off until the agent has confirmed the set.

## Phase 4 — The caption and the disclosure

Write one caption in their voice: the hook, the address and price, two real features from the listing
block, and the Brain's CTA. Five to eight hashtags anchored to their market.

The caption carries the disclosure line:

> Cinematic tour generated from the listing photos.

Read `identity/compliance.md` and follow it if it requires more, or requires it on-screen. Never
present a generated tour as filmed footage.

## Phase 5 — Hand off to the editor

Listing Launch generates; the **AI Editor** finishes. Hand to **`edit-listing`** with:
- the approved clips **in shot order**,
- the address, price, and beds/baths for the cards,
- the brand colours and fonts from `brand-visual.md`,
- the caption and the disclosure line.

Say it plainly: *"Handing these to your editor now — it'll cut them together, add your captions,
music, and the address card."*

**No AI Editor installed?** Deliver the approved clips in shot order with the caption, and say in one
line what would finish it. **Never half-build a second editor here.**

## Phase 6 — Save + log

Per `${CLAUDE_PLUGIN_ROOT}/shared/output-standard.md`, save the shot plan and caption as
**`Tour — [Street Address]`** in the listing's folder, and add `Cinematic tour` to **Built so far**
in the listing block with today's date.

End with one plain line:

> Every listing gets a tour now — even the ones you never film.

## Quality checklist
- [ ] Brain and listing block read; nothing re-asked.
- [ ] `tour-rules.md` read before any generation.
- [ ] Higgsfield connection confirmed, or FILM IT offered as the fallback — never a dead end.
- [ ] Photos gathered; 6–8 rooms selected in walk order and shown to the agent.
- [ ] Shot plan approved and the credit cost said plainly **before** the first generation.
- [ ] Every prompt carries the no-alteration constraint block verbatim, with no style words added.
- [ ] Only safe camera moves used — no orbit, fly-through, or doorway transition.
- [ ] 9:16, 5s, sound off, one photo per clip, no frame chaining.
- [ ] Review gate run; flagged clips regenerated once then dropped, never shipped.
- [ ] Disclosure line on the caption; compliance file read.
- [ ] Handed to `edit-listing` in shot order with brand and listing facts — or delivered cleanly if
      the editor isn't installed.
- [ ] Saved to the listing's folder and logged in **Built so far**.
