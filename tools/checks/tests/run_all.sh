#!/bin/bash
# GENERATED FILE -- do not hand-edit. Written by tools/precedent_materialize.py
# on every sync; any edit here is overwritten without warning.
#
# Runs every materialized check's two-direction test. The glob is the point:
# this driver runs whatever tests this repo actually materialized, which is
# why it is generated here rather than copied from any one practice source.
#
# Every test here belongs to the source that shipped it -- owner_of below,
# the same source MANIFEST.json records for it under checks[]. A failing one
# is a bug in THAT source, and the summary at the end says so by name.
set -uo pipefail
cd "$(dirname "$0")"

owner_of() {
  owner=''
  level=''
  case "$1" in
  esac
}

status=0
failed=()
ran=0
for t in test_*.sh; do
  # A repo that materialized no tests leaves the glob unexpanded; without
  # this the driver would try to run a file literally named test_*.sh and
  # report a failure that is really an empty set.
  [ -e "$t" ] || continue
  ran=$((ran + 1))
  echo "--- $t ---"
  if ! bash "$t"; then
    status=1
    failed+=("$t")
  fi
done

# Say what ran, so silence is never read as a pass (2026-09-28: a fresh
# install materializes no tests, and this driver used to print nothing).
if [ "$ran" -eq 0 ]; then
  echo "run_all: 0 materialized tests -- nothing ran"
elif [ "$status" -eq 0 ]; then
  echo "run_all: $ran test(s) run, 0 failed"
fi

if [ "$status" -ne 0 ]; then
  echo
  # A test that clones this repo runs the COMMITTED checks, not the ones on
  # disk. With tools/checks/ changed and not committed -- the state an
  # update is in before its commit -- such a test pairs new cases with old
  # scripts and can fail on nothing. Seen 2026-09-28 (test_file_header.sh,
  # fixed in its source); several shipped tests still clone the repo.
  if [ -n "$(git -C ../../.. status --porcelain -- tools/checks 2>/dev/null)" ]; then
    echo "NOTE: tools/checks/ has uncommitted changes. A test that clones this"
    echo "repo runs the committed scripts, not these, so a failure below may"
    echo "vanish once they are committed. Commit (or judge a temporary commit,"
    echo "as Update Vendors does) before treating it as real."
    echo
  fi
  echo "=== ${#failed[@]} materialized test(s) failed -- who owns each ==="
  shipped=0
  for t in "${failed[@]}"; do
    owner_of "$t"
    if [ -z "$owner" ]; then
      echo "FAILED: $t -- no source shipped it: the last sync did not write it"
      echo "    and MANIFEST.json does not list it. Find out who put it here."
    elif [ "$level" = repo-local ]; then
      echo "FAILED: $t -- this repo's own repo-local source (local/): fix it here"
    else
      echo "FAILED: $t -- shipped by source '$owner' ($level level)"
      shipped=1
    fi
  done
  if [ "$shipped" -eq 1 ]; then
    echo
    echo "A test shipped by a source is not this repo's to own, and a failing one"
    echo "is a bug in that source: fix it there and report it there -- from a"
    echo "session rooted in that source's repository, or with a hand-off to one"
    echo "if this session cannot reach it. Never record it here as pre-existing,"
    echo "or as failing on the base branch too: that is true, and it is how a"
    echo "shipped test stays red for days in every repo that carries it."
  fi
fi
exit $status
