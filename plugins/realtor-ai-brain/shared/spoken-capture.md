# Spoken Capture — the shared engine (Voice Print · Story Bank · Dispatch)

The Brain learns most of what matters by letting the agent **talk**, not type. This is the shared pattern
every spoken-capture skill reuses: `realtor-voice-print` (how they talk), `realtor-story-bank` (what only
they can tell), and the on-the-go voice notes in `realtor-capture` (Dispatch). Build the habit once — "just
talk to your Brain" — and it pays off everywhere.

## How the agent talks to their Brain (the mechanism — be honest about it)
- **Voice mode is the primary path.** The agent opens **Claude voice mode on their phone** and does the
  guided interview out loud. In voice mode, everything they say arrives to you as **transcribed text, turn by
  turn** — so you analyze it directly, no separate transcription step. This is the real "magic" flow.
- **Paste-a-transcript is the fallback.** If they're not in voice mode, they can **paste a transcript** —
  from their phone's voice-to-text, a voice-memo app (Otter, Apple/Google voice typing), or a past recording.
- **Do NOT promise to transcribe raw audio files.** A skill can't reliably turn an uploaded `.m4a`/`.mp3`
  into text. If someone tries to upload audio, guide them to voice mode or to paste the auto-transcript
  instead. Never pretend you heard audio you didn't.

## How to run a spoken interview (so they talk naturally, not perform)
- **One prompt at a time.** Ask, then *listen* — let them ramble. The gold is in the tangents.
- **Frame it low-stakes:** *"Just talk like you're on the phone with a friend — don't script it, don't make
  it perfect. I'll shape it afterward."*
- **Follow the energy.** If a prompt lights them up, ask one natural follow-up ("what happened next?",
  "why'd that stick with you?"). If a prompt gets a flat answer, move on — don't drag.
- **Keep it short.** 5–8 minutes, a handful of prompts. Exhausted agents give worse material, not more.
- **Meet them where they are.** Newer agent, quieter person, "I don't have much" — that's fine. Capture
  what's real, reassure it grows over time, never make them feel short.

## How to analyze what they said (the same discipline as voice-proof / import)
- **Extract specifics, verbatim where it counts.** Real phrases, real words, real details — not summaries.
  "Warm and friendly" is useless; *"he says 'let's run the numbers' before every decision"* is gold.
- **Never fabricate.** If they didn't say it, it doesn't go in the Brain. A made-up phrase or invented story
  is a trust bomb — it will end up in public content in their name. Only what's actually theirs.
- **Show, confirm, then write.** Reflect back what you heard as a short draft, let them nod or tweak, then
  write to the Brain. Push to Drive after (`realtor-brain-sync` — an unsynced write is a lost write).

## It compounds (the moat)
These captures are never "done." Every later voice-mode session and every Dispatch voice note adds more
material. Each skill tracks freshness (last updated · sample count) and can **re-analyze accumulated material**
on a "refresh" trigger — so week-10 output sounds and reads more like them than week-1 output. Accumulation
is the whole point: the longer the agent uses the Brain, the more it becomes un-clonable.
