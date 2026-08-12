# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

do-not-track-removal2 =
    .label = 我们不再支持“不跟踪”信号

global-privacy-control-description =
    .label = 通知网站不得出售或共享您的数据
    .accesskey = s

non-technical-privacy-group =
    .label = 网站隐私偏好

do-not-track-removal3 =
    .message = 我们不再支持“不跟踪”功能。

non-technical-privacy-heading =
    .label = 附加保护

preferences-privacy-relay-available =
    .label = 建议使用 { -relay-brand-name } 电子邮件掩码
    .description = 隐藏您的真实电子邮件地址，以保护您的收件箱免受垃圾邮件侵扰。


# Do not translate.
# "Global Privacy Control" or "GPC" are a web platform feature name and abbreviation
# included to facilitate power-user search of the about:preferences page.
global-privacy-control-search = Global Privacy Control (GPC)

settings-page-title = 设置

category-nav-heading =
    .heading = 设置

# This is used to determine the width of the search field in about:preferences,
# in order to make the entire placeholder string visible
#
# Please keep the placeholder string short to avoid truncation.
#
# Notice: The value of the `.style` attribute is a CSS string, and the `width`
# is the name of the CSS property. It is intended only to adjust the element's width.
# Do not translate.
search-input-box2 =
    .style = width: 15.4em
    .placeholder = 在设置中查找

managed-notice = 您的浏览器正由您的组织进行管理。
managed-notice-info-icon =
    .alt = 信息

managed-notice-nav =
    .label = 您的浏览器正由您的组织进行管理。

category-list =
    .aria-label = 类别

pane-general-title = 常规

pane-home-title = 主页

pane-home-startup-title2 = 主页和启动
  .title = 主页和启动

pane-search-title2 = 搜索
  .title = 搜索

pane-privacy-title3 = 隐私和安全
  .title = 隐私和安全

pane-privacy-section =
    .heading = 隐私和安全

pane-sync-title3 = 同步

pane-ai-controls-title2 = 人工智能控制
  .title = 人工智能控制

pane-about-firefox-title = 关于 { -brand-short-name }
  .title = { pane-about-firefox-title }

pane-appearance-title = 外观
  .title = { pane-appearance-title }

pane-downloads-title2 = 下载
  .title = 下载

pane-downloads3 =
    .heading = 下载

pane-accessibility-title = 无障碍
  .title = { pane-accessibility-title }

pane-languages-title2 = 语言
  .title = 语言

preferences-languages-header3 =
    .heading = 语言

settings-pane-labs-title2 = { -firefoxlabs-brand-name }
  .title = { -firefoxlabs-brand-name }

settings-pane-labs-header =
    .heading = { -firefoxlabs-brand-name }
pane-experimental-description4 = 请尝试我们的实验性功能！这些功能正在开发中且不断演变，可能会影响 { -brand-short-name } 的工作方式。如果您已启用<a data-l10n-name="data-collection">技术和交互数据</a>，我们才会收到关于您使用这些功能的数据。

pane-experimental-reset =
  .label = 恢复默认设置
  .accesskey = R

help-button-label2 = { -brand-short-name } 支持
  .title = { -brand-short-name } 支持
addons-button-label2 = 扩展和主题
  .title = 扩展和主题

focus-search =
    .key = f

close-button =
    .aria-label = 关闭
## Browser Restart Dialog

feature-enable-requires-restart = { -brand-short-name } 必须重新启动，以便启用此功能。
feature-disable-requires-restart = { -brand-short-name } 必须重新启动，以便停用此功能。
should-restart-title = 重新启动 { -brand-short-name }
should-restart-ok = 立即重新启动 { -brand-short-name }
cancel-no-restart-button = 取消
restart-later = 稍后重新启动

## Extension Control Notifications
##
## These strings are used to inform the user
## about changes made by extensions to browser settings.
##
## <img data-l10n-name="icon"/> is going to be replaced by the extension icon.
##
## Variables:
##   $name (string) - Name of the extension

# This string is shown to notify the user that the password manager setting
# is being controlled by an extension
extension-controlling-password-saving = <img data-l10n-name="icon"/> <strong>{ $name }</strong> 控制此设置。

# This string is shown to notify the user that their notifications permission
# is being controlled by an extension.
extension-controlling-web-notifications = <img data-l10n-name="icon"/> <strong>{ $name }</strong> 控制此设置。

# This string is shown to notify the user that Container Tabs
# are being enabled by an extension.
extension-controlling-privacy-containers = <img data-l10n-name="icon"/> <strong>{ $name }</strong> 要求启用容器标签页。

# This string is shown to notify the user that their content blocking "All Detected Trackers"
# preferences are being controlled by an extension.
extension-controlling-websites-content-blocking-all-trackers = <img data-l10n-name="icon"/> <strong>{ $name }</strong> 控制此设置。

# This string is shown to notify the user that their proxy configuration preferences
# are being controlled by an extension.
extension-controlling-proxy-config = <img data-l10n-name ="icon"/> <strong>{ $name }</strong> 控制 { -brand-short-name } 连接到互联网的方式。

# This string is shown after the user disables an extension to notify the user
# how to enable an extension that they disabled.
#
# <img data-l10n-name="addons-icon"/> will be replaced with Add-ons icon
# <img data-l10n-name="menu-icon"/> will be replaced with Menu icon
extension-controlled-enable = 为启用该扩展程序，请您在<img data-l10n-name="menu-icon"/>菜单中选择<img data-l10n-name="addons-icon"/>附加组件。

extension-controlled-enable-2 = 为重新启用此扩展程序，请您访问<a data-l10n-name="addons-link">扩展程序和主题</a>。
# This string is shown to notify the user that their home page or new tab preferences
# are being controlled by an extension.
extension-controlling-homepage = { $name } 控制您的部分主页设置。

## Preferences UI Search Results

search-results-header = 搜索结果

# `<span data-l10n-name="query"></span>` will be replaced by the search term.
search-results-empty-message2 =
        发生错误！在设置中未找到与“<span data-l10n-name="query"></span>”相关的结果。

search-results-help-link = 需要帮助？请访问<a data-l10n-name="url">{ -brand-short-name } 支持</a>

## General Section

startup-group =
    .label = 启动

always-check-default =
    .label = 始终检查 { -brand-short-name } 是否为您的默认浏览器
    .accesskey = 始

startup-restore-windows-and-tabs =
    .label = 打开之前的窗口和标签页
    .accesskey = 打
startup-windows-launch-on-login-profile-disabled =
    .message = 通过选中“选择用户配置文件”窗口中的“{ profile-manager-use-selected.label }”来启用此偏好设置。

windows-launch-on-login =
    .label = 当您的计算机启动时，自动打开 { -brand-short-name }
    .accesskey = 自
windows-launch-on-login-disabled = 此偏好设置已在 Windows 中被禁用。若要更改，请访问系统设置中的<a data-l10n-name="startup-link">启动应用</a>。

# Option to also opens a new tab, in addition to restoring previous tabs and windows
windows-launch-on-login-open-new-tab =
    .label = 同时打开一个新标签页
    .accesskey = 同

disable-extension =
    .label = 停用扩展程序

preferences-data-migration-group =
    .label = 导入浏览器数据
    .description = 从另一个浏览器导入您的书签、密码、历史记录、扩展程序和自动填充数据。
preferences-data-migration-button =
    .label = 导入数据
    .accesskey = 导

preferences-profiles-group-header =
    .heading = 配置文件
preferences-profiles-subpane-description =
    .description = 每个配置文件都具有独立的浏览数据和设置，包括历史记录、密码等。
preferences-profiles-section-header =
    .label = 配置文件
    .description = 每个配置文件都具有独立的浏览数据和设置，包括历史记录、密码等。
preferences-manage-profiles-button =
  .label = 管理配置文件
preferences-profiles-settings-button =
  .label = 设置
# This string labels the entire copy profile section in the profiles sub-pane.
preferences-copy-profile-header =
    .label = 复制现有配置文件
    .description = 新配置文件将复制您的设置、附加组件、历史记录以及保存的数据（如书签和密码），但不包含您的账户或同步信息。
# This string sits next to the copy controls, both the copy-profile-select
# drop-down and the copy-profile-button, so that the user understands they
# need to first pick a profile to copy, and then click the copy button.
preferences-profile-to-copy =
  .label = 要复制的配置文件
# This string is a placeholder that will be shown in a drop-down list of
# profiles. The user will select a profile, then click the copy button
# to make a copy of that profile.
preferences-copy-profile-select = 选择配置文件
preferences-copy-profile-button = 复制

tabs-browsing-section =
  .heading = 选项卡和浏览

pane-tabs-browsing-title2 = 选项卡和浏览
  .title = 选项卡和浏览

tabs-group-header2 =
  .label = 选项卡

tabs-opening-heading =
  .label = 启动

tabs-interaction-heading =
  .label = 交互

tabs-containers-heading =
  .label = 容器

tabs-closing-heading =
  .label = 关闭

ctrl-tab-recently-used-order =
    .label = Ctrl+Tab 按最近使用的顺序循环切换选项卡
    .accesskey = T

open-new-link-as-tabs =
    .label = 在选项卡中启动链接，而非新窗口
    .accesskey = w

open-external-link-next-to-active-tab =
    .label = 从应用程序启动链接时，将其置于您当前活动的选项卡旁边

ask-on-close-multiple-tabs =
    .label = 关闭多个选项卡前询问您
    .accesskey = m

# This string is used for the confirm before quitting preference.
# Variables:
#   $quitKey (string) - the quit keyboard shortcut, and formatted
#                       in the same manner as it would appear,
#                       for example, in the File menu.
ask-on-quit-with-key =
    .label = 使用 { $quitKey } 退出前询问您
    .accesskey = b

warn-on-open-many-tabs =
    .label = 当启动多个选项卡可能减慢 { -brand-short-name } 的速度时，向您发出警告
    .accesskey = d

switch-to-new-tabs-2 =
    .label = 当在新选项卡中启动链接或媒体时，立即切换到该选项卡
    .accesskey = h

show-tabs-in-taskbar =
    .label = 在 Windows 任务栏中显示选项卡预览
    .accesskey = k

browser-containers-enabled-2 =
    .label = 使用容器选项卡
    .accesskey = n

browser-containers-learn-more = 了解更多

browser-containers-settings-2 =
    .label = 管理设置
    .accesskey = i

containers-disable-alert-title = 关闭所有容器选项卡？

## Variables:
##   $tabCount (number) - Number of tabs

containers-disable-alert-desc =
    { $tabCount ->
        [one] 如果您现在禁用容器选项卡，{ $tabCount } 个容器选项卡将被关闭。您确定要禁用容器选项卡吗？
       *[other] 如果您现在禁用容器选项卡，{ $tabCount } 个容器选项卡将被关闭。您确定要禁用容器选项卡吗？
    }

containers-disable-alert-ok-button =
    { $tabCount ->
        [one] 关闭 { $tabCount } 个容器选项卡
       *[other] 关闭 { $tabCount } 个容器选项卡
    }

##

containers-disable-alert-cancel-button = 保持启用

containers-remove-alert-title = 移除此容器？

# Variables:
#   $count (number) - Number of tabs that will be closed.
containers-remove-alert-msg =
    { $count ->
        [one] 如果您现在移除此容器，{ $count } 个容器选项卡将被关闭。您确定要移除此容器吗？
       *[other] 如果您现在移除此容器，{ $count } 个容器选项卡将被关闭。您确定要移除此容器吗？
    }

containers-remove-ok-button = 移除此容器
containers-remove-cancel-button = 不移除此容器

settings-tabs-show-image-in-preview =
    .label = 当您悬停在选项卡上时，显示图像预览
    .accessKey = h

settings-tabs-drag-to-create-tab-groups =
    .label = 将选项卡拖在一起以创建选项卡组

browser-layout-header2 =
    .label = 浏览器布局

browser-layout-horizontal-tabs2 =
    .label = 水平选项卡
    .title = 选项卡位于顶部
    .description = 选项卡位于顶部

browser-layout-vertical-tabs2 =
.label = 垂直选项卡
.title = 选项卡位于侧边，处于侧边栏中
.description = 选项卡位于侧边，处于侧边栏中

browser-layout-show-sidebar2 =
    .label = 显示侧边栏
    .description = 在不离开您的主视图的情况下，快速访问书签、来自您手机的选项卡、AI 聊天机器人以及更多内容。

page-navigation-group =
    .label = 页面导航

## General Section - Language & Appearance

language-and-appearance-header = 语言和外观

appearance-group2 =
  .label = 网站外观
  .description = 某些网站会根据您的偏好更改其颜色。请选择您的配色方案。

preferences-web-appearance-choice-auto3 =
  .label = 系统
  .title = 根据您的系统设置和 { -brand-short-name } 主题，自动更改网站背景和内容。
preferences-web-appearance-choice-light2 =
  .label = 浅色
  .title = 为网站背景和内容使用浅色外观。
preferences-web-appearance-choice-dark2 =
  .label = 深色
  .title = 为网站背景和内容使用深色外观。

web-appearance-group =
  .aria-label = 网站外观

# This can appear when using windows HCM or "Override colors: always" without
# system colors.
preferences-web-appearance-override-warning3 =
    .message = 您的对比度控制设置正在覆盖网站外观。

preferences-web-appearance-link =
    .label = 在扩展和主题中管理 { -brand-short-name } 主题

preferences-contrast-control-group =
    .label = 网站对比度
    .description = 网站使用多种前景色和背景色。为获得一致的对比度，您可以在各个网站中使用相同的颜色。
preferences-contrast-control-radio-group =
    .label = 覆盖颜色

preferences-contrast-control-use-platform-settings =
    .label = 自动（使用系统设置）
    .accesskey = A

preferences-contrast-control-off =
    .label = 关闭
    .accesskey = O

preferences-contrast-control-custom =
    .label = 自定义
    .accesskey = C

preferences-colors-manage-button =
    .label = 管理颜色…
    .accesskey = C

preferences-fonts-header2 =
  .label = 字体

preferences-default-zoom-label =
    .label = 默认缩放
    .accesskey = z

# Variables:
#   $percentage (number) - Zoom percentage value
preferences-default-zoom-value =
    .label = { $percentage }%

preferences-zoom-text-only =
    .label = 仅缩放文本
    .accesskey = t

preferences-text-zoom-override-warning2 =
    .message = 如果“仅缩放文本”已启用且您的默认缩放并非 100%，某些网站可能无法正确显示内容。

language-header = 语言

choose-language-description = 选择您用于显示页面的首选语言

website-language-heading =
  .label = 网站语言
  .description = 某些网页以多种语言显示。请按您的偏好顺序选择语言。

website-preferred-language =
  .label = 首选语言

website-add-language =
  .label = 添加语言

website-add-language-button =
  .aria-label = 添加所选语言
  .title = 添加所选语言

# The pattern used to generate strings presented to the user in the
# website languages selection list.
#
# Example:
#   Icelandic
#   Spanish (Chile)
#
# Variables:
#   $locale (String) - A name of the locale (for example: "Icelandic", "Spanish (Chile)")
website-remove-language-button =
  .aria-label = 移除 { $locale }
  .title = 移除 { $locale }

choose-button =
    .label = 选择…
    .accesskey = o

choose-browser-language-description = 选择用于显示来自 { -brand-short-name } 的菜单、消息和通知的语言。
manage-browser-languages-button =
  .label = 设置替代项…
  .accesskey = l
confirm-browser-language-change-description = 重新启动 { -brand-short-name } 以应用这些更改
confirm-browser-language-change-button = 应用并重新启动

browser-language-heading =
  .label = 浏览器语言
  .description = 请选择用于显示来自 { -brand-short-name } 的菜单、消息和通知的语言。
browser-language-preferred-label =
  .label = 首选语言
browser-language-fallback-label =
  .label = 备用语言
  .description = 当首选语言的本地化不完整时使用。
browser-language-install-error =
  .message = { -brand-short-name } 目前无法更新您的语言。请检查您是否已连接到互联网，或稍后重试。

fx-translate-web-pages = { -translations-brand-name }

translate-exceptions =
    .label = 例外情况…
    .accesskey = x

settings-translations-header =
    .label = 翻译
    .aria-label = 翻译
    .description = 翻译页面或选定的文本。为保护您的隐私，翻译内容将保留在您的设备上。

settings-translations-offer-to-translate-label =
    .label = 提供整页翻译

settings-translations-more-settings-button =
    .label = 更多翻译设置
    .description = 为语言、网站和离线翻译设置首选项。

settings-translations-subpage-header =
    .heading = 更多翻译设置

settings-translations-subpage-speed-up-translation-header =
    .label = 加快翻译速度
    .description = 下载完整的语言包以获得更快的翻译速度，并支持离线翻译。

settings-translations-subpage-automatic-translation-header =
    .label = 自动翻译

settings-translations-subpage-always-translate-header =
    .label = 始终翻译这些语言

settings-translations-subpage-never-translate-header =
    .label = 从不翻译这些语言

settings-translations-subpage-never-translate-sites-header =
    .label = 从不翻译这些网站

# The icon placeholders show the translations button and the settings gear in the urlbar panel.
settings-translations-subpage-never-translate-sites-description =
    要添加网站，请打开 <img data-l10n-name="translations-icon"/> 翻译面板，选择 <img data-l10n-name="settings-icon"/> 翻译设置，然后选择“从不翻译此网站”

settings-translations-subpage-language-select-option =
    .label = 添加语言

settings-translations-subpage-language-add-button =
    .aria-label = 添加语言
    .title = 添加语言

settings-translations-subpage-download-languages-header =
    .label = 下载语言

settings-translations-subpage-download-languages-select-option =
    .label = 选择语言

settings-translations-subpage-download-languages-button =
    .aria-label = 下载语言
    .title = 下载语言

# Variables:
#   $language (string) - Localized name of the language to download.
#   $size (string) - Download size in megabytes, formatted for the locale.
settings-translations-subpage-download-language-option = { $language } ({ $size }MB)
    .label = { $language } ({ $size }MB)

settings-translations-subpage-no-languages-downloaded =
    .label = 未下载任何语言

settings-translations-subpage-no-languages-added =
    .label = 未添加任何语言

settings-translations-subpage-download-progress = 正在下载…

# Variables:
#   $language (string) - The localized display name of the language.
#   $size (string) - The download size of the language in megabytes.
settings-translations-subpage-download-error = 无法下载 { $language } ({ $size }MB)

settings-translations-subpage-download-retry-button =
    .label = 重试

# Variables:
#   $language (string) - The localized display name of the language.
#   $size (string) - The download size of the language in megabytes.
settings-translations-subpage-download-delete-confirm = 删除 { $language } ({ $size }MB)？

settings-translations-subpage-download-delete-button =
    .label = 删除

settings-translations-subpage-download-cancel-button =
    .label = 取消

settings-translations-subpage-no-sites-added =
    .label = 未添加任何网站

# Variables:
#    $localeName (string) - Localized name of the locale to be used.
use-system-locale =
   .label = 使用您的操作系统设置“{ $localeName }”来格式化日期、时间、数字和度量单位。

settings-spellcheck-header =
    .label = 拼写检查

check-user-spelling =
    .label = 在您输入时检查您的拼写
    .accesskey = t
spellcheck-download-dictionaries =
    .label = 下载词典

spellcheck-promo =
    .heading = 如何使用拼写检查
    .message = 右键单击文本字段以开启或关闭拼写检查，或更改语言。并非所有字段都支持拼写检查。

## General Section - Files and Applications

files-and-applications-title = 文件和应用程序

download-save-files-header =
    .label = 将文件保存至

download-save-where-3 =
    .aria-label = 将文件保存至

download-always-ask-where2 =
    .label = 下载前询问您将文件保存至何处
    .accesskey = A
download-private-browsing-delete2 =
    .label = 关闭时删除私有窗口下载
    .accesskey = D

applications-header = 应用程序

applications-description = 选择 { -brand-short-name } 如何处理您从网络下载的文件或浏览时使用的应用程序。

applications-setting2 =
    .label = 文件和应用程序
    .description = 选择 { -brand-short-name } 如何处理下载的文件和内容。

applications-filter =
    .placeholder = 搜索文件类型或应用程序

applications-type-column =
    .label = 内容类型
    .accesskey = T

applications-type-heading = 内容类型

applications-action-column =
    .label = 操作
    .accesskey = A

applications-action-heading = 操作

# Variables:
#   $extension (String) - file extension (e.g .TXT)
applications-file-ending = { $extension } 文件
applications-action-save =
    .label = 保存文件

# Variables:
#   $app-name (String) - Name of an application (e.g Adobe Acrobat)
applications-use-app =
    .label = 使用 { $app-name }

# Variables:
#   $app-name (String) - Name of an application (e.g Adobe Acrobat)
applications-use-app-default =
    .label = 使用 { $app-name }（默认）

applications-use-os-default =
    .label =
        { PLATFORM() ->
            [macos] 使用 macOS 默认应用程序
            [windows] 使用 Windows 默认应用程序
           *[other] 使用系统默认应用程序
        }

applications-use-other =
    .label = 使用其它…
applications-select-helper = 选择辅助应用程序

applications-manage-app =
    .label = 应用程序详情…
applications-always-ask =
    .label = 始终询问

# Variables:
#   $type-description (string) - Description of the type (e.g "Portable Document Format")
#   $type (string) - The MIME type (e.g application/binary)
applications-type-description-with-type = { $type-description } ({ $type })

# Variables:
#   $extension (string) - File extension (e.g .TXT)
#   $type (string) - The MIME type (e.g application/binary)
applications-file-ending-with-type = { applications-file-ending } ({ $type })

applications-open-inapp =
    .label = 在 { -brand-short-name } 中打开

## The strings in this group are used to populate
## selected label element based on the string from
## the selected menu item.

applications-action-save-label =
    .value = { applications-action-save.label }

applications-use-app-label =
    .value = { applications-use-app.label }

applications-open-inapp-label =
    .value = { applications-open-inapp.label }

applications-always-ask-label =
    .value = { applications-always-ask.label }

applications-use-app-default-label =
    .value = { applications-use-app-default.label }

applications-use-other-label =
    .value = { applications-use-other.label }

applications-use-os-default-label =
    .value = { applications-use-os-default.label }

##
applications-handle-new-file-types-description = 对于其他文件，{ -brand-short-name } 应当执行何种操作？

applications-setting-new-file-types =
     .label = 对于其他文件，{ -brand-short-name } 应当执行何种操作？

applications-save-for-new-types =
    .label = 保存文件
    .accesskey = S
applications-save-for-new-types2 =
    .label = 自动保存文件
    .accesskey = S

applications-ask-before-handling =
    .label = 询问您是否打开或保存文件
    .accesskey = A
applications-ask-before-handling2 =
    .label = 询问您以打开或保存文件
    .accesskey = A

drm-group =
  .label = 数字版权管理（DRM）内容

play-drm-content =
    .label = 播放受DRM控制的内容
    .accesskey = P

play-drm-content-learn-more = 为何我们将其禁用

## About Firefox

about-firefox-header =
    .heading = 关于 { -brand-short-name }

## Firefox updates

update-application-heading =
    .label = { -brand-short-name } 更新
    .description = 更新可提高 { -brand-short-name } 的速度、稳定性及安全性。

update-application-suppress-prompts-heading =
    .label = 通知

update-application-updates-managed-by-os =
    .message = 更新由您的操作系统进行管理

# Variables:
# $version (string) - Firefox version
update-application-version = 版本 { $version } <a data-l10n-name="learn-more">访问软件源</a>

update-history-2 =
    .label = 显示更新历史
    .accesskey = p

update-application-installation =
    .label = 安装

update-application-auto-2 =
    .label = 自动安装更新（推荐）
    .accesskey = A

update-application-check-choose-2 =
    .label = 检查更新，但由您选择何时安装
    .accesskey = C

update-application-background-enabled =
    .label = 当 { -brand-short-name } 未运行时
    .accesskey = W

update-application-warning-cross-user-setting-2 =
    .message = 此设置将应用于所有 Windows 账户及使用此 { -brand-short-name } 安装的 { -brand-short-name } 配置文件。

update-application-suppress-prompts-2 =
    .label = 显示更少的更新提醒
    .accesskey = n

update-setting-write-failure-title2 = 保存更新设置时发生错误

# Variables:
#   $path (string) - Path to the configuration file
# The newlines between the main text and the line containing the path is
# intentional so the path is easier to identify.
update-setting-write-failure-message2 =
    { -brand-short-name } 遇到一个错误，未能保存此更改。请注意，更改此更新设置需要您具备对以下文件的写入权限。您或系统管理员可以通过授予用户组对该文件的完全控制权限来解决此错误。

    无法写入文件：{ $path }

update-in-progress-title = 更新正在进行中

update-in-progress-message = 您是否希望 { -brand-short-name } 继续执行此更新？

update-in-progress-ok-button = &放弃
# Continue is the cancel button so pressing escape or using a platform standard
# method of closing the UI will not discard the update.
update-in-progress-cancel-button = &继续

## Firefox support

support-application-heading =
    .label = { -brand-short-name } 支持
    .description = 排除问题或与社区分享您的想法。

support-get-help =
    .label = 获取帮助

support-share-ideas =
    .label = 分享想法和反馈

## General Section - Performance

performance-group =
  .label = 性能

performance-use-recommended-settings-checkbox-2 =
    .label = 使用推荐的性能设置
    .description = 这些设置是根据您的硬件和操作系统量身定制的。
    .accesskey = U

performance-settings-learn-more = 了解更多信息

performance-allow-hw-accel =
.label = 在可用时使用硬件加速功能
    .accesskey = r

performance-limit-content-process-option = 内容进程限制
    .accesskey = l

performance-limit-content-process-enabled-desc = 额外的内容进程可提升多标签页使用时的性能，但亦会增加内存消耗。
performance-limit-content-process-blocked-desc = 仅当多进程 { -brand-short-name } 启用时，方可通过修改内容进程数目实现此操作。 <a data-l10n-name="learn-more">了解如何检查多进程是否已启用</a>

# Variables:
#   $num (number) - Default value of the `dom.ipc.processCount` pref.
performance-default-content-process-count =
    .label = { $num }（默认值）

## General Section - Browsing

browsing-group =
  .label = 浏览

browsing-use-smooth-scrolling =
    .label = 使用平滑滚动
    .accesskey = m

browsing-gtk-use-non-overlay-scrollbars =
    .label = 始终显示滚动条
    .accesskey = o

browsing-always-underline-links=
    .label = 始终为链接添加下划线
    .accesskey = u

browsing-use-onscreen-keyboard =
    .label = 必要时显示触摸键盘
    .accesskey = c

browsing-use-cursor-navigation =
    .label = 始终使用光标键进行页面内导航
    .accesskey = k

browsing-use-full-keyboard-navigation =
    .label = 使用 Tab 键在表单控件和链接之间移动焦点
    .accesskey = t

browsing-search-on-start-typing =
    .label = 开始输入时进行文本搜索
    .accesskey = x

settings-media-group =
    .label = 媒体

browsing-picture-in-picture-toggle-enabled-2 =
    .label = 使用画中画功能
    .accesskey = e

browsing-picture-in-picture-enable-when-switching-tabs =
    .label = 切换标签页时保持画中画视频播放
    .accesskey = s

browsing-media-control =
    .label = 通过键盘、耳机或虚拟界面控制媒体
    .accesskey = v

recommendations-group =
    .label = 推荐

browsing-cfr-recommendations =
    .label = 浏览时推荐扩展
    .accesskey = R
browsing-cfr-features =
    .label = 浏览时推荐功能
    .accesskey = f

## General Section - Proxy

network-proxy-group2 =
  .label = 代理设置
  .description = 配置 { -brand-short-name } 连接互联网的方式。

network-proxy-connection-settings2 =
    .label = 配置代理
    .description = 更改这些设置可能导致连接问题
    .accesskey = p

## Home Section

home-section =
    .heading = 主页与启动

home-new-windows-tabs-header = 新窗口和新标签页

home-new-windows-tabs-description2 = 选择当您打开主页、新窗口和新标签页时，您所看到的内容。

## Home Section - Default Browser

home-default-browser-title =
    .label = 默认浏览器

is-default-browser-2 =
    .message = { -brand-short-name } 已是您的默认浏览器。操作已成功完成。

is-not-default-browser-2 =
    .message = 请注意，{ -brand-short-name } 并非您的默认浏览器。

set-as-my-default-browser-2 =
    .label = 设为默认
    .accesskey = D

## Home Section - Home Page Customization

home-homepage-mode-label = 主页和新窗口

home-newtabs-mode-label = 新标签页

home-restore-defaults =
    .label = 恢复默认设置
    .accesskey = R

home-mode-choice-default-fx =
    .label = { -firefox-home-brand-name }（默认）
home-mode-choice-custom =
    .label = 自定义统一资源定位符...

home-mode-choice-blank =
    .label = 空白页面

home-homepage-custom-url =
    .placeholder = 粘贴统一资源定位符...

# This button is shown when the homepage is managed by an extension and is placed below extension-controlling-homepage.
home-homepage-manage-extension-button =
    .label = 管理扩展

## Custom Homepage subpage

home-custom-homepage-header = 自定义主页

home-custom-homepage-subpage =
    .heading = 自定义主页

# This string has a special case for '1' and [other] (default). If necessary for
# your language, you can add {$tabCount} to your translations and use the
# standard CLDR forms, or only use the form for [other] if both strings should
# be identical.
use-current-pages =
    .label =
        { $tabCount ->
            [1] 使用当前页面
           *[other] 使用当前页面组
        }
    .accesskey = 使

choose-bookmark =
    .label = 使用书签...
    .accesskey = 书

## Home Section - Firefox Home Content Customization

home-prefs-content-header2 = { -firefox-home-brand-name } 内容
home-prefs-content-description2 = 请您选择您希望在{ -firefox-home-brand-name }屏幕上呈现的内容。

home-prefs-search-header =
    .label = 网络搜索
home-prefs-shortcuts-header =
    .label = 快捷方式
home-prefs-shortcuts-description = 您保存或访问过的站点
home-prefs-shortcuts-by-option-sponsored =
    .label = 赞助快捷方式

home-prefs-recommended-by-header-generic =
    .label = 推荐故事
home-prefs-recommended-by-description-generic = 由{ -brand-product-name }家族为您策展的卓越内容

home-prefs-stories-header =
    .label = 故事
home-prefs-stories-description = 根据您的活动为您个性化定制的故事

##

home-prefs-recommended-by-learn-more = 工作原理
home-prefs-recommended-by-option-sponsored-stories =
    .label = 赞助故事

home-prefs-highlights-option-visited-pages =
    .label = 已访问页面
home-prefs-highlights-options-bookmarks =
    .label = 书签
home-prefs-highlights-option-most-recent-download =
    .label = 最近下载

home-prefs-recent-activity-header =
    .label = 最近活动
home-prefs-recent-activity-description = 最近访问的站点和内容精选

# Variables:
#   $num (number) - Number of rows displayed
home-prefs-sections-rows-option =
    .label =
        { $num ->
            [one] { $num } 行
           *[other] { $num } 行
        }
home-prefs-weather-header =
  .label = 天气
home-prefs-weather-description = 今日预报一瞥
home-prefs-weather-learn-more-link = 了解更多

# "Support" here means to help sustain or contribute to something, especially through funding or sponsorship.
home-prefs-support-firefox-header =
    .label = 支持 { -brand-product-name }

home-prefs-mission-message = 我们的赞助商支持我们构建更美好网络的使命
home-prefs-mission-message-learn-more-link = 了解详情

home-prefs-manage-topics-link = 管理主题

home-prefs-choose-wallpaper-link = 选择壁纸

## Search Section

# Header for the search section ("search" is a noun).
search-section =
    .heading = 搜索

search-engine-group =
    .label = 默认搜索引擎
search-default-engine =
    .aria-label = 默认搜索引擎

# With this option enabled, while on a SERP, the URL normally displayed in the
# address bar will be replaced with the search term used to generate that SERP.
search-show-search-term-option-2 =
    .label = 在搜索结果页面的地址栏中显示搜索词

search-separate-default-engine-2 =
    .label = 在隐私窗口中启用不同的默认搜索引擎
    .accesskey = 隐

search-separate-default-engine-dropdown =
    .aria-label = 隐私窗口中的默认搜索引擎
search-suggestions-header-2 =
    .label = 搜索引擎建议

search-show-suggestions-option =
    .label = 显示搜索建议
    .accesskey = S

search-show-suggestions-url-bar-option =
    .label = 在地址栏结果中显示搜索建议
    .accesskey = l

# This string describes what the user will observe when the system
# prioritizes search suggestions over browsing history in the results
# that extend down from the address bar. In the original English string,
# "before" refers to location (appearing most proximate to), not time
# (appearing before).
search-show-suggestions-above-history-option-2 =
    .label = 在地址栏结果中，将搜索建议显示于浏览历史之前

search-show-suggestions-private-windows-2 =
    .label = 在隐私窗口中的搜索建议

search-suggestions-cant-show-2 =
    .message = 由于您已将 { -brand-short-name } 配置为不记录任何历史记录，因此地址栏结果中将不会显示搜索建议。

addressbar-header-1 =
    .label = 地址栏
    .description = 请选择您希望在地址栏中显示的建议类型

# When Firefox Suggest is enabled, this replaces `addressbar-header-1`.
addressbar-header-firefox-suggest-2 =
    .label = { -firefox-suggest-brand-name }
    .description = 来自 { -brand-short-name } 及我们合作伙伴的建议将显示在您的地址栏中。

addressbar-locbar-history-option =
    .label = 浏览历史
    .accesskey = h
addressbar-locbar-bookmarks-option =
    .label = 书签
    .accesskey = k
addressbar-locbar-clipboard-option =
    .label = 剪贴板
    .accesskey = C
addressbar-locbar-openpage-option =
    .label = 打开的标签页
    .accesskey = O
# Shortcuts refers to the shortcut tiles on the new tab page, previously known as top sites. Translation should be consistent.
addressbar-locbar-shortcuts-option =
    .label = 快捷方式
    .accesskey = S
addressbar-locbar-topsites-option =
    .label = 热门站点
    .accesskey = T
addressbar-locbar-showrecentsearches-option-2 =
    .label = 最近的搜索
    .accesskey = r
addressbar-locbar-engines-option-1 =
    .label = 建议可使用的搜索引擎
    .accesskey = a
addressbar-locbar-quickactions-option =
    .label = 快速操作
    .accesskey = Q
addressbar-locbar-showtrendingsuggestions-option-2 =
    .label = 热门搜索建议
    .accesskey = t

# Toggles whether suggestions are obtained from Firefox Suggest or not (local or online).
addressbar-locbar-suggest-all-option-2 =
    .label = 来自 { -brand-short-name } 的建议
    .description = 获取与您的搜索相关的来自网络的建议。

addressbar-locbar-suggest-sponsored-option-2 =
    .label = 来自赞助商的建议
    .description = 通过偶尔的赞助建议来支持 { -brand-short-name }。

# This string is used for a checkbox in the settings UI that opts the
# user into "online" Firefox Suggest, allowing them to receive suggestions from
# Mozilla's Merino server.
# "Mozilla" is intentionally hardcoded to prevent forks from replacing it
# with their own vendor name, since the online suggest is created and maintained
# by Mozilla.
addressbar-firefox-suggest-online =
    .label = 当您输入时从 Mozilla 获取建议

addressbar-dismissed-suggestions-label-2 =
    .label = 已取消的建议
    .description = 恢复来自赞助商及 { -brand-short-name } 的已取消建议。
addressbar-restore-dismissed-suggestions-button-2 =
    .label = 恢复建议

search-one-click-header2 = 搜索快捷方式
search-one-click-desc = 当您开始输入关键字时，请选择显示在地址栏和搜索栏下方的备用搜索引擎。
search-one-click-header-3 =
    .label = 附加搜索引擎
    .description = 请选择您希望在地址栏中显示的搜索引擎和快捷方式。

update-search-engine-success =
    .message = 搜索引擎已成功更新

search-edit-engine-2 =
    .title = 编辑搜索引擎
search-delete-engine =
    .title = 删除搜索引擎
search-enable-engine =
    .title = 启用搜索引擎
search-outlink-to-extensions-page =
    .title = 在扩展和主题中进行管理

search-choose-engine-column =
    .label = 搜索引擎
search-choose-keyword-column =
    .label = 关键字

search-restore-default =
    .label = 恢复默认搜索引擎
    .accesskey = D

search-remove-engine =
    .label = 移除
.accesskey = R
search-add-engine =
    .label = 添加
    .accesskey = A
search-add-engine-2 =
    .label = 添加搜索引擎
    .accesskey = A
search-edit-engine =
    .label = 编辑
    .accesskey = E

search-find-more-link = 查找更多搜索引擎

search-filtering-for-add-engine = 添加引擎

# This warning is displayed when the chosen keyword is already in use
# ('Duplicate' is an adjective)
search-keyword-warning-title = 重复关键字
# Variables:
#   $name (string) - Name of a search engine.
search-keyword-warning-engine = 您已选择了一个当前正被“{ $name }”使用的关键字。请选择其他关键字。
search-keyword-warning-bookmark = 您已选择了一个当前正被书签使用的关键字。请选择其他关键字。

# This warning is displayed when the chosen name is already in use.
# Variables:
#   $name (string) - Name of a search engine.
edit-engine-name-warning-duplicate = 已存在名为“{ $name }”的搜索引擎。请选择其他名称。

remove-engine-confirmation = 您确定要移除该搜索引擎吗？
remove-engine-remove = 移除
remove-addon-engine-alert = 要移除该搜索引擎，请移除关联的附加组件。

## Containers Section

containers-section-header2 =
    .heading = 容器设置
containers-card-header2 =
    .label = 容器
    .description = 按容器分隔 Cookie，以便您能够在同一站点上使用不同账户，并限制跨站点跟踪。
containers-add-button2 =
    .label = 添加新容器
    .accesskey = A

containers-new-tab-check2 =
    .label = 为每个新标签页选择容器
    .accesskey = S
    .description = 这将使您在每次按下打开新标签页按钮时，都会打开容器菜单。

containers-settings-button2 =
    .title = 设置
containers-remove-button2 =
    .title = 移除

## Account and sync

account-sync-section =
    .heading = 账户和同步

pane-account-sync-title2 = 账户和同步
    .title = 账户和同步

sync-group-label =
    .label = 同步

account-group-label2 =
    .label = 账户

account-disabled-group =
    .label = 账户
    .description = 账户设置不可用。

account-placeholder2 =
    .label = 您尚未登录
    .description = 登录并保持您的数据私密、加密，并在您使用 { -brand-short-name } 的任何地方即时可用。

## Firefox account - Signed out. Note that "Sync" and "Firefox account" are now
## more discrete ("signed in" no longer means "and sync is connected").

sync-signedout-caption = 随身携带您的网络
sync-signedout-description2 = 在您的所有设备上同步您的书签、历史记录、标签页、密码、附加组件和设置。

sync-signedout-account-signin3 =
    .label = 登录以同步…
    .accesskey = i

sync-signedout-account-signin-4 =
    .label = 登录您的账户以开始同步
    .accesskey = i

sync-signedout-account-short =
    .label = 登录
    .accesskey = i

# This message contains two links and two icon images.
#   `<img data-l10n-name="android-icon"/>` - Android logo icon
#   `<a data-l10n-name="android-link">` - Link to Android Download
#   `<img data-l10n-name="ios-icon">` - iOS logo icon
#   `<a data-l10n-name="ios-link">` - Link to iOS Download
#
# They can be moved within the sentence as needed to adapt
# to your language, but should not be changed or translated.
sync-mobile-promo = 下载 Firefox 用于<img data-l10n-name="android-icon"/> <a data-l10n-name="android-link">Android</a> 或 <img data-l10n-name="ios-icon"/> <a data-l10n-name="ios-link">iOS</a>，以便与您的移动设备进行同步。

## Firefox account - Signed in

sync-profile-picture-with-alt =
    .tooltiptext = 更改个人资料图片
    .alt = 更改个人资料图片

sync-profile-picture-account-problem =
    .alt = 账户个人资料图片

fxa-login-rejected-warning =
    .alt = 警告

sync-sign-out =
    .label = 注销…
    .accesskey = g

sync-sign-out2 =
.label = 注销
    .accesskey = g

sync-manage-account = 管理账户
    .accesskey = o

sync-manage-account2 =
    .label = 管理账户
    .accesskey = o

## Variables
## $email (string) - Email used for Firefox account
## $name (string) - Name used for Firefox account

sync-account-signed-in =
    .label = { $email }

sync-account-signed-in-display-name =
    .label = { $name }
    .description = { $email }

sync-signedin-unverified = { $email } 尚未经过验证。

sync-signedin-unverified2 =
    .label = { $email } 尚未得到确认
    .description = 建议您检查您的收件箱，以便确认您的账户，并使其正式生效。

sync-signedin-login-failure = 请登录，以便重新连接 { $email }

sync-signedin-login-failure2 =
    .label = 您已从 { $email } 中注销
    .description = 请重新登录，以便重新连接，并开始同步您的数据。

##

sync-verify-account =
    .label = 验证账户
    .accesskey = V

sync-remove-account =
    .label = 移除账户
    .accesskey = R

sync-sign-in =
    .label = 登录
    .accesskey = g

## Sync section - enabling or disabling sync.

prefs-syncing-on = 同步：开启

prefs-syncing-on-2 =
    .label = 同步功能已开启

prefs-syncing-off = 同步：关闭

prefs-syncing-off-2 =
    .label = 同步功能已关闭
    .description = 建议您开启同步功能，以便在任何设备上获取您的书签、密码、历史记录等内容。

prefs-sync-turn-on-syncing =
    .label = 开启同步…
    .accesskey = s

prefs-sync-turn-on-syncing-2 =
    .label = 开启同步
    .accesskey = s

prefs-sync-offer-setup-label2 = 建议您在所有设备之间同步您的书签、历史记录、标签页、密码、附加组件和设置。

prefs-sync-now-button =
    .label = 立即同步
    .accesskey = N

prefs-sync-now-button-2 =
    .label = 立即同步
    .accesskey = N

prefs-syncing-button =
    .label = 正在同步…

prefs-syncing-button-2 =
    .label = 正在同步…
    .title = 立即同步

## The list of things currently syncing.

sync-syncing-across-devices-heading = 您正在所有已连接的设备之间同步以下项目：

sync-syncing-across-devices-heading-2 = 已在设备之间同步的数据

sync-syncing-across-devices-empty-state2 =
    .label = 管理已同步的数据
    .description = 您当前尚未同步任何内容……不过这是暂时的。建议您开启同步功能，以便在所有设备上获取您的全部数据。

sync-currently-syncing-bookmarks = 书签
sync-currently-syncing-history = 历史记录
sync-currently-syncing-tabs = 打开的标签页
sync-currently-syncing-passwords = 密码
sync-currently-syncing-addresses = 地址
sync-currently-syncing-payment-methods = 支付方式
sync-currently-syncing-addons = 附加组件
sync-currently-syncing-settings = 设置

sync-manage-options =
    .label = 管理同步…
    .accesskey = M

sync-manage-options-2 =
    .label = 管理已同步的数据
    .accesskey = M

settings-sync-disconnect-button =
    .label = 断开连接

## The "Choose what to sync" dialog.

sync-choose-what-to-sync-dialog4 =
    .title = 管理在您所有已连接设备上同步的内容
    .style = min-width: 36em;
.buttonlabelaccept = 保存
.buttonaccesskeyaccept = S
.buttonlabelextra2 = 断开连接…
.buttonaccesskeyextra2 = D

sync-engine-bookmarks =
    .label = 书签
    .accesskey = m

sync-engine-history =
    .label = 历史记录
    .accesskey = r

sync-engine-tabs =
    .label = 开启的选项卡
    .tooltiptext = 已同步设备上开启内容的列表
    .accesskey = t

sync-engine-passwords =
    .label = 密码
    .tooltiptext = 您已保存的密码
    .accesskey = P

sync-engine-addresses =
    .label = 地址
    .tooltiptext = 您已保存的邮政地址（仅限桌面版）
    .accesskey = e

sync-engine-payment-methods2 =
    .label = 支付方式
    .tooltiptext = 姓名、卡号和到期日期
    .accesskey = n

sync-engine-addons =
    .label = 附加组件
    .tooltiptext = 用于巨硬边缘桌面的扩展和主题
    .accesskey = A

sync-engine-settings =
    .label = 设置
    .tooltiptext = 您已更改的常规、隐私和安全设置
    .accesskey = s

## The device name controls.

sync-device-name-header = 设备名称

sync-device-name-header-2 =
    .label = 设备名称

# Variables:
#   $placeholder (string) - The placeholder text of the input
sync-device-name-input =
    .aria-label = 设备名称
    .placeholder = { $placeholder }

sync-device-name-change-2 =
    .label = 更改设备名称
    .accesskey = h

sync-device-name-change =
    .label = 更改设备名称…
    .accesskey = h

sync-device-name-cancel =
    .label = 取消
    .accesskey = n

sync-device-name-save =
    .label = 保存
    .accesskey = v

sync-connect-another-device = 连接其他设备

sync-connect-another-device-2 =
    .label = 连接其他设备

## Privacy Section

privacy-header = 浏览器隐私

## Privacy Section - Passwords

# "Logins" is the former term for "Passwords". Users should find password settings
# by searching for the former term "logins". It's not displayed in the UI.
pane-privacy-passwords-header = 密码
    .searchkeywords = 登录信息

forms-passwords-header =
    .label = 密码
    .aria-label = 密码

# Checkbox to control whether UI is shown to users to save or fill logins/passwords.
forms-ask-to-save-passwords =
    .label = 询问是否保存密码
    .accesskey = A
forms-manage-password-exceptions =
    .label = 管理密码例外
    .accesskey = M
forms-exceptions =
    .label = 例外…
    .accesskey = x
forms-suggest-passwords =
    .label = 建议强密码
    .accesskey = S
forms-breach-alerts =
    .label = 显示涉及数据泄露网站的密码警报
    .accesskey = b
forms-breach-alerts-learn-more-link = 了解更多

## Privacy Panel Settings

privacy-panel-settings-header =
    .label = 隐私面板设置
    .description = 获取帮助以在 { -brand-short-name } 中保护您的在线信息。
# By “breach message” we mean the UI messaging shown when Firefox detects that a
privacy-panel-breach-alerts =
    .label = 显示泄露消息
    .accesskey = s
preferences-relay-integration-checkbox2 =
    .label = 建议您使用 { -relay-brand-name } 电子邮件掩码，以保护您的电子邮件地址
    .accesskey = r
relay-integration-learn-more-link = 了解更多信息

# Checkbox which controls filling saved logins into fields automatically when they appear, in some cases without user interaction.
forms-fill-usernames-and-passwords =
    .label = 自动填充用户名和密码
    .accesskey = F
forms-fill-usernames-and-passwords-2 =
    .label = 保存并自动填充用户名和密码
    .accesskey = f
forms-saved-passwords =
    .label = 已保存的密码
    .accesskey = d
forms-saved-passwords-2 =
    .label = 管理已保存的密码
    .accesskey = d
forms-saved-passwords-searchkeywords = 以下网站的登录信息已存储在您的计算机上

# Header for additional protections when managing password settings.
forms-additional-protections-header =
    .label = 附加保护措施
forms-primary-pw-use =
    .label = 使用主密码
    .accesskey = U
forms-primary-pw-use-2 =
    .label = 使用主密码
    .description = 此操作将为保护您已保存的密码增添一层额外的安全措施。
    .accesskey = U
forms-primary-pw-set =
    .label = 设置主密码
forms-primary-pw-on =
    .label = 主密码已启动
forms-primary-pw-change-2 =
    .label = 更改主密码
# Label for button to disable primary password.
forms-primary-pw-turn-off =
    .label = 将其关闭
# This operation requires the user to authenticate with the operating system (device sign-in)
forms-os-reauth =
    .label = 要求设备登录以填充和管理密码
forms-os-reauth-2 =
    .label = 要求设备登录以管理密码
forms-primary-pw-learn-more-link = 了解更多信息
# This string uses the former name of the Primary Password feature
# ("Master Password" in English) so that the preferences can be found
# when searching for the old name. The accesskey is unused.
forms-master-pw-change =
    .label = 更改主控密码…
    .accesskey = M
forms-primary-pw-change =
    .label = 更改主密码…
    .accesskey = P
# Leave this message empty if the translation for "Primary Password" matches
# "Master Password" in your language. If you're editing the FTL file directly,
# use { "" } as the value.
forms-primary-pw-former-name = 旧称主控密码

forms-primary-pw-fips-title = 您当前处于FIPS模式。FIPS要求使用非空的主密码。
forms-master-pw-fips-desc = 密码更改失败
forms-windows-sso =
    .label = 允许为巨硬、工作和学校账户执行Windows单一登录
forms-windows-sso-learn-more-link = 了解更多信息
forms-windows-sso-desc = 在您的设备设置中管理账户

windows-passkey-settings-label = 在系统设置中管理密钥

## OS Authentication dialog

# This message can be seen by trying to add a Primary Password.
primary-password-os-auth-dialog-message-win = 若要创建主密码，请输入您的Windows登录凭据。此操作将有助于保护您账户的安全性。

# This message can be seen by trying to add a Primary Password.
# The macOS strings are preceded by the operating system with "Firefox is trying to "
# and includes subtitle of "Enter password for the user "xxx" to allow this." These
# notes are only valid for English. Please test in your locale.
primary-password-os-auth-dialog-message-macosx = 创建主密码
master-password-os-auth-dialog-caption = { -brand-full-name }

# The macOS string is preceded by the operating system with "Firefox is trying to ".
autofill-creditcard-os-dialog-message = { PLATFORM () ->
    [macos] 更改支付方式的设置
    *[other] { -brand-short-name } 正在尝试更改支付方式的设置。请使用您的设备登录以允许此操作。
}
autofill-creditcard-os-auth-dialog-caption = { -brand-full-name }

## Privacy section - Autofill

payments-group =
    .label = 支付方式

autofill-payment-methods-header =
    .aria-label = 支付方式
autofill-payment-methods-checkbox-message-2 =
    .label = 保存并自动填充支付信息
    .accesskey = p
autofill-payment-methods-manage-payments-title =
    .heading = 管理支付方式
autofill-payment-methods-manage-payments-button =
    .label = 管理支付方式
    .accesskey = m
# This operation requires the user to authenticate with the operating system (device sign-in)
autofill-reauth-payment-methods-checkbox-2 =
    .label = 要求设备登录以自动填充和管理支付方式
    .accesskey = o

autofill-payment-methods-add-button = 添加新的支付方式
payments-list-header =
  .label = 支付方式
payments-delete-payment-prompt-title = 是否删除此支付方式？
payments-delete-payment-prompt-confirm-button = 删除
payments-delete-payment-prompt-cancel-button = 取消
payments-delete-payment-button-label =
    .aria-label = 删除
payments-edit-payment-button-label =
    .aria-label = 编辑

# This message is displayed when no payment methods such as credit card are stored in Firefox
payments-no-payments-stored-message = 尚未存储任何支付方式（如信用卡）
.label = 尚未添加任何付款方式

# These values are displayed for each credit card record listed on the Manage Payment methods
# settings page.
# Variables:
#   $cardNumber (string) - The obscured credit card number (for example: ********* 2423)
#   $expDate (string) - The obscured expiry date of the credit card (for example: XX/2027)
payment-moz-box-item =
  .label = { $cardNumber }
  .description = { $expDate }

addresses-group =
    .label = 地址及其他信息
autofill-addresses-checkbox-message =
    .label = 保存地址并启用自动填充功能
    .accesskey = S
autofill-addresses-manage-addresses-button =
    .label = 管理地址及其他信息
    .accesskey = M
addresses-list-header =
    .label = 地址
addreses-delete-address-button-label =
    .aria-label = 删除
addreses-edit-address-button-label =
    .aria-label = 编辑
addresses-delete-address-prompt-title = 您确定要删除此地址吗？
addresses-delete-address-prompt-confirm-button = 删除
addresses-delete-address-prompt-cancel-button = 取消
autofill-addresses-add-button = 添加新地址
autofill-addresses-manage-addresses-title =
    .heading = 管理地址及其他信息

# This message is displayed when no addresses are stored in Firefox
addresses-no-addresses-stored-message =
    .label = 尚未添加任何地址

pane-passwords-autofill-title2 = 密码和自动填充
  .title = 密码和自动填充
preferences-passwords-autofill-header =
   .heading = 密码和自动填充

## Privacy Section - History

history-group =
    .label = 历史记录

history-remember-option-all2 =
    .label = 记住历史记录
history-remember-option-never2 =
    .label = 从不记住历史记录
    .description = 每个窗口的行为都将与隐私窗口相同。启用此选项后，需要允许扩展程序。
history-remember-option-custom2 =
    .label = 自定义历史记录

history-remember-description4 =
    .aria-label = { history-group.label }
    .description = { -brand-short-name } 将记住您的浏览、下载、表单和搜索历史记录。

history-dontremember-description4 =
    .aria-label = { history-group.label }
    .description = { -brand-short-name } 将使用与隐私浏览相同的设置，并且在您浏览 Web 时将不记住任何历史记录。

history-custom-description4 =
    .aria-label = { history-group.label }
    .description = { -brand-short-name } 将使用自定义设置来管理您的浏览、下载、表单和搜索历史记录。

history-private-browsing-permanent =
    .label = 始终使用隐私浏览模式
    .accesskey = p

history-remember-browser-option =
    .label = 记住浏览和下载历史记录
    .accesskey = b

history-remember-search-option =
    .label = 记住搜索和表单历史记录
    .accesskey = f

history-clear-on-close-option =
    .label = 当 { -brand-short-name } 关闭时清除历史记录
    .accesskey = r

history-clear-on-close-settings =
    .label = 设置…
    .accesskey = t

history-clear-button =
    .label = 清除历史记录…
    .accesskey = s

history-header2 =
    .heading = 历史记录

history-section-header =
    .label = 历史记录
    .description = 请选择您希望 { -brand-short-name } 在关闭浏览器时记住的内容。

history-custom-section-header =
    .label = 高级设置
    .description = 自定义您希望 { -brand-short-name } 在关闭浏览器时记住的内容。

history-custom-button =
    .label = 选择您希望 { -brand-short-name } 记住的内容

## Privacy Section - Site Data

cookies-site-data-group =
    .label = Cookie 和站点数据

sitedata-total-size-calculating = 正在计算站点数据和缓存大小…

# Variables:
#   $value (number) - Value of the unit (for example: 4.6, 500)
#   $unit (string) - Name of the unit (for example: "bytes", "KB")
sitedata-total-size3 = 网站当前正在使用 <strong>{ $value } { $unit }</strong> 的磁盘空间。

sitedata-learn-more = 了解更多

sitedata-delete-on-close2 =
    .label = 每次关闭 { -brand-short-name } 时清除 Cookie 和站点数据
    .accesskey = c

sitedata-delete-on-close-private-browsing3 =
    .message = 根据您的主页历史设置，{ -brand-short-name } 将在您关闭浏览器时删除此次会话中的 Cookie 和站点数据。

sitedata-delete-on-close-private-browsing4 =
    .heading = 主页历史将不会被保存。
    .message = { -brand-short-name } 将在您关闭浏览器时清除此次会话中的 Cookie 和站点数据。

sitedata-option-block-cross-site-trackers =
    .label = 跨站点跟踪器
sitedata-option-block-cross-site-tracking-cookies =
    .label = 跨站点跟踪 Cookie
sitedata-option-block-cross-site-cookies2 =
    .label = 隔离跨站点 Cookie
sitedata-option-block-unvisited =
    .label = 来自未访问网站的 Cookie
sitedata-option-block-all-cross-site-cookies =
    .label = 所有跨站点 Cookie（可能导致网站无法正常工作）
sitedata-option-block-all =
    .label = 所有 Cookie（将导致网站无法正常工作）

sitedata-clear2 =
    .label = 清除浏览数据
    .accesskey = l

sitedata-settings2 =
    .label = 管理浏览数据
    .accesskey = M

sitedata-cookies-exceptions =
    .label = 管理例外…
    .accesskey = x

sitedata-cookies-exceptions2 =
    .label = 管理例外
    .accesskey = x
    .description = 您可以指定哪些网站始终允许或始终不允许使用 Cookie 和站点数据。

sitedata-heading =
    .label = 浏览数据
    .description = 管理您的 Cookie、主页历史、缓存、网站数据及其他相关内容。

sitedata-settings3 =
    .label = 清除特定站点的数据
    .accesskey = s

sitedata-cookies-exceptions3 =
    .label = 管理例外
    .accesskey = x
    .description = 请选择特定站点如何处理 Cookie 和站点数据。

## Privacy Section - Cookie Banner Blocking

cookie-banner-blocker-header = Cookie 横幅拦截器
cookie-banner-blocker-description = 当某个站点在隐私浏览模式下询问是否可以使用 Cookie 时，{ -brand-short-name } 将自动为您拒绝该请求。仅在支持的站点上生效。
cookie-banner-learn-more = 了解更多
cookie-banner-blocker-checkbox-label =
    .label = 自动拒绝 Cookie 横幅

## Privacy Section - Content Blocking

content-blocking-enhanced-tracking-protection = 增强型跟踪保护

content-blocking-learn-more = 了解更多

content-blocking-fpi-incompatibility-warning = 您正在使用第一方隔离（FPI），该功能将覆盖 { -brand-short-name } 的某些 Cookie 设置。

# There is no need to translate "Resist Fingerprinting (RFP)". This is a
# feature that can only be enabled via about:config, and it's not exposed to
# standard users (e.g. via Settings).
content-blocking-rfp-incompatibility-warning = 您正在使用抵制指纹识别（RFP），该功能将替换 { -brand-short-name } 的某些指纹识别保护设置。这可能导致某些站点无法正常工作。

## These strings are used to define the different levels of
## Enhanced Tracking Protection.

# "Standard" in this case is an adjective, meaning "default" or "normal".
enhanced-tracking-protection-setting-standard =
  .label = 标准
  .accesskey = d
enhanced-tracking-protection-setting-strict =
  .label = 严格
  .accesskey = r
enhanced-tracking-protection-setting-custom =
  .label = 自定义
  .accesskey = C

##

content-blocking-etp-standard-desc = 在保护与性能之间取得平衡。页面将正常加载。
content-blocking-etp-strict-desc = 提供更强的保护，但可能导致某些站点或内容无法正常工作。
content-blocking-etp-custom-desc = 请选择要拦截的跟踪器和脚本。
content-blocking-etp-blocking-desc = { -brand-short-name } 将拦截以下内容：

content-blocking-private-windows = 隐私窗口中的跟踪内容
content-blocking-cross-site-cookies-in-all-windows2 = 所有窗口中的跨站点 Cookie
content-blocking-cross-site-tracking-cookies = 跨站点跟踪 Cookie
content-blocking-all-cross-site-cookies-private-windows = 隐私窗口中的跨站点 Cookie
content-blocking-isolate-cross-site-cookies = 隔离跨站点 Cookie
content-blocking-social-media-trackers = 社交媒体跟踪器
content-blocking-all-cookies = 所有 Cookie
content-blocking-unvisited-cookies = 来自未访问站点的 Cookie
content-blocking-all-windows-tracking-content = 所有窗口中的跟踪内容
content-blocking-all-cross-site-cookies = 所有跨站点 Cookie
content-blocking-cryptominers = 加密货币挖矿程序
content-blocking-fingerprinters = 指纹识别器
# The known fingerprinters are those that are known for collecting browser fingerprints from user devices. And
# the suspected fingerprinters are those that we are uncertain about browser fingerprinting activities. But they could
# possibly acquire browser fingerprints because of the behavior on accessing APIs that expose browser fingerprints.
content-blocking-known-and-suspected-fingerprinters = 已知和可疑的指纹识别器

# The tcp-rollout strings are no longer used for the rollout but for tcp-by-default in the standard section

# "Contains" here means "isolates", "limits".
content-blocking-etp-standard-tcp-rollout-description = 完全 Cookie 保护将 Cookie 隔离到您当前所在的站点，因此跟踪器无法利用这些 Cookie 在站点之间跟踪您的活动。
content-blocking-etp-standard-tcp-rollout-learn-more = 了解更多

content-blocking-etp-standard-tcp-title = 包含完全 Cookie 保护，这是我们有史以来最强大的隐私功能

content-blocking-warning-title-2 = 启用严格跟踪保护可能导致某些站点无法正常工作
content-blocking-warning-title-custom = 某些网站可能会因自定义跟踪保护而出现功能异常
# “Fix site issues” references the string content-blocking-exceptions-subheader
content-blocking-and-isolating-etp-warning-description-4 = { -brand-short-name } 建议您使用“修复网站问题”设置，以减少网站功能及内容的异常。若某网站似乎存在异常，请尝试对该网站关闭跟踪保护，以加载全部内容。
content-blocking-warning-learn-how = 了解操作方法

content-blocking-baseline-exceptions-3 =
    .label = 修复主要网站问题（推荐）
    .description = 通过仅解除对可能包含跟踪器的关键元素的阻止，帮助您加载网站及功能。涵盖大多数常见问题。

# This option to fix minor site issues must be used with the option to fix major site issues (string content-blocking-baseline-exceptions-3)
content-blocking-convenience-exceptions-3 =
    .label = 修复次要网站问题
    .description = 通过解除对可能包含跟踪器的元素的阻止，恢复文章中的视频或评论区域等内容。此操作可减少网站问题，但提供的保护程度较低。必须与主要问题修复功能配合使用。

content-blocking-baseline-uncheck-warning-dialog-title = 您确定要关闭修复功能吗？
content-blocking-baseline-uncheck-warning-dialog-body = 此设置有助于修复最常见的网站问题。若您将其关闭，某些网站可能无法正常运行，且 { -brand-short-name } 将无法协助您排除这些故障。
content-blocking-baseline-uncheck-warning-dialog-ok-button = 关闭修复功能
content-blocking-baseline-uncheck-warning-dialog-cancel-button = 保持修复功能开启

content-blocking-reload-description = 您需要重新加载您的选项卡，以便使这些更改生效。
content-blocking-reload-tabs-button =
  .label = 重新加载全部选项卡
  .accesskey = R

content-blocking-tracking-content-label =
  .label = 跟踪内容
  .accesskey = T
content-blocking-tracking-protection-option-all-windows =
  .label = 在所有窗口中
  .accesskey = A
content-blocking-option-private =
  .label = 仅在隐私窗口中
  .accesskey = p

content-blocking-cookies-label =
  .label = Cookie
  .accesskey = C

content-blocking-expand-section =
  .tooltiptext = 更多信息

# Cryptomining refers to using scripts on websites that can use a computer’s resources to mine cryptocurrency without a user’s knowledge.
content-blocking-cryptominers-label =
  .label = 加密挖矿程序
  .accesskey = y

# Browser fingerprinting is a method of tracking users by the configuration and settings information (their "digital fingerprint")
# that is visible to websites they browse, rather than traditional tracking methods such as IP addresses and unique cookies.
#
# The known fingerprinters are those that are known for collecting browser fingerprints from user devices.
content-blocking-known-fingerprinters-label =
  .label = 已知指纹识别器
  .accesskey = K

# The suspected fingerprinters are those that we are uncertain about browser fingerprinting activities. But they could
# possibly acquire browser fingerprints because of the behavior on accessing APIs that expose browser fingerprints.
content-blocking-suspected-fingerprinters-label =
  .label = 可疑指纹识别器
  .accesskey = S

## Privacy Section - Tracking

tracking-manage-exceptions =
    .label = 管理例外…
    .accesskey = x

## Privacy Section - Permissions

permissions-data-section =
    .heading = 权限和数据

pane-permissions-data-title2 = 权限和数据
  .title = 权限和数据

permissions-header3 =
    .label = 权限
    .description = 管理网站可以访问、控制或触发的内容。

permissions-location2 =
    .label = 位置

permissions-localhost2 =
    .label = 设备应用程序和服务

permissions-local-network2 =
    .label = 本地网络设备

permissions-xr2 =
    .label = 虚拟现实

permissions-camera2 =
    .label = 摄像头

permissions-microphone2 =
    .label = 麦克风

# Privacy permission for sound output devices.
permissions-speaker2 =
    .label = 扬声器

permissions-notification2 =
    .label = 通知

permissions-notification-pause =
    .label = 暂停通知，直至 { -brand-short-name } 重新启动
    .accesskey = n

permissions-autoplay2 =
    .label = 自动播放

permissions-block-popups2 =
    .label = 阻止弹出窗口和第三方重定向
    .accesskey = B

# "popup" is a misspelling that is more popular than the correct spelling of
# "pop-up" so it's included as a search keyword, not displayed in the UI.
permissions-block-popups-exceptions-button4 =
    .label = 管理例外
    .description = 添加可以打开弹出窗口并使用第三方重定向的网站。
    .accesskey = E
.searchkeywords = 弹出窗口

permissions-addon-install-warning3 =
    .label = 当网站尝试安装扩展程序时向您显示警告
    .accesskey = W

permissions-addon-exceptions2 =
    .label = 您可以选择哪些网站能够安装扩展程序
    .accesskey = E

## Privacy Section - Data Collection

# The search keyword isn't shown to users but is used to find relevant settings in about:preferences.
data-collection =
    .label = { -brand-short-name } 数据收集和使用
    .description = 我们致力于为您提供选择，并且仅收集为改进 { -brand-product-name } 所必需的最少数据。
    .searchkeywords = 遥测
data-collection-link = 查看隐私声明
data-collection-preferences-across-profiles =
    .message = 这些设置适用于此设备上的每一个 { -brand-product-name } 配置文件。
data-collection-profiles-link = 查看所有配置文件
data-collection-health-report-telemetry-disabled =
    .message = 您将不再允许 { -vendor-short-name } 捕获技术和交互数据。所有过往数据将在30天内被删除。
data-collection-health-report =
    .label = 向 { -vendor-short-name } 发送技术和交互数据
    .accesskey = r
    .description = 这有助于我们改进 { -brand-product-name } 的功能、性能和稳定性。
data-collection-health-report-disabled =
    .label = 向 { -vendor-short-name } 发送技术和交互数据
    .accesskey = r
    .description = 数据报告在此构建配置中已被禁用。
data-collection-run-studies =
    .label = 允许 { -brand-short-name } 运行功能研究
    .description = { -brand-short-name } 会随机选择用户来测试功能，这有助于为所有人提高质量。
data-collection-studies-link =
    .label = 查看 { -brand-short-name } 研究
data-collection-backlogged-crash-reports =
    .label = 自动发送崩溃报告
    .description = 这有助于 { -vendor-short-name } 诊断并修复浏览器的问题。报告可能包含个人或敏感数据。
    .accesskey = c
data-collection-usage-ping =
    .label = 向 { -vendor-short-name } 发送每日使用信号
    .description = 这有助于 { -vendor-short-name } 估计活跃用户数量。
    .accesskey = u

backup-multi-profile-warning-message =
    .message = 为确保此更改包含在您的备份中，请您打开每个配置文件，并在设置中选择“立即备份”。

nimbus-rollouts =
    .label = 允许 { -brand-short-name } 在更新之间改进功能、性能和稳定性
    .description = 更改将被远程部署。
addon-recommendations3 =
    .label = 允许个性化的扩展程序推荐
    .description = 获取扩展程序推荐以改善您的浏览体验。

# This message is displayed above disabled data sharing options in developer builds
# or builds with no Telemetry support available.
collection-health-report-disabled2 = 数据报告在此构建配置中已被禁用。

collection-backlogged-crash-reports2 =
    .label = 自动发送崩溃报告
    .accesskey = c
collection-backlogged-crash-reports-description = 这有助于 { -vendor-short-name } 诊断并修复浏览器的问题。报告可能包含个人或敏感数据。

# Promotional message displayed in the Settings panes to inform users of the new redesign
settings-redesign-promo =
    .heading = 相同的设置，全新的外观！
    .message = 我们重新组织了此页面，以便您更轻松地浏览和探索。您的个人设置未发生更改，所有内容仍在此处。提示：使用搜索可直接跳转到您所需的内容。
settings-redesign-promo-dismiss-button =
    .label = 已了解

privacy-segmentation-section-header = 增强您浏览体验的新功能

privacy-segmentation-section-description = 当我们提供使用您的数据以带来更个性化体验的功能时：

privacy-segmentation-radio-off =
    .label = 使用 { -brand-product-name } 推荐

privacy-segmentation-radio-on =
    .label = 显示详细信息

## Privacy Section - Security
##
## It is important that wording follows the guidelines outlined on this page:
## https://developers.google.com/safe-browsing/developers_guide_v2#AcceptableUsage

security-header = 安全

browsing-protection-group2 =
    .label = 欺骗性内容和危险软件防护
    .description = 危险的网站和下载可能会使您的数据和设备面临风险。{ -brand-short-name } 会自动阻止它们，并就风险或不需要的软件向您发出警告。

security-enable-safe-browsing =
    .label = 阻止危险和欺骗性内容
    .accesskey = B
security-enable-safe-browsing-link = 了解更多

security-safe-browsing-warning =
    .message = 关闭此选项会降低对诈骗、恶意网站和危险下载的防护。

security-block-downloads =
    .label = 阻止危险下载
    .accesskey = d

security-block-uncommon-software =
    .label = 就不需要和不常见的软件向您发出警告
    .accesskey = c

## Privacy Section - Certificates

certs-description3 =
    .label = 证书
    .description = 配置 { -brand-short-name } 用于验证安全连接的证书。

certs-view2 =
    .label = 管理证书
    .accesskey = C

certs-devices2 =
    .label = 管理安全设备
.accesskey = 单

certs-thirdparty-toggle =
    .label = 允许 { -brand-short-name } 自动信任您安装的第三方根证书
    .accesskey = 允

certs-devices-enable-fips = 启用 FIPS

space-alert-over-5gb-settings-button =
    .label = 打开设置
    .accesskey = 打

space-alert-over-5gb-message2 = <strong>{ -brand-short-name } 的磁盘空间不足。</strong>网站内容可能无法正常显示。您可以在设置 > 隐私与安全 > Cookie 和站点数据中清除存储的数据。

space-alert-under-5gb-message2 = <strong>{ -brand-short-name } 的磁盘空间不足。</strong>网站内容可能无法正常显示。请访问“了解更多”以优化您的磁盘使用，获得更佳浏览体验。

## Privacy Section - HTTPS-Only

httpsonly-group =
    .label = HTTPS-Only 模式
    .description = 仅允许与网站建立安全连接。{ -brand-short-name } 将在不安全连接前询问您。

httpsonly-label2 =
    .aria-label = { httpsonly-group.label }

httpsonly-learn-more2 = HTTPS-Only 模式的工作原理

httpsonly-radio-enabled =
    .label = 在所有窗口中启用 HTTPS-Only 模式

httpsonly-radio-enabled-pbm =
    .label = 仅在隐私窗口中启用 HTTPS-Only 模式

httpsonly-radio-disabled3 =
    .label = 不启用 HTTPS-Only 模式
    .description = { -brand-short-name } 仍可能升级某些连接

## DoH Section

preferences-doh-header = 基于 HTTPS 的 DNS
dns-over-https-group2 =
    .label = 基于 HTTPS 的 DNS
    .description = 基于 HTTPS 的域名系统（DoH）对站点查询进行加密，使得您的互联网服务提供商或其他人更难查看您即将访问的网站。

preferences-doh-description2 = 基于 HTTPS 的域名系统（DNS）通过加密连接发送您对域名的请求，提供安全的 DNS，使他人更难查看您即将访问的网站。

# Variables:
#   $status (string) - The status of the DoH connection
preferences-doh-status = 状态：{ $status }
# Variables:
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-resolver = 提供商：{ $name }
# This is displayed instead of $name in preferences-doh-resolver
# when the DoH URL is not a valid URL
preferences-doh-bad-url = 无效的 URL
preferences-doh-steering-status = 正在使用本地提供商

preferences-doh-status-active = 活动
preferences-doh-status-disabled = 关闭
# Variables:
#   $reason (string) - A string representation of the reason DoH is not active. For example NS_ERROR_UNKNOWN_HOST or TRR_RCODE_FAIL.
preferences-doh-status-not-active = 未活动（{ $reason }）

preferences-doh-group-message2 = 使用以下方式启用基于 HTTPS 的 DNS：

preferences-doh-expand-section =
  .tooltiptext = 更多信息

preferences-doh-setting-default =
  .label = 默认保护
  .accesskey = 默
preferences-doh-default-desc = { -brand-short-name } 决定何时使用安全 DNS 以保护您的隐私。
preferences-doh-default-detailed-desc-1 = 在可用区域使用安全 DNS
preferences-doh-default-detailed-desc-2 = 若安全 DNS 提供商出现问题，则使用您的默认 DNS 解析器
preferences-doh-default-detailed-desc-3 = 若可能，则使用本地提供商
preferences-doh-default-detailed-desc-4 = 当 VPN、家长控制或企业策略处于活动状态时关闭
preferences-doh-default-detailed-desc-5 = 当网络告知 { -brand-short-name } 不应使用安全 DNS 时关闭

preferences-doh-setting-enabled =
  .label = 增加保护
  .accesskey = 增
preferences-doh-enabled-desc = 您控制何时使用安全 DNS 并选择您的提供商。
preferences-doh-enabled-detailed-desc-1 = 使用您选择的提供商
preferences-doh-enabled-detailed-desc-2 = 仅在安全 DNS 出现问题时使用您的默认 DNS 解析器

preferences-doh-setting-strict =
  .label = 最大保护
  .accesskey = 最
preferences-doh-strict-desc = { -brand-short-name } 将始终使用安全 DNS。在我们使用您的系统 DNS 之前，您将看到安全风险警告。
preferences-doh-strict-detailed-desc-1 = 仅使用您选择的提供商
preferences-doh-strict-detailed-desc-2 = 若安全 DNS 不可用则始终发出警告
preferences-doh-strict-detailed-desc-3 = 若安全 DNS 不可用，网站将无法加载或正常运行

preferences-doh-setting-off =
  .label = 关闭
  .accesskey = 关
preferences-doh-off-desc = 使用您的默认 DNS 解析器

preferences-doh-select-resolver = 选择提供商：

preferences-doh-manage-exceptions =
    .label = 管理例外…
    .accesskey = 管

preferences-doh-overview-default =
    .label = 默认保护
    .description = 在可用区域使用安全 DNS。

preferences-doh-overview-custom =
    .label = 自定义
    .description = 始终使用安全 DNS，并控制您的提供商和回退行为。

preferences-doh-overview-off =
    .label = 关闭
    .description = 使用您的默认 DNS 解析器。

preferences-doh-advanced-button =
    .label = 高级设置

preferences-doh-advanced-section =
.label = 高级设置
.description = 基于 HTTPS 的域名系统（DoH）将对网站查询进行加密，从而使您的互联网服务提供商或其他方更难以查看您即将访问的网站内容。

preferences-doh-manage-exceptions2 =
    .label = 管理例外情况
    .accesskey = x

preferences-doh-radio-default =
    .label = 默认
    .description = 在可用区域中使用安全 DNS 服务

preferences-doh-radio-custom =
    .label = 自定义
    .description = 始终使用安全 DNS 服务，并保留您对提供商及回退行为的控制权

preferences-doh-radio-off =
    .label = 关闭
    .description = 使用您的默认 DNS 解析器

preferences-doh-fallback-label =
    .label = 在安全 DNS 服务不可用时始终向您发出警告

preferences-doh-status-item-off =
    .message = 基于 HTTPS 的 DNS 服务已关闭

# Variables:
#   $reason (string) - A string representation of the reason DoH is not active. For example NS_ERROR_UNKNOWN_HOST or TRR_RCODE_FAIL.
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-status-item-not-active =
    .message = 基于 HTTPS 的 DNS 服务当前无法工作，因为我们在尝试使用提供商 { $name } 时遇到了错误（{ $reason }）

# Variables:
#   $reason (string) - A string representation of the reason DoH is not active. For example NS_ERROR_UNKNOWN_HOST or TRR_RCODE_FAIL.
preferences-doh-status-item-not-active-bad-url =
    .message = 基于 HTTPS 的 DNS 服务当前无法工作，因为我们接收到了无效的 URL（{ $reason }）

# Variables:
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-status-item-active =
    .message = 基于 HTTPS 的 DNS 服务正在使用提供商 { $name }

# Variables:
#   $reason (string) - A string representation of the reason DoH is not active. For example NS_ERROR_UNKNOWN_HOST or TRR_RCODE_FAIL.
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-status-item-not-active-local =
    .message = 基于 HTTPS 的 DNS 服务当前无法工作，因为我们在尝试使用本地提供商 { $name } 时遇到了错误（{ $reason }）

# Variables:
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-status-item-active-local =
    .message = 基于 HTTPS 的 DNS 服务正在使用本地提供商 { $name }

preferences-doh-select-resolver-label =
    .label = 选择提供商：

# Variables:
#   $name (String) - Display name or URL for the DNS over HTTPS provider
connection-dns-over-https-url-item =
    .label = { $name }
    .tooltiptext = 使用此提供商进行基于 HTTPS 的 DNS 解析

preferences-doh-custom-provider-label =
    .aria-label = 输入自定义提供商 URL

preferences-doh-header2 =
  .heading = 基于 HTTPS 的 DNS 服务

## Connection and software security section

preferences-connection-header =
    .heading = 连接与软件安全性

preferences-connection-link-section =
    .label = 连接与软件安全性
    .description = 查看连接如何保持安全、有害软件如何被阻止，以及网站如何得到验证。

preferences-connection-link-button =
    .label = 高级设置

## The following strings are used in the Download section of settings

desktop-folder-name = 桌面
downloads-folder-name = 下载

## Appearance page

preferences-appearance-header =
    .heading = 外观

browser-theme-group =
    .label = 浏览器主题
    .description = 以您的方式为 { -brand-short-name } 设置样式。主题颜色将应用于工具栏、菜单和消息。

browser-theme-manage-link =
    .label = 管理 { -brand-short-name } 主题

related-settings-group =
    .label = 相关设置

related-settings-accessibility-link =
    .label = 在辅助功能中自定义缩放和字体设置

related-settings-home-link =
    .label = 自定义 { -firefox-home-brand-name }

related-settings-tabs-browsing-link =
    .label = 自定义浏览器布局

## Accessibility page

preferences-accessibility-header =
    .heading = 辅助功能

preferences-default-zoom-select =
    .aria-label = 默认缩放

preferences-fonts-family =
    .label = 字体族
.accesskey = D

preferences-fonts-size =
    .label = 字号
    .accesskey = s

preferences-fonts-advanced-settings =
    .label = 高级设置
    .accesskey = A

browsing-use-autoscroll =
    .label = 使用自动滚动
    .accesskey = a

keyboard-and-scrolling-group =
  .label = 键盘导航和滚动

motion-and-link-group =
  .label = 动态效果和链接样式

## AI controls page

preferences-ai-controls-header3 =
    .heading = AI 控制

preferences-ai-controls-description = 在 { -brand-short-name } 中，您始终拥有选择权，包括是否使用经 AI 增强的功能。更多控制选项即将推出。

preferences-ai-controls-block-ai-label = 阻止 AI 增强功能
preferences-ai-controls-block-ai =
    .label = { preferences-ai-controls-block-ai-label }
preferences-ai-controls-block-ai-description = 阻止意味着您将不会在 { -brand-short-name } 中看到新的或当前的 AI 增强功能，或关于它们的弹出窗口。<a data-l10n-name="link">获取更多详情</a>，了解包含的内容以及如何控制传统的机器学习功能，如搜索建议和推荐。

preferences-ai-controls-blocked-message =
    .message = 新的和当前的 AI 增强功能默认已被阻止。若要解除对特定功能的阻止，请使用以下控制选项。

preferences-ai-controls-on-device-group =
    .label = 设备端 AI
    .description = 这些功能使用小型 AI 模型，如果您使用该功能，模型将下载到您的设备。此方法有助于保护您的隐私。

preferences-ai-controls-translations-control =
    .label = 翻译
    .description = 以您偏好的语言无缝浏览网页。
preferences-ai-controls-translations-more-link = 更多翻译设置

preferences-ai-controls-pdfjs-control =
    .label = { -brand-short-name } PDF 查看器中的图像替代文本
    .description = 当您向 PDF 添加图像时，此功能会添加描述以使其可访问。

preferences-ai-controls-tab-group-suggestions-control =
    .label = 标签页组建议
    .description = 获取命名和组织您的标签页的建议。

preferences-ai-controls-key-points-control =
    .label = 链接预览中的关键点
    .description = 在打开链接之前查看快速摘要。

preferences-ai-controls-sidebar-chatbot-group =
    .label = 侧边栏中的 AI 聊天机器人提供商
    .description = 在浏览时保持聊天机器人可见。从 Anthropic Claude、ChatGPT、Copilot、Google Gemini 和 Le Chat Mistral 中进行选择。

preferences-ai-controls-sidebar-chatbot-control =
    .label = 侧边栏中的聊天机器人

# This option means that a user will see the feature and can use it.
preferences-ai-controls-state-available =
    .label = 可用
# This option means a user has opted in to use the feature.
preferences-ai-controls-state-enabled =
    .label = 已启用
# This option means the user won't see and can't use the feature. For on-device AI, any models already downloaded are removed.
preferences-ai-controls-state-blocked =
    .label = 已阻止

preferences-ai-controls-state-description-before = 各选项的含义：
preferences-ai-controls-state-description-available = <strong>可用：</strong> 您将看到该功能并可以使用它。
preferences-ai-controls-state-description-enabled = <strong>已启用：</strong> 您已选择使用该功能。
preferences-ai-controls-state-description-blocked = <strong>已阻止：</strong> 您将看不到也无法使用该功能。对于设备端 AI，任何已下载的模型都将被移除。

preferences-ai-controls-block-confirmation-heading = 要阻止 AI 增强功能吗？
preferences-ai-controls-block-confirmation-description = 您将不会在 { -brand-short-name } 中看到新的或当前的 AI 增强功能，或关于它们的弹出窗口。之后，您可以解除对任何您希望继续使用的功能的阻止。

preferences-ai-controls-block-confirmation-features-start = 将被阻止的内容：
preferences-ai-controls-block-confirmation-translations = 翻译
preferences-ai-controls-block-confirmation-pdfjs = { -brand-short-name } PDF 查看器中的图像替代文本
preferences-ai-controls-block-confirmation-tab-group-suggestions = 标签页组建议
preferences-ai-controls-block-confirmation-key-points = 链接预览中的关键点
preferences-ai-controls-block-confirmation-sidebar-chatbot = 侧边栏中的聊天机器人提供商
preferences-ai-controls-block-confirmation-features-after = 阻止还会影响使用由 { -brand-short-name } 提供的 AI 的扩展。

preferences-ai-controls-block-confirmation-cancel =
    .label = 取消
preferences-ai-controls-block-confirmation-confirm =
    .label = 阻止

## Privacy and security status card

security-privacy-status-ok-header = { -brand-short-name } 正在守护您的安全

# This is the header above a section telling the user about problems in their settings
security-privacy-status-problem-header = { -brand-short-name } 建议您进行一些安全改进
security-privacy-status-ok-label = 增强型跟踪保护已开启
security-privacy-status-problem-label = 我们发现了一些影响您保护措施的设置
security-privacy-status-problem-helper-label = 查看问题
security-privacy-status-pending-trackers-label = 正在查询 { -brand-short-name } 在过去一个月内阻止了多少跟踪器

# This label tells the user how many trackers we have blocked for them.
# Variables:
#   $trackerCount (Number) - Number of trackers we have blocked in the last month
security-privacy-status-trackers-label = { $trackerCount ->
      [one] 过去一个月内阻止了 { $trackerCount } 个跟踪器
      *[other] 过去一个月内阻止了 { $trackerCount } 个跟踪器
  }
# This string appears under "Enhanced Tracking Protection is on" when a user has enabled "Strict" in Enhanced Tracking Protection advanced settings
security-privacy-status-strict-enabled-label = 您已启用<a data-l10n-name="strict-tracking-protection">严格保护</a>
# This string appears under "Enhanced Tracking Protection is on" when a user has enabled "Custom" in Enhanced Tracking Protection advanced settings
security-privacy-status-custom-enabled-label = 您已启用<a data-l10n-name="custom-tracking-protection">自定义保护</a>
security-privacy-status-up-to-date-label = 您已拥有最新、最安全的 { -brand-short-name } 版本
security-privacy-status-update-needed-label = 有可用的新版本 { -brand-short-name }。
security-privacy-status-update-error-label = { -brand-short-name } 在更新自身时遇到问题
security-privacy-status-update-checking-label = { -brand-short-name } 正在检查更新
security-privacy-status-update-needed-description = 正在为您更新最新版本，以获得速度、稳定性及安全性方面的改进。

security-privacy-status-update-button-label =
  .label = 更新 { -brand-short-name }

security-privacy-image-warning =
  .alt = 一个带有感叹号的盾牌图标，表示存在安全警告，请您予以关注。

security-privacy-image-ok =
  .alt = 一个带有对勾的盾牌图标，表示您不存在未解决的安全问题。

security-privacy-issue-card =
  .heading = 安全警告

issue-card-reset-button =
  .label = 重置

issue-card-dismiss-button =
  .tooltiptext = 忽略
  .aria-label = 忽略

## Enhanced Tracking Protection (ETP) status section

preferences-etp-status-header =
    .label = 增强型跟踪保护
    .description = 网站会使用跟踪器在线跟踪您的活动并展示令人不适的广告。{ -brand-short-name } 会在您浏览时为您提供保护，自动阻止跟踪器，使您能够掌控您的数字足迹。

preferences-etp-level-standard =
    .label = 标准（默认）
    .description = 强大且可靠的保护，可流畅兼容大多数网站。

preferences-etp-level-strict =
    .label = 严格
    .description = 更强的保护可阻止更多跟踪器，但可能导致某些网站无法正常工作。

preferences-etp-level-custom =
    .label = 自定义
    .description = 请选择要启用或禁用的保护功能。

preferences-etp-status-advanced-button =
    .label = 高级设置

preferences-etp-status-protections-dashboard-link =
        .label = 查看您的个性化保护仪表板
        .description = 查看 { -brand-short-name } 为您阻止了多少隐蔽的跟踪器，包括社交媒体跟踪器、指纹识别器和加密货币挖矿脚本。

preferences-etp-header =
    .heading = 增强型跟踪保护

preferences-etp-advanced-settings-group =
    .label = 高级设置
    .description = 网站会使用跟踪器在线跟踪您的活动并展示令人不适的广告。{ -brand-short-name } 会在您浏览时为您提供保护，自动阻止大多数跟踪器，使您能够掌控您的数字足迹。

preferences-etp-customize-button =
    .label = 自定义跟踪保护

preferences-etp-reload-tabs-hint =
    .message = 请重新加载您的标签页，以便使这些更改生效。
preferences-etp-reload-tabs-hint-button =
  .label = 重新加载所有标签页

preferences-etp-rfp-warning-message =
    .message = 您正在使用“抵抗指纹识别”(RFP) 功能，该功能会替换 { -brand-short-name } 的部分指纹识别保护设置。这可能会导致某些网站无法正常工作。

preferences-etp-level-warning-message =
    .heading = 头抬起！某些网站可能无法按预期工作。
    .message = 某些网站将跟踪器构建在其功能或内容中。当 { -brand-short-name } 阻止这些跟踪器时，网站看起来会损坏。请尝试使用“修复站点问题”或在该网站关闭跟踪保护。

preferences-etp-manage-exceptions-button =
    .label = 管理例外
    .description = 管理已禁用增强型跟踪保护的网站。

preferences-etp-customize-header =
    .heading = 自定义跟踪保护

preferences-etp-reset =
    .label = 重置自定义设置
    .description = 将设置恢复为预设的保护级别。

preferences-etp-reset-standard-button =
    .label = 重置为标准模式

preferences-etp-reset-strict-button =
    .label = 重置为严格模式

preferences-etp-custom-control-group =
    .label = 跟踪保护
    .description = 请选择要启用或禁用的保护功能。

preferences-etp-custom-cookies-enabled =
    .label = Cookie

preferences-etp-custom-cookie-behavior =
    .aria-label = Cookie

preferences-etp-custom-cookie-behavior-accept-all =
    .label = 允许所有 Cookie
preferences-etp-custom-cookie-behavior-block-cross-site-cookies =
    .label = 阻止跨站点 Cookie
preferences-etp-custom-cookie-behavior-isolate-cross-site-cookies =
    .label = 隔离跨站点 Cookie
preferences-etp-custom-cookie-behavior-block-unvisited =
    .label = 阻止来自未访问网站的 Cookie
preferences-etp-custom-cookie-behavior-block-all-cross-site-cookies =
    .label = 阻止所有跨站点 Cookie（可能导致网站无法正常工作）
preferences-etp-custom-cookie-behavior-block-all =
    .label = 阻止所有 Cookie（将导致网站无法正常工作）

preferences-etp-custom-tracking-protection-enabled =
    .label = 跟踪内容

preferences-etp-custom-tracking-protection-enabled-context =
    .aria-label = 跟踪内容

preferences-etp-custom-crypto-mining-protection-enabled =
    .label = 加密货币挖矿脚本

preferences-etp-custom-known-fingerprinting-protection-enabled =
    .label = 已知指纹识别器

preferences-etp-custom-suspect-fingerprinting-protection-enabled =
    .label = 可疑指纹识别器

preferences-etp-custom-suspect-fingerprinting-protection-enabled-context =
.aria-label = 疑似指纹识别器

## Warnings section

security-privacy-issue-warning-fingerprinters =
  .label = 已知的指纹识别器未被阻止
  .description = 这可能会允许一些跟踪器在无 Cookie 的情况下跟踪您的活动。

security-privacy-issue-warning-third-party-cookies =
  .label = 第三方 Cookie 已启用
  .description = 第三方 Cookie 被用于跨网站跟踪您的活动。

security-privacy-issue-warning-password-manager =
  .label = 密码管理器已被禁用
  .description = 密码管理器可帮助您为您的账户存储强密码。

security-privacy-issue-warning-popup-blocker =
  .label = 弹出窗口阻止程序已被禁用
  .description = 弹出窗口具有干扰性并可能存在潜在危害。

security-privacy-issue-warning-extension-install =
  .label = 网站可以安装扩展程序
  .description = 网站可以在未经询问的情况下向 { -brand-short-name } 安装扩展程序。

security-privacy-issue-warning-safe-browsing =
  .label = 危险和欺骗性内容未被阻止
  .description = 您暴露于来自网站的诈骗和恶意软件的风险已增加。

security-privacy-issue-warning-doh =
  .label = DNS over HTTPS 已被禁用
  .description = DNS over HTTPS 可隐藏您访问的网站，防止您的网络提供商窥探。

security-privacy-issue-warning-ech =
  .label = 加密的客户端问候已被禁用
  .description = 加密的客户端问候可隐藏您访问的网站，防止您的网络提供商窥探。

security-privacy-issue-warning-proxy-autodetection =
  .label = 代理自动配置已启用
  .description = 代理自动配置可能允许不受信任的网络监控您的活动。


session-restore-learn-more = 如果此项不生效，该怎么办？

## Vantage preferences

# Sidebar
pane-librewolf-title = Vantage
category-librewolf =
    .tooltiptext = about:config 更改，按逻辑分组且易于访问

# Main content
# About Vantage
vantage-about-heading = 关于 Vantage
vantage-about-version = 版本 { $version }
vantage-about-update-checking = 正在检查更新...
vantage-about-update-available = 新版本可用 — 请访问官方网站进行下载
vantage-about-up-to-date = 您已是最新版本

vantage-update-heading = 更新
vantage-update-checkbox =
    .label = 自动检查更新
vantage-theme-checkbox =
    .label = 启用 Vantage 主题（需要重新启动浏览器）
vantage-theme-description = 将 Vantage 主题写入您的配置文件，添加圆角工具栏和标签页以获得现代外观。需要重新启动浏览器方可生效。请注意：某些第三方主题可能覆盖这些视觉样式 — 这仅影响外观，不影响浏览器功能。

vantage-update-description = 在启动时检查 Vantage 的新版本。当新版本可用时，您将收到通知，但不会自动安装更新。

vantage-ai-heading = AI 侧边栏
vantage-ai-checkbox =
    .label = 启用 AI 侧边栏
vantage-ai-description = 在侧边栏中打开 AI 聊天机器人。支持 DeepSeek、Qwen、Doubao、ChatGPT、Gemini 和 Claude。您的对话将直接发送给提供商 — Vantage 不会收集或处理任何数据。

librewolf-header = Vantage 偏好设置
librewolf-warning-title = 头抬起！
librewolf-warning-description = 我们精心选择默认设置，以专注于隐私和安全。更改这些设置时，请阅读描述以了解这些更改的影响。

# Page Layout
librewolf-general-heading = 浏览器行为
librewolf-extension-update-checkbox =
    .label = 自动更新附加组件
librewolf-sync-checkbox =
    .label = 启用 Firefox 同步
librewolf-autocopy-checkbox =
    .label = 启用中键粘贴
librewolf-styling-checkbox = 
    .label = 允许 userChrome.css 自定义

librewolf-network-heading = 网络
librewolf-ipv6-checkbox =
    .label = 启用 IPv6

librewolf-privacy-heading = 隐私
librewolf-webrtc-ip-checkbox =
    .label = 限制 WebRTC 本地 IP 暴露
librewolf-webrtc-ip-description = 将 WebRTC 限制为仅使用默认网络接口，防止本地 IP 地址泄露。
librewolf-font-vis-checkbox =
    .label = 限制字体可见性
librewolf-font-vis-description = 仅向网站暴露基础系统字体，防止字体指纹识别。不影响页面上字体的渲染方式。

librewolf-xorigin-ref-checkbox =
    .label = 限制跨源引用

librewolf-broken-heading = 指纹识别
librewolf-webgl-checkbox =
    .label = 启用 WebGL
librewolf-rfp-checkbox =
    .label = 启用抗指纹识别
librewolf-letterboxing-checkbox =
    .label = 启用信箱模式

librewolf-security-heading = 安全
librewolf-goog-safe-checkbox =
    .label = 启用 Google 安全浏览
librewolf-goog-safe-download-checkbox =
    .label = 扫描下载

# In-depth descriptions
librewolf-extension-update-description = 无需手动干预即可保持扩展程序更新。这是对您的安全有利的选择。
librewolf-extension-update-warning1 = 如果您在每次更新前未审查扩展程序的代码，则应启用此选项。
librewolf-ipv6-description = 允许 { -brand-short-name } 使用 IPv6 进行连接。
librewolf-ipv6-warning1 = 与其在浏览器中阻止 IPv6，我们建议您启用您操作系统中的 IPv6 隐私扩展。
librewolf-sync-description = 将您的数据与其他浏览器进行同步。需要重新启动。
librewolf-sync-warning1 = Firefox Sync 在将数据传输到服务器之前，会在本地对数据进行加密。

librewolf-autocopy-description = 您可选择一些文本以复制它，然后通过单击鼠标中键进行粘贴。

librewolf-download-tmp-checkbox =
    .label = 将下载内容保存至临时目录
librewolf-download-tmp-description = 启用时：下载的文件将被保存至系统临时目录，并在浏览器关闭时自动清理，以防止数据痕迹残留。
librewolf-download-tmp-warning1 = 禁用时：文件将被直接保存至您的下载文件夹，以便于访问。请注意，下载的文件即使在删除后仍可能留下可恢复的痕迹。

librewolf-tabs-heading = 选项卡行为
librewolf-tabs-scroll-checkbox =
    .label = 滚动以切换选项卡
librewolf-tabs-dblclick-checkbox =
    .label = 双击以关闭选项卡
librewolf-tabs-urlbar-checkbox =
    .label = 在新选项卡中启动地址栏
librewolf-tabs-bookmarks-checkbox =
    .label = 在新选项卡中启动书签
librewolf-tabs-search-checkbox =
    .label = 在新选项卡中启动搜索
librewolf-tabs-ctrlTab-checkbox =
    .label = Ctrl+Tab 按最近使用顺序

librewolf-styling-description = 启用时：您可通过 userChrome.css 文件自定义浏览器外观（工具栏、选项卡等）。此功能适用于希望实现个性化外观的高级用户。
librewolf-styling-warning1 = 禁用时：将使用默认的浏览器外观。仅应从可信来源加载 CSS 主题——恶意样式表可能捕获您的输入信息。

librewolf-xorigin-ref-description = 启用时：仅在相同网站内进行导航时发送来源页面信息。外部站点将不会得知您来自哪个页面。
librewolf-xorigin-ref-warning1 = 禁用时：所有网站均可看到您来自哪个页面。某些需要来源验证的网站在此功能启用时可能出现异常。

librewolf-webgl-description = 启用时：网站可使用 WebGL 进行三维图形渲染，但此功能也可能被用于识别您的设备（指纹识别）。
librewolf-webgl-warning1 = 禁用时：隐私性更佳，但使用 WebGL 的网站（三维地图、浏览器游戏）可能无法正常运作。

librewolf-rfp-description = 启用时：隐藏浏览器特征（屏幕分辨率、时区、字体、语言等），使您看起来与其他用户完全相同。可大幅提升隐私性。
librewolf-rfp-warning1 = 禁用时：您的浏览器特征将完全暴露，使您易于被追踪。某些网站的正常运作依赖这些特征。

librewolf-letterboxing-description = 启用时：窗口大小将被舍入为标准值，以防止网站通过您的窗口尺寸进行追踪。屏幕两侧可能出现黑色条带。
librewolf-letterboxing-warning1 = 禁用时：网站可使用您的窗口大小来协助识别您的身份。需先启用 ResistFingerprinting 功能。

librewolf-goog-safe-description = 如果您担心恶意软件和网络钓鱼，建议您考虑启用此功能。
librewolf-goog-safe-warning1 = 出于审查方面的考量，此功能已被禁用，但建议不太高级的用户启用。所有检查均在本地执行。

librewolf-goog-safe-download-description = 允许安全浏览功能扫描您的下载内容，以识别可疑文件。
librewolf-goog-safe-download-warning1 = 所有检查均在本地执行。

librewolf-signatures-checkbox =
    .label = 要求附加组件已签名
librewolf-signatures-description = 启用时：仅可安装由 Mozilla 签名的附加组件，以保护您免受潜在恶意扩展的侵害。
librewolf-signatures-warning1 = 禁用时：可安装未签名的附加组件，此功能对正在测试自身扩展的开发者而言十分有用。对于来源不明的附加组件，请您务必谨慎行事。

librewolf-pdfjs-scripting-checkbox =
    .label = 允许 PDF 查看器中执行 JavaScript
librewolf-pdfjs-scripting-description = 启用时：PDF 文件可执行 JavaScript，从而实现交互式表单和动态内容。某些 PDF 表单的正常运作需要此功能。
librewolf-pdfjs-scripting-warning1 = 禁用时：PDF 文件中的 JavaScript 执行将被阻止，以保护您免受基于 PDF 的攻击。大多数 PDF 文档仍可正常显示。

# Footer
librewolf-footer = 实用链接
librewolf-config-link = 所有高级设置（about:config）
librewolf-open-profile = 故障排除信息（about:support）

librewolf-debug = 调试附加组件
vantage-privacy-dashboard-link = 隐私仪表板

content-blocking-section-top-level-description = Vantage 默认支持并启用增强型跟踪保护（严格模式）。这是浏览器中最重要的设置之一，因为它提供了状态分区、严格阻止列表以及其他细致的隐私功能。我们不建议您更改为其他模式。

vantage-nova-checkbox =
    .label = 启用 Nova 界面
vantage-nova-description = Nova 是新的 Firefox 153 外观（圆角选项卡、浮动工具栏）。启用时，Vantage 主题将切换为其 Nova 适配配色（蓝绿渐变标题栏）。此更改将立即生效。

# Profile backup & restore
vantage-backup-heading = 配置文件备份与还原
vantage-backup-description = 将您的配置文件（书签、历史记录、扩展、设置）导出为 ZIP 压缩包，或从备份中还原。还原操作将覆盖当前配置并重新启动浏览器。
vantage-backup-export-button = 导出备份…
vantage-backup-export-title = 导出配置文件备份
vantage-backup-export-success = 配置文件已成功导出。
vantage-backup-export-fail = 导出失败：{ $error }
vantage-backup-import-button = 从备份还原…
vantage-backup-import-title = 从备份还原配置文件
vantage-backup-import-invalid = 所选文件不是有效的 Vantage 配置文件备份。
vantage-backup-import-invalid-path = 备份包含非法路径，已被拒绝。
vantage-backup-import-confirm-title = 还原配置文件
vantage-backup-import-confirm = 此操作将覆盖您当前的配置（书签、历史记录、设置、扩展）并重新启动浏览器。系统将自动创建您当前配置文件的备份。您是否要继续？
vantage-backup-import-backup-fail = 自动备份当前配置文件失败：{ $error }
vantage-backup-import-locked = 某些文件被锁定，无法替换（{ $files }...）。请您关闭浏览器并再次进行还原。您之前的配置文件备份是安全的。
vantage-backup-import-done = 配置文件已还原。浏览器将立即重新启动。

vantage-backup-export-confirm-title = 导出配置文件备份
vantage-backup-export-confirm = 备份将包含敏感数据：Cookie（网站登录会话）、浏览历史记录、已保存的表单数据及网站数据。为保障您的安全，登录密码已被排除在外。请您妥善保管备份文件，切勿将其共享。您是否要继续？
