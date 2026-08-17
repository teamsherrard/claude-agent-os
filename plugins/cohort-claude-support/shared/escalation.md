# Escalation — the human handoff playbook

Used by `support-escalate`. The promise to the member: **you will never write a support ticket
from scratch, and you will never explain your problem twice.**

## When to escalate (any of these)

- Two failed fix attempts on the same symptom (house rule #8).
- Anthropic account territory: login loops, verification, billing/charges, plan state — we never
  poke accounts (house rule #10).
- A real bug: a skill violating its own rules (invented stat, deviated from the data block,
  delivered unstyled output, broke mid-run reproducibly).
- Brokerage IT blocks (admin-blocked connector) — needs the IT letter.
- Feature requests and "the system should…" ideas (escalate = capture these too; they're wanted).
- Any time confidence is low and the member needs a real answer — "I don't know" routes here.

## Route by problem type

| Type | Goes to | How |
|---|---|---|
| System/plugin bugs, brain problems support couldn't fix, cohort blockers | **Mike's support portal** (link in `cohort-kb.md`; portal down → community door, and say why) | Ticket text built in chat, handed finished — member opens the portal, pastes, attaches their screenshot, submits |
| Anthropic account / billing / login | **Anthropic's official support path** | Point to the Help Center's contact path (live via `source-map.md`); help them WRITE the message; never collect credentials/card details |
| A bring-your-own TOOL's own fault (Descript, Metricool/GHL, Buffer, Notion, Higgsfield outage / account / billing) | **That tool's own support** | Draft the message for the member, ready to paste into the tool's help channel — Mike's team can't fix a third party's side, so don't route it to the portal |
| "Anyone else hit this?" / soft questions | **Cohort community** (link in `cohort-kb.md`) | Draft the post for them, ready to paste |
| Coaching-level questions (strategy, content, "is this working") | **Office hours** (schedule in `cohort-kb.md`) | Not a ticket — tell them why live is better for this one |
| IT-blocked work account | Their brokerage IT | Draft the one-paragraph access-request letter (what the connector needs and why; nothing else) |

**The expectation line (use it when they want a human NOW):** the fastest human path IS the
portal ticket — there is no phone line. Office hours are the live door for anything that isn't
breakage.

## The bug report (build it FOR them, from the session)

Everything support already learned this session goes in — the member confirms, never re-types:

```
Subject: [Cohort Support] <plain symptom> — <member name>

WHAT I WAS DOING: <plugin + skill, or Claude basic, in one line>
WHAT I TYPED/CLICKED: <their exact words / the trigger phrase tried>
WHAT HAPPENED: <symptom in plain words>
WHAT I EXPECTED: <one line>
EXACT ERROR (verbatim, if any): <raw text — the one place raw errors ARE welcome>
SCREENSHOT: <attached, if they gave one>
WHAT SUPPORT ALREADY TRIED: <tree + steps + what each check found>
SETUP SNAPSHOT: <OS · surface (Cowork desktop/web) · plugin(s) + versions if known ·
brain one-liner (exists/populated/synced) · connector states checked>
WHEN: <date/time it happened, member's timezone>
```

Rules: the report is handed as FINISHED text — the member opens the portal link, pastes it as
the ticket (SUBJECT line = the ticket subject), attaches their screenshot in the form, and
submits it themselves · member reads before submitting; support never submits on their behalf ·
attach nothing they haven't seen · **the portal is the only Mike-side channel — never mention or
suggest any support email address** (Mike's rule) · member can't use the portal right now → the
community door with the same finished text.

## After submitting

1. Set expectations honestly: Mike's team replies through the portal's own notifications — no
   invented ETAs.
2. Log it (house rule #6) with `escalated` as the outcome — these rows are the #1 input to next
   release's FAQ.
3. If it was a bug: thank them properly. *"Reports like this are literally how the system gets
   better for the whole cohort — this one goes straight to the build queue."*

## Mike's side of the loop (agency note, not member-facing)

Portal tickets land in Freshdesk → monthly, the agency runs an insights pass in Claude Code over
tickets + (optionally) members' volunteered support-log lines: top repeat issues → FAQ/doctrine
additions, curriculum fixes, and bug queue. The support plugin is also a listening post — that's
why logging is non-negotiable.
