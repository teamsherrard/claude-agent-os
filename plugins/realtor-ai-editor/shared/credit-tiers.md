# Credit discipline — the 80/20 rule (READ FIRST — this protects the agent's Descript credits)

Descript AI credits are the agent's **money**. The #1 rule of this editor: **do the high-value basics brilliantly, then STOP.** Never burn the agent's credits on extras they can add themselves, by hand, for free. Doing **less, but well, is both cheaper AND more premium** — the credit-smart edit and the best-looking edit are the same edit.

## The 80/20 split (the core promise)

- **The editor (Claude + Descript) does the 80%** — the credit-worthy basics that turn raw footage into a clean, professional, ready-to-post reel. These are ALWAYS done, every video.
- **The agent does the last 20% by hand** — extra B-roll, extra graphics, fine tweaks. **Manual edits in Descript cost ZERO AI credits**, so this is where the agent adds personal flair for free.
- This is exactly what we tell them in training: *"The editor gets you 80% of the way there — here's the 20% you finish by hand."*

## The 80% — ALWAYS do these (this is the value; never skip one)

1. **Clean cut** — remove filler words, dead air, bad takes, false starts.
2. **Clean open — ON THE HOOK** (cut the settling-in / "let's go" / throat-clear).
3. **Clean end** — finish on a complete thought, never mid-sentence.
4. **Studio Sound** — clean the audio (default **~55%**; **~80–90% for phone / echoey rooms**; never so low it leaves a fishbowl/room echo, never so high it thins the voice).
5. **Colour grade** — subtle, natural, flattering. Always.
6. **Captions / on-screen text** — short-form: **karaoke** (big, below the face, active word in the brand accent). Long-form: **no word-by-word karaoke — an emphasis pop-up every ~2–3 min** (key phrase, off the face) instead.
7. **Reframe to 9:16** (short-form), face centred.
8. **A bit of energy (mandatory minimum, KEY beats only):** a couple of zoom-in/out punch-ins (each with a swoosh SFX), smooth transitions at scene changes, and a couple of SFX.
9. **The graphics essentials only:** a hook card, the CTA, and up to 3 B-roll on the key lines.

That clean core is the whole job. Everything past it is the agent's 20%.

## The HARD CAPS — never exceed (this is what stops credit drain)

- **B-roll — scale to length.** Short-form (≤ ~2 min): **MAXIMUM 3 clips.** Long-form: **~1 cutaway per ~1.5–2 min — a 10-min video ≈ 5–7 clips**, curated, never wall-to-wall. **If the agent wants more, they add it themselves by hand** (free). Don't carpet the video to be "thorough."
- **Graphics — keep them purposeful (cards are the single most credit-expensive thing in Descript — ~40–80 credits a pass).** Short-form: a hook card + a CTA card (**≤2–3 cards**) — the karaoke captions already carry the keyword emphasis, so no separate keyword-pop cards. Long-form: a hook card + the CTA + **an emphasis pop-up every ~2–3 min** (these replace karaoke as the emphasis layer; ~3–5 on a 10-min video). Beyond that, the agent adds more by hand.
- **NO count-up number animations** — Descript's most expensive effect (a single pass can cost ~167 credits). If a number matters, it's a static card, or just let the caption say it.
- **NO heavy AI effects** — background removal / green screen, eye contact, AI generation, AI-generated B-roll. Warn and skip.
- **Punch-ins / SFX / transitions — a few on key beats, never every scene.**

## Definition of Done — the fixed recipe (so every video is consistent)

These are the **countable targets** for each format. They pin down "how much" so the output doesn't drift run-to-run across many agents — same recipe every time. These don't loosen the 80/20 or the hard caps above; they just make the targets countable. When in doubt, hit these exact numbers.

| Element | SHORT-FORM reel | 10-MIN LONG-FORM | LISTING reel |
|---|---|---|---|
| **Cards (total)** | hook card + CTA card (**≤2–3 cards**) | hook card + CTA card | hook/address card + price card + CTA (**≤3 cards**) |
| **Emphasis layer** | **karaoke captions ON** | **~4 emphasis pop-ups** (every ~2–3 min) — **NO karaoke** | **karaoke captions ON** |
| **Punch-ins** | **2–3** | a couple on key beats | a couple on key beats |
| **B-roll** | **1–3 clips (max 3)** | **5–7 clips** | **property B-roll matched room-to-room (≤3 on a reel)** |
| **Studio Sound** | **~55%** (~80–90% phone) | **~55%** (~80–90% phone) | **~55%** (~80–90% phone) |
| **Colour grade** | **on** | **on** | **on** |
| **Energy (transitions + SFX)** | a couple SFX + smooth transitions | energy on key beats | smooth transitions + a couple SFX |
| **Chapters** | — | **yes** | — |

This is the recipe the delivery "what's inside" line should restate back to the agent — e.g. short-form: *"hook + CTA card, karaoke captions, 2–3 punch-ins, up to 3 B-roll, Studio Sound, grade, a couple SFX."* If they want more than the table says, that's the 20% they add by hand (free).

## Don't waste credits (the hidden drains)

- **Run THE PASS PLANS** (`${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md`): short-form reel ≈ **4 paid passes**, long-form ≤ **6**, listing reel ≈ **4** — never 15 tiny calls; every `prompt_project_agent` call costs credits AND a query. Do the FREE prep (transcript scoring, the hook line, the glossary, chapters, title/description, frame-QA) outside the paid calls — free work costs zero credits.
- **Frame-QA before delivering** (read the exported frames) so you're not re-running to fix things you couldn't see.
- **The biggest drain is OVER-CORRECTING** — too-little-B-roll → swing to too-much; tiny-caption → guess again. Each swing is a paid pass. Follow the safe defaults the FIRST time; don't swing.
- **NEVER blind-retry** a paid pass — if "unable to reach Descript," check the project first; the edit usually landed.

## Tell the agent (the 20% hand-off)

Default silently — just deliver the clean 80%. If they want more, say it plainly: *"I've done the clean core. You can add more B-roll, extra graphics, or tweak anything yourself in Descript with no extra credit cost — want me to show you the 20%?"* That manual 20% is theirs, and it keeps their credits safe.
