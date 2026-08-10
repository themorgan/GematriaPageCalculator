# Canonical names

The one list of names for this project's domain terms and components.
**Use these names; don't invent new ones.** If two documents disagree with
this file, this file wins — fix the documents.

| Name | What it is | Defined in |
|---|---|---|
| Gematria | Assigning each letter a numeric value and summing a word's letters to get its value. | [README.md](README.md) |
| English/Latin gematria | This extension's simple a=1…z=26 letter-sum scheme. Accented/diacritic letters count as their base Latin letter and stay part of the same word. | [README.md](README.md) |
| Mispar hechrachi | Traditional Hebrew gematria scheme used by this extension, including the five sofit (final-letter) forms at their large values (500–900). | [README.md](README.md) |
| Sofit | A Hebrew letter's final form (used at the end of a word), valued 500–900 under mispar hechrachi. | [README.md](README.md) |
| Content script | `extension/content.js` — the single shared script containing all annotation logic, loaded by both the Chrome and Firefox builds. | [extension/content.js](extension/content.js) |
| Dist / store package | The generated, per-browser build output under `dist/` — never hand-edited, always rebuilt from `extension/`. | [README.md](README.md) |
