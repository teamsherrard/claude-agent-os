# Realtor AI Editor — Riverside engine

An AI video editor for real estate agents, running on **Riverside**. The agent talks to Claude in plain English; Claude **edits the video directly in Riverside** (on the agent's own account) — long-form *and* short-form — and the agent reviews and approves before anything goes out.

This is the sister of Plugin 6 (the Descript editor). Same brand, same house rules, same 80/20 hand-off, same review-draft delivery. **Different engine, different mechanics** — and that changes three things for the better:

## Why Riverside is different (the short version)

| | Descript engine (Plugin 6) | Riverside engine (this plugin) |
|---|---|---|
| Who does the editing | Claude writes an instruction; Descript's AI (Underlord) interprets it and edits | **Claude IS the editor** — every cut, caption, card, and clip is a precise tool call. Nothing interprets your intent in between. |
| What it costs the agent | Per-pass AI credits + media minutes (~200–250 credits for a 10–20 min video) | **No per-edit AI credits.** Riverside meters the plan (hours / export limits), not each pass. |
| Can we prove what changed? | Read the project and hope | **Yes — every write returns a revision, and a diff tool lists exactly which cuts/mutes/scenes changed.** |
| Filler removal | Descript will silently *voice-clone* a stutter unless told not to | Transcript-labelled cut/mute only. No audio synthesis exists in the toolset. |
| Publishing | Hands back a share link and stops | **Posts natively** to YouTube / Shorts / TikTok / Instagram / Facebook / LinkedIn / X, with scheduling — behind the agent's explicit yes. |
| Getting footage in | Import by URL (Drive / Dropbox) | The main recording must be **recorded in Riverside or uploaded in the Riverside dashboard**. The connector uploads only B-roll / music / images (≤500 MB each). |
| Effects breadth | Wide (eye contact, green screen, overdub, transitions, SFX library) | Narrower: punch-ins via keyframes, captions, text cards, lower thirds, logo, stock B-roll, free music. **No transition or SFX library** reachable from the connector. |
| Visual preview | None | None from the connector — but the editor's preview page can be screenshotted in the browser, and an export the agent downloads can be frame-read locally. |

**Verdict baked into the design:** predictable, verifiable, and cheaper per edit; slightly less flashy. The 80% core is fully covered. The energy layer is re-baselined honestly (punch-ins yes; swoosh SFX only if the agent drops a licensed file into their library).

## The philosophy

**Claude edits · Riverside renders · the agent approves.**

Claude plans the edit from the transcript (free), applies it with precise operations, verifies each pass landed by reading the revision diff, exports once, frame-checks what it can, and hands back a **review draft**. The agent finishes the last 20% by hand in the Riverside editor, for free.

## What it does

- Edits long-form: opens on the hook, removes filler words / dead air / duplicate takes, Magic Audio, a bare-minimum grade, B-roll scaled to length, a hook card + CTA + emphasis pop-ups, a lower third, native chapters, and a ready-to-paste title + description.
- Makes short-form: recycles a long video into N vertical clips or edits a standalone reel — 9:16, face-centred, karaoke captions in the brand accent, ≤3 B-roll, ducked music bed, hook + CTA.
- Edits listing tours with the agent's own property footage or listing photos (never generic stock for the home).
- Sources B-roll from Riverside's built-in stock, the agent's own footage (Drive or uploads), and free libraries — de-duplicated.
- Applies the agent's brand from the Realtor AI Brain (and can write it into the Riverside studio brand kit once).
- **Publishes or schedules** the finished video to the agent's connected channels — summary shown, explicit yes required, status verified after.
- Handles vague or messy requests through a navigator; resumes a stopped edit from a checkpoint log **or from the revision history itself**.

## What it can't do

- See the rendered video play. It reads transcripts, timelines, diffs, and (where reachable) frames — the agent's eyeball is the final visual QA.
- Import the main recording by URL. Record in Riverside, or upload the file in the Riverside dashboard first.
- Transitions, SFX, eye-contact, green-screen, overdub. Not exposed by the connector — and most were banned or discouraged anyway.
- Undo a social post. Publishing is one-way; that's why it's gated and summarised first.
- Bypass a feature gate. Some accounts can't create an edit from a recording, or write the brand kit, through the connector. Each skill has the fallback.

## The skills

| Skill | What it's for |
|---|---|
| `riverside-setup` | One-time onboarding: connect Riverside, pull brand from the Brain, write the studio brand kit, pick the caption look, check publish channels. |
| `riverside-navigator` | The friendly front door. Vague request → one clear plan → the right skill. Also resumes stopped edits. |
| `riverside-longform` | Edit a long-form / YouTube video end to end. |
| `riverside-shortform` | Make a reel, or recycle a long video into vertical clips. |
| `riverside-listing` | Edit a property / home tour with the agent's own footage or listing photos. |
| `riverside-quick` | One small fix, one or two calls — "just add captions", "just clean the audio". |
| `riverside-broll` | The B-roll brain: finds and places footage from multiple sources. |
| `riverside-publish` | Post or schedule a finished edit to the agent's connected channels, with the confirmation gate. |

## Setup

Run `riverside-setup`. The only required connection is **Riverside** (Claude → Settings → Connectors → Riverside, sign in with the agent's own account). Google Drive is optional (own-footage library + Brain sync). Stock keys are optional.

Heavy editing runs best in **Code mode** in the Claude desktop app (many small tool calls per edit; Code is the most robust mode for that). Same plugin, same login.

Settings are saved in the agent's Realtor AI Brain (`~/realtor-brain/editor/config.json`) — the **same file the Descript editor uses**, so brand and CTA are set once for both engines.

## Effort-smart by default — the 80/20 rule, re-based for Riverside

There are no AI credits to protect here — but there IS the agent's time, their plan limits, and the risk of over-editing. So the discipline is the same shape: do the high-value **80%** brilliantly (clean cut, open on the hook, clean end, Magic Audio, bare-minimum grade, captions/emphasis, 9:16 where needed, punch-ins on key beats, hook + CTA, B-roll to the cap), then **stop**. The agent finishes the last **20%** by hand in the Riverside editor, free. Hard caps still hold: short-form B-roll ≤3, ≤2–3 cards, no heavy AI effects, no gimmicks. (Full rule: `shared/cost-discipline.md`.)

## Status

**v0.1.1 — first live run done** (a 12-min 16:9 realtor YouTube video, 27 revisions, ~40 min wall-clock, zero credits): fillers cut, Magic Audio, grade, 15 stock cutaways full-cover, 3 punch-ins, hook card, 5 pop-ups, CTA, lower third, 11 chapters, one 1080p export (no watermark on this plan). **It found and fixed four things the connector guide doesn't say:** stock overlays land at 90% with a border (scale batch is mandatory); `add_lower_third` inserts on the face (move it); a Riverside-made edit can arrive with captions ON (long-form must switch them off); placement tools want SOURCE time while the transcript speaks PLAYABLE time (offset table from `syncedCuts`). Also learned: the timeline canvas is a 640×360 reference; fontSize 64 boxed = the right card; Riverside auto-adds AI chapters to merge with; the editor preview can draw phantom duplicate text the render may not contain (verify on the export). Built from the Descript editor v0.21.0 line by line, re-based on the connector's 61-tool surface.
