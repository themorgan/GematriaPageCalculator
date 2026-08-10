# Repository map — where to find things

**Purpose:** orientation for any thread picking up work here. The repo's key
deliverable is the Gematria Page Calculator browser extension, and this map
indexes it down to the documents and sources that back it.

Companions: [AGENTS.md](AGENTS.md) (build machinery + workflow — read before
touching `extension/` or `build/`), [TODO.md](TODO.md) (open items across
sessions).

## Top-level layout

| Path | What it is |
|---|---|
| [GLOSSARY.md](GLOSSARY.md) | **Canonical names** — the one list. Use its names; don't invent new ones. |
| `extension/` | Shared source: `content.js` (all annotation logic) and the per-browser manifests. This is the deliverable's single source of truth. |
| `build/` | `build.sh`, the builder that assembles `dist/` and the store packages from `extension/`. |
| `dist/` | Generated build output (Chrome/Firefox unpacked dirs + the `.zip`/`.xpi` store uploads) — never hand-edited, see [README.md](README.md). |
| `marketing/` | Store listing assets and copy (icon, screenshots, promo tiles) — see `marketing/README.md`. |
| `process/` | Practice layer (vendored BestPractice + manifest) — see [AGENTS.md](AGENTS.md) "Practice export". |
| `TODO.md` | Cross-session open items. |

## The extension

| Part | Backed by |
|---|---|
| Annotation logic (English/Latin + Hebrew gematria) | [extension/content.js](extension/content.js) |
| Chrome manifest (MV3) | [extension/manifest.chrome.json](extension/manifest.chrome.json) |
| Firefox manifest (MV3, incl. gecko id) | [extension/manifest.firefox.json](extension/manifest.firefox.json) |
| Icons (16/32/48/128) | `extension/icons/` |
| Build/package script | [build/build.sh](build/build.sh) |
| Store listings | Chrome Web Store, Firefox Add-ons — links in [README.md](README.md) |
