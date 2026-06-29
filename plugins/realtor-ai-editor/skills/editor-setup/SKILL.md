---
name: editor-setup
description: Realtor AI Editor — Setup. The first skill a real estate agent runs. Connects Descript (the one tool that does ALL the editing, long-form and short-form) in a few minutes, pulls the agent's brand from their Realtor AI Brain, asks only the handful of questions it can't already answer, and gets them ready to edit — with no technical setup. Stock B-roll works out of the box (Descript's own library plus the agent's footage); free stock-library keys (Pexels, Pixabay, Unsplash, Coverr) are OPTIONAL and only offered if they want more variety. Trigger on: "set up my video editor", "set up the editor plugin", "set up my editor", "connect descript", "get me started editing", "onboard me to the editor", or any first-run request for the video editor.
---

# Realtor AI Editor — Setup

Goal: get the agent editing in about five minutes, with the **fewest possible steps**. Read the Realtor AI Brain first (`~/realtor-brain/`) so you never ask for anything it already knows. Go one step at a time, plain language, friendly. Follow `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## Step 0 — Pull the Brain, then check if they're already set up (do this FIRST)

Cowork wipes the local sandbox between sessions, so the Brain (and the editor config inside it) lives in **Google Drive**, not on this machine. Before anything else:

1. **Pull the Brain down first** — run the `realtor-brain-sync` skill (or pull `realtor-brain/` from Google Drive). This restores `~/realtor-brain/` including any saved `editor/config.json`, so the editor's settings survive across sessions. Don't skip this even if a local copy seems to exist — the local copy may be stale or empty. **If no Brain exists in Drive yet (a brand-new agent), skip the pull and continue — you'll create the config fresh in this session.**
2. **Idempotent re-run check.** After the pull, look for `~/realtor-brain/editor/config.json`. **If it already exists AND `list_projects` succeeds (an empty list with no error counts as success — see Step 1), you're already set up.** Say warmly: *"Good news — you're already set up and connected. Want me to change anything, or shall we edit?"* Do **not** re-run the whole questionnaire and **never** overwrite a good config. If they name ONE thing to change (e.g. "update my caption style", "change my CTA"), touch **only that one section** of the config and save — leave everything else exactly as it is.
3. Only if there's **no** config (or `list_projects` returns a real error) do you run the full setup below.

## Step 1 — Connect Descript (the only required connection)

Descript is the one tool that does everything. Walk them through it simply:

1. They need the **Claude desktop app** (not the browser). If they don't have it, point them to download it.
2. In Claude: Settings → Connectors → add **Descript** from the connector library (easiest), or "add custom connector" and paste `api.descript.com/v2/mcp` (confirm on Descript's "Connect Descript to Claude" help page).
3. **Enable it for the mode you'll edit in — Code is best for editing** (the desktop app's Cowork / Code / Chat toggle; Code is more robust for long Descript jobs than Cowork). Make sure the connector is on there, not just in chat.
4. A browser window opens → they click **Allow** to sign in to their own Descript account. Done — no API key to copy.
5. Set permissions: leave **Publish** on **"needs approval"** (so nothing ever posts without them saying yes). Everything else can be "always allow."

If they don't have a Descript account yet, tell them any **paid** plan includes the API/connector at no extra cost, and the connection uses their own account's credits.

**If you keep B-roll or videos in Google Drive, add the Google Drive connector too.** In the same place — Settings → Connectors — add **Google Drive** and turn it on for the **same mode as Descript (Code)**. This is optional, but it's what lets the editor reach the footage in your Drive (and it's also where your Brain and editor settings are saved — see Step 0/Step 6). If you don't use Drive for footage, you can skip it for now.

Confirm the connection works before moving on. Run `list_projects`. **Reading the result the right way matters:**

- **An EMPTY list with NO error = the connection is LIVE and working.** A brand-new Descript account simply has no videos in it yet — that's expected, not a problem. Say "You're connected!" and keep going. **Never report "setup failed" just because there are zero projects.**
- It's only a **real** failure if you get an actual error — "not connected," an auth/sign-in error, or "tool not found." If that happens, re-check: (1) the **Cowork-vs-Code mode toggle** in the desktop app, and (2) that the **Descript connector is switched on for the exact mode they're in** (it's common to have it on in one mode but not the other). Fix that and run `list_projects` again.

### If they can't connect or import — plain-language fixes

Most snags come down to three things. Walk them through these in plain words, no jargon:

- **"Is Descript actually switched on in Code mode — not just Cowork?"** This is the #1 cause. The connector can be on in one mode and off in the other. Have them open Settings → Connectors and make sure Descript is enabled for the mode they're editing in.
- **Drive sharing:** if a video won't import from a Google Drive link, the link is almost always set to private. Have them open the file in Drive → Share → change to **"Anyone with the link"** → copy the link again. That fixes it nearly every time.
- **Really big files:** for very large clips (4K, ~10 GB+), Google blocks the auto-download, so the Drive link won't work. Easiest fix: **drag the file straight into the Descript desktop app**, or share a 1080p version instead.

**Tip worth giving them now:** the easiest way to edit is to keep videos in their **Google Drive** — Descript imports straight from a Drive link, with no slow uploads. (One exception: very large 4K files, ~10 GB+, are blocked by Google's large-file download page — for those, a 1080p export or dragging the file into the Descript app works better.)

## Step 2 — Brand (pull it, don't ask)

Read `identity/brand-visual.md` (and `identity/voice.md`, `identity/compliance.md`) from the Brain. Build/confirm the editor's brand from it and write it into the **`"brand"` block inside `~/realtor-brain/editor/config.json`** — there is **no separate `brand.json` file**. See `${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md` for the schema and resolution order (the config's brand block is source #1; the Brain's `brand-visual.md` is the fallback). Never show placeholders.

**Handle whatever Brain state they're in — three cases (the Step 0 pull has already run):**

- **(a) Brain folder/file MISSING** (no `~/realtor-brain/` or no brand file even after the pull) → **don't block setup.** Capture just the two essentials inline — their **main brand colour** and **font feel** — write them into the **`"brand"` block of `config.json`**, and gently nudge: *"I've got a basic look set. When you have a minute, say **'set up my brain'** to lock in your full brand — then I'll use it everywhere automatically."*
- **(b) Brain present but brand fields EMPTY** (file exists but colour/font are blank) → ask only those **two essentials** (main colour + font feel) and save them into the **`"brand"` block of `config.json`**. Don't run a full brand interview — that's the brain skill's job.
- **(c) Brain populated** → pull the brand **silently** and just confirm it back in one line (e.g. "Using your purple + SF Pro brand"). Don't re-ask anything it already knows.

## Step 3 — The short questionnaire (only what you can't infer)

Ask these one at a time, each with a recommended default they can just accept:

1. **Where do you post?** (YouTube / Instagram / TikTok / Facebook — pick any) → sets default aspect ratios.
2. **Do you have your own footage?** Two ways to use it: a **Google Drive folder** where you keep reusable B-roll (drone, exteriors, neighbourhood), and/or **uploading clips per video** (e.g. a listing's kitchen, backyard, drone). If they keep a Drive folder, get its name/location. If not, that's fine — stock and (for listings) the listing photos cover it. See `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`.
3. **Caption look** for shorts → show 2–3 sample styles (see `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`) and let them point at one.
4. **Publishing** → confirm they want to approve before anything posts (recommended yes).
5. **Your call-to-action** → what should viewers do, and the details? (e.g. "DM me COST", "call 555-1234", "link in bio", "subscribe"). Save it so **every video ends with their CTA on screen** — never a missing or generic ending.

That's the whole questionnaire. Don't add more.

*(Reassure them: their audio is cleaned automatically on every video, and nothing publishes without their okay — so they never have to think about either.)*

## Step 4 — B-roll sources (all optional, more = more variety)

Explain simply: "B-roll is the extra footage we lay over your talking — skylines, homes, neighbourhoods."

- **Built in, nothing to do:** Descript's own stock library + your own footage. This alone is enough to start.
- **Optional free upgrades (more variety, no cost):** offer to connect any of **Pexels, Pixabay, Unsplash, Coverr** — each is a free account + one key, and using several means the B-roll never recycles the same clips. Guide them through whichever they want, or skip entirely. See `${CLAUDE_PLUGIN_ROOT}/shared/broll-ladder.md`.

Make it clear: **none of these are required.** They can add them now, later, or never.

## Step 5 — Set expectations (say this ONCE)

Before you hand off, set the right expectation so they're never surprised later. **Say this only the first time** — check `expectations_shown` in their config; if it's already `true`, skip this entirely (don't repeat it every session). Say it warmly, in your own words, but keep all of these points:

> "Quick heads-up on what I do: I take your raw video and make it clean, branded, and ready for you to review and post — good audio, captions, your colours, a hook and your call-to-action, and a little energy. I'll get you about **80% of the way to polished**; you add the last little touches by hand, for free. Think of me as your **in-house editor, not a Hollywood VFX studio**. And you always **review and approve** before anything goes out."

After saying it, set `expectations_shown: true` in their config so it's never repeated.

## Step 6 — Save and hand off

Write the settings to the Brain at `~/realtor-brain/editor/config.json` (use `config/editor-config.example.json` as the template), so they persist and sync. Write the captured brand colour/font into the file's **`"brand"` block** (the same block from Step 2 — not a separate file). Include the `expectations_shown` flag (set to `true` once you've shown the expectation paragraph in Step 5).

**Then PUSH the Brain back up to Drive** — but first **check the Google Drive connector is connected** (Step 1). 
- **If Drive is connected:** run the `realtor-brain-sync` skill (or push `realtor-brain/` to Google Drive). This is what makes the editor config survive: Cowork wipes the local sandbox between sessions, so if you don't push, the settings you just saved are lost next time. (On an idempotent one-section re-run from Step 0, push too — so the single change persists.)
- **If Drive is NOT connected:** either walk them through adding it now (Settings → Connectors → Google Drive, same mode as Descript — see Step 1), or tell them plainly: *"Your settings are saved on this machine for now, but until Google Drive is connected they won't carry over to your next session. Add the Drive connector when you get a chance and I'll back them up."* So they know the config may not persist yet.

Then confirm in one friendly line that they're ready, and tell them the only thing they need to remember:

> "You're all set. Whenever you want to edit something, just say **'edit my video'** — I'll take it from there."

Route future requests through `editor-navigator`.
