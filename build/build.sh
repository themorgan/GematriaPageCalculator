#!/usr/bin/env bash
# Assembles the per-browser extension folders under dist/ and packages
# them into the .zip (Chrome Web Store) and .xpi (AMO) files ready for
# direct upload.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$ROOT_DIR/extension"
DIST_DIR="$ROOT_DIR/dist"
VERSION="$(grep -m1 '"version"' "$SRC_DIR/manifest.chrome.json" | sed -E 's/.*"version": *"([^"]+)".*/\1/')"

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR/chrome" "$DIST_DIR/firefox"

# Chrome build
cp "$SRC_DIR/content.js" "$DIST_DIR/chrome/content.js"
cp -r "$SRC_DIR/icons" "$DIST_DIR/chrome/icons"
cp "$SRC_DIR/manifest.chrome.json" "$DIST_DIR/chrome/manifest.json"

# Firefox build
cp "$SRC_DIR/content.js" "$DIST_DIR/firefox/content.js"
cp -r "$SRC_DIR/icons" "$DIST_DIR/firefox/icons"
cp "$SRC_DIR/manifest.firefox.json" "$DIST_DIR/firefox/manifest.json"

# Package: Chrome Web Store wants a .zip, AMO wants a .xpi (which is just a
# renamed zip). Zip contents directly (no wrapping top-level folder) since
# both stores expect manifest.json at the archive root.
( cd "$DIST_DIR/chrome" && zip -rq -X "../gematria-page-calculator-chrome-v${VERSION}.zip" . )
( cd "$DIST_DIR/firefox" && zip -rq -X "../gematria-page-calculator-firefox-v${VERSION}.xpi" . )

echo "Built:"
echo "  $DIST_DIR/gematria-page-calculator-chrome-v${VERSION}.zip"
echo "  $DIST_DIR/gematria-page-calculator-firefox-v${VERSION}.xpi"
