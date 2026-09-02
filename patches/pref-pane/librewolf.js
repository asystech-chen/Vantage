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

// Note: IOUtils is a native (WebIDL) global in Firefox 153+, no import needed.

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
  { id: "vantage.theme.enabled", type: "bool" },
  { id: "browser.nova.enabled", type: "bool" },
  { id: "xpinstall.signatures.required", type: "bool" },
  { id: "browser.download.start_downloads_in_tmp_dir", type: "bool" },
  { id: "pdfjs.enableScripting", type: "bool" },
  { id: "media.peerconnection.ice.default_address_only", type: "bool" },
  { id: "layout.css.font-visibility.level", type: "int" },
  { id: "vantage.download.multithread", type: "bool" },
  { id: "vantage.download.multithread.maxParts", type: "int" },
  { id: "vantage.download.multithread.minSize", type: "int" },
  { id: "vantage.download.multithread.tmpDir", type: "string" },
  { id: "network.trr.mode", type: "int" },
  { id: "browser.tabs.unloadOnLowMemory", type: "bool" },
];
  for (let p of prefsToAdd) {
    try { Preferences.add(p); } catch (e) { /* already registered */ }
  }

var gLibrewolfPane = {
  _pane: null,

  // called when the document is first parsed
  init() {
    this._pane = document.getElementById("paneVantage");

    // ---- About Vantage：版本号 + 更新检查 + 链接按钮 ----
    this.initAboutVantage();

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
      "vantage-theme-checkbox",
      ["vantage.theme.enabled"],
      [true],
    );

    // Vantage 主题让位由 CSS 的 lwtheme 条件实时处理（第三方主题激活 → 规则自动失效）

    setBoolSyncListeners(
      "librewolf-download-tmp-checkbox",
      ["browser.download.start_downloads_in_tmp_dir"],
      [true],
    );

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

    setBoolSyncListeners(
      "librewolf-signatures-checkbox",
      ["xpinstall.signatures.required"],
      [true],
    );
    setBoolSyncListeners(
      "librewolf-pdfjs-scripting-checkbox",
      ["pdfjs.enableScripting"],
      [true],
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

    // ---- 下载提速 ----
    setBoolSyncListeners(
      "vantage-download-mt-checkbox",
      ["vantage.download.multithread"],
      [true],
    );

    // 最大线程数 menulist（int pref + >8 警告联动）
    const maxPartsList = document.getElementById("vantage-download-maxparts");
    const maxPartsCollapse = document.getElementById("vantage-download-maxparts-collapse");
    const updateMaxParts = () => {
      const v = Services.prefs.getIntPref("vantage.download.multithread.maxParts", 4);
      if (maxPartsList) {
        maxPartsList.value = String(v);
      }
      // 选 >8 时自动展开警告（用户也可手动点行尾图标展开/收起）
      if (maxPartsCollapse) {
        maxPartsCollapse.checked = v > 8;
      }
    };
    if (maxPartsList) {
      maxPartsList.addEventListener("command", () => {
        const v = parseInt(maxPartsList.value, 10) || 4;
        Services.prefs.setIntPref("vantage.download.multithread.maxParts", v);
        updateMaxParts();
      });
      Preferences.get("vantage.download.multithread.maxParts").on("change", updateMaxParts);
      updateMaxParts();
    }

    // 最小文件尺寸 menulist（int pref，字节值）
    const minSizeList = document.getElementById("vantage-download-minsize");
    const updateMinSize = () => {
      if (minSizeList) {
        minSizeList.value = String(
          Services.prefs.getIntPref("vantage.download.multithread.minSize", 524288)
        );
      }
    };
    if (minSizeList) {
      minSizeList.addEventListener("command", () => {
        const v = parseInt(minSizeList.value, 10) || 524288;
        Services.prefs.setIntPref("vantage.download.multithread.minSize", v);
      });
      Preferences.get("vantage.download.multithread.minSize").on("change", updateMinSize);
      updateMinSize();
    }

    // 分片缓存目录（文本框 + 浏览按钮，nsIFilePicker 目录选择）
    const tmpdirInput = document.getElementById("vantage-download-tmpdir");
    const tmpdirBrowse = document.getElementById("vantage-download-tmpdir-browse");
    if (tmpdirInput) {
      tmpdirInput.value = Services.prefs.getStringPref("vantage.download.multithread.tmpDir", "");
      tmpdirInput.addEventListener("change", () => {
        Services.prefs.setStringPref("vantage.download.multithread.tmpDir", tmpdirInput.value.trim());
      });
    }
    if (tmpdirBrowse) {
      tmpdirBrowse.addEventListener("command", async () => {
        const fp = Cc["@mozilla.org/filepicker;1"].createInstance(Ci.nsIFilePicker);
        let win = this._getPaneWindow();
        let bc =
          (win && win.browsingContext) ||
          (win && win.docShell && win.docShell.browsingContext);
        if (!bc) {
          return;
        }
        fp.init(
          bc,
          await this._l10n("vantage-download-tmpdir-picker-title"),
          Ci.nsIFilePicker.modeGetFolder
        );
        const rv = await new Promise(resolve => fp.open(resolve));
        if (rv === Ci.nsIFilePicker.returnOK && tmpdirInput) {
          const path = fp.file.path;
          tmpdirInput.value = path;
          Services.prefs.setStringPref("vantage.download.multithread.tmpDir", path);
        }
      });
    }

    // 断点续传开关：仅在总开关（多线程）启用时可用，避免“设了不生效”的困惑
    const mtCheckbox = document.getElementById("vantage-download-mt-checkbox");
    const resumeCheckbox = document.getElementById("vantage-download-resume-checkbox");
    const updateResumeEnabled = () => {
      if (resumeCheckbox && mtCheckbox) {
        resumeCheckbox.disabled = !mtCheckbox.checked;
      }
    };
    if (mtCheckbox) {
      mtCheckbox.addEventListener("command", updateResumeEnabled);
      updateResumeEnabled();
    }

    // ---- DoH 开关（network.trr.mode 2=开启，0=关闭；AliDNS）----
    setXOriginPolicySyncListeners(
      "vantage-doh-checkbox",
      "network.trr.mode",
      [2],
      [0]
    );

    // ---- 标签休眠（内存不足时卸载不活跃标签）----
    setBoolSyncListeners(
      "librewolf-tabs-unload-checkbox",
      ["browser.tabs.unloadOnLowMemory"],
      [true],
    );

    // Profile backup buttons (CSP forbids inline oncommand handlers)
    let exportBtn = document.getElementById("vantage-backup-export-button");
    if (exportBtn) {
      exportBtn.addEventListener("command", () => this.exportProfile());
    }
    let importBtn = document.getElementById("vantage-backup-import-button");
    if (importBtn) {
      importBtn.addEventListener("command", () => this.importProfile());
    }

    // Notify observers that the UI is now ready
    Services.obs.notifyObservers(window, "librewolf-pane-loaded");
  },

  // ---- About Vantage ----

  initAboutVantage() {
    // 版本号
    let versionEl = document.getElementById("vantage-about-version");
    if (versionEl) {
      document.l10n.setAttributes(versionEl, "vantage-about-version", {
        version: AppConstants.MOZ_APP_VERSION_DISPLAY,
      });
    }

    // 链接按钮 → 新标签页打开
    let openTab = url => {
      try {
        window.openWebLinkIn(url, "tab");
      } catch (e) {
        window.open(url, "_blank");
      }
    };
    let siteBtn = document.getElementById("vantage-about-site-button");
    if (siteBtn) {
      siteBtn.addEventListener("command", () =>
        openTab("https://asystech.cn/vantage/")
      );
    }
    let changelogBtn = document.getElementById("vantage-about-changelog-button");
    if (changelogBtn) {
      changelogBtn.addEventListener("command", () =>
        openTab("https://asystech.cn/vantage/docs.html#changelog")
      );
    }
    let githubBtn = document.getElementById("vantage-about-github-button");
    if (githubBtn) {
      githubBtn.addEventListener("command", () =>
        openTab("https://github.com/asystech-chen/Vantage")
      );
    }

    // 检查更新（与 aboutDialog 一致：拉 releases.json 对比版本）
    let statusEl = document.getElementById("vantage-about-update-status");
    if (!statusEl) {
      return;
    }
    let checkVersion = true;
    try {
      checkVersion = Services.prefs.getBoolPref("vantage.aboutMenu.checkVersion", true);
    } catch (e) {}
    if (!checkVersion) {
      return;
    }
    document.l10n.setAttributes(statusEl, "vantage-about-update-checking");
    let apiUrl = Services.prefs.getStringPref(
      "vantage.aboutMenu.versionCheckUrl",
      "https://asystech.cn/vantage/releases.json"
    );
    let downloadPage = Services.prefs.getStringPref(
      "vantage.aboutMenu.downloadPageUrl",
      "https://asystech.cn/vantage/vdownload.html"
    );
    // 10s 超时：避免网络慢时“正在检查更新”一直转
    let controller = new AbortController();
    let timer = setTimeout(() => controller.abort(), 10000);
    fetch(apiUrl, { signal: controller.signal })
      .then(r => {
        if (!r.ok) throw new Error("HTTP " + r.status);
        return r.json();
      })
      .then(data => {
        if (!data || !data.length) {
          return;
        }
        let latest = data[0].tag_name;
        let current = AppConstants.MOZ_APP_VERSION_DISPLAY;
        if (this.isNewerVersion(latest, current)) {
          let link = document.createElement("a");
          link.classList.add("text-link");
          link.href = downloadPage;
          link.addEventListener("click", e => {
            e.preventDefault();
            openTab(downloadPage);
          });
          document.l10n.setAttributes(link, "vantage-about-update-available");
          statusEl.textContent = "";
          statusEl.appendChild(link);
        } else {
          document.l10n.setAttributes(statusEl, "vantage-about-up-to-date");
        }
      })
      .catch(() => {
        statusEl.textContent = "";
      })
      .finally(() => clearTimeout(timer));
  },

  isNewerVersion(newVer, oldVer) {
    let [oldV, oldR] = String(oldVer).replace(/^v/, "").split("-");
    let [newV, newR] = String(newVer).replace(/^v/, "").split("-");
    if (!oldR) oldR = "0";
    if (!newR) newR = "0";
    let oP = oldV.split(".");
    let nP = newV.split(".");
    for (let i = 0; i < nP.length; i++) {
      let o = Number(oP[i] || "0");
      let n = Number(nP[i]);
      if (n > o) return true;
      if (n < o) return false;
    }
    return Number(newR) > Number(oldR);
  },

  // ---- Profile backup & restore ----

  _backupExcludeDirs: new Set([
    "cache2", "startupCache", "thumbnails", "crashes", "minidumps",
    "datareporting", "safebrowsing", "shader-cache", "OfflineCache",
    "storage", "saved-telemetry-pings", "jumpListCache", "mediacapabilities",
    "security_state", "reporting", "graphics", "webappstore", "kinto", "settings",
  ]),
  _backupExcludeFiles: new Set([
    "lock", "parent.lock", "compatibility.ini", "Cache", "Cache2",
    "logins.db", "logins.json",
  ]),

  async _l10n(id, args) {
    try {
      return await L10n.formatValue(id, args);
    } catch (e) {
      return id;
    }
  },

  async exportProfile() {
    try {
      let win = this._getPaneWindow();
      if (!win) {
        this._showError("No window available");
        return;
      }
      let profDir = Services.dirsvc.get("ProfD", Ci.nsIFile);

      let fp = Cc["@mozilla.org/filepicker;1"].createInstance(Ci.nsIFilePicker);
      let bc = win.browsingContext || (win.docShell && win.docShell.browsingContext);
      fp.init(bc, await this._l10n("vantage-backup-export-title"), Ci.nsIFilePicker.modeSave);
      fp.defaultString = "vantage-profile-" + new Date().toISOString().slice(0, 10) + ".zip";
      fp.appendFilter("ZIP (*.zip)", "*.zip");
      let rv = await new Promise(resolve => fp.open(resolve));
      if (rv !== Ci.nsIFilePicker.returnOK) return;

      let zipFile = fp.file;

      // Warn about sensitive data before packing
      let proceed = Services.prompt.confirm(
        win,
        await this._l10n("vantage-backup-export-confirm-title"),
        await this._l10n("vantage-backup-export-confirm")
      );
      if (!proceed) {
        return;
      }

      try {
        if (zipFile.exists()) {
          zipFile.remove(false);
        }
        zipFile.create(Ci.nsIFile.NORMAL_FILE_TYPE, 0o600);
        let zipWriter = Cc["@mozilla.org/zipwriter;1"].createInstance(Ci.nsIZipWriter);
        zipWriter.open(zipFile, 0x2A); // PR_CREATE_FILE | PR_TRUNCATE | PR_WRONLY
        this._backupCount = 0;
        this._backupErrors = [];
        this._addDirToZip(zipWriter, profDir, "");
        zipWriter.close();
        dump("Vantage backup: exported " + this._backupCount + " files to " + zipFile.path + "\n");
        if (this._backupCount === 0) {
          throw new Error("No files were added to the archive. Errors: " + this._backupErrors.join(" | "));
        }
      } catch (e) {
        Services.prompt.alert(
          win,
          await this._l10n("vantage-backup-export-title"),
          await this._l10n("vantage-backup-export-fail", { error: String(e) })
        );
        return;
      }

      Services.prompt.alert(
        win,
        await this._l10n("vantage-backup-export-title"),
        await this._l10n("vantage-backup-export-success")
      );
    } catch (e) {
      this._showError("exportProfile: " + e + "\n" + (e && e.stack ? e.stack : ""));
    }
  },

  _getPaneWindow() {
    // librewolf.js runs inside the preferences document: the global
    // `window` IS the parent window the file picker needs.
    try {
      if (typeof window !== "undefined" && window) {
        return window;
      }
    } catch (e) {}
    try {
      if (this._pane && this._pane.ownerGlobal) {
        return this._pane.ownerGlobal;
      }
    } catch (e) {}
    try {
      return Services.wm.getMostRecentWindow("navigator:browser");
    } catch (e) {}
    return null;
  },

  _showError(msg) {
    try {
      let win = this._getPaneWindow();
      Services.prompt.alert(win, "Vantage Backup Error", String(msg));
    } catch (e) {
      dump("Vantage backup error: " + msg + "\n");
    }
  },

  _addDirToZip(zipWriter, dir, prefix) {
    let entries = dir.directoryEntries;
    while (entries.hasMoreElements()) {
      let child = entries.getNext().QueryInterface(Ci.nsIFile);
      let name = prefix ? prefix + "/" + child.leafName : child.leafName;
      if (child.isDirectory()) {
        if (this._backupExcludeDirs.has(child.leafName)) {
          continue;
        }
        this._addDirToZip(zipWriter, child, name);
      } else {
        if (this._backupExcludeFiles.has(child.leafName)) {
          continue;
        }
        try {
          zipWriter.addEntryFile(name, Ci.nsIZipWriter.COMPRESSION_DEFAULT, child, false);
          this._backupCount++;
        } catch (e) {
          dump("Vantage backup: addEntryFile FAILED " + name + " -> " + e + "\n");
          if (this._backupErrors.length < 10) {
            this._backupErrors.push(name + " -> " + e);
          }
        }
      }
    }
  },

  async importProfile() {
    try {
    let win = this._getPaneWindow();
    if (!win) {
      this._showError("No window available");
      return;
    }
    let profDir = Services.dirsvc.get("ProfD", Ci.nsIFile);

    let fp = Cc["@mozilla.org/filepicker;1"].createInstance(Ci.nsIFilePicker);
    let bc = win.browsingContext || (win.docShell && win.docShell.browsingContext);
    fp.init(bc, await this._l10n("vantage-backup-import-title"), Ci.nsIFilePicker.modeOpen);
    fp.appendFilter("ZIP (*.zip)", "*.zip");
    let rv = await new Promise(resolve => fp.open(resolve));
    if (rv !== Ci.nsIFilePicker.returnOK) return;

    let zipFile = fp.file;
    let zipReader = Cc["@mozilla.org/libjar/zip-reader;1"].createInstance(Ci.nsIZipReader);
    try {
      zipReader.open(zipFile);
    } catch (e) {
      Services.prompt.alert(win, await this._l10n("vantage-backup-import-title"), await this._l10n("vantage-backup-import-invalid"));
      return;
    }

    // Validate backup structure (must contain prefs.js or places.sqlite)
    if (!zipReader.hasEntry("prefs.js") && !zipReader.hasEntry("places.sqlite")) {
      zipReader.close();
      Services.prompt.alert(win, await this._l10n("vantage-backup-import-title"), await this._l10n("vantage-backup-import-invalid"));
      return;
    }

    // Reject path traversal entries
    let entries = zipReader.findEntries("*");
    while (entries.hasMore()) {
      let entryName = entries.getNext();
      if (entryName.includes("..")) {
        zipReader.close();
        Services.prompt.alert(win, await this._l10n("vantage-backup-import-title"), await this._l10n("vantage-backup-import-invalid-path"));
        return;
      }
    }

    let confirmed = Services.prompt.confirm(
      win,
      await this._l10n("vantage-backup-import-confirm-title"),
      await this._l10n("vantage-backup-import-confirm")
    );
    if (!confirmed) {
      zipReader.close();
      return;
    }

    // Auto-backup current profile before restoring (timestamped, never overwritten)
    let backupFile = profDir.parent.clone();
    let ts = new Date().toISOString().replace(/[T:.]/g, "-").replace("Z", "");
    backupFile.append("vantage-backup-" + ts + ".zip");
    try {
      backupFile.create(Ci.nsIFile.NORMAL_FILE_TYPE, 0o600);
      let backupZip = Cc["@mozilla.org/zipwriter;1"].createInstance(Ci.nsIZipWriter);
      backupZip.open(backupFile, 0x2A); // PR_CREATE_FILE | PR_TRUNCATE | PR_WRONLY
      this._addDirToZip(backupZip, profDir, "");
      backupZip.close();
    } catch (e) {
      zipReader.close();
      Services.prompt.alert(
        win,
        await this._l10n("vantage-backup-import-title"),
        await this._l10n("vantage-backup-import-backup-fail", { error: String(e) })
      );
      return;
    }

    // Flush current prefs to disk BEFORE overwriting files. This clears the
    // dirty flag so Firefox won't write in-memory prefs back over the
    // restored prefs.js when it exits.
    try {
      Services.prefs.savePrefFile(null);
    } catch (e) {
      dump("Vantage restore: savePrefFile failed: " + e + "\n");
    }

    // Extract over current profile, collect locked files
    let locked = [];
    entries = zipReader.findEntries("*");
    while (entries.hasMore()) {
      let entryName = entries.getNext();
      let entry = zipReader.getEntry(entryName);
      if (entry.isDirectory) {
        continue;
      }
      try {
        let target = profDir.clone();
        target.appendRelativePath(entryName);
        this._ensureDir(target.parent);
        zipReader.extract(entryName, target);
      } catch (e) {
        locked.push(entryName);
      }
    }
    zipReader.close();

    if (locked.length) {
      Services.prompt.alert(
        win,
        await this._l10n("vantage-backup-import-title"),
        await this._l10n("vantage-backup-import-locked", { files: locked.slice(0, 5).join(", ") })
      );
      return;
    }

    // Apply the restored prefs.js into memory: Firefox writes in-memory prefs
    // back to disk on exit, so we must load the backup values into memory now,
    // otherwise the restored prefs.js would be overwritten during shutdown.
    let applied = 0;
    try {
      let prefsFile = profDir.clone();
      prefsFile.append("prefs.js");
      let text = await IOUtils.readUTF8(prefsFile.path);
      let re = /user_pref\("([^"]+)",\s*("(?:[^"\\]|\\.)*"|true|false|-?\d+)\);/g;
      let m;
      while ((m = re.exec(text))) {
        try {
          let name = m[1];
          let raw = m[2].trim();
          if (raw === "true") {
            Services.prefs.setBoolPref(name, true);
          } else if (raw === "false") {
            Services.prefs.setBoolPref(name, false);
          } else if (/^-?\d+$/.test(raw)) {
            Services.prefs.setIntPref(name, parseInt(raw, 10));
          } else {
            let s = raw.slice(1, -1);
            s = s.replace(/\\u([0-9a-fA-F]{4})/g, (_, h) => String.fromCharCode(parseInt(h, 16)));
            s = s.replace(/\\n/g, "\n").replace(/\\t/g, "\t").replace(/\\"/g, '"').replace(/\\\\/g, "\\");
            Services.prefs.setStringPref(name, s);
          }
          applied++;
        } catch (e) {
          // locked pref or type mismatch: skip
        }
      }
      dump("Vantage restore: applied " + applied + " prefs into memory\n");
      Services.prefs.savePrefFile(null);
    } catch (e) {
      dump("Vantage restore: apply prefs failed: " + e + "\n");
    }

    let uiState = "";
    let prefsSize = -1;
    try {
      uiState = Services.prefs.getStringPref("browser.uiCustomization.state", "").slice(0, 80);
      let prefsFile = profDir.clone();
      prefsFile.append("prefs.js");
      prefsSize = prefsFile.fileSize;
    } catch (e) {}
    Services.prompt.alert(
      win,
      await this._l10n("vantage-backup-import-title"),
      await this._l10n("vantage-backup-import-done") +
        "\n\n[verify] prefs applied: " + applied +
        " | prefs.js size: " + prefsSize +
        "\nuiCustomization: " + uiState
    );
    Services.startup.quit(Services.startup.eForceQuit | Services.startup.eRestart);
    } catch (e) {
      this._showError("importProfile: " + e + "\n" + (e && e.stack ? e.stack : ""));
    }
  },

  _ensureDir(dir) {
    if (!dir || dir.exists()) {
      return;
    }
    this._ensureDir(dir.parent);
    try {
      dir.create(Ci.nsIFile.DIRECTORY_TYPE, 0o700);
    } catch (e) {}
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
