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

# BestPractice upstream freshness notice (see PRACTICES.md practice 13):
# detection is automated -- one ls-remote against the public upstream,
# silent when current or offline; TAKING the update stays deliberate
# (INSTALL.md sec.2) because installs are adaptive and unattended mirrors
# are the mechanism class that loses content.
python3 process/upstream/tools/checkin.py fresh 2>/dev/null || true
