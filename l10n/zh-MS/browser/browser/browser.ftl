# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# This is the initial default title for the browser window.
# It gets updated based on loaded tabs or private browsing state.
browser-main-window-default-title = { -brand-full-name }

# Note: only on macOS do we use a `-` separator between the brand name and the
# "Private Browsing" suffix.
browser-main-private-window-title = { PLATFORM() ->
      [macos] { -brand-full-name } — Private Browsing
     *[other] { -brand-full-name } Private Browsing
  }

# This is only used on macOS; on other OSes we use the full private window
# title (so including the brand name) as a suffix
browser-main-private-suffix-for-content = Private Browsing

# The non-variable portion of this MUST match the translation of
# "PRIVATE_BROWSING_SHORTCUT_TITLE" in custom.properties
private-browsing-shortcut-text-2 = { -brand-shortcut-name } Private Browsing

##

urlbar-identity-button =
    .aria-label = 查看网站信息

## Tooltips for images appearing in the address bar

urlbar-services-notification-anchor =
    .tooltiptext = 打开安装消息面板
urlbar-web-notification-anchor =
    .tooltiptext = 更改您是否能够接收来自该网站的通知
urlbar-midi-notification-anchor =
    .tooltiptext = 打开 MIDI 面板
urlbar-serial-notification-anchor =
    .tooltiptext = 打开串行面板
urlbar-eme-notification-anchor =
    .tooltiptext = 管理 DRM 软件的使用
urlbar-web-authn-anchor =
    .tooltiptext = 打开 Web 身份验证面板
urlbar-canvas-notification-anchor =
    .tooltiptext = 管理画布提取权限
urlbar-web-rtc-share-microphone-notification-anchor =
    .tooltiptext = 管理您与该网站共享麦克风
urlbar-default-notification-anchor =
    .tooltiptext = 打开消息面板
urlbar-geolocation-notification-anchor =
    .tooltiptext = 打开位置请求面板
urlbar-localhost-notification-anchor =
    .tooltiptext = 管理此网站的本地设备访问
urlbar-local-network-notification-anchor =
    .tooltiptext = 管理您与此网站共享本地网络访问
urlbar-xr-notification-anchor =
    .tooltiptext = 打开虚拟现实权限面板
urlbar-storage-access-anchor =
    .tooltiptext = 打开浏览活动权限面板
urlbar-web-rtc-share-screen-notification-anchor =
    .tooltiptext = 管理您与该网站共享您的窗口或屏幕
urlbar-indexed-db-notification-anchor =
    .tooltiptext = 打开离线存储消息面板
urlbar-password-notification-anchor =
    .tooltiptext = 打开保存密码消息面板
urlbar-web-rtc-share-devices-notification-anchor =
    .tooltiptext = 管理您与该网站共享您的摄像头和/或麦克风
# "Speakers" is used in a general sense that might include headphones or
# another audio output connection.
urlbar-web-rtc-share-speaker-notification-anchor =
    .tooltiptext = 管理您与该网站共享其他扬声器
urlbar-autoplay-notification-anchor =
    .tooltiptext = 打开自动播放面板
urlbar-persistent-storage-notification-anchor =
    .tooltiptext = 在持久存储中存储数据
urlbar-addons-notification-anchor =
    .tooltiptext = 打开附加组件安装消息面板
urlbar-search-tips-confirm = 好的，明白了
urlbar-search-tips-confirm-short = 明白了

urlbar-result-menu-button =
    .title = 打开菜单
urlbar-result-menu-button-feedback = 反馈
    .title = 打开菜单
urlbar-result-menu-learn-more =
    .label = 了解更多
    .accesskey = L
urlbar-result-menu-remove-from-history =
    .label = 从历史记录中移除
    .accesskey = R
urlbar-result-menu-tip-get-help =
    .label = 获取帮助
    .accesskey = h
urlbar-result-menu-dismiss-suggestion =
    .label = 忽略此建议
    .accesskey = D
urlbar-result-menu-manage-firefox-suggest =
    .label = 管理 { -firefox-suggest-brand-name }
    .accesskey = M
# Some urlbar suggestions show the user's approximate location as automatically
# detected by Firefox (e.g., weather suggestions), and this menu item lets the
# user tell Firefox that the location is not accurate. Typically the location
# will be a city name, or a city name combined with the name of its parent
# administrative division (e.g., a province, prefecture, or state).
urlbar-result-menu-report-inaccurate-location =
    .label = 报告不准确的位置
urlbar-result-menu-show-less-frequently =
    .label = 减少显示频率
urlbar-result-menu-dont-show-weather-suggestions =
    .label = 不显示天气建议

# Used for Split Button.
urlbar-splitbutton-dropmarker =
    .title = 打开菜单

# A message shown in the urlbar when the user submits feedback on a suggestion
# (e.g., it shows an inaccurate location, it's shown too often, etc.).
urlbar-feedback-acknowledgment = 感谢您的反馈

# A message shown in the urlbar when the user dismisses weather suggestions.
# Weather suggestions won't be shown at all anymore.
urlbar-dismissal-acknowledgment-weather = 感谢您的反馈。您将不再看到天气建议。

## Prompts users to use the Urlbar when they open a new tab or visit the
## homepage of their default search engine.
## Variables:
##  $engineName (String): The name of the user's default search engine. e.g. "Google" or "DuckDuckGo".

urlbar-search-tips-onboard = 输入更少，查找更多：直接从您的地址栏中搜索 { $engineName }。
urlbar-search-tips-redirect-2 = 在地址栏中启动您的搜索，以便查看来自 { $engineName } 和您的浏览历史的建议。

# Prompts users to use the Urlbar when they are typing in the domain of a
# search engine, e.g. google.com or amazon.com.
urlbar-tabtosearch-onboard = 选择此快捷方式，以便更快地找到您所需的内容。

## Local search mode indicator labels in the urlbar

urlbar-search-mode-bookmarks = 书签
urlbar-search-mode-tabs = 标签页
urlbar-search-mode-history = 历史记录
urlbar-search-mode-actions = 操作

##

urlbar-geolocation-blocked =
    .tooltiptext = 您已阻止此网站的位置信息访问。
urlbar-localhost-blocked =
    .tooltiptext = 您已阻止此网站的本机设备连接。
urlbar-local-network-blocked =
    .tooltiptext = 您已阻止此网站的本地网络连接。
urlbar-xr-blocked =
    .tooltiptext = 您已阻止此网站的虚拟现实设备访问。
urlbar-web-notifications-blocked =
    .tooltiptext = 您已阻止此网站的通知。
urlbar-camera-blocked =
    .tooltiptext = 您已阻止此网站使用您的摄像头。
urlbar-microphone-blocked =
    .tooltiptext = 您已阻止此网站使用您的麦克风。
urlbar-screen-blocked =
    .tooltiptext = 您已阻止此网站共享您的屏幕。
urlbar-persistent-storage-blocked =
    .tooltiptext = 您已阻止此网站的持久存储。
urlbar-popup-blocked2 =
    .tooltiptext = 您已阻止此网站的弹出窗口和第三方重定向。
urlbar-autoplay-media-blocked =
    .tooltiptext = 您已阻止此网站自动播放带有声音的媒体。
urlbar-canvas-blocked =
    .tooltiptext = 您已阻止此网站的画布数据提取。
urlbar-midi-blocked =
    .tooltiptext = 您已阻止此网站的 MIDI 访问。
urlbar-serial-blocked =
    .tooltiptext = 您已阻止此网站的串行端口访问。
urlbar-install-blocked =
    .tooltiptext = 您已阻止此网站的附加组件安装。

# Variables
#   $shortcut (String) - A keyboard shortcut for the edit bookmark command.
urlbar-star-edit-bookmark =
    .tooltiptext = 编辑此书签 ({ $shortcut })

# Variables
#   $shortcut (String) - A keyboard shortcut for the add bookmark command.
urlbar-star-add-bookmark =
    .tooltiptext = 为此页面添加书签 ({ $shortcut })

urlbar-split-view-button =
    .tooltiptext = 拆分视图
    .aria-label = 拆分视图

## Searchbar context menu

clear-search-history =
    .label = 清除搜索历史记录
    .accesskey = H

## Page Action Context Menu

page-action-manage-extension2 =
    .label = 管理扩展…
    .accesskey = E
page-action-remove-extension2 =
    .label = 移除扩展
    .accesskey = v

## Auto-hide Context Menu

full-screen-autohide =
    .label = 隐藏工具栏
    .accesskey = H
full-screen-exit =
    .label = 退出全屏模式
    .accesskey = F

## Search Engine selection buttons (one-offs)

# This string prompts the user to use the list of search shortcuts in
# the Urlbar and searchbar.
search-one-offs-with-title = 此次，请使用以下方式搜索：

search-one-offs-change-settings-compact-button =
    .tooltiptext = 更改搜索设置

search-one-offs-context-open-new-tab =
    .label = 在新标签页中搜索
    .accesskey = T
search-one-offs-context-set-as-default =
    .label = 设置为默认搜索引擎
    .accesskey = D
search-one-offs-context-set-as-default-private =
    .label = 设置为隐私窗口的默认搜索引擎
    .accesskey = P

# Search engine one-off buttons with an @alias shortcut/keyword.
# Variables:
#  $engineName (String): The name of the engine.
#  $alias (String): The @alias shortcut/keyword.
search-one-offs-engine-with-alias =
    .tooltiptext = { $engineName } ({ $alias })

# Shown when adding new engines from the address bar shortcut buttons or context
# menu, or from the search bar shortcut buttons.
# Variables:
#  $engineName (String): The name of the engine.
search-one-offs-add-engine =
    .label = 添加“{ $engineName }”搜索
    .tooltiptext = 添加“{ $engineName }”为您的搜索
    .aria-label = 添加“{ $engineName }”为您的搜索
# When more than 5 engines are offered by a web page, they are grouped in a
# submenu using this as its label.
search-one-offs-add-engine-menu =
    .label = 添加搜索

## Local search mode one-off buttons
## Variables:
##  $restrict (String): The restriction token corresponding to the search mode.
##    Restriction tokens are special characters users can type in the urlbar to
##    restrict their searches to certain sources (e.g., "*" to search only
##    bookmarks).

search-one-offs-bookmarks =
    .tooltiptext = 书签 ({ $restrict })
search-one-offs-tabs =
    .tooltiptext = 标签页 ({ $restrict })
search-one-offs-history =
    .tooltiptext = 历史记录 ({ $restrict })
search-one-offs-actions =
    .tooltiptext = 操作 ({ $restrict })

## QuickActions are shown in the urlbar as the user types a matching string
## The -cmd- strings are comma separated list of keywords that will match
## the action. English commas should be used, i.e. ,

# Opens the about:addons page in the home / recommendations section
quickactions-addons = 查看附加组件
# In English we provide multiple spellings for "add-ons". If that's not
# applicable to your language, only use the correct spelling (don't repeat the
# same word).
quickactions-cmd-addons3 = extensions, themes, addons, add-ons

# Opens the bookmarks library window
quickactions-bookmarks2 = 管理书签
quickactions-cmd-bookmarks = 书签

# Opens a SUMO article explaining how to clear history
quickactions-clearrecenthistory = 清除近期历史
quickactions-cmd-clearrecenthistory2 = cookies, clear cookies, cache, clear cache, browsing data, clear browsing data, history, clear recent history

# Opens about:downloads page
quickactions-downloads2 = 查看下载
quickactions-cmd-downloads = 下载

# Opens about:addons page in the extensions section
quickactions-extensions = 管理扩展
quickactions-cmd-extensions2 = extensions, addons, add-ons

# Opens Firefox View
quickactions-firefoxview = 启动 { -firefoxview-brand-name }
# English is using "view" and "open view", since the feature name is
# "Firefox View". If you have translated the name in your language, you
# should use a word related to the existing translation.
quickactions-cmd-firefoxview = open { -firefoxview-brand-name }, { -firefoxview-brand-name }, open view, view

# Opens SUMO home page
quickactions-help = { -brand-product-name } 帮助
quickactions-cmd-help = 帮助, 支持

# Opens the devtools web inspector
quickactions-inspector2 = 启动开发者工具
quickactions-cmd-inspector2 = inspector, devtools, dev tools

# Opens the devtools eyedropper to pick a color from the page
quickactions-colorpicker = 选取颜色
quickactions-cmd-colorpicker = color picker, eyedropper, pick color

# Opens Firefox Library
quickactions-cmd-library = 库
quickactions-library = 启动库

# Opens about:logins
quickactions-logins2 = 管理密码
quickactions-cmd-logins = logins, passwords

# Mutes all tabs playing audio
quickactions-mute = 静音正在播放音频的标签页
# List of words that would trigger the "mute tabs" action from the address bar.
# Replace with idiomatic expressions in your language to silence something or
# someone.
quickactions-cmd-mute = mute, shush, sssssh

# Opens the print dialog
quickactions-print2 = 打印页面
quickactions-cmd-print = 打印

# Opens the print dialog at the save to PDF option
quickactions-savepdf = 将页面保存为 PDF
quickactions-cmd-savepdf2 = pdf, save page

# Opens a new private browsing window
quickactions-private2 = 启动私人窗口
quickactions-cmd-private = private browsing

# Opens a SUMO article explaining how to refresh
quickactions-refresh = 刷新 { -brand-short-name }
quickactions-cmd-refresh = 刷新

# Restarts the browser
quickactions-restart = 重新启动 { -brand-short-name }
quickactions-cmd-restart = 重新启动

# Opens the screenshot tool
quickactions-screenshot3 = 截取屏幕截图
quickactions-cmd-screenshot2 = screenshot, take a screenshot

# Opens about:translations
quickactions-translate = 翻译
quickactions-cmd-translate = 翻译

# Opens about:preferences
quickactions-settings2 = 管理设置
# "manage" should match the corresponding command, which is “Manage settings” in English.
quickactions-cmd-settings2 = settings, preferences, options, manage
# Opens about:addons page in the themes section
quickactions-themes = 管理主题
# In English we provide multiple spellings for "add-ons". If that's not
# applicable to your language, only use the correct spelling (don't repeat the
quickactions-cmd-themes2 = 主题、附加组件、附加组件

# same word).
quickactions-update = 更新 { -brand-short-name }
quickactions-cmd-update = 更新

# Opens a SUMO article explaining how to update the browser
quickactions-viewsource2 = 查看页面源代码
quickactions-cmd-viewsource2 = 查看源代码、源代码、页面源代码

# Opens the view-source UI with current pages source
quickactions-labs = 启动 { -firefoxlabs-brand-name }
quickactions-cmd-labs = 实验室、实验

# Opens about:preferences:experimental (Firefox Labs)
quickactions-learn-more =
    .title = 了解关于快速操作的更多信息

# Tooltip text for the help button shown in the result.
# Will be shown to users the first configurable number of times
press-tab-label = 请按Tab键以进行选择：

# they experience actions giving them instructions on how to

bookmarks-add-bookmark = 添加书签
bookmarks-edit-bookmark = 编辑书签
bookmark-panel-cancel =
    .label = 取消
    .accesskey = C
# select the action shown by pressing the tab key.
## Bookmark Panel
bookmark-panel-remove =
    .label =
        { $count ->
            [1] 移除书签
           *[other] 移除 { $count } 个书签
        }
    .accesskey = R
bookmark-panel-show-editor-checkbox =
    .label = 保存时显示编辑器
    .accesskey = S
bookmark-panel-save-button =
    .label = 保存

# Variables:
#  $count (number): number of bookmarks that will be removed
# Width of the bookmark panel.
bookmark-panel =
    .style = min-width: 23em

# Should be large enough to fully display the Done and

# Cancel/Remove Bookmark buttons.
## Identity Panel
identity-site-information = 站点信息：{ $host }
# Variables
#  $host (String): the hostname of the site that is being displayed.
identity-header-security-with-host =
    .title = 连接安全性：{ $host }
identity-connection-not-secure = 连接不安全
identity-connection-secure = 连接安全
identity-connection-failure = 连接失败
identity-connection-internal = 这是一个安全的 { -brand-short-name } 页面。
identity-connection-file = 此页面存储于您的计算机上。
identity-connection-associated = 此页面从另一个页面加载。
identity-extension-page = 此页面从扩展程序加载。
identity-active-blocked = { -brand-short-name } 已阻止此页面中不安全的部分。
identity-custom-root = 连接由未被 Mozilla 识别的证书颁发机构验证。
identity-passive-loaded = 此页面的部分内容不安全（如图像）。
identity-active-loaded = 您已禁用此页面的保护。
identity-weak-encryption = 此页面使用弱加密。

identity-https-only-connection-upgraded = （已升级至HTTPS）
identity-https-only-label2 = 自动将此站点升级为安全连接
identity-https-only-dropdown-on =
    .label = 启用
identity-https-only-dropdown-off =
    .label = 停用
identity-https-only-dropdown-off-temporarily =
    .label = 暂时停用
identity-https-only-info-turn-on3 = 如果您希望 { -brand-short-name } 在可能时升级连接，请为此站点启用HTTPS升级。
identity-https-only-info-turn-off3 = 如果页面似乎已损坏，您可能需要为此站点关闭HTTPS升级，以便使用不安全的HTTP重新加载。
identity-https-only-info-no-upgrade = 无法从HTTP升级连接。

identity-permissions-storage-access-header = 跨站点Cookie
identity-permissions-storage-access-hint = 当您在此站点上时，这些方可以使用跨站点Cookie和站点数据。
identity-permissions-storage-access-learn-more = 了解更多信息

identity-permissions-reload-hint = 您可能需要重新加载页面，以便使更改生效。
identity-clear-site-data =
    .label = 清除Cookie和站点数据…
identity-connection-not-secure-security-view = 您未安全连接到本站点。
identity-connection-verified = 您已安全连接到本站点。
identity-ev-owner-label = 证书颁发给：
identity-verifier-label = 验证方：
# Variables
identity-etsi = 符合欧盟法规(EU) 2024/1183的规定。
identity-description-custom-root2 = Mozilla不识别此证书颁发机构。该机构可能已由您的操作系统或管理员添加。
identity-cert-exception-overridden = 您已为本站点添加了安全例外。
identity-remove-cert-exception =
    .label = 移除例外
    .accesskey = R
identity-description-insecure = 您与本站点的连接并非私密。您提交的信息可能被他人查看（如密码、消息、信用卡等）。
identity-description-weak-cipher-intro = 您与该网站的连接使用弱加密，并非私密。
identity-description-weak-cipher-risk = 他人可以查看您的信息或修改网站的行为。
identity-description-active-blocked2 = { -brand-short-name } 已阻止此页面中不安全的部分。
identity-description-passive-loaded = 您的连接并非私密，您与站点共享的信息可能被他人查看。
identity-description-passive-loaded-insecure2 = 此网站包含不安全的内容（如图像）。
identity-description-passive-loaded-mixed2 = 尽管 { -brand-short-name } 已阻止部分内容，页面上仍存在不安全的内容（如图像）。
identity-description-active-loaded = 此网站包含不安全的内容（如脚本），并且您的连接并非私密。
identity-description-active-loaded-insecure = 您与此站点共享的信息可能被他人查看（如密码、消息、信用卡等）。
identity-more-info-link-text =
    .label = 更多信息
## Window controls

browser-window-minimize-button =
    .tooltiptext = 最小化
browser-window-maximize-button =
    .tooltiptext = 最大化
browser-window-restore-down-button =
    .tooltiptext = 向下还原
browser-window-close-button =
    .tooltiptext = 关闭
# Clicking this button closes the window and returns to the tab where it was opened from
browser-window-return-to-opener =
    .tooltiptext = 返回

## Bookmarks toolbar items

browser-import-button2 =
    .label = 导入书签…
    .tooltiptext = 从其他浏览器将书签导入至 { -brand-short-name }。

bookmarks-toolbar-empty-message = 为了快速访问，请您将您的书签放置于此处书签工具栏上。 <a data-l10n-name="manage-bookmarks">管理书签…</a>

## WebRTC Pop-up notifications

popup-select-camera-device =
    .value = 摄像头：
    .accesskey = C
popup-select-camera-icon =
    .tooltiptext = 摄像头
popup-select-microphone-device =
    .value = 麦克风：
    .accesskey = M
popup-select-microphone-icon =
    .tooltiptext = 麦克风
popup-select-speaker-icon =
    .tooltiptext = 扬声器
popup-select-window-or-screen =
    .label = 窗口或屏幕：
    .accesskey = W
popup-all-windows-shared = 您屏幕上的所有可见窗口将被共享。

## WebRTC window or screen share tab switch warning

sharing-warning-window = 您正在共享 { -brand-short-name }。当您切换到新选项卡时，其他人可以看到。
sharing-warning-screen = 您正在共享您的整个屏幕。当您切换到新选项卡时，其他人可以看到。
sharing-warning-proceed-to-tab =
  .label = 继续前往选项卡
sharing-warning-disable-for-session =
  .label = 为此会话禁用共享保护

## WebSerial "select a port" popup

webserial-select-port-label = 请选择一个串行端口：
webserial-no-ports-available = 没有可用的串行端口

## URL Bar

# This string is used as an accessible name to the "X" button that cancels a custom search mode (i.e. exits the Amazon.com search mode).
urlbar-search-mode-indicator-close =
  .aria-label = 关闭

# This placeholder is used when not in search mode and the user's default search
# engine is unknown.
urlbar-placeholder =
  .placeholder = 搜索或输入地址

# This placeholder is used when not in search mode and searching in the urlbar
# is disabled via the keyword.enabled pref.
urlbar-placeholder-keyword-disabled =
  .placeholder = 输入地址

# This placeholder is used in search mode with search engines that search the
# entire web.
# Variables
#  $name (String): the name of a search engine that searches the entire Web
#  (e.g. Google).
urlbar-placeholder-search-mode-web-2 =
  .placeholder = 搜索 Web
  .aria-label = 使用 { $name } 进行搜索

# This placeholder is used in search mode with search engines that search a
# specific site (e.g., Amazon).
# Variables
#  $name (String): the name of a search engine that searches a specific site
#  (e.g. Amazon).
urlbar-placeholder-search-mode-other-engine =
  .placeholder = 输入搜索词
  .aria-label = 搜索 { $name }

# This placeholder is used when searching bookmarks.
urlbar-placeholder-search-mode-other-bookmarks =
  .placeholder = 输入搜索词
  .aria-label = 搜索书签

# This placeholder is used when searching history.
urlbar-placeholder-search-mode-other-history =
  .placeholder = 输入搜索词
  .aria-label = 搜索历史记录

# This placeholder is used when searching open tabs.
urlbar-placeholder-search-mode-other-tabs =
  .placeholder = 输入搜索词
  .aria-label = 搜索选项卡

# This placeholder is used when searching quick actions.
urlbar-placeholder-search-mode-other-actions =
  .placeholder = 输入搜索词
  .aria-label = 搜索操作

# Variables
#  $name (String): the name of the user's default search engine
urlbar-placeholder-with-name =
  .placeholder = 使用 { $name } 进行搜索或输入地址

# Variables
#  $component (String): the name of the component which forces remote control.
#    Example: "DevTools", "Marionette", "RemoteAgent".
urlbar-remote-control-notification-anchor2 =
  .tooltiptext = 浏览器正处于远程控制之下（原因：{ $component }）
urlbar-permissions-granted =
  .tooltiptext = 您已向此网站授予了额外的权限。
urlbar-switch-to-tab =
  .value = 切换到标签页：

# Used to indicate that a selected autocomplete entry is provided by an extension.
urlbar-extension =
  .value = 扩展：

urlbar-go-button2 =
  .title = 转到地址栏中的地址
urlbar-page-action-button =
  .tooltiptext = 页面操作
urlbar-revert-button =
  .tooltiptext = 在地址栏中显示该地址

## Action text shown in urlbar results, usually appended after the search
## string or the url, like "result value - action text".

# Used for asking AI assistant chat.
urlbar-result-action-ai-chat = 询问
# Used when the private browsing engine differs from the default engine.
# The "with" format was chosen because the search engine name can end with
# "Search", and we would like to avoid strings like "Search MSN Search".
# Variables
#  $engine (String): the name of a search engine
urlbar-result-action-search-in-private-w-engine = 在隐私窗口中用 { $engine } 进行搜索
# Used when the private browsing engine is the same as the default engine.
urlbar-result-action-search-in-private = 在隐私窗口中进行搜索
# The "with" format was chosen because the search engine name can end with
# "Search", and we would like to avoid strings like "Search MSN Search".
# Variables
#  $engine (String): the name of a search engine
urlbar-result-action-search-w-engine = 用 { $engine } 进行搜索
urlbar-result-action-sponsored = 赞助商提供
urlbar-result-action-switch-tab = 切换到标签页
urlbar-result-action-move-tab-to-split-view = 移动标签页到分屏视图
urlbar-result-action-visit = 访问
# "Switch to tab with container" is used when the target tab is located in a
# different container.
# Variables
# $container (String): the name of the target container
urlbar-result-action-switch-tab-with-container = 切换到标签页 · <span>{ $container }</span>
# Used when the target tab is in a tab group that doesn't have a label.
urlbar-result-action-tab-group-unnamed = 未命名分组
# Allows the user to visit a URL that was previously copied to the clipboard.
urlbar-result-action-visit-from-clipboard = 从剪贴板访问
# Directs a user to press the Tab key to perform a search with the specified
# engine.
# Variables
#  $engine (String): the name of a search engine that searches the entire Web
#  (e.g. Google).
urlbar-result-action-before-tabtosearch-web = 按 Tab 键以使用 { $engine } 进行搜索
# Directs a user to press the Tab key to perform a search with the specified
# engine.
# Variables
#  $engine (String): the name of a search engine that searches a specific site
#  (e.g. Amazon).
urlbar-result-action-before-tabtosearch-other = 按 Tab 键以搜索 { $engine }
# Variables
#  $engine (String): the name of a search engine that searches the entire Web
#  (e.g. Google).
urlbar-result-action-tabtosearch-web = 直接从地址栏使用 { $engine } 进行搜索
# Variables
#  $engine (String): the name of a search engine that searches a specific site
#  (e.g. Amazon).
urlbar-result-action-tabtosearch-other-engine = 直接从地址栏搜索 { $engine }
# Action text for copying to clipboard.
urlbar-result-action-copy-to-clipboard = 复制
# The string returned for an undefined calculator result such as when dividing by 0
urlbar-result-action-undefined-calculator-result = 未定义

## "Last visited" and "bookmarked" explanation strings. For bookmarks and urlbar
## results with last-visited dates like history and top sites, these strings
## explain why the result is shown.

# This explanation is used when the last-visited date is formatted as one of the
# following relative dates: "yesterday", "today"
# Variables:
#   $date (string) - A localized relative date string
urlbar-result-explanation-last-visited-relative = 您上次访问于 { $date }

# This explanation is used when the last-visited date is a small number of days
# in the past.
# Variables:
#   $daysAgo (number) - The number of days ago
urlbar-result-explanation-last-visited-days =
    { $daysAgo ->
        [one] 您上次访问于 { $daysAgo } 天前
        *[other] 您上次访问于 { $daysAgo } 天前
    }

# This explanation is used when the last-visited date is a small number of weeks
# in the past.
# Variables:
#   $weeksAgo (number) - The number of weeks ago
urlbar-result-explanation-last-visited-weeks =
    { $weeksAgo ->
        [one] 您上次访问于 { $weeksAgo } 周前
        *[other] 您上次访问于 { $weeksAgo } 周前
    }

# This explanation is used when the last-visited date is a small number of
# months in the past.
# Variables:
#   $monthsAgo (number) - The number of months ago
urlbar-result-explanation-last-visited-months =
    { $monthsAgo ->
        [one] 您上次访问于 { $monthsAgo } 个月前
        *[other] 您上次访问于 { $monthsAgo } 个月前
    }

# This explanation is used when the last-visited date is further in the past.
# The date will be formatted as an absolute date like: "11 May", "11 May 2026"
# Variables:
#   $date (string) - A localized absolute date string
urlbar-result-explanation-last-visited-absolute = 您上次访问于 { $date }

# This explanation is used when the result is bookmarked. The date will be
# formatted as an absolute date like: "11 May", "11 May 2026"
urlbar-result-explanation-bookmarked = 已加入书签
# Variables:
#   $date (string) - A localized absolute date string
urlbar-result-explanation-bookmarked = 已在 { $date } 添加书签

# The sub title of an add-on suggestion in the urlbar.
urlbar-result-addons-subtitle = { -brand-product-name } 扩展

# The sub title of a mdn suggestion in the urlbar.
urlbar-result-mdn-subtitle = { -mdn-brand-name }

# The sub title of a Yelp suggestion in the urlbar.
urlbar-result-yelp-subtitle = { -yelp-brand-name }

# This string explaining that the suggestion is a recommendation.
urlbar-result-suggestion-recommended = 已推荐

# The title of a weather suggestion in the urlbar. The temperature and unit
# substring should be inside a <strong> tag. If the temperature and unit are not
# adjacent in the localization, it's OK to include only the temperature in the
# tag.
# Variables:
#   $temperature (number) - The temperature value
#   $unit (String) - The unit for the temperature, either "C" or "F"
#   $city (String) - The name of the city the weather data is for
#   $region (String) - The name of the city's region or country. Depending on
#       the user's location in relation to the city, this may be the name or
#       abbreviation of one of the city's administrative divisions like a
#       province or state, or it may be the name of the city's country.
urlbar-result-weather-title = 位于 { $city }、{ $region } 的 <strong>{ $temperature }°{ $unit }</strong>

# The title of a weather suggestion in the urlbar including a region and
# country. The temperature and unit substring should be inside a <strong> tag.
# If the temperature and unit are not adjacent in the localization, it's OK to
# include only the temperature in the tag.
# Variables:
#   $temperature (number) - The temperature value
#   $unit (String) - The unit for the temperature, either "C" or "F"
#   $city (String) - The name of the city the weather data is for
#   $region (String) - The name or abbreviation of one of the city's
#       administrative divisions like a province or state.
#   $country (String) - The name of the city's country.
urlbar-result-weather-title-with-country = 位于 { $city }、{ $region }、{ $country } 的 <strong>{ $temperature }°{ $unit }</strong>

# The title of a weather suggestion in the urlbar only including the city. The
# temperature and unit substring should be inside a <strong> tag. If the
# temperature and unit are not adjacent in the localization, it's OK to include
# only the temperature in the tag.
# Variables:
#   $temperature (number) - The temperature value
#   $unit (String) - The unit for the temperature, either "C" or "F"
#   $city (String) - The name of the city the weather data is for
urlbar-result-weather-title-city-only = 位于 { $city } 的 <strong>{ $temperature }°{ $unit }</strong>

# Shows the name of the provider of weather data in a weather suggestion in the
# urlbar.
# Variables:
#   $provider (String) - The name of the weather-data provider. It will be the
#       name of a company, organization, or service.
urlbar-result-weather-provider-sponsored = { $provider } · 已赞助

## These strings are used for Realtime suggestions in the urlbar.
## Market refers to stocks, indexes, and funds.

# This string is shown as title when Market suggestion are disabled.
urlbar-result-market-opt-in-title = 在您的搜索栏中即时获取股票市场数据

# This string is shown as description when Market suggestion are disabled.
urlbar-result-market-opt-in-description = 当您与 { -vendor-short-name } 共享搜索查询数据时，将显示市场更新及来自我们合作伙伴的更多信息。<a data-l10n-name="learn-more-link">了解更多信息</a>

# This string is shown as button to activate online when realtime suggestion are disabled.
urlbar-result-realtime-opt-in-allow = 显示建议

# This string is shown in split button to dismiss activation the Realtime suggestion.
urlbar-result-realtime-opt-in-not-now = 暂不执行
urlbar-result-realtime-opt-in-dismiss = 消除
urlbar-result-realtime-opt-in-dismiss-all =
    .label = 请勿显示此类建议

# This string is shown in the result menu.
urlbar-result-menu-dont-show-market =
  .label = 请勿显示市场建议

# A message that replaces a result when the user dismisses Market suggestions.
urlbar-result-dismissal-acknowledgment-market = 感谢您提供反馈。您将不再看到市场建议。

# This a11y label is read by screen readers when an item in the row is selected.
urlbar-result-aria-group-market =
  .aria-label = 股票市场建议

# A message that replaces a result when the user dismisses all suggestions of a
# particular type.
urlbar-result-dismissal-acknowledgment-all = 感谢您提供反馈。您将不再看到此类建议。

## These strings are used for suggestions of important dates in the urlbar.

# The name of an event and the number of days until it starts separated by a
# middot.
# Variables:
#   $name (string) - The name of the event.
#   $daysUntilStart (integer) - The number of days until the event starts.
urlbar-result-dates-countdown =
    { $daysUntilStart ->
        [one] { $name } · 在 { $daysUntilStart } 天内
        *[other] { $name } · 在 { $daysUntilStart } 天内
    }

# The name of a multiple day long event and the number of days until it starts
# separated by a middot.
# Variables:
#   $name (string) - The name of the event.
#   $daysUntilStart (integer) - The number of days until the event starts.
urlbar-result-dates-countdown-range =
    { $daysUntilStart ->
        [one] { $name } · 在 { $daysUntilStart } 天后开始
        *[other] { $name } · 在 { $daysUntilStart } 天后开始
    }

# The name of a multiple day long event and the number of days until it ends
# separated by a middot.
# Variables:
#   $name (string) - The name of the event.
#   $daysUntilEnd (integer) - The number of days until the event ends.
urlbar-result-dates-ongoing =
    { $daysUntilEnd ->
        [one] { $name } · 将于 { $daysUntilEnd } 天后结束
        *[other] { $name } · 将于 { $daysUntilEnd } 天后结束
    }

# The name of an event and a note that it is happening today separated by a
# middot.
# Variables:
urlbar-result-dates-today = { $name } · 今天

#   $name (string) - The name of the event.
# The name of multiple day long event and a note that it is ends today
# separated by a middot.
urlbar-result-dates-ends-today = { $name } · 今天结束

# Variables:

#   $name (string) - The name of the event.
## Strings used for buttons in the urlbar
# Searchmode Switcher button
urlbar-searchmode-button3 =
    .title = { $engine }，请选择搜索引擎
urlbar-searchmode-button-no-engine2 =
    .title = 未选择快捷方式，请选择快捷方式

# Variables:
urlbar-searchmode-no-keyword2 =
    .title = 关键字搜索已被禁用

urlbar-searchmode-dropmarker2 =
    .title = 请选择搜索引擎
urlbar-searchmode-bookmarks2 = 书签
urlbar-searchmode-tabs2 = 标签页
urlbar-searchmode-history2 = 历史记录
urlbar-searchmode-actions2 = 操作
urlbar-searchmode-exit-button2 =
    .title = 关闭
urlbar-searchmode-default2 =
    .title = 默认搜索引擎

#   $engine (String): the current default search engine.
# Refers to the ability to search using keywords in the address bar
# Shown when adding new search engines from the search mode switcher.
urlbar-searchmode-popup-add-engine = 添加“{ $engineName }”
    .title = 添加搜索引擎“{ $engineName }”

# Variables:
urlbar-searchmode-popup-one-off-header = 本次搜索使用：
#  $engineName (String): The name of the search engine.
urlbar-searchmode-popup-header = 使用以下引擎搜索：
urlbar-searchmode-popup-search-settings-panelitem = 搜索设置
urlbar-searchmode-popup-settings-panelitem = 设置

# Label shown on the top of Searchmode Switcher popup. After this label, the
# available search engines will be listed.
urlbar-result-search-with = 使用 { $engine } 搜索

# Label shown on the top of Searchmode Switcher popup when the search engine won't automatically
# reset after submitting.
# Label prompting user to search with a particular search engine.
urlbar-result-search-with-local-search-mode = { $keywords } - 搜索 { $localSearchMode }

#  $engine (String): the name of a search engine that searches a specific site
# Label for the urlbar result row, prompting the user to use a local keyword to enter search mode.
#  $keywords (String): the restrict keyword to enter search mode.
urlbar-result-search-with-engine-keywords = { $keywords } - 使用 { $engine } 搜索

#  $localSearchMode (String): the local search mode (history, tabs, bookmarks,
#  or actions) to search with.

urlbar-result-action-search-bookmarks = 搜索书签
urlbar-result-action-search-history = 搜索历史记录
urlbar-result-action-search-tabs = 搜索标签页
urlbar-result-action-search-actions = 搜索操作

# Label for the urlbar result row, prompting the user to use engine keywords to enter search mode.
#  $keywords (String): the default keyword and user's set keyword if available
urlbar-result-action-switch-to-tabgroup = 切换到 { $group }
#  $engine (String): the name of a search engine
## Action text shown in urlbar results, usually appended after the search
urlbar-result-action-open-saved-tabgroup = 打开 { $group }

## string or the url, like "result value - action text".

urlbar-view-context-menu-open-in-tab =
  .label = 在新标签页中打开
  .accesskey = w
urlbar-view-context-menu-open-in-container-tab =
  .label = 在新容器标签页中打开
  .accesskey = i
urlbar-view-context-menu-open-in-window =
  .label = 在新窗口中打开
  .accesskey = N
urlbar-view-context-menu-open-in-private-window =
  .label = 在新隐私窗口中打开
  .accesskey = P

## In these actions "Search" is a verb, followed by where the search is performed.

# Label for a quickaction result used to switch to an open tab group.
urlbar-group-firefox-suggest =
  .label = { -firefox-suggest-brand-name }

#  $group (String): the name of the tab group to switch to
# Label for a quickaction result used to re-opan a saved tab group.
#  $group (String): the name of the tab group to re-open
urlbar-group-search-suggestions =
  .label = { $engine } 建议
# A label shown above Quick Actions in the urlbar results.
urlbar-group-quickactions =
  .label = 快速操作

# A label shown above the recent searches group in the urlbar results.
# Variables
#  $engine (String): the name of the search engine used to search.
urlbar-group-recent-searches =
  .label = 最近搜索

# The header shown above trending results.
# Variables:
#  $engine (String): the name of the search engine providing the trending suggestions
urlbar-group-trending =
  .label = { $engine }上的热门趋势

# The result menu labels shown next to trending results.
urlbar-result-menu-trending-dont-show =
    .label = 不展示热门搜索
    .accesskey = D

# A message that replaces a result when the user dismisses all suggestions of a
# particular type.
urlbar-trending-dismissal-acknowledgment = 感谢您提供反馈。您将不再看到热门搜索。

## Reader View toolbar buttons

# This should match menu-view-enter-readerview in menubar.ftl
reader-view-enter-button =
    .aria-label = 进入阅读视图
# This should match menu-view-close-readerview in menubar.ftl
reader-view-close-button =
    .aria-label = 关闭阅读视图

## Picture-in-Picture urlbar button
## Variables:
##   $shortcut (String) - Keyboard shortcut to execute the command.

picture-in-picture-urlbar-button-open =
 .tooltiptext = 启动画中画 ({ $shortcut })

picture-in-picture-urlbar-button-close =
 .tooltiptext = 关闭画中画 ({ $shortcut })

picture-in-picture-panel-header = 画中画
picture-in-picture-panel-headline = 此网站不建议使用画中画
picture-in-picture-panel-body = 在启用画中画的情况下，视频可能会不符合开发者的预期显示效果。
picture-in-picture-enable-toggle =
  .label = 仍启用

## Full Screen and Pointer Lock UI

# Please ensure that the domain stays in the `<span data-l10n-name="domain">` markup.
# Variables
#  $domain (String): the domain that is full screen, e.g. "mozilla.org"
fullscreen-warning-domain = <span data-l10n-name="domain">{ $domain }</span> 现已进入全屏模式
fullscreen-warning-no-domain = 此文档现已进入全屏模式


fullscreen-exit-button = 退出全屏模式 (Esc)
# "esc" is lowercase on mac keyboards, but uppercase elsewhere.
fullscreen-exit-mac-button = 退出全屏模式 (esc)

fullscreen-keyboardlock-exit-button = 退出全屏模式 (按住 Esc)
# "esc" is lowercase on mac keyboards, but uppercase elsewhere.
fullscreen-keyboardlock-exit-mac-button = 退出全屏模式 (按住 esc)

# Please ensure that the domain stays in the `<span data-l10n-name="domain">` markup.
# Variables
#  $domain (String): the domain that is using pointer-lock, e.g. "mozilla.org"
pointerlock-warning-domain = <span data-l10n-name="domain">{ $domain }</span> 已控制您的指针。按 Esc 以收回控制权。
pointerlock-warning-no-domain = 此文档已控制您的指针。按 Esc 以收回控制权。

## Bookmarks panels, menus and toolbar

bookmarks-manage-bookmarks =
  .label = 管理书签
bookmarks-recent-bookmarks-panel-subheader = 最近书签
bookmarks-toolbar-chevron =
  .tooltiptext = 显示更多书签
bookmarks-sidebar-content =
  .aria-label = 书签
bookmarks-menu-button =
  .label = 书签菜单
bookmarks-other-bookmarks-menu =
  .label = 其他书签
bookmarks-mobile-bookmarks-menu =
  .label = 移动书签

## Variables:
##   $isVisible (boolean): if the specific element (e.g. bookmarks sidebar,
##                         bookmarks toolbar, etc.) is visible or not.

bookmarks-tools-sidebar-visibility =
  .label = { $isVisible ->
     [true] 隐藏书签侧边栏
    *[other] 查看书签侧边栏
  }
bookmarks-tools-toolbar-visibility-menuitem =
  .label = { $isVisible ->
     [true] 隐藏书签工具栏
    *[other] 查看书签工具栏
  }
bookmarks-tools-toolbar-visibility-panel =
  .label = { $isVisible ->
     [true] 隐藏书签工具栏
    *[other] 显示书签工具栏
  }

##

bookmarks-search =
  .label = 搜索书签
bookmarks-tools =
  .label = 书签工具
bookmarks-subview-edit-bookmark =
  .label = 编辑此书签…

# The aria-label is a spoken label that should not include the word "toolbar" or
# such, because screen readers already know that this container is a toolbar.
# This avoids double-speaking.
bookmarks-toolbar =
  .toolbarname = 书签工具栏
  .accesskey = B
  .aria-label = 书签
bookmarks-toolbar-menu =
  .label = 书签工具栏
bookmarks-toolbar-placeholder =
  .title = 书签工具栏项目
bookmarks-toolbar-placeholder-button =
  .label = 书签工具栏项目

# "Bookmark" is a verb, as in "Add current tab to bookmarks".
bookmarks-subview-bookmark-tab =
  .label = 将当前标签页添加至书签…

## Library Panel items

library-bookmarks-menu =
  .label = 书签

## Repair text encoding toolbar button

repair-text-encoding-button =
  .label = 修复文本编码
  .tooltiptext = 从页面内容中推测正确的文本编码

## Customize Toolbar Buttons

# Variables:
#  $shortcut (String): keyboard shortcut to open settings (only on macOS)
toolbar-settings-button =
  .label = 设置
  .tooltiptext = { PLATFORM() ->
      [macos] 启动设置 ({ $shortcut })
     *[other] 启动设置
  }

toolbar-overflow-customize-button =
  .label = 自定义工具栏…
  .accesskey = C

toolbar-button-email-link =
  .label = 电子邮件链接
  .tooltiptext = 以电子邮件形式发送此页面的链接

toolbar-button-logins =
  .label = 密码
  .tooltiptext = 查看并管理您已保存的密码

qrcode-panel-error =
    .message = 生成二维码失败。请重新尝试。

qrcode-copy-button =
    .label = 复制
qrcode-copy-success =
    .message = 二维码已复制到剪贴板。
qrcode-copy-error =
    .message = 复制二维码失败。

qrcode-save-button =
    .label = 保存

## Default filenames used when saving a QR code. The file extension (.png)
## is added automatically.

qrcode-save-filename-base = 二维码
# Variables:
#  $domain (String): The current page's domain used in the suggested filename.
qrcode-save-filename-with-domain-base = 二维码-{ $domain }

##

qrcode-window-title = 二维码
qrcode-dialog-title = 二维码
qrcode-image =
    .aria-label = 二维码
qrcode-close-button =
    .aria-label = 关闭

# Variables:
#  $shortcut (String): keyboard shortcut to save a copy of the page
toolbar-button-save-page =
  .label = 保存页面
  .tooltiptext = 保存此页面 ({ $shortcut })

# Variables:
#  $shortcut (String): keyboard shortcut to open a local file
toolbar-button-open-file =
  .label = 打开文件
  .tooltiptext = 打开一个文件 ({ $shortcut })

toolbar-button-synced-tabs =
  .label = 已同步的标签页
  .tooltiptext = 显示来自其他设备的标签页

toolbar-button-send-tab =
  .label = 发送标签页
  .tooltiptext = 将当前标签页发送至其他设备

# Variables
# $shortcut (string) - Keyboard shortcut to open a new private browsing window
toolbar-button-new-private-window =
  .label = 新隐私窗口
  .tooltiptext = 打开一个新的隐私浏览窗口 ({ $shortcut })

toolbar-button-share-tab =
  .label = 共享
  .tooltiptext = 共享此页面

toolbar-button-tab-groups =
  .label = 标签页组
  .tooltiptext = 显示您的标签页组

## EME notification panel

eme-notifications-drm-content-playing = 此站点上的部分音频或视频使用了 DRM 软件，这可能限制 { -brand-short-name } 允许您对其执行的操作。
eme-notifications-drm-content-playing-manage = 管理设置
eme-notifications-drm-content-playing-manage-accesskey = M
eme-notifications-drm-content-playing-dismiss = 消除
eme-notifications-drm-content-playing-dismiss-accesskey = D

## Password save/update panel

panel-save-update-username-2 =
    .label = 用户名
panel-save-update-password-2 =
    .label = 密码

##

# "More" item in macOS share menu
menu-share-more =
    .label = 更多…
menu-share-windows =
    .label = 更多选项
# Variables:
#   $count (Number) - The number of links that will be copied.
menu-share-copy-links =
    .label =
        { $count ->
            [one] 复制链接
           *[other] 复制 { $count } 条链接
        }
    .accesskey = L
ui-tour-info-panel-close =
    .tooltiptext = 关闭

## Variables:
##  $uriHost (String): URI host for which the popup was allowed or blocked.

popups-infobar-allow2 =
    .label = 允许对 { $uriHost } 启用弹出窗口和第三方重定向
    .accesskey = p

##

popups-infobar-dont-show-message2 =
    .label = 当弹出窗口或第三方重定向被阻止时，请勿显示此消息
    .accesskey = D

edit-popup-settings2 =
    .label = 管理弹出窗口和第三方重定向设置…
    .accesskey = M

picture-in-picture-hide-toggle =
    .label = 隐藏画中画切换开关
    .accesskey = H

## Since the default position for PiP controls does not change for RTL layout,
## right-to-left languages should use "Left" and "Right" as in the English strings,

picture-in-picture-move-toggle-right =
    .label = 将画中画切换开关移动至右侧
    .accesskey = R

picture-in-picture-move-toggle-left =
    .label = 将画中画切换开关移动至左侧
    .accesskey = L

##

# Navigator Toolbox

# This string is a spoken label that should not include
# the word "toolbar" or such, because screen readers already know that
# this container is a toolbar. This avoids double-speaking.
navbar-accessible =
    .aria-label = 导航

navbar-downloads =
    .label = 下载

navbar-overflow-2 =
    .tooltiptext = 更多工具

# Variables:
#   $shortcut (String): keyboard shortcut to print the page
navbar-print =
    .label = 打印
    .tooltiptext = 打印此页面… ({ $shortcut })

navbar-home =
    .label = 主页
    .tooltiptext = { -brand-short-name } 主页

navbar-library =
    .label = 库
    .tooltiptext = 查看历史记录、已保存的书签以及更多内容

navbar-search =
    .title = 搜索

# Name for the tabs toolbar as spoken by screen readers. The word
# "toolbar" is appended automatically and should not be included in
# in the string
tabs-toolbar =
    .aria-label = 浏览器选项卡

tabs-toolbar-new-tab =
    .label = 新建选项卡

tabs-toolbar-list-all-tabs =
    .label = 列出所有选项卡
    .tooltiptext = 列出所有选项卡

## Drop indicator text for pinned tabs when no tabs are pinned.

pinned-tabs-drop-indicator = 将选项卡拖放至此处以进行固定

## Infobar shown at startup to suggest session-restore

# <img data-l10n-name="icon"/> will be replaced by the application menu icon
restore-session-startup-suggestion-message = <strong>是否打开之前的选项卡？</strong>您可以从 { -brand-short-name } 应用程序菜单 <img data-l10n-name="icon"/> 中的“历史记录”下恢复之前的会话。
restore-session-startup-suggestion-button = 向您展示操作方法

## Infobar shown when the user tries to open a file picker and file pickers are blocked by enterprise policy

filepicker-blocked-infobar = 您的组织已阻止对此计算机上的本地文件进行访问
## Mozilla data reporting notification (Telemetry, Firefox Health Report, etc)

data-reporting-notification-message = { -brand-short-name } 会自动将某些数据发送至 { -vendor-short-name }，以便我们能够改善您的体验。
data-reporting-notification-button =
    .label = 选择您所共享的内容
    .accesskey = C

# Label for the indicator shown in the private browsing window titlebar.
private-browsing-indicator-label = 私密浏览

# Tooltip for the indicator shown in the private browsing window titlebar.
private-browsing-indicator-tooltip =
    .tooltiptext = 私密浏览

# Tooltip for the indicator shown in the window titlebar when content analysis is active.
# Variables:
#   $agentName (String): The name of the DLP agent that is connected
content-analysis-indicator-tooltip =
    .tooltiptext = 由 { $agentName } 提供的数据丢失防护（DLP）。请单击以获取更多信息。
content-analysis-panel-title = 数据保护
# Variables:
#   $agentName (String): The name of the DLP agent that is connected
content-analysis-panel-text-styled = 您的组织使用 <b>{ $agentName }</b> 来防止数据丢失。<a data-l10n-name="info">了解更多</a>

## Unified extensions (toolbar) button

unified-extensions-button =
    .label = 扩展
    .tooltiptext = 扩展

## Unified extensions button when permission(s) are needed.
## Note that the new line is intentionally part of the tooltip.

unified-extensions-button-permissions-needed =
    .label = 扩展
    .tooltiptext =
        扩展
        需要权限

## Unified extensions button when some extensions are quarantined.
## Note that the new line is intentionally part of the tooltip.

unified-extensions-button-quarantined =
    .label = 扩展
    .tooltiptext =
        扩展
        部分扩展未被允许

## Unified extensions button when some extensions are disabled (e.g. through add-ons blocklist).
## Note that the new line is intentionally part of the tooltip.

unified-extensions-button-blocklisted =
    .label = 扩展
    .tooltiptext =
        扩展
        部分扩展已被禁用

## Private browsing reset button

reset-pbm-toolbar-button2 =
    .label = 清除私密会话
    .tooltiptext = 清除私密会话
reset-pbm-panel-heading2 = 清除数据并启动全新的私密会话？
reset-pbm-panel-description2 = 此操作将删除历史记录、Cookie 及所有其他网站数据，而不会关闭您的私密窗口。
reset-pbm-panel-always-ask-checkbox =
     .label = 始终询问我
     .accesskey = A
reset-pbm-panel-cancel-button =
    .label = 取消
    .accesskey = C
reset-pbm-panel-confirm-button2 =
    .label = 清除私密会话
    .accesskey = l
reset-pbm-panel-complete = 私密会话数据已被删除

## Autorefresh blocker

refresh-blocked-refresh-label = { -brand-short-name } 已阻止此页面自动重新加载。
refresh-blocked-redirect-label = { -brand-short-name } 已阻止此页面自动重定向到另一页面。

refresh-blocked-allow =
    .label = 允许
    .accesskey = A

## Firefox Relay integration

firefox-relay-offer-why-to-use-relay = 我们安全且易于使用的掩码通过隐藏您的电子邮件地址来保护您的身份并防止垃圾邮件。

# Variables:
#  $useremail (String): user email that will receive messages
firefox-relay-offer-what-relay-provides = 发送至您的电子邮件掩码的所有邮件都将被转发至 <strong>{ $useremail }</strong>（除非您决定阻止它们）。

firefox-relay-offer-legal-notice = 通过单击“使用电子邮件掩码”，您同意 <label data-l10n-name="tos-url">服务条款</label> 和 <label data-l10n-name="privacy-url">隐私声明</label>。
firefox-relay-offer-legal-notice-1 = 通过注册并创建电子邮件掩码，您同意 <label data-l10n-name="tos-url">服务条款</label> 和 <label data-l10n-name="privacy-url">隐私声明</label>。

## Add-on Pop-up Notifications

popup-notification-addon-install-unsigned =
    .value = （未经验证）
popup-notification-xpinstall-prompt-learn-more = 了解有关安全安装附加组件的更多信息

popup-notification-xpinstall-prompt-block-url = 查看详情

# Note: Access key is set to p to match "private" in the corresponding localized label.
popup-notification-addon-privatebrowsing-checkbox2 =
    .label = 允许扩展在私密窗口中运行
    .accesskey = p

# This string is similar to `webext-perms-description-data-long-technicalAndInteraction`
# but it is used in the install prompt, and it needs an access key.
popup-notification-addon-technical-and-interaction-checkbox =
    .label = 与扩展开发人员共享技术和交互数据
    .accesskey = S

## Pop-up warning

# Variables:
#   $popupCount (Number): the number of pop-ups blocked.
popup-warning-message =
    { $popupCount ->
        [1] { -brand-short-name } 已阻止此站点打开弹出窗口。
       *[other] { -brand-short-name } 已阻止此站点打开 { $popupCount } 个弹出窗口。
    }

# Variables:
#   $popupCount (Number): the number of pop-ups blocked.
redirect-warning-with-popup-message =
    { $popupCount ->
        [0] { -brand-short-name } 已阻止此站点进行重定向。
        [1] { -brand-short-name } 已阻止此站点打开弹出窗口并进行重定向。
       *[other] { -brand-short-name } 已阻止此站点打开 { $popupCount } 个弹出窗口并进行重定向。
    }

# The singular form is left out for English, since the number of blocked pop-ups is always greater than 1.
# Variables:
#   $popupCount (Number): the number of pop-ups blocked.
popup-warning-exceeded-message =
    { $popupCount ->
       *[other] { -brand-short-name } 已阻止此站点打开超过 { $popupCount } 个弹出窗口。
    }

# Variables:
#   $popupCount (Number): the number of pop-ups blocked.
popup-warning-exceeded-with-redirect-message =
    { $popupCount ->
       *[other] { -brand-short-name } 已阻止此站点打开超过 { $popupCount } 个弹出窗口并进行重定向。
    }

popup-warning-button =
    .label =
        { PLATFORM() ->
            [windows] 选项
           *[other] 首选项
        }
    .accesskey =
        { PLATFORM() ->
            [windows] O
           *[other] P
        }

# Variables:
#   $popupURI (String): the URI for the pop-up window
popup-show-popup-menuitem =
    .label = 显示“{ $popupURI }”

# Variables:
#   $redirectURI (String): the URI for the redirect
popup-trigger-redirect-menuitem =
    .label = 显示“{ $redirectURI }”

## File-picker crash notification ("FilePickerCrashed.sys.mjs")

file-picker-failed-open = Windows 文件对话框未能被启动。您将无法选择任何文件或文件夹。
#   $path (string): The full path to which the file will be saved (e.g., 'C:\Users\Default User\Downloads\readme.txt').
file-picker-failed-save-somewhere = Windows 文件对话框未能被启动。文件将被保存至 { $path }。
file-picker-failed-save-nowhere = Windows 文件对话框未能被启动。未能找到默认文件夹；文件将不会被保存。

file-picker-crashed-open = Windows 文件对话框已发生崩溃。您将无法选择任何文件或文件夹。
#   $path (string): The full path to which the file will be saved (e.g., 'C:\Users\Default User\Downloads\readme.txt').
file-picker-crashed-save-somewhere = Windows 文件对话框已发生崩溃。文件将被保存至 { $path }。
file-picker-crashed-save-nowhere = Windows 文件对话框已发生崩溃。未能找到默认文件夹；文件将不会被保存。

# Button used with file-picker-crashed-save-default. Opens the folder in Windows
# Explorer, with the saved file selected and in focus.
#
# The wording here should be consistent with the Windows variant of
# `downloads-cmd-show-menuitem-2` and similar messages.

file-picker-crashed-show-in-folder =
    .label = 在文件夹中显示
    .accessKey = F

## Onboarding Finish Setup checklist

onboarding-aw-finish-setup-button =
    .label = 完成设置
    .tooltiptext = 完成 { -brand-short-name } 的设置

onboarding-checklist-button-label = 完成设置

## The urlbar trust icon & panel

# LOCALIZATION NOTE (trustpanel-urlbar-notsecure-label):
# Keep this string as short as possible, this is displayed in the URL bar
# use a synonym for "safe" or "private" if "secure" is too long.
urlbar-trust-icon-notsecure-label = 不安全

trustpanel-etp-label-enabled = 增强跟踪保护已开启
trustpanel-etp-label-disabled = 增强跟踪保护已关闭

# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-etp-toggle-on =
  .aria-label = 增强跟踪保护：针对 { $host } 已开启
# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-etp-toggle-off =
  .aria-label = 增强跟踪保护：针对 { $host } 已关闭

trustpanel-etp-description-enabled = 如果此站点出现显示异常，请尝试关闭保护功能。
trustpanel-etp-description-disabled = { -brand-product-name } 认为企业应减少对您的跟踪。当您开启保护功能时，我们将尽可能多地阻止跟踪器。

trustpanel-connection-label-secure = 连接安全
trustpanel-connection-label-insecure = 连接不安全

trustpanel-header-enabled = { -brand-product-name } 正在守护您
trustpanel-description-enabled2 = 您已受到保护。如果我们发现异常，将通知您。
trustpanel-header-enabled-insecure = 请对此站点保持警惕
trustpanel-description-enabled-insecure = { -brand-product-name } 检测到可疑内容。

trustpanel-header-disabled = 您已关闭保护功能
trustpanel-description-disabled = { -brand-product-name } 已下班。建议您重新开启保护功能。

trustpanel-clear-cookies-button = 清除 Cookie 和站点数据
trustpanel-privacy-link = 隐私设置

# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-clear-cookies-header =
    .title = 清除 { $host } 的 Cookie 和站点数据
trustpanel-clear-cookies-description = 移除Cookie和站点数据可能会导致您的登录状态被清除，并清空您的购物车。请知悉。

trustpanel-clear-cookies-subview-button-clear = 清除
trustpanel-clear-cookies-subview-button-cancel = 取消

# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-site-information-header =
    .title = 针对 { $host } 的连接保护

trustpanel-siteinformation-morelink = 查看更多站点信息

trustpanel-blocker-see-all = 查看全部

# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-blocker-header =
    .title = 针对 { $host } 的跟踪保护

## Variables
##  $count (String): the number of trackers blocked.

trustpanel-blocker-section-header2 = { $count ->
  [one] 此站点上已被阻止的跟踪器数量为 <span data-l10n-name="count">{ $count }</span> 个
  *[other] 此站点上已被阻止的跟踪器数量为 <span data-l10n-name="count">{ $count }</span> 个
}
trustpanel-blocker-description = { -brand-product-name }认为公司对您的跟踪频率应当降低。因此，我们正在阻止尽可能多的跟踪器。
trustpanel-blocked-header = { -brand-product-name }已为您阻止以下项目：
trustpanel-tracking-header = { -brand-product-name }已允许以下项目，以确保站点功能不被破坏：
trustpanel-tracking-description = 若无跟踪器，某些按钮、表单和登录字段可能无法正常工作。
trustpanel-insecure-section-header = 您的连接并非安全状态
trustpanel-insecure-description = 您发送至此站点的数据未被加密。这些数据可能被查看、窃取或篡改。

trustpanel-list-label-tracking-cookies = { $count ->
  [one] { $count } 个跨站点跟踪Cookie
  *[other] { $count } 个跨站点跟踪Cookie
}
trustpanel-list-label-tracking-content = 跟踪内容
trustpanel-list-label-fingerprinter =  { $count ->
  [one] { $count } 个数字指纹识别器
  *[other] { $count } 个数字指纹识别器
}
trustpanel-list-label-social-tracking = { $count ->
  [one] { $count } 个社交媒体跟踪器
  *[other] { $count } 个社交媒体跟踪器
}
trustpanel-list-label-cryptominer = { $count ->
  [one] { $count } 个加密货币挖矿器
  *[other] { $count } 个加密货币挖矿器
}
trustpanel-social-tracking-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已阻止 { $count } 个社交媒体跟踪器
  *[other] { -brand-product-name }已阻止 { $count } 个社交媒体跟踪器
}
trustpanel-social-tracking-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已允许 { $count } 个社交媒体跟踪器
  *[other] { -brand-product-name }已允许 { $count } 个社交媒体跟踪器
}

trustpanel-tracking-cookies-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已阻止 { $count } 个跨站点跟踪Cookie
  *[other] { -brand-product-name }已阻止 { $count } 个跨站点跟踪Cookie
}
trustpanel-tracking-cookies-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已允许 { $count } 个跨站点跟踪Cookie
  *[other] { -brand-product-name }已允许 { $count } 个跨站点跟踪Cookie
}

trustpanel-tracking-content-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已阻止 { $count } 个跟踪器
  *[other] { -brand-product-name }已阻止 { $count } 个跟踪器
}
trustpanel-tracking-content-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已允许 { $count } 个跟踪器
  *[other] { -brand-product-name }已允许 { $count } 个跟踪器
}
trustpanel-tracking-content-tab-list-header = 以下站点正在尝试对您进行跟踪：

trustpanel-fingerprinter-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已阻止 { $count } 个数字指纹识别器
  *[other] { -brand-product-name }已阻止 { $count } 个数字指纹识别器
}
trustpanel-fingerprinter-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已允许 { $count } 个数字指纹识别器
  *[other] { -brand-product-name }已允许 { $count } 个数字指纹识别器
}
trustpanel-fingerprinter-list-header = 以下站点正在尝试对您进行数字指纹识别：

trustpanel-cryptominer-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已阻止 { $count } 个加密货币挖矿器
  *[other] { -brand-product-name }已阻止 { $count } 个加密货币挖矿器
}
trustpanel-cryptominer-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name }已允许 { $count } 个加密货币挖矿器
  *[other] { -brand-product-name }已允许 { $count } 个加密货币挖矿器
}
trustpanel-cryptominer-tab-list-header = 以下站点正在尝试进行加密货币挖矿：
# "account on this site" refers to the (breached) site the user is currently visiting, not a Mozilla Monitor account.
trustpanel-breachalerts-anonymous-breached-header = 您在此站点上是否拥有账户？
trustpanel-breachalerts-anonymous-breached-description = { -brand-product-name }已发现此站点在最近12个月内发生过数据泄露事件。请您检查您是否受到影响。
trustpanel-breachalerts-anonymous-breached-button-dismiss = 关闭
trustpanel-breachalerts-anonymous-breached-button-check-monitor = 启动免费扫描

## Reduced Protection Infobar ("ReducedProtectionNotification.sys.mjs")

# "temporarily lower your tracking protection" refers to temporarily decreasing the amount of tracking protection.
reduced-protection-infobar-message = <strong>站点显示异常？</strong>请重新加载页面，以临时降低您的跟踪保护级别。
reduced-protection-infobar-reload-button = 重新加载
  .accesskey = R
reduced-protection-infobar-never-show-button = 不再显示
  .accesskey = D


identity-allow-site-data = 始终为此站点存储Cookie/数据
urlbar-eme-blocked =
    .tooltiptext = 您已阻止此网站播放受DRM控制的内容。
urlbar-webgl-notification-anchor =
    .tooltiptext = 管理WebGL上下文创建权限
urlbar-webgl-blocked = 您已阻止WebGL上下文创建。
.tooltiptext = 您已阻止此网站创建 WebGL 上下文。
