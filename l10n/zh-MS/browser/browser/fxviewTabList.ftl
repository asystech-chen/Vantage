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
  .title = 在新选项卡中启动 { $targetURI }

# Variables:
#   $tabTitle (string) - Title of tab being closed
fxviewtabrow-close-tab-button =
  .title = 关闭 { $tabTitle }

# Variables:
#   $tabTitle (string) - Title of tab being dismissed
fxviewtabrow-dismiss-tab-button =
  .title = 解除 { $tabTitle }

# Used instead of the localized relative time when a timestamp is within a minute or so of now
fxviewtabrow-just-now-timestamp = 刚刚

# Strings below are used for context menu options within panel-list.
# For developers, this duplicates command because the label attribute is required.

fxviewtabrow-delete = 删除
    .accesskey = D
fxviewtabrow-forget-about-this-site = 忘记此站点…
    .accesskey = F
fxviewtabrow-open-in-window = 在新窗口中启动
    .accesskey = N
fxviewtabrow-open-in-private-window = 在新的隐私窗口中启动
    .accesskey = P
# “Bookmark” is a verb, as in "Bookmark this page" (add to bookmarks).
fxviewtabrow-add-bookmark = 添加书签…
    .accesskey = B
fxviewtabrow-save-to-pocket = 保存至 { -pocket-brand-name }
    .accesskey = o
fxviewtabrow-copy-link = 复制链接
    .accesskey = L
fxviewtabrow-close-tab = 关闭选项卡
    .accesskey = C
fxviewtabrow-move-tab = 移动选项卡
    .accesskey = v
fxviewtabrow-move-tab-start = 移动到起始位置
    .accesskey = S
fxviewtabrow-move-tab-end = 移动到末尾位置
    .accesskey = E
fxviewtabrow-move-tab-window = 移动到新窗口
    .accesskey = W
fxviewtabrow-send-to-device = 发送至设备
    .accesskey = n
fxviewtabrow-send-to-mobile = 发送至移动设备
    .accesskey = n
fxviewtabrow-pin-tab = 固定选项卡
    .accesskey = P
fxviewtabrow-unpin-tab = 取消固定选项卡
    .accesskey = p
fxviewtabrow-mute-tab = 静音选项卡
    .accesskey = M
fxviewtabrow-unmute-tab = 取消静音选项卡
    .accesskey = m

# Variables:
#   $tabTitle (string) - Title of the tab to which the context menu is associated
fxviewtabrow-options-menu-button =
  .title = { $tabTitle } 的选项

## Strings below are to be used without context (tab title/URL) on mute/unmute buttons

fxviewtabrow-mute-tab-button-no-context =
  .title = 静音选项卡
fxviewtabrow-unmute-tab-button-no-context =
  .title = 取消静音选项卡

## The following strings are for displaying elements in Firefox View to prompt users to sign in, enable sync, pair a device, or troubleshoot device issues.

fxviewtabrow-send-to-mobile-sign-in = 登录以发送选项卡
fxviewtabrow-send-to-mobile-turn-on-sync = 启动同步以发送选项卡
fxviewtabrow-send-to-mobile-connect-device = 连接设备以发送选项卡
fxviewtabrow-send-to-mobile-device-missing2 = 未检测到您的设备？
fxviewtabrow-send-to-mobile-not-verified = 账户未验证
fxviewtabrow-send-to-mobile-verify-account = 验证您的账户
