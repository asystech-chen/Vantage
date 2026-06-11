# pref-pane

This folder replaces the original big pref-pane.patch,
the original patch is moved into the `patches/removed-patches` folder.
This new solution should make it much easier for everyone to edit
the LibreWolf preferences.

---

`librewolf.inc.xhtml`:

Contains the html elements that make up the preferences UI.
Example, a check to 'enable Firefox sync'.
In this example there is a html snippet that uses only
the `identity.fxaccounts.enabled` setting, so no JavaScript needed.

---

`librewolf.js`:

Other code called by the UI elements.

---

`preferences.ftl`:

In our running `xhtml` example, we have a string
ID `data-l10n-id="librewolf-sync-checkbox"` that we can find in our`.ftl` file.

## Notes

New files, these contain all the logic for the `pref-pane`:

- `category-librewolf.svg` -> `browser/themes/shared/preferences/category-librewolf.svg`
- `librewolf.css` -> `browser/themes/shared/preferences/librewolf.css`
- `librewolf.inc.xhtml` -> `browser/components/preferences/librewolf.inc.xhtml`
- `librewolf.js` -> `browser/components/preferences/librewolf.js`

---

Appending these string values to the original `preferences.ftl`:

- `preferences.ftl` -> `browser/locales/en-US/browser/preferences/preferences.ftl`
