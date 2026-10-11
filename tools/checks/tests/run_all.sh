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
  check=''
  tsha=''
  csha=''
  case "$1" in
  esac
}

# The first 16 hex digits of a file's sha256, as MANIFEST.json records it.
_sha16() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | cut -c1-16
  else
    shasum -a 256 "$1" | cut -c1-16
  fi
}

status=0
failed=()
found=()
ran=0
trusted=0
for t in test_*.sh; do
  # A repo that materialized no tests leaves the glob unexpanded; without
  # this the driver would try to run a file literally named test_*.sh and
  # report a failure that is really an empty set.
  [ -e "$t" ] || continue
  ran=$((ran + 1))
  owner_of "$t"
  # A test a source shipped, still byte-for-byte what it shipped, beside the
  # check it tests, likewise unchanged: its source already ran it before
  # shipping, at home and consumer-shaped (precedent_consumer_shape.py). Its
  # fixtures test the CHECK's code, which nobody here changed; the part that
  # judges this repo is the check itself, so that is what runs, in seconds
  # where the self-test took minutes (2026-10-06, a consumer whose every
  # Update Vendors spent about 7 of its minutes here, nearly all of it
  # re-testing unchanged shipped checks). A repo-local test, an edited test
  # or check, and PRECEDENT_RUN_ALL_SELF_TESTS=1 all run the self-test.
  if [ -n "$owner" ] && [ "$level" != repo-local ] && [ -n "$check" ]      && [ -z "${PRECEDENT_RUN_ALL_SELF_TESTS:-}" ] && [ -f "../$check" ]      && [ "$(_sha16 "$t")" = "$tsha" ] && [ "$(_sha16 "../$check")" = "$csha" ]; then
    echo "--- $t: unchanged from '$owner', which ran it before shipping; running $check on this repo instead ---"
    trusted=$((trusted + 1))
    ( cd ../../.. && python3 "tools/checks/$check" )
    rc=$?
    # 2 is a check's "does not apply here" -- a skip, never a failure.
    if [ "$rc" -ne 0 ] && [ "$rc" -ne 2 ]; then
      status=1
      found+=("$check")
    fi
    continue
  fi
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
if [ "$trusted" -gt 0 ]; then
  echo "run_all: $trusted of them unchanged from their source, so only their check ran on this repo;"
  echo "    PRECEDENT_RUN_ALL_SELF_TESTS=1 runs their self-tests too"
fi

if [ "${#found[@]}" -gt 0 ]; then
  echo
  echo "=== ${#found[@]} check(s) found problems in this repo's own files ==="
  for c in "${found[@]}"; do
    echo "FAILED: $c -- its findings are above; they are this repo's to fix, not the source's"
  done
fi

if [ "${#failed[@]}" -gt 0 ]; then
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
