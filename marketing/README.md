# Marketing materials

Home for the assets and copy used on the Chrome Web Store and Firefox
Add-ons (AMO) listing pages, kept alongside the extension source so they
stay versioned with the code that shipped them.

- `icon/` — the store icon (source file + exports used in the package).
- `screenshots/` — listing screenshots for the Chrome Web Store / AMO
  dashboards.
- `store-listing/` — draft listing copy (description, category, etc.) for
  each store's dashboard.

## Status

- **Icon**: `icon/icon-master-PLACEHOLDER.png` is a placeholder generated
  for this packaging pass, not the real published icon. Replace it with
  the actual source artwork, then regenerate `extension/icons/*.png` (see
  the top-level README's packaging steps) and rebuild the `.zip`/`.xpi`.
- **Screenshots**: none checked in yet — see `screenshots/README.md`.
