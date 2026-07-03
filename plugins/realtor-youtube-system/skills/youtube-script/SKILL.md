---
name: youtube-script
description: Script Studio — writes the full video script (long-form, plus a short-form cut) for a chosen idea, in the agent's own voice, teleprompter-ready. Reads the AI Brain for voice, avatars, offer/CTA, and market so the script sounds like the agent and speaks to the right viewer, and pulls the chosen idea's packaging (title + hook) from Ideation. Runs every script through the Compliance Guardrail, then saves it as a clean Google Doc inside that video's folder. Triggers on "write my script", "script this", "script idea #X", "write the script for [title]", or as a hand-off from Ideation.
---

# Script Studio

Write the video — in the agent's voice, ready to read off a teleprompter.

> **Applies the YouTube Doctrine** (`${CLAUDE_PLUGIN_ROOT}/shared/youtube-doctrine.md`) — the source of
> truth here. Build the script on **§4 video structure** (Hook → Primary CTA near the beginning → Body →
> Secondary CTA → next-video direction), **§5 hooks** (incl. the §5.4 formula and the §5.5 bad-hook list),
> **§6 CTAs** (the §6.2 primary-CTA structure + the §6.4 variations + the §26 library), **§7 body**, and the
> **§24.6 script template** (conversational, easy to *speak*, never a stiff essay). Match the script to the
> idea's video type and follow that pillar's structure — market updates §9.1, home tours §10.1 (+ new-
> construction positioning §10.5), relocation §11.1, community tours §12.1, map tours §13.1/§13.3, lifestyle
> §14.1. Length: relocation talking-head 8–12 min, other types 10–25 min (§27.6).

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
Follow `references/script-format.md` and the doctrine's universal structure (§4) in `references/script-framework.md`:
- **Hook (0:00–0:30/60s)** — use the idea's hook; follow the doctrine §5.4 formula: call out the viewer/
  situation → introduce the tension/mistake/question/opportunity → say what the video helps them understand
  → add a reason to stay to the end. NEVER "welcome back," a long personal intro, "today we're going to talk
  about…," or a credentials dump (§5.5). It promises the payoff that matches the title/thumbnail.
- **Primary CTA (right after the hook)** — the doctrine's §6.2 structure: brief intro ("if you're new here,
  my name is [Name] with [Brokerage]…") + "people just like you" social proof + speak to "your unique
  situation" + "avoid costly mistakes" + book a private call via the link in the description. Keep it short.
  Use the right §6.4 variation for the avatar (buyer / seller / relocation / new-construction / luxury) and
  the §26 library — pull the agent's real CTA wording, booking link, and brokerage from the Brain.
- **Body** — deliver the hook's promise (§7): logical order, plain language, local specificity, no random
  tangents; for each point answer *what they need to know · why it matters · what they should do* (§7.2) and
  translate facts into guidance — never info-dump a stat without its meaning (§7.3). 3–5 clear sections, real
  specifics + a story where natural, a pattern interrupt where it helps. Talking-point bullets for lists.
  Follow the pillar's own body shape (market updates §9.1 · home tours §10.1/§10.5 · relocation §11.1 listicle
  · community §12.1 · map tours §13.3 logical sequence · lifestyle §14.1).
- *(Optional, only if it serves the content)* one light, value-first mid reminder tied to the material ("the
  full checklist's linked below"). Never salesy, never a hard second pitch — the doctrine mandates two CTAs.
- **Secondary CTA (the very end)** — the final thing said (§6.5): remind them to book/reach out + point to the
  **next best video** (general next-video for a newer channel, a specific continuation for an established one).
- **Chapters** — list the timestamped chapters at the end (they feed the SEO description).
- Cues: `[brackets]` = delivery/B-roll · `>>` = on-screen text · `(source, date)` = a fact's source (not read aloud). Guidance only — no editing.

**Keep it tight — never a 10-page essay.** Match the runtime: ~140 words/min. Target the doctrine's length
(§27.6) — relocation talking-head **8–12 min**, all other types **10–25 min** — and write the word count to
fit (e.g. a 10–12 min video ≈ 1,400–1,700 words). Value-dense, scannable, cut filler. Per §24.6 it must read
**easy to speak** — conversational lines, clearly-labeled sections, bullet-friendly delivery — never a stiff essay.

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
Also write one 30–45s short-form script (Reel/Short/TikTok): punchy hook (same §5 rules — straight into the
viewer's question, no "welcome back") → one core point → a brief CTA in the §6 spirit (invite them to reach
out / book).

## Step 5 — Compliance + fact-check
Before saving: (1) **fact-check** — verify every stat/claim is sourced from the Research Brief; flag anything
unverifiable with `[double-check before filming]` and never leave an invented number; (2) run the
**Compliance Guardrail** (Fair Housing language, required disclaimers). Fix anything flagged.

## Step 6 — Save
Create the video's folder if needed — `Videos/{YYYY-MM · Month}/{YYYY-MM-DD · Title}/` — and save the
script as a clean doc named **Script** inside it. Format it per
`${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md` §4 — a teleprompter-ready layout, NEVER a wall of text:
a title + meta line (runtime · audience), ALL-CAPS section headers with timestamps set off by em-dash
dividers (`──────── HOOK · 0:00 ────────`), a blank line between sections, spoken lines prominent, and
cues (`>> ON SCREEN`, `[PAUSE]`, `FACT:`) on their own lines. Write it as the structured text in
`${CLAUDE_PLUGIN_ROOT}/shared/doc-format.md` (the Script skeleton — detailed in `references/script-format.md`),
render it to the styled `.docx` per doc-format.md, and upload the `.docx` to the video's folder.

## Hand-off
After scripting → **SEO Engine** (title/description/tags/chapters) + **Lead Engine** (a matching lead
magnet). Offer: "Want the SEO package and a lead magnet to go with this?"
