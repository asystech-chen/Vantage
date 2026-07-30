/* This Source Code Form is subject to the terms of the Mozilla Public
   License, v. 2.0. If a copy of the MPL was not distributed with this
   file, You can obtain one at http://mozilla.org/MPL/2.0/. */
"use strict";

async function init(aEvent) {
    if (aEvent.target != document) {
        return;
    }

    try {
        // Display current version number FIRST (before anything can throw)
        let versionField = document.getElementById("versionNumber");
        versionField.innerHTML = AppConstants.MOZ_APP_VERSION_DISPLAY;

        // Distribution info (safe: wrapped in try-catch)
        try {
            var distroId = Services.prefs.getCharPref("distribution.id", " ");
            if (distroId) {
                var distroAbout = Services.prefs.getStringPref("distribution.about", " ");
                if (distroAbout) {
                    var distroField = document.getElementById("distribution");
                    distroField.value = distroAbout;
                    distroField.style.display = "block";
                }
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
        } catch (e) {
            // distribution.id not set, skip distro branding
        }

        // ============================================
        // 版本检查功能
        // ============================================
        var checkVersion = true;
        try {
            checkVersion = Services.prefs.getBoolPref("vantage.aboutMenu.checkVersion", true);
        } catch (e) {
            // pref not set, default to true
        }

        if (checkVersion) {
            let versionDiv = document.getElementById("version");
            const loader = document.createElement("div");
            loader.classList.add("loader");
            versionDiv.appendChild(loader);

            function isNewerVersion(newVer, oldVer) {
                let [oldV, oldR] = oldVer.replace(/^v/, "").split("-");
                let [newV, newR] = newVer.replace(/^v/, "").split("-");
                if (!oldR) oldR = "0";
                if (!newR) newR = "0";
                let oldParts = oldV.split(".");
                let newParts = newV.split(".");
                for (let i = 0; i < newParts.length; i++) {
                    let o = Number(oldParts[i] || "0");
                    let n = Number(newParts[i]);
                    if (n > o) return true;
                    if (n < o) return false;
                }
                return Number(newR) > Number(oldR);
            }

            const apiUrl = Services.prefs.getStringPref(
                "vantage.aboutMenu.versionCheckUrl",
                "https://asystech.cn/vantage/releases.json"
            );
            const downloadPage = Services.prefs.getStringPref(
                "vantage.aboutMenu.downloadPageUrl",
                "https://asystech.cn/vantage/vdownload.html"
            );

            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) throw new Error("HTTP " + response.status);
                    return response.json();
                })
                .then(data => {
                    if (data && data.length > 0) {
                        const latest = data[0].tag_name;
                        const current = AppConstants.MOZ_APP_VERSION_DISPLAY;
                        if (isNewerVersion(latest, current)) {
                            const notice = document.createElement("a");
                            notice.classList.add("text-link");
                            notice.href = downloadPage;
                            notice.onclick = (e) => {
                                e.preventDefault();
                                window.openWebLinkIn(downloadPage, "tab");
                            };
                            notice.innerText = "(发现新版本，前往官网下载)";
                            notice.id = "updateNotice";
                            notice.style.color = "#90FF90";
                            versionDiv.appendChild(notice);
                        } else {
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
                })
                .finally(() => {
                    loader.remove();
                    window.sizeToContent();
                });
        }

        window.sizeToContent();
        if (AppConstants.platform == "macosx") {
            window.moveTo(
                screen.availWidth / 2 - window.outerWidth / 2,
                screen.availHeight / 5
            );
        }

        document.getElementById("escapeKey").addEventListener("command", () => {
            window.close();
        });
    } catch (e) {
        console.error("Vantage aboutDialog init error:", e);
    }
}

document.addEventListener("DOMContentLoaded", init);
