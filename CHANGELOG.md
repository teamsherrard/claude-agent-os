# Changelog

All notable changes to the Realtor AI Brain. Versions follow `MAJOR.MINOR.PATCH`.

## [0.53.0] — 2026-06-25

### Document rollout — every plugin now renders deliverables as a clean, formatted `.docx` (was flat `text/plain`)
The approved look is now the system-wide standard: **Arial**, **pure-black** text, real headings / bullet
lists / tables, light-grey rules — **one neutral standard for every client** (no colour, no per-client branding).
- **New shared renderer `shared/render_doc.py`** (shipped, identical, to all 4 doc-producing plugins): turns
  the house-style structured text every skill already writes into a styled `.docx` automatically — headings
  from the section bands, real bullet lists, real tables. Robust across every plugin's divider style
  (`═` / `─` / `—`, wrapped or above-only) and tells a section header apart from a footer line.
- **Doc standards rewritten** from "save flat `text/plain` Google Doc" → "render the structured text to a
  styled `.docx` and upload that": YouTube `doc-format.md`, Brain `doc-formatting.md`, Lead-Capture +
  Short-Form `output-standard.md`, plus the save-steps + house-rules in their skills. Skills keep producing
  the same content; only the final save step changes.
- Flagship docs keep the `Powered by Mike Sherrard Coaching Inc Frameworks` stamp.
- Plugins bumped: **Brain 0.20.0 · YouTube 0.7.0 · Lead Capture 0.7.0 · Short-Form 0.8.0**.
- First Cowork run of each doc type should be verified: the renderer needs `python-docx`; if it's absent the
  skill falls back to the **docx skill** matching the same look.

## [0.52.0] — 2026-06-25

### YouTube System (Plugin 3) → v0.6.3 — credibility stamp reworded
- The stamp on every flagship document now reads **"Powered by Mike Sherrard Coaching Inc Frameworks"**
  (was "Powered by Mike Sherrard's frameworks & strategies"). The byline updated to match
  ("Prepared on Mike Sherrard Coaching Inc frameworks"). Applied across `doc-format.md`, house rules,
  the gameplan framework reference, and the gameplan + setup skills.

## [0.51.0] — 2026-06-24

### Lead Capture System (Plugin 5) → v0.6.1 — guide is an INSTANT DOWNLOAD, never email delivery
- Hard rule (house rules #4): the lead magnet is delivered as an **instant download on the thank-you page,
  NEVER by email**. The plugin sets up no email automation, so "check your inbox / your guide's on the way"
  is a broken promise — removed from all funnel copy (thank-you state + reassurance now say instant download).
- The funnel skill must **never ask the agent how to deliver the guide** and never offer an email-delivery
  option — it's always the instant download. (The email is captured for the agent's own follow-up only.)
- Fixed across house-rules, funnel-guide, the funnel skill, copywriting KB, and the output-standard skeleton.

## [0.50.0] — 2026-06-24

### AI Editor (Plugin 6) → v0.9.0 — guardrails from the first full long-form edit (Mike's "New Era" video)
Hardening from live revision feedback on a real long-form YouTube edit — six rules baked in so the blind-editing
mistakes Claude can't see stop happening at the source:
- **B-roll is now REQUIRED on every long-form** — at minimum a few topical clips from Descript's built-in stock
  (zero setup). Never deliver a bare talking-head with no cutaways. (`broll-ladder`, `edit-longform`, `final-check`, `dos-and-donts`)
- **Graphics & cards NEVER over the face** (not just captions) — Descript defaults text to centre/on-face, so pin
  every card to the lower third explicitly. (`graphics-style`, `final-check`, `dos-and-donts`)
- **No cramped multi-box grids** — Descript renders a small 2×2 "quadrant" broken (overlapping, cut-off text);
  use clean sequential cards or a simple list instead. (`graphics-style`, `final-check`, `dos-and-donts`)
- **NEVER background-removal / green-screen on a talking-head** — it blacks out the room (it got toggled on
  accidentally via a side-by-side request and rendered a black void). (`descript-playbooks`, `final-check`, `dos-and-donts`)
- **Studio Sound by SOURCE** — phone audio ~80–90%; a real external mic is already clean, so light (~30–40%) or
  off (high intensity brightens/thins the voice — especially a deep voice). Sync a separate high-quality mic
  track instead of forcing Studio Sound. (`descript-playbooks`, `edit-longform`, `final-check`, `dos-and-donts`)
- **Count-ups are the most expensive effect** (~167 credits in one pass) — default to static stat cards;
  count-ups for hero moments only. (`credit-tiers`, `dos-and-donts`)

## [0.49.0] — 2026-06-23

### Lead Capture System (Plugin 5) → v0.6.0 — funnel to 9 sections: mockup, WHO/OFFER split, conditional socials
- **The Guide section (§3)** now sells the magnet's value *with the cover mockup placed left/right* (was a
  plain "what's inside" list).
- **WHO and OFFER/USP are now an explicit adjacent pair:** About (§4 — WHO the agent is) → Why Work With (§5 —
  the OFFER + USP), two distinct, clearly-labelled sections.
- **New conditional Socials section (§8) — "As Seen On / Follow Along":** showcases the agent's YouTube +
  socials, but ONLY if they actually have channels (reads `profile.md` / `content-engine.md`; skipped entirely
  otherwise). Framed as a trust signal — the opt-in stays the one primary CTA, never a competing button.
- New order: Hero → Problem → The Guide → About → Why Work With → Local Market → Proof → Socials* → Opt-in.
  Updated across funnel-guide, the funnel skill (Step 2 socials read + Phase 2 + assets + checklist), the
  copywriting KB, the output-standard skeleton, and the README.

## [0.48.0] — 2026-06-23

### Lead Capture System (Plugin 5) → v0.5.0 — funnel expanded 5 → 8 sections (a more complete, higher-converting page)
- The opt-in funnel was a 5-section trust backbone; added the 3 highest-converting blocks it was missing:
  **The Problem** (agitate the avatar's real fear before any pitch), **What's Inside the Guide** (a concrete
  value-stack that earns the email, with a mid-page CTA), and **Proof / Results** (a *dedicated* social-proof
  block instead of proof sprinkled in passing).
- New order: Hero → The Problem → What's Inside → About → Local Market → Why Work With → Proof → Opt-in.
  CTA repeats ~3× (hero · mid-page · opt-in); About slims to one credibility line; the opt-in recaps the top 3
  (full value-stack lives in What's Inside). (Chose 8 over the full 9 — skipped a standalone FAQ.)
- Updated across funnel-guide, the funnel skill (Phase 2 + checklist), copywriting KB (flow + new section
  craft notes for Problem / What's-Inside / Proof), the output-standard skeleton, and the README.

## [0.47.0] — 2026-06-23

### Lead Capture System (Plugin 5) → v0.4.0 — copy + strategy focus; design prompt removed (a separate skill owns it)
- **Refocused the whole plugin on copy + structure + strategy.** The design prompt is gone — a dedicated
  design skill now owns turning the copy into the built page/PDF. Both skills, the output standard, house
  rules #3, the copywriting KB, and the README all updated to match (no more brand-visual reads, no design briefs).
- **New "strategy underneath" layer in the funnel guide** — the real lever on conversion, read FIRST: one big
  idea · lead with the avatar's deepest desire + most acute fear · dissolve the 3 reasons they won't opt in ·
  the emotional arc · "specificity IS the proof."
- Docs now end in a clean **"▸ NEXT — hand to your design step"** appendix (just the assets to gather) + the
  compliance footer — no design brief cluttering the deliverable.

## [0.46.0] — 2026-06-23

### Lead Capture System (Plugin 5) → v0.3.1 — cleaner, better-organized output docs (live-test feedback)
- The saved Google Docs (lead magnet + funnel) were a confusing mix of content + build-instructions +
  compliance in crude em-dash dividers. Now: a one-line **purpose line** up top (what it is / what to do with
  it), clean **box-drawing section rules** (`────`), and the **build-in-Design prompt + compliance moved to a
  clearly-labelled appendix** (`▸ NEXT` / `▸ COMPLIANCE` under a heavy `═` rule) — so the deliverable reads as
  a finished piece, not a worksheet.
- Honest framing baked in: a Google Doc can only be structured text; the *designed* PDF/page is what the agent
  builds in claude.ai/design — this doc is the clean brief that feeds it.

## [0.45.0] — 2026-06-23

### Lead Capture System (Plugin 5) → v0.3.0 — funnel is value-led now, not salesy (live-test feedback)
- **New funnel section: "The Local Market — your communities."** Pulls the agent's real communities from the
  Brain's `market.md` (named areas, price bands, new-build communities, facts) — the un-fakeable local
  authority that makes the page read like value, not a pitch. The design prompt now cues the agent to upload
  real community/area photos in claude.ai/design (+ headshot, guide cover, logo — a "📷 upload these" checklist).
- **Strengthened "Why Work With [Agent]" section** — the full offer + USP + the real why-hire-them, straight
  from `offer.md` (not just the guide's process). The section most agents' pages were missing.
- **Value-led, not salesy** — the copywriting KB + funnel guide now lead with genuine local depth + a real
  offer; a thin all-pitch page reads salesy, a substantive one reads like an expert.
- Funnel is now 5 sections: Hero · About · Local Market · Why-Work-With-Me · Opt-in (skeleton + KB updated).

## [0.44.7] — 2026-06-23

### AI Editor (Plugin 6) → v0.8.7 — finalization QA pass (full audit, v1-ready)
Full deep-dive audit of the whole plugin (6 skills, 17 shared refs, config, README). All cross-references
resolve, Brain paths are consistent with Plugin 1, and there are no orphaned files. Issues found and fixed:
- **Caption-on-face bug at the source.** `edit-shortform` recipe step 5 still instructed captions to be
  "center" — the exact thing that puts them on the face. Now pinned to the lower third, below the face.
- **Accurate import limits.** Drive-by-URL import does NOT work for very large files (multi-GB 4K, ~10 GB+) —
  Google blocks the download behind a virus-scan page. Documented the real limit + the fixes (Descript-desktop
  drag, 1080p export, Dropbox). (`descript-playbooks.md`, `editor-setup`)
- **Removed dropped-engine reference.** `cta-pack.md` still named HyperFrames (dropped); reframed to the v1
  default (Descript places a clean branded CTA card) vs. the optional graphics-engine handoff.
- **README status refreshed** to v0.8.7 with the v0.8.x hardening (captions below face, clean frames, speaker
  reframing, honest human visual-QA).

## [0.44.6] — 2026-06-23

### AI Editor (Plugin 6) → v0.8.6 — force captions low (Descript defaults them onto the face)
- **Caption position must be set explicitly.** Discovered live: Descript defaults added captions to dead-centre
  (vertical position ≈ 0.50) — directly on the speaker's face — which is why caption-on-face kept recurring.
  `caption-style.md` now requires always setting the vertical position low yourself (≈ 0.84–0.88: below the chin,
  above the bottom ~12% UI strip) and never trusting the default; in split-screen, push captions to the bottom of
  the speaker's band. (Caught + fixed on the Seattle reel — 3 captions were sitting at y=0.50, dead-centre.)

## [0.44.5] — 2026-06-23

### AI Editor (Plugin 6) → v0.8.5 — captions NEVER over the face + honest visual-QA limits
- **Captions never over the face (absolute).** Fixed a self-contradiction: caption-style said "center position,"
  which put captions ON the face. Now captions pin to the LOWER portion — below the face, above the bottom ~12%
  platform-UI zone — 2–3 words/line so they can't creep up into the face. (`caption-style.md`, `dos-and-donts.md`)
- **Honest visual QA.** Claude cannot see the rendered pixels through Descript, and the editor's own position
  reports proved unreliable (claimed captions were clear of the face when they weren't). `final-check.md` now
  states plainly: caption-on-face, overlaps, and positions CANNOT be verified by Claude — they MUST be
  human-eyeballed (hand over the review link + the specific checks); never claim a visual is confirmed.

## [0.44.4] — 2026-06-23

### AI Editor (Plugin 6) → v0.8.4 — no ugly black boxes (live feedback)
- Keyword pops / emphasis text must use a premium style — clean bold text with outline + soft shadow (floating),
  or a sleek rounded semi-transparent panel — NEVER a hard opaque flat black rectangle (recurring complaint).
  (`graphics-style.md`, `dos-and-donts.md`)

## [0.44.3] — 2026-06-23

### AI Editor (Plugin 6) → v0.8.3 — split-screen speaker framing (live fix)
- `layouts.md`: when using split-screen, **reframe the speaker to FIT his band** (clean head-and-shoulders,
  centred, headroom) — never just crop his full-frame shot into a half-height band (it slices off the head and
  chin). Give the speaker band more height if the face won't fit. (Caught live on the Seattle reel.)

## [0.44.2] — 2026-06-23

### AI Editor (Plugin 6) → v0.8.2 — cross-reference cleanup (autonomous audit)
- `editor-broll` now references `layouts.md` (split-screen for horizontal b-roll on a vertical reel — the gap
  behind the over-zoomed b-roll) plus `house-rules` / `dos-and-donts`, and has an explicit vertical-reel framing rule.
- `editor-navigator` now references `dos-and-donts.md`.

## [0.44.1] — 2026-06-23

### AI Editor (Plugin 6) → v0.8.1 — edit-listing brought to parity (autonomous audit fix)
- A consistency audit found `edit-listing` lagging the other edit skills — it was written early and never picked
  up the later hardening. Added: starts from `dos-and-donts.md`; a cleanup step (open on the hook, **Studio Sound
  mandatory**, never end mid-sentence); horizontal b-roll → split-screen (`layouts.md`); brand cards per
  `graphics-style.md` (fit / contrast / no-overlap); runs `final-check.md` before delivery; defaults to Standard
  tier. Now consistent with edit-longform / edit-shortform.

## [0.44.0] — 2026-06-23

### AI Editor (Plugin 6) → v0.8.0 — final-check QA gate + content-types + music (autonomous pass)
- **New `final-check.md`** — a pre-delivery checklist the edit skills now run before handing back (audio on,
  opens-on-hook, ends-clean + CTA, captions readable/fit/no-overlap, framing/split-screen, grade/flattering,
  verify-each-step). Directly targets this session's #1 failure: shipping without verifying.
- **New `content-types.md`** — per-type recipes (market update, listing, just-listed, neighbourhood/relocation,
  tips, testimonial) with hook / structure / edit per type.
- **New `music.md`** — mood→bed mapping, ducking levels (~-17 to -20 dB), licensing.
- Both edit skills now reference content-types + final-check (+ music for shorts) and end with the final check.

## [0.43.1] — 2026-06-23

### AI Editor (Plugin 6) → v0.7.1 — docs & onboarding polish (autonomous pass)
- README un-stale'd (it still said "v0.1 — core scaffold"); added the credit-tier + Code-mode notes.
- Setup: reconciled the connector step to **Code mode** (best for editing); added a **CTA question** to the
  questionnaire so every video ends with the agent's real call-to-action (the gap that left Adam's video without
  one); reassurance that audio is auto-cleaned and nothing publishes without approval.
- Navigator: now defaults to the **Standard** credit tier.

## [0.43.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.7.0 — automatic Studio Sound, split-screen b-roll, fit/no-overlap captions, proper endings (live revision batch)
- **Studio Sound now MANDATORY + automatic on every video.** Agents record on phones — audio always needs it. ~90% default (100% for echoey rooms); it's a render-time effect (judge on playback, not the scrub preview). Added the missing Studio Sound step to the short-form recipe. Honest ceiling: a bad mic/room has limits → recommend agents a cheap lav mic. (`descript-playbooks.md`, both edit skills, `dos-and-donts.md`)
- **New `layouts.md` — horizontal b-roll on a vertical reel.** Don't blind cover-fill (over-zooms — a money shot becomes a fingernail). Use **split-screen** (speaker + b-roll-in-full) via Descript's Layout, or full-bleed only when the subject still reads. Never floating/letterboxed/over-zoomed.
- **Text fits its box + no overlaps.** Text never overflows its panel (padding); captions/pops/cards/CTA never collide or stack (stagger them). Use a polished caption style, not the basic boxy default. (`caption-style.md`, `graphics-style.md`, `dos-and-donts.md`)
- **Proper ending — never mid-sentence.** End on a complete thought + an outro/CTA. (`descript-playbooks.md`, both edit skills, `dos-and-donts.md`)
- **SFX subtle + low.** A few, quiet, purposeful — never loud or random. (`effects-menu.md`, `dos-and-donts.md`)

## [0.42.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.6.0 — minimal ≠ bare: purposeful long-form creativity + audio verified
- **"Minimal ≠ bare."** Live miss: the long-form came out flat (no punch-ins, pops, SFX, or contextual motion).
  New principle across the plugin — the enemy is RANDOM clutter, not creativity. Use **purposeful, contextual**
  touches that MATCH THE WORDS (a "price drop" → a downward arrow; a big number → count-up; "inventory tight" →
  a squeeze). Talking-head (reels AND long-form) needs energy: gentle punch-ins, keyword pops, contextual
  animations, a few tasteful SFX. (`effects-menu.md`, `edit-longform`, `descript-playbooks.md`, `dos-and-donts.md`)
- **Studio Sound is its own verified step.** Live miss: it silently stayed OFF because it was buried in a 5-part
  mega-pass. Now: apply it on its own, verify it actually turned on, push to ~90% for echoey rooms. Reinforces
  "one instruction at a time." (`descript-playbooks.md`, `dos-and-donts.md`)

## [0.41.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.5.2 — "open on the hook" (cut the settle-in intro)
- **Sharpened the clean-start rule to "OPEN ON THE HOOK."** Live miss: the cleanup left a messy ~4-sec intro
  (getting settled, rubbing hands, "let's go" / "let's do this"). The cleanup pass must now explicitly cut the
  settling-in / throat-clearing intro so the video starts on the first real line of content — never the hook
  itself. (`descript-playbooks.md` general habits + Playbook A, `dos-and-donts.md`, `edit-longform`)

## [0.40.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.5.1 — edit the original in place (no duplicate copies)
- **Reversed the "work on a copy" rule.** For realtors in Descript a duplicate composition just clutters and
  confuses (which version is which?), so edit the **original in place**; Descript's own undo / version history is
  the safety net. (The copy-first habit came from the file-based HyperFrames era and doesn't fit Descript.)
  (`descript-playbooks.md`, `edit-longform`, `dos-and-donts.md`)

## [0.39.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.5.0 — credit tiers (balanced quality vs cost; Standard is the default)
- **New `credit-tiers.md`** — Lean / **Standard (default)** / Full. Standard is the credit-smart, premium-minimal
  everyday look: ~90% of full quality at roughly half the credits, via deliberate caps (a few punch-ins not every
  scene, 3–5 B-roll, 2–3 pop-ups max, 1–2 SFX, transitions at major changes only, light grade). Doing one-less is
  both cheaper AND cleaner. Lean = essentials only; Full = hero/case-study videos.
- Both edit skills now default to Standard; house-rules updated (batch passes, never iterate 15×, repurpose
  shorts from a long edit to skip re-import/transcribe).
- Why: a balanced realtor (~2 long + 3–4 shorts/week on Standard) fits a Creator/Business plan (~$35–65/mo)
  instead of the $150+ that full-polish-everything implied.

## [0.38.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.4.1 — zoom/framing safety (never expose the frame edge)
- **Zooms must never cut off the frame.** Live bug: a global ~7.5% vertical position offset combined with
  1.05–1.08× punch-ins pushed the footage past the top edge → black bars. Rule added: clips always FILL the
  frame; zooms are zoom-IN only (≥ full-fill scale); position offsets stay within the zoom's safe headroom;
  verify zero canvas gaps after any zoom/reframe. (`footage-look.md`, `dos-and-donts.md`)

## [0.37.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.4.0 — full revision-loop hardening (communication, contrast, restraint, CTA)
- **Talk like a human editor, not AI.** Realtor-facing communication overhauled: short, warm, plain — no
  jargon / tool-names / fluff, feel like texting your editor. (`house-rules.md`, `plain-language.md`)
- **New `dos-and-donts.md`** — one-page rulebook capping every lesson from the live revision loop.
- **Contrast rule** — never same-colour-family text on same-colour background (the unreadable blue-on-navy
  pop-up); always high contrast. (`caption-style.md`, `graphics-style.md`)
- **Premium & minimal** — new `effects-menu.md` catalogues Descript's effects / overlays / frames /
  annotations and, crucially, WHEN to use each by video type, with a hard "don't over-edit" restraint rule.
- **Clean frame** — no black bars / broken-looking edges, especially in the first second. **Reveal animations**
  — cards/pop-ups animate in, never just appear. (`graphics-style.md`)
- **Always end with the CTA** — new `cta-pack.md`: every video closes with the agent's on-screen CTA; build a
  branded CTA pop-up pack ONCE via the graphics engine (subscribe / DM / link in bio / call / website) and
  recycle it into Descript. Both edit skills now have a CTA step.
- **Credit control** — offer a lean (cheap) vs full-polish (more credits) option and report cost. (`house-rules.md`)

## [0.36.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.3.1 — flattering treatment + safe colour grade (live feedback)
- **New `shared/footage-look.md`** — (1) colour grade is subtle/natural ONLY, with hard guardrails: never
  over-saturate, over-brighten, crush blacks, or go harsh/pixelated; skin tones stay flattering. (2) **Treat
  people flatteringly** — gentle zooms only, never a tight push-in on a face, good headroom, no harsh light on
  faces. Flagged as especially important for self-conscious agents (notably women in the cohort).
- Referenced from both edit skills, plus a "treat people flatteringly" rule added to `house-rules.md`.

## [0.35.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.3.0 — quality + safety rules from the first live revision session
- **New `shared/graphics-style.md`** — hook / title / number cards must be BIG, BOLD (900), ANIMATED (pop-in),
  with depth, and on-brand. Descript's default look is flat ("Fiverr") unless directed hard, so the rule is to
  spell out size / weight / animation / shadow / brand colour every time. Premium kinetic motion-design routes
  to the future graphics-engine handoff.
- **Captions: bigger + on-brand.** Default ~60pt is too small — set ~90pt+ on a vertical reel; always set the
  highlight to the brand accent (Descript defaulted to green once). (`shared/caption-style.md`)
- **Clean starts & ends.** Always trim the camera-on fumble at the start and the camera-off reach / dead air at
  the end — never cutting the hook or CTA. (`descript-playbooks.md`, both edit skills)
- **Credit-safety rules.** Verify each paid step actually landed (`status: success`, `project_changed: true`,
  not `updated_at`) before claiming done; never blind-retry a paid job; stop after 1–2 failures; report credit
  cost. (`shared/house-rules.md`, `descript-playbooks.md`)
- **Learn from revisions.** Revision feedback is applied AND saved to the agent's editor config so the next
  video starts that way; recurring cross-agent notes get baked into the plugin. (`shared/house-rules.md`)

## [0.34.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.2.1 — simplest-path-first for getting the video in
- Playbook now prefers, in order: (1) the video is **already in Descript** (just find the project — no import
  at all), (2) **import by URL** (Google Drive / Dropbox / direct link), (3) never upload big local bytes —
  and **compressing first doesn't help, it still has to upload**. Clarified after a live session burned time
  trying to compress + upload a 1080p file.

## [0.33.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.2.0 — live-test fix: import video by URL (no more big-file upload timeouts)
- **Wired to Descript's real MCP tools** — `list_projects`/`get_project`, `import_media`, `prompt_project_agent`,
  `publish_project`, `wait_for_job` — confirmed against the live connector.
- **Import the video by URL, not byte-upload.** The first live test stalled trying to push a 260 MB local file
  through the sandbox (timed out; the background process died between turns). Descript's `import_media` natively
  pulls from **Google Drive / Dropbox / direct links**, server-side — so the plugin now imports the agent's video
  (and B-roll) by URL, with no upload and no size limit. Local-only files: drop them in Drive first.
- Playbooks now `wait_for_job` after every async step and use `publish_project` for export (share + download URL).
- Setup now notes the Descript connector must be enabled for **Cowork / the workspace**, not just chat (the first
  connection gotcha from live testing).

## [0.32.0] — 2026-06-22

### AI Editor (Plugin 6) → v0.1.0 — new plugin: chat-driven video editing on Descript
- **New plugin: the AI Editor.** The agent talks in plain English; Claude *directs* Descript (on the
  agent's own account) to do the actual editing — long-form and short-form in one tool — while they watch
  it happen live. Claude is the director, not the editor (quality stays high; the agent stays in control).
- **Six skills:** `editor-setup` (connect Descript, pull brand from the Brain, optional free stock keys),
  `editor-navigator` (the friendly front door — turns vague/messy requests into one clear plan, never
  overwhelms the agent), `edit-longform`, `edit-shortform`, `edit-listing` (property/home tours using the
  agent's own footage or the listing photos), and `editor-broll` (multi-source B-roll).
- **Multi-source B-roll** so it stops recycling the same clips: the agent's own footage (a Google Drive
  library or per-video uploads), listing photos as motion stills, Descript's built-in stock, and several
  free stock libraries (Pexels, Pixabay, Coverr, Unsplash) — all optional. Real places stay real (never AI-faked).
- **One tool, fewest steps:** the only required connection is Descript (OAuth); settings live in the Brain.
- Requires Plugin 1 (the Brain) set up first.
- Status: v0.1 scaffold — pending the first live Descript test.

## [0.31.0] — 2026-06-13

### Brain (Plugin 1) → v0.19.0 — capture richer goals + competitors (so downstream plugins never re-ask)
- **`identity/strategy.md` now captures four goal types** — business, YouTube/content, life, and personal —
  plus a **"competitors they admire/follow" list** (local agents/channels). Captured once in the Brain, read
  everywhere.
- `realtor-operations` Phase C expanded to capture these (ask-once-default — full-quality defaults, never a
  stub; all skippable).
- Why: the YouTube System (v0.6.2) now reads goals + competitors from the Brain instead of re-asking at setup.
  The agent fills the Brain once; nothing downstream re-asks.

## [0.30.0] — 2026-06-13

### YouTube System (Plugin 3) → v0.6.2 — setup stops re-asking what the Brain already knows (live-test feedback)
- **Setup now asks exactly ONE question — their channel.** Goals, competitors, posting cadence, niche,
  neighbourhoods, voice, and offer are all read live from the AI Brain (the #1 rule: one Brain, never two).
  The agent spent hours building their Brain — re-asking goals/competitors in YouTube was friction.
- Removed the 12-month-goal question (read from `strategy.md`) and the competitor-channels question (read from
  the Brain; the Outlier engine finds them if absent). If something's missing from the Brain, setup points the
  agent to add it *there* — never re-asking in YouTube.
- (Companion Brain change — capture YouTube/business/life/personal goals + admired competitors in the Brain —
  handed to the Brain plugin as its own task.)

## [0.29.0] — 2026-06-13

### YouTube System (Plugin 3) → v0.6.1 — setup stops asking confusing questions (live-test feedback)
- **Removed the "which tools should I set up?" question.** A non-technical realtor can't answer "Calendar vs
  Gmail vs Drive," so it stalled them. Drive (already connected — the Brain's home) is all the system needs to
  run; Calendar + Gmail now connect only at point-of-need (when the agent actually wants filming days on their
  calendar or the optional weekly email).
- **Softened the YouTube-goal question** to default-if-unsure ("steady growth + a few leads a month") instead
  of pressing for a number — the real business goal is read from the Brain's `strategy.md` for the math anyway.
- **New setup golden rule:** never ask a question the agent can't easily answer — default smartly, say what
  you picked, and move on (mirrors the Brain's ask-once-default principle).

## [0.28.0] — 2026-06-13

### YouTube System (Plugin 3) → v0.6.0 — the Game Plan becomes the channel's operating strategy
- **Everything now aligns to the Game Plan** (new house rules §9). Video topics, market research, scripts,
  SEO, competitor scans, the calendar, and coaching all read the agent's active pillars + goal + cadence and
  advance THAT plan — no more random one-off advice. Off-plan ideas are allowed, but tied back to a pillar.
- **The Game Plan writes its anchors into the YouTube Layer** (3 pillars + playlists, goal, cadence) so every
  skill reads them cheaply; the full Doc holds the title backlog + 90-day calendar, opened on demand.
- Wired explicitly into **Ideation** (draws the batch from the pillars + planned title backlog) and
  **Research** (scoped to advance the pillars + goal).
- **QA fixes:** corrected a broken reference path in `youtube-gameplan` (drive-structure.md now points to
  youtube-setup's copy); tightened the "no guarantees" citations to compliance §2 + honesty §5. Full sweep
  green — all 16 skills' frontmatter, every `${CLAUDE_PLUGIN_ROOT}` + skill-relative path, and house-rules
  numbering verified.

## [0.27.0] — 2026-06-13

### Brain (Plugin 1) -> v0.18.0 — setup made far less overwhelming (from live-test feedback)
- **New `shared/ask-once-default.md`** — the Brain-wide setup principle: ask once; use a real answer
  verbatim; the moment the agent is unsure, generate a full-quality default from their Brain; honour
  "use defaults" / "skip" / "do this later" at any point. **Quality guardrail (non-negotiable): a
  default is never a thin stub — accepting defaults yields the same detailed, strategic file as
  answering every question.** Wired into every phase skill.
- **Operations (Phase 6)** — opens with a one-shot accept (proven booking rules + follow-up cadence),
  pre-fills the email signature from `profile.md`, every field default-able. ~3 min instead of ~15.
- **Vendors** — genuinely optional ("add as you build your network"); never homework; friendly
  placeholder on skip.
- **Compliance (Phase 7)** — reassurance + auto-defaults: auto-infers the regulator from market,
  pre-accepts the standard claims-to-avoid list, skip-and-flag a missing disclaimer / license #
  (never invents one). ~2 min.
- **Restructured first-run** — **Express is the recommended default**; **Operations + Vendors pulled
  OUT of first-run**, run just before "Set up my AI Admin." Full = Phases 1-5 + 7. Cuts first
  onboarding from ~75 min toward ~30.

## [0.26.0] — 2026-06-13

### YouTube System (Plugin 3) → v0.5.0 — NEW: the YouTube Game Plan (the flagship first deliverable)
- **New skill `youtube-gameplan`**, built on **Mike Sherrard's frameworks**: an honest channel audit, 3
  high-intent content pillars, ~15–20 EXACT search-optimized titles per pillar (annotated by search intent +
  lead type, ordered broad→niche), the four strategic shifts, the 4-part video structure, a 90-day calendar,
  and a success-metrics block — assembled into one premium Google Doc.
- **Scales to any experience level** — full audit for a 100-video veteran, lighter for ~10, minimal for 1–2,
  a pure launch plan for a brand-new/empty channel. Channel data is mostly public (URL research); deeper
  watch-time/CTR via an optional screenshot or CSV export. No "connect YouTube" step required.
- **Goal-math (the confidence engine)** — reverse-engineers the agent's business goal (from the Brain's
  `strategy.md`) into the content plan: stated assumptions, framed as a credible path — never a guarantee.
- **Orchestrates the existing engines** (Analytics, Outliers, Research, Ideation, Script framework) rather
  than reinventing them.
- **Credibility stamp** — flagship strategy docs (Game Plan + Market Report) now carry "Powered by Mike
  Sherrard's frameworks & strategies" (house rules §8) as a byline + footer, never inside published copy.
- **Setup now delivers the Game Plan as the first deliverable** (replacing "first ranked ideas") and captures
  a concrete 12-month YouTube target; the business goal is read live from the Brain.

## [0.25.0] — 2026-06-13

### Lead Capture System (Plugin 5) → v0.2.0 — brand-led magnets, not just single-audience
- The magnet/funnel no longer defaults to a buyer-only, single-avatar guide. Phase 1 now offers two shapes
  and recommends by Brain: **(A) Brand-led (general)** — one comprehensive on-brand guide for the agent's
  whole audience (buyers AND sellers) + full offer suite, the new default for generalist/brand-led agents;
  **(B) Audience-specific (niche)** — the focused buyer/seller guide, for agents with one dominant niche. The
  funnel matches the magnet's scope (a brand-led page speaks to the personal brand + broad audience).
  "General" stays comprehensive and valuable, never vague. (From live-test feedback: lead capture should
  reflect the realtor's personal brand + all their offers, not just buyers.)

## [0.24.0] — 2026-06-13

### Lead Capture System (Plugin 5) → v0.1.0 — NEW: the conversion layer
- **New plugin `realtor-lead-capture`.** Turns the agent's offer into captured leads. Two skills, run in order:
  - **`leadcapture-magnet`** — builds a lead magnet (a buyer or seller guide) straight from the offer in the
    Brain: the full, genuinely useful guide content + a paste-ready claude.ai/design prompt.
  - **`leadcapture-funnel`** — reads the finished magnet, then maps the opt-in page section by section
    (Hero → About the agent → The offer → The opt-in) with full converting copy + a design prompt.
- **Alignment is enforced:** the funnel reads the magnet so the page's promise = the guide's payoff, end to end.
- **Copywriting KB** (`shared/copywriting-kb.md`) trains both skills to write genuinely good, on-brand,
  high-converting copy (clear > clever, benefit > feature, specific > vague, "you" > "I", proof everywhere).
- **Boundaries:** maps copy + structure only — never designs or hosts (claude.ai/design + the agent's host do
  that); **lead capture only — no call booking** (deliberate, avoids calendar integration); reads the Brain,
  never re-asks. Outputs save as clean Google Docs in `[Agent] — Lead Capture System/` (text/plain → Doc).
- Closes the loop: P3/P4 drive traffic → **P5 captures the lead.**

## [0.23.0] — 2026-06-13

### YouTube System (Plugin 3) → v0.4.0 — structured Google Doc output + organized Drive
- **`shared/doc-format.md`** (new) — the document house style + a fill-in skeleton for every saved doc
  (Script, SEO Package, Lead Magnet Map, Repurposing Pack). Cowork's Drive connector only converts
  `text/plain` into a clean Google Doc (`.docx`/HTML/Markdown land as broken or raw files — verified), so
  every doc is built as well-structured plain text: title + meta line, CAPS section bands with em-dash
  dividers, generous spacing, cues on their own lines. Clean and scannable, never a wall.
- **Organized Drive output** — `youtube-setup/references/drive-structure.md` now defines an exact naming
  convention (`{Agent} — YouTube System / Videos / YYYY-MM · Month / YYYY-MM-DD · Title /`), nests the
  workspace inside the agent's master Drive, and a "resolve, never duplicate" save rule (find-or-create the
  right folder; never scatter copies). Wired into setup + make-video.
- Formatting + save rules wired into house-rules §3 and the script / SEO / leads / repurpose skills.
- (Mirrors the Short-Form System output standard from 0.21.0 and the Brain's doc standard from 0.22.0.)

## [0.22.0] — 2026-06-13

### Brain (Plugin 1) → v0.17.0 — deliverables save as clean Google Docs + housekeeping
- **`shared/doc-formatting.md`** — the Brain's document standard. Cowork's Drive connector only converts
  `text/plain` into a clean Google Doc (`.docx`/HTML land as broken files), so deliverables (offer
  guidebook, market updates, listing kits, welcome doc) are built as well-structured plain text and saved
  as clean Google Docs in the agent's Drive. Wired into the producer + content skills.
- **"Jarvis" → "AI Admin"** naming aligned across the Brain skills (matches Plugin 2).
- Trigger/boundary + formatting tidy-ups across brain-setup, brand-persona, offer-usp, market-update,
  listing-content-kit, neighbourhood-tour, and yt-launch-system (net simplification).
- Added `docs/SYSTEM-MAP.md` — full inventory of all 4 plugins / 39 skills.

## [0.21.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.7.0 — organized Drive output + great formatting
- **`shared/output-standard.md`** — every document the system makes now saves to the agent's Google Drive,
  in the right folder, with a consistent name, formatted to look genuinely good:
  - **Folder structure:** `[Agent Name] — Short-Form System/Content/[YYYY-MM · Month]/` for content +
    `/Performance/` for reviews (own library, parallel to the YouTube System folder).
  - **Naming convention:** content = `[YYYY-MM-DD] · [Format] · [Topic]`; reviews =
    `[YYYY-MM-DD–DD] · Performance Review`. ISO dates sort themselves; month folders made on demand.
  - **Formatting (the fix for the ugly docs):** Cowork's Drive connector only converts `text/plain`→Google
    Doc (`.docx`/HTML don't convert), so docs are built as **well-structured plain text** — title + meta
    line, ALL-CAPS headers with em-dash dividers, generous spacing, bullets, cues on their own lines.
    Clean and scannable, never a wall of text. (Mirrors the proven YouTube-System approach.)
- Wired the save step into green screen, talking head, carousel, and the analytics 2-week review; setup
  now provisions the Drive folder; house-rules §9 makes "save organized + well-formatted" universal.

### Brain (Plugin 1) → v0.16.0
- `brain.md` template now indexes `identity/publishing.md` (companion to the 0.19.0 `memory/performance.md`).

## [0.20.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.6.0 — wired to the real Metricool tools
- With Metricool connected, hardened the publish + analytics skills to call the **actual Metricool MCP
  tools by name** (referenced bare, since the per-connection server-id prefix varies): `getBrandSettings`,
  `getBestTimeToPostByNetwork`, `createScheduledPost`, `getScheduledPosts`, `updateScheduledPost`,
  `getAnalyticsAvailableMetrics`, `getAnalyticsDataByMetrics`.
- **Video confirmed:** `createScheduledPost.info.media` accepts public URLs to image *or video* files, so
  Reels/TikToks/Shorts schedule fully hands-off (Path A). Per-network rules encoded (Reels need video,
  IG/TikTok need media, YouTube needs title + madeForKids, X ≤280, Bluesky ≤300). Hybrid path kept only
  for videos not at a shareable URL.
- Analytics flow set to Metricool's real shape: `getBrandSettings` → `getAnalyticsAvailableMetrics`
  (discover metric IDs, incl. ads) → `getAnalyticsDataByMetrics` (brandId + date range + metric IDs).
- Brain: `identity/publishing.md` now scaffolded in the template + listed in `brain.md` (companion to the
  `memory/performance.md` added in 0.19.0).

## [0.19.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.5.0 — Metricool scheduling + analytics live
With the agent's **Metricool MCP connected**, the system now does the full publish + measure loop in
plain language:
- **`shortform-publish`** — "schedule this for tomorrow at 10am," "post these at my best times,"
  "post this to Instagram and TikTok." Confirms, schedules through the connected tool (Metricool /
  GoHighLevel / Buffer), uses best-time slots when no time is given, handles video (full-attach or
  hybrid), logs to the Brain. Never auto-posts without a clear go-ahead.
- **`shortform-analytics`** (+ `references/metrics-guide.md`) — the data brain. Handles any "analyze my
  last 10 posts / analyze my ads / how did my reels do / what's my data" by pulling real numbers from the
  connected tool and **interpreting them like a coach** (what's working, the weak link + why, the fix) —
  never a number dump. Also runs the **2-week performance review** and writes it to
  `memory/performance.md`, which the content workflows read so each round leans on what worked (the
  improvement loop is now closed).
- Both connector-agnostic (Metricool default, GoHighLevel for agents who have it) and screenshot-fallback
  for analytics if no connector.

### Brain (Plugin 1) → v0.15.0
- Added **`memory/performance.md`** to the Brain (template + `brain.md` index + write-back law) — the home
  for content performance, written by the 2-week review and read before planning new content.

## [0.18.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.4.0 — publishing wired
- **`shared/publishing-guide.md`** — the system can now schedule/post once the agent connects a tool,
  connector-agnostic: **Metricool** (default), **GoHighLevel** (Social Planner, for agents who have it),
  **Buffer** (fallback), or **manual**. Golden rule baked in: **never post without showing the post and
  getting explicit approval.** Handles best-time scheduling, the free-plan 20-post guardrail, and the
  media/video fallback (Path A full-attach vs Path B hybrid: schedule caption+slot, agent drops the video).
- Wired into green screen, talking head, and carousel (their "offer to schedule" step) + setup's connect step.
- **Metricool MCP endpoint verified** (`https://ai.metricool.com/mcp`): live, standard OAuth 2.1 with
  Dynamic Client Registration + PKCE (scopes `mcp:read`/`mcp:write`) → one-click sign-in in Cowork, no
  tokens. Can view brands, pull analytics, and create/schedule posts; works on the free plan (20-post
  cap). Only open item: confirm video-on-schedule live (both paths are handled either way). Details +
  the ~10-min live check in `docs/shortform-publishing-layer.md`.

## [0.17.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.3.0 — the advisor
- **`shared/advisor-playbook.md`** + house-rules #8: the system now acts as the agent's **short-form
  expert** when they're unsure. Realtors often say *"I don't know,"* *"what do you think?"*, *"you pick,"*
  or *"is this any good?"* — the skills now **lead with a confident, data-grounded recommendation** (never
  bounce the question back, never dump a menu on an overwhelmed agent), default to action, and give honest
  expert feedback with a spine. Includes the real short-form-for-realtors point of view (hook is 90%,
  local+timely beats generic, consistency > perfection, 80/20 reach, don't sell every post) and decision
  heuristics for the common "I'm not sure" moments.
- Wired into every workflow at its decision point (setup, green screen, talking head, carousel) so the
  advisor move fires exactly where agents hesitate.

## [0.16.0] — 2026-06-13

### Short-Form System (Plugin 4) → v0.2.0 — the three workflows + onboarding
- **`shortform-talkinghead`** — batched value videos: an 80/20 topic list (80% broad reach, 20% niche)
  → scripts with 15/30/45-second cuts + a teleprompter version + a bullet version → per-platform
  packaging. (Absorbs the doc's "Script Builder.")
- **`shortform-carousel`** — no-film value posts, **spec only**: cover hook + 6–9 slides of copy +
  design direction in words + Instagram/Facebook caption. The agent builds slides in claude.ai/design;
  nothing is rendered here.
- **`shortform-setup`** — one-time onboarding mirroring the YouTube setup pattern: reads the Brain,
  re-asks nothing, captures only short-form specifics (platforms, cadence, lead magnets if missing,
  posting method), explains the system plainly, and gets the agent to their first post.
- **`shared/house-rules.md`** — the plugin's standard, applied by every skill: **talk to the agent
  plain and warm, never technical** (realtors aren't developers and overwhelm fast); read the Brain
  first / never re-ask; map-don't-design; stay compliant; earn the "why not just use ChatGPT" test.
- **Optimizer hardened** (from the QA sweep): now also outputs **cover/thumbnail text + on-screen text**
  for video formats, and carries the **full CTA map** (DM "BUYER"/"SELLER"/"RELOCATION", market report,
  neighbourhood guide) routed to real lead magnets. All workflows read the full Brain (added `offer.md`
  + `voice-samples.md`).
- **Posting is bring-your-own-platform:** GoHighLevel (its official MCP Social Planner) for agents who
  already use it, Metricool as the easy default, Buffer as a fallback, or manual — never forced onto a
  new platform. (Publish + 2-week analytics loop wired in a later release; see
  `docs/shortform-publishing-layer.md`.)

### Brain (Plugin 1) → v0.14.0
- **Lead magnets are now first-class Brain data.** Added a "Lead magnets" section to the `offer.md`
  template + a capture step (Q7) in `realtor-offer-usp` (interview guide + USP knowledge template), so
  the agent's free guides/checklists (with DM keywords) are stored at setup. This is what content CTAs
  point to — and it closes the "don't make the agent re-answer" gap the QA sweep found.
- **Removed `realtor-article-greenscreen`** — fully superseded by `shortform-greenscreen` (its only
  unique value was PNG green-screen backgrounds, which are dropped under the map-don't-design rule).
  Brain plugin is now 16 skills.

## [0.15.0] — 2026-06-13

### Added
- **Realtor Short-Form System joins the shelf as Plugin 4** (`plugins/realtor-shortform-system/`,
  v0.1.0) — the first slice of the routine-based short-form OS (sibling to the YouTube System).
  Ships two skills:
  - `shortform-greenscreen` — the **Daily Green Screen** workflow: finds the single most timely local
    article and delivers a word-for-word hook + 4–6 talking points (deliberately NOT a script, for
    natural reactive delivery) + on-screen text + per-platform captions. Reactive/daily by design;
    never batched. **Text only — no PNG backgrounds or designs** (agent holds the article on their
    phone or builds a background in claude.ai/design).
  - `shortform-optimizer` — the **shared Platform Optimizer** every short-form workflow calls: one
    post → Instagram+Facebook (caption + hashtags), TikTok (one-line caption, no line breaks),
    YouTube Shorts (title + description + tags). Canonical platform rules in
    `references/platform-rules.md`; reads voice/market/compliance from the Brain.
- Design principle locked across the system: **map, don't design** — short-form skills output copy,
  frameworks, and direction as text; claude.ai/design renders. Consequence: `realtor-article-greenscreen`
  (Plugin 1) is superseded by `shortform-greenscreen` and slated for retirement (its only unique value
  was PNG generation, now dropped).
- Architecture: the agent thinks in **formats**; Claude silently maintains the **4-3-2-1 funnel
  balance** and **80/20 reach split**. Full build spec in `docs/shortform-os-build.md`; publish +
  analytics layer (Metricool MCP) in `docs/shortform-publishing-layer.md`.

### Notes
- Plugin 1 (the Brain) is unchanged in this release (no version bump); the short-form skills live in
  Plugin 4, not the Brain.
- Coming next: talking-head + carousel (spec-only) workflows, the weekly menu/balance tracker, and
  `shortform-analytics` (the 2-week performance loop). Pending: the 30-min Metricool Cowork connector
  test before publish wiring.

## [0.14.0] — 2026-06-12

### Added
- **Realtor YouTube System joins the shelf as Plugin 3** (`plugins/realtor-youtube-system/`, v0.3.0,
  16 skills) — vendored from its standalone build; display name numbered; marketplace + README
  updated. Anyone who previously installed it as a Local-uploads zip should REMOVE that copy and
  install Plugin 3 from this marketplace instead (duplicate skill names would collide), gaining
  auto-updates. Plugin 4 (Short-Form OS) joins this same shelf when built.

## [0.13.1] — 2026-06-12

### Changed
- **Repo renamed: `teamsherrard/realtor-ai-brain` → `teamsherrard/claude-agent-os`** — the one
  marketplace link clients paste. GitHub redirects the old slug, so existing installs keep syncing;
  all docs and plugin homepages now point at the new name. (Brand note: the marketed product name is
  "Agent OS" — "built on Claude" goes in copy, not in the product name.)

## [0.13.0] — 2026-06-12

**Jarvis is now its own plugin** — the marketplace becomes the numbered cohort journey.

### Changed
- **`realtor-jarvis` split out of the Brain plugin into Plugin 2** (`plugins/realtor-jarvis/`,
  starts at v0.1.0). Product decision: one system = one plugin = one training module — the agent
  installs Plugin 1 (Brain), completes it, then installs Plugin 2 (AI Admin) when they reach that
  module. Same single marketplace link; the marketplace now lists plugins numbered in journey order
  (YouTube System and Short-Form OS join the same shelf as Plugins 3–4 when shipped).
- Jarvis's missing-Brain message now routes to installing Plugin 1 + "Set up my Brain" (it still
  never interviews). Brain plugin description, README, START-HERE, Brain Contract, and blueprint
  updated to the two-plugin journey.
- `scripts/build-plugin-zip.sh` now builds a zip per plugin on the marketplace.

## [0.12.0] — 2026-06-12

Public release prep — first version pushed to GitHub.

### Added
- **LICENSE.md** — proprietary, source-visible: public only to enable Cowork marketplace install;
  licensed clients may use it for their own business; no redistribution/resale/derivatives. The
  agent's Brain data is theirs and not covered by the license.

### Changed
- **Docs swept to the Drive-era reality:** Setup's "Brain you are building" map now shows the permanent
  Drive home, all 13 identity files, and the three laws (incl. push-after-write); brain-spec's old
  "fixed local home" decision marked superseded (BRAIN-CONTRACT is the authority); migrate uses sync
  language; README/START-HERE state the Brain lives in the agent's Google Drive and show Express/Full
  timings; maintainer contract pointer now targets BRAIN-CONTRACT.md.
- Removed the v0.1-era `test/sample-brain` fixture (stale schema; git history keeps it).

## [0.11.2] — 2026-06-12

Everything the agent produces now persists to their Google Drive — the desktop is never the destination.

### Fixed
- **`exports/` now syncs to Drive.** Deliverables (offer guidebook, market-update packages, listing
  kits, the welcome doc) were saved locally and skipped by sync — wiped with the sandbox unless the
  agent downloaded them in-session. `realtor-brain-sync` PUSH now includes `exports/` as the agent's
  **deliverables archive** (`Realtor AI Brain → exports` in their Drive); PULL skips it by default
  (no skill reads exports — agents open deliverables directly in Drive). Sync confirms where the
  document landed. Contract + blueprint + exports README updated; the principle is now a contract
  rule: *brain data, memory, and deliverables all sync — the local sandbox is always disposable.*

## [0.11.1] — 2026-06-12

The Brain is the hub — ecosystem boundaries made explicit (decision: do NOT slim the Brain plugin).

### Changed
- **Brain Contract** now defines the ecosystem: the Brain is the realtor's FIRST system; the Realtor
  YouTube System (separate plugin) reads the Brain at setup + per-video and should write published
  videos back to `memory/content-log.md`; Jarvis ships in-plugin; Video Editor + Short-Form System
  follow the same read/write pattern.
- **`realtor-yt-launch-system` defers to the dedicated YouTube System when installed** — removed the
  colliding "realtor YouTube system" trigger phrase; it remains the built-in quick launcher for agents
  without the full system.
- **Setup hand-off** now points to the ecosystem: after the Brain is built, it suggests "set up my
  YouTube system" (and notes the Brain powers every other Team Sherrard system).

## [0.11.0] — 2026-06-12

Critical fixes from the full pre-GitHub sweep — and **Jarvis (the AI Admin) ships in the plugin**.

### Added
- **`realtor-jarvis` skill** (The Agent Leverage OS, v1: Scheduling · Inbox · Client Memory):
  auto-booking with conflict guard + guest invites + automatic video links (Zoom → standing link →
  Google Meet — never asks), client self-booking with graceful degradation (Cal.com → own booking
  link → proposed times), rescheduling, route optimizer, email drafts in the agent's voice
  (draft-only by design — the approval model), thread summary, total client recall, silent
  auto-logging, and task/promise follow-ups. Obeys the **Mike Test** speed rules: one message in →
  one one-line confirmation with embedded proof, no clarifying questions in the common case.
- **"Set up my Jarvis" one-time flow**: connector checks (incl. Zoom create-capability probe),
  permission smoothing ("Always allow"), Gmail label taxonomy, dashboard artifact, and two
  scheduled automations — **Morning Briefing** (7am; delivered as the task's own output since the
  Gmail connector cannot send) and **Daily Inbox Sweep** (weekdays 8:30am: triage + auto-label +
  waiting-on + declutter in one pass). Runtime ids live in the brain's `config.md`.
- Jarvis follows the Drive-sync law: pull-if-missing at Step 0 (and ALWAYS in scheduled tasks),
  push after every memory write. `clients.md` treated as PII (stays in the agent's brain + their
  own Drive only).
- Brain template: `config.md` gains Zoom/Cal.com connector rows + a Jarvis runtime section;
  `realtor-operations` now captures a standing virtual-meeting link; Setup Step 6 lists Zoom
  (recommended) and Cal.com (optional).
- Docs: `jarvis-v2-parking.md` (meeting notes, transaction coordinator, document/file systems);
  `product-framing.md` (the Mike Test acceptance gate + 5 outcomes) moved into `docs/`; the
  drifted `docs/jarvis-retrofit/` staging folder is gone — the skill is the single source of truth.

### Fixed
- **Writes now survive the session (durability).** Every skill that writes to the Brain — all 7
  producers and all 6 content skills — now pushes to Drive via `realtor-brain-sync` immediately after
  writing, and the write law in `brain.md` carries the rule ("an unsynced write is a lost write").
  Previously only Setup's finalize step pushed, so standalone runs (e.g. "update my offer", a content
  skill's log write) were silently lost when Cowork wiped the sandbox.
- **Setup Step 0 now pulls from Drive before deciding fresh vs returning.** Checking only the local
  folder would re-onboard a returning agent (local is always empty at session start) and overwrite
  their real Brain in Drive with a fresh empty one. Rebuild-from-scratch now also requires explicit
  confirmation.
- **Trigger collisions resolved** — removed "set up my brain" from `realtor-brand-persona` (belongs to
  Setup); `realtor-brain-migrate` no longer claims "update my brain" (now "upgrade my brain", with an
  explicit do-not-trigger note for content edits like "update my offer/brand").

## [0.10.1] — 2026-06-10

### Fixed
- **Cowork zip-upload validation failure.** Diffed against a known-valid plugin zip: the experimental
  `"prompt"`-type hooks file and extra manifest fields (`skills`, `hooks`, `repository`) were the
  difference. `plugin.json` reduced to the proven minimal shape (skills auto-discover); hooks excluded
  from the zip build; `hooks/hooks.json` rewritten to the documented `command` type (ships via the
  GitHub install, pending live verification).

## [0.10.0] — 2026-06-09

The Brain now lives in Google Drive, so it persists across Cowork sessions, projects, and devices.

### Changed (foundational)
- **The Brain's permanent home is the realtor's Google Drive** (`Realtor AI Brain` folder), not the
  local sandbox. Cowork's local storage is wiped between sessions — so the brain syncs from Drive at
  session start and pushes back after changes. Local `~/realtor-brain/` is now just a working copy.
- **`realtor-brain-backup` → `realtor-brain-sync`** — two-way Drive⇄local sync (pull at start, push
  after writes, restore on a new machine). Supersedes one-way backup.
- **Google Drive is now REQUIRED** in Setup (was optional); Setup pushes the brain to Drive at the end.
- **SessionStart + Stop hooks** (`hooks/hooks.json`) — pull the brain from Drive at session start so
  EVERY session (even plain chat) is brain-aware, and push changes back on stop. ⚠️ *Hook firing in
  Cowork must be verified live — it's the one piece we couldn't test.*

### Added
- **`docs/BRAIN-CONTRACT.md`** (#6) — how any system (Video Editor, Jarvis, future agents) reads/writes the brain.
- **Privacy posture** (#10) — the brain (incl. client PII) is the agent's private data, lives only in their Drive; the agency never holds it.

## [0.9.0] — 2026-06-09

Bug fixes from the full quality sweep.

### Fixed
- **Compliance now enforced** — all 6 content skills read `identity/compliance.md` and append the
  required brokerage disclaimer + license # before publishing, and avoid the "claims to avoid" list.
  (Previously only `brain.md` mentioned it, which skills didn't reliably act on — content could ship
  with no disclaimer.)
- **Placeholder guard** — content skills now detect `[bracketed]` template text from a half-built brain
  and treat that field as missing (ask or skip) instead of emitting literal brackets in finished content.

## [0.8.0] — 2026-06-09

Phase 5 (Content Engine) simplified for week-one beginners.

### Changed
- **Phase 5 now asks only 2 things** (which platforms + how much they can post) and **generates the rest
  only when the agent is unsure** — pillars, signature series, and video default are drafted from the
  Brain and confirmed, never dumped over a real answer. ~3–5 min (was ~10).
- **Trimmed `content-engine.md`** to durable items only — pillars, platforms, cadence, series, video
  default. **Hashtags and hook styles are no longer stored** (the content skills generate those per
  piece; CTAs already live in `voice.md`).
- Added a system-wide setup principle: **"ask first, generate only when they're stuck"** — don't
  overwrite a real answer with a guess.

## [0.7.0] — 2026-06-09

Phase 3 re-scoped: brand **direction**, not design.

### Changed
- **Phase 3 is now `realtor-brand-direction`** (was `realtor-brand-guide`). It captures the brand
  *direction* only — colours, vibe, font + logo direction, tagline → `identity/brand-visual.md`. It no
  longer designs anything (no logo, no HTML brand guide, no Canva brief, no `assets/` generation). The
  agent takes the direction into **Claude Design (claude.ai/design)** to build the actual visuals.
- Removed the heavy design references (color-strategy, font-pairings, skylines, canva-handoff, etc.) —
  the old full-design version stays in git history.
- Updated conductor, brain template, `brain.md` index, and docs to match. Still 17 skills.

## [0.6.0] — 2026-06-09

Self-maintenance layer — the brain can now audit, back up, and upgrade itself.

### Added
- **`realtor-brain-health`** — audits brain completeness, scores it, recommends the highest-impact next add.
- **`realtor-brain-backup`** — backs up / restores the brain to the agent's Google Drive (durability +
  multi-device); updates "Last backup" in `config.md`.
- **`realtor-brain-migrate`** — the schema safety net: upgrades older brains to the current structure
  when we change it, without losing data. Includes a maintainer MIGRATIONS LOG process.
- **Brain schema version** + **Last backup** fields in `config.md` (the migration/durability anchors).

Plugin now bundles **17 skills**. The brain system is functionally complete — all 10 domains capturable,
read/write across all skills, and self-maintaining. Remaining: wire the Jarvis skill (needs its source)
and push to a public GitHub marketplace.

## [0.5.0] — 2026-06-09

The full brain — all 10 identity domains are now capturable. Phases 4–7 added.

### Added
- **Phase 4 — `realtor-voice-proof`**: real writing samples (authentic voice) + proof library
  (testimonials, stats, case studies) → `identity/voice-samples.md`, `proof.md`.
- **Phase 5 — `realtor-content-engine`**: pillars, cadence, platforms, hashtags, CTAs, hooks, video
  style → `identity/content-engine.md`.
- **Phase 6 — `realtor-operations`**: working hours, email signature, booking rules, follow-up cadence,
  vendor network, goals → `identity/operations.md`, `vendors.md`, `strategy.md` (the Jarvis foundation).
- **Phase 7 — `realtor-compliance`**: brokerage disclaimers, license display, fair-housing, claims to
  avoid → `identity/compliance.md`.
- Seven new identity template files; brain.md file-map updated.
- A **third law** in `brain.md` — **STAY COMPLIANT**: every skill reads `compliance.md` before
  publishing and appends the required disclaimer + license #. Propagates to all skills via `brain.md`.

### Changed
- **Setup conductor** now offers **Express (Phases 1–3, ~30 min)** vs **Full (Phases 1–7, ~60–75 min)**
  and runs Phases 4–7 as their real skills. Plugin now bundles **14 skills**.

## [0.4.0] — 2026-06-08

Phase 3 (Visual Brand) — the Brain now holds the agent's visual identity.

### Added
- **`realtor-brand-guide`** skill brought into the plugin and retrofitted: reads the Brain in Step 0A,
  designs the 5-colour palette + two fonts + logo + tagline, **writes `identity/brand-visual.md` and
  saves logo/headshot to `assets/`**, and renders the HTML brand guide + Canva brief to `exports/`.
  This is also the brand config the **AI Video Editor** consumes.

### Changed
- **Setup conductor** now runs Phase 3 (Brand Guide) as the real skill, replacing the lightweight
  embedded visual interview (removed `interview-visual.md`). Plugin now bundles 10 skills.

## [0.3.0] — 2026-06-08

Every skill is now Brain-native, and the producers write the Brain directly.

### Added
- **Full brain inventory** defined (10 domains: person, voice+samples, market, avatars, offer+proof,
  visual+assets, content engine, operations/vendors, strategy, compliance) with a phased-setup roadmap.
- **All 6 consumer skills** retrofitted to the Brain contract — `realtor-market-update`,
  `realtor-listing-content-kit`, `realtor-neighbourhood-tour`, `realtor-trending-articles`,
  `realtor-yt-launch-system`, `realtor-article-greenscreen`: each loads `brain.md` (Step 1) and writes
  back to `memory/` (content-log; listing-kit also writes `listings.md`). Outputs save to `exports/`.
- **Both producer skills** retrofitted — `realtor-brand-persona` now writes the four `identity/` files
  (profile, market, avatars, voice); `realtor-offer-usp` writes `identity/offer.md`. The `.docx`
  becomes a *render* in `exports/`, not the source of truth. No more "upload to a Claude Project."

### Changed
- **Setup wizard is now a thin conductor** — it runs the real Brand Persona and Offer USP skills in
  sequence (single source of truth) instead of carrying duplicate copies of their questions. Removed
  the embedded `interview-brand.md` / `interview-offer.md`.

## [0.1.0] — 2026-06-08

First working foundation.

### Added
- **Brain spec** (`docs/brain-spec.md`) — the contract: fixed `~/realtor-brain/` structure, the
  identity-vs-memory split, and the two laws (read `brain.md` first; write back to `memory/`).
- **Brain template** — the scaffold the setup wizard fills (bundled in the setup skill's references).
- **`realtor-brain-setup`** skill — the one front-door wizard: scaffolds the Brain, runs the brand +
  offer + visual interviews in order, connects Gmail/Calendar, writes `brain.md`. Resumable.
- **`realtor-market-update`** skill — retrofitted to the Brain contract as the reference pattern:
  loads the Brain (Step 1), checks the content log to avoid repeats, writes deliverables back to
  `memory/content-log.md` (Phase 7).
- **Plugin + marketplace** packaging — installable via `/plugin marketplace add` + `/plugin install`,
  auto-updating on push.
- **Test fixture** — a fully-filled sample Brain (`test/sample-brain/`).

### Not yet done
- Retrofit remaining consumer skills (listing-kit, neighbourhood-tour, local-content, yt-launch,
  greenscreen).
- Retrofit producer skills (brand-persona, offer-usp, brand-guide) to write into `identity/`.
- Fold Jarvis's memory into the Brain's `memory/`.
- New-client provisioning flow for the agency.
