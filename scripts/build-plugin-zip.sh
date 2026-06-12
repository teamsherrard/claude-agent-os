#!/usr/bin/env bash
# Build the uploadable .zip for EVERY plugin on this marketplace (Door 1 distribution:
# hand someone a file instead of the GitHub marketplace link).
#
# Per v0.10.1: Cowork's zip validation rejects the hooks/ directory, so hooks are
# EXCLUDED from zip builds — hooks ship only via the GitHub-marketplace install.
#
# Usage: scripts/build-plugin-zip.sh   (from anywhere)
set -euo pipefail

cd "$(dirname "$0")/.."
OUT_DIR="dist"
mkdir -p "$OUT_DIR"

for plugin_dir in plugins/*/; do
  name=$(basename "$plugin_dir")
  version=$(python3 -c "import json;print(json.load(open('plugins/$name/.claude-plugin/plugin.json'))['version'])")
  out="${name}-v${version}.zip"
  rm -f "$OUT_DIR/$out"
  (cd plugins && zip -r "../$OUT_DIR/$out" "$name" \
    -x "$name/hooks/*" -x "*/.DS_Store" -x "*/__MACOSX/*" >/dev/null)
  echo "Built $OUT_DIR/$out"
done
echo "Done. (hooks excluded per v0.10.1 validation finding)"
