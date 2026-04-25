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

Preferences.addAll([
  // Vantage Update Check
  { id: "vantage.updateCheck.enabled", type: "bool" },
  // AI Sidebar
  { id: "browser.ml.chat.enabled", type: "bool" },
  { id: "browser.ai.control.sidebarChatbot", type: "string" },
  // IPv6
  { id: "network.dns.disableIPv6", type: "bool" },
  // Firefox Accounts
  { id: "identity.fxaccounts.enabled", type: "bool" },
  // WebGL
  { id: "webgl.disabled", type: "bool" },
  // Automatically Update Extensions
  { id: "extensions.update.enabled", type: "bool" },
  { id: "extensions.update.autoUpdateDefault", type: "bool" },
  // Clipboard autocopy/paste
  { id: "clipboard.autocopy", type: "bool" },
  { id: "middlemouse.paste", type: "bool" },
  // XOrigin referrers
  { id: "network.http.referer.XOriginPolicy", type: "int" },
  // Harden
  { id: "privacy.resistFingerprinting.letterboxing", type: "bool" },
  // Google Safe Browsing
  { id: "browser.safebrowsing.malware.enabled", type: "bool" },
  { id: "browser.safebrowsing.phishing.enabled", type: "bool" },
  { id: "browser.safebrowsing.blockedURIs.enabled", type: "bool" },
  { id: "browser.safebrowsing.provider.google4.gethashURL", type: "string" },
  { id: "browser.safebrowsing.provider.google4.updateURL", type: "string" },
  { id: "browser.safebrowsing.provider.google.gethashURL", type: "string" },
  { id: "browser.safebrowsing.provider.google.updateURL", type: "string" },
  { id: "browser.safebrowsing.downloads.enabled", type: "bool" },
  // UserChrome
  { id: "toolkit.legacyUserProfileCustomizations.stylesheets", type: "bool" },
]);

// ===== VANTAGE CUSTOM: Update Check =====
Preferences.addSetting({
  id: "vantageUpdateCheck",
  pref: "vantage.updateCheck.enabled",
});

// ===== VANTAGE CUSTOM: AI Sidebar =====
// Sync browser.ml.chat.enabled + browser.ai.control.sidebarChatbot
Preferences.addSetting({
  id: "vantageAiSidebar",
  pref: "browser.ml.chat.enabled",
  deps: ["browser.ai.control.sidebarChatbot"],
  set: (value, deps) => {
    deps["browser.ai.control.sidebarChatbot"].value = value ? "available" : "blocked";
    return value;
  },
});

// ===== Extension Updates =====
Preferences.addSetting({
  id: "librewolfExtensionUpdateEnabled",
  pref: "extensions.update.enabled",
});
Preferences.addSetting({
  id: "librewolfExtensionAutoUpdateEnabled",
  pref: "extensions.update.autoUpdateDefault",
});
Preferences.addSetting({
  id: "librewolfExtensionUpdate",
  deps: ["librewolfExtensionUpdateEnabled", "librewolfExtensionAutoUpdateEnabled"],
  get: (_, deps) => deps.librewolfExtensionUpdateEnabled.value && deps.librewolfExtensionAutoUpdateEnabled.value,
  set: (value, deps) => {
    deps.librewolfExtensionUpdateEnabled.value = value;
    deps.librewolfExtensionAutoUpdateEnabled.value = value;
  },
});

// ===== Firefox Sync =====
Preferences.addSetting({
  id: "librewolfSync",
  pref: "identity.fxaccounts.enabled",
  onUserChange() {
    confirmRestartPrompt(
      Services.prefs.getBoolPref("identity.fxaccounts.enabled"),
      1,
      true,
      false
    ).then(buttonIndex => {
      if (buttonIndex == CONFIRM_RESTART_PROMPT_RESTART_NOW) {
        Services.startup.quit(
          Ci.nsIAppStartup.eAttemptQuit | Ci.nsIAppStartup.eRestart
        );
        return;
      }
    });
  }
});

// ===== Clipboard & Middle Click =====
Preferences.addSetting({
  id: "librewolfAutocopy",
  pref: "clipboard.autocopy",
});
Preferences.addSetting({
  id: "librewolfPaste",
  pref: "middlemouse.paste",
});
Preferences.addSetting({
  id: "librewolfMiddleClick",
  deps: ["librewolfAutocopy", "librewolfPaste"],
  get: (_, deps) => deps.librewolfAutocopy.value && deps.librewolfPaste.value,
  set: (value, deps) => {
    deps.librewolfAutocopy.value = value;
    deps.librewolfPaste.value = value;
  },
});

// ===== UserChrome CSS =====
Preferences.addSetting({
  id: "librewolfUserChrome",
  pref: "toolkit.legacyUserProfileCustomizations.stylesheets",
});

// ===== IPv6 =====
Preferences.addSetting({
  id: "librewolfIPv6",
  pref: "network.dns.disableIPv6",
  get: (value) => !value,
  set: (value) => !value,
});

// ===== Cross-Origin Referrers =====
Preferences.addSetting({
  id: "librewolfCrossOrigin",
  pref: "network.http.referer.XOriginPolicy",
  get: (value) => value >= 1,
  set: (value) => value ? 2 : 0,
});

// ===== Resist Fingerprinting =====
Preferences.addSetting({
  id: "librewolfRFP",
  pref: "privacy.resistFingerprinting",
});
Preferences.addSetting({
  id: "librewolfLetterboxing",
  pref: "privacy.resistFingerprinting.letterboxing",
});

// ===== WebGL =====
Preferences.addSetting({
  id: "librewolfWebGL",
  pref: "webgl.disabled",
  get: (value) => !value,
  set: (value) => !value,
});

// ===== Google Safe Browsing =====
Preferences.addSetting({
  id: "librewolfSafeBrowsing",
  deps: [
    "browser.safebrowsing.malware.enabled",
    "browser.safebrowsing.phishing.enabled",
    "browser.safebrowsing.blockedURIs.enabled",
    "browser.safebrowsing.provider.google4.gethashURL",
    "browser.safebrowsing.provider.google4.updateURL",
    "browser.safebrowsing.provider.google.gethashURL",
    "browser.safebrowsing.provider.google.updateURL",
  ],
  get: (_, deps) => {
    const onVals = [
      true,
      true,
      true,
      "https://safebrowsing.googleapis.com/v4/fullHashes:find?$ct=application/x-protobuf&key=%GOOGLE_SAFEBROWSING_API_KEY%&$httpMethod=POST",
      "https://safebrowsing.googleapis.com/v4/threatListUpdates:fetch?$ct=application/x-protobuf&key=%GOOGLE_SAFEBROWSING_API_KEY%&$httpMethod=POST",
      "https://safebrowsing.google.com/safebrowsing/gethash?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2",
      "https://safebrowsing.google.com/safebrowsing/downloads?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2&key=%GOOGLE_SAFEBROWSING_API_KEY%",
    ];
    for (let i = 0; i < deps.length; i++) {
      if (deps[i].value !== onVals[i]) {
        return false;
      }
    }
    return true;
  },
  set: (value, deps) => {
    const onVals = [
      true,
      true,
      true,
      "https://safebrowsing.googleapis.com/v4/fullHashes:find?$ct=application/x-protobuf&key=%GOOGLE_SAFEBROWSING_API_KEY%&$httpMethod=POST",
      "https://safebrowsing.googleapis.com/v4/threatListUpdates:fetch?$ct=application/x-protobuf&key=%GOOGLE_SAFEBROWSING_API_KEY%&$httpMethod=POST",
      "https://safebrowsing.google.com/safebrowsing/gethash?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2",
      "https://safebrowsing.google.com/safebrowsing/downloads?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2&key=%GOOGLE_SAFEBROWSING_API_KEY%",
    ];
    const offVals = [false, false, false, "", "", "", ""];
    const writeVals = value ? onVals : offVals;
    for (let i = 0; i < deps.length; i++) {
      const type = typeof writeVals[i];
      if (type === "number") {
        Services.prefs.setIntPref(deps[i].pref, writeVals[i]);
      } else if (type === "boolean") {
        Services.prefs.setBoolPref(deps[i].pref, writeVals[i]);
      } else if (type === "string") {
        Services.prefs.setCharPref(deps[i].pref, writeVals[i]);
      }
    }
  },
});

Preferences.addSetting({
  id: "librewolfSafeBrowsingDownloads",
  pref: "browser.safebrowsing.downloads.enabled",
});

// ===== Helper Functions =====
function openProfileDirectory() {
  let currProfD = Services.dirsvc.get("ProfD", Ci.nsIFile);
  let profileDir = currProfD.path;
  let nsLocalFile = Components.Constructor(
    "@mozilla.org/file/local;1",
    "nsIFile",
    "initWithPath"
  );
  new nsLocalFile(profileDir).reveal();
}

function openAboutConfig() {
  window.open("about:config", "_blank");
}

var gLibrewolfPane = {
  _pane: null,

  init() {
    this._pane = document.getElementById("paneLibrewolf");

    initSettingGroup("vantageGroup");
    initSettingGroup("librewolfBehavior");
    initSettingGroup("librewolfNetworking");
    initSettingGroup("librewolfPrivacy");
    initSettingGroup("librewolfFingerprinting");
    initSettingGroup("librewolfSecurity");

    setEventListener("librewolf-open-profile", "command", openProfileDirectory);
    setEventListener("librewolf-config-link", "click", openAboutConfig);

    Services.obs.notifyObservers(window, "librewolf-pane-loaded");
  },
};
