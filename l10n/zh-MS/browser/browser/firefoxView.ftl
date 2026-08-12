# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

toolbar-button-firefox-view-2 =
  .label = { -firefoxview-brand-name }
  .tooltiptext = 查看跨窗口和设备的最近浏览内容

menu-tools-firefox-view =
  .label = { -firefoxview-brand-name }
  .accesskey = F

firefoxview-page-title = { -firefoxview-brand-name }

firefoxview-page-heading =
  .heading = { -firefoxview-brand-name }

firefoxview-page-label =
  .label = { -firefoxview-brand-name }

# Used instead of the localized relative time when a timestamp is within a minute or so of now
firefoxview-just-now-timestamp = 就在此刻

firefoxview-syncedtabs-signin-header-2 = 您的 { -brand-product-name } 已覆盖您的所有设备
firefoxview-syncedtabs-signin-description-2 = 为了查看您在手机和其他设备上打开的选项卡，您需要登录或注册一个账户。拥有账户后，您还可以同步您的密码、历史记录等更多内容。
firefoxview-syncedtabs-signin-primarybutton-2 = 登录

firefoxview-syncedtabs-adddevice-header-2 = 从任何位置获取选项卡
firefoxview-syncedtabs-adddevice-description-2 = 请在您的手机或另一台计算机上登录 { -brand-product-name }，以便在此处查看选项卡。了解如何<a data-l10n-name="url">连接其他设备</a>。
firefoxview-syncedtabs-adddevice-primarybutton = 试用移动版 { -brand-product-name }

firefoxview-tabpickup-synctabs-primarybutton = 同步打开的选项卡

firefoxview-syncedtabs-synctabs-header = 更新您的同步设置
firefoxview-syncedtabs-synctabs-description = 为了查看来自其他设备的选项卡，您需要同步您打开的选项卡。

firefoxview-syncedtabs-loading-header = 同步正在处理中...
firefoxview-syncedtabs-loading-description = 当同步完成后，您将看到您在其他设备上打开的选项卡。请稍后再次检查。

firefoxview-tabpickup-fxa-admin-disabled-header = 您的组织已禁用同步
firefoxview-tabpickup-fxa-disabled-by-policy-description = { -brand-short-name } 无法在设备之间同步选项卡，因为您的组织已禁用同步功能。

firefoxview-tabpickup-network-offline-header = 请检查您的互联网连接
firefoxview-tabpickup-network-offline-description = 如果您正在使用防火墙或代理，请检查 { -brand-short-name } 是否具备访问网络的权限。
firefoxview-tabpickup-network-offline-primarybutton = 请重试

firefoxview-tabpickup-sync-error-header = 我们正在遇到同步问题
firefoxview-tabpickup-generic-sync-error-description = { -brand-short-name } 目前无法连接到同步服务。请在片刻之后重试。
firefoxview-tabpickup-sync-error-primarybutton = 请重试

firefoxview-tabpickup-sync-disconnected-header = 请开启同步以继续操作
firefoxview-tabpickup-sync-disconnected-description = 为了获取您的选项卡，您需要在 { -brand-short-name } 中允许同步。
firefoxview-tabpickup-sync-disconnected-primarybutton = 在设置中开启同步

firefoxview-tabpickup-password-locked-header = 请输入您的主密码以查看选项卡
firefoxview-tabpickup-password-locked-description = 为了获取您的选项卡，您需要为 { -brand-short-name } 输入主密码。
firefoxview-tabpickup-password-locked-link = 了解更多信息
firefoxview-tabpickup-password-locked-primarybutton = 请输入主密码
firefoxview-syncedtab-password-locked-link = <a data-l10n-name="syncedtab-password-locked-link">了解更多信息</a>

firefoxview-tabpickup-signed-out-header = 请登录以重新连接
firefoxview-tabpickup-signed-out-description2 = 为了重新连接并获取您的选项卡，您需要登录您的账户。
firefoxview-tabpickup-signed-out-primarybutton = 登录

# Variables:
#   $tabTitle (string) - Title of tab being dismissed
firefoxview-closed-tabs-dismiss-tab =
  .title = 关闭 { $tabTitle }

# Variables:
#   $targetURI (string) - URL that will be opened in the new tab
firefoxview-tabs-list-tab-button =
  .title = 在新选项卡中打开 { $targetURI }

firefoxview-collapse-button-show =
  .title = 显示列表

firefoxview-collapse-button-hide =
  .title = 隐藏列表

firefoxview-overview-nav = 最近浏览
  .title = 最近浏览
firefoxview-overview-header = 最近浏览
  .title = 最近浏览

## History in this context refers to browser history

firefoxview-history-nav = 历史记录
  .title = 历史记录
firefoxview-history-header = 历史记录
firefoxview-history-context-delete = 从历史记录中删除
    .accesskey = D
firefoxview-history-context-forget-site = 忘记关于此站点的信息...
    .accesskey = F

## Open Tabs in this context refers to all open tabs in the browser

firefoxview-opentabs-nav = 打开的选项卡
  .title = 打开的选项卡
firefoxview-opentabs-header = 打开的选项卡

## Recently closed tabs in this context refers to recently closed tabs from all windows

firefoxview-recently-closed-nav = 最近关闭的选项卡
  .title = 最近关闭的选项卡
firefoxview-recently-closed-header = 最近关闭的选项卡

## Tabs from other devices refers in this context refers to synced tabs from other devices

firefoxview-synced-tabs-nav = 来自其他设备的选项卡
  .title = 来自其他设备的选项卡
firefoxview-synced-tabs-header = 来自其他设备的选项卡

##

# Used for a link in collapsible cards, in the ’Recent browsing’ page of Firefox View
firefoxview-view-all-link = 查看全部

# Variables:
#   $winID (Number) - The index of the owner window for this set of tabs
firefoxview-opentabs-window-header =
  .title = 窗口 { $winID }

# Variables:
#   $winID (Number) - The index of the owner window (which is currently focused) for this set of tabs
firefoxview-opentabs-current-window-header =
  .title = 窗口 { $winID }（当前）

firefoxview-show-more = 显示更多
firefoxview-show-less = 显示更少
firefoxview-show-all = 显示全部

firefoxview-search-text-box-clear-button =
  .title = 清除

# Placeholder for the input field to search in recent browsing ("search" is a verb).
firefoxview-search-text-box-recentbrowsing =
  .placeholder = 搜索

# Placeholder for the input field to search in history ("search" is a verb).
firefoxview-search-text-box-history =
  .placeholder = 搜索历史记录

# Placeholder for the input field to search in bookmarks ("search" is a verb).
firefoxview-search-text-box-bookmarks =
  .placeholder = 搜索书签

# Placeholder for the input field to search in recently closed tabs ("search" is a verb).
firefoxview-search-text-box-recentlyclosed =
  .placeholder = 搜索最近关闭的选项卡

# Placeholder for the input field to search in tabs from other devices ("search" is a verb).
firefoxview-search-text-box-tabs =
  .placeholder = 搜索选项卡

# Placeholder for the input field to search in open tabs ("search" is a verb).
firefoxview-search-text-box-opentabs =
  .placeholder = 搜索打开的选项卡

# "Search" is a noun (as in "Results of the search for")
# Variables:
#   $query (String) - The search query used for searching through browser history.
firefoxview-search-results-header = 针对“{ $query }”的搜索结果

# Variables:
#   $count (Number) - The number of visits matching the search query.
firefoxview-search-results-count = { $count ->
  [one] { $count } 个站点
 *[other] { $count } 个站点
}

# Message displayed when a search is performed and no matching results were found.
# Variables:
#   $query (String) - The search query.
firefoxview-search-results-empty = 未找到与“{ $query }”匹配的结果

firefoxview-sort-history-by-date-label = 按日期排序
firefoxview-sort-history-by-site-label = 按站点排序
firefoxview-sort-open-tabs-by-recency-label = 按最近活动排序
firefoxview-sort-open-tabs-by-order-label = 按选项卡顺序排序

## Variables:
##   $date (string) - Date to be formatted based on locale

firefoxview-history-date-today = 今天 - { DATETIME($date, dateStyle: "full") }
firefoxview-history-date-yesterday = 昨天 - { DATETIME($date, dateStyle: "full") }
firefoxview-history-date-this-month = { DATETIME($date, dateStyle: "full") }
firefoxview-history-date-prev-month = { DATETIME($date, month: "long", year: "numeric") }

# When history is sorted by site, this heading is used in place of a domain, in
# order to group sites that do not come from an outside host.
# For example, this would be the heading for all file:/// URLs in history.
firefoxview-history-site-localhost = （本地文件）

##

firefoxview-show-all-history = 显示全部历史记录

## Message displayed in Firefox View when the user has no history data

firefoxview-history-empty-header = 返回到您曾经到过的地方
firefoxview-history-empty-description = 当您浏览时，您访问的页面将在此处列出。
firefoxview-history-empty-description-two = 保护您的隐私是我们工作的核心。因此，您可以在<a data-l10n-name="history-settings-url">历史记录设置</a>中控制 { -brand-short-name } 记住的活动。

##

# Button text for choosing a browser within the ’Import history from another browser’ banner
firefoxview-choose-browser-button = 选择浏览器
  .title = 选择浏览器

## Message displayed in Firefox View when the user has chosen to never remember History

firefoxview-dont-remember-history-empty-header-2 = 您掌控着 { -brand-short-name } 记住的内容
firefoxview-dont-remember-history-empty-description-one = 当前，{ -brand-short-name } 不记住您的浏览活动。若要更改此行为，请<a data-l10n-name="history-settings-url-two">更新您的历史记录设置</a>。

##

# This label is read by screen readers when focusing the close button for the "Import history from another browser" banner in Firefox View
firefoxview-import-history-close-button =
  .aria-label = 关闭
  .title = 关闭

## Text displayed in a dismissable banner to import bookmarks/history from another browser

firefoxview-import-history-header = 从另一个浏览器导入历史记录
firefoxview-import-history-description = 使 { -brand-short-name } 成为您的首选浏览器。导入浏览历史记录、书签等更多内容。

## Message displayed in Firefox View when the user has no recently closed tabs data

firefoxview-recentlyclosed-empty-header = 过早关闭了选项卡？
firefoxview-recentlyclosed-empty-description = 您将在此处找到最近关闭的选项卡，以便快速重新打开其中任何一个。
firefoxview-recentlyclosed-empty-description-two = 若要查找更早的选项卡，请查看您的<a data-l10n-name="history-url">浏览历史记录</a>。

## This message is displayed below the name of another connected device when it doesn't have any open tabs.

firefoxview-syncedtabs-device-notabs = 此设备上未打开选项卡

firefoxview-syncedtabs-connect-another-device = 连接另一台设备

firefoxview-pinned-tabs = 已固定选项卡
.title = 固定标签页

firefoxview-tabs =
  .title = 标签页

## These tooltips will be displayed when hovering over a pinned tab on the Open Tabs page
## Variables:
##  $tabTitle (string) - Title of pinned tab that will be opened when selected

firefoxview-opentabs-pinned-tab =
  .title = 切换至 { $tabTitle }

# This tooltip will be shown for a pinned tab whose URL is currently bookmarked.
firefoxview-opentabs-bookmarked-pinned-tab =
  .title = 切换至（已添加书签）{ $tabTitle }

## These tooltips will be displayed when hovering over an unpinned Open Tab
## Variables:
##   $url (string) - URL of tab that will be opened when selected

# This tooltip will be shown for an unpinned tab whose URL is currently bookmarked.
firefoxview-opentabs-bookmarked-tab =
  .title = （已添加书签）{ $url }
