# Marketing materials

Home for the assets and copy used on the Chrome Web Store and Firefox
Add-ons (AMO) listing pages, kept alongside the extension source so they
stay versioned with the code that shipped them.

- `icon/` — the store icon (source file + exports used in the package).
- `screenshots/` — listing screenshots for the Chrome Web Store / AMO
  dashboards.
- `store-listing/` — draft listing copy (description, category, etc.) for
  each store's dashboard, plus the Chrome Web Store promo tile images.

## Status

- **Icon**: finalized. `icon/icon-master.png` (512x512) is the source
  artwork; `icon/icon16.png`, `icon32.png`, `icon48.png`, and
  `icon128.png` are the exports, matching the copies under
  `extension/icons/` that the manifests reference.
- **Screenshots**: one checked in — see `screenshots/README.md`.
- **Store promo tiles**: `store-listing/Gematria - marquee promo tile.png`
  (1400x560) and `store-listing/Gematria - small promo title.png`
  (440x280) are checked in for the Chrome Web Store dashboard's optional
  promo image fields.
