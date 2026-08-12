# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## App Menu

appmenuitem-banner-update-downloading =
    .label = 下装 { -brand-shorter-name } 更新

appmenuitem-banner-update-available =
    .label = 更新可利用的—下载现在

appmenuitem-banner-update-manual =
    .label = 更新可利用的—下载现在

appmenuitem-banner-update-unsupported =
    .label = 不能的到更新—系统不相容的

appmenuitem-banner-update-restart =
    .label = 更新可利用的—重新启动现在

appmenuitem-new-tab =
    .label = 新的 Tab
appmenuitem-new-window =
    .label = 新的窗口
appmenuitem-new-private-window =
    .label = 新的私人的窗口
appmenuitem-history =
  .label = 历史记录
appmenuitem-tab-groups =
  .label = Tab 创建组
appmenuitem-downloads =
  .label = 下载
appmenuitem-passwords =
    .label = 密码
appmenuitem-extensions-and-themes =
    .label = 扩展名和他们
appmenuitem-extensions =
    .label = 扩展名
appmenuitem-print =
  .label = 打印…
appmenuitem-find-in-page =
    .label = 发现在页…
appmenuitem-translate =
    .label = 转换页…
appmenuitem-zoom =
    .value = 缩放
appmenuitem-more-tools =
    .label = 更多工具
appmenuitem-help =
    .label = 帮忙
appmenuitem-exit2 =
    .label =
        { PLATFORM() ->
            [linux] 结束
           *[other] 出口
        }
appmenu-menu-button-closed2 =
    .tooltiptext = 打开应用菜单
    .label = { -brand-short-name }
appmenu-menu-button-opened2 =
    .tooltiptext = 关闭应用菜单
    .label = { -brand-short-name }

# Settings is now used to access the browser settings across all platforms,
# instead of Options or Preferences.
appmenuitem-settings =
    .label = 设置

## Zoom and Fullscreen Controls

appmenuitem-zoom-enlarge =
  .label = 缩放在
appmenuitem-zoom-reduce =
  .label = 缩放外面的
appmenuitem-fullscreen =
  .label = 完整筛选

## Firefox Account toolbar button and Sync panel in App menu.

appmenu-remote-tabs-sign-into-sync =
  .label = 正负号在到同步的…
appmenu-remote-tabs-turn-on-sync =
  .label = 转弯在同步的…

# This is shown after the tabs list if we can display more tabs by clicking on the button
appmenu-remote-tabs-showmore =
  .label = 显示更多标签页
  .tooltiptext = 显示更多标签页从这装置

# This is shown as the label for an element to show inactive tabs from this device.
appmenu-remote-tabs-show-inactive-tabs =
  .label = 非活动的标签页
  .tooltiptext = 看见非活动的标签页在这装置

# This is shown beneath the name of a device when that device has no open tabs
appmenu-remote-tabs-notabs = 无打开标签页

# This is shown when Sync is configured but syncing tabs is disabled.
appmenu-remote-tabs-tabsnotsyncing = 转弯在标签页【电影、电视】到查看一个列表的标签页从你的其他的德维克（男子名、姓氏）.

appmenu-remote-tabs-opensettings =
  .label = 设置

# This is shown when Sync is configured but this appears to be the only device attached to
# the account. We also show links to download Firefox for android/ios.
appmenu-remote-tabs-noclients = 想要到看见你的标签页从其他的德维克（男子名、姓氏）这里?

appmenu-remote-tabs-connectdevice =
  .label = 连接另外的装置
appmenu-remote-tabs-welcome = 查看一个列表的标签页从你的其他的德维克（男子名、姓氏）.
appmenu-remote-tabs-unverified = 你的帐户需要到是已查清的.

appmenuitem-fxa-toolbar-sync-now2 = 同步的现在
appmenuitem-fxa-sign-in = 正负号在到 { -brand-product-name }
appmenuitem-fxa-manage-account = 管理帐户
appmenu-account-header = 帐户
# Variables
# $time (string) - Localized relative time since last sync (e.g. 1 second ago,
# 3 hours ago, etc.)
appmenu-fxa-last-sync = 最后的 synchronization 的缩略词 { $time }
    .label = 最后的 synchronization 的缩略词 { $time }
appmenu-fxa-sync-and-save-data2 = 同步的和保存资料
appmenu-fxa-signed-in-label = 正负号在
appmenu-fxa-setup-sync =
    .label = 转弯在 Syncing…
appmenu-fxa-setup-sync-new = 转弯在
appmenuitem-save-page =
    .label = 保存页作为…

appmenuitem-fxa-sync-off-title = 同步的是关闭
appmenuitem-fxa-sync-off-description = 防卫和访问你的书签, 密码, 和更多无论何处.

## The Firefox Profiler – The popup is the UI to turn on the profiler, and record
## performance profiles. To enable it go to profiler.firefox.com and click
## "Enable Profiler Menu Button".

profiler-button-dropmarker =
    .label = 打开那靠模工具机嵌板
    .tooltiptext = 打开那靠模工具机嵌板

profiler-popup-button-idle =
  .label = 靠模工具机
  .tooltiptext = 录制一个施行提问档

profiler-popup-button-recording =
  .label = 靠模工具机
  .tooltiptext = 那靠模工具机是记录的一个提问档

profiler-popup-button-capturing =
  .label = 靠模工具机
  .tooltiptext = 那靠模工具机是捕捉（capture的ing形式）一个提问档

profiler-popup-header-text = { -profiler-brand-name }

profiler-popup-reveal-description-button =
  .aria-label = 露出更多信息

profiler-popup-description-title =
  .value = 录制, 分析, 部分

profiler-popup-description =
  合作在施行议题由出版提问档到均分与你的队.

profiler-popup-learn-more-button =
  .label = 学习更多

profiler-popup-settings =
  .value = 设置

# This link takes the user to about:profiling, and is only visible with the Custom preset.
profiler-popup-edit-settings-button =
  .label = 编辑设置…

profiler-popup-recording-screen = 记录的…

profiler-popup-start-recording-button =
  .label = 启动记录的

profiler-popup-discard-button =
  .label = 丢弃

profiler-popup-capture-button =
  .label = 截获命令

profiler-popup-start-shortcut =
  { PLATFORM() ->
      [macos] ⌃⇧1
     *[other] Ctrl+Shift+1
  }

profiler-popup-capture-shortcut =
  { PLATFORM() ->
      [macos] ⌃⇧2
     *[other] Ctrl+Shift+2
  }

## Profiler presets
## They are shown in the popup's select box.

# Presets and their l10n IDs are defined in the file
# devtools/client/performance-new/shared/background.sys.mjs
# Please take care that the same values are also defined in devtools' perftools.ftl.

profiler-popup-presets-web-developer-description = 被推荐的边框形式为了最多网应用调试, 与低点总开销.
profiler-popup-presets-web-developer-label =
  .label = 网显影器

profiler-popup-presets-firefox-description = 被推荐的边框形式为了靠模机 { -brand-shorter-name }.
profiler-popup-presets-firefox-label =
  .label = { -brand-shorter-name }

profiler-popup-presets-graphics-description = 边框形式为了调查图形的疯狂的在 { -brand-shorter-name }.
profiler-popup-presets-graphics-label =
  .label = 图形的

profiler-popup-presets-media-description2 = 边框形式为了调查音频的和影像疯狂的在 { -brand-shorter-name }.
profiler-popup-presets-media-label =
  .label = 媒质

profiler-popup-presets-ml-description = 边框形式为了调查机器学习疯狂的在 { -brand-shorter-name }.
profiler-popup-presets-ml-label =
  .label = 机器学习

profiler-popup-presets-networking-description = 边框形式为了调查连网疯狂的在 { -brand-shorter-name }.
profiler-popup-presets-networking-label =
  .label = 连网

profiler-popup-presets-power-description = 边框形式为了调查力使用疯狂的在 { -brand-shorter-name }, 与低点总开销.
# "Power" is used in the sense of energy (electricity used by the computer).
profiler-popup-presets-power-label =
  .label = 力

profiler-popup-presets-debug-description = 边框形式为了调试在 { -brand-shorter-name }. 高度总开销, 做不使用为了施行工作除了使用为了调焦在理解浏览器行为.
profiler-popup-presets-debug-label =
  .label = 除错

profiler-popup-presets-web-compat-description = 被推荐的边框形式为了调试网兼容性议题在网站（全球资讯网的主机站）, 宁可比跟踪施行.
profiler-popup-presets-web-compat-label =
  .label = 网兼容

profiler-popup-presets-custom-label =
  .label = 定制

## History panel

appmenu-manage-history =
    .label = 管理历史记录
appmenu-restore-session =
    .label = 回复早先的会话
appmenu-clear-history =
    .label = 清除最近的历史记录…
appmenu-recent-history-subheader = 最近的历史记录
appmenu-recently-closed-tabs =
    .label = 最近关闭标签页
appmenu-recently-closed-windows =
    .label = 最近关闭窗口
# This allows to search through the browser's history.
appmenu-search-history =
    .label = 搜索历史记录

## Help panel

appmenu-help-header =
    .title = { -brand-shorter-name } 帮忙
appmenu-about =
    .label = 关于 { -brand-shorter-name }
    .accesskey = A
appmenu-get-help =
    .label = 获得帮忙
    .accesskey = h
appmenu-help-more-troubleshooting-info =
    .label = 更多发现并修理故障信息
    .accesskey = t
appmenu-help-share-ideas =
    .label = 部分工业设计优秀奖和反馈…
    .accesskey = S
appmenu-help-switch-device =
    .label = 交换到一个新的装置

## appmenu-help-enter-troubleshoot-mode and appmenu-help-exit-troubleshoot-mode
## are mutually exclusive, so it's possible to use the same accesskey for both.

appmenu-help-enter-troubleshoot-mode2 =
    .label = 障碍修理模式…
    .accesskey = M
appmenu-help-exit-troubleshoot-mode =
    .label = 转弯障碍修理模式关闭
    .accesskey = M

## appmenu-help-report-deceptive-site and appmenu-help-not-deceptive
## are mutually exclusive, so it's possible to use the same accesskey for both.

appmenu-help-report-deceptive-site =
    .label = 报告迷惑的位置…
    .accesskey = d
appmenu-help-not-deceptive =
    .label = 这 (=is not)不是一个迷惑的位置…
    .accesskey = d

## More Tools

appmenu-customizetoolbar =
    .label = 定制工具栏…
appmenu-abouttranslations =
    .label = 转换…

appmenu-developer-tools-subheader = 浏览器工具
appmenu-developer-tools-extensions =
    .label = 扩展名为了显影器
appmenuitem-report-broken-site =
  .label = 报告坏掉的位置

## Panel for privacy and security products

appmenuitem-sign-in-account = 正负号在到你的帐户

appmenuitem-monitor-title = { -monitor-brand-short-name }
appmenuitem-monitor-description = 获得资料裂口警觉的
appmenuitem-relay-title = { -relay-brand-short-name }
appmenuitem-relay-description = 屏蔽你的实数电子信函和电话
appmenuitem-services-relay-description = 下水电子信函屏蔽仪表板
appmenuitem-vpn-title = { -mozilla-vpn-brand-name }
appmenuitem-vpn-description-2 = 获得全部-device 保护

appmenu-services-header = 我的服务
# "Mozilla" is intentionally hardcoded to prevent forks from replacing it
# with their own vendor name, since these tools are created and maintained by
# Mozilla.
appmenu-other-protection-header2 = 尝试其他的保护工具从摩斯拉:

## Profiles panel

appmenu-profiles-2 =
    .label = 提问档
appmenu-other-profiles = 其他的提问档
appmenu-manage-profiles =
    .label = 管理提问档
appmenu-copy-profile =
    .label = 复制这提问档
appmenu-create-profile =
    .label = 新的提问档
appmenu-edit-profile =
    .aria-label = 编辑提问档
