# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These strings are used to define the different levels of
## Enhanced Tracking Protection.

protections-popup-footer-protection-label-strict = 严格
  .label = 严格
protections-popup-footer-protection-label-custom = 自定义
  .label = 自定义
protections-popup-footer-protection-label-standard = 标准
  .label = 标准

##

# The text a screen reader speaks when focused on the info button.
protections-panel-etp-more-info =
  .aria-label = 关于增强型跟踪保护的更多信息

protections-panel-etp-on-header = 增强型跟踪保护已为此站点启动
protections-panel-etp-off-header = 增强型跟踪保护已为此站点关闭

## Text for the toggles shown when ETP is enabled/disabled for a given site.
## .description is transferred into a separate paragraph by the moz-toggle
## custom element code.
##   $host (String): the hostname of the site that is being displayed.

protections-panel-etp-toggle-on =
  .label = 增强型跟踪保护
  .description = 已为此站点启动
  .aria-label = 增强型跟踪保护：已为 { $host } 启动
protections-panel-etp-toggle-off =
  .label = 增强型跟踪保护
  .description = 已为此站点关闭
  .aria-label = 增强型跟踪保护：已为 { $host } 关闭

## The "Allowed" header also includes a "Why?" link that, when hovered, shows
## a tooltip explaining why these items were not blocked in the page.

protections-panel-not-blocking-why-label = 为何？
protections-panel-not-blocking-why-etp-on-tooltip-label =
  .label = 阻止这些内容可能破坏某些网站的要素。若无跟踪器，某些按钮、表单和登录字段可能无法正常工作。
protections-panel-not-blocking-why-etp-off-tooltip-label =
  .label = 由于保护功能已关闭，此站点上的所有跟踪器均已加载。

##

protections-panel-no-trackers-found = 此页面上未检测到 { -brand-short-name } 已知的跟踪器。

protections-panel-content-blocking-tracking-protection = 跟踪内容

protections-panel-content-blocking-socialblock = 社交媒体跟踪器
protections-panel-content-blocking-cryptominers-label = 加密货币挖矿器
protections-panel-content-blocking-fingerprinters-label = 指纹识别器

## In the protections panel, Content Blocking category items are in three sections:
##   "Blocked" for categories being blocked in the current page,
##   "Allowed" for categories detected but not blocked in the current page, and
##   "None Detected" for categories not detected in the current page.
##   These strings are used in the header labels of each of these sections.

protections-panel-blocking-label = 已阻止
protections-panel-not-blocking-label = 已允许
protections-panel-not-found-label = 未检测到

## Smartblock strings

protections-panel-smartblock-desc-label = { -brand-short-name } 会在您处于此站点时阻止跟踪内容，除非您允许其加载。
# Variables
#  $trackername (String): the name of the tracker that is currently being blocked.
protections-panel-smartblock-blocking-toggle =
  .label = 允许 { $trackername }

#  $trackername (String): the name of the tracker that is currently being blocked.
smartblock-placeholder-title = { $trackername } 跟踪器和内容已被阻止
smartblock-placeholder-desc = 您的 { -brand-short-name } 设置已阻止此内容在跨站点跟踪您或用于广告。
#  $websitehost (String): host of website with blocked content.
smartblock-placeholder-button-text = 允许在 { $websitehost } 上
# Caption shown above the original text and links extracted from a blocked
# third-party embed (e.g. a Twitter/X or Instagram post) that SmartBlock has
# replaced with a placeholder. The caption sits above a bordered content box
# containing the extracted text.
smartblock-placeholder-content-header = 来自被阻止嵌入的内容

##

protections-panel-settings-label = 保护设置
protections-panel-protectionsdashboard-label = 保护仪表板

protections-panel-cross-site-tracking-cookies = 这些 Cookie 会跟随您从一个站点到另一个站点，收集有关您在线活动的数据。它们由广告商和分析公司等第三方设置。
protections-panel-cryptominers = 加密货币挖矿器使用您系统的计算功率来挖掘数字货币。加密货币挖矿脚本会消耗您的电池电量，降低您的计算机速度，并可能增加您的能源账单。
protections-panel-fingerprinters = 指纹识别器会收集您浏览器和计算机的设置，以创建您的个人资料。利用此数字指纹，它们可以在不同网站上跟踪您。
protections-panel-tracking-content = 网站可能会加载带有跟踪代码的外部广告、视频和其他内容。阻止跟踪内容有助于站点更快加载，但某些按钮、表单和登录字段可能无法正常工作。
protections-panel-social-media-trackers = 社交网络在其他网站上放置跟踪器，以跟踪您的在线行为、观看内容和关注内容。这使得社交媒体公司能够了解您超出社交媒体资料共享范围的信息。

protections-panel-description-shim-allowed = 由于您与其进行了交互，下面标记的某些跟踪器已在此页面上被部分解除阻止。
protections-panel-description-shim-allowed-learn-more = 了解更多
protections-panel-shim-allowed-indicator =
  .tooltiptext = 跟踪器已部分解除阻止

protections-panel-content-blocking-manage-settings =
  .label = 管理保护设置
  .accesskey = M

# Cookie Banner Handling

protections-panel-cookie-banner-blocker-header = Cookie 横幅阻止器
protections-panel-cookie-banner-handling-enabled = 已为此站点启动
protections-panel-cookie-banner-handling-disabled = 已为此站点关闭
protections-panel-cookie-banner-handling-undetected = 当前不支持此站点

protections-panel-cookie-banner-blocker-view-title =
  .title = Cookie 横幅阻止器
# Variables
#  $host (String): the hostname of the site that is being displayed.
protections-panel-cookie-banner-blocker-view-turn-off-for-site = 是否关闭 { $host } 的 Cookie 横幅阻止器？
protections-panel-cookie-banner-blocker-view-turn-on-for-site = 是否为此站点启动 Cookie 横幅阻止器？
protections-panel-cookie-banner-view-cookie-clear-warning = { -brand-short-name } 将清除此站点的 Cookie 并刷新页面。清除所有 Cookie 可能导致您退出登录或清空购物车。
protections-panel-cookie-banner-blocker-view-turn-on-description = 启动后，{ -brand-short-name } 将尝试自动拒绝此站点上的 Cookie 横幅。
protections-panel-cookie-banner-view-cancel-label =
  .label = 取消
protections-panel-cookie-banner-view-turn-off-label =
  .label = 关闭
protections-panel-cookie-banner-view-turn-on-label =
  .label = 开启

protections-panel-report-broken-site =
  .label = 报告失效站点
  .title = 报告失效站点

## Protections panel info message

cfr-protections-panel-header = 在不受跟踪的情况下浏览
cfr-protections-panel-body = 请将您的数据保留给您自己。{ -brand-short-name } 可保护您免受许多最常见跟踪器的侵扰，这些跟踪器会跟踪您的在线行为。
cfr-protections-panel-link-text = 了解更多信息
