# The daily task prompt (use VERBATIM when provisioning)

*Everything below the line is the scheduled task's prompt. Copy it exactly — do not summarize it,
do not personalize it, do not add the agent's name. It runs in a fresh session with an empty
sandbox, so it has to re-establish everything itself.*

---

Run the Listing Launch morning watch.

1. **Pull the Brain first.** This session starts empty. Run **realtor-brain-sync** (PULL) to bring
   `~/realtor-brain/` down from the agent's cloud workspace, located by ID/marker. If the pull fails,
   stop silently and do not notify — a failed pull is not news.

2. **Read** `~/realtor-brain/memory/listings.md` and `~/realtor-brain/memory/deadlines.md`. Use the
   listing schema at `realtor-listing-launch/shared/listing-schema.md`, including its migration rules
   for older blocks.

3. **Sweep** every listing whose Status is `Active` or `Pending`. Skip `Sold`, `Expired`, `Withdrawn`, and `Terminated`
   entirely. Run the eleven triggers in `realtor-listing-launch/shared/listing-triggers.md` in order,
   respecting every ceiling recorded in the listing block.

4. **Build what fired**, by handing to the skill that owns that stage. Build and leave it waiting.
   **Never post, send, or schedule anything.**

5. **Write back**: append the fired trigger and today's date to the listing block so it cannot fire
   twice, append any new `Built:` token, then push the Brain to Drive.

6. **Report in ONE short message, grouped by property**, in plain words — no stage names, no skill
   names, no tool names. Lead with the thing that needs them today.

   **If nothing fired, say nothing at all.** Do not send a message. Do not report that the sweep ran.
   Silence is the correct output on a quiet day.
