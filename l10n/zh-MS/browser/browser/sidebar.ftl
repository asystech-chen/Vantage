# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

menu-view-genai-chat =
  .label = AI Chatbot

menu-view-contextual-password-manager =
  .label = 密码

# Label for the Open Tabs entry in the View > Sidebars menu bar menu.
# "Open Tabs" is a noun phrase referring to the tabs currently open in
# the browser, not an instruction to open tabs.
menu-view-open-tabs =
  .label = 打开标签页

sidebar-options-menu-button =
  .title = 打开菜单

## Labels for sidebar history panel

# Variables:
#   $date (string) - Date to be formatted based on locale
sidebar-history-date-today =
  .heading = 今天 - { DATETIME($date, dateStyle: "full") }
sidebar-history-date-yesterday =
  .heading = 昨天 - { DATETIME($date, dateStyle: "full") }
sidebar-history-date-this-month =
  .heading = { DATETIME($date, dateStyle: "full") }
sidebar-history-date-prev-month =
  .heading = { DATETIME($date, month: "long", year: "numeric") }

# When history is sorted by site, this heading is used in place of a domain, in
# order to group sites that do not come from an outside host.
# For example, this would be the heading for all file:/// URLs in history.
sidebar-history-site-localhost =
  .heading = (本地的文件)

sidebar-history-delete =
  .title = 删除从历史记录

sidebar-history-clear =
  .label = 清除历史记录

sidebar-history-sort-by-heading-menucaption =
  .label = 种类由:
sidebar-history-sort-option-date =
  .label = 日期
sidebar-history-sort-option-site =
  .label = 位置
sidebar-history-sort-option-date-and-site =
  .label = 日期和位置
sidebar-history-sort-option-last-visited =
  .label = 最后的拜访

## Labels for sidebar search

# "Search" is a noun (as in "Results of the search for")
# Variables:
#   $query (String) - The search query used for searching through browser history.
sidebar-search-results-header =
  .heading = 搜索结果为了“{ $query }”

## Labels for sidebar customize panel

sidebar-customize-extensions-header2 = 扩展名
sidebar-customize-firefox-tools-header2 =
  .label = 工具
sidebar-customize-firefox-settings = 管理 { -brand-short-name } 设置
sidebar-vertical-tabs =
  .label = 垂直的标签页
sidebar-settings2 =
  .label = 设置
sidebar-hide-tabs-and-sidebar =
  .label = 隐藏标签页和其他选项
sidebar-show-on-the-right =
  .label = 移动其他选项到那右
sidebar-show-on-the-left =
  .label = 移动其他选项到那许可
# Option to automatically expand the collapsed sidebar when the mouse pointer
# hovers over it.
expand-sidebar-on-hover =
  .label = 使膨胀其他选项在翱翔
sidebar-manage-extensions2 = 管理所有的扩展名

## Labels for sidebar context menu items

sidebar-context-menu-manage-extension =
  .label = 管理扩展名
sidebar-context-menu-report-extension =
  .label = 报告扩展名
sidebar-context-menu-open-in-tab =
  .label = 打开在新的 Tab
sidebar-context-menu-open-in-container-tab =
  .label = 打开在新的容器 Tab
sidebar-context-menu-open-in-window =
  .label = 打开在新的窗口
sidebar-context-menu-open-in-private-window =
  .label = 打开在新的私人的窗口
sidebar-context-menu-forget-site =
  .label = 清除所有的论据为了网站（全球资讯网的主机站）…
sidebar-context-menu-bookmark-tab =
  .label = 书签 Tab…
sidebar-context-menu-copy-link =
  .label = 复制连接
sidebar-context-menu-hide-sidebar =
  .label = 隐藏其他选项
sidebar-context-menu-enable-vertical-tabs =
  .label = 转弯在垂直的标签页
sidebar-context-menu-customize-sidebar =
  .label = 定制其他选项
# Variables:
#   $deviceName (String) - The name of the device the user is closing a tab for
sidebar-context-menu-close-remote-tab =
  .label = 关闭标签页在 { $deviceName }
sidebar-context-menu-remove-extension2 =
  .label = 移除从 { -brand-short-name }
sidebar-context-menu-unpin-extension =
  .label = 移除从其他选项

## Labels for sidebar history context menu items

sidebar-history-context-menu-delete-page-2 =
  .label = 删除页从历史记录
sidebar-history-context-menu-bookmark-page =
  .label = 书签页…
sidebar-history-context-menu-delete-pages =
  .label = 删除页从历史记录

## Labels for sidebar bookmarks context menu items

sidebar-bookmarks-context-menu-edit-bookmark =
  .label = 编辑书签…
sidebar-bookmarks-context-menu-delete-bookmark =
  .label = 删除书签
sidebar-bookmarks-context-menu-delete-separator =
  .label = 删除

## Labels for sidebar menu items.

sidebar-menu-genai-chat-label =
  .label = AI chatbot
sidebar-menu-history-label =
  .label = 历史记录
sidebar-menu-synced-tabs-label =
  .label = 标签页从其他的装置
# Label for the Open Tabs panel in the sidebar tools list and customize
# menu. "Open tabs" is a noun phrase referring to the tabs currently open
# in the browser, not an instruction to open tabs.
sidebar-menu-open-tabs-label =
  .label = 打开标签页
sidebar-menu-bookmarks-label =
  .label = 书签
sidebar-menu-customize-label =
  .label = 定制其他选项
sidebar-menu-contextual-password-manager-label =
  .label = 密码
sidebar-menu-more-tools-label =
  .label = 更多工具

## Tooltips for sidebar menu items.

# The tooltip to show over the history icon, when history is not currently showing.
# Variables:
#   $shortcut (String) - The OS specific keyboard shortcut.
sidebar-menu-open-history-tooltip = 打开历史记录 ({ $shortcut })

# The tooltip to show over the history icon, when history is currently showing.
# Variables:
#   $shortcut (String) - The OS specific keyboard shortcut.
sidebar-menu-close-history-tooltip = 关闭历史记录 ({ $shortcut })

# The tooltip to show over the bookmarks icon, when bookmarks is not currently showing.
# Variables:
#   $shortcut (String) - The OS specific keyboard shortcut.
sidebar-menu-open-bookmarks-tooltip = 打开书签 ({ $shortcut })

# The tooltip to show over the bookmarks icon, when bookmarks is currently showing.
# Variables:
#   $shortcut (String) - The OS specific keyboard shortcut.
sidebar-menu-close-bookmarks-tooltip = 关闭书签 ({ $shortcut })

## Tooltips displayed over the AI chatbot icon.
## Variables:
##   $shortcut (String) - The OS specific keyboard shortcut.
##   $provider (String) - The name of the AI chatbot provider (if available).

sidebar-menu-open-ai-chatbot-tooltip-generic = 打开 AI chatbot ({ $shortcut })
sidebar-menu-open-ai-chatbot-provider-tooltip = 打开 { $provider } ({ $shortcut })

sidebar-menu-close-ai-chatbot-tooltip-generic = 关闭 AI chatbot ({ $shortcut })
sidebar-menu-close-ai-chatbot-provider-tooltip = 关闭 { $provider } ({ $shortcut })

## Headings for sidebar menu panels.

sidebar-panel-header-close-button =
  .tooltiptext = 关闭
sidebar-menu-customize-header =
  .heading = 定制其他选项
sidebar-menu-history-header =
  .heading = 历史记录
sidebar-menu-syncedtabs-header =
  .heading = 标签页从其他的装置
# Heading shown at the top of the Open Tabs sidebar panel. "Open tabs"
# refers to the tabs currently open in the browser.
sidebar-menu-open-tabs-header =
  .heading = 打开标签页
sidebar-menu-cpm-header =
  .heading = 密码
sidebar-menu-bookmarks-header =
  .heading = 书签

## Labels for sidebar bookmarks panel folder names.

sidebar-bookmarks-folder-menu = 书签菜单
sidebar-bookmarks-folder-toolbar = 书签工具栏
sidebar-bookmarks-folder-other = 其他的书签
sidebar-bookmarks-folder-mobile = 移动的书签

## Titles for sidebar menu panels.

sidebar-customize-title = 定制其他选项
sidebar-history-title = 历史记录
sidebar-syncedtabs-title = 标签页从其他的装置
# Title of the Open Tabs sidebar panel. "Open tabs" refers to the tabs
# currently open in the browser.
sidebar-opentabs-title = 打开标签页

# Title attribute for the pinned tabs section in the Open Tabs sidebar
# panel.
sidebar-opentabs-pinned-tabs =
  .title = 用针别住标签页

# Heading shown above the tab list for the currently focused window
# in the Open Tabs sidebar panel.
# Variables:
#   $winID (Number) - The position of the window in the open windows list.
sidebar-opentabs-current-window-header =
  .heading = 窗口 { $winID } (当前的)

# Heading shown above the tab list for a non-focused window in the
# Open Tabs sidebar panel.
# Variables:
#   $winID (Number) - The position of the window in the open windows list.
sidebar-opentabs-window-header =
  .heading = 窗口 { $winID }

## Context for closing synced tabs when hovering over the items

# Context for hovering over the close tab button that will
# send a push to the device to close said tab
# Variables:
#   $deviceName (String) - the name of the device the user is closing a tab for
synced-tabs-context-close-tab-title =
    .title = 关闭标签页在 { $deviceName }

show-sidebars =
  .tooltiptext = 显示其他选项
  .label = 其他选项

## Tooltips for the sidebar toolbar widget.

# Variables:
#   $shortcut (String) - The OS specific keyboard shortcut.
sidebar-widget-expand-sidebar2 =
  .tooltiptext = 使膨胀其他选项 ({ $shortcut })
  .label = 其他选项

# Variables:
#   $shortcut (String) - The OS specific keyboard shortcut.
sidebar-widget-collapse-sidebar2 =
  .tooltiptext = 折叠其他选项 ({ $shortcut })
  .label = 其他选项

# Variables:
#   $shortcut (String) - The OS specific keyboard shortcut.
sidebar-widget-show-sidebar2 =
  .tooltiptext = 显示其他选项 ({ $shortcut })
  .label = 其他选项

# Variables:
#   $shortcut (String) - The OS specific keyboard shortcut.
sidebar-widget-hide-sidebar2 =
  .tooltiptext = 隐藏其他选项 ({ $shortcut })
  .label = 其他选项

# Promotional message displayed in the expanded sidebar state for Vertical Tabs
# users who do not have any pinned tabs. Indicates that they can drop tabs in
# this area to pin them.
sidebar-pins-promo-text = 拖动要点标签页这里到保持他们内部伸出
