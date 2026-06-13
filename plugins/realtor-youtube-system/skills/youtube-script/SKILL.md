---
name: youtube-script
description: Script Studio — writes the full video script (long-form, plus a short-form cut) for a chosen idea, in the agent's own voice, teleprompter-ready. Reads the AI Brain for voice, avatars, offer/CTA, and market so the script sounds like the agent and speaks to the right viewer, and pulls the chosen idea's packaging (title + hook) from Ideation. Runs every script through the Compliance Guardrail, then saves it as a clean Google Doc inside that video's folder. Triggers on "write my script", "script this", "script idea #X", "write the script for [title]", or as a hand-off from Ideation.
---

# Script Studio

Write the video — in the agent's voice, ready to read off a teleprompter.

> **Part of the video package — one chat = one video.** Normally Step 2 of Make This Video. An agent can
> also come straight here with their own idea ("just script this idea I had") — no Ideation step needed;
> that chat simply becomes the video's chat. Gather whatever's missing, plainly.

## Step 1 — Gather
- The idea — either Ideation's package (title, hook, thumbnail) OR one the agent brings directly. If
  they bring their own, quickly shape the title/hook/angle with them first, then write.
- **AI Brain:** VOICE (tone, pacing, phrases, hard-avoids), avatars (their fear + questions),
  offer/CTA, market specifics, communities, differentiators.
- Relevant **Research Brief** facts to use as talking points — ONLY verified, sourced ones (with source + date).
- **For price-point / comparison videos** ("what $Xk gets you," "$X vs $Y"): use the live listing data from
  the Research Brief — real beds/baths/sq ft/community/price — so you state real numbers, not placeholders.
  If the Brief doesn't have it, pull current listings yourself first (see
  `${CLAUDE_PLUGIN_ROOT}/skills/youtube-research/references/research-method.md`);
  only `[double-check]` what genuinely can't be verified.

## Step 2 — Write the long-form script
Follow `references/script-format.md` and the 4-part framework in `references/script-framework.md`:
- **Hook (0:00)** — use the idea's hook; name the viewer's situation/fear, promise the payoff (first 15s decide the watch).
- **Early Warm CTA (~0:20)** — ⭐ right after the hook, a friendly, non-salesy invite to connect that
  captures leads early ("we get calls from people just like you every day — reach out anytime"). Value-first, low-pressure.
- **Intro** — who the agent is + what the video delivers. Credible, brief, never braggy.
- **Body** — 3–5 clear sections (enough to deliver value, not to pad); each = the point + real specifics; a pattern interrupt + a story where natural. Talking-point bullets for lists.
- **Soft mid CTA (~halfway)** — one light, value-first reminder tied to the content ("the full checklist's linked below"). Not salesy.
- **Reassurance** — address the core fear head-on.
- **Final CTA** — the agent's real CTA, low-pressure, + a nudge to the end screen (next video / playlist / subscribe).
- **Chapters** — list the timestamped chapters at the end (they feed the SEO description).
- Cues: `[brackets]` = delivery/B-roll · `>>` = on-screen text · `(source, date)` = a fact's source (not read aloud). Guidance only — no editing.

**Keep it tight — never a 10-page essay.** Match the runtime: ~140 words/min (a 10–12 min video ≈ 1,400–1,700 words). Value-dense, scannable, cut filler.

**Verified facts only.** Use only facts you can source from the Research Brief, tagged `(source, date)`.
Any number/claim you can't verify → write `[double-check before filming]`, never guess. The agent must never say something false on camera.

## Step 3 — Voice (critical)
Match the AI Brain voice exactly. For a calm/consultative agent: short, clear sentences; reassuring;
teach step-by-step; **no hype, no pressure, no clickbait.** Honor every hard-avoid. Re-read as the
agent — if a line sounds salesy, rewrite it. Weave in their differentiator where it fits naturally.

**Ship it complete — no blanks, no homework.** Never insert `[add your story]`-style placeholders — gaps
make agents overthink and resist. Write every line ready to read, including examples (drawn from the
Brain's real differentiators, communities, and avatar situations). If the agent volunteers a story or a
client example in chat, weave it in seamlessly — but the script must always be 100% filmable as delivered.

## Step 4 — Short-form cut
Also write one 30–45s short-form script (Reel/Short/TikTok): punchy hook → one core point → the CTA.

## Step 5 — Compliance + fact-check
Before saving: (1) **fact-check** — verify every stat/claim is sourced from the Research Brief; flag anything
unverifiable with `[double-check before filming]` and never leave an invented number; (2) run the
**Compliance Guardrail** (Fair Housing language, required disclaimers). Fix anything flagged.

## Step 6 — Save
Create the video's folder if needed — `Videos/{YYYY-MM · Month}/{YYYY-MM-DD · Title}/` — and save the
script as a clean Google Doc named **Script** inside it. Format it per
`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` §3 — a teleprompter-ready layout, NEVER a wall of text:
a title + meta line (runtime · audience), ALL-CAPS section headers with timestamps set off by em-dash
dividers (`──────── HOOK · 0:00 ────────`), a blank line between sections, spoken lines prominent, and
cues (`>> ON SCREEN`, `[PAUSE]`, `FACT:`) on their own lines. Structure carries the formatting — don't
rely on bold/colour (plain-text import can't keep them).

## Hand-off
After scripting → **SEO Engine** (title/description/tags/chapters) + **Lead Engine** (a matching lead
magnet). Offer: "Want the SEO package and a lead magnet to go with this?"
