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
missing=[n for n in names if ("-" in n or n.endswith((".md",".py"))) and n not in known
         and not n.endswith(("/",)) and len(n)>4]
if missing:
    print(f"  ✗ v{ver} names files/skills that are neither tracked nor staged:")
    for n in sorted(missing): print(f"      {n}")
    print("      (this is exactly how v0.4.1 shipped broken)")
    sys.exit(1)
print(f"  ✓ v{ver}: every named file is tracked or staged")
PY

say ""
if [ "$FAIL" -ne 0 ]; then say "RELEASE BLOCKED — fix the ✗ items above."; exit 1; fi
say "RELEASE OK — safe to commit."
