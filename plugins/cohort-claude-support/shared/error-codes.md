# Error Decoder — what members see → what it means → what we do

Used by `support-diagnose` when a member pastes/screenshots an error. Match on PATTERN, not exact
wording (exact strings change between releases). Never show the member this table — translate via
`plain-language.md`. After any fix: confirm + log (house rule #6).

| Member sees (pattern) | Actually means | What we do |
|---|---|---|
| "usage limit" / "you've reached your limit" / "resets at [time]" | Plan's shared window of Claude time is used up (ONE pool across all surfaces and models); refills automatically | FAQ Q10; options in order (wait for reset · buy usage credits on paid plans · upgrade); switching models does NOT bypass a hit limit — a lighter model only stretches usage BEFORE the wall; specifics ALWAYS fetched live (rule #3). Work is safe. |
| Claude declines / "I can't help with that" on normal realtor content | Safety filter tripped, not a ban, not a bug — fair-housing-adjacent copy can brush against it | Not tree material: rephrase the ask (plain description of the task usually clears it); recurring on clearly-legitimate content → fetch the official policy/appeal article and escalate with the exact prompt |
| "overloaded" / "capacity" / "unavailable right now" / retry-later phrasing | Anthropic-side busy moment or incident | STATUS FIRST. Incident → nothing to fix, retry later. Clean status → retry once; recurring → escalate. |
| "conversation is too long" / "context limit" / chat visibly crawling | This chat's working memory is full | FAQ Q27: fresh chat, then RE-SAY the job's trigger phrase — finished pieces are already in Drive; only the editor resumes mid-piece ("resume"). Teach one-chat-one-job rhythm. |
| "needs your permission" / "authorize" / connector "disconnected" / "sign in to continue" | A connector's link expired or was never finished | Tree #2. 60-second reconnect framing; route the owning setup skill (Descript→editor-setup, posting→shortform-setup, Google→teach walkthrough). |
| "couldn't access [folder/file]" / "permission denied" on a local path | Mac protecting the folder, or file outside the system's folders | Tree #7. Grant-once or move-into-system-folders (recommended). |
| A skill says brain files are missing / "run setup" | Brain not on this machine (or never built) | Tree #1 → brain-setup or brain-sync restore. Reassure: Drive copy is safe. |
| A skill says the brain structure looks out of date | Plugin updated; brain data needs the migrate pass | `realtor-brain-migrate`. Content is preserved — say so. |
| Editor stopped mid-edit, mentions checkpoint / resume | Per-clip checkpointing did its job; edit is resumable | Re-open + "resume" (stack-map P6). Nothing lost. |
| Editor stopped mentioning credits / media minutes | Descript credits exhausted — hard stop BY DESIGN | Not broken: paused awaiting top-up on THEIR Descript account. Top up → resume. |
| "couldn't verify a source" / skill refuses to state a number | Anti-invention rules held (market/research skills) | Working as designed (FAQ Q22). Run/wait for the month's research; never override. |
| Sign-in loop / verification email never lands / charged twice / plan looks wrong | Anthropic account/billing state | We DON'T poke accounts. `support-escalate` → official Anthropic path. NEVER take passwords/card numbers (rule #10). |
| "something went wrong" (generic) / a red banner once | Transient hiccup | Retry once. Repeats → scope it (tree #4 step 2): one job vs everything. |
| Claude "can't do" something it did last week | Product moved, or different model/surface selected | `support-whatsnew` digest check first; then confirm same surface (Cowork) + default model; else tree #3. |
| Member pasted a scary technical block (stack trace, JSON) | Internal detail leaked to the surface | Never explain it line by line. Extract the one meaningful line, match a row above; no match → escalate WITH the block attached (it's gold for Mike's team). |

**Two-strike rule:** any single row's fix failing twice → stop → `support-escalate` with: the raw
error (verbatim), what was tried, member's OS + surface, and the brain-health one-liner.
