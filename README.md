# Gematria Page Calculator

Chrome/Firefox extension that annotates every word on a page with its
gematria value, in English/Latin and Hebrew.

- **English/Latin**: simple a=1…z=26 letter-sum. Accented/diacritic
  letters (á, ñ, ç, ø, æ, ß, ł, đ, ħ, ı, ŀ, ð, þ, …) count as their base
  Latin letter, and stay part of the same word.
- **Hebrew**: traditional gematria (mispar hechrachi), including the five
  sofit (final-letter) forms at their large values (500–900).

Press **Ctrl+G** (**Cmd+G** on Mac) on any page to toggle the annotations
on and off. Everything runs locally in the page — no data is sent
anywhere.

Live listings:
- Chrome Web Store: https://chromewebstore.google.com/detail/gematria-page-calculator/mcedlmmghbjcclageaodhjbhgidhkngk
- Firefox Add-ons: https://addons.mozilla.org/en-US/firefox/addon/gematria-page-calculator/

## Repo layout

```
extension/               Shared source
  content.js              The content script (all annotation logic)
  manifest.chrome.json     Chrome (MV3) manifest
  manifest.firefox.json    Firefox (MV3) manifest, incl. gecko id
  icons/                   icon16/32/48/128.png used by both manifests

build/
  build.sh                 Assembles dist/chrome + dist/firefox and
                            packages the .zip / .xpi

dist/                     Build output (generated — see below)
  chrome/                  Unpacked Chrome extension
  firefox/                 Unpacked Firefox extension
  gematria-page-calculator-chrome-v<version>.zip    Chrome Web Store upload
  gematria-page-calculator-firefox-v<version>.xpi   AMO upload

marketing/                Store listing assets & copy (icon, screenshots,
                           draft dashboard text) — see marketing/README.md
```

There's a single shared `content.js` and one manifest per browser, since
the only difference between the two builds is manifest metadata (Firefox
needs `browser_specific_settings.gecko`); the extension logic itself is
identical.

## Building the store packages

```sh
./build/build.sh
```

This regenerates `dist/` from `extension/`, producing:

- `dist/gematria-page-calculator-chrome-v<version>.zip` — upload directly
  to the Chrome Web Store developer dashboard.
- `dist/gematria-page-calculator-firefox-v<version>.xpi` — upload directly
  to the Firefox Add-on Developer Hub (AMO).

Both archives already contain `manifest.json` at the archive root (not
nested in a subfolder), which is what both stores expect.

Bump the `version` field in `extension/manifest.chrome.json` **and**
`extension/manifest.firefox.json` before cutting a new release, then
re-run the build script.

## Loading unpacked for local testing

- **Chrome**: `chrome://extensions` → enable Developer mode → "Load
  unpacked" → select `dist/chrome/` (run `./build/build.sh` first).
- **Firefox**: `about:debugging#/runtime/this-firefox` → "Load Temporary
  Add-on…" → select `dist/firefox/manifest.json`.

## Marketing assets

- **Icon**: finalized (purple octagon, "G7" wordmark). Master source is
  `marketing/icon/icon-master.png` (512x512); `extension/icons/*.png` and
  `marketing/icon/icon*.png` are the matching 16/32/48/128 exports used by
  the manifests.
- **Screenshots**: one checked in under `marketing/screenshots/`
  (`screenshot - exodus_32_2 - 1280x800.png`). More can be added the same
  way.
- **Store promo tiles**: Chrome Web Store marquee (1400x560) and small
  (440x280) promo tiles are checked in under `marketing/store-listing/`.

See `marketing/README.md` for the full breakdown.
