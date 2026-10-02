# Repository instructions — read me first


**Orientation: read `MAP.md` first** — the repository map. It covers the key
deliverables and indexes which documents back each part of each one.

<!-- BEGIN GENERATED: precedent-loader -->

<!-- Regenerate with: python3 tools/build_views.py -- do not hand-edit this block; `python3 tools/build_views.py --check` exits non-zero on drift. Source: practices/ -- edit the practice file, never this block. -->

## Resident block (~561 of 2000 token budget, 6 of 158 practices (6 universal))

**brainstorm-holds-commits.** When a conversation is a **Brainstorm** -- the person says the word, or the
thread is plainly exploratory ("I'm wondering", "what are my options", "do
you have ideas") -- **hold the edit, not just the commit: write nothing to
the repository until they authorize the work.** Research, argue the case,
propose the design; do not create, edit, commit, push, open a pull request
or merge. Answering a question inside it is not authorization, and neither
is enthusiasm for the idea. **When in doubt, it is a brainstorm.**

**current-rule-governs.** **A standing command means what the rule in force says today: do it.**
`precedent_show.py SLUG` resolves it, following a deduplicated copy to the
live one. **Superseded, deduplicated and retired entries, `## Story`
sections, old deferrals and past decisions are history**: read them to
investigate a failure or to back a proposal to reconsider a rule, never to
decide whether to do what was just asked.

**Do it first, and propose reconsidering after. Never decline silently:** if
you are not doing what was asked, the reply's first line says so, and why.

**When obeying a rule to the letter would leave something broken or wrong,
ask, with your pick.** Never comply or override silently.

**no-invented-specifics.** Being concrete makes writing better, and **it never licenses invention.** Do
not manufacture a statistic, a date, a name, a version number or a citation
because the sentence would be stronger with one, and do not invent
first-person experience that did not happen.

Without the real figure, **write around it** — *"most of them"*, *"a
handful"*, *"it went up"* — or say plainly that it is unknown. **A vague
true sentence beats a specific false one, every time.**

**repo-is-memory.** Everything a future session needs — orientation, open items,
decisions, lessons — lives in committed files. A session's chat thread is
disposable; if knowledge exists only in a thread, it is already lost.

**verify-postcondition.** After any state-changing operation, check **the state you wanted**,
not that the command reported success. Name the postcondition before you run
the command — *"no unpushed commits on any branch"*, *"the gate passed"*,
*"the file contains X"* — and then test that, independently of whatever the
command printed.

**write-like-a-human.** **Nothing you ship may sound like it came from an AI** — a document, a
chat reply, a commit message, a pull-request body. The tells: the
throat-clearing opener that circles before it lands, the "not just X,
it's Y" contrast, the summary nobody asked for, the even-handed survey
that takes no position, the caveat stack. **Say the thing, in your own
words, at the length it earns.**

## Occasion index

```
When a branch has done its job, or a person says to delete branches:
  never-delete-a-remote-branch — never delete a remote branch; hand over the one-click link
When a computation books a transfer between two parties:
  name-both-sides-of-ledger — name both sides; check what is charged against what is received
When a judgment call is needed to keep work moving:
  small-calls — make small calls yourself; note them; stop only for big ones
When a message says "Archive" or "Archive?", or asks whether the session can be archived:
  archive-status-check — check pending; archive if clear, else say what isn't
When a message says "Booked", "Approved", "Book it" or "Promote 3", or plainly authorizes a merge:
  go-update — stage 3, Booked: land it on the landing branch; high-risk: PR and merge
When a message says "Update Vendors", or an upstream update is taken into a vendoring repo:
  vendor-update-runbook — source clone first, both layers move separately, then merge
When a model or comparison rests on a constant nobody decided:
  constants-are-risk-inputs — make it a swept, registered input, never doctrine
When a person asks "What's new?", or what has changed in the project lately:
  whats-new — write every missing day, quiet ones named; the reply opens with the link
When a person explicitly asks for a "very deep check" or a "full practice audit":
  full-practice-audit — the very deep check's Pass 4 alone: every source's practices, one at a time
  very-deep-check — read every repo in force against itself, pass by pass; never routine
When a person says "Chief of Staff":
  chief-of-staff — on request only; name the window read, link each session; Promotion Reviews last
When a person says "Drop it" about an open item or a question:
  park-it — mark the item `parked` now; never raise it unprompted again
When a person says "My options", or asks to see a decision's options:
  my-options — every real option, plainer, costs said flatly, your pick and why
When a person says "Promote", "Promote N" or a stage word ("Consider", "Act", "Debut", "Produce", "Make live"), or asks to plan, build or move work up a tier:
  act — stage 2: build on the session's feature branch, pushed so it survives
  consider — stage 1: pick the plan size -- one line, Brainstorm, Plan it, Write it up
  debut — stage 4: pre-staging into staging, full checks
  produce — stage 5: staging into main (production); read strictly
  promote — the next tier up, chosen from the work and said first; "Promote N" does stage N
When a person says "Prompt Please", or work belongs in a new session or needs a repo this one cannot reach:
  prompt-please — one paste-ready prompt for a new session; never a session-creating tool
When a person says "Reduction pass", or an always-loaded surface is near its ceiling or over its target:
  reduction-pass — work the menu in order; move, never delete; report what moved
When a person says "Root issues" or "Root fixes", or asks what this session found or fixed that should go back upstream:
  root-issues — what this session hit that belongs upstream, in one prompt across those repos
When a person says "Simple please", or asks to be talked to that way:
  plain-words — say it as you would out loud; same substance
When a person says "Three Things", or plainly asks for this shape of answer:
  three-things — the three that matter now, one bold phrase and two lines each
When a person says "Todo reminder", or asks to be reminded of something:
  todo-reminder — write it with disposition ask and remind_on; never a trigger
When a person says "Vocabulary", or asks what the standing commands are:
  vocabulary — list every command in force; read it, never recall it
When a person says "Weak yes", or agrees without conviction:
  weak-yes — do it, and record the approval as `assented`
When a person says "Write it up", or asks for a write-up:
  write-it-up — commit a full report: issue, options attacked, the fix that survived; link it
When a second implementation of the same mechanism turns up:
  judgment-check-or-tool — judgment stays prose; checkable gets an audit; a mechanism gets one tool
When a tool, hook, check or gate flags something the person would otherwise have to judge:
  verdict-not-mechanism — judge what a tool flagged; give the person a verdict and why, never its name
When about to search a repo, every clone or every file, or use a GitHub tool for what the clone holds:
  grep-before-search — grep the clone first; list before search; never sweep every clone unasked
When an environment or tooling trap costs real time:
  environment-gotchas — one file per trap under gotchas/, with the story, not just the fix
When an unattended job hits something blocking its normal work, or something optional it cannot reach:
  automation-issues — a blocked job files or updates an issue; skip an optional input, never silently
When asked to include an image, logo or other binary asset the person supplies:
  attach-the-original — attach the file itself; recreating it from a description is invention
When attaching a practice source:
  attach-never-clone-individual — attach the individual one, never a second clone; shared sets sit beside the repo
When being asked for something another window or session of the person's may already be working on:
  dont-race-another-window — say so and decline; send them to the window already on it
When building a mechanism that makes something discoverable or reachable:
  affordance-is-shared — name who else it now serves
When building a permutation or configuration-sweep table:
  permutation-frontier-column — one full table with a computed Frontier column
When building a variant of an existing thing:
  variant-re-derives — re-derive what a variant inherits; limits bind, choices do not
When comparing an option against a baseline:
  check-source-architecture — check both options exist in the source before costing them
When computing, quoting or tabulating figures:
  one-formatter-per-quantity — compared across rows: one formatter per quantity kind, in one module
  quote-discipline — compression rounds against you; qualifiers travel with the figure
  scripts-assert-properties — a script a document cites asserts its own properties and cited anchors
  tabular-shared-renderer — a sortable multi-column table ships from the one shared renderer
  verify-decomposition — check the parts, not the total; never assert an impossibility
When creating, renaming or retagging a session:
  session-spend-follows-the-task — pick the model for the job -- reading runs small, judgment doesn't
  session-tags — tag at creation: subject, repo, role, wants; never retrofitted
  session-title-names-the-difference — title by the differentiator; never the task alone, never an open sibling's title
When deciding whether to build or buy a component:
  build-buy-decompose — decompose first; one verdict per part, on ownership grounds
When decommissioning a mechanism:
  decommission-deletes-files — delete what it owned; audit first, never on a hunch
When drafting anything a person outside the project will read:
  project-voice — this project's own voice -- target, audiences, vocabulary, and any departure from the general rules
When drafting or reviewing prose meant to persuade or be judged:
  push-back — argue a real counter-case before building on a stated stance
When finishing substantial work, or merging a branch:
  capture-gate — capture it in the turn that finds it; a separate second pass; merge is backstop
When fixing anything -- a bug, a stale or copied file, a broken environment -- or adding a check or exemption:
  upstream-fix — fix the cause where it lives, and the origin and copies; name a band-aid
When generating anything visual for this project -- decks, documents, diagrams, images:
  project-visual-identity — this project's own visual identity -- colors, logo, typography, imagery, and what to check before generating anything visual
When naming or adding a file:
  no-version-suffix — name a file for what it is; the repository is the version
When naming or scoping something around a person's skill level:
  technical-describes-people — a skill level describes a person, never a project, repo or file
When renaming, moving or deleting a file others may link to, renaming or retiring a name, or migrating a repo off an old system:
  rename-updates-links — repoint every link and use of a retired name in the same commit or migration
When seeding or scheduling a prompt into another session:
  seeded-prompt-names-its-origin — it opens by naming the session that sent it
When setting up a project a session works in, or a session reporting that its checkout is behind:
  fresh-before-write — verify and fast-forward the checkout before the first write, never after
When starting work the repository or another session may already cover:
  base-branch-is-the-record — read the base branch before starting and before the PR
  lease-in-flight-work — lease slow, costly or external work on a branch; its tool checks the board first
  search-by-purpose — search by purpose and by mechanism before concluding nothing exists
When tracking state several documents must agree on:
  registry-source-of-truth — state lives in one machine-readable registry; documents derive
When writing a deliverable an outside reader will see:
  frame-from-audience-question — from the start, build it around the audience's question, not your material
  outward-summary-discipline — claims summary: claims-to-source table, honest sums, a recorded adversarial pass
When writing a rule that depends on the outside world:
  volatile-rules-carry-dates — it carries its date, inline
When writing or changing an automatic repair:
  repair-cannot-discard-work — it must never discard work; reporting is not repairing
When writing, running or reviewing a gate, audit, cache or heavy solve:
  gate-ledger — re-runs: record code, reads and result per unit; skip a unit whose fact holds
  gates-fail-fast — cheap checks first; a failure skips the slow ones and stops the work beside it
  review-against-a-contract — skip/cache/hold/refuse code: one-line contract; a finding counts once reproduced
  shared-result-cache — share code-keyed memos on a cache branch; a peer waits on a leased solve
  slow-steps-report-and-cache — over a minute: print elapsed and remaining; cache a heavy solve to disk
When writing, triaging or doing work on an open item:
  item-closes-on-its-condition — record findings in the item; close only on its condition
  todo-is-a-handoff — queue only for a stated blocked-on/out-of-scope reason; else just do it

(More on-demand practices are not listed here: one whose applies_to names real paths, or which declares a gate, is reached by those channels instead -- `precedent_paths.py FILE` and `precedent_gate.py MOMENT`. A trigger a PERSON SAYS cannot be reached that way and is always listed above. `precedent_show.py --index-omitted` names the omitted ones.)
```

## Standing instruction

Before starting work of a kind named in the occasion index above, run `python3 tools/precedent_show.py SLUG` for each listed slug to load its Rule. When editing a file, `python3 tools/precedent_paths.py FILE` prints any on-demand practice whose `applies_to` matches it, without needing the index at all. At a named moment — merging a branch, reviewing work, before pushing, ending a turn and writing the reply — run `python3 tools/precedent_gate.py merge|review|push|reply`: some practices fire at a moment rather than in a file, and no path glob reaches those. If `.precedent/SESSION_PRACTICES.md` exists, read it too: it carries the practices in force from the other sources this repo declares, which are NOT in this block and bind work here exactly as these do. It is regenerated at session start and is deliberately untracked — never commit it or quote it into a pull request.

<!-- END GENERATED -->

<!-- The block above is written by `python3 tools/precedent_sync_views.py --repo .`
     (INSTALL.md §0 step 6) — never hand-edit between the markers; the
     regeneration check fails loudly on drift. Leave the markers themselves
     exactly as shown, on their own lines, with nothing between them until
     the tool fills them in. -->

## Where things are (quick index — check here BEFORE searching the repo)

<!-- Add a row whenever a session is observed hunting for something (practice `quick-index`). -->

| Looking for… | Go to |
|---|---|
| Canonical names for gematria/extension concepts — use these names, don't invent new ones | [GLOSSARY.md](GLOSSARY.md) |
| The extension source and its builder | [extension/](extension/), built by [build/build.sh](build/build.sh) |
| Store packages ready for upload | `dist/` (generated — see [README.md](README.md)) |
| Marketing/store-listing copy and assets | [marketing/](marketing/) |
| Open items: analyses, verifications, decisions | [TODO.md](TODO.md) |
| Which practice sources are in force, and where each is vendored or resolved from | [precedent.json](precedent.json) |
| The vendored universal practice catalogue and its manifest | [process/upstream/](process/upstream/), [process/manifest.json](process/manifest.json) |

## Extension build workflow

`extension/` is the single source of truth: one shared `content.js` plus one
manifest per browser (`manifest.chrome.json`, `manifest.firefox.json`) — the
extension logic is identical between browsers, only manifest metadata
differs. `build/build.sh` assembles `dist/chrome/` and `dist/firefox/` from
`extension/` and packages the Chrome `.zip` and Firefox `.xpi`. Never hand-edit
anything under `dist/` — it is generated and gets wiped (`rm -rf`) on every
build; edit `extension/` and rebuild.

Bump the `version` field in **both** `extension/manifest.chrome.json` and
`extension/manifest.firefox.json` before cutting a release, then re-run
`./build/build.sh`.

### Session start

- At session start, run `bash tools/bootstrap.sh` before other work. Claude
  Code runs it for you from its SessionStart hook, on the web and
  locally (locally it skips the package install and the machine-wide git
  setup); in other harnesses, run it yourself unless your adapter wires it — Precedent's
  [templates/harness/](https://github.com/alex137/BestPractice/tree/main/templates/harness)
  says which can.
- **Keep `AGENTS.md`'s generated block current.** Before relying on it,
  run `python3 tools/precedent_sync_views.py --repo . --check` — it exits non-zero
  if any declared source (`precedent.json`) has moved since the block was
  last regenerated. Re-run without `--check` to refresh it, review the
  diff, and commit.

### Two check levels

<!-- practice `two-check-levels`. Rename the two levels if your team prefers
     other words, but name them somewhere fixed and say which gates what —
     the point is that "run the check" resolves to one thing without a
     session re-deriving it. Add your own repo's audits to the deep check. -->

- **Light check** — `python3 tools/doc_lint.py` on the markdown you touched.
  Fast, run before every commit without thinking about it. Gates a commit.
- **Deep check** — the full suite: `python3 tools/precedent_check.py`,
  `python3 tools/precedent_sync_views.py --repo . --check`, and
  `python3 tools/practice_audit.py` (the vendored catalogue's manifest).
  Gates a push and a merge. `bash tools/checks/tests/run_all.sh` runs the
  tests materialized from this repo's sources and names each failing test's
  source: a failing one is that source's bug, fixed and reported there —
  never noted here as pre-existing.

### Build-environment gotchas — do NOT rediscover these

Environment and tooling traps are written down one per file under
[gotchas/](gotchas/), each with what failed, what it cost, and the fix
(practice `environment-gotchas`). **None of that catalogue is copied into
this file**: hit a confusing, hard-to-explain failure, and before
concluding it is new, grep for it —
`grep -ril '<a keyword from what you are seeing>' gotchas/`. Add one as
`gotchas/gotcha-<date>-<slug>.md` with `## Symptom`, `## Story` and
`## Fix`, and mirror its fix into the bootstrap script (practice
`session-bootstrap`) so it applies itself. The bullets below are standing
instructions for this repo, not gotchas.


<!-- INSTALL.md §0 step 3 / §1 step 9: if the administrator answered yes to a
     team and/or individual practice source, add the bullet below (drop
     whichever half doesn't apply) BEFORE the bootstrap-script bullet above,
     not after — the access grant has to happen before anything tries to
     clone. Fill in the real repo name(s); keep the wording, since it's
     answering a failure mode that already happened once for real (a first
     pass at this wrote "ask to add the repo" instead of just calling it,
     which meant it only ever got fixed when a human happened to notice a
     session-start failure — see spec/MIGRATING_EXISTING_INSTALLS.md's step
     4 upstream for the incident). Do NOT weaken "no asking first" to
     something softer; that softening is the exact mistake this bullet
     exists to prevent. -->

- **A brand-new session on this repo alone has no git read access to
  the person's individual practice set** (Morgan's is `precedent-individual`)
  — the shared sets `precedent.json` declares are public and clone without
  it. Session repo access is
  scoped per session, never inherited just because `precedent.json` or a
  bootstrap hook names a repo. No token or secret is involved: the tool
  that grants a session this access rides the same GitHub identity already
  behind the session, so it only ever succeeds because that person is
  already a collaborator on the target repo. **At the very start of every
  session, before running `tools/bootstrap.sh`, call that tool for the
  individual set of the person driving the session — silently, with no
  confirmation needed first.** This is a read-only
  scope extension, not a credential or production change. Never write this
  as "if the clone fails, ask to add the repo" — that only works when a
  human happens to be watching for the failure, and the whole point is
  that a person only ever attaches the one repo they're actually working
  in; reaching for the others is this session's own job, every time.
  **Attach the individual set, and keep one clone of it** (practice
  `attach-never-clone-individual`). The attach tool's reply says to clone
  it to `/home/user/<name>`. If the session-start hook got there first,
  that path is already a link to its clone and the clone command stops
  with "already exists": use the path as it is. If not, clone it there;
  the next bootstrap run points `~/.config/precedent/config.json` at that
  clone and links `~/precedent-individual` to it. Either path is the same
  tree. Never clone it anywhere else: a second copy is one nothing loads,
  and it drifts from the first within the hour. The shared sets are
  the other way round: each clone lives at the path `precedent.json`
  resolves, beside this repo, so clone it there if nothing has.


## Git / workflow

- Develop on a feature branch; open a PR; merge only when the user says so.
- **Start every thread by merging latest `origin/main` into your branch**;
  avoid two concurrent threads editing `extension/content.js` or the manifest
  files at the same time.

### Merging a thread branch (runbook — follow, don't improvise)

Conflicts in shared files are EXPECTED. The fast, safe path:

0. **Capture gate — before the merge, in the thread that did the work**
   (practice `capture-gate`): did this thread's work imply anything that must be
   captured — a document update, a registry entry, a decision record? Fold
   it now; the thread that built the rationale is the one that knows what to
   record.
   **0b. Export gate** (practice `practice-export-loop`): did this thread improve a *generic*
   practice — one that would hold in an unrelated repo, not just this
   one's own subject matter? Fold the abstracted form into this repo's own
   vendored copy of the universal source (`precedent.json`'s `universal`
   entry — see its `path`) and open it as an ordinary pull request directly
   against that source's own repo (https://github.com/alex137/BestPractice). **There is
   no local check-in mirror for this yet** — the candidate/promotion
   pipeline the loader's own catalogue uses internally
   (`tools/precedent_candidate.py` and friends, in the source repo's own
   `tools/`) is not wired into a fresh install as of this writing; a plain
   PR against the upstream repo is the real mechanism until it is. Then run
   `python3 tools/precedent_sync_views.py --repo .` locally to pick your own change
   back up once it lands upstream.
1. Fetch and merge the default branch locally.
2. Resolve by fixed per-file-class rules (practice `merge-runbook`):
   - Registries (`TODO.md`, `todo/`): **union** of both sides — never drop
     an entry or a status.
   - Logs / index files (`GLOSSARY.md`): **append-only — keep both sides'
     additions.**
   - Same content file edited on both sides (e.g. `extension/content.js`):
     keep both sides' text; renumber the side not yet referenced elsewhere.
   - **Renumbering is repo-wide:** when sections are renumbered, grep
     every doc — instructions, map, glossary, TODO, not just the content
     file itself — for the old numbers and update them in the same
     commit. Partial renumbers ship stale cross-references (observed
     2026-08: a reorganization updated an index row but left two stale
     section references standing in the instructions file).
   - **Generated outputs: never hand-merge.** The side matching the
     committed manifest wins; unshipped builds are deleted and rebuilt —
     for the `<!-- BEGIN GENERATED: precedent-loader -->` block above, that
     means re-running `python3 tools/precedent_sync_views.py --repo .`, never
     hand-resolving its own conflict markers; for `dist/`, a rebuild from
     `extension/` with `./build/build.sh`.
3. Run the audits — **all must pass before the merge commits**:
   `python3 tools/doc_lint.py`, `python3 tools/practice_audit.py`,
   `python3 tools/precedent_check.py` and
   `python3 tools/precedent_sync_views.py --repo . --check`.
4. Commit the merge, push, land per this repo's convention.

## Conventions

- **Sections are ordered by the reader's frequency, not the writer's**
  (practice `section-order-by-frequency`): everyday content first, rare
  cases last.
- **PR descriptions come from the diff, not the template** (practice
  `pr-template-honest-gates`): check a box only when it is true for this
  change.
- **Doc references are links** (practice `doc-references-are-links`): in-repo docs reference other
  repo files as relative markdown links, never bare backticked names. New
  text always links; a thread touching a document fixes the references in
  the parts it touches.
- **`≈`, not `~`, for "approximately"** — two stray tildes render as
  strikethrough on GitHub. Links stay plain markdown: GitHub strips
  `target=` and most other attributes from raw HTML anchors in rendered
  docs, so an "open in new tab" link can't work there (*as of 2026-08*).
  `python3 tools/doc_lint.py` checks these conventions on files changed vs
  the default branch; run it on what you touch before committing.
- **Volatile rules carry their dates** (practice `volatile-rules-carry-dates`): a rule that depends
  on the outside world (an external platform, someone else's algorithm, a
  tool quirk) carries *as of / verified `<date>`* inline, and a session
  that re-confirms it updates the date. The date is the contributor's
  local calendar date, not the agent's system clock — the two can
  disagree by a day depending on time of day and timezone; ask if it
  isn't already clear from context. Old + unverified in a shifting
  domain = re-verify before relying on it. Rules about model behavior also
  name the model they were verified on (a model upgrade = re-verify); a
  durable rule records its tenure and exceptions (*in effect since X; N
  exceptions, each under Y*) — its survival record is its authority.
- **Outward-facing documents use the reader's words** (practice
  `readers-vocabulary`): run it as its own pass after drafting.
- **Reply convention** (practice `reply-links-files`, reached by the
  `reply` gate): a reply that touched files ends with a "Files touched"
  list.
- **Commits are credited to the human driving the session.** Set the git
  author to the member's name and GitHub noreply email (ask **before the
  first commit** if you don't know who you're working for —
  `git commit --author="Name <ID+user@users.noreply.github.com>"`), and
  name yourself in a `Co-Authored-By:` trailer. The project's history
  must show people's contributions as theirs, not as the agent's; where a
  hosting platform forces its own committer identity, the author field
  still records the human. Hosted agent harnesses author commits as the
  agent unless told otherwise, so a session that never asks mis-attributes
  silently — a dependent repo's first member PRs all landed authored as
  the agent this way (*observed 2026-08 on hosted Claude Code sessions*).
  *(GitHub attributes by author email — verified 2026-08.)*
- **Open each session by pointing at what's new.** The shared project
  moves between a member's conversations, and nothing pushes updates into
  their old chats. At session start, run
  `python3 tools/precedent_whats_new.py`; if it reports days missing from
  the project's log, say so in one line (*"2 days of changes aren't in
  What's new yet -- say 'What's new?'"*). When they ask "what's new?",
  follow the `whats-new` practice. If their in-progress branch has fallen
  behind, offer to bring it up to date before continuing (ask, don't just
  do it — their branch may be mid-thought).

## Working in parallel (multi-member repos)

<!-- These conventions exist so several members' threads don't duplicate
     or silently trample each other's work. Keep them when instantiating;
     fill the sensitivities list with the team's real entries. -->

- **Claim before you start.** When a member takes on a `TODO.md` item (or
  any sizable change), mark the item claimed — *(claimed: NAME, date,
  branch)* — as the branch's first commit. Before starting any work,
  check `TODO.md` claims and the repo's open branches and PRs for overlap
  with what your member wants; if someone is already on it, say so before
  duplicating their work.
- **Flag changes to the people they matter to — inferred, not
  declared.** Before packaging changes for review, work out who has
  stakes in the diff and name them in the PR description, requesting
  their review instead of letting the change ride a routine merge.
  Nobody has to articulate their sensitivities up front; two sources
  reveal them:
  1. **Authorship.** Commits are credited to the humans who drove them
     (see Conventions), so the history says whose work a diff reworks —
     substantially rewriting or re-toning text another member authored
     gets flagged to that member by default.
  2. **The accumulated list below,** which agents maintain from
     evidence: when a member pushes back in review, reverts a change, or
     objects in conversation, that session appends a one-line entry —
     what this member wants flagged, citing the incident that showed it
     (practice `cite-the-incident`). Members may seed entries directly, but the list grows
     mainly by observation.

  (For path-based ownership, GitHub's CODEOWNERS enforces review
  requests natively — as of 2026-08. The list also covers concerns no
  path expresses, like tone.)
- **Warn your own member first.** Before proposing, compare their change
  against the project's recorded decisions, glossary, and prevailing
  tone. If it cuts against something already decided or established, tell
  them — "this conflicts in spirit with X; propose anyway, or discuss?" —
  rather than packaging it silently. Disagreement then happens in review,
  on purpose, not by surprise.

### Review sensitivities (accumulated)

<!-- Maintained by agents as evidence accumulates: one line per member
     per concern, each citing the incident that revealed it. Seed entries
     are welcome but not required — authorship-based flagging works from
     day one with an empty list. -->


## Administrator requests you must know how to handle

<!-- These are conversational workflows the administrator triggers by
     plain phrases. Guide them end-to-end in plain language — they may
     not be a programmer. Keep this section when instantiating. -->

- **"What's waiting for me?"** (or "review pending changes") — the
  administrator's review loop, entirely in conversation:
  1. List the open PRs, plus any branches ahead of the default branch
     with no PR yet. For each: a plain-language summary — what changed,
     who drove it, and any hits against the review sensitivities or the
     spirit check (see Working in parallel).
  2. Point out proposals that collide with each other; offer to
     integrate colliding proposals and show the combined result before
     anything merges.
  3. Take the verdict in chat — approve (merge, with required checks
     passing), adjust-then-merge, or send back — and record the
     reasoning in the PR conversation either way.
  4. Merge only what the administrator has approved in conversation,
     unless they have told you a category of change is routine for them.
- **"Add project members"** — guide the administrator through the whole
  thing:
  1. Ask, in one message: the member's GitHub username (or email), what
     they'll work on, and which AI tool they use (Claude, Codex, ChatGPT,
     Gemini, Grok, other).
  2. Give the exact GitHub steps to grant access — for a personal repo:
     repository **Settings → Collaborators → Add people**; in an
     organization, their existing team flow. One sentence on the choice:
     read access lets the member's assistant answer questions; write
     access lets it propose changes (which still need approval to join
     the project).
  3. Generate a short personal welcome message the administrator can
     paste into email or chat: greet the member by name, one sentence on
     what the project is, the link to this repository's
     [GETTING_STARTED.md](GETTING_STARTED.md) naming the section for their tool, and one
     suggested first task drawn from `TODO.md`.
  4. Confirm there is nothing else to install or configure — once access
     exists, the member's Getting Started section is everything they
     need.

## Practice sources — Precedent loader (policy)

<!-- The loader variant of the old "Practice export — Precedent
     (policy)" section: precedent.json + a vendored universal copy,
     instead of process/upstream/. -->

- `precedent.json` declares every practice source in force here — see
  [INSTALL.md §0](process/upstream/INSTALL.md) for the resolution and
  precedence rules. The `universal` source is a **real vendored copy** at
  `process/upstream/` (this repo's classic install, migrated onto the loader
  2026-10-01), not a live reference — every
  collaborator and every fresh container needs it without a sibling
  checkout. The `shared` sources resolve live from sibling clones instead
  (never vendored — see INSTALL.md §0 step 3).
- **Public-safe invariant, if this repo is public and the universal
  source's upstream is too:** nothing proprietary may appear under the
  vendored universal path, ever — the same invariant the classic vendored
  model enforced with `practice_audit.py`, which still runs here against
  [process/manifest.json](process/manifest.json). This repo is already
  public (published to the Chrome Web Store and Firefox Add-ons), so there
  is no private vocabulary to guard and no `process/scrub_blocklist.txt`.
- `python3 tools/precedent_sync_views.py --repo . --check` is this repo's own
  drift gate — run it before trusting `AGENTS.md`'s generated block, and
  after any source's vendored copy or `precedent.json` itself changes.
- Export gate = merge runbook step 0b, above.
