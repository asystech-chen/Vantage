/* This Source Code Form is subject to the terms of the Mozilla Public
   License, v. 2.0. If a copy of the MPL was not distributed with this
   file, You can obtain one at http://mozilla.org/MPL/2.0/. */
"use strict";

async function init(aEvent) {
    if (aEvent.target != document) {
        return;
    }

    var distroId = Services.prefs.getCharPref("distribution.id", " ");
    if (distroId) {
        var distroAbout = Services.prefs.getStringPref("distribution.about", " ");
        // If there is about text, we always show it.
        if (distroAbout) {
            var distroField = document.getElementById("distribution");
            distroField.value = distroAbout;
            distroField.style.display = "block";
        }
        // If it's not a mozilla distribution, show the rest,
        // unless about text exists, then we always show.
        if (!distroId.startsWith("mozilla-") || distroAbout) {
            var distroVersion = Services.prefs.getCharPref(
                "distribution.version",
                " "
            );
            if (distroVersion) {
                distroId += " - " + distroVersion;
            }
            var distroIdField = document.getElementById("distributionId");
            distroIdField.value = distroId;
            distroIdField.style.display = "block";
        }
    }

    // Display current version number
    let versionField = document.getElementById("versionNumber");
    versionField.innerHTML = AppConstants.MOZ_APP_VERSION_DISPLAY;
	// 找到原来被 /* ... */ 包裹的版本检查代码，替换为以下内容：

	// ============================================
	// 版本检查功能 - 已启用
	// ============================================

	if (Services.prefs.getBoolPref("vantage.aboutMenu.checkVersion", true)) {
	let versionDiv = document.getElementById("version");
  
	// 创建加载动画
	const loader = document.createElement("div");
	loader.classList.add("loader");
	versionDiv.appendChild(loader);

	// 版本比较函数
	function isNewerVersion(newVer, oldVer) {
		// 去除 'v' 前缀，按 '-' 分割处理预发布版本
		let [oldV, oldR] = oldVer.replace(/^v/, "").split("-");
		let [newV, newR] = newVer.replace(/^v/, "").split("-");
    
		if (!oldR) oldR = "0";
		if (!newR) newR = "0";

		// 逐段比较主版本号 (如 1.2.3)
		let oldParts = oldV.split(".");
		let newParts = newV.split(".");
    
		for (let i = 0; i < newParts.length; i++) {
		let o = Number(oldParts[i] || "0");
		let n = Number(newParts[i]);
		if (n > o) return true;
		if (n < o) return false;
		}
    
		// 主版本相同则比较发布号 (如 -1, -2)
		return Number(newR) > Number(oldR);
	}

	// 获取配置
	const apiUrl = Services.prefs.getStringPref(
		"vantage.aboutMenu.versionCheckUrl",
		"https://asystech.cn/vantage/releases.json"  // 默认接口地址
	);
  
	const downloadPage = Services.prefs.getStringPref(
		"vantage.aboutMenu.downloadPageUrl",
		"https://asystech.cn/pc/vantage.html"  // 默认下载页
	);

	fetch(apiUrl)
		.then(response => {
		if (!response.ok) throw new Error("HTTP " + response.status);
		return response.json();
		})
		.then(data => {
		if (data && data.length > 0) {
			const latest = data[0].tag_name;  // 假设第一个是最新版本
			const current = AppConstants.MOZ_APP_VERSION_DISPLAY;

			if (isNewerVersion(latest, current)) {
			// 发现新版本：显示可点击的提示
			const notice = document.createElement("a");
			notice.classList.add("text-link");
			notice.href = downloadPage;
			notice.onclick = (e) => {
				e.preventDefault();
				window.openWebLinkIn(downloadPage, "tab");
			};
			notice.innerText = "(发现新版本，前往官网下载)";
			notice.id = "updateNotice";
			notice.style.color = "#90FF90";  // 绿色高亮
			versionDiv.appendChild(notice);
			} else {
			// 已是最新版
			const notice = document.createElement("div");
			notice.innerText = "(已是最新版本)";
			notice.id = "updateNotice";
			notice.style.opacity = "0.7";
			versionDiv.appendChild(notice);
			}
		}
		})
		.catch(err => {
		console.warn("更新检查失败:", err);
      // 静默失败，不干扰用户
		})
		.finally(() => {
		loader.remove();
		window.sizeToContent();  // 自适应窗口大小
		});
	}

    window.sizeToContent();
    if (AppConstants.platform == "macosx") {
        window.moveTo(
            screen.availWidth / 2 - window.outerWidth / 2,
            screen.availHeight / 5
        );
    }
}