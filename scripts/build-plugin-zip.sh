#!/usr/bin/env bash
# Build the uploadable .zip of the Realtor AI Brain plugin (Door 1 distribution:
# hand the file to someone instead of the GitHub marketplace).
#
# Per v0.10.1: Cowork's zip validation rejects the hooks/ directory, so it is
# EXCLUDED from the zip build — hooks ship only via the GitHub-marketplace install.
#
# Usage: scripts/build-plugin-zip.sh   (from the repo root)
set -euo pipefail

cd "$(dirname "$0")/.."
VERSION=$(cat VERSION)
OUT_DIR="dist"
OUT="realtor-ai-brain-v${VERSION}.zip"

mkdir -p "$OUT_DIR"
rm -f "$OUT_DIR/$OUT"

# Zip the plugin folder itself (manifest at .claude-plugin/plugin.json inside it),
# excluding hooks (zip validation) and junk files.
cd plugins
zip -r "../$OUT_DIR/$OUT" realtor-ai-brain \
  -x "realtor-ai-brain/hooks/*" \
  -x "*/.DS_Store" -x "*/__MACOSX/*" >/dev/null
cd ..

echo "Built $OUT_DIR/$OUT (v${VERSION}, hooks excluded per v0.10.1 validation finding)"
unzip -l "$OUT_DIR/$OUT" | tail -3
