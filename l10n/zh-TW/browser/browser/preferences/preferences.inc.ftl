librewolf-footer = 有用的連結
pane-librewolf-title = Vantage
category-librewolf =
    .tooltiptext = about:config 更改，邏輯分組且易於訪問
vantage-update-heading = 更新
# 關於 Vantage
vantage-about-heading = 關於 Vantage
vantage-about-version = 版本 { $version }
vantage-about-update-checking = 正在檢查更新…
vantage-about-update-available = 發現新版本，前往官網下載
vantage-about-up-to-date = 已是最新版本

vantage-update-checkbox =
    .label = 自動檢查更新
vantage-theme-checkbox =
    .label = 啟用 Vantage 主題（需要重新啟動瀏覽器生效）
vantage-theme-description = 自動將 Vantage 主題寫入設定檔目錄，為瀏覽器加入圓角工具列、圓角分頁等現代化樣式。開啟或關閉後需重新啟動瀏覽器才能生效。注意：部分第三方主題可能會覆蓋這些效果，僅影響外觀樣式，不影響瀏覽器正常功能。

vantage-update-description = 啟動時自動檢查 Vantage 是否有新版本。發現新版本時會在視窗頂部顯示通知，但不會自動安裝更新。

vantage-ai-heading = AI 側邊欄
vantage-ai-checkbox =
    .label = 啟用側欄的 AI 聊天
vantage-ai-description = 啟用後，您可以在瀏覽器側邊欄中使用 AI 聊天助手。此功能將在側邊欄面板中載入第三方 AI 服務。
vantage-ai-sidebar-checkbox =
    .label = 顯示側欄
vantage-ai-sidebar-description = 啟用後：可快速使用書籤、手機上的分頁、AI 聊天機器人等內容，無需分心於其他介面。停用後：新側欄不再顯示；勾選「啟用側欄的 AI 聊天」時會自動重新顯示。

librewolf-header = Vantage 首選項
librewolf-warning-title = 注意！
librewolf-warning-description = 我們仔細選擇預設設定，專注於隱私和安全。更改這些設定時，請閱讀描述以瞭解這些更改的影響。
librewolf-general-heading = 瀏覽器行為
librewolf-extension-update-checkbox =
    .label = 自動更新附加元件
librewolf-sync-checkbox =
    .label = 啟用 Firefox 同步
librewolf-autocopy-checkbox =
    .label = 啟用中鍵貼上
librewolf-styling-checkbox =
    .label = 允許 userChrome.css 自定義
librewolf-network-heading = 網路
librewolf-ipv6-checkbox =
    .label = 啟用 IPv6
vantage-doh-checkbox =
    .label = 啟用 DNS over HTTPS（DoH）
vantage-doh-mode-label = DoH 模式：
vantage-doh-mode-fallback =
    .label = 優先（DoH 不可用時回退系統 DNS）
vantage-doh-mode-only =
    .label = 僅 DoH（不回退）
vantage-doh-description = 開啟後：DNS 查詢透過加密的 HTTPS 傳送至下方所選的 DNS 供應商解析（預設阿里 AliDNS）。DoH 不可用時自動回退系統 DNS，內網/VPN 存取不受影響。
vantage-doh-provider-label = DNS 供應商：
vantage-doh-provider-custom =
    .label = 自訂…
vantage-doh-custom-label = 自訂 DoH 網址：
librewolf-privacy-heading = 隱私
librewolf-webrtc-ip-checkbox =
    .label = 限制 WebRTC 本機 IP 暴露
librewolf-webrtc-ip-description = 限制 WebRTC 僅使用預設網路介面，防止洩露內網 IP 位址。
librewolf-font-vis-checkbox =
    .label = 限制字型可見性
librewolf-font-vis-description = 僅向網站暴露基礎系統字型，防止字型指紋追蹤。不影響網頁字型渲染效果。

librewolf-xorigin-ref-checkbox =
    .label = 限制跨域引用
librewolf-broken-heading = 指紋追蹤
librewolf-webgl-checkbox =
    .label = 啟用 WebGL
librewolf-rfp-checkbox =
    .label = 啟用防指紋追蹤
librewolf-letterboxing-checkbox =
    .label = 啟用 letterboxing
librewolf-security-heading = 安全
librewolf-ocsp-checkbox =
    .label = 強制執行 OCSP 硬失敗
librewolf-goog-safe-checkbox =
    .label = 啟用 Google 安全瀏覽
librewolf-goog-safe-download-checkbox =
    .label = 掃描下載
librewolf-extension-update-description = 無需手動干預即可保持擴充套件程式最新。這對您的安全很有利。
librewolf-extension-update-warning1 = 如果您不在每次更新前審查擴充套件程式的程式碼，應啟用此選項。
librewolf-ipv6-description = 允許 { -brand-short-name } 使用 IPv6 連線。
librewolf-ipv6-warning1 = 與其在瀏覽器中阻止 IPv6，我們建議在您的作業系統中啟用 IPv6 隱私擴充套件。
librewolf-ocsp-description = 如果無法執行 OCSP 檢查，則阻止連線到網站。
librewolf-ocsp-warning1 = 這樣會提高安全性，但當 OCSP 伺服器宕機時會導致故障。
librewolf-sync-description = 將資料與其它瀏覽器同步。需要重新啟動。
librewolf-tabs-heading = 分頁行為
librewolf-tabs-scroll-checkbox =
    .label = 滾輪切換分頁
librewolf-tabs-dblclick-checkbox =
    .label = 雙擊關閉分頁
librewolf-tabs-urlbar-checkbox =
    .label = 網址列輸入在新分頁開啟
librewolf-tabs-bookmarks-checkbox =
    .label = 書籤在新分頁開啟
librewolf-tabs-search-checkbox =
    .label = 搜尋在新分頁開啟
librewolf-tabs-ctrlTab-checkbox =
    .label = Ctrl+Tab 按最近使用排序
librewolf-tabs-unload-checkbox =
    .label = 記憶體不足時休眠不活躍分頁

librewolf-styling-description = 開啟後：可通過 userChrome.css 檔案自定義瀏覽器外觀（如修改工具列、分頁樣式等）。適合喜歡高度自定義的使用者。
librewolf-styling-warning1 = 關閉後：使用預設瀏覽器外觀。建議只載入信任來源的 CSS 主題，惡意樣式可能竊取輸入內容。
librewolf-xorigin-ref-description = 開啟後：只在同一網站內跳轉時才傳送來源資訊，訪問外部網站時不暴露您從哪個頁面而來。
librewolf-xorigin-ref-warning1 = 關閉後：所有網站都能看到您從哪個頁面跳轉而來。部分需要驗證來源的網站可能無法正常訪問。
librewolf-sync-warning1 = Firefox 同步在傳輸到伺服器之前在本地加密資料。
librewolf-autocopy-description = 選擇一些文字複製，然後用滑鼠中鍵貼上。

librewolf-download-tmp-checkbox =
    .label = 下載檔案存入暫存目錄
librewolf-download-tmp-description = 開啟後：下載的檔案存入系統暫存目錄，關閉瀏覽器後自動清理，避免資料殘留。
librewolf-download-tmp-warning1 = 關閉後：檔案直接存入下載資料夾，方便管理。注意即使手動刪除，下載檔案仍可能被復原工具找回。

# 下載加速
vantage-download-speed-heading = 下載加速
vantage-download-mt-checkbox =
    .label = 啟用多執行緒下載
vantage-download-mt-description = 開啟後：支援分段請求的伺服器會並行下載檔案片段再合併，提升大型檔案下載速度。若某些網站下載失敗，可關閉此選項。
vantage-download-maxparts-label = 最大連線數：
vantage-download-maxparts-warning = 超過 8 個連線可能被部分網站限速或封鎖。
vantage-download-minsize-label = 多執行緒最小檔案大小：
vantage-download-minsize-unit = MB
vantage-download-tmpdir-label = 分片快取目錄：
vantage-download-tmpdir-browse = 瀏覽…
vantage-download-tmpdir-hint = 留空使用使用者快取目錄。下載大型檔案請選擇剩餘空間充足的位置。
vantage-download-tmpdir-picker-title = 選擇分片快取目錄
librewolf-webgl-description = 開啟後：網頁可以使用 WebGL 渲染 3D 圖形，但可能被用來識別您的裝置（指紋追蹤）。
librewolf-webgl-warning1 = 關閉後：增強隱私，但使用 WebGL 的網頁（如 3D 地圖、線上遊戲）可能無法正常顯示。
librewolf-rfp-description = 開啟後：統一隱藏瀏覽器特徵（螢幕解析度、時區、字型、語言等），使您看起來與其他使用者相同，極大增強隱私。
librewolf-rfp-warning1 = 關閉後：瀏覽器特性完全暴露，網站可輕鬆識別和追蹤您。部分網站可能依賴這些特性正常工作。
librewolf-letterboxing-description = 開啟後：瀏覽器視窗尺寸將被限制為幾個標準值，防止網站通過視窗大小識別和追蹤您。視窗兩側可能出現黑邊。
librewolf-letterboxing-warning1 = 關閉後：網站可以通過您的視窗尺寸輔助識別您的身份。此功能需要先開啟「防指紋追蹤」才會生效。
librewolf-goog-safe-description = 如果您擔心惡意軟體和網路釣魚，請考慮啟用它。
librewolf-goog-safe-warning1 = 因擔心審查而禁用，但推薦給不太高階的使用者。所有檢查都在本地進行。
librewolf-goog-safe-download-description = 允許安全瀏覽掃描您的下載，以識別可疑檔案。
librewolf-goog-safe-download-warning1 = 所有檢查都在本地進行。

librewolf-signatures-checkbox =
    .label = 要求擴充套件簽名
librewolf-signatures-description = 開啟後：僅允許安裝經 Mozilla 簽名的擴充套件，防止惡意擴充套件侵害瀏覽器安全。
librewolf-signatures-warning1 = 關閉後：允許安裝未簽名擴充套件，方便開發者測試自編擴充套件。請謹慎安裝來源不明的擴充套件。

librewolf-pdfjs-scripting-checkbox =
    .label = 允許 PDF 檢視器執行指令碼
librewolf-pdfjs-scripting-description = 開啟後：PDF 檔案可執行 JavaScript，支援互動式表單和動態內容。部分 PDF 表單依賴此功能。
librewolf-pdfjs-scripting-warning1 = 關閉後：禁止 PDF 檔案執行指令碼，防止基於 PDF 的安全攻擊。絕大多數 PDF 文件仍可正常檢視。
librewolf-config-link = 所有高階設定 (about:config)
librewolf-open-profile = 疑難排解資訊 (about:support)
content-blocking-section-top-level-description = Vantage 預設支援並啟用嚴格模式下的增強跟蹤保護。這是瀏覽器中最重要的設定之一，因為它提供狀態分割槽、嚴格的阻止列表和其他精妙的隱私功能。我們不建議更改為其他模式。

## Privacy Dashboard
vantage-privacy-dashboard-link = 檢視隱私儀表板
librewolf-debug = 打開調試頁面

vantage-nova-checkbox =
    .label = 啟用 Nova 新介面
vantage-nova-description = Nova 是 Firefox 153 引入的新外觀（圓潤分頁、浮動工具列）。開啟後 Vantage 主題會自動切換為 Nova 適配配色（藍綠漸變標題欄）。切換即時生效。

vantage-findbar-position-checkbox =
    .label = 搜尋列顯示在右上角

# 設定備份與還原
vantage-backup-heading = 設定備份與還原
vantage-backup-description = 將瀏覽器設定（書籤、歷史紀錄、擴充元件、設定）匯出為壓縮檔，或從備份還原。還原會覆蓋目前設定並重新啟動瀏覽器。
vantage-backup-export-button = 匯出備份…
vantage-backup-export-title = 匯出設定備份
vantage-backup-export-success = 設定已成功匯出。
vantage-backup-export-fail = 匯出失敗：{ $error }
vantage-backup-import-button = 從備份還原…
vantage-backup-import-title = 從備份還原設定
vantage-backup-import-invalid = 所選檔案不是有效的 Vantage 設定備份。
vantage-backup-import-invalid-path = 備份包含非法路徑，已拒絕還原。
vantage-backup-import-confirm-title = 還原設定
vantage-backup-import-confirm = 這將覆蓋目前所有設定（書籤、歷史紀錄、設定、擴充元件）並重新啟動瀏覽器。還原前會自動備份目前設定。確定繼續嗎？
vantage-backup-import-backup-fail = 自動備份目前設定失敗：{ $error }
vantage-backup-import-locked = 部分檔案被占用，無法替換（{ $files }…）。請關閉瀏覽器後重新還原。您原有的設定備份是安全的。
vantage-backup-import-done = 設定已還原，瀏覽器即將重新啟動。

vantage-backup-export-confirm-title = 匯出設定備份
vantage-backup-export-confirm = 備份將包含敏感資料：Cookie（網站登入狀態）、瀏覽紀錄、表單紀錄和網站資料。登入密碼已排除，以保障安全。請妥善保管備份檔案，切勿分享給他人。繼續嗎？

vantage-download-resume-checkbox =
    .label = 斷點續傳
vantage-download-resume-description = 啟用後：下載中斷時（例如瀏覽器被關閉），按一下「重試」即可從中斷處繼續，不必重新下載整個檔案。僅在啟用多執行緒下載時生效。


vantage-download-cancelkeep-checkbox =
    .label = 取消時保留資料（可暫停並恢復）
vantage-download-cancelkeep-description = 啟用後，取消進行中的下載會將其暫停並保留已下載的資料，可隨時從中斷處繼續。停用後，取消會清除已下載的資料（與標準下載管理員一致；因關閉瀏覽器或當機而中斷的下載仍可在重新啟動後恢復）。僅在啟用斷點續傳時生效。
vantage-download-minsize-description = 小於此尺寸的檔案會以單一連線下載（硬要分片只會更慢）；更大的檔案才會拆成多份平行下載，最多不超過上方設定的最大連線數。

# ---- 指紋隨機化（FPP）----
vantage-fpp-heading = 指紋隨機化
vantage-fpp-checkbox =
    .label = 啟用指紋隨機化（FPP）
vantage-fpp-preset-label = 預設：
vantage-fpp-preset-off =
    .label = 關閉
vantage-fpp-preset-basic =
    .label = 基礎
vantage-fpp-preset-enhanced =
    .label = 增強
vantage-fpp-preset-custom =
    .label = 自訂
vantage-fpp-canvas =
    .label = Canvas
vantage-fpp-webgl =
    .label = WebGL
vantage-fpp-audio =
    .label = 音訊
vantage-fpp-font =
    .label = 字型
vantage-fpp-screen =
    .label = 螢幕/視窗
vantage-fpp-tz =
    .label = 時區/語言
vantage-fpp-pbmode-checkbox =
    .label = 隱私視窗也啟用
vantage-fpp-description = 對可被指紋化的表面（Canvas、WebGL、音訊、字型、螢幕、時區）加入隨機雜訊，降低跨站追蹤。「基礎」使用 Firefox 內建預設項，「增強」開啟全部隨機化項，「自訂」可逐項勾選。注意：啟用「抵抗指紋」（上方）時以其為準。
vantage-fpp-warning1 = 隨機化可能影響少數網站（地圖、繪圖、部分媒體）。如遇問題可關閉。

# ---- 微軟帳戶同步 ----
vantage-msa-heading = 微軟帳戶同步
vantage-msa-description = 使用微軟帳戶將瀏覽器設定（書籤、歷史、擴充套件、偏好設定）備份到您自己 OneDrive 的 Vantage 私有應用程式資料夾，並可在任意裝置上還原。登入密碼不會包含在備份中。資料僅保存在您的微軟帳戶裡——Vantage 不營運任何同步伺服器。
vantage-msa-clientid-label = 應用程式(用戶端) ID：
vantage-msa-clientid-hint = 需要在 Microsoft Entra 系統管理中心免費註冊一個應用程式：開啟「允許公共用戶端流程」，新增委派權限 User.Read 和 Files.ReadWrite.AppFolder，然後把「應用程式(用戶端) ID」貼到此處。個人微軟帳戶使用租用戶 consumers（預設；可透過 about:config 的 vantage.msaSync.tenant 調整）。
vantage-msa-need-clientid = 請先填寫應用程式(用戶端) ID（點擊右側說明圖示查看設定步驟）。
vantage-msa-need-signin = 請先登入微軟帳戶。
vantage-msa-signin-button = 登入微軟帳戶…
vantage-msa-signout-button = 登出
vantage-msa-pending-instructions = 已開啟微軟登入頁，請在頁面中輸入此代碼：
vantage-msa-open-verify-button = 重新開啟登入頁
vantage-msa-cancel-button = 取消
vantage-msa-waiting = 等待您完成登入…
vantage-msa-signin-success = 登入成功。
vantage-msa-signedout = 已登出微軟帳戶。
vantage-msa-account = 已登入：{ $account }
vantage-msa-lastsync = 上次雲端備份：{ $time }
vantage-msa-neversync = 尚未進行過雲端備份
vantage-msa-upload-button = 備份到雲端
vantage-msa-restore-button = 從雲端還原…
vantage-msa-upload-confirm-title = 備份到微軟帳戶
vantage-msa-upload-confirm = 將打包目前設定並上傳到您 OneDrive 的 Vantage 私有應用程式資料夾。備份包含敏感資料：Cookie（網站登入狀態）、瀏覽歷史和偏好設定；登入密碼已排除。確定要繼續嗎？
vantage-msa-upload-working = 正在打包並上傳…
vantage-msa-upload-progress = 正在上傳… { $pct }%
vantage-msa-upload-success = 已備份到您的 OneDrive。
vantage-msa-upload-fail = 上傳失敗：{ $error }
vantage-msa-restore-working = 正在下載雲端備份…
vantage-msa-restore-none = 該帳戶下沒有找到雲端備份。
vantage-msa-restore-confirm-title = 從微軟帳戶還原
vantage-msa-restore-confirm = 雲端備份（{ $time } 由「{ $device }」建立）將覆蓋目前設定並重新啟動瀏覽器。還原前會自動在本機備份目前設定。確定要繼續嗎？
vantage-msa-restore-unknown = 未知
vantage-msa-restore-fail = 還原失敗：{ $error }
vantage-msa-error-config = 應用程式(用戶端) ID 缺失或無效。
vantage-msa-error-network = 網路錯誤：無法連線微軟伺服器。
vantage-msa-error-auth = 身分驗證失敗：{ $error }。可能需要重新登入。
vantage-msa-error-expired = 登入代碼已過期，請重試。
vantage-msa-error-cancelled = 已取消登入。
vantage-msa-error-generic = { $error }
