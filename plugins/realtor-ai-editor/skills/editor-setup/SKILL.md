---
name: editor-setup
description: Realtor AI Editor — Setup. The first skill a real estate agent runs. Connects Descript (the one tool that does ALL the editing, long-form and short-form) in a few minutes, pulls the agent's brand from their Realtor AI Brain, asks only the handful of questions it can't already answer, and gets them ready to edit — with no technical setup. Stock B-roll works out of the box (Descript's own library plus the agent's footage); free stock-library keys (Pexels, Pixabay, Unsplash, Coverr) are OPTIONAL and only offered if they want more variety. Trigger on: "set up my video editor", "set up the editor plugin", "set up my editor", "connect descript", "get me started editing", "onboard me to the editor", or any first-run request for the video editor.
---

# Realtor AI Editor — Setup

Goal: get the agent editing in about five minutes, with the **fewest possible steps**. Read the Realtor AI Brain first (`~/realtor-brain/`) so you never ask for anything it already knows. Go one step at a time, plain language, friendly. Follow `${CLAUDE_PLUGIN_ROOT}/shared/house-rules.md`.

## Step 1 — Connect Descript (the only required connection)

Descript is the one tool that does everything. Walk them through it simply:

1. They need the **Claude desktop app** (not the browser). If they don't have it, point them to download it.
2. In Claude: Settings → Connectors → add a custom connector.
3. Name it `Descript`, and paste Descript's remote MCP server URL. The current URL is on Descript's help page "Connect Descript to Claude" (`api.descript.com/v2/mcp` at time of writing — confirm against the help page, since it can change).
4. A browser window opens → they click **Allow** to sign in to their own Descript account. Done — no API key to copy.
5. Set permissions: leave **Publish** on **"needs approval"** (so nothing ever posts without them saying yes). Everything else can be "always allow."

If they don't have a Descript account yet, tell them any **paid** plan includes the API/connector at no extra cost, and the connection uses their own account's credits.

Confirm the connection works (find one of their existing projects) before moving on.

## Step 2 — Brand (pull it, don't ask)

Read `identity/brand-visual.md` (and `identity/voice.md`, `identity/compliance.md`) from the Brain. Build/confirm the editor's `brand.json` from it — see `${CLAUDE_PLUGIN_ROOT}/shared/brand-wiring.md` for the schema. Only if the Brain has no brand info, ask the two essentials (main color + font feel) or use tasteful defaults. Never show placeholders.

## Step 3 — The short questionnaire (only what you can't infer)

Ask these one at a time, each with a recommended default they can just accept:

1. **Where do you post?** (YouTube / Instagram / TikTok / Facebook — pick any) → sets default aspect ratios.
2. **Do you have your own footage?** Two ways to use it: a **Google Drive folder** where you keep reusable B-roll (drone, exteriors, neighbourhood), and/or **uploading clips per video** (e.g. a listing's kitchen, backyard, drone). If they keep a Drive folder, get its name/location. If not, that's fine — stock and (for listings) the listing photos cover it. See `${CLAUDE_PLUGIN_ROOT}/shared/footage-intake.md`.
3. **Caption look** for shorts → show 2–3 sample styles (see `${CLAUDE_PLUGIN_ROOT}/shared/caption-style.md`) and let them point at one.
4. **Publishing** → confirm they want to approve before anything posts (recommended yes).

That's the whole questionnaire. Don't add more.

## Step 4 — B-roll sources (all optional, more = more variety)

Explain simply: "B-roll is the extra footage we lay over your talking — skylines, homes, neighbourhoods."

- **Built in, nothing to do:** Descript's own stock library + your own footage. This alone is enough to start.
- **Optional free upgrades (more variety, no cost):** offer to connect any of **Pexels, Pixabay, Unsplash, Coverr** — each is a free account + one key, and using several means the B-roll never recycles the same clips. Guide them through whichever they want, or skip entirely. See `${CLAUDE_PLUGIN_ROOT}/shared/broll-ladder.md`.

Make it clear: **none of these are required.** They can add them now, later, or never.

## Step 5 — Save and hand off

Write the settings to the Brain at `~/realtor-brain/editor/config.json` (use `config/editor-config.example.json` as the template), so they persist and sync. Then confirm in one friendly line that they're ready, and tell them the only thing they need to remember:

> "You're all set. Whenever you want to edit something, just say **'edit my video'** — I'll take it from there."

Route future requests through `editor-navigator`.
