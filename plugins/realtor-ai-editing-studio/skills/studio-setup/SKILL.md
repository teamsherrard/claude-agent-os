---
name: studio-setup
description: >-
  Setup for the AI Editing Studio. The first skill a real estate agent runs. Connects Riverside,
  the main path (records, edits, publishes; Cowork, the web, the desktop app; Grow plan) in two
  clicks with no key, then pulls the agent's brand from their Realtor AI Brain, writes it where
  the engine needs it, picks the caption look, registers the Video Brand Kit cards, sets the
  posting route, and gets them ready to edit with no technical setup. The optional second
  engine, Instagram's free Edits app for Mac (no per-edit fees), is set up only from the Code
  tab of the Claude desktop app on that Mac in a guided five-minute install. Stock B-roll works
  out of the box; free stock keys are OPTIONAL. Trigger on: "set up my video editor", "set up my
  video studio", "set up riverside", "connect riverside", "set up edits", "set up instagram
  edits", "connect edits", "switch my editor to edits", "get me started editing", "onboard me to
  the editor", "register my video brand kit", or any first-run request for the editor.
---

# AI Editing Studio — Setup

**Riverside is the main path** (Cowork, the web, the desktop app) and is set up first. **Instagram Edits is the optional second engine** for Mac users, set up and used only from the Code tab of the Claude desktop app on that Mac — it is included in their plan, nothing extra to buy.

Goal: get the agent editing in about five minutes, with the **fewest possible steps**. Read the Realtor AI Brain first (`~/realtor-brain/`) so you never ask for anything it already knows. One step at a time, plain language, friendly. Follow `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

**The config file `~/realtor-brain/editor/config.json` may already exist from an earlier editor setup.** If it does, you only ADD the engine block (`riverside` or `edits`) and fill anything blank — never overwrite their brand, CTA, or caption choice. Template: `config/editor-config.example.json`.

## Step 0 — Pull the Brain, then check if they're already set up (do this FIRST)

Cowork wipes the local sandbox between sessions, so the Brain (and the editor config inside it) lives in **Google Drive**. Before anything else:

1. **Pull the Brain down first** — run the `realtor-brain-sync` skill (or pull `realtor-brain/` from Drive). **If no Brain exists in Drive yet (a brand-new agent), skip the pull and continue.**
2. **Idempotent re-run check.** After the pull, look for `~/realtor-brain/editor/config.json` and its `default_engine`. **Riverside: a filled `riverside.studio_id` AND `platform_list_studios` returns that studio = already set up. Edits: `edits.bridge_installed: true` AND, in the Code tab, `/usr/bin/python3 -m insta_edits doctor` all ✓ = already set up (in Cowork the block alone counts: Edits is used from the Code tab).** Say warmly, naming what is connected: *"Good news — you're already set up and connected to Riverside. Want me to change anything, or shall we edit?"* Do **not** re-run the questionnaire and **never** overwrite a good config. If they name ONE thing to change, touch **only that section** and save.
3. Only if there's **no** engine block (or the engine's health check returns a real error) do you run the full setup below. "Switch my editor to Edits/Riverside" = run Step ½ and Step 1 for the new engine only; everything else stays.

## Step ½ — The engine (Riverside is the main path)

Two engines, same editor, same brand, same craft. **Riverside is the main path**: it works from Cowork, the web and the desktop app, it records, edits and publishes, and it connects in two clicks. **Instagram Edits is the optional second engine**: free, runs in Instagram's Edits app on the agent's Mac, and is driven only from the Code tab of the Claude desktop app on that Mac (the same app, the same plan, nothing extra to buy) after a guided five-minute install. Decide from where they are:

- **In Cowork, on the web, on an iPad, on Windows — anywhere but the Code tab on a Mac:** set up **Riverside** (Step 1A) without asking. Once it is connected, mention Edits ONCE, in one line: *"There's also a free option, Instagram's Edits app, for Mac users who use the Code tab of this app. Whenever you want it, open the Code tab on your Mac and say 'set up Instagram Edits' — I'll walk you through it there."* `default_engine: "riverside"`.
- **In the Code tab on a Mac:** ask the one question, recommendation first: *"Two ways to edit: your Riverside account (recommended — works everywhere, records and publishes too) or Instagram's free Edits app on this Mac. Riverside, Edits, or both?"* Riverside → Step 1A. Edits → Step 1B. Both → 1A then 1B; `default_engine` stays `"riverside"` unless they say Edits should own a plain "edit my video".
- **Someone in Cowork asks for Edits** ("set up edits", "edit this in Edits"): never try — Edits can only be reached from the Code tab on the Mac it runs on. Say: *"Edits runs from the Code tab of this same Claude app on your Mac — it's included in your plan, nothing to buy. Open the Code tab (left sidebar → Code), pick any folder when it asks, and say 'set up Instagram Edits'. I'll walk you through it there in about five minutes. Here, I'll edit in Riverside."* If Riverside isn't set up either, set it up now.

Write `default_engine: "riverside"` or `"edits"`. Saying an engine's name in any later request always wins over the config.

## Step 1 — Connect the engine (the only required connection)

### Step 1A — Riverside (the main path)

Riverside records, edits, and publishes, and the connection is two clicks. Walk them through it simply, one step a message:

1. In Claude: **Customize → Connectors** (Settings → Connectors on older builds) → find **Riverside** → **Connect**. Works the same in Cowork, on the web and in the desktop app.
2. **Enable it for the mode you'll edit in** — the desktop app's Cowork / Code / Chat toggle. Make sure the connector is on there, not just in chat.
3. A browser window opens → they sign in to their own Riverside account and click **Allow**. Done — no API key.
4. Permissions: leave anything that **publishes** on **"needs approval"** (so nothing ever posts without them saying yes). Reads and edits can be "always allow."

If they don't have a Riverside account yet: the Studio needs the **Grow plan or higher** (the Riverside connection to Claude is not available on Free or Pro; about $34 a month billed annually). The recording side is the easiest way to get video in (record straight into it — no uploads).

**If you keep B-roll or your Brain in Google Drive, add the Google Drive connector too** (same place, same mode). In Cowork it is not optional: the sandbox is wiped between sessions, and Drive is the only place your settings, checkpoint logs, and library index survive (the persistence rule in `house-rules.md`). Say so plainly.

Confirm the connection works: `platform_list_studios`. **Read the result the right way:**
- **A studio comes back** (even one named "…'s Studio" with nothing in it) = **connected.** Say "You're connected!" and keep going. Record `riverside.studio_id`, `studio_name`, `production_id` (from `platform_list_productions`) in the config.
- It's only a **real** failure on an actual error — "not connected," an auth error, or "tool not found." Re-check: (1) the Cowork-vs-Code mode toggle, (2) that Riverside is switched on for the exact mode they're in.

### If they can't connect or find a video — plain-language fixes

- **"Is Riverside switched on in the mode you're in — not just the other one?"** The #1 cause.
- **"Is the video actually in your Riverside project?"** This engine doesn't import from links. They upload it once in the Riverside dashboard (drag onto the project page) or record straight into Riverside. Big 4K files are fine there.
- **"Has it finished uploading?"** A recording still marked uploading has no transcript yet — give it a few minutes.

**Tip worth giving them now:** *"The easiest workflow is to record straight into Riverside — then there's nothing to upload and I can start the moment you stop recording."*

### Step 1B — Instagram Edits (the optional second engine; the Code tab on a Mac only)

Run this ONLY in the Code tab (or the terminal) of the Claude desktop app on the agent's Mac. Anywhere else, give the Code-tab line from Step ½ and stop. Everything is free, it takes about five minutes, and only one step needs their hands. Needs an Apple silicon Mac on macOS 15.1 or newer. Open with one line: *"Five small steps; I do four of them. You install Edits and paste one code — that's it."*

1. **Install Edits for Mac** (their hands): *"Download Edits from edits.com/desktop — a direct download, not the App Store — open it, sign in with your Instagram account, and leave it open."* Then: *"In Edits, open Settings, then Automation, and switch on 'Enable Automation Server'. A box called Access token appears, with a Copy button. Leave that window open."* Add: *"Keep Edits open whenever we edit; it's the editor."*
2. **The bridge** (you do this; it lets Claude see all 274 editing tools, where connecting Edits directly leaves 32): run `pip3 install --user insta-edits`. If the Mac asks to install the "command line developer tools", tell them to click Install and wait, then run it again.
3. **The access token** (their hands only). Open a terminal tab for them with `/usr/bin/python3 -m insta_edits set-token` typed and waiting. Then, step by step: *"1. In Edits' Automation settings, click Copy next to Access token. 2. Click once inside the black terminal window I opened. 3. Press Cmd-V once, then Return. Nothing appears as you paste — that's on purpose, it's a secret."* The token is like a password: never ask for it in chat and never let them paste it in chat; if it lands in chat anyway, have them click Regenerate in Edits and paste the new one in the terminal.
4. **Connect and check** (you do this): `claude mcp add --scope user --transport stdio edits -- /usr/bin/python3 -m insta_edits serve`, then `/usr/bin/python3 -m insta_edits doctor`. All ✓ = connected: say *"You're connected to Edits!"* A ✗ on Sign-in = the token was pasted twice or regenerated: run set-token again. A ✗ on Automation server = Edits is closed or the switch is off. The `mcp__edits__*` tools appear in the NEXT Code session; the scripts under `${CLAUDE_PLUGIN_ROOT}/scripts/edits/` work right away.
5. **Footage folder** (you do this): Edits only reads files under `~/Movies`. Create `~/Movies/edits-footage` and say: *"Drop any video you want edited in here (or give me a Drive link and I'll fetch it)."* Record `edits.footage_dir`, `exports_dir` (`~/Movies/edits-exports`), `cards_dir` (`~/Movies/edits-cards`), `bridge_installed: true`.

Then go on to Step 2 (or back to Step 1A if they chose both). Edits never posts: they share from Edits' share sheet, or the Short-Form System's posting tool takes the export.

## Step 2 — Brand (pull it, don't ask)

Read `identity/brand-visual.md` (and `identity/voice.md`, `identity/compliance.md`) from the Brain. Build/confirm the editor's brand and write it into the **`"brand"` block of `~/realtor-brain/editor/config.json`** (`${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md` — no separate `brand.json`). If the block is already filled (an earlier setup ran), keep it; just confirm it back in one line. Never show placeholders.

Three Brain states:
- **(a) Brain MISSING** → don't block. Capture the **main brand colour** and **font feel** inline, write them into `brand`, nudge: *"Say 'set up my brain' when you have a minute and I'll use your full brand everywhere."*
- **(b) Brain present, brand fields EMPTY** → ask only those two essentials.
- **(c) Brain populated** → pull silently, confirm in one line ("Using your purple + gold brand").

**Map the font to the engine.** Riverside serves a fixed set of families named with their weight (`Poppins ExtraBold`, `Inter Bold`, `Montserrat`, `Sora SemiBold`, `Oswald`, `DM Mono`, `Merriweather`…). Pick the nearest to the Brain's heading font and store THAT in `brand.caption.font` and as the card font — never a font Riverside can't render. On Edits, captions use the chosen caption style's own face (`edits.caption_style`, default `Word Highlight Box`), and cards use the system font or a brand font the agent has installed on the Mac (`importAccountFont`); store the PostScript name in `brand.fonts.heading` only when it is installed.

### Step 2a — Write the brand into their Riverside studio (once; Riverside engine only — on Edits skip to Step 2½)

`editing_get_brand(studioId)` — if the kit is empty, offer in one line: *"Want me to put your colours and logo into your Riverside brand kit so every video picks them up automatically?"* On yes:
- Logo: if the Brain's logo PNG is reachable and a shell exists, upload it (`media_create_media_upload` → `curl -T` → `media_finalize_media_upload`); otherwise ask them to drop it into Riverside's media panel and find it with `media_list_media`. Store `brand.logo_media_id`.
- `editing_set_brand(studioId, colors:[primary, accent, text, bg], backgroundColor:<bg or primary>, logoMediaId, logoPlacement:"top_right", logoOpacity:0.7)`.
- On `FAILED_PRECONDITION` / feature-disabled: say *"Your plan doesn't let me write the brand kit from here — no problem, I'll style everything directly from your brand."* Set `riverside.brand_kit_written: false`. Never retry.

## Step 2½ — Video Brand Kit (register it if they have one)

**On Edits:** the kit PNGs just need to sit under `~/Movies` (copy them into `edits.cards_dir`); record their paths in `brand.assets.*` and skip every media-id step below. Transparent full-frame PNGs are placed with `addOverlay` as they are. No kit = cards are rendered natively (`scripts/edits/render_card`).

If Drive is on, look for the agent's **Video Brand Kit** in `02 · Brand/Video Brand Kit/` (canonical files, kit v3: `hook-16x9.png`, `hook-9x16.png`, `cta-16x9.png`, `cta-9x16.png`, `lower-third-16x9.png`, `emphasis-16x9.png`, `emphasis-9x16.png`, `end-screen.png`, the `icons/` folder, the eight-variant CTA pack `cta-{subscribe,comment,guide,call,book,dm,link,follow}-{16x9,9x16}.png` (registered into `brand.assets.cta_pack`), optional `lower-third-9x16.png`, `end-card-16x9.png`, `end-card-9x16.png`, `animated/end-card-*.mp4`, `logo-sting.mp4` at the kit root, and per-member strips `lower-third-16x9-<firstname>.png` (registered under `brand.assets.members.<firstname>`), plus the `video-brand-spec` doc. `preview-*.png` (including `preview-cta-pack-16x9.png`) are review sheets and `end-screen.png` is a YouTube Studio asset: neither is placed on a timeline, so record the end screen's path and skip the previews. The spec to transcribe is `video-brand-spec.md` in the same folder — the designed `video-brand-spec.png` is for people). **Sanity-check the kit before registering:** a `hook-*`, `emphasis-*`, `lower-third-*`, or `cta-*` file that is fully opaque (no transparent pixels) is not an overlay — either an old-style slate, or the kit's design-time stage was left on at export. Say so in one line, *"These files aren't see-through. In Claude Design, switch the 'Show stage' tweak OFF and export again — or rebuild them with the Video Brand Kit v3 skill if they're old full-screen cards"*, and never place a full-screen card over their face.

- **Found** → record each Drive path into `brand.assets`, read `video-brand-spec.md` and transcribe its values into the brand block (**the spec wins**: `editor font` → `brand.caption.font` and the card font; `style pack` + `caption look` → `style_pack` + `caption_style`; the identity + CTA fields → `brand.*`; the empty zones and character budgets → `brand.assets.zones`), then get each PNG into Riverside's Your Media and record the ids in `brand.assets.riverside_media_ids`. **Two ways, try them in this order:**
  1. **Automatic (only where a shell and the local files exist — the Code tab):** `media_create_media_upload` → push the bytes with the returned command → `media_finalize_media_upload`. In Cowork skip straight to 2; do not try and fail first.
  2. **If the upload step fails or the command cannot run:** do NOT loop. Say, in one line, *"I can't push files to Riverside from here — drag these into Riverside's media panel (Your media → Upload) and tell me when they're in: hook-16x9.png, hook-9x16.png, cta-16x9.png, cta-9x16.png, the sixteen cta-<ask>-16x9/9x16 files, lower-third-16x9.png, emphasis-16x9.png, emphasis-9x16.png, the twelve icon files, and the end cards if you made them."* When they say so, `media_list_media(productionId)` and match by file name (exact canonical names, case-insensitive; the newest match wins if there are duplicates). Record the ids the same way. Files the agent has ALREADY dropped into Riverside are found this way too, so an agent who skips Drive entirely and uploads straight into Riverside is still set up: the Drive paths stay blank, the media ids are what every edit uses.

  Confirm: *"Found your Video Brand Kit — your videos will use your designed cards."* Report any missing canonical file by name.
- **Not found (or no Drive)** → check Riverside's media panel first (`media_list_media`, canonical names): if the kit is already there, register it from there. Otherwise skip silently; cards are built natively. If they ASK: *"Design them with the Video Brand Kit skill in Claude Design, then either drop the export into `02 · Brand/Video Brand Kit/` in your Drive or upload the files into Riverside's media panel, and tell me 'register my video brand kit'."*
- **Re-runs:** "register my video brand kit" touches ONLY `brand.assets` — never the rest.

## Step 3 — The short questionnaire (only what you can't infer)

One at a time, each with a recommended default:

1. **Where do you post?** (YouTube / Instagram / TikTok / Facebook / LinkedIn) → default aspect ratios AND which channels to check for publishing.
2. **Do you have your own footage?** A Drive folder of reusable B-roll, clips already in Riverside's media panel (Riverside) or a folder under `~/Movies` (Edits), and/or uploads per video. Get the Drive folder name if any. (`${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`)
3. **Caption look** for shorts → Riverside: show the named looks in `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md` in one line each; save the pick (`caption_style` + `brand.caption` + `style_pack`). Edits: offer three catalog styles in one line (Word Highlight Box, bold boxed word, the default · Word Highlight, lighter · Simple, calm) and save the pick to `edits.caption_style`; the accent colour comes from the brand.
4. **Publishing** → confirm they want to approve before anything posts (recommended yes). Then set the ONE posting route (`publish_route` in the config): if the Short-Form System already posts through Metricool / GoHighLevel / Buffer, keep that for reels (`"shortform-tool"`) and use Riverside for YouTube long-form; otherwise `"riverside"` for everything. **On Edits the Studio never posts:** `publish_route` is `"shortform-tool"` when that tool is connected, else `"manual"` (they share from Edits' share sheet); say so in one line. One route per post, never both (`${CLAUDE_PLUGIN_ROOT}/shared/boundaries.md`). Riverside only: then check `social_get_connected_platforms(studioId)`: list what's connected in plain words ("YouTube — Mike Sherrard Real Estate; Instagram — @mikesherrard"), store the account ids in `riverside.publish_accounts`. Nothing connected → *"When you want me to post for you, connect your channels in Riverside (Studio settings → Social) — takes a minute."* Don't block on it.
5. **Which editor is your default?** Already answered in Step ½ (`riverside` or `edits`). If an older config still says `descript`, overwrite it with the Step ½ answer and mention it in one line.
6. **Your call-to-action** → what should viewers do, and the details? Save it so **every video ends with their CTA on screen**.

That's the whole questionnaire.

*(Reassure them: audio is cleaned automatically on every video, nothing publishes without their okay, and their raw recording is never touched.)*

## Step 4 — B-roll sources (all optional)

"B-roll is the extra footage we lay over your talking — skylines, homes, neighbourhoods."
- **Built in, nothing to do:** Riverside's own stock library + your own footage. Enough to start.
- **Optional free upgrades:** Pexels, Pixabay, Unsplash, Coverr — each a free key; more sources = less repetition. (`${CLAUDE_PLUGIN_ROOT}/shared/broll-ladder.md`)
- **Optional swoosh:** *"If you ever want a little 'whoosh' on the zoom-ins, drop any licensed swoosh sound into your Riverside media panel and tell me — I'll use it every time."* Store its media id in `sfx.swoosh_media_id` when they do. **On Edits** the whoosh and the music bed come from Edits' built-in libraries (nothing to add), and a free Pexels key (`edits.pexels_key`) is the one optional upgrade for stock cutaways.

None of these are required.

## Step 5 — Set expectations (say this ONCE)

Check `expectations_shown`; if `true`, skip. Otherwise, warmly, in your own words, keeping all of these points:

> "Quick heads-up on what I do: I take your raw video and make it clean, branded, and ready for you to review and post — good audio, captions, your colours, a hook and your call-to-action, a little energy, and (on Riverside) I can post it to your channels when you say go. I'll get you about **80% of the way to polished**; you add the last touches by hand in your editor, free. Think of me as your **in-house editor, not a Hollywood VFX studio**. And you always **review and approve** before anything goes out — and nothing I do ever touches your original recording."

Then set `expectations_shown: true`.

## Step 6 — Save and hand off

Write the settings to `~/realtor-brain/editor/config.json` (template: `config/editor-config.example.json`) — `default_engine`, the engine block (`riverside` or `edits`), the `brand` block, `caption_style`, `publish_route`, `publish`, `expectations_shown`. **Then PUSH the Brain back up to Drive** via `realtor-brain-sync` if Drive is connected; if not: on a machine with a persistent disk, say that settings are local to this machine until Drive is connected; in Cowork, say that they will be lost when the session ends and connect Drive now.

Then confirm in one friendly line:

> "You're all set. Whenever you want to edit something, just say **'edit my video'** — I'll take it from there."

If Edits was set up too, add: *"For Edits, say it here in the Code tab: 'edit my video in Edits'."*

Route future requests through `studio-navigator`.
