# The pre-flight check — read the video BEFORE you spend a credit

**This runs first on EVERY edit, and it costs ZERO Descript credits.** Reading the transcript is free; editing is not. On a real 15-minute client video this step found **three duplicate takes and ~2 minutes of dead air** before a single credit was spent — it cut 3:21 off the runtime and made the cost quote accurate.

It does three jobs at once: it makes the edit **better** (you plan instead of react), **cheaper** (you get it right the first time instead of over-correcting), and it **removes the agent's #1 anxiety** — not knowing what this is going to cost.

## What to do (all free — no paid calls)

1. **Get the video in and confirm the timeline built** — `import_media` with `add_media` + `add_compositions`, then `get_project`: the composition duration must NOT be `0`.
2. **`export_transcript`** with paragraph timecodes. Read the whole thing.
3. **Find the problems and the plan:**
   - **Duplicate takes** — the same point delivered twice. Very common; agents re-record a section and keep rolling. Note which take is the keeper (usually the later, more complete one) and quote the distinguishing line for each.
   - **Dead air / long gaps** — look for jumps between paragraph timecodes.
   - **The hook** — is the first real line already a hook, or is there settling-in to cut? Name the exact line you'll open on.
   - **Section changes** — these become the chapters (long-form) and tell you where the emphasis pop-ups and B-roll go.
   - **Proper nouns** — agent name, brokerage, city, plus (for listings) the street address and community. This is the glossary.
   - **Compliance** — read `identity/compliance.md` now, before any on-screen text is planned.
4. **Estimate the cost** from `${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md` (measured: ~225–270 credits for a 10–20 min long-form; ~70–100 for a reel; media minutes ≈ the video's length, once).

## Then say it in ONE short paragraph and get the go-ahead

Plain language, no jargon, numbers included. The shape:

> *"Okay — it's 15:22. I found 3 spots where you recorded the same section twice, plus about 2 minutes of dead air, so I'd cut it to around 12 minutes. Your hook is already strong right at the start, nothing to trim there. I count 9 natural chapters. Full edit is roughly 250 credits and about an hour. Want me to go?"*

**That single yes is the cost gate for the whole edit** — everything after it runs without stopping to re-ask.

## Rules

- **Never skip it to "save time."** It costs nothing and it is the cheapest possible place to catch a problem. Every fix found here is free; the same fix found after a paid pass costs a re-run.
- **Always give a number.** "It'll use some credits" is what makes agents anxious. "About 250 credits, roughly an hour" is what makes them relaxed. If you're unsure, give a range.
- **If the video has a real problem, say so now** — before they've spent anything. Bad audio a grade can't fix, a hook that never lands, only 2 usable clips when they asked for 3. Being straight up front is cheap; being straight after they've paid is a refund conversation.
- **If they're low on credits**, offer the essentials-only version (clean cut + audio + grade + captions, skipping the energy and cards passes) at roughly half the cost, and let them choose.
