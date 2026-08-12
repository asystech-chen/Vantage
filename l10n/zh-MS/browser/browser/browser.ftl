# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# This is the initial default title for the browser window.
# It gets updated based on loaded tabs or private browsing state.
browser-main-window-default-title = { -brand-full-name }

# Note: only on macOS do we use a `-` separator between the brand name and the
# "Private Browsing" suffix.
browser-main-private-window-title = { PLATFORM() ->
      [macos] { -brand-full-name } —私人的浏览
     *[other] { -brand-full-name } 私人的浏览
  }

# This is only used on macOS; on other OSes we use the full private window
# title (so including the brand name) as a suffix
browser-main-private-suffix-for-content = 私人的浏览

# The non-variable portion of this MUST match the translation of
# "PRIVATE_BROWSING_SHORTCUT_TITLE" in custom.properties
private-browsing-shortcut-text-2 = { -brand-shortcut-name } 私人的浏览

##

urlbar-identity-button =
    .aria-label = 查看位置信息

## Tooltips for images appearing in the address bar

urlbar-services-notification-anchor =
    .tooltiptext = 打开安装报文嵌板
urlbar-web-notification-anchor =
    .tooltiptext = 更改是否你能接收通知从那位置
urlbar-midi-notification-anchor =
    .tooltiptext = 打开 MIDI 嵌板
urlbar-serial-notification-anchor =
    .tooltiptext = 打开连续的嵌板
urlbar-eme-notification-anchor =
    .tooltiptext = 管理使用的 DRM 软设备
urlbar-web-authn-anchor =
    .tooltiptext = 打开网验证嵌板
urlbar-canvas-notification-anchor =
    .tooltiptext = 管理帆布抽出许可
urlbar-web-rtc-share-microphone-notification-anchor =
    .tooltiptext = 管理共享你的扩音器与那位置
urlbar-default-notification-anchor =
    .tooltiptext = 打开报文嵌板
urlbar-geolocation-notification-anchor =
    .tooltiptext = 打开位置请求嵌板
urlbar-localhost-notification-anchor =
    .tooltiptext = 管理本地的装置访问为了此站点
urlbar-local-network-notification-anchor =
    .tooltiptext = 管理共享你的本地的网络访问与此站点
urlbar-xr-notification-anchor =
    .tooltiptext = 打开虚拟实在许可嵌板
urlbar-storage-access-anchor =
    .tooltiptext = 打开浏览活动许可嵌板
urlbar-web-rtc-share-screen-notification-anchor =
    .tooltiptext = 管理共享你的窗口或筛选与那位置
urlbar-indexed-db-notification-anchor =
    .tooltiptext = 打开挂线存放处报文嵌板
urlbar-password-notification-anchor =
    .tooltiptext = 打开保存密码报文嵌板
urlbar-web-rtc-share-devices-notification-anchor =
    .tooltiptext = 管理共享你的摄影和/或扩音器与那位置
# "Speakers" is used in a general sense that might include headphones or
# another audio output connection.
urlbar-web-rtc-share-speaker-notification-anchor =
    .tooltiptext = 管理共享其他的扬声器与那位置
urlbar-autoplay-notification-anchor =
    .tooltiptext = 打开自动播放嵌板
urlbar-persistent-storage-notification-anchor =
    .tooltiptext = 存储器操作资料在固执的存放处
urlbar-addons-notification-anchor =
    .tooltiptext = 打开 add-on 安装报文嵌板
urlbar-search-tips-confirm = 好, 获得它
urlbar-search-tips-confirm-short = 获得它

urlbar-result-menu-button =
    .title = 打开菜单
urlbar-result-menu-button-feedback = 反馈
    .title = 打开菜单
urlbar-result-menu-learn-more =
    .label = 学习更多
    .accesskey = L
urlbar-result-menu-remove-from-history =
    .label = 移除从历史记录
    .accesskey = R
urlbar-result-menu-tip-get-help =
    .label = 获得帮忙
    .accesskey = h
urlbar-result-menu-dismiss-suggestion =
    .label = 解散这提议
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
    .label = 报告错误的位置
urlbar-result-menu-show-less-frequently =
    .label = 显示最低成本估算与调度法频繁
urlbar-result-menu-dont-show-weather-suggestions =
    .label = 不要显示天气提议

# Used for Split Button.
urlbar-splitbutton-dropmarker =
    .title = 打开菜单

# A message shown in the urlbar when the user submits feedback on a suggestion
# (e.g., it shows an inaccurate location, it's shown too often, etc.).
urlbar-feedback-acknowledgment = 谢意为了你的反馈

# A message shown in the urlbar when the user dismisses weather suggestions.
# Weather suggestions won't be shown at all anymore.
urlbar-dismissal-acknowledgment-weather = 谢意为了你的反馈. 你将不看见天气提议再也不.

## Prompts users to use the Urlbar when they open a new tab or visit the
## homepage of their default search engine.
## Variables:
##  $engineName (String): The name of the user's default search engine. e.g. "Google" or "DuckDuckGo".

urlbar-search-tips-onboard = 类型最低成本估算与调度法, 发现更多: 搜索 { $engineName } 右从你的地址棒形图.
urlbar-search-tips-redirect-2 = 启动你的搜索在那地址棒形图到看见提议从 { $engineName } 和你的浏览历史.

# Prompts users to use the Urlbar when they are typing in the domain of a
# search engine, e.g. google.com or amazon.com.
urlbar-tabtosearch-onboard = 选择这快捷方式到发现什么你需要加快.

## Local search mode indicator labels in the urlbar

urlbar-search-mode-bookmarks = 书签
urlbar-search-mode-tabs = 标签页
urlbar-search-mode-history = 历史记录
urlbar-search-mode-actions = 操作

##

urlbar-geolocation-blocked =
    .tooltiptext = 你有阻止位置信息为了这网站（全球资讯网的主机站）.
urlbar-localhost-blocked =
    .tooltiptext = 你有阻止本地的装置连接为了这网站（全球资讯网的主机站）.
urlbar-local-network-blocked =
    .tooltiptext = 你有阻止本地的网络连接为了这网站（全球资讯网的主机站）.
urlbar-xr-blocked =
    .tooltiptext = 你有阻止虚拟实在装置访问为了这网站（全球资讯网的主机站）.
urlbar-web-notifications-blocked =
    .tooltiptext = 你有阻止通知为了这网站（全球资讯网的主机站）.
urlbar-camera-blocked =
    .tooltiptext = 你有阻止你的摄影为了这网站（全球资讯网的主机站）.
urlbar-microphone-blocked =
    .tooltiptext = 你有阻止你的扩音器为了这网站（全球资讯网的主机站）.
urlbar-screen-blocked =
    .tooltiptext = 你有阻止这网站（全球资讯网的主机站）从共享你的筛选.
urlbar-persistent-storage-blocked =
    .tooltiptext = 你有阻止固执的存放处为了这网站（全球资讯网的主机站）.
urlbar-popup-blocked2 =
    .tooltiptext = 你有阻止出现点-ups 和第三-party 重定向为了这网站（全球资讯网的主机站）.
urlbar-autoplay-media-blocked =
    .tooltiptext = 你有阻止自动播放媒质与声音为了这网站（全球资讯网的主机站）.
urlbar-canvas-blocked =
    .tooltiptext = 你有阻止帆布资料抽出为了这网站（全球资讯网的主机站）.
urlbar-midi-blocked =
    .tooltiptext = 你有阻止 MIDI 访问为了这网站（全球资讯网的主机站）.
urlbar-serial-blocked =
    .tooltiptext = 你有阻止连续的端口访问为了这网站（全球资讯网的主机站）.
urlbar-install-blocked =
    .tooltiptext = 你有阻止 add-on 安装为了这网站（全球资讯网的主机站）.

# Variables
#   $shortcut (String) - A keyboard shortcut for the edit bookmark command.
urlbar-star-edit-bookmark =
    .tooltiptext = 编辑这书签 ({ $shortcut })

# Variables
#   $shortcut (String) - A keyboard shortcut for the add bookmark command.
urlbar-star-add-bookmark =
    .tooltiptext = 书签这页 ({ $shortcut })

urlbar-split-view-button =
    .tooltiptext = 拆分查看
    .aria-label = 拆分查看

## Searchbar context menu

clear-search-history =
    .label = 清除搜索历史记录
    .accesskey = H

## Page Action Context Menu

page-action-manage-extension2 =
    .label = 管理扩展名…
    .accesskey = E
page-action-remove-extension2 =
    .label = 移除扩展名
    .accesskey = v

## Auto-hide Context Menu

full-screen-autohide =
    .label = 隐藏工具栏
    .accesskey = H
full-screen-exit =
    .label = 出口完整筛选模式
    .accesskey = F

## Search Engine selection buttons (one-offs)

# This string prompts the user to use the list of search shortcuts in
# the Urlbar and searchbar.
search-one-offs-with-title = 这时间, 搜索与:

search-one-offs-change-settings-compact-button =
    .tooltiptext = 更改搜索设置

search-one-offs-context-open-new-tab =
    .label = 搜索在新的 Tab
    .accesskey = T
search-one-offs-context-set-as-default =
    .label = 日落作为默认搜索引擎
    .accesskey = D
search-one-offs-context-set-as-default-private =
    .label = 日落作为默认搜索引擎为了私人的窗口
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
    .label = 添加“{ $engineName }”
    .tooltiptext = 添加搜索引擎“{ $engineName }”
    .aria-label = 添加搜索引擎“{ $engineName }”
# When more than 5 engines are offered by a web page, they are grouped in a
# submenu using this as its label.
search-one-offs-add-engine-menu =
    .label = 添加搜索引擎

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
quickactions-addons = 查看添加-奥运信息服务（Olympic News Service）
# In English we provide multiple spellings for "add-ons". If that's not
# applicable to your language, only use the correct spelling (don't repeat the
# same word).
quickactions-cmd-addons3 = 扩展名, 他们, 插件, 添加-奥运信息服务（Olympic News Service）

# Opens the bookmarks library window
quickactions-bookmarks2 = 管理书签
quickactions-cmd-bookmarks = 书签

# Opens a SUMO article explaining how to clear history
quickactions-clearrecenthistory = 清除最近的历史记录
quickactions-cmd-clearrecenthistory2 = 饼干, 清除饼干, 高速缓冲存储器, 清除高速缓冲存储器, 浏览资料, 清除浏览资料, 历史记录, 清除最近的历史记录

# Opens about:downloads page
quickactions-downloads2 = 查看下载
quickactions-cmd-downloads = 下载

# Opens about:addons page in the extensions section
quickactions-extensions = 管理扩展名
quickactions-cmd-extensions2 = 扩展名, 插件, 添加-奥运信息服务（Olympic News Service）

# Opens Firefox View
quickactions-firefoxview = 打开 { -firefoxview-brand-name }
# English is using "view" and "open view", since the feature name is
# "Firefox View". If you have translated the name in your language, you
# should use a word related to the existing translation.
quickactions-cmd-firefoxview = 打开 { -firefoxview-brand-name }, { -firefoxview-brand-name }, 打开查看, 查看

# Opens SUMO home page
quickactions-help = { -brand-product-name } 帮忙
quickactions-cmd-help = 帮忙, 支持

# Opens the devtools web inspector
quickactions-inspector2 = 打开显影器工具
quickactions-cmd-inspector2 = 检查员, devtools, 发展（develop）工具

# Opens the devtools eyedropper to pick a color from the page
quickactions-colorpicker = 拾取一个颜色
quickactions-cmd-colorpicker = 颜色啄者, (眼药水)滴管, 拾取颜色

# Opens Firefox Library
quickactions-cmd-library = 库
quickactions-library = 打开库

# Opens about:logins
quickactions-logins2 = 管理密码
quickactions-cmd-logins = 注册(程序), 密码

# Mutes all tabs playing audio
quickactions-mute = 哑子标签页游戏音频的
# List of words that would trigger the "mute tabs" action from the address bar.
# Replace with idiomatic expressions in your language to silence something or
# someone.
quickactions-cmd-mute = 哑子, 嘘, sssssh

# Opens the print dialog
quickactions-print2 = 打印页
quickactions-cmd-print = 打印

# Opens the print dialog at the save to PDF option
quickactions-savepdf = 保存页作为 PDF
quickactions-cmd-savepdf2 = 概率分部函数（Probability Distribution Function）, 保存页

# Opens a new private browsing window
quickactions-private2 = 打开私人的窗口
quickactions-cmd-private = 私人的浏览

# Opens a SUMO article explaining how to refresh
quickactions-refresh = 刷新 { -brand-short-name }
quickactions-cmd-refresh = 刷新

# Restarts the browser
quickactions-restart = 重新启动 { -brand-short-name }
quickactions-cmd-restart = 重新启动

# Opens the screenshot tool
quickactions-screenshot3 = 采取一个屏幕截图
quickactions-cmd-screenshot2 = 屏幕截图, 采取一个屏幕截图

# Opens about:translations
quickactions-translate = 转换
quickactions-cmd-translate = 转换

# Opens about:preferences
quickactions-settings2 = 管理设置
# "manage" should match the corresponding command, which is “Manage settings” in English.
quickactions-cmd-settings2 = 设置, 参数选择, 选项, 管理

# Opens about:addons page in the themes section
quickactions-themes = 管理他们
# In English we provide multiple spellings for "add-ons". If that's not
# applicable to your language, only use the correct spelling (don't repeat the
# same word).
quickactions-cmd-themes2 = 他们, 添加-奥运信息服务（Olympic News Service）, 插件

# Opens a SUMO article explaining how to update the browser
quickactions-update = 更新 { -brand-short-name }
quickactions-cmd-update = 更新

# Opens the view-source UI with current pages source
quickactions-viewsource2 = 查看页来源
quickactions-cmd-viewsource2 = 查看来源, 来源, 页来源

# Opens about:preferences:experimental (Firefox Labs)
quickactions-labs = 打开 { -firefoxlabs-brand-name }
quickactions-cmd-labs = 实验室, 实验

# Tooltip text for the help button shown in the result.
quickactions-learn-more =
    .title = 学习更多关于快的操作

# Will be shown to users the first configurable number of times
# they experience actions giving them instructions on how to
# select the action shown by pressing the tab key.
press-tab-label = 压标签页到选择:

## Bookmark Panel

bookmarks-add-bookmark = 添加书签
bookmarks-edit-bookmark = 编辑书签
bookmark-panel-cancel =
    .label = 取消
    .accesskey = C
# Variables:
#  $count (number): number of bookmarks that will be removed
bookmark-panel-remove =
    .label =
        { $count ->
            [1] 移除书签
           *[other] 移除 { $count } 书签
        }
    .accesskey = R
bookmark-panel-show-editor-checkbox =
    .label = 显示编辑器何时保存
    .accesskey = S
bookmark-panel-save-button =
    .label = 保存

# Width of the bookmark panel.
# Should be large enough to fully display the Done and
# Cancel/Remove Bookmark buttons.
bookmark-panel =
    .style = min-width: 23媒体用毕符

## Identity Panel

# Variables
#  $host (String): the hostname of the site that is being displayed.
identity-site-information = 位置信息为了 { $host }
# Variables
#  $host (String): the hostname of the site that is being displayed.
identity-header-security-with-host =
    .title = 连接安全为了 { $host }
identity-connection-not-secure = 连接不固定
identity-connection-secure = 连接无虑的
identity-connection-failure = 连接故障
identity-connection-internal = 这是一个无虑的 { -brand-short-name } 页.
identity-connection-file = 这页是储存的在你的计算机.
identity-connection-associated = 这页是有负载的从另外的页.
identity-extension-page = 这页是有负载的从一个扩展名.
identity-active-blocked = { -brand-short-name } 有阻止部分的这页那是不固定.
identity-custom-root = 连接已查清的由一个证书发行者那是不经过验证的由摩斯拉.
identity-passive-loaded = 部分的这页是不固定 (如此的作为复数虚部).
identity-active-loaded = 你有禁用保护在这页.
identity-weak-encryption = 这页使用不牢固的加密.

identity-https-only-connection-upgraded = (更新的到 HTTPS)
identity-https-only-label2 = 自动地升级此站点到一个无虑的连接
identity-https-only-dropdown-on =
    .label = 在
identity-https-only-dropdown-off =
    .label = 关闭
identity-https-only-dropdown-off-temporarily =
    .label = 关闭暂时
identity-https-only-info-turn-on3 = 转弯在 HTTPS 提升( upgrade的第三人称单数 ) 为了此站点如果你想要 { -brand-short-name } 到升级那连接何时可能的.
identity-https-only-info-turn-off3 = 如果那页象是坏掉的, 你可以想要到使旋转关闭 HTTPS 提升( upgrade的第三人称单数 ) 为了此站点到再装使用不安全的 HTTP.
identity-https-only-info-no-upgrade = 不能的到升级连接从 HTTP.

identity-permissions-storage-access-header = 交叉-site 饼干
identity-permissions-storage-access-hint = 这些宴会能使用交叉-site Cookie 和站点数据一会儿你是在此站点.
identity-permissions-storage-access-learn-more = 学习更多

identity-permissions-reload-hint = 你可以需要到再装那页为了更改以应用.
identity-clear-site-data =
    .label = 清除 Cookie 和站点数据…
identity-connection-not-secure-security-view = 你是不安全地连接的到此站点.
identity-connection-verified = 你是安全地连接的到此站点.
identity-ev-owner-label = 证书发布到:
identity-verifier-label = 已查清的由:
# "qualified" here refers to the qualified website authentication certificate presented by the site.
identity-etsi = 有资格的作为规定的在调整 (EU) 2024/1183.
identity-description-custom-root2 = 摩斯拉做不认出这证书发行者. 它可以有是额外的从你的操作的系统或由一个管理人.
identity-cert-exception-overridden = 你有额外的一个安全例外为了此站点.
identity-remove-cert-exception =
    .label = 移除例外
    .accesskey = R
identity-description-insecure = 你的连接到此站点是不私人的. 信息你提交能够是看（view的过去式与过去分词形式）由其他的 (相似的密码, 报文, 信用量卡片, 及其他.).
identity-description-weak-cipher-intro = 你的连接到这网站（全球资讯网的主机站）使用不牢固的加密和是不私人的.
identity-description-weak-cipher-risk = 其他的人能查看你的信息或修改那 website's 行为.
identity-description-active-blocked2 = { -brand-short-name } 有阻止部分的这页那是不固定.
identity-description-passive-loaded = 你的连接是不私人的和信息你均分与那位置能够是看（view的过去式与过去分词形式）由其他的.
identity-description-passive-loaded-insecure2 = 这网站（全球资讯网的主机站）包含内容那是不固定 (如此的作为复数虚部).
identity-description-passive-loaded-mixed2 = 虽然 { -brand-short-name } 有阻止一些内容, 那里是仍然内容在那页那是不固定 (如此的作为复数虚部).
identity-description-active-loaded = 这网站（全球资讯网的主机站）包含内容那是不固定 (如此的作为手写体) 和你的连接到它是不私人的.
identity-description-active-loaded-insecure = 信息你均分与此站点能够是看（view的过去式与过去分词形式）由其他的 (相似的密码, 报文, 信用量卡片, 及其他.).
identity-more-info-link-text =
    .label = 更多信息

## Window controls

browser-window-minimize-button =
    .tooltiptext = 最小化
browser-window-maximize-button =
    .tooltiptext = 最大化
browser-window-restore-down-button =
    .tooltiptext = 回复向下
browser-window-close-button =
    .tooltiptext = 关闭
# Clicking this button closes the window and returns to the tab where it was opened from
browser-window-return-to-opener =
    .tooltiptext = Return

## Bookmarks toolbar items

browser-import-button2 =
    .label = 引入书签…
    .tooltiptext = 引入书签从另外的浏览器到 { -brand-short-name }.

bookmarks-toolbar-empty-message = 为了新长出的肉访问, 地方你的书签这里在那书签工具栏. <a data-l10n-name="manage-bookmarks">管理书签…</a>

## WebRTC Pop-up notifications

popup-select-camera-device =
    .value = 摄影:
    .accesskey = C
popup-select-camera-icon =
    .tooltiptext = 摄影
popup-select-microphone-device =
    .value = 扩音器:
    .accesskey = M
popup-select-microphone-icon =
    .tooltiptext = 扩音器
popup-select-speaker-icon =
    .tooltiptext = 扬声器
popup-select-window-or-screen =
    .label = 窗口或筛选:
    .accesskey = W
popup-all-windows-shared = 所有的可见物窗口在你的筛选将是共享的.

## WebRTC window or screen share tab switch warning

sharing-warning-window = 你是共享 { -brand-short-name }. 其他的人能看见何时你开关到一个新的标签页.
sharing-warning-screen = 你是共享你的整个筛选. 其他的人能看见何时你开关到一个新的标签页.
sharing-warning-proceed-to-tab =
  .label = 继续进行到 Tab
sharing-warning-disable-for-session =
  .label = 禁用共享保护为了这会话

## WebSerial "select a port" popup

webserial-select-port-label = 选择一个连续的端口:
webserial-no-ports-available = 无连续的端口可利用的

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
  .placeholder = Enter 地址

# This placeholder is used in search mode with search engines that search the
# entire web.
# Variables
#  $name (String): the name of a search engine that searches the entire Web
#  (e.g. Google).
urlbar-placeholder-search-mode-web-2 =
  .placeholder = 搜索那网
  .aria-label = 搜索与 { $name }

# This placeholder is used in search mode with search engines that search a
# specific site (e.g., Amazon).
# Variables
#  $name (String): the name of a search engine that searches a specific site
#  (e.g. Amazon).
urlbar-placeholder-search-mode-other-engine =
  .placeholder = Enter 搜索检索词
  .aria-label = 搜索 { $name }

# This placeholder is used when searching bookmarks.
urlbar-placeholder-search-mode-other-bookmarks =
  .placeholder = Enter 搜索检索词
  .aria-label = 搜索书签

# This placeholder is used when searching history.
urlbar-placeholder-search-mode-other-history =
  .placeholder = Enter 搜索检索词
  .aria-label = 搜索历史记录

# This placeholder is used when searching open tabs.
urlbar-placeholder-search-mode-other-tabs =
  .placeholder = Enter 搜索检索词
  .aria-label = 搜索标签页

# This placeholder is used when searching quick actions.
urlbar-placeholder-search-mode-other-actions =
  .placeholder = Enter 搜索检索词
  .aria-label = 搜索操作

# Variables
#  $name (String): the name of the user's default search engine
urlbar-placeholder-with-name =
  .placeholder = 搜索与 { $name } 或输入地址

# Variables
#  $component (String): the name of the component which forces remote control.
#    Example: "DevTools", "Marionette", "RemoteAgent".
urlbar-remote-control-notification-anchor2 =
  .tooltiptext = 浏览器是在...之下远程控制 (理由: { $component })
urlbar-permissions-granted =
  .tooltiptext = 你有算是如此这网站（全球资讯网的主机站）附加的许可.
urlbar-switch-to-tab =
  .value = 开关到标签页:

# Used to indicate that a selected autocomplete entry is provided by an extension.
urlbar-extension =
  .value = 扩展名:

urlbar-go-button2 =
  .title = 去到那地址在那位置棒形图
urlbar-page-action-button =
  .tooltiptext = 页操作
urlbar-revert-button =
  .tooltiptext = 显示那地址在那位置棒形图

## Action text shown in urlbar results, usually appended after the search
## string or the url, like "result value - action text".

# Used for asking AI assistant chat.
urlbar-result-action-ai-chat = 询问
# Used when the private browsing engine differs from the default engine.
# The "with" format was chosen because the search engine name can end with
# "Search", and we would like to avoid strings like "Search MSN Search".
# Variables
#  $engine (String): the name of a search engine
urlbar-result-action-search-in-private-w-engine = 搜索与 { $engine } 在一个私人的窗口
# Used when the private browsing engine is the same as the default engine.
urlbar-result-action-search-in-private = 搜索在一个私人的窗口
# The "with" format was chosen because the search engine name can end with
# "Search", and we would like to avoid strings like "Search MSN Search".
# Variables
#  $engine (String): the name of a search engine
urlbar-result-action-search-w-engine = 搜索与 { $engine }
urlbar-result-action-sponsored = 赞助( sponsor的过去式和过去分词)
urlbar-result-action-switch-tab = 开关到 Tab
urlbar-result-action-move-tab-to-split-view = 移动 Tab 到拆分查看
urlbar-result-action-visit = 拜访
# "Switch to tab with container" is used when the target tab is located in a
# different container.
# Variables
# $container (String): the name of the target container
urlbar-result-action-switch-tab-with-container = 开关到 Tab · <span>{ $container }</span>
# Used when the target tab is in a tab group that doesn't have a label.
urlbar-result-action-tab-group-unnamed = 无名的创建组
# Allows the user to visit a URL that was previously copied to the clipboard.
urlbar-result-action-visit-from-clipboard = 拜访从剪贴板
# Directs a user to press the Tab key to perform a search with the specified
# engine.
# Variables
#  $engine (String): the name of a search engine that searches the entire Web
#  (e.g. Google).
urlbar-result-action-before-tabtosearch-web = 压 Tab 到搜索与 { $engine }
# Directs a user to press the Tab key to perform a search with the specified
# engine.
# Variables
#  $engine (String): the name of a search engine that searches a specific site
#  (e.g. Amazon).
urlbar-result-action-before-tabtosearch-other = 压 Tab 到搜索 { $engine }
# Variables
#  $engine (String): the name of a search engine that searches the entire Web
#  (e.g. Google).
urlbar-result-action-tabtosearch-web = 搜索与 { $engine } 直接的从那地址棒形图
# Variables
#  $engine (String): the name of a search engine that searches a specific site
#  (e.g. Amazon).
urlbar-result-action-tabtosearch-other-engine = 搜索 { $engine } 直接的从那地址棒形图
# Action text for copying to clipboard.
urlbar-result-action-copy-to-clipboard = 复制
# The string returned for an undefined calculator result such as when dividing by 0
urlbar-result-action-undefined-calculator-result = 不明确的

## "Last visited" and "bookmarked" explanation strings. For bookmarks and urlbar
## results with last-visited dates like history and top sites, these strings
## explain why the result is shown.

# This explanation is used when the last-visited date is formatted as one of the
# following relative dates: "yesterday", "today"
# Variables:
#   $date (string) - A localized relative date string
urlbar-result-explanation-last-visited-relative = 你持续拜访 { $date }

# This explanation is used when the last-visited date is a small number of days
# in the past.
# Variables:
#   $daysAgo (number) - The number of days ago
urlbar-result-explanation-last-visited-days =
    { $daysAgo ->
        [one] 你持续拜访 { $daysAgo } 天以前
        *[other] 你持续拜访 { $daysAgo } 一生以前
    }

# This explanation is used when the last-visited date is a small number of weeks
# in the past.
# Variables:
#   $weeksAgo (number) - The number of weeks ago
urlbar-result-explanation-last-visited-weeks =
    { $weeksAgo ->
        [one] 你持续拜访 { $weeksAgo } 星期以前
        *[other] 你持续拜访 { $weeksAgo } 星期以前
    }

# This explanation is used when the last-visited date is a small number of
# months in the past.
# Variables:
#   $monthsAgo (number) - The number of months ago
urlbar-result-explanation-last-visited-months =
    { $monthsAgo ->
        [one] 你持续拜访 { $monthsAgo } 月以前
        *[other] 你持续拜访 { $monthsAgo } 月以前
    }

# This explanation is used when the last-visited date is further in the past.
# The date will be formatted as an absolute date like: "11 May", "11 May 2026"
# Variables:
#   $date (string) - A localized absolute date string
urlbar-result-explanation-last-visited-absolute = 你持续拜访在 { $date }

# This explanation is used when the result is bookmarked. The date will be
# formatted as an absolute date like: "11 May", "11 May 2026"
# Variables:
#   $date (string) - A localized absolute date string
urlbar-result-explanation-bookmarked = 书签( bookmark的过去式和过去分词 ) { $date }

# The sub title of an add-on suggestion in the urlbar.
urlbar-result-addons-subtitle = { -brand-product-name } 扩展名

# The sub title of a mdn suggestion in the urlbar.
urlbar-result-mdn-subtitle = { -mdn-brand-name }

# The sub title of a Yelp suggestion in the urlbar.
urlbar-result-yelp-subtitle = { -yelp-brand-name }

# This string explaining that the suggestion is a recommendation.
urlbar-result-suggestion-recommended = 被推荐的

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
urlbar-result-weather-title = <strong>{ $temperature }°{ $unit }</strong> 在 { $city }, { $region }

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
urlbar-result-weather-title-with-country = <strong>{ $temperature }°{ $unit }</strong> 在 { $city }, { $region }, { $country }

# The title of a weather suggestion in the urlbar only including the city. The
# temperature and unit substring should be inside a <strong> tag. If the
# temperature and unit are not adjacent in the localization, it's OK to include
# only the temperature in the tag.
# Variables:
#   $temperature (number) - The temperature value
#   $unit (String) - The unit for the temperature, either "C" or "F"
#   $city (String) - The name of the city the weather data is for
urlbar-result-weather-title-city-only = <strong>{ $temperature }°{ $unit }</strong> 在 { $city }

# Shows the name of the provider of weather data in a weather suggestion in the
# urlbar.
# Variables:
#   $provider (String) - The name of the weather-data provider. It will be the
#       name of a company, organization, or service.
urlbar-result-weather-provider-sponsored = { $provider } ·赞助( sponsor的过去式和过去分词)

## These strings are used for Realtime suggestions in the urlbar.
## Market refers to stocks, indexes, and funds.

# This string is shown as title when Market suggestion are disabled.
urlbar-result-market-opt-in-title = 获得树干市场资料右在你的搜索棒形图

# This string is shown as description when Market suggestion are disabled.
urlbar-result-market-opt-in-description = 显示市场更新和更多从我们的合伙人何时你均分搜索查询资料与 { -vendor-short-name }. <a data-l10n-name="learn-more-link">学习更多</a>

# This string is shown as button to activate online when realtime suggestion are disabled.
urlbar-result-realtime-opt-in-allow = 显示提议

# This string is shown in split button to dismiss activation the Realtime suggestion.
urlbar-result-realtime-opt-in-not-now = 不现在
urlbar-result-realtime-opt-in-dismiss = 解散
urlbar-result-realtime-opt-in-dismiss-all =
    .label = 不要显示这些提议

# This string is shown in the result menu.
urlbar-result-menu-dont-show-market =
  .label = 不要显示市场提议

# A message that replaces a result when the user dismisses Market suggestions.
urlbar-result-dismissal-acknowledgment-market = 谢意为了你的反馈. 你将不看见市场提议再也不.

# This a11y label is read by screen readers when an item in the row is selected.
urlbar-result-aria-group-market =
  .aria-label = 树干市场提议

# A message that replaces a result when the user dismisses all suggestions of a
# particular type.
urlbar-result-dismissal-acknowledgment-all = 谢意为了你的反馈. 你将不看见这些提议再也不.

## These strings are used for suggestions of important dates in the urlbar.

# The name of an event and the number of days until it starts separated by a
# middot.
# Variables:
#   $name (string) - The name of the event.
#   $daysUntilStart (integer) - The number of days until the event starts.
urlbar-result-dates-countdown =
    { $daysUntilStart ->
        [one] { $name } ·在 { $daysUntilStart } 天
        *[other] { $name } ·在 { $daysUntilStart } 一生
    }

# The name of a multiple day long event and the number of days until it starts
# separated by a middot.
# Variables:
#   $name (string) - The name of the event.
#   $daysUntilStart (integer) - The number of days until the event starts.
urlbar-result-dates-countdown-range =
    { $daysUntilStart ->
        [one] { $name } ·启动在 { $daysUntilStart } 天
        *[other] { $name } ·启动在 { $daysUntilStart } 一生
    }

# The name of a multiple day long event and the number of days until it ends
# separated by a middot.
# Variables:
#   $name (string) - The name of the event.
#   $daysUntilEnd (integer) - The number of days until the event ends.
urlbar-result-dates-ongoing =
    { $daysUntilEnd ->
        [one] { $name } ·目的在 { $daysUntilEnd } 天
        *[other] { $name } ·目的在 { $daysUntilEnd } 一生
    }

# The name of an event and a note that it is happening today separated by a
# middot.
# Variables:
#   $name (string) - The name of the event.
urlbar-result-dates-today = { $name } ·今天

# The name of multiple day long event and a note that it is ends today
# separated by a middot.
# Variables:
#   $name (string) - The name of the event.
urlbar-result-dates-ends-today = { $name } ·目的今天

## Strings used for buttons in the urlbar

# Searchmode Switcher button
# Variables:
#   $engine (String): the current default search engine.
urlbar-searchmode-button3 =
    .title = { $engine }, 拾取一个搜索引擎
urlbar-searchmode-button-no-engine2 =
    .title = 无快捷方式被选的, 拾取一个快捷方式

# Refers to the ability to search using keywords in the address bar
urlbar-searchmode-no-keyword2 =
    .title = 关键字搜索是禁用

urlbar-searchmode-dropmarker2 =
    .title = 拾取一个搜索引擎
urlbar-searchmode-bookmarks2 = 书签
urlbar-searchmode-tabs2 = 标签页
urlbar-searchmode-history2 = 历史记录
urlbar-searchmode-actions2 = 操作
urlbar-searchmode-exit-button2 =
    .title = 关闭
urlbar-searchmode-default2 =
    .title = 默认搜索引擎

# Shown when adding new search engines from the search mode switcher.
# Variables:
#  $engineName (String): The name of the search engine.
urlbar-searchmode-popup-add-engine = 添加“{ $engineName }”
    .title = 添加搜索引擎“{ $engineName }”

# Label shown on the top of Searchmode Switcher popup. After this label, the
# available search engines will be listed.
urlbar-searchmode-popup-one-off-header = 这时间搜索与:
# Label shown on the top of Searchmode Switcher popup when the search engine won't automatically
# reset after submitting.
urlbar-searchmode-popup-header = 搜索与:
urlbar-searchmode-popup-search-settings-panelitem = 搜索设置
urlbar-searchmode-popup-settings-panelitem = 设置

# Label prompting user to search with a particular search engine.
#  $engine (String): the name of a search engine that searches a specific site
urlbar-result-search-with = 搜索与 { $engine }

# Label for the urlbar result row, prompting the user to use a local keyword to enter search mode.
#  $keywords (String): the restrict keyword to enter search mode.
#  $localSearchMode (String): the local search mode (history, tabs, bookmarks,
#  or actions) to search with.
urlbar-result-search-with-local-search-mode = { $keywords } - 搜索 { $localSearchMode }

# Label for the urlbar result row, prompting the user to use engine keywords to enter search mode.
#  $keywords (String): the default keyword and user's set keyword if available
#  $engine (String): the name of a search engine
urlbar-result-search-with-engine-keywords = {$keywords} - 搜索与 { $engine }

## Action text shown in urlbar results, usually appended after the search
## string or the url, like "result value - action text".
## In these actions "Search" is a verb, followed by where the search is performed.

urlbar-result-action-search-bookmarks = 搜索书签
urlbar-result-action-search-history = 搜索历史记录
urlbar-result-action-search-tabs = 搜索标签页
urlbar-result-action-search-actions = 搜索操作

# Label for a quickaction result used to switch to an open tab group.
#  $group (String): the name of the tab group to switch to
urlbar-result-action-switch-to-tabgroup = 开关到 { $group }
# Label for a quickaction result used to re-opan a saved tab group.
#  $group (String): the name of the tab group to re-open
urlbar-result-action-open-saved-tabgroup = 打开 { $group }

## Used in the context menu in urlbar view.

urlbar-view-context-menu-open-in-tab =
  .label = 打开在新的 Tab
  .accesskey = w
urlbar-view-context-menu-open-in-container-tab =
  .label = 打开在新的容器 Tab
  .accesskey = i
urlbar-view-context-menu-open-in-window =
  .label = 打开在新的窗口
  .accesskey = N
urlbar-view-context-menu-open-in-private-window =
  .label = 打开在新的私人的窗口
  .accesskey = P

## Labels shown above groups of urlbar results

# A label shown above the "Firefox Suggest" (bookmarks/history) group in the
# urlbar results.
urlbar-group-firefox-suggest =
  .label = { -firefox-suggest-brand-name }

# A label shown above the search suggestions group in the urlbar results. It
# should use sentence case.
# Variables
#  $engine (String): the name of the search engine providing the suggestions
urlbar-group-search-suggestions =
  .label = { $engine } 提议

# A label shown above Quick Actions in the urlbar results.
urlbar-group-quickactions =
  .label = 快的操作

# A label shown above the recent searches group in the urlbar results.
# Variables
#  $engine (String): the name of the search engine used to search.
urlbar-group-recent-searches =
  .label = 最近的搜索

# The header shown above trending results.
# Variables:
#  $engine (String): the name of the search engine providing the trending suggestions
urlbar-group-trending =
  .label = 伸向( trend的现在分词 ) 在 { $engine }

# The result menu labels shown next to trending results.
urlbar-result-menu-trending-dont-show =
    .label = 不要显示伸向( trend的现在分词 ) 搜索
    .accesskey = D

# A message that replaces a result when the user dismisses all suggestions of a
# particular type.
urlbar-trending-dismissal-acknowledgment = 谢意为了你的反馈. 你将不看见伸向( trend的现在分词 ) 搜索再也不.

## Reader View toolbar buttons

# This should match menu-view-enter-readerview in menubar.ftl
reader-view-enter-button =
    .aria-label = Enter 阅读程序查看
# This should match menu-view-close-readerview in menubar.ftl
reader-view-close-button =
    .aria-label = 关闭阅读程序查看

## Picture-in-Picture urlbar button
## Variables:
##   $shortcut (String) - Keyboard shortcut to execute the command.

picture-in-picture-urlbar-button-open =
 .tooltiptext = 打开图象-在-图象 ({ $shortcut })

picture-in-picture-urlbar-button-close =
 .tooltiptext = 关闭图象-在-图象 ({ $shortcut })

picture-in-picture-panel-header = 图象-在-图象
picture-in-picture-panel-headline = 这网站（全球资讯网的主机站）做不推荐图象-在-图象
picture-in-picture-panel-body = 视频文件可能不显示器作为那显影器有意的一会儿图象-在-图象是启用.
picture-in-picture-enable-toggle =
  .label = 启用无论如何

## Full Screen and Pointer Lock UI

# Please ensure that the domain stays in the `<span data-l10n-name="domain">` markup.
# Variables
#  $domain (String): the domain that is full screen, e.g. "mozilla.org"
fullscreen-warning-domain = <span data-l10n-name="domain">{ $domain }</span> 是现在完整筛选
fullscreen-warning-no-domain = 这文档是现在完整筛选


fullscreen-exit-button = 出口完整筛选 (Esc)
# "esc" is lowercase on mac keyboards, but uppercase elsewhere.
fullscreen-exit-mac-button = 出口完整筛选 (转义字符)

fullscreen-keyboardlock-exit-button = 出口完整筛选 (压和保留 Esc)
# "esc" is lowercase on mac keyboards, but uppercase elsewhere.
fullscreen-keyboardlock-exit-mac-button = 出口完整筛选 (压和保留转义字符)

# Please ensure that the domain stays in the `<span data-l10n-name="domain">` markup.
# Variables
#  $domain (String): the domain that is using pointer-lock, e.g. "mozilla.org"
pointerlock-warning-domain = <span data-l10n-name="domain">{ $domain }</span> 有控制的你的指针. 压 Esc 到采取后面的控制.
pointerlock-warning-no-domain = 这文档有控制的你的指针. 压 Esc 到采取后面的控制.

## Bookmarks panels, menus and toolbar

bookmarks-manage-bookmarks =
  .label = 管理书签
bookmarks-recent-bookmarks-panel-subheader = 最近的书签
bookmarks-toolbar-chevron =
  .tooltiptext = 显示更多书签
bookmarks-sidebar-content =
  .aria-label = 书签
bookmarks-menu-button =
  .label = 书签菜单
bookmarks-other-bookmarks-menu =
  .label = 其他的书签
bookmarks-mobile-bookmarks-menu =
  .label = 移动的书签

## Variables:
##   $isVisible (boolean): if the specific element (e.g. bookmarks sidebar,
##                         bookmarks toolbar, etc.) is visible or not.

bookmarks-tools-sidebar-visibility =
  .label = { $isVisible ->
     [true] 隐藏书签其他选项
    *[other] 查看书签其他选项
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
  .label = 书签( bookmark的现在分词 ) 工具
bookmarks-subview-edit-bookmark =
  .label = 编辑这书签…

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
  .title = 书签工具栏项
bookmarks-toolbar-placeholder-button =
  .label = 书签工具栏项

# "Bookmark" is a verb, as in "Add current tab to bookmarks".
bookmarks-subview-bookmark-tab =
  .label = 书签当前的标签页…

## Library Panel items

library-bookmarks-menu =
  .label = 书签

## Repair text encoding toolbar button

repair-text-encoding-button =
  .label = 修理电文编码
  .tooltiptext = 猜测正确的电文编码从页内容

## Customize Toolbar Buttons

# Variables:
#  $shortcut (String): keyboard shortcut to open settings (only on macOS)
toolbar-settings-button =
  .label = 设置
  .tooltiptext = { PLATFORM() ->
      [macos] 打开设置 ({ $shortcut })
     *[other] 打开设置
  }

toolbar-overflow-customize-button =
  .label = 定制工具栏…
  .accesskey = C

toolbar-button-email-link =
  .label = 电子信函连接
  .tooltiptext = 电子信函一个连接到这页

toolbar-button-logins =
  .label = 密码
  .tooltiptext = 查看和管理你的保存密码

qrcode-panel-error =
    .message = 失败的到产生 QR 代码. 请试再一次.

qrcode-copy-button =
    .label = 复制
qrcode-copy-success =
    .message = QR 代码已复制的到剪贴板.
qrcode-copy-error =
    .message = 失败的到复制 QR 代码.

qrcode-save-button =
    .label = 保存

## Default filenames used when saving a QR code. The file extension (.png)
## is added automatically.

qrcode-save-filename-base = qrcode
# Variables:
#  $domain (String): The current page's domain used in the suggested filename.
qrcode-save-filename-with-domain-base = qrcode-{ $domain }

##

qrcode-window-title = QR 代码
qrcode-dialog-title = QR 代码
qrcode-image =
    .aria-label = QR 代码
qrcode-close-button =
    .aria-label = 关闭

# Variables:
#  $shortcut (String): keyboard shortcut to save a copy of the page
toolbar-button-save-page =
  .label = 保存页
  .tooltiptext = 保存这页 ({ $shortcut })

# Variables:
#  $shortcut (String): keyboard shortcut to open a local file
toolbar-button-open-file =
  .label = 打开文件
  .tooltiptext = 打开一个文件 ({ $shortcut })

toolbar-button-synced-tabs =
  .label = synchronization 的缩略词标签页
  .tooltiptext = 显示标签页从其他的德维克（男子名、姓氏）

toolbar-button-send-tab =
  .label = 发送标签页
  .tooltiptext = 发送当前的标签页到另外的装置

# Variables
# $shortcut (string) - Keyboard shortcut to open a new private browsing window
toolbar-button-new-private-window =
  .label = 新的私人的窗口
  .tooltiptext = 打开一个新的私人的浏览窗口 ({ $shortcut })

toolbar-button-share-tab =
  .label = 部分
  .tooltiptext = 部分这页

toolbar-button-tab-groups =
  .label = Tab 创建组
  .tooltiptext = 显示你的标签页创建组

## EME notification panel

eme-notifications-drm-content-playing = 一些音频的或影像在此站点使用 DRM 软设备, 哪个可以限制什么 { -brand-short-name } 能让你做与它.
eme-notifications-drm-content-playing-manage = 管理设置
eme-notifications-drm-content-playing-manage-accesskey = M
eme-notifications-drm-content-playing-dismiss = 解散
eme-notifications-drm-content-playing-dismiss-accesskey = D

## Password save/update panel

panel-save-update-username-2 =
    .label = 由字母或数字组成的用户名称
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
            [one] 复制连接
           *[other] 复制 { $count } 连接
        }
    .accesskey = L
ui-tour-info-panel-close =
    .tooltiptext = 关闭

## Variables:
##  $uriHost (String): URI host for which the popup was allowed or blocked.

popups-infobar-allow2 =
    .label = 允许出现点-ups 和第三-party 重定向为了 { $uriHost }
    .accesskey = p

##

popups-infobar-dont-show-message2 =
    .label = 不要显示这报文何时出现点-ups 或第三-party 重定向是阻止
    .accesskey = D

edit-popup-settings2 =
    .label = 管理出现点-up 和第三-party 重定向设置…
    .accesskey = M

picture-in-picture-hide-toggle =
    .label = 隐藏图象-在-图象切换
    .accesskey = H

## Since the default position for PiP controls does not change for RTL layout,
## right-to-left languages should use "Left" and "Right" as in the English strings,

picture-in-picture-move-toggle-right =
    .label = 移动图象-在-图象切换到右旁边
    .accesskey = R

picture-in-picture-move-toggle-left =
    .label = 移动图象-在-图象切换到离开旁边
    .accesskey = L

##

# Navigator Toolbox

# This string is a spoken label that should not include
# the word "toolbar" or such, because screen readers already know that
# this container is a toolbar. This avoids double-speaking.
navbar-accessible =
    .aria-label = 航行

navbar-downloads =
    .label = 下载

navbar-overflow-2 =
    .tooltiptext = 更多工具

# Variables:
#   $shortcut (String): keyboard shortcut to print the page
navbar-print =
    .label = 打印
    .tooltiptext = 打印这页… ({ $shortcut })

navbar-home =
    .label = 主页
    .tooltiptext = { -brand-short-name } 主页页

navbar-library =
    .label = 库
    .tooltiptext = 查看历史记录, 保存书签, 和更多

navbar-search =
    .title = 搜索

# Name for the tabs toolbar as spoken by screen readers. The word
# "toolbar" is appended automatically and should not be included in
# in the string
tabs-toolbar =
    .aria-label = 浏览器标签页

tabs-toolbar-new-tab =
    .label = 新的 Tab

tabs-toolbar-list-all-tabs =
    .label = 列表所有的标签页
    .tooltiptext = 列表所有的标签页

## Drop indicator text for pinned tabs when no tabs are pinned.

pinned-tabs-drop-indicator = 投入标签页这里到将...用针别住

## Infobar shown at startup to suggest session-restore

# <img data-l10n-name="icon"/> will be replaced by the application menu icon
restore-session-startup-suggestion-message = <strong>打开早先的标签页?</strong> 你能回复你的早先的会话从那 { -brand-short-name } 应用菜单 <img data-l10n-name="icon"/>, 在...之下历史记录.
restore-session-startup-suggestion-button = 显示我如何

## Infobar shown when the user tries to open a file picker and file pickers are blocked by enterprise policy

filepicker-blocked-infobar = 你的组织有阻止访问到本地的文件在这计算机

## Mozilla data reporting notification (Telemetry, Firefox Health Report, etc)

data-reporting-notification-message = { -brand-short-name } 自动地发送一些资料到 { -vendor-short-name } 如此那我们能改良你的经历.
data-reporting-notification-button =
    .label = 选取什么电流均分
    .accesskey = C

# Label for the indicator shown in the private browsing window titlebar.
private-browsing-indicator-label = 私人的浏览

# Tooltip for the indicator shown in the private browsing window titlebar.
private-browsing-indicator-tooltip =
    .tooltiptext = 私人的浏览

# Tooltip for the indicator shown in the window titlebar when content analysis is active.
# Variables:
#   $agentName (String): The name of the DLP agent that is connected
content-analysis-indicator-tooltip =
    .tooltiptext = 资料损失阻止 (DLP) 由 { $agentName }. 单击为了更多信息.
content-analysis-panel-title = 资料保护
# Variables:
#   $agentName (String): The name of the DLP agent that is connected
content-analysis-panel-text-styled = 你的组织使用 <b>{ $agentName }</b> 到防卫反对资料损失. <a data-l10n-name="info">学习更多</a>

## Unified extensions (toolbar) button

unified-extensions-button =
    .label = 扩展名
    .tooltiptext = 扩展名

## Unified extensions button when permission(s) are needed.
## Note that the new line is intentionally part of the tooltip.

unified-extensions-button-permissions-needed =
    .label = 扩展名
    .tooltiptext =
        扩展名
        许可需要的

## Unified extensions button when some extensions are quarantined.
## Note that the new line is intentionally part of the tooltip.

unified-extensions-button-quarantined =
    .label = 扩展名
    .tooltiptext =
        扩展名
        一些扩展名是不允许

## Unified extensions button when some extensions are disabled (e.g. through add-ons blocklist).
## Note that the new line is intentionally part of the tooltip.

unified-extensions-button-blocklisted =
    .label = 扩展名
    .tooltiptext =
        扩展名
        一些扩展名是禁用

## Private browsing reset button

reset-pbm-toolbar-button2 =
    .label = 清除私人的会话
    .tooltiptext = 清除私人的会话
reset-pbm-panel-heading2 = 清除资料和启动一个开始私人的会话?
reset-pbm-panel-description2 = 这删除历史记录, 饼干, 和所有的其他的站点数据没有关闭你的私人的窗口.
reset-pbm-panel-always-ask-checkbox =
     .label = 总是询问我
     .accesskey = A
reset-pbm-panel-cancel-button =
    .label = 取消
    .accesskey = C
reset-pbm-panel-confirm-button2 =
    .label = 清除私人的会话
    .accesskey = l
reset-pbm-panel-complete = 私人的会话资料删除

## Autorefresh blocker

refresh-blocked-refresh-label = { -brand-short-name } 预防( prevent的过去式和过去分词 ) 这页从自动地重复荷载.
refresh-blocked-redirect-label = { -brand-short-name } 预防( prevent的过去式和过去分词 ) 这页从自动地（以新的方式或目的）重新使用( redirect的现在分词 ) 到另外的页.

refresh-blocked-allow =
    .label = 允许
    .accesskey = A

## Firefox Relay integration

firefox-relay-offer-why-to-use-relay = 我们的无虑的, 容易的-to-use 屏蔽防卫你的 (打)标记和预防罐头猪肉由隐匿你的电子信函地址.

# Variables:
#  $useremail (String): user email that will receive messages
firefox-relay-offer-what-relay-provides = 所有的电子信函发送到你的电子信函屏蔽将是转递到 <strong>{ $useremail }</strong> (除非你决定到阻止他们).

firefox-relay-offer-legal-notice = 由微小静电干扰声“使用电子信函屏蔽”, 你同意到那 <label data-l10n-name="tos-url">检索词的服务</label> 和 <label data-l10n-name="privacy-url">隐私注意</label>.
firefox-relay-offer-legal-notice-1 = 由签署向上的和创建一个电子信函屏蔽, 你同意到那 <label data-l10n-name="tos-url">检索词的服务</label> 和 <label data-l10n-name="privacy-url">隐私注意</label>.

## Add-on Pop-up Notifications

popup-notification-addon-install-unsigned =
    .value = (未经核对的)
popup-notification-xpinstall-prompt-learn-more = 学习更多关于安装添加-ons 安全地

popup-notification-xpinstall-prompt-block-url = 看见详细数据

# Note: Access key is set to p to match "private" in the corresponding localized label.
popup-notification-addon-privatebrowsing-checkbox2 =
    .label = 允许扩展名到运行在私人的窗口
    .accesskey = p

# This string is similar to `webext-perms-description-data-long-technicalAndInteraction`
# but it is used in the install prompt, and it needs an access key.
popup-notification-addon-technical-and-interaction-checkbox =
    .label = 部分技术上的和交互作用资料与扩展名显影器
    .accesskey = S

## Pop-up warning

# Variables:
#   $popupCount (Number): the number of pop-ups blocked.
popup-warning-message =
    { $popupCount ->
        [1] { -brand-short-name } 预防( prevent的过去式和过去分词 ) 此站点从打开一个出现点-up 窗口.
       *[other] { -brand-short-name } 预防( prevent的过去式和过去分词 ) 此站点从打开 { $popupCount } 出现点-up 窗口.
    }

# Variables:
#   $popupCount (Number): the number of pop-ups blocked.
redirect-warning-with-popup-message =
    { $popupCount ->
        [0] { -brand-short-name } 预防( prevent的过去式和过去分词 ) 此站点从（以新的方式或目的）重新使用( redirect的现在分词 ).
        [1] { -brand-short-name } 预防( prevent的过去式和过去分词 ) 此站点从打开一个出现点-up 窗口和（以新的方式或目的）重新使用( redirect的现在分词 ).
       *[other] { -brand-short-name } 预防( prevent的过去式和过去分词 ) 此站点从打开 { $popupCount } 出现点-up 窗口和（以新的方式或目的）重新使用( redirect的现在分词 ).
    }

# The singular form is left out for English, since the number of blocked pop-ups is always greater than 1.
# Variables:
#   $popupCount (Number): the number of pop-ups blocked.
popup-warning-exceeded-message =
    { $popupCount ->
       *[other] { -brand-short-name } 预防( prevent的过去式和过去分词 ) 此站点从打开更多比 { $popupCount } 出现点-up 窗口.
    }

# Variables:
#   $popupCount (Number): the number of pop-ups blocked.
popup-warning-exceeded-with-redirect-message =
    { $popupCount ->
       *[other] { -brand-short-name } 预防( prevent的过去式和过去分词 ) 此站点从打开更多比 { $popupCount } 出现点-up 窗口和（以新的方式或目的）重新使用( redirect的现在分词 ).
    }

popup-warning-button =
    .label =
        { PLATFORM() ->
            [windows] 选项
           *[other] 参数选择
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

file-picker-failed-open = 那窗口文件-dialog 能够不是打开. 无文件或文件夹能够是被选的.
#   $path (string): The full path to which the file will be saved (e.g., 'C:\Users\Default User\Downloads\readme.txt').
file-picker-failed-save-somewhere = 那窗口文件-dialog 能够不是打开. 那文件将是保存到 { $path }.
file-picker-failed-save-nowhere = 那窗口文件-dialog 能够不是打开. 无默认文件夹能够是发现; 那文件将不是保存.

file-picker-crashed-open = 那窗口文件-dialog 有失事的. 无文件或文件夹能够是被选的.
#   $path (string): The full path to which the file will be saved (e.g., 'C:\Users\Default User\Downloads\readme.txt').
file-picker-crashed-save-somewhere = 那窗口文件-dialog 有失事的. 那文件将是保存到 { $path }.
file-picker-crashed-save-nowhere = 那窗口文件-dialog 有失事的. 无默认文件夹能够是发现; 那文件将不是保存.

# Button used with file-picker-crashed-save-default. Opens the folder in Windows
# Explorer, with the saved file selected and in focus.
#
# The wording here should be consistent with the Windows variant of
# `downloads-cmd-show-menuitem-2` and similar messages.

file-picker-crashed-show-in-folder =
    .label = 显示在文件夹
    .accessKey = F

## Onboarding Finish Setup checklist

onboarding-aw-finish-setup-button =
    .label = 完成设置
    .tooltiptext = 完成设置向上的 { -brand-short-name }

onboarding-checklist-button-label = 完成设置

## The urlbar trust icon & panel

# LOCALIZATION NOTE (trustpanel-urlbar-notsecure-label):
# Keep this string as short as possible, this is displayed in the URL bar
# use a synonym for "safe" or "private" if "secure" is too long.
urlbar-trust-icon-notsecure-label = 不固定

trustpanel-etp-label-enabled = 增强跟踪保护是在
trustpanel-etp-label-disabled = 增强跟踪保护是关闭

# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-etp-toggle-on =
  .aria-label = 增强跟踪保护: 在为了 { $host }
# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-etp-toggle-off =
  .aria-label = 增强跟踪保护: 关闭为了 { $host }

trustpanel-etp-description-enabled = 如果某事一看坏掉的在此站点, 尝试旋转关闭保护.
trustpanel-etp-description-disabled = { -brand-product-name } 想公司应该跟随你最低成本估算与调度法. 我们阻止作为多数追踪者作为我们能何时你使旋转在保护.

trustpanel-connection-label-secure = 连接无虑的
trustpanel-connection-label-insecure = 连接不固定

trustpanel-header-enabled = { -brand-product-name } 是在守卫者
trustpanel-description-enabled2 = you are 你（你们）是受保护的. 如果我们点缀某事, (we shall或 we will 的常用口语形式) 让你知道.
trustpanel-header-enabled-insecure = 是小心的在此站点
trustpanel-description-enabled-insecure = { -brand-product-name } 注意（ notice的过去式和过去分词）某事可疑的.

trustpanel-header-disabled = 你变质的关闭保护
trustpanel-description-disabled = { -brand-product-name } 是关闭-duty. 我们提议旋转保护后面的在.

trustpanel-clear-cookies-button = 清除 Cookie 和站点数据
trustpanel-privacy-link = 隐私设置

# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-clear-cookies-header =
    .title = 清除 Cookie 和站点数据为了 { $host }

trustpanel-clear-cookies-description = 拆迁 Cookie 和站点数据可能日志你外面的的网站（全球资讯网的主机站）和清除买东西二轮运货马车.

trustpanel-clear-cookies-subview-button-clear = 清除
trustpanel-clear-cookies-subview-button-cancel = 取消

# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-site-information-header =
    .title = 连接保护为了 { $host }

trustpanel-siteinformation-morelink = 更多位置信息

trustpanel-blocker-see-all = 看见所有的

# Variables
#  $host (String): the hostname of the site that is being displayed.
trustpanel-blocker-header =
    .title = 跟踪保护为了 { $host }

## Variables
##  $count (String): the number of trackers blocked.

trustpanel-blocker-section-header2 = { $count ->
  [one] <span data-l10n-name="count">{ $count }</span> 追踪者阻止在此站点
  *[other] <span data-l10n-name="count">{ $count }</span> 追踪者阻止在此站点
}
trustpanel-blocker-description = { -brand-product-name } 想公司应该跟随你最低成本估算与调度法. 如此我们阻止作为多数作为我们能.
trustpanel-blocked-header = { -brand-product-name } 阻止这些事物为了你:
trustpanel-tracking-header = { -brand-product-name } 允许这些事物如此坐不要中断:
trustpanel-tracking-description = 没有追踪者, 一些按钮, 表单, 和注册(程序) 域可能不工作.
trustpanel-insecure-section-header = 你的连接 (=is not)不是无虑的
trustpanel-insecure-description = 那资料 you are 你（你们）是发送到此站点 (=is not)不是加密. 它能够是看（view的过去式与过去分词形式）, steal的过去分词, 或改变的.

trustpanel-list-label-tracking-cookies = { $count ->
  [one] { $count } 交叉-site 跟踪饼干
  *[other] { $count } 交叉-site 跟踪饼干
}
trustpanel-list-label-tracking-content = 跟踪内容
trustpanel-list-label-fingerprinter =  { $count ->
  [one] { $count } Fingerprinters
  *[other] { $count } Fingerprinters
}
trustpanel-list-label-social-tracking = { $count ->
  [one] { $count } 社会的媒质追踪者
  *[other] { $count } 社会的媒质追踪者
}
trustpanel-list-label-cryptominer = { $count ->
  [one] { $count } Cryptominer
  *[other] { $count } Cryptominers
}
trustpanel-social-tracking-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 阻止 { $count } 社会的媒质追踪者
  *[other] { -brand-product-name } 阻止 { $count } 社会的媒质追踪者
}
trustpanel-social-tracking-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 允许 { $count } 社会的媒质追踪者
  *[other] { -brand-product-name } 允许 { $count } 社会的媒质追踪者
}

trustpanel-tracking-cookies-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 阻止 { $count } 交叉-site 跟踪饼干
  *[other] { -brand-product-name } 阻止 { $count } 交叉-site 跟踪饼干
}
trustpanel-tracking-cookies-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 允许 { $count } 交叉-site 跟踪饼干
  *[other] { -brand-product-name } 允许 { $count } 交叉-site 跟踪饼干
}

trustpanel-tracking-content-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 阻止 { $count } 追踪者
  *[other] { -brand-product-name } 阻止 { $count } 追踪者
}
trustpanel-tracking-content-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 允许 { $count } 追踪者
  *[other] { -brand-product-name } 允许 { $count } 追踪者
}
trustpanel-tracking-content-tab-list-header = 这些坐是尝试到跟踪你:

trustpanel-fingerprinter-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 阻止 { $count } fingerprinter
  *[other] { -brand-product-name } 阻止 { $count } fingerprinters
}
trustpanel-fingerprinter-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 允许 { $count } fingerprinter
  *[other] { -brand-product-name } 允许 { $count } fingerprinters
}
trustpanel-fingerprinter-list-header = 这些坐是尝试到采指纹你:

trustpanel-cryptominer-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 阻止 { $count } cryptominer
  *[other] { -brand-product-name } 阻止 { $count } cryptominers
}
trustpanel-cryptominer-not-blocking-tab-header = { $count ->
  [one] { -brand-product-name } 允许 { $count } cryptominer
  *[other] { -brand-product-name } 允许 { $count } cryptominers
}
trustpanel-cryptominer-tab-list-header = 这些坐是尝试到 cryptomine:
# "account on this site" refers to the (breached) site the user is currently visiting, not a Mozilla Monitor account.
trustpanel-breachalerts-anonymous-breached-header = 有一个帐户在此站点?
trustpanel-breachalerts-anonymous-breached-description = { -brand-product-name } 发现那此站点有一个资料裂口在那最后 12 月. 发现外面的如果你曾是假装的.
trustpanel-breachalerts-anonymous-breached-button-dismiss = 解散
trustpanel-breachalerts-anonymous-breached-button-check-monitor = 启动自由的网络软件目录

## Reduced Protection Infobar ("ReducedProtectionNotification.sys.mjs")

# "temporarily lower your tracking protection" refers to temporarily decreasing the amount of tracking protection.
reduced-protection-infobar-message = <strong>位置一看坏掉的?</strong> 再装那页到暂时低的你的跟踪保护.
reduced-protection-infobar-reload-button = 再装
  .accesskey = R
reduced-protection-infobar-never-show-button = 不要显示再一次
  .accesskey = D


identity-allow-site-data = 总是存储器操作饼干/资料为了此站点
urlbar-eme-blocked =
    .tooltiptext = 你有阻止重现的 DRM-controlled 内容为了这网站（全球资讯网的主机站）.
urlbar-webgl-notification-anchor =
    .tooltiptext = 管理 WebGL 上下文创造许可
urlbar-webgl-blocked =
    .tooltiptext = 你有阻止 WebGL 上下文创造为了这网站（全球资讯网的主机站）.
