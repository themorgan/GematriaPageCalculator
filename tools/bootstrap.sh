#!/bin/bash
# Bootstrap: environment setup as code, harness-neutral (BestPractice
# practice 13). Runs at session start so every session hits the same,
# already-verified environment instead of rediscovering it.
#
# Wiring: Claude Code runs this automatically via .claude/hooks/session-start.sh;
# other harnesses' AGENTS.md tells the agent to run `bash tools/bootstrap.sh`
# at session start.
set -euo pipefail

# Python deps the practice-layer scripts import (cmarkgfm is doc_lint's exact
# GitHub-renderer check; keep it even if this repo adds nothing else):
pip install --quiet cmarkgfm 2>/dev/null || \
  echo "WARN: pip install failed - doc_lint strikethrough check will be skipped" >&2
