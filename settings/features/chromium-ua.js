/** ------------------------------
 * [SECTION] VANTAGE: SITE COMPATIBILITY (Chromium UA + external browser)
 * -------------------------------
 * 地址栏右侧「网站兼容」按钮，合并两项能力：
 *   1. 以 Chromium 身份重新加载本站（按域名记忆，可一键恢复）
 *   2. 在 Chromium 系浏览器中打开（复用 compat.js 的检测/启动逻辑）
 *
 * UA 伪装使用 BrowsingContext.customUserAgent / customPlatform：
 *   - navigator.userAgent、navigator.platform 会变
 *   - 所有请求（含子资源、content 进程）由 HttpBaseChannel 自动套用
 *   - 顶层导航到未启用的域名时，由 http-on-modify-request 兜底恢复默认 UA
 *
 * 依赖：compat.js 必须先加载（通过 globalThis.VantageCompat 提供 detectBrowsers/launch）。
 */

(function () {
  try {
    const Cc = Components.classes;
    const Ci = Components.interfaces;
    const OS = Services.appinfo.OS;
    const PREF_SITES = "vantage.compat.uaSites";
    const PREF_VERSION = "vantage.compat.chromeVersion";
    const BUTTON_ID = "vantage-compat-button";
    const POPUP_ID = "vantage-compat-popup";

    const ICON =
      '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">' +
      '<g fill="none" stroke="#8f939b" stroke-width="2" stroke-linecap="round">' +
      '<circle cx="6.9" cy="8.9" r="5.2"/>' +
      '<ellipse cx="6.9" cy="8.9" rx="2.1" ry="5.2"/>' +
      '<path d="M1.7 8.9h10.4"/>' +
      '</g>' +
      '<path d="M10.9 5 14.4 1.5M11.2 1.2h3.4v3.4" fill="none" stroke="#8f939b" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>' +
      "</svg>";

    function tr(hans, hant, en) {
      let loc = "";
      try { loc = Services.locale.appLocaleAsBCP47 || ""; } catch (e) {}
      if (loc.startsWith("zh-Hant") || loc.startsWith("zh-TW") || loc.startsWith("zh-MS")) {
        return hant;
      }
      if (loc.startsWith("zh")) {
        return hans;
      }
      return en;
    }

    function chromeVersion() {
      try {
        return Services.prefs.getStringPref(PREF_VERSION, "154.0.0.0") || "154.0.0.0";
      } catch (e) {
        return "154.0.0.0";
      }
    }

    function uaPlatform() {
      if (OS === "WINNT") {
        return "Windows NT 10.0; Win64; x64";
      }
      if (OS === "Darwin") {
        return "Macintosh; Intel Mac OS X 10_15_7";
      }
      let abi = "";
      try { abi = Services.appinfo.ABI || ""; } catch (e) {}
      return "X11; Linux " + (abi.includes("aarch64") ? "aarch64" : "x86_64");
    }

    function chromeUA() {
      return (
        "Mozilla/5.0 (" + uaPlatform() + ") AppleWebKit/537.36 " +
        "(KHTML, like Gecko) Chrome/" + chromeVersion() + " Safari/537.36"
      );
    }

    function navigatorPlatform() {
      if (OS === "WINNT") {
        return "Win32";
      }
      if (OS === "Darwin") {
        return "MacIntel";
      }
      let abi = "";
      try { abi = Services.appinfo.ABI || ""; } catch (e) {}
      return "Linux " + (abi.includes("aarch64") ? "aarch64" : "x86_64");
    }

    function siteList() {
      try {
        return Services.prefs
          .getStringPref(PREF_SITES, "")
          .split(",")
          .map((s) => s.trim().toLowerCase())
          .filter(Boolean);
      } catch (e) {
        return [];
      }
    }

    function isSpoofed(host) {
      return !!host && siteList().includes(host.toLowerCase());
    }

    function setSpoofed(host, on) {
      const h = String(host || "").toLowerCase();
      if (!h) {
        return;
      }
      let list = siteList().filter((x) => x !== h);
      if (on) {
        list.push(h);
      }
      list.sort();
      try {
        Services.prefs.setStringPref(PREF_SITES, list.join(","));
      } catch (e) {
        dump("Vantage compat: failed to save sites: " + e + "\n");
      }
    }

    function topBC(browser) {
      try {
        const bc = browser && browser.browsingContext;
        return bc ? bc.top || bc : null;
      } catch (e) {
        return null;
      }
    }

    function applyOverride(browser, on) {
      const bc = topBC(browser);
      if (!bc) {
        return;
      }
      try {
        if (on) {
          bc.customUserAgent = chromeUA();
          bc.customPlatform = navigatorPlatform();
        } else {
          bc.customUserAgent = "";
          bc.customPlatform = "";
        }
      } catch (e) {
        dump("Vantage compat: set customUserAgent failed: " + e + "\n");
      }
    }

    function defaultUA() {
      try {
        return Cc["@mozilla.org/network/protocol;1?name=http"]
          .getService(Ci.nsIHttpProtocolHandler).userAgent;
      } catch (e) {
        return "";
      }
    }

    function pageHost(win) {
      try {
        const uri = win.gBrowser.currentURI;
        if (uri && /^https?$/.test(uri.scheme) && uri.host) {
          return uri.host;
        }
      } catch (e) {}
      return "";
    }

    function updateButton(win) {
      const doc = win.document;
      const btn = doc && doc.getElementById(BUTTON_ID);
      if (!btn) {
        return;
      }
      const host = pageHost(win);
      btn.hidden = !host;
      const on = !!host && isSpoofed(host);
      btn.setAttribute("checked", on ? "true" : "false");
      btn.setAttribute(
        "tooltiptext",
        on
          ? tr("网站兼容：已伪装为 Chromium", "網站相容：已偽裝為 Chromium", "Site compatibility: masquerading as Chromium")
          : tr("网站兼容", "網站相容", "Site compatibility")
      );
    }

    function buildMenu(win, popup) {
      const doc = popup.ownerDocument;
      while (popup.firstChild) {
        popup.removeChild(popup.firstChild);
      }
      const host = pageHost(win);
      const spoofed = !!host && isSpoofed(host);

      const uaItem = doc.createXULElement("menuitem");
      uaItem.setAttribute("type", "checkbox");
      uaItem.setAttribute(
        "label",
        tr(
          "以 Chromium 身份重新加载本站",
          "以 Chromium 身分重新載入本站",
          "Reload this site as Chromium"
        )
      );
      if (spoofed) {
        uaItem.setAttribute("checked", "true");
      }
      uaItem.addEventListener("command", () => {
        popup.hidePopup();
        toggleHost(win, host);
      });
      popup.appendChild(uaItem);

      const api = Services.vantageCompat;
      if (!api) {
        return;
      }
      let browsers = [];
      try {
        browsers = api.detectBrowsers() || [];
      } catch (e) {
        browsers = [];
      }
      if (!browsers.length) {
        return;
      }

      popup.appendChild(doc.createXULElement("menuseparator"));

      if (browsers.length === 1) {
        const b = browsers[0];
        const item = doc.createXULElement("menuitem");
        item.setAttribute(
          "label",
          tr("在 " + b.name + " 中打开", "在 " + b.name + " 中開啟", "Open in " + b.name)
        );
        item.addEventListener("command", () => {
          popup.hidePopup();
          api.launch(b, pageUrl(win));
        });
        popup.appendChild(item);
        return;
      }

      const menu = doc.createXULElement("menu");
      menu.setAttribute(
        "label",
        tr("在 Chromium 浏览器中打开", "在 Chromium 瀏覽器中開啟", "Open in Chromium-based browser")
      );
      const sub = doc.createXULElement("menupopup");
      const last = api.lastId();
      for (const b of browsers) {
        const item = doc.createXULElement("menuitem");
        item.setAttribute("label", (last === b.id ? "\u2713 " : "") + b.name);
        item.addEventListener("command", () => {
          popup.hidePopup();
          api.remember(b.id);
          api.launch(b, pageUrl(win));
        });
        sub.appendChild(item);
      }
      menu.appendChild(sub);
      popup.appendChild(menu);
    }

    function pageUrl(win) {
      try {
        const uri = win.gBrowser.currentURI;
        return uri ? uri.spec : "";
      } catch (e) {
        return "";
      }
    }

    function toggleHost(win, host) {
      if (!host) {
        return;
      }
      const on = !isSpoofed(host);
      setSpoofed(host, on);
      applyOverride(win.gBrowser.selectedBrowser, on);
      updateButton(win);
      win.gBrowser.reload();
    }

    function addStyle(doc) {
      if (doc.getElementById("vantage-compat-style")) {
        return;
      }
      const style = doc.createElementNS("http://www.w3.org/1999/xhtml", "style");
      style.id = "vantage-compat-style";
      style.textContent =
        '#vantage-compat-button[checked="true"] {' +
        "background-color: var(--urlbar-box-background-color-active);" +
        "}";
      (doc.head || doc.documentElement).appendChild(style);
    }

    function addButton(win) {
      const doc = win.document;
      if (!doc || doc.getElementById(BUTTON_ID)) {
        return;
      }
      const container = doc.getElementById("page-action-buttons");
      if (!container) {
        return;
      }
      addStyle(doc);

      const btn = doc.createXULElement("hbox");
      btn.id = BUTTON_ID;
      btn.setAttribute("class", "urlbar-page-action");
      btn.setAttribute("role", "button");
      btn.setAttribute("hidden", "true");

      const img = doc.createXULElement("image");
      img.setAttribute("class", "urlbar-icon");
      img.setAttribute(
        "style",
        'list-style-image: url("data:image/svg+xml;charset=utf-8,' + encodeURIComponent(ICON) + '");'
      );
      btn.appendChild(img);

      const popup = doc.createXULElement("menupopup");
      popup.id = POPUP_ID;
      popup.addEventListener("popupshowing", (e) => {
        if (e.target === popup) {
          buildMenu(win, popup);
          updateButton(win);
        }
      });
      btn.appendChild(popup);

      btn.addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();
        popup.openPopup(btn, "after_start", 0, 0, false, false);
      });
      btn.addEventListener("keydown", (e) => {
        if (e.key === "Enter" || e.key === " ") {
          e.preventDefault();
          popup.openPopup(btn, "after_start", 0, 0, false, false);
        }
      });

      const anchor = doc.getElementById("star-button-box");
      if (anchor && anchor.parentNode === container) {
        container.insertBefore(btn, anchor);
      } else {
        container.appendChild(btn);
      }

      win.gBrowser.tabContainer.addEventListener("TabSelect", () => updateButton(win));
      win.gBrowser.tabContainer.addEventListener("SSTabRestored", () => updateButton(win));
      win.gBrowser.addTabsProgressListener({
        onLocationChange(browser) {
          if (browser === win.gBrowser.selectedBrowser) {
            updateButton(win);
          }
        },
      });
      updateButton(win);
      win.setTimeout(() => updateButton(win), 100);
      win.addEventListener("load", () => updateButton(win), { once: true });
    }

    function initWindow(win) {
      if (win && win.document && win.gBrowser) {
        addButton(win);
      }
    }

    // 顶层导航兜底：未启用域名恢复默认 UA，启用域名确保 BC 覆盖存在
    Services.obs.addObserver(
      {
        observe(channel, topic) {
          if (topic !== "http-on-modify-request") {
            return;
          }
          try {
            if (!(channel instanceof Ci.nsIHttpChannel)) {
              return;
            }
            const info = channel.loadInfo;
            if (!info || !info.isTopLevelLoad) {
              return;
            }
            const original = info.browsingContext;
            if (!original || !original.isContent) {
              return;
            }
            const uri = channel.URI;
            if (!uri || !/^https?$/.test(uri.scheme) || !uri.host) {
              return;
            }
            const bc = original.top || original;
            if (isSpoofed(uri.host)) {
              if (bc.customUserAgent !== chromeUA()) {
                bc.customUserAgent = chromeUA();
              }
              if (bc.customPlatform !== navigatorPlatform()) {
                bc.customPlatform = navigatorPlatform();
              }
              channel.setRequestHeader("User-Agent", chromeUA(), false);
            } else if (bc.customUserAgent) {
              bc.customUserAgent = "";
              bc.customPlatform = "";
              const ua = defaultUA();
              if (ua) {
                channel.setRequestHeader("User-Agent", ua, false);
              }
            }
          } catch (e) {
            // 单请求失败不影响其它请求
          }
        },
      },
      "http-on-modify-request"
    );

    Services.obs.addObserver(
      {
        observe(subject, topic) {
          if (topic !== "browser-delayed-startup-finished") {
            return;
          }
          try {
            let win = subject;
            if (!win || !win.document) {
              win = Services.wm.getMostRecentWindow("navigator:browser");
            }
            initWindow(win);
          } catch (e) {
            dump("Vantage compat button init failed: " + e + "\n");
          }
        },
      },
      "browser-delayed-startup-finished"
    );

    try {
      const wins = Services.wm.getEnumerator("navigator:browser");
      while (wins.hasMoreElements()) {
        initWindow(wins.getNext());
      }
    } catch (e) {}
  } catch (e) {
    dump("Vantage compat button setup failed: " + e + "\n");
  }
})();
