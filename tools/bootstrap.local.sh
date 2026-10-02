# This repository's own session-start steps, run by tools/bootstrap.sh just
# before it exits (templates/bootstrap.sh keeps that file current; this one
# is ours and no refresh touches it).

# build/build.sh packages the store uploads with the zip CLI
# (gotchas/gotcha-2026-08-10-build-sh-needs-the-zip-cli.md).
command -v zip >/dev/null 2>&1 || \
  echo "WARN: zip is not on PATH -- ./build/build.sh will fail to package the .zip/.xpi (see gotchas/gotcha-2026-08-10-build-sh-needs-the-zip-cli.md)" >&2
