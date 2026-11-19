/** ------------------------------
 * [SECTION] VANTAGE: OPEN IN CHROMIUM-BASED BROWSER
 * -------------------------------
 * 右键页面 / 链接 / 标签页 → 用系统中已注册的 Chromium 系浏览器打开。
 * 只识别系统注册过的浏览器：
 *   Windows  Registry App Paths（HKLM/HKCU）+ 常见安装路径
 *   macOS    /Applications、~/Applications 下的标准 App Bundle
 *   Linux    XDG desktop entries（覆盖 deb/rpm/snap/flatpak）
 * 排序：完全开源优先（ungoogled Chromium → Chromium → Brave），
 *       其次 Google Chrome → Microsoft Edge → Opera。
 * 只检测到一个时直接显示单项；多个时展开子菜单让用户选择，并记住上次选择。
 */
(function () {
  try {
    const Cc = Components.classes;
    const Ci = Components.interfaces;
    const OS = Services.appinfo.OS;
    const PREF_LAST = "vantage.compat.externalBrowser";
    const CACHE_MS = 30000;

    const BROWSERS = [
      { id: "ungoogled", name: "ungoogled Chromium" },
      { id: "chromium", name: "Chromium" },
      { id: "brave", name: "Brave" },
      { id: "chrome", name: "Google Chrome" },
      { id: "edge", name: "Microsoft Edge" },
      { id: "opera", name: "Opera" },
    ];

    let _env = null;
    function envVal(name) {
      try {
        if (!_env) {
          _env = Cc["@mozilla.org/process/environment;1"].getService(Ci.nsIEnvironment);
        }
        return _env.get(name) || "";
      } catch (e) {
        return "";
      }
    }

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

    function nameOf(id) {
      const b = BROWSERS.find((x) => x.id === id);
      return b ? b.name : id;
    }

    function menuLabel(name) {
      return tr("在 " + name + " 中打开", "在 " + name + " 中開啟", "Open in " + name);
    }

    function localFile(path) {
      try {
        const f = Cc["@mozilla.org/file/local;1"].createInstance(Ci.nsIFile);
        f.initWithPath(path);
        return f;
      } catch (e) {
        return null;
      }
    }

    function existsFile(path) {
      const f = localFile(path);
      return !!(f && f.exists() && f.isFile());
    }

    function existsDir(path) {
      const f = localFile(path);
      return !!(f && f.exists() && f.isDirectory());
    }

    function runProcess(exePath, args) {
      try {
        const exe = localFile(exePath);
        if (!exe || !exe.exists() || !exe.isFile()) {
          return;
        }
        const proc = Cc["@mozilla.org/process/util;1"].createInstance(Ci.nsIProcess);
        proc.init(exe);
        proc.run(false, args, args.length);
      } catch (e) {
        dump("Vantage compat launch failed: " + e + "\n");
      }
    }

    function readText(path) {
      let fis = null;
      let sis = null;
      try {
        const f = localFile(path);
        if (!f || !f.exists()) {
          return "";
        }
        fis = Cc["@mozilla.org/network/file-input-stream;1"].createInstance(Ci.nsIFileInputStream);
        fis.init(f, -1, -1, 0);
        sis = Cc["@mozilla.org/scriptableinputstream;1"].createInstance(Ci.nsIScriptableInputStream);
        sis.init(fis);
        let out = "";
        let avail = sis.available();
        while (avail > 0) {
          out += sis.read(Math.min(avail, 4096));
          avail = sis.available();
        }
        return out;
      } catch (e) {
        return "";
      } finally {
        try { if (sis) sis.close(); } catch (e) {}
        try { if (fis) fis.close(); } catch (e) {}
      }
    }

    // XDG desktop Exec 的轻量分词（支持单/双引号与反斜杠转义）
    function splitExec(str) {
      const out = [];
      let cur = "";
      let quote = "";
      let esc = false;
      for (const ch of String(str || "")) {
        if (esc) {
          cur += ch;
          esc = false;
          continue;
        }
        if (ch === "\\") {
          esc = true;
          continue;
        }
        if (quote) {
          if (ch === quote) {
            quote = "";
          } else {
            cur += ch;
          }
          continue;
        }
        if (ch === '"' || ch === "'") {
          quote = ch;
          continue;
        }
        if (/\s/.test(ch)) {
          if (cur) {
            out.push(cur);
            cur = "";
          }
          continue;
        }
        cur += ch;
      }
      if (cur) {
        out.push(cur);
      }
      return out;
    }

    // 替换 Exec 中的 URL 字段码（%u/%U），丢弃图标/名称等字段码
    function buildExecArgs(tokens, url) {
      const out = [];
      let added = false;
      for (const tok of tokens) {
        if (/^%[uU]$/.test(tok)) {
          out.push(url);
          added = true;
          continue;
        }
        if (/^%[fF]$/.test(tok)) {
          continue;
        }
        if (/^%[ickdDnNvm]$/.test(tok)) {
          continue;
        }
        if (/%[uU]/.test(tok)) {
          out.push(tok.replace(/%[uU]/g, () => url));
          added = true;
          continue;
        }
        if (/%[fFickdDnNvm]/.test(tok)) {
          out.push(tok.replace(/%[fFickdDnNvm]/g, ""));
          continue;
        }
        out.push(tok);
      }
      if (!added) {
        out.push(url);
      }
      return out;
    }

    function resolveExecutable(cmd) {
      if (!cmd) {
        return null;
      }
      if (cmd.indexOf("/") !== -1) {
        return existsFile(cmd) ? cmd : null;
      }
      const dirs = (envVal("PATH") || "")
        .split(":")
        .filter(Boolean)
        .concat(["/snap/bin", "/usr/local/bin", "/usr/bin", "/bin"]);
      for (const dir of dirs) {
        const p = dir.replace(/\/+$/, "") + "/" + cmd;
        if (existsFile(p)) {
          return p;
        }
      }
      return null;
    }

    /* ---------------- Windows ---------------- */

    function winRegistryExe(exeName) {
      const roots = [
        Ci.nsIWindowsRegKey.ROOT_KEY_LOCAL_MACHINE,
        Ci.nsIWindowsRegKey.ROOT_KEY_CURRENT_USER,
      ];
      const subKeys = [
        "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\" + exeName,
        "SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\App Paths\\" + exeName,
      ];
      for (const root of roots) {
        for (const sub of subKeys) {
          let key = null;
          try {
            key = Cc["@mozilla.org/windows-registry-key;1"].createInstance(Ci.nsIWindowsRegKey);
            key.open(root, sub, Ci.nsIWindowsRegKey.ACCESS_READ);
            let value = "";
            try { value = key.readStringValue(""); } catch (e) {}
            if (!value) {
              try { value = key.readStringValue("Path"); } catch (e) {}
            }
            value = String(value || "").replace(/^"|"$/g, "");
            if (value && existsFile(value)) {
              return value;
            }
          } catch (e) {
            // 键不存在
          } finally {
            try { if (key) key.close(); } catch (e) {}
          }
        }
      }
      return null;
    }

    function winPaths() {
      function dir(key) {
        try { return Services.dirsvc.get(key, Ci.nsIFile).path; } catch (e) { return ""; }
      }
      const pf = dir("ProgramFiles") || envVal("ProgramFiles");
      const pf86 = dir("ProgramFilesX86") || envVal("ProgramFiles(x86)");
      const lad = dir("LocalAppData") || envVal("LOCALAPPDATA");
      const join = (base, rest) => (base ? base.replace(/\\+$/, "") + "\\" + rest : null);
      const list = { ungoogled: [], chromium: [], brave: [], chrome: [], edge: [], opera: [] };
      const add = (id, path) => { if (path) list[id].push(path); };

      add("ungoogled", join(pf, "ungoogled-chromium\\chrome.exe"));
      add("ungoogled", join(pf, "ungoogled-chromium\\Application\\chrome.exe"));
      add("ungoogled", join(lad, "ungoogled-chromium\\chrome.exe"));
      add("chromium", join(pf, "Chromium\\Application\\chrome.exe"));
      add("chromium", join(pf86, "Chromium\\Application\\chrome.exe"));
      add("chromium", join(lad, "Chromium\\Application\\chrome.exe"));
      add("brave", join(pf, "BraveSoftware\\Brave-Browser\\Application\\brave.exe"));
      add("brave", join(lad, "BraveSoftware\\Brave-Browser\\Application\\brave.exe"));
      add("chrome", join(pf, "Google\\Chrome\\Application\\chrome.exe"));
      add("chrome", join(pf86, "Google\\Chrome\\Application\\chrome.exe"));
      add("chrome", join(lad, "Google\\Chrome\\Application\\chrome.exe"));
      add("edge", join(pf86, "Microsoft\\Edge\\Application\\msedge.exe"));
      add("edge", join(pf, "Microsoft\\Edge\\Application\\msedge.exe"));
      add("opera", join(lad, "Programs\\Opera\\opera.exe"));
      add("opera", join(pf, "Opera\\opera.exe"));
      add("opera", join(pf86, "Opera\\opera.exe"));
      return list;
    }

    function detectWindows() {
      const regNames = {
        ungoogled: "ungoogled-chromium.exe",
        chromium: "chromium.exe",
        brave: "brave.exe",
        chrome: "chrome.exe",
        edge: "msedge.exe",
        opera: "opera.exe",
      };
      const paths = winPaths();
      const out = [];
      for (const b of BROWSERS) {
        let exe = winRegistryExe(regNames[b.id]);
        if (!exe) {
          for (const p of paths[b.id]) {
            if (existsFile(p)) {
              exe = p;
              break;
            }
          }
        }
        if (exe) {
          out.push({ id: b.id, name: b.name, exe });
        }
      }
      return out;
    }

    /* ---------------- macOS ---------------- */

    function detectMac() {
      const home = Services.dirsvc.get("Home", Ci.nsIFile).path;
      const roots = ["/Applications", home + "/Applications"];
      const apps = {
        ungoogled: ["ungoogled-chromium.app"],
        chromium: ["Chromium.app"],
        brave: ["Brave Browser.app"],
        chrome: ["Google Chrome.app"],
        edge: ["Microsoft Edge.app"],
        opera: ["Opera.app"],
      };
      const out = [];
      for (const b of BROWSERS) {
        let bundle = null;
        for (const root of roots) {
          for (const app of apps[b.id]) {
            const candidate = root + "/" + app;
            if (existsDir(candidate)) {
              bundle = candidate;
              break;
            }
          }
          if (bundle) {
            break;
          }
        }
        if (bundle) {
          out.push({ id: b.id, name: b.name, bundle });
        }
      }
      return out;
    }

    /* ---------------- Linux ---------------- */

    function xdgDesktopDirs() {
      const home = Services.dirsvc.get("Home", Ci.nsIFile).path;
      const dataHome = envVal("XDG_DATA_HOME") || home + "/.local/share";
      const dataDirs = (envVal("XDG_DATA_DIRS") || "/usr/local/share:/usr/share").split(":");
      const dirs = [
        dataHome + "/applications",
        home + "/.local/share/applications",
        home + "/.local/share/flatpak/exports/share/applications",
        "/var/lib/flatpak/exports/share/applications",
        "/var/lib/snapd/desktop/applications",
      ];
      for (const d of dataDirs) {
        if (d) {
          dirs.push(d.replace(/\/+$/, "") + "/applications");
        }
      }
      return Array.from(new Set(dirs));
    }

    function listDesktopFiles(dirPath) {
      const out = [];
      try {
        const dir = localFile(dirPath);
        if (!dir || !dir.exists() || !dir.isDirectory()) {
          return out;
        }
        const entries = dir.directoryEntries;
        while (entries.hasMoreElements()) {
          let file;
          try {
            file = entries.nextFile;
          } catch (e) {
            file = entries.getNext().QueryInterface(Ci.nsIFile);
          }
          if (file.isFile() && /\.desktop$/i.test(file.leafName)) {
            out.push(file.path);
          }
        }
      } catch (e) {}
      return out;
    }

    function parseDesktop(path) {
      const lines = readText(path).split(/\r?\n/);
      const data = {};
      let inEntry = false;
      for (const line of lines) {
        const t = line.trim();
        if (!t || t.startsWith("#")) {
          continue;
        }
        if (t.startsWith("[")) {
          inEntry = t === "[Desktop Entry]";
          continue;
        }
        if (!inEntry) {
          continue;
        }
        const i = t.indexOf("=");
        if (i < 0) {
          continue;
        }
        const k = t.slice(0, i).trim();
        if (!(k in data)) {
          data[k] = t.slice(i + 1).trim();
        }
      }
      return data;
    }

    function isBrowserEntry(data) {
      if (/^true$/i.test(data.NoDisplay || "") || /^true$/i.test(data.Hidden || "")) {
        return false;
      }
      const mime = (data.MimeType || "").toLowerCase();
      const cats = (data.Categories || "").toLowerCase().split(";");
      return (
        mime.includes("x-scheme-handler/https") ||
        mime.includes("x-scheme-handler/http") ||
        cats.includes("webbrowser")
      );
    }

    function classifyDesktop(leaf, exec) {
      const s = (leaf + " " + exec).toLowerCase();
      if (s.includes("ungoogled")) {
        return "ungoogled";
      }
      if (s.includes("brave")) {
        return "brave";
      }
      if (s.includes("google-chrome") || s.includes("google chrome")) {
        return "chrome";
      }
      if (s.includes("microsoft-edge") || s.includes("microsoft edge") || s.includes("msedge")) {
        return "edge";
      }
      if (s.includes("opera")) {
        return "opera";
      }
      if (s.includes("chromium")) {
        return "chromium";
      }
      return null;
    }

    function detectLinux() {
      const found = {};
      for (const dir of xdgDesktopDirs()) {
        for (const path of listDesktopFiles(dir)) {
          const leaf = path.slice(path.lastIndexOf("/") + 1);
          if (/(beta|dev|canary|unstable|snapshot|nightly)/i.test(leaf)) {
            continue;
          }
          const data = parseDesktop(path);
          if (!data.Exec || !isBrowserEntry(data)) {
            continue;
          }
          const id = classifyDesktop(leaf, data.Exec);
          if (!id || found[id]) {
            continue;
          }
          const tokens = splitExec(data.Exec);
          if (!tokens.length || !resolveExecutable(tokens[0])) {
            continue;
          }
          found[id] = { id, name: nameOf(id), cmd: tokens[0], tokens };
        }
      }
      return BROWSERS.filter((b) => found[b.id]).map((b) => found[b.id]);
    }

    /* ---------------- 检测缓存 ---------------- */

    let cache = { time: 0, list: [] };

    function detectBrowsers() {
      const now = Date.now();
      if (now - cache.time < CACHE_MS) {
        return cache.list;
      }
      let list = [];
      try {
        if (OS === "WINNT") {
          list = detectWindows();
        } else if (OS === "Darwin") {
          list = detectMac();
        } else {
          list = detectLinux();
        }
      } catch (e) {
        dump("Vantage compat detect failed: " + e + "\n");
        list = [];
      }
      cache = { time: now, list };
      return list;
    }

    function launch(browser, url) {
      if (!browser || !/^https?:/i.test(url || "")) {
        return;
      }
      if (browser.exe) {
        runProcess(browser.exe, [url]);
        return;
      }
      if (browser.bundle) {
        runProcess("/usr/bin/open", ["-a", browser.bundle, url]);
        return;
      }
      if (browser.cmd) {
        const exe = resolveExecutable(browser.cmd);
        if (exe) {
          runProcess(exe, buildExecArgs(browser.tokens.slice(1), url));
        }
      }
    }

    function contentUrl(win) {
      const cm = win.gContextMenu;
      if (cm && cm.onLink && cm.linkURL) {
        return cm.linkURL;
      }
      const uri = win.gBrowser && win.gBrowser.currentURI;
      return uri ? uri.spec : "";
    }

    function tabUrl(win) {
      const tab = win.TabContextMenu && win.TabContextMenu.contextTab;
      const uri = tab && tab.linkedBrowser ? tab.linkedBrowser.currentURI : null;
      return uri ? uri.spec : "";
    }

    function lastId() {
      try { return Services.prefs.getStringPref(PREF_LAST, ""); } catch (e) { return ""; }
    }

    function remember(id) {
      try { Services.prefs.setStringPref(PREF_LAST, id); } catch (e) {}
    }

    function addMenuItems(win, parent, kind, urlFn) {
      const doc = win.document;
      if (!doc || doc.getElementById("vantage-compat-single-" + kind)) {
        return;
      }

      const single = doc.createXULElement("menuitem");
      single.setAttribute("id", "vantage-compat-single-" + kind);
      single.setAttribute("hidden", "true");

      const multi = doc.createXULElement("menu");
      multi.setAttribute("id", "vantage-compat-multi-" + kind);
      multi.setAttribute("hidden", "true");

      const popup = doc.createXULElement("menupopup");
      popup.setAttribute("id", "vantage-compat-popup-" + kind);
      multi.appendChild(popup);

      single.addEventListener("command", () => {
        if (single._browser) {
          launch(single._browser, single._url);
        }
      });

      parent.addEventListener("popupshowing", (e) => {
        if (e.target !== parent) {
          return;
        }
        const url = urlFn();
        const browsers = /^https?:/i.test(url || "") ? detectBrowsers() : [];
        single._url = url;
        multi._url = url;
        single.hidden = browsers.length !== 1;
        multi.hidden = browsers.length < 2;

        if (browsers.length === 1) {
          single._browser = browsers[0];
          single.setAttribute("label", menuLabel(browsers[0].name));
        } else {
          single._browser = null;
          while (popup.firstChild) {
            popup.removeChild(popup.firstChild);
          }
          const last = lastId();
          for (const b of browsers) {
            const item = doc.createXULElement("menuitem");
            item.setAttribute("label", (last === b.id ? "\u2713 " : "") + b.name);
            item.addEventListener("command", () => {
              remember(b.id);
              launch(b, multi._url);
            });
            popup.appendChild(item);
          }
          multi.setAttribute(
            "label",
            tr("在 Chromium 浏览器中打开", "在 Chromium 瀏覽器中開啟", "Open in Chromium-based browser")
          );
        }
      });

      function insertBeforeAny(ids) {
        for (const id of ids) {
          const anchor = doc.getElementById(id);
          if (anchor && anchor.parentNode === parent) {
            parent.insertBefore(single, anchor);
            parent.insertBefore(multi, anchor);
            return true;
          }
        }
        return false;
      }

      if (kind === "content") {
        if (!insertBeforeAny(["vantage-open-ie", "context-sep-selectall"])) {
          parent.appendChild(single);
          parent.appendChild(multi);
        }
      } else if (!insertBeforeAny(["vantage-open-ie-tab"])) {
        const dup =
          doc.getElementById("context_duplicateTabs") ||
          doc.getElementById("context_duplicateTab");
        if (dup && dup.parentNode === parent) {
          parent.insertBefore(single, dup.nextSibling);
          parent.insertBefore(multi, dup.nextSibling);
        } else {
          parent.appendChild(single);
          parent.appendChild(multi);
        }
      }
    }

    function initWindow(win) {
      const doc = win.document;
      if (!doc) {
        return;
      }
      const content = doc.getElementById("contentAreaContextMenu");
      if (content) {
        addMenuItems(win, content, "content", () => contentUrl(win));
      }
      const tab = doc.getElementById("tabContextMenu");
      if (tab) {
        addMenuItems(win, tab, "tab", () => tabUrl(win));
      }
    }

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
            if (win) {
              initWindow(win);
            }
          } catch (e) {
            dump("Vantage compat init failed: " + e + "\n");
          }
        },
      },
      "browser-delayed-startup-finished"
    );
  } catch (e) {
    dump("Vantage compat setup failed: " + e + "\n");
  }
})();
