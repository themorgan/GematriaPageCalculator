---
slug:            gotcha-2026-08-10-build-sh-needs-the-zip-cli
status:          live
noted:           2026-08-10
severity:        null
retired:         null
retires_when:    null
---
## Symptom

`./build/build.sh` assembles `dist/chrome/` and `dist/firefox/`, then stops
at the packaging step without writing the Chrome `.zip` or the Firefox
`.xpi`: the shell reports `zip: command not found`.

## Story

Written down at the 2026-08-10 practice-layer install as a standing
"do NOT rediscover this" bullet in AGENTS.md; the session that hit it did
not record more than the fix. [build/build.sh](../build/build.sh) packages
both store uploads with the `zip` CLI (the `.xpi` is a renamed zip), and a
fresh container or machine does not always have it. Moved into this file at
the 2026-10-01 migration onto the Precedent loader, which keeps gotchas one
per file.

## Fix

Install `zip` (`apt-get install zip`, or the platform's equivalent) and
re-run `./build/build.sh`. [tools/bootstrap.local.sh](../tools/bootstrap.local.sh)
warns at session start when `zip` is missing, so the gap shows up before a
build rather than halfway through one.
