# Tour Rules — generating a home tour from listing photos

The **TOUR IT** stage animates a listing's own photos into a cinematic tour. This is the one place in
the whole system where we generate an image of somebody's actual house — so it carries rules nothing
else does.

Read this before generating a single clip.

---

## The hard line: the camera moves, the house does not

AI video models don't animate a photo — they **repaint** it, frame by frame. Left alone, they will
add furniture that isn't there, open a wall, change a countertop, invent a window, or "improve" a
room. On a live listing that is **material misrepresentation** of a property. It is the kind of
mistake that reaches a broker and a regulator, not just a comment section.

So every clip we generate obeys one rule: **the camera moves through a still house.**

**Every prompt must carry these constraints, verbatim, every time:**

```
Camera movement only. Do not add, remove, replace, or alter any object, surface,
fixture, furniture, window, door, or architectural feature. Do not change lighting,
colour, or materials. Do not add people, pets, or text. The room must remain exactly
as photographed — only the camera moves.
```

Never override this to make a clip prettier. A boring true clip ships; a beautiful false one does not.

## Camera moves that are safe (use these)

The gentler the move, the less the model invents. Ranked safest first:

| Move | Prompt phrasing | Best for |
|---|---|---|
| **Slow push-in** | "slow steady dolly push forward, subtle" | Any room. The default — use it when unsure |
| **Slow pull-back** | "slow steady dolly pull backward, revealing the room" | Openers, wide living spaces |
| **Gentle pan** | "slow horizontal pan left to right" | Kitchens, long counters |
| **Tilt-up reveal** | "slow tilt upward from floor to ceiling" | High ceilings, staircases, entryways |
| **Slight parallax drift** | "very subtle lateral drift, shallow parallax" | Exteriors, yards |

**Avoid entirely:** orbits, 360s, fly-throughs, doorway transitions, "walk through the house," any
move that has to render a surface the photo never showed. The moment the camera sees around a corner,
the model is inventing a house. That's the failure mode this whole file exists to prevent.

## Generation settings

- **Model:** an image-to-video model that takes a `start_image` and holds a scene — Kling 3.0,
  Cinema Studio Video, or Seedance 2.0. Confirm what the connection offers rather than assuming.
- **Aspect ratio:** `9:16` — this is for Reels, TikTok, and Shorts.
- **Duration:** 5 seconds per room. Longer clips drift, and drift is invention.
- **Sound:** off. Music gets added in the edit, and generated audio on a property is noise.
- **One photo, one clip.** Never chain a clip's last frame into the next room's first frame — the
  model will hallucinate a hallway between them.

## Which photos to use, and how many

- **6–8 rooms, in walk order:** exterior front → entry → main living → kitchen → primary bedroom →
  bathroom → yard/exterior back. Skip a room rather than pad the tour with a closet.
- **Pick the photo with the most depth** — a room shot from a corner animates well; a flat wall-on
  shot has nowhere for the camera to go.
- **Never use a photo that's already virtually staged** unless the agent says the staging is
  disclosed. Animating staged furniture makes it look real, and that's the misrepresentation the
  disclosure exists to prevent.
- **Never use a photo with a person, a pet, or a licence plate in it.**

## The review gate — never skip it

Generated clips are **shown to the agent before anything is assembled**, and the agent confirms each
one shows their actual house. Say it plainly:

> Here are the clips. Take ten seconds on each — if anything looks like a room you don't recognise,
> tell me and I'll redo it. This goes out with your name on it.

If the agent flags a clip: regenerate it once with a gentler move (drop to a slow push-in). If the
second one is wrong too, **drop that room from the tour**. Two rooms lost is fine. One invented room
is not.

## Disclosure

The finished tour carries a visible line — in the caption at minimum, on the video where the agent's
market requires it:

> Cinematic tour generated from the listing photos.

Read `~/realtor-brain/identity/compliance.md` and follow it if it says more. Never present a generated
tour as filmed footage, and never let it be the *only* visual record of a home an agent hasn't seen.

## Cost discipline

Every clip costs the agent credits on their own account. So:

- **Say the cost shape before generating**, in plain words: *"This'll make 7 clips on your Higgsfield
  account — want me to go ahead?"* Never generate without a yes.
- **Generate the tour once.** Regenerate only the specific clips the agent flags, never the whole set.
- **6–8 clips is the tour.** If they want more rooms, that's a second pass they opt into.
- If credits run out mid-tour, stop, say exactly which rooms are done, and hand over what exists.
  Never silently deliver a short tour.

## Where the clips go

Listing Launch generates the clips. It does **not** assemble, caption, or score them — that's the
**AI Editor** plugin, which already does 9:16 assembly, karaoke captions, music, address and price
cards, and its own compliance pass.

Hand off by name to **`edit-listing`** in the AI Editor, passing the clips in shot order plus the
address, price, and the disclosure line. If the agent doesn't have the AI Editor, deliver the clips
in shot order with the caption and say plainly what would finish it — never half-build a second
editor here.
