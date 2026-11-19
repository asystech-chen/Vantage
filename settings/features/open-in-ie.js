/** ------------------------------
 * [SECTION] VANTAGE: OPEN IN INTERNET EXPLORER (Windows only)
 * -------------------------------
 * 右键页面 / 链接 / 标签页 → 用 IE 打开。纯 autoconfig（无扩展、无补丁）；
 * label 内置在 JS 里，按系统语言输出简中/繁中/英文。
 * 实现：经 PowerShell 调 IE 的 COM 对象（InternetExplorer.Application）拉起真 IE 窗口
 *（Gecko 无法渲染 IE 内容，只能交给系统 IE）。
 */
(function () {
  try {
    if (Services.appinfo.OS !== "WINNT") {
      return; // 仅 Windows
    }

    const MENU_ID = "vantage-open-ie";
    const TAB_MENU_ID = "vantage-open-ie-tab";

    function tr() {
      let loc = "";
      try { loc = Services.locale.appLocaleAsBCP47 || ""; } catch (e) {}
      if (loc.startsWith("zh-Hant") || loc.startsWith("zh-TW") || loc.startsWith("zh-MS")) {
        return "在 IE 中開啟";
      }
      if (loc.startsWith("zh")) {
        return "在 IE 中打开";
      }
      return "Open in IE";
    }

    function isHttp(url) {
      return /^https?:/i.test(url || "");
    }

    function openInIE(url) {
      if (!isHttp(url)) {
        return;
      }
      try {
        // 经 conhost --headless 启动，避免 console 窗口闪一下
        //（nsIProcess 用 dwCreationFlags=0，直接从 GUI 进程启 console 程序会新建控制台窗口）。
        let sysDir = Services.dirsvc.get("SysD", Components.interfaces.nsIFile);
        let exe = sysDir.clone();
        exe.append("conhost.exe");
        let ps = sysDir.clone();
        ps.append("WindowsPowerShell");
        ps.append("v1.0");
        ps.append("powershell.exe");
        if (!exe.exists() || !ps.exists()) {
          return;
        }
        let proc = Components.classes["@mozilla.org/process/util;1"]
          .createInstance(Components.interfaces.nsIProcess);
        proc.init(exe);
        let script =
          "$ie = New-Object -ComObject InternetExplorer.Application; " +
          "$ie.Visible = $true; " +
          "$ie.Navigate('" + String(url).replace(/'/g, "''") + "')";
        let args = ["--headless", ps.path, "-NoProfile", "-NonInteractive", "-Command", script];
        proc.run(false, args, args.length);
      } catch (e) {
        dump("Vantage open-in-ie failed: " + e + "\n");
      }
    }

    function contentUrl(win) {
      let cm = win.gContextMenu;
      if (cm && cm.onLink && cm.linkURL) {
        return cm.linkURL;
      }
      let uri = win.gBrowser && win.gBrowser.currentURI;
      return uri ? uri.spec : "";
    }

    function tabUrl(win) {
      let tab = win.TabContextMenu && win.TabContextMenu.contextTab;
      let uri = tab && tab.linkedBrowser ? tab.linkedBrowser.currentURI : null;
      return uri ? uri.spec : "";
    }

    function initWindow(win) {
      let doc = win.document;
      if (!doc) return;

      // 内容区右键（放进复制粘贴组末尾分隔符之前）
      let menu = doc.getElementById("contentAreaContextMenu");
      if (menu && !doc.getElementById(MENU_ID)) {
        let item = doc.createXULElement("menuitem");
        item.id = MENU_ID;
        item.setAttribute("label", tr());
        menu.addEventListener("popupshowing", (e) => {
          if (e.target !== menu) return;
          let url = contentUrl(win);
          item.setAttribute("data-ie-url", url);
          item.hidden = !isHttp(url);
        });
        item.addEventListener("command", () => {
          let url = item.getAttribute("data-ie-url") || contentUrl(win);
          openInIE(url);
        });
        let anchor = doc.getElementById("context-sep-selectall");
        if (anchor && anchor.parentNode === menu) {
          menu.insertBefore(item, anchor);
        } else {
          menu.appendChild(item);
        }
      }

      // 标签页右键（跟在“复制标签页”近旁）
      let tabMenu = doc.getElementById("tabContextMenu");
      if (tabMenu && !doc.getElementById(TAB_MENU_ID)) {
        let titem = doc.createXULElement("menuitem");
        titem.id = TAB_MENU_ID;
        titem.setAttribute("label", tr());
        tabMenu.addEventListener("popupshowing", (e) => {
          if (e.target !== tabMenu) return;
          let url = tabUrl(win);
          titem.setAttribute("data-ie-url", url);
          titem.hidden = !isHttp(url);
        });
        titem.addEventListener("command", () => {
          let url = titem.getAttribute("data-ie-url") || tabUrl(win);
          openInIE(url);
        });
        let dup = doc.getElementById("context_duplicateTabs") ||
                  doc.getElementById("context_duplicateTab");
        if (dup && dup.parentNode === tabMenu) {
          dup.after(titem);
        } else {
          tabMenu.appendChild(titem);
        }
      }
    }

    Services.obs.addObserver(
      { observe(subject, topic, data) {
        if (topic !== "browser-delayed-startup-finished") return;
        try {
          let win = subject;
          if (!win || !win.document) {
            win = Services.wm.getMostRecentWindow("navigator:browser");
          }
          if (win) initWindow(win);
        } catch (e) {
          dump("Vantage open-in-ie init failed: " + e + "\n");
        }
      }},
      "browser-delayed-startup-finished"
    );
  } catch (e) {
    dump("Vantage open-in-ie setup failed: " + e + "\n");
  }
})();
