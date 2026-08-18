# Visual Aids — pre-scripted diagrams support can SHOW

Some members are picture people: a 10-second diagram lands where three paragraphs bounce. These
are pre-scripted Mermaid diagrams — render them inline in chat when teaching (Cowork draws them
as real diagrams). Rules: **one diagram per reply** · always with a one-line caption in plain
words · use the scripts as written (tested layouts; tweak labels only, e.g. swapping "Google
Drive" for "OneDrive" to match the member's provider) · never diagram what a sentence explains
faster.

When to reach for one: the four-rooms confusion (Chat vs Cowork vs Design) · "where does my data
live" worry · the setup chain ("what's left?") · "why did my chat disappear" · "what happens when
I say help." Offer, don't force: *"Want the 10-second picture version?"*

## 1. The four rooms (Chat vs Cowork vs Design vs Code)

```mermaid
flowchart LR
    subgraph CLAUDE["🏠 Claude — one brain, four rooms"]
        CHAT["💬 Chat<br/><i>quick questions,<br/>thinking out loud</i>"]
        COWORK["🛠️ Cowork<br/><b>YOUR HOME BASE</b><br/><i>the whole system<br/>lives here</i>"]
        DESIGN["🎨 Design<br/><i>paste our briefs,<br/>get visuals</i>"]
        CODE["⚙️ Code<br/><i>Mike's workshop —<br/>you never go here</i>"]
    end
    style COWORK fill:#6b46c1,color:#fff,stroke:#2d2d2d,stroke-width:3px
```
Caption: *"Thought → Chat. Thing → Cowork. Visual → Design. And Code is where we build your
tools — you never need it."*

## 2. Where your stuff actually lives (the trust picture)

```mermaid
flowchart LR
    YOU["👤 You in Cowork<br/><i>chats come and go —<br/>like a whiteboard</i>"]
    BRAIN["🧠 Your Brain<br/>a folder of YOUR files<br/><i>on YOUR computer</i>"]
    CLOUD["☁️ Your own cloud drive<br/>(Google Drive / OneDrive)<br/><b>the permanent copy</b>"]
    MIKE["🚫 Mike's side<br/><i>instructions only —<br/>NONE of your data</i>"]
    YOU -->|"skills write<br/>what matters"| BRAIN
    BRAIN <-->|"sync, both ways"| CLOUD
    style MIKE fill:#fee,stroke:#c00,stroke-dasharray: 5 5
    style CLOUD fill:#e6f4ea,stroke:#1a7f37,stroke-width:2px
```
Caption: *"Chats are whiteboards. Your Brain is the filing cabinet, and the permanent copy sits
in YOUR cloud drive. Nothing of yours lives on our side."*

## 3. The setup chain (used by the onboard audit)

```mermaid
flowchart LR
    P["1️⃣ Paid plan"] --> APP["2️⃣ Desktop app"] --> CW["3️⃣ Cowork on"]
    CW --> PL["4️⃣ Mike's plugins"] --> BR["5️⃣ Brain built"]
    BR --> CN["6️⃣ Email + Calendar<br/>+ Drive connected"] --> OPT["7️⃣ Extras<br/><i>(Descript, posting tool…)</i>"]
    style BR fill:#6b46c1,color:#fff
```
Caption: *"Seven links, in order — I check them top to bottom and we fix the FIRST broken one,
never all seven at once."* (Mark the member's current position when rendering: add ✅ to passed
links, 👉 to the next one.)

## 4. Why your chat "disappeared" (nothing is lost)

```mermaid
flowchart TB
    subgraph MON["Monday's session"]
        C1["Chat: plan the video"] --> W1["✍️ written to Brain"]
    end
    subgraph TUE["Tuesday's session"]
        C2["New chat — fresh desk<br/><i>Monday's CHAT is gone…</i>"]
        B2["🧠 …but the Brain remembers:<br/>the plan, your voice, everything"]
        B2 --> C2
    end
    W1 --> CLOUD["☁️ your cloud drive"] --> B2
    style CLOUD fill:#e6f4ea,stroke:#1a7f37
```
Caption: *"Chats are workdays; the Brain keeps the memory. New day, fresh desk, same
filing cabinet."*

## 5. What happens when you say "help"

```mermaid
flowchart TB
    H["🗣️ 'help'"] --> NAV{"I figure out<br/>which kind"}
    NAV -->|"it's broken"| FIX["🔧 real checks,<br/>then the fix"]
    NAV -->|"how do I…?"| TEACH["📖 plain-English<br/>lesson"]
    NAV -->|"money/plans"| ACC["💳 live official<br/>answer"]
    NAV -->|"can't fix it"| ESC["👤 ticket built FOR you —<br/>paste it in the portal, done"]
    style H fill:#6b46c1,color:#fff
```
Caption: *"One word in — the right kind of help out. Worst case, a human gets a perfect ticket
you didn't have to write."*

## Beyond these five

- **Member screenshots IN** are still the best visual channel — ask early, annotate verbally
  ("see the button on the top right of your screenshot?").
- A member who wants a **keep-forever cheat sheet** (the four rooms + the one phrase) → that's a
  one-page artifact; offer it at the end of a teach session, never mid-fix.
- Don't freehand new diagrams mid-session for concepts these five already cover; consistency IS
  the pedagogy. A genuinely new diagram need → log it (that's a candidate for this file's next
  release).
