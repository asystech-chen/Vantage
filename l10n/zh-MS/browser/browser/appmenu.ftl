# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## App Menu

appmenuitem-banner-update-downloading =
    .label = 正在下载 { -brand-shorter-name } 更新...

appmenuitem-banner-update-available =
    .label = 更新可用 — 请立即下载

appmenuitem-banner-update-manual =
    .label = 更新可用 — 请立即下载

appmenuitem-banner-update-unsupported =
    .label = 无法执行更新操作 — 系统不兼容

appmenuitem-banner-update-restart =
    .label = 更新可用 — 请立即重新启动

appmenuitem-new-tab =
    .label = 新选项卡
appmenuitem-new-window =
    .label = 新窗口
appmenuitem-new-private-window =
    .label = 新建隐私浏览窗口
appmenuitem-history =
  .label = 历史记录
appmenuitem-tab-groups =
  .label = 选项卡组
appmenuitem-downloads =
  .label = 下载项
appmenuitem-passwords =
    .label = 密码
appmenuitem-extensions-and-themes =
    .label = 扩展和主题
appmenuitem-extensions =
    .label = 扩展
appmenuitem-print =
  .label = 打印…
appmenuitem-find-in-page =
    .label = 在页面中查找…
appmenuitem-translate =
    .label = 翻译页面…
appmenuitem-zoom =
    .value = 缩放
appmenuitem-more-tools =
    .label = 更多工具
appmenuitem-help =
    .label = 帮助
appmenuitem-exit2 =
    .label =
        { PLATFORM() ->
            [linux] 退出
           *[other] 退出
        }
appmenu-menu-button-closed2 =
    .tooltiptext = 打开应用程序菜单
    .label = { -brand-short-name }
appmenu-menu-button-opened2 =
    .tooltiptext = 关闭应用程序菜单
    .label = { -brand-short-name }

# Settings is now used to access the browser settings across all platforms,
# instead of Options or Preferences.
appmenuitem-settings =
    .label = 设置

## Zoom and Fullscreen Controls

appmenuitem-zoom-enlarge =
  .label = 放大
appmenuitem-zoom-reduce =
  .label = 缩小
appmenuitem-fullscreen =
  .label = 全屏

## Firefox Account toolbar button and Sync panel in App menu.

appmenu-remote-tabs-sign-into-sync =
  .label = 登录以进行同步…
appmenu-remote-tabs-turn-on-sync =
  .label = 开启同步…

# This is shown after the tabs list if we can display more tabs by clicking on the button
appmenu-remote-tabs-showmore =
  .label = 显示更多选项卡
  .tooltiptext = 从此设备显示更多选项卡

# This is shown as the label for an element to show inactive tabs from this device.
appmenu-remote-tabs-show-inactive-tabs =
  .label = 非活动选项卡
  .tooltiptext = 查看此设备上的非活动选项卡

# This is shown beneath the name of a device when that device has no open tabs
appmenu-remote-tabs-notabs = 无打开的选项卡

# This is shown when Sync is configured but syncing tabs is disabled.
appmenu-remote-tabs-tabsnotsyncing = 请开启选项卡同步功能，以便查看您其他设备上的选项卡列表。

appmenu-remote-tabs-opensettings =
  .label = 设置

# This is shown when Sync is configured but this appears to be the only device attached to
# the account. We also show links to download Firefox for android/ios.
appmenu-remote-tabs-noclients = 您是否希望在此处查看来自其他设备的选项卡？

appmenu-remote-tabs-connectdevice =
  .label = 连接另一台设备
appmenu-remote-tabs-welcome = 查看您其他设备上的选项卡列表。
appmenu-remote-tabs-unverified = 您的账户需要经过验证。

appmenuitem-fxa-toolbar-sync-now2 = 立即同步
appmenuitem-fxa-sign-in = 登录到 { -brand-product-name }
appmenuitem-fxa-manage-account = 管理账户
appmenu-account-header = 账户
# Variables
# $time (string) - Localized relative time since last sync (e.g. 1 second ago,
# 3 hours ago, etc.)
appmenu-fxa-last-sync = 上次同步发生于 { $time }
    .label = 上次同步发生于 { $time }
appmenu-fxa-sync-and-save-data2 = 同步并保存您的数据
appmenu-fxa-signed-in-label = 登录
appmenu-fxa-setup-sync =
    .label = 开启同步功能…
appmenu-fxa-setup-sync-new = 开启
appmenuitem-save-page =
    .label = 将页面另存为…

appmenuitem-fxa-sync-off-title = 同步功能已关闭
appmenuitem-fxa-sync-off-description = 保护并访问您的书签、密码及其他数据，无论您身在何处。

## The Firefox Profiler – The popup is the UI to turn on the profiler, and record
## performance profiles. To enable it go to profiler.firefox.com and click
## "Enable Profiler Menu Button".

profiler-button-dropmarker =
    .label = 打开性能分析器面板
    .tooltiptext = 打开性能分析器面板

profiler-popup-button-idle =
  .label = 性能分析器
  .tooltiptext = 记录性能配置文件

profiler-popup-button-recording =
  .label = 性能分析器
  .tooltiptext = 性能分析器正在记录配置文件

profiler-popup-button-capturing =
  .label = 性能分析器
  .tooltiptext = 性能分析器正在捕获配置文件

profiler-popup-header-text = { -profiler-brand-name }

profiler-popup-reveal-description-button =
  .aria-label = 显示更多信息

profiler-popup-description-title =
  .value = 记录、分析、分享

profiler-popup-description =
  通过发布配置文件与您的团队分享，以协作解决性能问题。

profiler-popup-learn-more-button =
  .label = 了解更多

profiler-popup-settings =
  .value = 设置

# This link takes the user to about:profiling, and is only visible with the Custom preset.
profiler-popup-edit-settings-button =
  .label = 编辑设置…

profiler-popup-recording-screen = 正在记录…

profiler-popup-start-recording-button =
  .label = 开始记录

profiler-popup-discard-button =
  .label = 弃置

profiler-popup-capture-button =
  .label = 捕获

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

profiler-popup-presets-web-developer-description = 推荐用于大多数 Web 应用程序调试的预设配置，具有较低的开销。
profiler-popup-presets-web-developer-label =
  .label = Web 开发人员

profiler-popup-presets-firefox-description = 推荐用于对 { -brand-shorter-name } 进行分析的预设配置。
profiler-popup-presets-firefox-label =
  .label = { -brand-shorter-name }

profiler-popup-presets-graphics-description = 用于调查 { -brand-shorter-name } 中图形错误的预设配置。
profiler-popup-presets-graphics-label =
  .label = 图形

profiler-popup-presets-media-description2 = 用于调查 { -brand-shorter-name } 中音频和视频错误的预设配置。
profiler-popup-presets-media-label =
  .label = 媒体

profiler-popup-presets-ml-description = 用于调查 { -brand-shorter-name } 中机器学习错误的预设配置。
profiler-popup-presets-ml-label =
  .label = 机器学习

profiler-popup-presets-networking-description = 用于调查 { -brand-shorter-name } 中网络错误的预设配置。
profiler-popup-presets-networking-label =
  .label = 网络

profiler-popup-presets-power-description = 用于调查 { -brand-shorter-name } 中功率使用错误的预设配置，具有较低的开销。
# "Power" is used in the sense of energy (electricity used by the computer).
profiler-popup-presets-power-label =
  .label = 功率

profiler-popup-presets-debug-description = 用于在 { -brand-shorter-name } 中进行调试的预设配置。开销较高，请勿用于性能工作，而应用于专注于理解浏览器行为。
profiler-popup-presets-debug-label =
  .label = 调试

profiler-popup-presets-web-compat-description = 推荐用于调试网站中 Web 兼容性问题的预设配置，而非跟踪性能。
profiler-popup-presets-web-compat-label =
  .label = Web 兼容性
profiler-popup-presets-custom-label =
  .label = 自定义

## History panel

appmenu-manage-history =
    .label = 管理历史记录
appmenu-restore-session =
    .label = 恢复之前的会话
appmenu-clear-history =
    .label = 清除近期历史记录…
appmenu-recent-history-subheader = 近期历史记录
appmenu-recently-closed-tabs =
    .label = 最近关闭的标签页
appmenu-recently-closed-windows =
    .label = 最近关闭的窗口
# This allows to search through the browser's history.
appmenu-search-history =
    .label = 搜索历史记录

## Help panel

appmenu-help-header =
    .title = { -brand-shorter-name } 帮助
appmenu-about =
    .label = 关于 { -brand-shorter-name }
    .accesskey = A
appmenu-get-help =
    .label = 获取帮助
    .accesskey = h
appmenu-help-more-troubleshooting-info =
    .label = 更多疑难排查信息
    .accesskey = t
appmenu-help-share-ideas =
    .label = 分享您的想法和反馈…
    .accesskey = S
appmenu-help-switch-device =
    .label = 切换到新设备

## appmenu-help-enter-troubleshoot-mode and appmenu-help-exit-troubleshoot-mode
## are mutually exclusive, so it's possible to use the same accesskey for both.

appmenu-help-enter-troubleshoot-mode2 =
    .label = 疑难排查模式…
    .accesskey = M
appmenu-help-exit-troubleshoot-mode =
    .label = 关闭疑难排查模式
    .accesskey = M

## appmenu-help-report-deceptive-site and appmenu-help-not-deceptive
## are mutually exclusive, so it's possible to use the same accesskey for both.

appmenu-help-report-deceptive-site =
    .label = 报告欺骗性网站…
    .accesskey = d
appmenu-help-not-deceptive =
    .label = 此网站并非欺骗性网站…
    .accesskey = d

## More Tools

appmenu-customizetoolbar =
    .label = 自定义工具栏…
appmenu-abouttranslations =
    .label = 翻译…

appmenu-developer-tools-subheader = 浏览器工具
appmenu-developer-tools-extensions =
    .label = 面向开发者的扩展
appmenuitem-report-broken-site =
  .label = 报告损坏的网站

## Panel for privacy and security products

appmenuitem-sign-in-account = 登录到您的账户

appmenuitem-monitor-title = { -monitor-brand-short-name }
appmenuitem-monitor-description = 获取数据泄露警报
appmenuitem-relay-title = { -relay-brand-short-name }
appmenuitem-relay-description = 隐藏您的真实电子邮件和电话号码
appmenuitem-services-relay-description = 启动电子邮件掩码仪表盘
appmenuitem-vpn-title = { -mozilla-vpn-brand-name }
appmenuitem-vpn-description-2 = 获取全设备保护

appmenu-services-header = 我的服务
# "Mozilla" is intentionally hardcoded to prevent forks from replacing it
# with their own vendor name, since these tools are created and maintained by
# Mozilla.
appmenu-other-protection-header2 = 尝试 Mozilla 提供的其他保护工具：

## Profiles panel

appmenu-profiles-2 =
    .label = 配置文件
appmenu-other-profiles = 其他配置文件
appmenu-manage-profiles =
    .label = 管理配置文件
appmenu-copy-profile =
    .label = 复制此配置文件
appmenu-create-profile =
    .label = 新建配置文件
appmenu-edit-profile =
    .aria-label = 编辑配置文件