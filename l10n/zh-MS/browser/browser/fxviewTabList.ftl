# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Variables:
#   $date (string) - Date to be formatted based on locale
fxviewtabrow-date = { DATETIME($date, dateStyle: "short") }

# Variables:
#   $time (string) - Time to be formatted based on locale
fxviewtabrow-time = { DATETIME($time, timeStyle: "short") }

# Variables:
#   $targetURI (string) - URL of tab that will be opened in the new tab
fxviewtabrow-tabs-list-tab =
  .title = 打开 { $targetURI } 在一个新的标签页

# Variables:
#   $tabTitle (string) - Title of tab being closed
fxviewtabrow-close-tab-button =
  .title = 关闭 { $tabTitle }

# Variables:
#   $tabTitle (string) - Title of tab being dismissed
fxviewtabrow-dismiss-tab-button =
  .title = 解散 { $tabTitle }

# Used instead of the localized relative time when a timestamp is within a minute or so of now
fxviewtabrow-just-now-timestamp = 只是现在

# Strings below are used for context menu options within panel-list.
# For developers, this duplicates command because the label attribute is required.

fxviewtabrow-delete = Delete
    .accesskey = D
fxviewtabrow-forget-about-this-site = 忘记关于这位置…
    .accesskey = F
fxviewtabrow-open-in-window = 打开在新的窗口
    .accesskey = N
fxviewtabrow-open-in-private-window = 打开在新的私人的窗口
    .accesskey = P
# “Bookmark” is a verb, as in "Bookmark this page" (add to bookmarks).
fxviewtabrow-add-bookmark = 书签…
    .accesskey = B
fxviewtabrow-save-to-pocket = 保存到 { -pocket-brand-name }
    .accesskey = o
fxviewtabrow-copy-link = 复制连接
    .accesskey = L
fxviewtabrow-close-tab = 关闭 Tab
    .accesskey = C
fxviewtabrow-move-tab = 移动 Tab
    .accesskey = v
fxviewtabrow-move-tab-start = 移动到启动
    .accesskey = S
fxviewtabrow-move-tab-end = 移动到端
    .accesskey = E
fxviewtabrow-move-tab-window = 移动到新的窗口
    .accesskey = W
fxviewtabrow-send-to-device = 发送到装置
    .accesskey = n
fxviewtabrow-send-to-mobile = 发送到移动的
    .accesskey = n
fxviewtabrow-pin-tab = 大头针 Tab
    .accesskey = P
fxviewtabrow-unpin-tab = 取下...上的别针 Tab
    .accesskey = p
fxviewtabrow-mute-tab = 哑子 Tab
    .accesskey = M
fxviewtabrow-unmute-tab = Unmute Tab
    .accesskey = m

# Variables:
#   $tabTitle (string) - Title of the tab to which the context menu is associated
fxviewtabrow-options-menu-button =
  .title = 选项为了 { $tabTitle }

## Strings below are to be used without context (tab title/URL) on mute/unmute buttons

fxviewtabrow-mute-tab-button-no-context =
  .title = 哑子标签页
fxviewtabrow-unmute-tab-button-no-context =
  .title = Unmute 标签页

## The following strings are for displaying elements in Firefox View to prompt users to sign in, enable sync, pair a device, or troubleshoot device issues.

fxviewtabrow-send-to-mobile-sign-in = 正负号在到发送标签页
fxviewtabrow-send-to-mobile-turn-on-sync = 转弯在同步的到发送标签页
fxviewtabrow-send-to-mobile-connect-device = 连接一个装置到发送标签页
fxviewtabrow-send-to-mobile-device-missing2 = 不要看见你的装置?
fxviewtabrow-send-to-mobile-not-verified = 帐户不已查清的
fxviewtabrow-send-to-mobile-verify-account = 证明你的帐户
