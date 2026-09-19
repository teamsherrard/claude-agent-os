---
name: riverside-setup
description: Realtor AI Editor (Riverside) — Setup. The first skill a real estate agent runs for the Riverside engine. Connects Riverside (the recorder + editor + publisher in one) in a few minutes, pulls the agent's brand from their Realtor AI Brain, writes it into their Riverside studio brand kit once, picks the caption look, registers the Video Brand Kit cards in Riverside's media library, checks which social channels are connected for publishing, and gets them ready to edit — with no technical setup. Stock B-roll works out of the box (Riverside's built-in library plus the agent's footage); free stock keys are OPTIONAL. Trigger on: "set up my video editor", "set up riverside", "connect riverside", "set up the riverside editor", "get me started editing in riverside", "onboard me to the editor", "register my video brand kit", or any first-run request for the Riverside editor.
---

# Realtor AI Editor (Riverside) — Setup

Goal: get the agent editing in about five minutes, with the **fewest possible steps**. Read the Realtor AI Brain first (`~/realtor-brain/`) so you never ask for anything it already knows. One step at a time, plain language, friendly. Follow `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

**This plugin shares `~/realtor-brain/editor/config.json` with the Descript editor.** If that file already exists (they set up Descript first), you only ADD the `riverside` block and fill anything blank — never overwrite their brand, CTA, or caption choice.

## Step 0 — Pull the Brain, then check if they're already set up (do this FIRST)

Cowork wipes the local sandbox between sessions, so the Brain (and the editor config inside it) lives in **Google Drive**. Before anything else:

1. **Pull the Brain down first** — run the `realtor-brain-sync` skill (or pull `realtor-brain/` from Drive). **If no Brain exists in Drive yet (a brand-new agent), skip the pull and continue.**
2. **Idempotent re-run check.** After the pull, look for `~/realtor-brain/editor/config.json` with a filled `riverside.studio_id`. **If it exists AND `platform_list_studios` returns that studio, you're already set up.** Say warmly: *"Good news — you're already set up and connected to Riverside. Want me to change anything, or shall we edit?"* Do **not** re-run the questionnaire and **never** overwrite a good config. If they name ONE thing to change, touch **only that section** and save.
3. Only if there's **no** `riverside` block (or `platform_list_studios` returns a real error) do you run the full setup below.

## Step 1 — Connect Riverside (the only required connection)

Riverside records, edits, and publishes. Walk them through it simply:

1. In Claude: **Settings → Connectors → add "Riverside"** from the connector library. (The desktop app is best; the Code tab is the most robust for long edits.)
2. **Enable it for the mode you'll edit in** — the desktop app's Cowork / Code / Chat toggle. Make sure the connector is on there, not just in chat.
3. A browser window opens → they sign in to their own Riverside account and click **Allow**. Done — no API key.
4. Permissions: leave anything that **publishes** on **"needs approval"** (so nothing ever posts without them saying yes). Reads and edits can be "always allow."

If they don't have a Riverside account yet: it's free to start, and the recording side is the easiest way to get video in (record straight into it — no uploads).

**If you keep B-roll or your Brain in Google Drive, add the Google Drive connector too** (same place, same mode). Optional, but it's what lets the editor reach your Drive footage and is where your settings are backed up.

Confirm the connection works: `platform_list_studios`. **Read the result the right way:**
- **A studio comes back** (even one named "…'s Studio" with nothing in it) = **connected.** Say "You're connected!" and keep going. Record `riverside.studio_id`, `studio_name`, `production_id` (from `platform_list_productions`) in the config.
- It's only a **real** failure on an actual error — "not connected," an auth error, or "tool not found." Re-check: (1) the Cowork-vs-Code mode toggle, (2) that Riverside is switched on for the exact mode they're in.

### If they can't connect or find a video — plain-language fixes

- **"Is Riverside switched on in the mode you're in — not just the other one?"** The #1 cause.
- **"Is the video actually in your Riverside project?"** This engine doesn't import from links. They upload it once in the Riverside dashboard (drag onto the project page) or record straight into Riverside. Big 4K files are fine there.
- **"Has it finished uploading?"** A recording still marked uploading has no transcript yet — give it a few minutes.

**Tip worth giving them now:** *"The easiest workflow is to record straight into Riverside — then there's nothing to upload and I can start the moment you stop recording."*

## Step 2 — Brand (pull it, don't ask)

Read `identity/brand-visual.md` (and `identity/voice.md`, `identity/compliance.md`) from the Brain. Build/confirm the editor's brand and write it into the **`"brand"` block of `~/realtor-brain/editor/config.json`** (`${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md` — no separate `brand.json`). If the block is already filled (Descript setup ran), keep it; just confirm it back in one line. Never show placeholders.

Three Brain states:
- **(a) Brain MISSING** → don't block. Capture the **main brand colour** and **font feel** inline, write them into `brand`, nudge: *"Say 'set up my brain' when you have a minute and I'll use your full brand everywhere."*
- **(b) Brain present, brand fields EMPTY** → ask only those two essentials.
- **(c) Brain populated** → pull silently, confirm in one line ("Using your purple + gold brand").

**Map the font to Riverside.** Riverside serves a fixed set of families named with their weight (`Poppins ExtraBold`, `Inter Bold`, `Montserrat`, `Sora SemiBold`, `Oswald`, `DM Mono`, `Merriweather`…). Pick the nearest to the Brain's heading font and store THAT in `brand.caption.font` and as the card font — never a font Riverside can't render.

### Step 2a — Write the brand into their Riverside studio (once)

`editing_get_brand(studioId)` — if the kit is empty, offer in one line: *"Want me to put your colours and logo into your Riverside brand kit so every video picks them up automatically?"* On yes:
- Logo: if the Brain's logo PNG is reachable (Drive → local, or a local path), upload it (`media_create_media_upload` → `curl -T` → `media_finalize_media_upload`) and store `brand.logo_media_id`.
- `editing_set_brand(studioId, colors:[primary, accent, text, bg], backgroundColor:<bg or primary>, logoMediaId, logoPlacement:"top_right", logoOpacity:0.7)`.
- On `FAILED_PRECONDITION` / feature-disabled: say *"Your plan doesn't let me write the brand kit from here — no problem, I'll style everything directly from your brand."* Set `riverside.brand_kit_written: false`. Never retry.

## Step 2½ — Video Brand Kit (register it if they have one)

If Drive is on, look for the agent's **Video Brand Kit** in `02 · Brand/Video Brand Kit/` (canonical files: `hook-16x9.png`, `hook-9x16.png`, `cta-16x9.png`, `cta-9x16.png`, `lower-third-16x9.png`, `emphasis-16x9.png`, `emphasis-9x16.png`, `end-screen.png`, optional `logo-sting.mp4`, plus the `video-brand-spec` doc).

- **Found** → record each Drive path into `brand.assets`, read the spec and transcribe its values into the brand block (**the spec wins**), then **upload each PNG once into Riverside's Your Media** and record the ids in `brand.assets.riverside_media_ids`. Confirm: *"Found your Video Brand Kit — your videos will use your designed cards."* Report any missing canonical file.
- **Not found (or no Drive)** → skip silently; cards are built natively. If they ASK: *"Design them with the Video Brand Kit skill in Claude Design, drop the export into `02 · Brand/Video Brand Kit/` in your Drive, then tell me 'register my video brand kit'."*
- **Re-runs:** "register my video brand kit" touches ONLY `brand.assets` — never the rest.

## Step 3 — The short questionnaire (only what you can't infer)

One at a time, each with a recommended default:

1. **Where do you post?** (YouTube / Instagram / TikTok / Facebook / LinkedIn) → default aspect ratios AND which channels to check for publishing.
2. **Do you have your own footage?** A Drive folder of reusable B-roll, clips already in Riverside's media panel, and/or uploads per video. Get the Drive folder name if any. (`${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`)
3. **Caption look** for shorts → show the named looks in `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md` in one line each; save the pick (`caption_style` + `brand.caption` + `style_pack`).
4. **Publishing** → confirm they want to approve before anything posts (recommended yes). Then check `social_get_connected_platforms(studioId)`: list what's connected in plain words ("YouTube — Mike Sherrard Real Estate; Instagram — @mikesherrard"), store the account ids in `riverside.publish_accounts`. Nothing connected → *"When you want me to post for you, connect your channels in Riverside (Studio settings → Social) — takes a minute."* Don't block on it.
5. **Your call-to-action** → what should viewers do, and the details? Save it so **every video ends with their CTA on screen**.

That's the whole questionnaire.

*(Reassure them: audio is cleaned automatically on every video, nothing publishes without their okay, and their raw recording is never touched.)*

## Step 4 — B-roll sources (all optional)

"B-roll is the extra footage we lay over your talking — skylines, homes, neighbourhoods."
- **Built in, nothing to do:** Riverside's own stock library + your own footage. Enough to start.
- **Optional free upgrades:** Pexels, Pixabay, Unsplash, Coverr — each a free key; more sources = less repetition. (`${CLAUDE_PLUGIN_ROOT}/shared/broll-ladder.md`)
- **Optional swoosh:** *"If you ever want a little 'whoosh' on the zoom-ins, drop any licensed swoosh sound into your Riverside media panel and tell me — I'll use it every time."* Store its media id in `sfx.swoosh_media_id` when they do.

None of these are required.

## Step 5 — Set expectations (say this ONCE)

Check `expectations_shown`; if `true`, skip. Otherwise, warmly, in your own words, keeping all of these points:

> "Quick heads-up on what I do: I take your raw video and make it clean, branded, and ready for you to review and post — good audio, captions, your colours, a hook and your call-to-action, a little energy, and I can post it to your channels when you say go. I'll get you about **80% of the way to polished**; you add the last touches by hand in Riverside, free. Think of me as your **in-house editor, not a Hollywood VFX studio**. And you always **review and approve** before anything goes out — and nothing I do ever touches your original recording."

Then set `expectations_shown: true`.

## Step 6 — Save and hand off

Write the settings to `~/realtor-brain/editor/config.json` (template: `config/editor-config.example.json`) — the `riverside` block, the `brand` block, `caption_style`, `publish`, `expectations_shown`. **Then PUSH the Brain back up to Drive** via `realtor-brain-sync` if Drive is connected; if not, say plainly that settings are on this machine only until Drive is connected.

Then confirm in one friendly line:

> "You're all set. Whenever you want to edit something, just say **'edit my video'** — I'll take it from there."

Route future requests through `riverside-navigator`.
