# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These strings are used to define the different levels of
## Enhanced Tracking Protection.

protections-popup-footer-protection-label-strict = 严厉的
  .label = 严厉的
protections-popup-footer-protection-label-custom = 定制
  .label = 定制
protections-popup-footer-protection-label-standard = 标准
  .label = 标准

##

# The text a screen reader speaks when focused on the info button.
protections-panel-etp-more-info =
  .aria-label = 更多信息关于增强跟踪保护

protections-panel-etp-on-header = 增强跟踪保护是 ON 为了此站点
protections-panel-etp-off-header = 增强跟踪保护是 OFF 为了此站点

## Text for the toggles shown when ETP is enabled/disabled for a given site.
## .description is transferred into a separate paragraph by the moz-toggle
## custom element code.
##   $host (String): the hostname of the site that is being displayed.

protections-panel-etp-toggle-on =
  .label = 增大的跟踪保护
  .description = 在为了这位置
  .aria-label = 增强跟踪保护: 在为了 { $host }
protections-panel-etp-toggle-off =
  .label = 增大的跟踪保护
  .description = 关闭为了这位置
  .aria-label = 增强跟踪保护: 关闭为了 { $host }

## The "Allowed" header also includes a "Why?" link that, when hovered, shows
## a tooltip explaining why these items were not blocked in the page.

protections-panel-not-blocking-why-label = 为什么?
protections-panel-not-blocking-why-etp-on-tooltip-label =
  .label = 组成块这些能够中断部分的一些网站（全球资讯网的主机站）. 没有追踪者, 一些按钮, 表单, 和注册(程序) 域可能不工作.
protections-panel-not-blocking-why-etp-off-tooltip-label =
  .label = 所有的追踪者在此站点有是有负载的因为保护是变质的关闭.

##

protections-panel-no-trackers-found = 无追踪者已知的到 { -brand-short-name } 曾是检测到的在这页.

protections-panel-content-blocking-tracking-protection = 跟踪内容

protections-panel-content-blocking-socialblock = 社会的媒质追踪者
protections-panel-content-blocking-cryptominers-label = Cryptominers
protections-panel-content-blocking-fingerprinters-label = Fingerprinters

## In the protections panel, Content Blocking category items are in three sections:
##   "Blocked" for categories being blocked in the current page,
##   "Allowed" for categories detected but not blocked in the current page, and
##   "None Detected" for categories not detected in the current page.
##   These strings are used in the header labels of each of these sections.

protections-panel-blocking-label = 阻止
protections-panel-not-blocking-label = 允许
protections-panel-not-found-label = 一点也不检测到的

## Smartblock strings

protections-panel-smartblock-desc-label = { -brand-short-name } 阻止跟踪内容一会儿 you are 你（你们）是在此站点除非你允许它.
# Variables
#  $trackername (String): the name of the tracker that is currently being blocked.
protections-panel-smartblock-blocking-toggle =
  .label = 允许 { $trackername }

#  $trackername (String): the name of the tracker that is currently being blocked.
smartblock-placeholder-title = { $trackername } 追踪者和内容阻止
smartblock-placeholder-desc = 你的 { -brand-short-name } 设置阻止这内容从跟踪你越过坐或存在使用为了精确定义系统.
#  $websitehost (String): host of website with blocked content.
smartblock-placeholder-button-text = 允许在 { $websitehost }
# Caption shown above the original text and links extracted from a blocked
# third-party embed (e.g. a Twitter/X or Instagram post) that SmartBlock has
# replaced with a placeholder. The caption sits above a bordered content box
# containing the extracted text.
smartblock-placeholder-content-header = 内容从阻止嵌入

##

protections-panel-settings-label = 保护设置
protections-panel-protectionsdashboard-label = 保护仪表板

protections-panel-cross-site-tracking-cookies = 这些饼干跟随你从位置到给...择址到聚集资料关于什么你做联机. 他们是日落由第三宴会如此的作为做广告者和分析的公司.
protections-panel-cryptominers = Cryptominers 使用你的 system's 计算力到挖掘数字金钱. Cryptomining 手写体排水沟你的电池, 慢的向下你的计算机, 和能增加你的精力帐单.
protections-panel-fingerprinters = Fingerprinters 收集设置从你的浏览器和计算机到创建一个提问档的你. 使用这数字指纹, 他们能跟踪你越过不同的网站（全球资讯网的主机站）.
protections-panel-tracking-content = 网站（全球资讯网的主机站）可以加载外部精确定义系统, 视频文件, 和其他的内容与跟踪代码. 组成块跟踪内容能帮助坐加载加快, 除了一些按钮, 表单, 和注册(程序) 域可能不工作.
protections-panel-social-media-trackers = 社会的网络地方追踪者在其他的网站（全球资讯网的主机站）到跟随什么你做, 看见, 和观察联机. 这允许社会的媒质公司到学习更多关于你超过什么你均分在你的联欢会媒质提问档.

protections-panel-description-shim-allowed = 一些追踪者有记号的在下面有是部分地非块式在这页因为你相互作用与他们.
protections-panel-description-shim-allowed-learn-more = 学习更多
protections-panel-shim-allowed-indicator =
  .tooltiptext = 追踪者部分地非块式

protections-panel-content-blocking-manage-settings =
  .label = 管理保护设置
  .accesskey = M

# Cookie Banner Handling

protections-panel-cookie-banner-blocker-header = 饼干旗帜阻滞物
protections-panel-cookie-banner-handling-enabled = 在为了这位置
protections-panel-cookie-banner-handling-disabled = 关闭为了这位置
protections-panel-cookie-banner-handling-undetected = 位置当前不被支持的

protections-panel-cookie-banner-blocker-view-title =
  .title = 饼干旗帜阻滞物
# Variables
#  $host (String): the hostname of the site that is being displayed.
protections-panel-cookie-banner-blocker-view-turn-off-for-site = 转弯关闭饼干旗帜阻滞物为了 { $host }?
protections-panel-cookie-banner-blocker-view-turn-on-for-site = 转弯在饼干旗帜阻滞物为了此站点?
protections-panel-cookie-banner-view-cookie-clear-warning = { -brand-short-name } 将清除此站点's 饼干和刷新那页. 清扫所有的饼干可以正负号你外面的或空买东西二轮运货马车.
protections-panel-cookie-banner-blocker-view-turn-on-description = 转弯在和 { -brand-short-name } 将试到自动地拒绝饼干旗帜在此站点.
protections-panel-cookie-banner-view-cancel-label =
  .label = 取消
protections-panel-cookie-banner-view-turn-off-label =
  .label = 转弯关闭
protections-panel-cookie-banner-view-turn-on-label =
  .label = 转弯在

protections-panel-report-broken-site =
  .label = 报告坏掉的位置
  .title = 报告坏掉的位置

## Protections panel info message

cfr-protections-panel-header = 浏览没有存在跟随的
cfr-protections-panel-body = 保持你的资料到你自己. { -brand-short-name } 防卫你从多数的那最多公用块追踪者那跟随什么你做联机.
cfr-protections-panel-link-text = 学习更多
