# Open items live under todo/, not in this file


Every open analysis, verification, and decision this project is tracking
lives one-file-per-item under [todo/](todo/), each file named *todo-\<date\>-\<slug\>*, typed by kind (**analysis** =
agent-doable from the desk; **verify** = source-check before external use;
**physical** = needs hardware/vendor/test; **decision** = the user's call),
with a small YAML frontmatter block carrying its status, disposition, and
(where it has one) what it's blocked on — see
[spec/OPEN_ITEM_AND_GOTCHA_PLAN.md](https://github.com/alex137/BestPractice/blob/staging/spec/OPEN_ITEM_AND_GOTCHA_PLAN.md)
Part 1 for the full field list and a worked example.

**A TODO is a handoff, not a parking lot** (practice `todo-is-a-handoff`): an
item is written only with a stated reason it isn't being done now —
*blocked-on* a named input (decision-owner named), or *out-of-scope* for the
session writing it (then the item carries the context a cold session needs:
why, approach, pointers). Work the current session could finish gets done,
not filed.

**An item carries a disposition, and silence is the default** (practice
`open-item-disposition`): whether a session may raise it with the owner.
`disposition: parked` — recorded, and no session brings it up unprompted
again. `disposition: ask` — a session may raise it. **An item with no
disposition field is `wait`**: blocked on someone, and nobody chases them.
Only the person an item waits on sets or clears it.

**Claiming (multi-member repos):** before starting an item, mark it
claimed — a `claimed: "your name, the date, the branch"` frontmatter field —
and clear it when the work merges or is abandoned. Agents check claims and
open branches/PRs before starting work and warn about overlap; a claim with
no branch activity for a while is fair to challenge.

**The generated index** — every open item, and every closed one — lives at
the top of `todo/` itself — [todo/TODO.md](todo/TODO.md) and
[todo/CLOSED.md](todo/CLOSED.md) — rebuilt by
[`tools/build_todo_index.py`](tools/build_todo_index.py) from every item's own frontmatter the same way
[MAP.md](MAP.md) is rebuilt from this project's own `practices` directory.
Regenerate it after adding, closing, or re-dispositioning an item; never
hand-edit the index files themselves.

**Already have an old-format open-items file to bring across** (a migration,
or an existing install adopting this shape for the first time)? Run
[`tools/todo_migrate.py`](tools/todo_migrate.py) — a one-time converter,
dry-run by default, documented in its own `--help`. A fresh install with no
existing open-items file has nothing to migrate; just start writing items
under `todo/` directly.
