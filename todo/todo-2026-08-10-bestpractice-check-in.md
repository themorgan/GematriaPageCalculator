---
slug:              todo-2026-08-10-bestpractice-check-in
kind:              analysis
domain:            null
severity:          null
status:            open
disposition:       wait
remind_on:         null
blocked_on:        null
batch:             null
decision:          null
decision_strength: null
waiting_on:        null
noted:             2026-08-10
closed:            null
---
## What

- [ ] **BestPractice check-in:** review `diverged` entries in
  `process/manifest.json` and the vendored tree's accumulated changes;
  propose upstream per `process/upstream/INSTALL.md` §4 (scrub audit first).

Since the 2026-10-01 migration onto the loader, a generic improvement goes
upstream as an ordinary pull request against BestPractice (AGENTS.md merge
runbook step 0b); this recurring review still catches anything that was
folded into the vendored tree without one.

## How It Closes

(not yet stated by the migration -- a session filling this in should read ## What and say what has to be true for `status` to become `done`.)

## Notes

2026-10-01: noted date is a floor, not exact -- this item predates anchor tracking (every anchor was retrofitted 2026-09-06) and its true creation date is unknown. Migrated from TODO.md by tools/todo_migrate.py.
