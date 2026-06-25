/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/. */

/* import-globals-from extensionControlled.js */
/* import-globals-from preferences.js */

ChromeUtils.defineLazyGetter(this, "L10n", () => {
  return new Localization([
    "branding/brand.ftl",
    "browser/preferences/preferences.ftl",
  ]);
});

  const prefsToAdd = [
  { id: "vantage.updateCheck.enabled", type: "bool" },
  { id: "browser.ml.chat.enabled", type: "bool" },
  { id: "browser.ai.control.sidebarChatbot", type: "string" },
  { id: "network.dns.disableIPv6", type: "bool" },
  { id: "identity.fxaccounts.enabled", type: "bool" },
  { id: "webgl.disabled", type: "bool" },
  { id: "extensions.update.enabled", type: "bool" },
  { id: "extensions.update.autoUpdateDefault", type: "bool" },
  { id: "clipboard.autocopy", type: "bool" },
  { id: "middlemouse.paste", type: "bool" },
  { id: "network.http.referer.XOriginPolicy", type: "int" },
  { id: "privacy.resistFingerprinting.letterboxing", type: "bool" },
  { id: "browser.safebrowsing.blockedURIs.enabled", type: "bool" },
  { id: "browser.safebrowsing.provider.google4.gethashURL", type: "string" },
  { id: "browser.safebrowsing.provider.google4.updateURL", type: "string" },
  { id: "browser.safebrowsing.provider.google.gethashURL", type: "string" },
  { id: "browser.safebrowsing.provider.google.updateURL", type: "string" },
  { id: "toolkit.legacyUserProfileCustomizations.stylesheets", type: "bool" },
  { id: "toolkit.tabbox.switchByScrolling", type: "bool" },
  { id: "browser.tabs.closeTabByDblclick", type: "bool" },
  { id: "browser.urlbar.openintab", type: "bool" },
  { id: "browser.tabs.loadBookmarksInTabs", type: "bool" },
  { id: "browser.search.openintab", type: "bool" },
  { id: "browser.ctrlTab.sortByRecentlyUsed", type: "bool" },
  { id: "media.peerconnection.ice.default_address_only", type: "bool" },
  { id: "layout.css.font-visibility.level", type: "int" },
];
  for (let p of prefsToAdd) {
    try { Preferences.add(p); } catch (e) { /* already registered */ }
  }

var gLibrewolfPane = {
  _pane: null,

  // called when the document is first parsed
  init() {
    this._pane = document.getElementById("paneVantage");

    // Set all event listeners on checkboxes
    // AI Sidebar: sync browser.ml.chat.enabled + browser.ai.control.sidebarChatbot
    setSyncFromPrefListener("vantage-ai-checkbox", () =>
      Services.prefs.getBoolPref("browser.ml.chat.enabled", false)
    );
    setSyncToPrefListener("vantage-ai-checkbox", () => {
      let checked = document.getElementById("vantage-ai-checkbox").checked;
      Services.prefs.setBoolPref("browser.ml.chat.enabled", checked);
      Services.prefs.setCharPref(
        "browser.ai.control.sidebarChatbot",
        checked ? "available" : "blocked"
      );
      return checked;
    });
    Preferences.get("browser.ml.chat.enabled").on("change", () =>
      makeMasterCheckboxesReactive("vantage-ai-checkbox", () =>
        Services.prefs.getBoolPref("browser.ml.chat.enabled", false)
      )
    );
    setBoolSyncListeners(
      "vantage-update-checkbox",
      ["vantage.updateCheck.enabled"],
      [true],
    );
    setBoolSyncListeners(
      "librewolf-extension-update-checkbox",
      ["extensions.update.autoUpdateDefault", "extensions.update.enabled"],
      [true,                                  true                       ],
    );
    setBoolSyncListeners(
      "librewolf-ipv6-checkbox",
      ["network.dns.disableIPv6"],
      [false,                   ],
    );
    setBoolSyncListeners(
      "librewolf-sync-checkbox",
      ["identity.fxaccounts.enabled"],
      [true,                   ],
    );
    setBoolSyncListeners(
      "librewolf-autocopy-checkbox",
      ["clipboard.autocopy", "middlemouse.paste"],
      [true,                 true               ],
    );
    setBoolSyncListeners(
      "librewolf-styling-checkbox",
      ["toolkit.legacyUserProfileCustomizations.stylesheets"],
      [true,                                                ],
    );

    setBoolSyncListeners(
      "librewolf-tabs-scroll-checkbox",
      ["toolkit.tabbox.switchByScrolling"],
      [true],
    );
    setBoolSyncListeners(
      "librewolf-tabs-dblclick-checkbox",
      ["browser.tabs.closeTabByDblclick"],
      [true],
    );
    setBoolSyncListeners(
      "librewolf-tabs-urlbar-checkbox",
      ["browser.urlbar.openintab"],
      [true],
    );
    setBoolSyncListeners(
      "librewolf-tabs-bookmarks-checkbox",
      ["browser.tabs.loadBookmarksInTabs"],
      [true],
    );
    setBoolSyncListeners(
      "librewolf-tabs-search-checkbox",
      ["browser.search.openintab"],
      [true],
    );
    setBoolSyncListeners(
      "librewolf-tabs-ctrlTab-checkbox",
      ["browser.ctrlTab.sortByRecentlyUsed"],
      [true],
    );

    // font-visibility uses int pref (0=all, 1=base, 2=lang), sync manually
    setSyncFromPrefListener("librewolf-font-vis-checkbox", () => {
      return Services.prefs.getIntPref("layout.css.font-visibility.level", 0) >= 1;
    });
    setSyncToPrefListener("librewolf-font-vis-checkbox", () => {
      let checked = document.getElementById("librewolf-font-vis-checkbox").checked;
      Services.prefs.setIntPref("layout.css.font-visibility.level", checked ? 1 : 0);
      return checked;
    });
    Preferences.get("layout.css.font-visibility.level").on("change", () => {
      makeMasterCheckboxesReactive("librewolf-font-vis-checkbox", () =>
        Services.prefs.getIntPref("layout.css.font-visibility.level", 0) >= 1
      );
    });

    setBoolSyncListeners(
      "librewolf-webrtc-ip-checkbox",
      ["media.peerconnection.ice.default_address_only"],
      [true],
    );

    setBoolSyncListeners(
      "librewolf-webgl-checkbox",
      ["webgl.disabled"],
      [false           ],
    );
    setBoolSyncListeners(
      "librewolf-rfp-checkbox",
      ["privacy.resistFingerprinting"],
      [true                          ],
    );

    setBoolSyncListeners(
      "librewolf-letterboxing-checkbox",
      ["privacy.resistFingerprinting.letterboxing"],
      [true                                       ],
    );

    setSyncListeners(
      "librewolf-goog-safe-checkbox",
      [
        "browser.safebrowsing.malware.enabled",
        "browser.safebrowsing.phishing.enabled",
        "browser.safebrowsing.blockedURIs.enabled",
        "browser.safebrowsing.provider.google4.gethashURL",
        "browser.safebrowsing.provider.google4.updateURL",
        "browser.safebrowsing.provider.google.gethashURL",
        "browser.safebrowsing.provider.google.updateURL",
      ],
      [
        true,
        true,
        true,
        "https://safebrowsing.googleapis.com/v4/fullHashes:find?$ct=application/x-protobuf&key=%GOOGLE_SAFEBROWSING_API_KEY%&$httpMethod=POST",
        "https://safebrowsing.googleapis.com/v4/threatListUpdates:fetch?$ct=application/x-protobuf&key=%GOOGLE_SAFEBROWSING_API_KEY%&$httpMethod=POST",
        "https://safebrowsing.google.com/safebrowsing/gethash?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2",
        "https://safebrowsing.google.com/safebrowsing/downloads?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2&key=%GOOGLE_SAFEBROWSING_API_KEY%",
      ],
      [
        false,
        false,
        false,
        "",
        "",
        "",
        "",
      ]
    );

    setXOriginPolicySyncListeners(
      "librewolf-xorigin-ref-checkbox",
      "network.http.referer.XOriginPolicy",
      [1, 2],
      [0]
    );

    // Notify observers that the UI is now ready
    Services.obs.notifyObservers(window, "librewolf-pane-loaded");
  },
};

function setXOriginPolicySyncListeners(checkboxid, pref, onVals, offVals) {
  setSyncFromPrefListener(checkboxid, () => onVals.includes(getPref(pref)));
  setSyncToPrefListener(checkboxid, () =>
    writeGenericPrefs([pref], [2], [0], document.getElementById(checkboxid).checked)
  );
  Preferences.get(pref).on("change", () =>
    makeMasterCheckboxesReactive(checkboxid, () =>
      onVals.includes(getPref(pref))
    )
  );
}


function setBoolSyncListeners(checkboxid, opts, vals) {
  setSyncFromPrefListener(checkboxid, () => readGenericBoolPrefs(opts, vals));
  setSyncToPrefListener(checkboxid, () => writeGenericBoolPrefs(opts, vals, document.getElementById(checkboxid).checked));
  for (let i = 0; i < opts.length; i++) {
    Preferences.get(opts[i]).on("change", () => makeMasterCheckboxesReactive(checkboxid, () => readGenericBoolPrefs(opts, vals)));
  }
}
function setSyncListeners(checkboxid, opts, onVals, offVals) {
  setSyncFromPrefListener(checkboxid, () => readGenericPrefs(opts, onVals, offVals));
  setSyncToPrefListener(checkboxid, () => writeGenericPrefs(opts, onVals, offVals, document.getElementById(checkboxid).checked));
  for (let i = 0; i < opts.length; i++) {
    Preferences.get(opts[i]).on("change", () => makeMasterCheckboxesReactive(checkboxid, () => readGenericPrefs(opts, onVals, offVals)));
  }
}

function makeMasterCheckboxesReactive(checkboxid, func) {
  const shouldBeChecked = func();
  document.getElementById(checkboxid).checked = shouldBeChecked;
}

// Wrapper function in case something more is required (as I suspected in the first iteration of this)
function getPref(pref) {
  const retval = Preferences.get(pref);
/*  if (retval === undefined) {
    return defaultValue;
  } */
  return retval._value;
}
// Returns true if all the preferences in prefs are equal to onVals, false otherwise TODO may need a third array for their default values because mozilla is dumb, after testing though pretty sure this was misinformation being spread by comments in default FF code that has long since been fixed
function readGenericBoolPrefs(prefs, onVals) {
  for (let i = 0; i < prefs.length; i++) {
    if (getPref(prefs[i]) != onVals[i]) {
      return false;
    }
  }
  return true;
}
function writeGenericBoolPrefs(opts, vals, changeToOn) {
  valsCopy = [...vals];
  if (!changeToOn) {
    for (let i = 0; i < vals.length; i++) {
      valsCopy[i] = !vals[i];
    }
  }
  // Start at 1 because returning sets the last one
  for (let i = 1; i < vals.length; i++) {
    Services.prefs.setBoolPref(opts[i], valsCopy[i]);
  }
  return valsCopy[0];
}

// Returns true if all the preferences in prefs are equal to onVals, false otherwise... currently the same as for Bool as offVals is ignored
function readGenericPrefs(prefs, onVals, offVals) {
  for (let i = 0; i < prefs.length; i ++) {
    let temp = getPref(prefs[i]);
    if (getPref(prefs[i]) != onVals[i]) {
      return false;
    }
  }
  return true;
}
function writeGenericPrefs(opts, onVals, offVals, changeToOn) {
  let writeArr = (changeToOn) ? onVals : offVals;
  for (let i = 1; i < opts.length; i++) {
    let type = typeof(writeArr[i]);
    if (type == "number") {
      Services.prefs.setIntPref(opts[i], writeArr[i]);
    } else if (type == "boolean") {
      Services.prefs.setBoolPref(opts[i], writeArr[i]);
    } else if (type == "string") {
      Services.prefs.setCharPref(opts[i], writeArr[i]);
    } else {
      console.log("BADNESS 10000");
    }
  }
  return writeArr[0];
}

Preferences.get("identity.fxaccounts.enabled").on("change", () => {
  confirmRestartPrompt(
    Services.prefs.getBoolPref("identity.fxaccounts.enabled"), // Restart is required to *enable* / *disable* the pref
    1, // Default Button Index
    true, // Cancel instead of Revert Button
    false // No Restart Later button
  ).then(buttonIndex => {
    if (buttonIndex == CONFIRM_RESTART_PROMPT_RESTART_NOW) {
      Services.startup.quit(
        Ci.nsIAppStartup.eAttemptQuit | Ci.nsIAppStartup.eRestart
      );
      return;
    }
  });
});
