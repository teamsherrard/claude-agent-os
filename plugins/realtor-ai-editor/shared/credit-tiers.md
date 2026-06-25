# Credit tiers — quality vs cost (default to Standard)

Doing **less, but well, is both cheaper AND more premium** — over-editing is expensive *and* tacky. So the credit-smart edit and the best-looking edit are the same edit. Three modes; default to **Standard**.

> **What costs Descript credits vs what doesn't:** the credit caps below are about **Descript** operations (SFX, transitions, punch-ins, b-roll, grade, Studio Sound). The premium **text graphics** — hook title, section chips, stat cards, keyword pops, lower-thirds, CTA — render in the **json2video graphics engine** (a separate, cheap render budget — ~free per graphic), NOT as Descript passes. So **graphics coverage is never a Descript-credit decision** — never cap the graphics-coverage floor to "save credits."

## Where credits actually go (observed)

- **Cheap + high impact (always do):** cuts / filler removal, captions (~10), Studio Sound, a light colour grade (~6).
- **Expensive in Descript (cost scales with QUANTITY — so cap it):** lots of SFX, a transition on every cut, a punch-in on every scene. (One session's motion pass with 11 SFX + transitions on all 16 cuts cost ~69.)
- **Never ask Descript for count-up number animations** — they were its single most expensive effect (one pass of 2 count-ups + a few cards cost ~167 credits). Numbers are ALWAYS **static stat cards in the json2video graphics engine** (~free, full impact); Descript count-ups are banned (cross-ref `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`, `${CLAUDE_PLUGIN_ROOT}/shared/graphics-engine.md`).
- **Biggest hidden cost:** iterating / re-running — including **OVER-CORRECTING** (too little b-roll → swing to too much; tiny captions → guess again). Each swing is a paid pass, and the back-and-forth is the real credit drain. Get the safe defaults right the FIRST time (follow the rules, don't swing), and **frame-QA before delivering** so you're not fixing things you couldn't see (graphics on the face, background removal, wrong caption size, duplicated b-roll). Do it in 2–3 batched passes, not 15.

## The three modes

The three modes scale the **Descript effects layer** (SFX, transitions, punch-ins, b-roll). The **graphics-coverage floor is the same in every mode** — it renders ~free in the engine, so even Lean keeps its hook / chips / stat card / keyword pops / CTA.

**Lean** (cheapest — routine daily posts): cut + tighten, captions, Studio Sound, a light grade, 1–2 B-roll on the key lines, the CTA. No SFX, minimal/auto transitions, fewer Descript punch-ins.

**Standard** (DEFAULT — the everyday premium look): Lean **plus** gentle punch-ins on a FEW key beats (not every scene), 3–5 B-roll total on the important lines, **1–2 SFX**, transitions only at major scene changes. ≈90% of "Full" quality at roughly half the Descript credits. (Graphics: the full coverage floor — hook + ≥3 chips/lower-thirds + ≥1 stat card + ≥2 keyword pops + CTA — rendered ~free in the engine, never capped to save credits.)

**Full** (hero / case-study videos only): the works — punch-ins throughout, transitions everywhere, music + multiple SFX, the richest graphics layer. Most Descript credits (the effects, not the graphics). Use sparingly.

## How to keep Standard cheap

- **Batch** into a few passes (one "clean + audio + captions + grade," one "B-roll + motion," then the json2video graphics composite). Fewer Descript calls = fewer credits.
- The caps are deliberate for **Descript effects**: each "one less" SFX / transition / punch-in saves credits AND looks cleaner. When unsure, do one fewer — but NEVER drop below the graphics-coverage floor (that's free).
- For shorts, **repurpose from an existing long edit** when possible — no re-import / re-transcribe.

## Tell the agent

Default to Standard silently. Only if they ask, offer in plain words: *"Want the quick version (cheaper) or the full polish (more)?"* Standard is the right answer for almost everything.
