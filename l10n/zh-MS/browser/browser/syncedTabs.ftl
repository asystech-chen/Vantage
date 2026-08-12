# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

synced-tabs-sidebar-title = 同步的标签页
synced-tabs-sidebar-noclients-subtitle = 您是否希望在此处查看来自其他设备的标签页？
synced-tabs-sidebar-intro = 正在显示来自您其他设备的标签页列表。
synced-tabs-sidebar-unverified = 您的帐户需要经过验证。
synced-tabs-sidebar-notabs = 没有打开的标签页
synced-tabs-sidebar-open-settings = 启动同步设置
synced-tabs-sidebar-tabsnotsyncing = 请启用标签页同步，以便查看来自您其他设备的标签页列表。
synced-tabs-sidebar-connect-another-device = 连接另一台设备
synced-tabs-sidebar-search =
    .placeholder = 搜索同步的标签页

## Displayed in the Synced Tabs sidebar's context menu when right-clicking tabs
## and/or devices in the list. The "Open" strings below should be translated
## consistently with the equivalent strings for the bookmarks manager's context
## menu. That menu is activated by right-clicking a bookmark in the Library
## window. The bookmarks manager context's strings are located in places.ftl.

synced-tabs-context-open =
    .label = 打开
    .accesskey = O
synced-tabs-context-open-in-tab =
    .label = 在新标签页中打开
    .accesskey = w
synced-tabs-context-open-in-container-tab =
    .label = 在新容器标签页中打开
    .accesskey = i
synced-tabs-context-open-in-window =
    .label = 在新窗口中打开
    .accesskey = N
synced-tabs-context-open-in-private-window =
    .label = 在新隐私窗口中打开
    .accesskey = P

##

# Displayed in the Synced Tabs sidebar's context menu when right-clicking tabs
# and/or devices in the list. This string is for a menuitem equivalent to one in
# the tab context menu (activated by right-clicking a tab in the tabstrip). That
# string is located in tabContextMenu.ftl. So, this string should be translated
# consistently with the "Bookmark Tab…" string there.
synced-tabs-context-bookmark =
    .label = 将标签页加入书签…
    .accesskey = B
synced-tabs-context-copy =
    .label = 复制
    .accesskey = C
synced-tabs-context-open-all-in-tabs =
    .label = 全部在标签页中打开
    .accesskey = O
synced-tabs-context-manage-devices =
    .label = 管理设备…
    .accesskey = D
synced-tabs-context-manage-this-device =
    .label = 管理此设备
    .accesskey = T
synced-tabs-context-connect-another-device =
    .label = 连接另一台设备
    .accesskey = A
synced-tabs-context-sync-now =
    .label = 立即同步
    .accesskey = S
synced-tabs-fxa-sign-in = 登录以进行同步
synced-tabs-turn-on-sync = 启用同步

# Context for hovering over the close tab button that will
# send a push to the device to close said tab
# Variables
# $deviceName - the name of the device the user is closing a tab for
synced-tabs-context-close-tab = 在 { $deviceName } 中关闭标签页
