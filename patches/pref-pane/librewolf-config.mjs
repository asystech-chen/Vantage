/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/. */

import { SettingGroupManager } from "chrome://browser/content/preferences/config/SettingGroupManager.mjs";

SettingGroupManager.registerGroups({
  vantageCustom: {
    items: [
      { id: "vantageUpdateCheck", l10nId: "vantage-update-checkbox" },
      { id: "vantageAiSidebar", l10nId: "vantage-ai-checkbox" },
    ],
  },
  librewolfBehavior: {
    items: [
      { id: "librewolfExtensionUpdate", l10nId: "librewolf-extension-update-checkbox" },
      { id: "librewolfSync", l10nId: "librewolf-sync-checkbox" },
      { id: "librewolfMiddleClick", l10nId: "librewolf-autocopy-checkbox" },
      { id: "librewolfUserChrome", l10nId: "librewolf-styling-checkbox" },
    ],
  },
  librewolfNetworking: {
    items: [
      { id: "librewolfIPv6", l10nId: "librewolf-ipv6-checkbox" },
      { id: "librewolfCrossOrigin", l10nId: "librewolf-xorigin-ref-checkbox" },
    ],
  },
  librewolfPrivacy: {
    items: [
      { id: "librewolfRFP", l10nId: "librewolf-rfp-checkbox" },
      { id: "librewolfLetterboxing", l10nId: "librewolf-letterboxing-checkbox" },
    ],
  },
  librewolfFingerprinting: {
    items: [
      { id: "librewolfWebGLPrompt", l10nId: "librewolf-webgl-checkbox" },
      { id: "librewolfWebGLPromptHide", l10nId: "librewolf-webgl-hide-checkbox" },
    ],
  },
});
