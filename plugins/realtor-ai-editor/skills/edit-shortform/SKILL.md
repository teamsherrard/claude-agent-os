---
name: edit-shortform
description: Make short-form vertical video by directing Descript on the agent's own account — either recycle one long video into several clips, or edit a standalone reel. Picks the strongest moments, reframes to 9:16, adds a hook, on-brand karaoke captions, punch-ins, and ducked music, then exports. The agent watches it happen live and approves before posting. Trigger on: "make a reel", "make this vertical", "make shorts/clips from this", "repurpose my video", "cut this up into clips", "turn my long video into shorts". Usually reached through editor-navigator.
---

# Edit short-form

You are the director; Descript edits; the agent approves. **Read up front (only these three):** the Brain (`identity/`), `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`, and `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md` (the one-page rulebook) — then follow **Playbook B** in `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md` (**THE PASS PLANS live there: a reel is 4 paid passes**). **Open the other refs at the step that uses them — not up front** (faster start, same rules): captions `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md` · graphics `${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` · grade + flattering people `${CLAUDE_PLUGIN_ROOT}/shared/footage-look.md` · effects `${CLAUDE_PLUGIN_ROOT}/shared/effects-menu.md` · CTA `${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md` · the 80/20 `${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md` · video type `${CLAUDE_PLUGIN_ROOT}/shared/content-types.md` · music `${CLAUDE_PLUGIN_ROOT}/shared/music.md` — and ALWAYS run the final check (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`) before delivery.

## The always-done core (the 80% — never skip)

Every reel ALWAYS gets, every time: a **clean cut** (filler/dead-air/bad-takes removed), **open ON THE HOOK**, a **clean ending** (never mid-sentence), **Studio Sound (~55% default, higher for phone/echoey)**, a **colour grade (bare-minimum, never over-saturated)**, **karaoke captions** (brand-accent active word), a **reframe to 9:16**, and **energy on key beats — a couple of zoom-in/out punch-ins (each with a swoosh SFX), smooth transitions, and a couple of SFX**. Plus a **hook card**, the **CTA**, and **up to 3 B-roll** on the key lines. That clean core is the whole job. Anything beyond it (more B-roll, more graphics, tweaks) is the agent's manual 20% — they add it by hand in Descript for free (no AI credits).

## Run it as 4 paid passes

Execute via **THE PASS PLANS** in `${CLAUDE_PLUGIN_ROOT}/shared/descript-playbooks.md`: **P1 CLEAN** (9:16 reframe + cuts + Studio Sound, one call) → **P2 CAPTIONS** (glossary, then karaoke) → **P3 B-ROLL** (import, one placement call) → **P4 FINISH** (grade + energy + music + hook card + CTA, one call). Everything else — moment-picking, scoring, the glossary, the compliance read, frame-QA — is **FREE Claude work**: do it before/between the paid passes, never as extra paid calls. One render at the end.

## Two modes

- **Recycle** — pull the best clips out of an existing long video (turn one long video into N shorts). Follow **The recycle batch process** below.
- **Standalone** — edit a single short the agent recorded. Use **The recipe** directly.

## The recycle batch process (long → N shorts)

This is the batch path: one long video becomes several standalone reels. Keep the standalone-reel recipe below intact — this just wraps it so you do the whole batch cleanly, cheaply, and without half-finished clips. Work through these steps in order.

**STEP 0 — Scope + confirm (no cost).** Confirm this is a Recycle job and lock **N** (default **3**, hard cap **5 per session** — beyond 5, do a second session). Say it back in one sentence and get a yes: *"Got it — I'll pull 3 standalone reels out of your long video. Sound good?"* That single yes is the COST gate for the whole batch — no re-asking about cost per clip. The destructive-cuts hard gate (`${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md`) still applies, satisfied once per batch: STEP 3's approval of the chosen spans plus ONE consolidated preview of the planned cuts (before any clip's pass 1 fires) covers all N clips.

**STEP 1 — One shared import + transcribe (whole batch).** If the long video is already in Descript, use it as-is. If not, import it by URL **once**. **NEVER re-import or re-transcribe per clip** — one import and one transcript serve all N clips.

**STEP 2 — Scan + score candidates (read-only, ZERO Descript calls).** Read the transcript and score candidate moments entirely on the transcript text — no Descript calls here. Look at every contiguous 20–60s span and score each **0–2 on FIVE criteria**: (1) **self-contained** (makes sense with no setup), (2) **strong hook line** (the first line grabs), (3) **high-value or emotional** (a tip, a number, a story worth saving), (4) **clean payoff** (lands on a conclusion or CTA), (5) **length-fit** (ideal 30–45s). Keep **at most 10** candidates. For each, note its **start/end quote** so you can find it again.

**STEP 3 — Pick the top N, distinct.** Rank candidates by total score. **Reject any candidate that overlaps a pick or repeats the same core topic** — vary the angle so the set feels different (e.g. one tip / one number / one story). If there aren't N genuinely distinct strong moments, **say so** rather than shipping a weak or duplicate clip: *"Your video has 2 strong standalone moments, not 3 — want 2 great ones, or should I stretch a 3rd?"* Show the chosen N (each as its **hook line + ~length**) and get a quick yes.

**STEP 4 — Batch budget (guardrail).** Budget roughly **4–5 `prompt_project_agent` calls per clip** (the 4-pass plan; the B-roll pass only where used). **N=3 ≈ 13–17 calls** + the one shared import = comfortably under Descript's **100-query** ceiling. If **N × budget** approaches ~80, **split into separate sessions**. State the estimated credit cost up front so there are no surprises.

**STEP 5 — Build clips sequentially, each to done, with a per-clip checkpoint.** Build **one clip fully before starting the next** (a crash then leaves N−1 finished reels, never a pile of half-clips). Each clip gets the **identical 4-pass recipe**: P1 CLEAN (9:16 reframe + cuts + clean open/end + Studio Sound ~55%) → P2 karaoke captions → P3 ≤3 B-roll → P4 FINISH (grade + energy + music + hook card + CTA). After each clip, **verify its job results landed** and log the checkpoint (see the checkpoint-log convention) before moving on.

**STEP 6 — Frame-QA each clip** before delivery (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`) — captions not over the face, nothing in the right ~12% icon rail or the top/bottom bars, audio clean, opens on the hook, ends clean.

**STEP 7 — Deliver all N at once,** in **one message**, each labelled by its hook line. **Never dribble them out** one at a time.

## The recipe (the WHAT — it executes as the 4 paid passes above)

1. **Pick the moment** (free prep) — must stand alone, start with a hook, end on a payoff/CTA.
2. **Reframe to 9:16** (paid **pass 1**, one call with the cuts), keep the face centred with headroom.
3. **Cut hard + clean the audio** (**pass 1**) — zero dead air (cut tighter than long-form), and **always apply Studio Sound** — **default ~55%**, but **~80–90% for phone audio (most realtors) and echoey rooms**; never so low it leaves a fishbowl echo (judge on playback, not the scrub preview). **Clean start & end:** open on the hook, trim the camera-off reach / dead air at the end, never end mid-sentence — but never cut the hook or the CTA. **Before firing pass 1 (it batches the destructive cuts):** show the agent the planned cuts (from the free transcript read) and get a yes — the destructive-pass **hard gate** in `${CLAUDE_PLUGIN_ROOT}/shared/dos-and-donts.md` — and if the reel was recorded straight in Descript (no external source file to fall back on), make ONE snapshot / version checkpoint first and say plainly: *"I saved a copy of your original first."*
4. **Hook in the first ~1.5s** — 3–5 words, a claim or a number. **Before writing ANY on-screen text** (hook card, CTA, any caption wording), read `identity/compliance.md` so the words stay within the agent's brokerage/legal rules (disclaimers, no claims they can't make) — this is assistance keeping their content safe, not legal advice. **`identity/compliance.md` can be in THREE states, and two of them mean "no disclaimer yet":** (1) **MISSING** (file not there), (2) **PRESENT + FILLED** (real disclaimer text + license #), (3) **PRESENT BUT UNFILLED PLACEHOLDER** — it exists but still has `[bracketed]` template tokens or unreplaced template headings (first-run Brain setup scaffolds it as a template; compliance is a later phase). Detection: any `[` bracket token or unreplaced template heading = unfilled. **Treat state (3) EXACTLY like MISSING:** withhold all claim-bearing cards, keep captions to plain spoken words, **NEVER stamp a `[placeholder]` disclaimer onto the video**, and do **NOT** FAIL or stop the edit — deliver safely, then nudge ONCE: *"I kept the wording neutral since your compliance disclaimer isn't set yet — say 'set up my compliance' to lock your brokerage disclaimer + license # for future videos."* Never dead-end a first edit over an unset disclaimer. Add the hook CARD **natively in Descript**, on a rounded brand panel, big, bold, animated in, OFF the face (pinned high above the hairline — just inside the top safe-zone margin, `${CLAUDE_PLUGIN_ROOT}/shared/layouts.md` — or timed over a B-roll moment) — never a flat static Descript text box (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md` is the visual standard).
5. **Captions on, always — NO exceptions** (**pass 2**, right after the glossary corrections) — a short-form reel without captions is an automatic FAIL. Pinned in the LOWER portion (vertical position ≈ 0.82–0.86), **below the speaker's face (never centered, never over the face)**, **BIG and phone-legible (~90pt+, never Descript's ~60pt default)**, karaoke, brand accent set EXPLICITLY on the active word (never a tool default like green), high contrast against the footage (`${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`).
6. **B-roll** (**pass 3** — import the clips, then ONE placement call) — `editor-broll`, on the words, **full-cover, never over the hook/face/CTA, and NEVER the same clip twice anywhere in the reel (not just back-to-back)**. **HARD CAP: MAXIMUM 3 clips on a reel** — not more; over-b-roll drains credits and clutters. If the agent wants more, they add it by hand (free). Horizontal b-roll → split-screen or clean full-bleed, never over-zoomed/floating (`${CLAUDE_PLUGIN_ROOT}/shared/layouts.md`).
   - **Graphics are done NATIVELY in Descript and kept MINIMAL** (`${CLAUDE_PLUGIN_ROOT}/shared/graphics-style.md`): a **hook card + a CTA card** (2, maybe 3 cards total). Each on a rounded brand panel, big, animated, OFF the face. The **karaoke captions already carry the keyword emphasis** — so NO separate keyword-pop cards by default. Never "sparse-panic" into piling on cards; more than 2–3 = the agent adds them by hand.
7. **Energy (mandatory minimum — on KEY beats, not every scene):** a couple of **zoom-in/out punch-ins** (subtle ~1.06–1.08, each with a **swoosh SFX**), **smooth transitions** at scene changes, and **at least a couple of SFX**. A flat, static reel is a fail. Keep cards to 2–3 max; NO count-up number animations; no heavy AI effects (`${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`). *(Energy, music, and both cards all land together in **pass 4** — one call.)*
8. **Music** ducked under the voice (**pass 4**).
9. **End with the CTA** — close on the agent's call-to-action with an on-screen CTA pop-up (`${CLAUDE_PLUGIN_ROOT}/shared/cta-pack.md`), not just spoken words (**pass 4**).
10. **Export, then run the final check on the exported frames** (`${CLAUDE_PLUGIN_ROOT}/shared/final-check.md`) — audio, opening/ending, captions/overlaps, framing; fix and re-export any blocker; on approval, hand back the file(s).

Target 20–60s (ideal 30–45s). Pay off the hook.

## Checkpoint log (shared convention — resume safely, never double-charge)

Keep a tiny per-project log at `~/realtor-brain/editor/jobs/<project-id>.md`. **Append ONE line per landed pass:** `<pass name> · done · <job_id>`. In a recycle batch, treat each clip's passes as checkpoints so a crash leaves finished clips, never half-clips.

At the **START** of a long-form / listing edit (and when resuming any job), check for this log. If it exists, say **one plain line** — *"Picking up where we left off — audio and first cutaways are done, finishing the b-roll and cards now"* — and run **ONLY the passes not already logged**. **Never re-run a logged paid pass:** re-applying grade or Studio Sound double-applies it and wastes credits.

**Credits / quota-exhausted failure mode:** on any quota, plan-limit, or out-of-credits signal, **do NOT retry**. Say: *"Your Descript is out of edit credits this cycle — your work is saved; add credits or wait for renewal, then say 'finish my video' and I'll pick up exactly where we stopped."* The checkpoint log is what lets you resume from the exact pass that failed.

## Credit discipline

Reframe + captions + cuts are cheap and reliable — lead with those. The basics (cut, open-on-hook, clean end, Studio Sound, grade, karaoke captions, reframe) are ALWAYS done and non-negotiable; everything past the hook card, CTA, and ≤3 B-roll is the agent's manual 20%. AI-generated B-roll is banned outright — warn and skip (`${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`). Make several clips in one batch rather than re-running per clip. See the full 80/20 rule in `${CLAUDE_PLUGIN_ROOT}/shared/credit-tiers.md`.
