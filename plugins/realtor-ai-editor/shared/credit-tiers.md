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
6. **Karaoke captions** — big, below the face, active word in the brand accent.
7. **Reframe to 9:16** (short-form), face centred.
8. **A bit of energy (mandatory minimum, KEY beats only):** a couple of zoom-in/out punch-ins (each with a swoosh SFX), smooth transitions at scene changes, and a couple of SFX.
9. **The graphics essentials only:** a hook card, the CTA, and up to 3 B-roll on the key lines.

That clean core is the whole job. Everything past it is the agent's 20%.

## The HARD CAPS — never exceed (this is what stops credit drain)

- **B-roll — scale to length.** Short-form (≤ ~2 min): **MAXIMUM 3 clips.** Long-form: **~1 cutaway per ~1.5–2 min — a 10-min video ≈ 5–7 clips**, curated, never wall-to-wall. **If the agent wants more, they add it themselves by hand** (free). Don't carpet the video to be "thorough."
- **Graphics — MINIMAL: a hook card + a CTA card (2, maybe 3 cards total).** The karaoke captions already carry the keyword emphasis, so you almost never need separate keyword-pop cards. **Cards are the single most credit-expensive thing in Descript** (one card pass can cost 40–80 credits) — keep them few. More cards = the agent adds them manually.
- **NO count-up number animations** — Descript's most expensive effect (a single pass can cost ~167 credits). If a number matters, it's a static card, or just let the caption say it.
- **NO heavy AI effects** — background removal / green screen, eye contact, AI generation, AI-generated B-roll. Warn and skip.
- **Punch-ins / SFX / transitions — a few on key beats, never every scene.**

## Don't waste credits (the hidden drains)

- **Batch into 2–3 passes**, not 15 tiny ones — every `prompt_project_agent` call costs credits. (e.g. one "clean + audio + grade + captions" pass, one "B-roll + a couple cards + CTA" pass.)
- **Frame-QA before delivering** (read the exported frames) so you're not re-running to fix things you couldn't see.
- **The biggest drain is OVER-CORRECTING** — too-little-B-roll → swing to too-much; tiny-caption → guess again. Each swing is a paid pass. Follow the safe defaults the FIRST time; don't swing.
- **NEVER blind-retry** a paid pass — if "unable to reach Descript," check the project first; the edit usually landed.

## Tell the agent (the 20% hand-off)

Default silently — just deliver the clean 80%. If they want more, say it plainly: *"I've done the clean core. You can add more B-roll, extra graphics, or tweak anything yourself in Descript with no extra credit cost — want me to show you the 20%?"* That manual 20% is theirs, and it keeps their credits safe.
