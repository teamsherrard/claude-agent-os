# Realtor AI Brain 🧠

**One AI Brain that powers every tool you use as a real estate agent.**

Set it up once. From then on, every skill — your market updates, your listing content, your AI admin
Jarvis, everything we build next — already knows who you are, who you serve, how you sound, and what
you've already done. You never re-explain yourself again.

This is the foundation everything else plugs into. Install it first.

---

## What's inside

| | |
|---|---|
| 🧠 **Your Brain** | A private folder at `~/realtor-brain/` holding your **identity** (brand, market, avatars, voice, offer, visuals) and your **memory** (clients, listings, content you've made). |
| 🪄 **One-time Setup** | A guided wizard builds your whole Brain in one session. |
| 📈 **Skills that use it** | Every skill reads your Brain automatically and writes back what it makes — so the system gets smarter every time you use it. |

Your Brain is **yours** — it lives on your machine, never in this repo. Updates to the system never
touch your data.

---

## Install (one time)

In **Claude Cowork** (everything is UI — there are no commands to type):

1. **Customize → Personal Plugins → Browse Plugins**
2. Click the **＋** next to "Personal" → **Add marketplace**
3. Paste: **`teamsherrard/realtor-ai-brain`** → Cowork syncs the marketplace
4. Click **Install** on **Realtor AI Brain**
5. *(Recommended)* Open the marketplace card → toggle **Sync automatically** so you get future updates

That's it — the whole system is installed.

> Note: this is a Cowork *plugin*, not a clone-and-run repo. You never download or clone anything —
> Cowork installs it from our public marketplace through the UI above.

## Set up your Brain (one time, ~30–40 min)

Just say:

```
Set up my Brain
```

The wizard will interview you about your business, build your Brain, and connect your **Google Drive**
(where your Brain is saved so it's there in every session, on every device), plus your email + calendar.
You can pause anytime — it saves as you go.

> **Where your Brain lives:** in *your* Google Drive (a `Realtor AI Brain` folder). It's yours — private,
> portable, and it follows you across projects and devices. The plugin loads it from your Drive each
> session. (Connecting Drive during setup is required for this reason.)

## Use it (every day)

Once your Brain is set up, just ask for what you want. The tools already know you:

- `Run my market update`
- `Create content for my new listing`
- `Set up my Jarvis` — your AI admin: books your calendar (conflict-checked, guests invited, video
  link attached), drafts email in your voice, sorts your inbox every morning, and briefs you at 7am

To change anything later: `Update my brand`, `Update my offer`.

---

## Updates

When we improve the system, you get it by **syncing the marketplace** in Cowork. If you turned on
**Sync automatically** during install (step 5), updates flow on their own — nothing to re-download,
nothing to manually edit. To pull the latest manually anytime: open **Personal Plugins → the Realtor
AI Brain marketplace card → Update**.

Your Brain (`~/realtor-brain/`) is never overwritten by an update — only the tools improve.

> **Maintainer note:** the repo must be **public** for realtors to add it as a personal marketplace in
> Cowork (private repos can't be added by end users). Org/Enterprise admins can alternatively deploy it
> workspace-wide.

---

## For the team (maintainers)

This repo is **both** the marketplace and the plugin.

- **Ship an update:** edit skills → bump `version` in `plugins/realtor-ai-brain/.claude-plugin/plugin.json`
  *and* the matching entry in `.claude-plugin/marketplace.json` → update `VERSION` + `CHANGELOG.md` →
  commit as `vX.Y.Z — summary` → push. Agents auto-update on next session.
- **Add a skill:** drop it in `plugins/realtor-ai-brain/skills/<name>/SKILL.md`. It ships on next release.
- **The contract every skill follows:** see [`docs/brain-spec.md`](docs/brain-spec.md). Two laws —
  read `~/realtor-brain/brain.md` first; write back to `memory/`.
- **Reference retrofit pattern:** [`realtor-market-update`](plugins/realtor-ai-brain/skills/realtor-market-update/SKILL.md)
  shows how a consumer skill loads the Brain (Step 1) and writes back (Phase 7).
- **Test fixture:** [`test/sample-brain/`](test/sample-brain) is a fully-filled example Brain.

Current version: see [`VERSION`](VERSION).
