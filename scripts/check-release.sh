#!/usr/bin/env bash
# Pre-release gate. Run BEFORE committing a release.
#
# Catches the failure that shipped Plugin 8 v0.4.1 broken: a version bump and a
# changelog entry were committed while the actual skill files stayed unstaged, so
# the marketplace served a plugin whose orchestrator pointed at skills that
# didn't exist and whose advertised deliverables were missing.
#
# Usage: scripts/check-release.sh [plugin-name]
#   No argument  -> checks every plugin (full marketplace release).
#   Plugin name  -> scopes the "is it staged?" and changelog checks to that plugin,
#                   so a single-plugin release is not blocked by other work in flight.
set -uo pipefail
cd "$(dirname "$0")/.."
SCOPE="${1:-}"
if [ -n "$SCOPE" ]; then
  [ -d "plugins/$SCOPE" ] || { echo "No such plugin: $SCOPE"; exit 2; }
  PATHSPEC="plugins/$SCOPE"
  echo "Scoped to: $SCOPE"
else
  PATHSPEC="plugins/"
  echo "Scope: all plugins"
fi
echo
FAIL=0
say() { printf '%s\n' "$*"; }
bad() { printf '  ✗ %s\n' "$*"; FAIL=1; }
ok()  { printf '  ✓ %s\n' "$*"; }

say "── 1. plugin.json version == marketplace registry version"
python3 - <<'PY' || FAIL=1
import json,sys,glob,os
reg={p["name"]:p["version"] for p in json.load(open(".claude-plugin/marketplace.json"))["plugins"]}
bad=False
for f in sorted(glob.glob("plugins/*/.claude-plugin/plugin.json")):
    d=json.load(open(f)); n=d["name"]
    if n not in reg:
        print(f"  ✗ {n}: built but NOT registered in marketplace.json"); bad=True
    elif reg[n]!=d["version"]:
        print(f"  ✗ {n}: plugin.json {d['version']} != registry {reg[n]}"); bad=True
    else:
        print(f"  ✓ {n} {d['version']}")
sys.exit(1 if bad else 0)
PY

say ""
say "── 2. no unstaged/untracked files inside a plugin being released"
DIRTY=$(git status --porcelain "$PATHSPEC" | grep -E '^( M|\?\?|_M| D)' || true)
if [ -n "$DIRTY" ]; then
  bad "plugin files not staged — these would NOT ship:"
  printf '%s\n' "$DIRTY" | sed 's/^/      /'
else
  ok "every plugin file is committed or staged"
fi

say ""
say "── 3. every skill a SKILL.md hands off to actually exists"
python3 - <<'PY' || FAIL=1
import glob,os,re,sys
bad=False
ALL={os.path.basename(d.rstrip("/")) for d in glob.glob("plugins/*/skills/*/")}
for plug in sorted(glob.glob("plugins/*/")):
    have={os.path.basename(d.rstrip("/")) for d in glob.glob(plug+"skills/*/")}
    if not have: continue
    for f in glob.glob(plug+"skills/*/SKILL.md"):
        txt=open(f).read()
        for ref in set(re.findall(r'\*\*((?:Market|Listing|Editor|Support)\s+[A-Z][a-zA-Z]+)\*\*',txt)):
            w=ref.split()
            slug=f"{w[0].lower()}-{w[1].lower()}"
            if not slug.startswith(("market-","listing-","editor-","support-")): continue
            # a handoff may legitimately name a skill in ANOTHER plugin (documented boundary)
            if slug in have or slug in ALL:
                continue
            print(f"  ✗ {f}: hands off to '{ref}' -> {slug} which exists in no plugin"); bad=True
if not bad: print("  ✓ no dangling skill handoffs")
sys.exit(1 if bad else 0)
PY

say ""
say "── 4. ~/realtor-brain and \${CLAUDE_PLUGIN_ROOT} references resolve"
python3 - <<'PY' || FAIL=1
import glob,os,re,sys
bad=False
for plug in sorted(glob.glob("plugins/*/")):
    for f in glob.glob(plug+"**/*.md",recursive=True):
        for ref in re.findall(r'\$\{CLAUDE_PLUGIN_ROOT\}/([A-Za-z0-9_./-]+)',open(f).read()):
            if not os.path.exists(os.path.join(plug,ref)):
                print(f"  ✗ {f}: missing {ref}"); bad=True
if not bad: print("  ✓ all plugin-root references resolve")
sys.exit(1 if bad else 0)
PY

say ""
say "── 5. shared files that must stay identical across plugins"
python3 - <<'PY' || FAIL=1
import glob,hashlib,collections,sys
bad=False
for name in ("render_doc.py","notion-board-spec.md"):
    paths=sorted(glob.glob(f"plugins/*/shared/{name}"))
    if len(paths)<2: continue
    by=collections.defaultdict(list)
    for p in paths: by[hashlib.md5(open(p,'rb').read()).hexdigest()].append(p)
    if len(by)>1:
        print(f"  ✗ {name} has drifted across plugins:")
        for h,ps in by.items():
            for p in ps: print(f"      {h[:8]}  {p}")
        bad=True
    else: print(f"  ✓ {name} identical across {len(paths)} plugins")
sys.exit(1 if bad else 0)
PY

say ""
say "── 7. the Studio never drafts titles, descriptions, tags, or chapter names"
python3 - <<'PY' || FAIL=1
import glob,re,sys
pat=re.compile(r"ready-to-paste|ready to paste|draft the title|title \+ description|title and description \(|title options|suggest(ed)? titles?|pick one\) title",re.I)
allow=re.compile(r"never|not |no titles|owns|boundar|SEO Package|does not|doesn't|don't|removed|NEVER",re.I)
bad=[]
for p in glob.glob("plugins/realtor-riverside-editor/**/*.md",recursive=True):
    for n,l in enumerate(open(p,encoding="utf-8"),1):
        if pat.search(l) and not allow.search(l): bad.append(f"{p}:{n}: {l.strip()[:110]}")
if bad:
    print("  ✗ the Studio still drafts SEO copy (only the YouTube System may):")
    for b in bad: print("      "+b)
    sys.exit(1)
print("  ✓ no title/description/chapter-name drafting in the Studio")
PY

say ""
say "── 6. top changelog entry names files that are actually committed/staged"
python3 - <<'PY' || FAIL=1
import re,subprocess,sys,os
cl=open("CHANGELOG.md").read()
m=re.search(r'^## \[([^\]]+)\].*?(?=^## \[)',cl,re.M|re.S)
if not m: print("  ✗ could not parse the top changelog entry"); sys.exit(1)
ver,body=m.group(1),m.group(0)
names=set(re.findall(r'`([a-z0-9][a-z0-9-]*(?:\.md|\.py|\.sh)?)`',body))
tracked=set(subprocess.run(["git","ls-files","plugins/"],capture_output=True,text=True).stdout.split())
staged=set(subprocess.run(["git","diff","--cached","--name-only"],capture_output=True,text=True).stdout.split())
known={os.path.basename(p) for p in tracked|staged}
known|={os.path.basename(os.path.dirname(p)) for p in tracked|staged}
# The changelog names skills by their SHORT name (brain-setup) while the directory
# carries the plugin prefix (realtor-brain-setup). Accept a suffix match so the repo's
# own long-standing naming convention isn't reported as a missing file.
def seen(n):
    return n in known or any(k.endswith("-"+n) or k == n for k in known)
missing=[n for n in names if ("-" in n or n.endswith((".md",".py"))) and not seen(n)
         and not n.endswith(("/",)) and len(n)>4]
if missing:
    print(f"  ✗ v{ver} names files/skills that are neither tracked nor staged:")
    for n in sorted(missing): print(f"      {n}")
    print("      (this is exactly how v0.4.1 shipped broken)")
    sys.exit(1)
print(f"  ✓ v{ver}: every named file is tracked or staged")
PY


say "── 8. SKILL.md descriptions: within the 1024-char sync limit, and no folded-scalar word splits"
python3 - <<'PYEOF' || FAIL=1
import re, glob, sys
def desc(path):
    s = open(path, encoding="utf-8").read()
    if not s.startswith("---"): return None
    fm = s[3:s.find("\n---", 3)]
    m = re.search(r"^description:\s*(.*)$", fm, re.M)
    if not m: return None
    first = m.group(1).strip()
    if first in (">", "|", ">-", "|-", ">+", "|+"):
        body = []
        for ln in fm[m.end():].split("\n")[1:]:
            if ln.strip() == "": body.append(""); continue
            if not ln.startswith("  "): break
            body.append(ln.strip())
        paras, cur = [], []
        for b in body:
            if b == "": paras.append(" ".join(cur)); cur = []
            else: cur.append(b)
        if cur: paras.append(" ".join(cur))
        return "\n".join(paras).strip()
    return first.strip("\"" + "'")
over, split = [], []
for p in sorted(glob.glob("plugins/*/skills/*/SKILL.md")):
    v = desc(p)
    if not v: continue
    if len(v) > 1024: over.append((len(v), p))
    for m in re.finditer(r"(\w+)- (\w+)", v): split.append((p, m.group(0)))
if over:
    print(f"  \u2717 {len(over)} description(s) exceed 1024 chars — the marketplace SKIPS these skills entirely:")
    for n, p in sorted(over, reverse=True): print(f"      {n:5d}  {p}")
    print("      (members install the plugin and the skill is simply not there)")
if split:
    print(f"  \u2717 {len(split)} folded-scalar word split(s) — a line break inside a hyphenated word becomes a SPACE:")
    for p, frag in split: print(f"      {p}  ->  {frag!r}")
    print("      (re-wrap with textwrap break_on_hyphens=False; this corrupts skill names in hand-offs)")
if over or split: sys.exit(1)
print("  \u2713 all descriptions \u22641024 chars, no folded word splits")
PYEOF


say "── 9. hooks.json carries only the \"hooks\" key (extra keys are rejected on sync)"
python3 - <<'PYEOF' || FAIL=1
import json, glob, sys
bad = []
for p in sorted(glob.glob("plugins/*/hooks/hooks.json")):
    try: d = json.load(open(p))
    except Exception as e: bad.append((p, f"does not parse: {e}")); continue
    extra = [k for k in d if k != "hooks"]
    if extra: bad.append((p, f"extra top-level key(s): {extra} — put notes in hooks/README.md"))
if bad:
    print(f"  \u2717 {len(bad)} hooks.json problem(s):")
    for p, why in bad: print(f"      {p}  {why}")
    sys.exit(1)
print("  \u2713 hooks.json files carry only \"hooks\"")
PYEOF


say "── 10. marketplace card descriptions are within the 500-character limit"
python3 - <<'PYEOF' || FAIL=1
import json, sys
d = json.load(open(".claude-plugin/marketplace.json"))
over = [(len(p["description"]), p["name"]) for p in d["plugins"] if len(p.get("description","")) > 500]
if over:
    print(f"  \u2717 {len(over)} marketplace entry description(s) exceed 500 chars — these WARN on every sync:")
    for n, name in sorted(over, reverse=True): print(f"      {n:5d}  {name}")
    print("      (this is the per-plugin \"description\" in .claude-plugin/marketplace.json, not plugin.json)")
    sys.exit(1)
print(f"  \u2713 all {len(d['plugins'])} marketplace card descriptions \u2264500 chars")
PYEOF

say ""
if [ "$FAIL" -ne 0 ]; then say "RELEASE BLOCKED — fix the ✗ items above."; exit 1; fi
say "RELEASE OK — safe to commit."
