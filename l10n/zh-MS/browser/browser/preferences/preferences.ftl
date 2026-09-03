# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

do-not-track-removal2 =
    .label = 我们无比较久支持那“做不跟踪”信号

global-privacy-control-description =
    .label = 告诉网站（全球资讯网的主机站）不到卖或部分我的论据
    .accesskey = s

non-technical-privacy-group =
    .label = 网站（全球资讯网的主机站）隐私首选项

do-not-track-removal3 =
    .message = 我们无比较久支持那“做不跟踪”特性.

non-technical-privacy-heading =
    .label = 附加的保护

preferences-privacy-relay-available =
    .label = 提议 { -relay-brand-name } 电子信函屏蔽
    .description = 隐藏你的实数电子信函地址到防卫你的入站从罐头猪肉.


# Do not translate.
# "Global Privacy Control" or "GPC" are a web platform feature name and abbreviation
# included to facilitate power-user search of the about:preferences page.
global-privacy-control-search = 共用隐私 Control (GPC)

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
    .style = 宽度: 15.4媒体用毕符
    .placeholder = 发现在设置

managed-notice = 你的浏览器是存在与中央化计划及管制有关的由你的组织.
managed-notice-info-icon =
    .alt = 信息

managed-notice-nav =
    .label = 你的浏览器是存在与中央化计划及管制有关的由你的组织.

category-list =
    .aria-label = 分类

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

pane-sync-title3 = 同步的

pane-ai-controls-title2 = AI 控制
  .title = AI 控制

pane-about-firefox-title = 关于 { -brand-short-name }
  .title = { pane-about-firefox-title }

pane-appearance-title = 外观
  .title = { pane-appearance-title }

pane-downloads-title2 = 下载
  .title = 下载

pane-downloads3 =
    .heading = 下载

pane-accessibility-title = 易接近
  .title = { pane-accessibility-title }

pane-languages-title2 = 语言
  .title = 语言

preferences-languages-header3 =
    .heading = 语言

settings-pane-labs-title2 = { -firefoxlabs-brand-name }
  .title = { -firefoxlabs-brand-name }

settings-pane-labs-header =
    .heading = { -firefoxlabs-brand-name }
pane-experimental-description4 = 弹性我们的实验的特性一个尝试! 他们是在发展和展开的, 哪个能够挤入如何 { -brand-short-name } 工作. 我们仅接收论据关于你的使用的这些特性如果你有 <a data-l10n-name="data-collection">技术上的和交互作用论据</a> 变质的在.

pane-experimental-reset =
  .label = 回复默认
  .accesskey = R

help-button-label2 = { -brand-short-name } 支持
  .title = { -brand-short-name } 支持
addons-button-label2 = 扩展名和主题
  .title = 扩展名和主题

focus-search =
    .key = f

close-button =
    .aria-label = 关闭

## Browser Restart Dialog

feature-enable-requires-restart = { -brand-short-name } 必须重新启动到启用这特性.
feature-disable-requires-restart = { -brand-short-name } 必须重新启动到禁用这特性.
should-restart-title = 重新启动 { -brand-short-name }
should-restart-ok = 重新启动 { -brand-short-name } 现在
cancel-no-restart-button = 取消
restart-later = 重新启动以后

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
extension-controlling-password-saving = <img data-l10n-name="icon"/> <strong>{ $name }</strong> 控制这设置.

# This string is shown to notify the user that their notifications permission
# is being controlled by an extension.
extension-controlling-web-notifications = <img data-l10n-name="icon"/> <strong>{ $name }</strong> 控制这设置.

# This string is shown to notify the user that Container Tabs
# are being enabled by an extension.
extension-controlling-privacy-containers = <img data-l10n-name="icon"/> <strong>{ $name }</strong> 需要容器标签页.

# This string is shown to notify the user that their content blocking "All Detected Trackers"
# preferences are being controlled by an extension.
extension-controlling-websites-content-blocking-all-trackers = <img data-l10n-name="icon"/> <strong>{ $name }</strong> 控制这设置.

# This string is shown to notify the user that their proxy configuration preferences
# are being controlled by an extension.
extension-controlling-proxy-config = <img data-l10n-name ="icon"/> <strong>{ $name }</strong> 控制如何 { -brand-short-name } 连接到那因特网.

# This string is shown after the user disables an extension to notify the user
# how to enable an extension that they disabled.
#
# <img data-l10n-name="addons-icon"/> will be replaced with Add-ons icon
# <img data-l10n-name="menu-icon"/> will be replaced with Menu icon
extension-controlled-enable = 到启用那扩展名去到 <img data-l10n-name="addons-icon"/> 添加-ons 在那 <img data-l10n-name="menu-icon"/> 菜单.

extension-controlled-enable-2 = 到赖斯编码-enable 这扩展名拜访 <a data-l10n-name="addons-link">扩展名和主题</a>.
# This string is shown to notify the user that their home page or new tab preferences
# are being controlled by an extension.
extension-controlling-homepage = { $name } 控制一些的你的主页设置.

## Preferences UI Search Results

search-results-header = 搜索结果

# `<span data-l10n-name="query"></span>` will be replaced by the search term.
search-results-empty-message2 =
        难过的! 那里是无结果在设置为了“<span data-l10n-name="query"></span>”.

search-results-help-link = 需要帮忙? 拜访 <a data-l10n-name="url">{ -brand-short-name } 支持</a>

## General Section

startup-group =
    .label = 启动

always-check-default =
    .label = 总是复选如果 { -brand-short-name } 是你的默认浏览器
    .accesskey = y

startup-restore-windows-and-tabs =
    .label = 打开早先的窗和标签页
    .accesskey = s
startup-windows-launch-on-login-profile-disabled =
    .message = 启用这首选项由检查的“{ profile-manager-use-selected.label }”在那“选取用户提问档”窗口.

windows-launch-on-login =
    .label = 打开 { -brand-short-name } 自动地何时你的计算机启动向上的
    .accesskey = O
windows-launch-on-login-disabled = 这首选项有是禁用在窗. 到更改, 拜访 <a data-l10n-name="startup-link">启动应用</a> 在系统设置.

# Option to also opens a new tab, in addition to restoring previous tabs and windows
windows-launch-on-login-open-new-tab =
    .label = 也打开一个新的标签页
    .accesskey = n

disable-extension =
    .label = 禁用扩展名

preferences-data-migration-group =
    .label = 引入浏览器论据
    .description = 带来你的书签, 密码, 历史记录, 扩展名, 和自动填充论据从另外的浏览器.
preferences-data-migration-button =
    .label = 引入论据
    .accesskey = m

preferences-profiles-group-header =
    .heading = 提问档
preferences-profiles-subpane-description =
    .description = 每个提问档有独立件浏览论据和设置, 包含历史记录, 密码, 和更多.
preferences-profiles-section-header =
    .label = 提问档
    .description = 每个提问档有独立件浏览论据和设置, 包含历史记录, 密码, 和更多.
preferences-manage-profiles-button =
  .label = 管理提问档
preferences-profiles-settings-button =
  .label = 设置
# This string labels the entire copy profile section in the profiles sub-pane.
preferences-copy-profile-header =
    .label = 复制一个现成的提问档
    .description = 那新的提问档将复制你的设置, 添加-奥运信息服务, 历史记录, 和保存论据相似的书签和密码—除了不你的帐户或同步的信息.
# This string sits next to the copy controls, both the copy-profile-select
# drop-down and the copy-profile-button, so that the user understands they
# need to first pick a profile to copy, and then click the copy button.
preferences-profile-to-copy =
  .label = 提问档到复制
# This string is a placeholder that will be shown in a drop-down list of
# profiles. The user will select a profile, then click the copy button
# to make a copy of that profile.
preferences-copy-profile-select = 选择提问档
preferences-copy-profile-button = 复制

tabs-browsing-section =
  .heading = 标签页和浏览

pane-tabs-browsing-title2 = 标签页和浏览
  .title = 标签页和浏览

tabs-group-header2 =
  .label = 标签页

tabs-opening-heading =
  .label = 打开

tabs-interaction-heading =
  .label = 交互作用

tabs-containers-heading =
  .label = 容器

tabs-closing-heading =
  .label = 关闭

ctrl-tab-recently-used-order =
    .label = Ctrl+Tab cycles through tabs in recently used order
    .accesskey = T

open-new-link-as-tabs =
    .label = 打开连接在标签页作为替代的新的窗
    .accesskey = w

open-external-link-next-to-active-tab =
    .label = 打开连接从应用近邻干扰到你的主动语态标签页

ask-on-close-multiple-tabs =
    .label = 询问在...之前关闭倍数标签页
    .accesskey = m

# This string is used for the confirm before quitting preference.
# Variables:
#   $quitKey (string) - the quit keyboard shortcut, and formatted
#                       in the same manner as it would appear,
#                       for example, in the File menu.
ask-on-quit-with-key =
    .label = 询问在...之前书面收据与 { $quitKey }
    .accesskey = b

warn-on-open-many-tabs =
    .label = 警告你何时打开倍数标签页可能 (使)慢下来向下 { -brand-short-name }
    .accesskey = d

switch-to-new-tabs-2 =
    .label = 何时打开连接或媒质在一个新的标签页, 开关到它直接地
    .accesskey = h

show-tabs-in-taskbar =
    .label = 显示标签页预览在那窗任务栏
    .accesskey = k

browser-containers-enabled-2 =
    .label = 使用容器标签页
    .accesskey = n

browser-containers-learn-more = 学习更多

browser-containers-settings-2 =
    .label = 管理设置
    .accesskey = i

containers-disable-alert-title = 关闭所有的容器标签页?

## Variables:
##   $tabCount (number) - Number of tabs

containers-disable-alert-desc =
    { $tabCount ->
        [one] 如果你禁用容器标签页现在, { $tabCount } 容器标签页将是关闭. 你确定你想要到禁用容器标签页?
       *[other] 如果你禁用容器标签页现在, { $tabCount } 容器标签页将是关闭. 你确定你想要到禁用容器标签页?
    }

containers-disable-alert-ok-button =
    { $tabCount ->
        [one] 关闭 { $tabCount } 容器 Tab
       *[other] 关闭 { $tabCount } 容器标签页
    }

##

containers-disable-alert-cancel-button = 保持启用

containers-remove-alert-title = 移除这容器?

# Variables:
#   $count (number) - Number of tabs that will be closed.
containers-remove-alert-msg =
    { $count ->
        [one] 如果你移除这容器现在, { $count } 容器标签页将是关闭. 你确定你想要到移除这容器?
       *[other] 如果你移除这容器现在, { $count } 容器标签页将是关闭. 你确定你想要到移除这容器?
    }

containers-remove-ok-button = 移除这容器
containers-remove-cancel-button = 不要移除这容器

settings-tabs-show-image-in-preview =
    .label = 显示一个图象预览何时你盘旋在一个标签页
    .accessKey = h

settings-tabs-drag-to-create-tab-groups =
    .label = 拖动标签页一起到创建标签页创建组

browser-layout-header2 =
    .label = 浏览器页面布局

browser-layout-horizontal-tabs2 =
    .label = 水平标签页
    .title = 标签页在那 TOP协议
    .description = 标签页在那 TOP协议

browser-layout-vertical-tabs2 =
    .label = 垂直的标签页
    .title = 标签页在那旁边, 在那其他选项
    .description = 标签页在那旁边, 在那其他选项

browser-layout-show-sidebar2 =
    .label = 显示其他选项
    .description = 很快地访问书签, 标签页从你的电话, AI chatbots, 和更多没有离开你的主群组查看.

page-navigation-group =
    .label = 页航行

## General Section - Language & Appearance

language-and-appearance-header = 语言和外观

appearance-group2 =
  .label = 网站（全球资讯网的主机站）外观
  .description = 一些网站（全球资讯网的主机站）更改他们的颜色到比较你的首选项. 选取你的颜色方案.

preferences-web-appearance-choice-auto3 =
  .label = 系统
  .title = 自动地更改网站（全球资讯网的主机站）背景和内容立基于在你的系统设置和 { -brand-short-name } 主题.
preferences-web-appearance-choice-light2 =
  .label = 光
  .title = 使用一个光外观为了网站（全球资讯网的主机站）背景和内容.
preferences-web-appearance-choice-dark2 =
  .label = 黑暗
  .title = 使用一个黑暗外观为了网站（全球资讯网的主机站）背景和内容.

web-appearance-group =
  .aria-label = 网站（全球资讯网的主机站）外观

# This can appear when using windows HCM or "Override colors: always" without
# system colors.
preferences-web-appearance-override-warning3 =
    .message = 你的反差控制设置是重迭网站（全球资讯网的主机站）外观.

preferences-web-appearance-link =
    .label = 管理 { -brand-short-name } 主题在扩展名 & 主题

preferences-contrast-control-group =
    .label = 网站（全球资讯网的主机站）反差
    .description = 网站（全球资讯网的主机站）使用一个多样的前景和背景颜色. 为了一致的反差, 你能使用那相同的颜色越过网站（全球资讯网的主机站）.
preferences-contrast-control-radio-group =
    .label = 推翻颜色

preferences-contrast-control-use-platform-settings =
    .label = 自动手枪 (使用系统设置)
    .accesskey = A

preferences-contrast-control-off =
    .label = 关闭
    .accesskey = O

preferences-contrast-control-custom =
    .label = 定制
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
    .label = 缩放电文仅
    .accesskey = t

preferences-text-zoom-override-warning2 =
    .message = 如果“缩放电文仅”是在和你的默认缩放不是 100%, 一些位置可能不显示器内容对.

language-header = 语言

choose-language-description = 选取你的首选的语言为了展出页

website-language-heading =
  .label = 网站（全球资讯网的主机站）语言
  .description = 一些网页是显示的在倍数语言. 选取语言在你的首选的顺序.

website-preferred-language =
  .label = 首选的语言

website-add-language =
  .label = 添加语言

website-add-language-button =
  .aria-label = 添加被选的语言
  .title = 添加被选的语言

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
    .label = 选取…
    .accesskey = o

choose-browser-language-description = 选取那语言使用到显示器菜单, 报文, 和通知从 { -brand-short-name }.
manage-browser-languages-button =
  .label = 日落选择对象…
  .accesskey = l
confirm-browser-language-change-description = 重新启动 { -brand-short-name } 以应用这些更改
confirm-browser-language-change-button = 应用和重新启动

browser-language-heading =
  .label = 浏览器语言
  .description = 选取那语言使用到显示器菜单, 报文, 和通知从 { -brand-short-name }.
browser-language-preferred-label =
  .label = 首选的语言
browser-language-fallback-label =
  .label = 撤退语言
  .description = 使用何时首选的语言局限是不完全的.
browser-language-install-error =
  .message = { -brand-short-name } 不能更新你的语言右现在. 复选那你是连接的到那因特网或尝试再一次.

fx-translate-web-pages = { -translations-brand-name }

translate-exceptions =
    .label = 例外…
    .accesskey = x

settings-translations-header =
    .label = 转换
    .aria-label = 转换
    .description = 转换页或被选的电文. 到防卫你的隐私, 转换停留在你的装置.

settings-translations-offer-to-translate-label =
    .label = 给予(物) 完整页转换

settings-translations-more-settings-button =
    .label = 更多转换设置
    .description = 日落首选项为了语言, 网站（全球资讯网的主机站）, 和挂线转换.

settings-translations-subpage-header =
    .heading = 更多转换设置

settings-translations-subpage-speed-up-translation-header =
    .label = 中央处理机速度设置程序向上的转换
    .description = 下载完全的语言为了加快转换和到转换挂线.

settings-translations-subpage-automatic-translation-header =
    .label = 自动手枪转换

settings-translations-subpage-always-translate-header =
    .label = 总是转换这些语言

settings-translations-subpage-never-translate-header =
    .label = 从不转换这些语言

settings-translations-subpage-never-translate-sites-header =
    .label = 从不转换这些位置

# The icon placeholders show the translations button and the settings gear in the urlbar panel.
settings-translations-subpage-never-translate-sites-description =
    到添加一个位置, 打开那 <img data-l10n-name="translations-icon"/> 转换嵌板, 选择 <img data-l10n-name="settings-icon"/> 转换设置, 然后选取“从不转换此站点”

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
    .label = 无语言将（程序

settings-translations-subpage-no-languages-added =
    .label = 无语言额外的

settings-translations-subpage-download-progress = 下载在进步…

# Variables:
#   $language (string) - The localized display name of the language.
#   $size (string) - The download size of the language in megabytes.
settings-translations-subpage-download-error = 不能下载 { $language } ({ $size }MB)

settings-translations-subpage-download-retry-button =
    .label = 尝试再一次

# Variables:
#   $language (string) - The localized display name of the language.
#   $size (string) - The download size of the language in megabytes.
settings-translations-subpage-download-delete-confirm = 删除 { $language } ({ $size }MB)?

settings-translations-subpage-download-delete-button =
    .label = 删除

settings-translations-subpage-download-cancel-button =
    .label = 取消

settings-translations-subpage-no-sites-added =
    .label = 无位置额外的

# Variables:
#    $localeName (string) - Localized name of the locale to be used.
use-system-locale =
   .label = 使用你的操作的系统设置为了“{ $localeName }”到格式化日期, 时间, 数字, 和度量.

settings-spellcheck-header =
    .label = 符咒复选

check-user-spelling =
    .label = 复选你的拼写检查作为你打字
    .accesskey = t

spellcheck-download-dictionaries =
    .label = 下载词典

spellcheck-promo =
    .heading = 如何到使用符咒检查的
    .message = 右-click 一个电文域到使旋转符咒复选在或关闭或到更改那语言. 不所有的域支持符咒复选.

## General Section - Files and Applications

files-and-applications-title = 文件和应用

download-save-files-header =
    .label = 保存文件到

download-save-where-3 =
    .aria-label = 保存文件到

download-always-ask-where2 =
    .label = 询问哪里到保存文件在...之前下装
    .accesskey = A
download-private-browsing-delete2 =
    .label = 删除私人的窗口下载在关闭
    .accesskey = D

applications-header = 应用

applications-description = 选取如何 { -brand-short-name } 句柄那文件你下载从那网或那应用你使用一会儿浏览.

applications-setting2 =
    .label = 文件和应用
    .description = 选取如何 { -brand-short-name } 句柄将（程序文件和内容.

applications-filter =
    .placeholder = 搜索文件类型或应用

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
    .label = 使用 { $app-name } (默认)

applications-use-os-default =
    .label =
        { PLATFORM() ->
            [macos] 使用埃及棉默认应用
            [windows] 使用窗默认应用
           *[other] 使用系统默认应用
        }

applications-use-other =
    .label = 使用其他的…
applications-select-helper = 选择帮忙者应用

applications-manage-app =
    .label = 应用详细数据…
applications-always-ask =
    .label = 总是询问

# Variables:
#   $type-description (string) - Description of the type (e.g "Portable Document Format")
#   $type (string) - The MIME type (e.g application/binary)
applications-type-description-with-type = { $type-description } ({ $type })

# Variables:
#   $extension (string) - File extension (e.g .TXT)
#   $type (string) - The MIME type (e.g application/binary)
applications-file-ending-with-type = { applications-file-ending } ({ $type })

applications-open-inapp =
    .label = 打开在 { -brand-short-name }

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

applications-handle-new-file-types-description = 什么应该 { -brand-short-name } 做与其他的文件?

applications-setting-new-file-types =
     .label = 什么应该 { -brand-short-name } 做与其他的文件?

applications-save-for-new-types =
    .label = 保存文件
    .accesskey = S
applications-save-for-new-types2 =
    .label = 自动地保存文件
    .accesskey = S

applications-ask-before-handling =
    .label = 询问是否到打开或保存文件
    .accesskey = A
applications-ask-before-handling2 =
    .label = 询问到打开或保存文件
    .accesskey = A

drm-group =
  .label = 数字右经营 (DRM) 内容

play-drm-content =
    .label = 播放 DRM-controlled 内容
    .accesskey = P

play-drm-content-learn-more = 为什么我们禁用它

## About Firefox

about-firefox-header =
    .heading = 关于 { -brand-short-name }

## Firefox updates

update-application-heading =
    .label = { -brand-short-name } 更新
    .description = 更新改良 { -brand-short-name }'s 中央处理机速度设置程序, 安定, 和安全.

update-application-suppress-prompts-heading =
    .label = 通知

update-application-updates-managed-by-os =
    .message = 更新是与中央化计划及管制有关的由你的操作的系统

# Variables:
# $version (string) - Firefox version
update-application-version = 版本 { $version } <a data-l10n-name="learn-more">拜访那贮藏所</a>

update-history-2 =
    .label = 显示更新历史记录
    .accesskey = p

update-application-installation =
    .label = 安装

update-application-auto-2 =
    .label = 自动地安装更新 (被推荐的)
    .accesskey = A

update-application-check-choose-2 =
    .label = 检查更新, 除了选取何时到安装
    .accesskey = C

update-application-background-enabled =
    .label = 何时 { -brand-short-name } 是不运行
    .accesskey = W

update-application-warning-cross-user-setting-2 =
    .message = 这设置将应用对所有人窗帐户和 { -brand-short-name } 提问档使用这安装的 { -brand-short-name }.

update-application-suppress-prompts-2 =
    .label = 显示较少的更新提醒的人
    .accesskey = n

update-setting-write-failure-title2 = 错误保存更新设置

# Variables:
#   $path (string) - Path to the configuration file
# The newlines between the main text and the line containing the path is
# intentional so the path is easier to identify.
update-setting-write-failure-message2 =
    { -brand-short-name } encountered an error and didn’t save this change. Note that changing this update setting requires permission to write to the file below. You or a system administrator may be able resolve the error by granting the Users group full control to this file.

    能够不书写器到文件: { $path }

update-in-progress-title = 更新在进步

update-in-progress-message = 你是否想要 { -brand-short-name } 到继续与这更新?

update-in-progress-ok-button = &丢弃
# Continue is the cancel button so pressing escape or using a platform standard
# method of closing the UI will not discard the update.
update-in-progress-cancel-button = &继续

## Firefox support

support-application-heading =
    .label = { -brand-short-name } 支持
    .description = 障碍修理发行或部分主意与那社区.

support-get-help =
    .label = 获得帮忙

support-share-ideas =
    .label = 部分主意和反馈

## General Section - Performance

performance-group =
  .label = 施行

performance-use-recommended-settings-checkbox-2 =
    .label = 使用被推荐的施行设置
    .description = 这些设置是裁缝做的到你的硬件和操作的系统.
    .accesskey = U

performance-settings-learn-more = 学习更多

performance-allow-hw-accel =
    .label = 使用硬件加速何时可利用的
    .accesskey = r

performance-limit-content-process-option = 内容进程界限
    .accesskey = l

performance-limit-content-process-enabled-desc = 附加的内容进程能改良施行何时使用倍数标签页, 除了将也使用更多存储器.
performance-limit-content-process-blocked-desc = 修改那数字的内容进程是仅可能的与多过程 { -brand-short-name }. <a data-l10n-name="learn-more">学习如何到复选如果多过程是启用</a>

# Variables:
#   $num (number) - Default value of the `dom.ipc.processCount` pref.
performance-default-content-process-count =
    .label = { $num } (默认)

## General Section - Browsing

browsing-group =
  .label = 浏览

browsing-use-smooth-scrolling =
    .label = 使用平滑的卷动
    .accesskey = m

browsing-gtk-use-non-overlay-scrollbars =
    .label = 总是显示滚动条
    .accesskey = o

browsing-always-underline-links=
    .label = 总是加下划线连接
    .accesskey = u

browsing-use-onscreen-keyboard =
    .label = 显示一个触觉键盘何时必要的
    .accesskey = c

browsing-use-cursor-navigation =
    .label = 总是使用那光标键到航行内部页
    .accesskey = k

browsing-use-full-keyboard-navigation =
    .label = 使用那标签页键到移动焦点在...之间表单控制和连接
    .accesskey = t

browsing-search-on-start-typing =
    .label = 搜索为了电文何时你启动键入
    .accesskey = x

settings-media-group =
    .label = 媒质

browsing-picture-in-picture-toggle-enabled-2 =
    .label = 使用图象-在-图象
    .accesskey = e

browsing-picture-in-picture-enable-when-switching-tabs =
    .label = 保持游戏影像在图象-在-图象何时交换标签页
    .accesskey = s

browsing-media-control =
    .label = Control 媒质经由键盘, (一副)耳机, 或虚拟接口
    .accesskey = v

recommendations-group =
    .label = 推荐

browsing-cfr-recommendations =
    .label = 推荐扩展名作为你浏览
    .accesskey = R
browsing-cfr-features =
    .label = 推荐特性作为你浏览
    .accesskey = f

## General Section - Proxy

network-proxy-group2 =
  .label = 代理设置
  .description = 装配如何 { -brand-short-name } 连接到那因特网.

network-proxy-connection-settings2 =
    .label = 装配代理
    .description = 更改这些设置可以引起连接发行
    .accesskey = p

## Home Section

home-section =
    .heading = 主页和启动

home-new-windows-tabs-header = 新的窗和标签页

home-new-windows-tabs-description2 = 选取什么你看见何时你打开你的主页, 新的窗, 和新的标签页.

## Home Section - Default Browser

home-default-browser-title =
    .label = 默认浏览器

is-default-browser-2 =
    .message = { -brand-short-name } 是你的默认浏览器. 善行选择.

is-not-default-browser-2 =
    .message = 为引起人的注意时所发的声音, { -brand-short-name } 不是你的默认.

set-as-my-default-browser-2 =
    .label = 使默认
    .accesskey = D

## Home Section - Home Page Customization

home-homepage-mode-label = 主页和新的窗

home-newtabs-mode-label = 新的标签页

home-restore-defaults =
    .label = 回复默认
    .accesskey = R

home-mode-choice-default-fx =
    .label = { -firefox-home-brand-name } (默认)

home-mode-choice-custom =
    .label = 定制统一资源定位器…

home-mode-choice-blank =
    .label = 空白页

home-homepage-custom-url =
    .placeholder = 粘贴一个 URL…

# This button is shown when the homepage is managed by an extension and is placed below extension-controlling-homepage.
home-homepage-manage-extension-button =
    .label = 管理扩展名

## Custom Homepage subpage

home-custom-homepage-header = 定制主页

home-custom-homepage-subpage =
    .heading = 定制主页

# This string has a special case for '1' and [other] (default). If necessary for
# your language, you can add {$tabCount} to your translations and use the
# standard CLDR forms, or only use the form for [other] if both strings should
# be identical.
use-current-pages =
    .label =
        { $tabCount ->
            [1] 使用当前的页
           *[other] 使用当前的页
        }
    .accesskey = C

choose-bookmark =
    .label = 使用书签…
    .accesskey = B

## Home Section - Firefox Home Content Customization

home-prefs-content-header2 = { -firefox-home-brand-name } 内容
home-prefs-content-description2 = 选取什么内容你想要在你的 { -firefox-home-brand-name } 筛选.

home-prefs-search-header =
    .label = 网搜索
home-prefs-shortcuts-header =
    .label = 快捷方式
home-prefs-shortcuts-description = 位置你保存或拜访
home-prefs-shortcuts-by-option-sponsored =
    .label = 赞助快捷方式

home-prefs-recommended-by-header-generic =
    .label = 被推荐的故事
home-prefs-recommended-by-description-generic = 例外的内容 n. 助理牧师由那 { -brand-product-name } 家庭

home-prefs-stories-header =
    .label = 故事
home-prefs-stories-description = 个人化的故事立基于在你的活动

##

home-prefs-recommended-by-learn-more = 如何它工作
home-prefs-recommended-by-option-sponsored-stories =
    .label = 赞助故事

home-prefs-highlights-option-visited-pages =
    .label = 拜访页
home-prefs-highlights-options-bookmarks =
    .label = 书签
home-prefs-highlights-option-most-recent-download =
    .label = 最多最近的下载

home-prefs-recent-activity-header =
    .label = 最近的活动
home-prefs-recent-activity-description = 一个选择的最近的位置和内容

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
home-prefs-weather-description = Today's 趋势预测在一个一瞥
home-prefs-weather-learn-more-link = 学习更多

# "Support" here means to help sustain or contribute to something, especially through funding or sponsorship.
home-prefs-support-firefox-header =
    .label = 支持 { -brand-product-name }

home-prefs-mission-message = 我们的保证人支持我们的任务到建立一个较好的网
home-prefs-mission-message-learn-more-link = 发现外面的如何

home-prefs-manage-topics-link = 管理主题

home-prefs-choose-wallpaper-link = 选取一个壁纸

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
    .label = 显示搜索检索词在那地址棒形图在结果页

search-separate-default-engine-2 =
    .label = 使用一个不同的默认搜索引擎在私人的窗
    .accesskey = U

search-separate-default-engine-dropdown =
    .aria-label = 默认搜索引擎在私人的窗

search-suggestions-header-2 =
    .label = 搜索引擎提议

search-show-suggestions-option =
    .label = 显示搜索提议
    .accesskey = S

search-show-suggestions-url-bar-option =
    .label = 显示搜索提议在地址棒形图结果
    .accesskey = l

# This string describes what the user will observe when the system
# prioritizes search suggestions over browsing history in the results
# that extend down from the address bar. In the original English string,
# "before" refers to location (appearing most proximate to), not time
# (appearing before).
search-show-suggestions-above-history-option-2 =
    .label = 显示搜索提议在...之前浏览历史在地址棒形图结果

search-show-suggestions-private-windows-2 =
    .label = 搜索提议在私人的窗

search-suggestions-cant-show-2 =
    .message = 搜索提议将不是显示在位置棒形图结果因为你有配置的 { -brand-short-name } 到从不记住历史记录.

addressbar-header-1 =
    .label = 地址棒形图
    .description = 选取哪个提议显示器在你的地址棒形图

# When Firefox Suggest is enabled, this replaces `addressbar-header-1`.
addressbar-header-firefox-suggest-2 =
    .label = { -firefox-suggest-brand-name }
    .description = 提议从 { -brand-short-name } 和我们的合伙人在你的地址棒形图.

addressbar-locbar-history-option =
    .label = 浏览历史记录
    .accesskey = h
addressbar-locbar-bookmarks-option =
    .label = 书签
    .accesskey = k
addressbar-locbar-clipboard-option =
    .label = 剪贴板
    .accesskey = C
addressbar-locbar-openpage-option =
    .label = 打开标签页
    .accesskey = O
# Shortcuts refers to the shortcut tiles on the new tab page, previously known as top sites. Translation should be consistent.
addressbar-locbar-shortcuts-option =
    .label = 快捷方式
    .accesskey = S
addressbar-locbar-topsites-option =
    .label = TOP协议位置
    .accesskey = T
addressbar-locbar-showrecentsearches-option-2 =
    .label = 最近的搜索
    .accesskey = r
addressbar-locbar-engines-option-1 =
    .label = 提议搜索引擎到使用
    .accesskey = a
addressbar-locbar-quickactions-option =
    .label = 快的操作
    .accesskey = Q
addressbar-locbar-showtrendingsuggestions-option-2 =
    .label = 伸向搜索提议
    .accesskey = t

# Toggles whether suggestions are obtained from Firefox Suggest or not (local or online).
addressbar-locbar-suggest-all-option-2 =
    .label = 提议从 { -brand-short-name }
    .description = 获得提议从那网讲述的到你的搜索.

addressbar-locbar-suggest-sponsored-option-2 =
    .label = 提议从保证人
    .description = 支持 { -brand-short-name } 与偶然的赞助提议.

# This string is used for a checkbox in the settings UI that opts the
# user into "online" Firefox Suggest, allowing them to receive suggestions from
# Mozilla's Merino server.
# "Mozilla" is intentionally hardcoded to prevent forks from replacing it
# with their own vendor name, since the online suggest is created and maintained
# by Mozilla.
addressbar-firefox-suggest-online =
    .label = 检索提议从摩斯拉作为你打字

addressbar-dismissed-suggestions-label-2 =
    .label = 解雇提议
    .description = 回复解雇提议从保证人和 { -brand-short-name }.
addressbar-restore-dismissed-suggestions-button-2 =
    .label = 回复提议

search-one-click-header2 = 搜索快捷方式
search-one-click-desc = 选取那选择对象搜索引擎那出现在下面那地址棒形图和搜索棒形图何时你启动到输入一个关键字.
search-one-click-header-3 =
    .label = 附加的搜索引擎
    .description = 选取哪个搜索引擎和快捷方式出现在你的地址棒形图.

update-search-engine-success =
    .message = 搜索引擎成功更新的

search-edit-engine-2 =
    .title = 编辑搜索引擎
search-delete-engine =
    .title = 删除搜索引擎
search-enable-engine =
    .title = 启用搜索引擎
search-outlink-to-extensions-page =
    .title = 管理在扩展名和主题

search-choose-engine-column =
    .label = 搜索引擎
search-choose-keyword-column =
    .label = 关键字

search-restore-default =
    .label = 回复默认搜索引擎
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

search-find-more-link = 发现更多搜索引擎

search-filtering-for-add-engine = 添加引擎

# This warning is displayed when the chosen keyword is already in use
# ('Duplicate' is an adjective)
search-keyword-warning-title = 复制关键字
# Variables:
#   $name (string) - Name of a search engine.
search-keyword-warning-engine = 你有 chosen 一个关键字那是当前在使用由“{ $name }”. 请选择另外的.
search-keyword-warning-bookmark = 你有 chosen 一个关键字那是当前在使用由一个书签. 请选择另外的.

# This warning is displayed when the chosen name is already in use.
# Variables:
#   $name (string) - Name of a search engine.
edit-engine-name-warning-duplicate = 那里已经是一个搜索引擎与那名称“{ $name }”. 请选取另外的名称.

remove-engine-confirmation = 你确定你想要到移除这搜索引擎?
remove-engine-remove = 移除
remove-addon-engine-alert = 到移除这搜索引擎, 移除那关联的 add-on.

## Containers Section

containers-section-header2 =
    .heading = 容器设置
containers-card-header2 =
    .label = 容器
    .description = 独立件饼干由容器如此你能使用不同的帐户在那相同的位置和界限交叉-site 跟踪.
containers-add-button2 =
    .label = 添加新的容器
    .accesskey = A

containers-new-tab-check2 =
    .label = 选择一个容器为了每个新的标签页
    .accesskey = S
    .description = 这将打开那容器菜单每一时间你压那打开新的标签页按钮.

containers-settings-button2 =
    .title = 设置
containers-remove-button2 =
    .title = 移除

## Account and sync

account-sync-section =
    .heading = 帐户和同步的

pane-account-sync-title2 = 帐户和同步的
    .title = 帐户和同步的

sync-group-label =
    .label = 同步的

account-group-label2 =
    .label = 帐户

account-disabled-group =
    .label = 帐户
    .description = 帐户设置是得不到的.

account-placeholder2 =
    .label = 你是不有符号的在
    .description = 正负号在和保持你的论据私人的, 加密, 和立即地易接近的各处你使用 { -brand-short-name }.

## Firefox account - Signed out. Note that "Sync" and "Firefox account" are now
## more discrete ("signed in" no longer means "and sync is connected").

sync-signedout-caption = 采取你的网与你
sync-signedout-description2 = 同步你的书签, 历史记录, 标签页, 密码, 添加-奥运信息服务, 和设置越过所有的你的装置.

sync-signedout-account-signin3 =
    .label = 正负号在到同步的…
    .accesskey = i

sync-signedout-account-signin-4 =
    .label = 正负号在到你的帐户到启动【电影、电视】
    .accesskey = i

sync-signedout-account-short =
    .label = 正负号在
    .accesskey = i

# This message contains two links and two icon images.
#   `<img data-l10n-name="android-icon"/>` - Android logo icon
#   `<a data-l10n-name="android-link">` - Link to Android Download
#   `<img data-l10n-name="ios-icon">` - iOS logo icon
#   `<a data-l10n-name="ios-link">` - Link to iOS Download
#
# They can be moved within the sentence as needed to adapt
# to your language, but should not be changed or translated.
sync-mobile-promo = 下载火狐为了 <img data-l10n-name="android-icon"/> <a data-l10n-name="android-link">机器人</a> 或 <img data-l10n-name="ios-icon"/> <a data-l10n-name="ios-link">网间网操作系统（Internet work 0perating System）</a> 到同步的与你的活动物体装置.

## Firefox account - Signed in

sync-profile-picture-with-alt =
    .tooltiptext = 更改提问档图象
    .alt = 更改提问档图象

sync-profile-picture-account-problem =
    .alt = 帐户提问档图象

fxa-login-rejected-warning =
    .alt = 警告

sync-sign-out =
    .label = 正负号外面的…
    .accesskey = g

sync-sign-out2 =
    .label = 正负号外面的
    .accesskey = g

sync-manage-account = 管理帐户
    .accesskey = o

sync-manage-account2 =
    .label = 管理帐户
    .accesskey = o

## Variables
## $email (string) - Email used for Firefox account
## $name (string) - Name used for Firefox account

sync-account-signed-in =
    .label = { $email }

sync-account-signed-in-display-name =
    .label = { $name }
    .description = { $email }

sync-signedin-unverified = { $email } 是不已查清的.

sync-signedin-unverified2 =
    .label = { $email } 不是被证实的还
    .description = 复选你的入站到确认你的帐户和使它官员.

sync-signedin-login-failure = 请正负号在到使再接合 { $email }

sync-signedin-login-failure2 =
    .label = 你是有符号的外面的的 { $email }
    .description = 正负号回在到使再接合和启动【电影、电视】你的论据.

##

sync-verify-account =
    .label = 证明帐户
    .accesskey = V

sync-remove-account =
    .label = 移除帐户
    .accesskey = R

sync-sign-in =
    .label = 正负号在
    .accesskey = g

## Sync section - enabling or disabling sync.

prefs-syncing-on = 【电影、电视】: ON

prefs-syncing-on-2 =
    .label = 【电影、电视】是 ON

prefs-syncing-off = 【电影、电视】: OFF

prefs-syncing-off-2 =
    .label = 【电影、电视】是 OFF
    .description = 转弯在同步的到获得你的书签, 密码, 历史记录, 和更多在任何的装置.

prefs-sync-turn-on-syncing =
    .label = 转弯在【电影、电视】…
    .accesskey = s

prefs-sync-turn-on-syncing-2 =
    .label = 转弯在【电影、电视】
    .accesskey = s

prefs-sync-offer-setup-label2 = 同步你的书签, 历史记录, 标签页, 密码, 添加-奥运信息服务, 和设置越过所有的你的装置.

prefs-sync-now-button =
    .label = 同步的现在
    .accesskey = N

prefs-sync-now-button-2 =
    .label = 同步的现在
    .accesskey = N

prefs-syncing-button =
    .label = 【电影、电视】…

prefs-syncing-button-2 =
    .label = 【电影、电视】…
    .title = 同步的现在

## The list of things currently syncing.

sync-syncing-across-devices-heading = 你是【电影、电视】这些项越过所有的你的连接的装置:

sync-syncing-across-devices-heading-2 = 论据 synchronization 的缩略词越过装置

sync-syncing-across-devices-empty-state2 =
    .label = 管理 synchronization 的缩略词论据
    .description = 你不是【电影、电视】任何事…还. 启动【电影、电视】到获得所有的的你的论据在全部你的装置.

sync-currently-syncing-bookmarks = 书签
sync-currently-syncing-history = 历史记录
sync-currently-syncing-tabs = 打开标签页
sync-currently-syncing-passwords = 密码
sync-currently-syncing-addresses = 地址
sync-currently-syncing-payment-methods = 付款方法
sync-currently-syncing-addons = 添加-奥运信息服务
sync-currently-syncing-settings = 设置

sync-manage-options =
    .label = 管理同步的…
    .accesskey = M

sync-manage-options-2 =
    .label = 管理 synchronization 的缩略词论据
    .accesskey = M

settings-sync-disconnect-button =
    .label = 断开

## The "Choose what to sync" dialog.

sync-choose-what-to-sync-dialog4 =
    .title = 管理什么同步的在全部你的连接的装置
    .style = min-width: 36媒体用毕符;
    .buttonlabelaccept = 保存
    .buttonaccesskeyaccept = S
    .buttonlabelextra2 = 断开…
    .buttonaccesskeyextra2 = D

sync-engine-bookmarks =
    .label = 书签
    .accesskey = m

sync-engine-history =
    .label = 历史记录
    .accesskey = r

sync-engine-tabs =
    .label = 打开标签页
    .tooltiptext = 一个列表的什么是打开在全部 synchronization 的缩略词装置
    .accesskey = t

sync-engine-passwords =
    .label = 密码
    .tooltiptext = 密码你有保存
    .accesskey = P

sync-engine-addresses =
    .label = 地址
    .tooltiptext = 邮政的地址你有保存 (桌面仅)
    .accesskey = e

sync-engine-payment-methods2 =
    .label = 付款方法
    .tooltiptext = 名称, 卡片数字, 和终结日期
    .accesskey = n

sync-engine-addons =
    .label = 添加-奥运信息服务
    .tooltiptext = 扩展名和主题为了火狐桌面
    .accesskey = A

sync-engine-settings =
    .label = 设置
    .tooltiptext = 常规, 隐私, 和安全设置你有更改
    .accesskey = s

## The device name controls.

sync-device-name-header = 装置名称

sync-device-name-header-2 =
    .label = 装置名称

# Variables:
#   $placeholder (string) - The placeholder text of the input
sync-device-name-input =
    .aria-label = 装置名称
    .placeholder = { $placeholder }

sync-device-name-change-2 =
    .label = 更改装置名称
    .accesskey = h

sync-device-name-change =
    .label = 更改装置名称…
    .accesskey = h

sync-device-name-cancel =
    .label = 取消
    .accesskey = n

sync-device-name-save =
    .label = 保存
    .accesskey = v

sync-connect-another-device = 连接另外的装置

sync-connect-another-device-2 =
    .label = 连接另外的装置

## Privacy Section

privacy-header = 浏览器隐私

## Privacy Section - Passwords

# "Logins" is the former term for "Passwords". Users should find password settings
# by searching for the former term "logins". It's not displayed in the UI.
pane-privacy-passwords-header = 密码
    .searchkeywords = 注册(程序)

forms-passwords-header =
    .label = 密码
    .aria-label = 密码

# Checkbox to control whether UI is shown to users to save or fill logins/passwords.
forms-ask-to-save-passwords =
    .label = 询问到保存密码
    .accesskey = A
forms-manage-password-exceptions =
    .label = 管理密码例外
    .accesskey = M
forms-exceptions =
    .label = 例外…
    .accesskey = x
forms-suggest-passwords =
    .label = 提议强壮的密码
    .accesskey = S
forms-breach-alerts =
    .label = 显示警觉的关于密码为了攻破网站（全球资讯网的主机站）
    .accesskey = b
forms-breach-alerts-learn-more-link = 学习更多

## Privacy Panel Settings

privacy-panel-settings-header =
    .label = 隐私嵌板设置
    .description = 获得帮忙保护你的信息联机在 { -brand-short-name }.
# By “breach message” we mean the UI messaging shown when Firefox detects that a
# site the user has interacted with has been involved in a known data breach
privacy-panel-breach-alerts =
    .label = 显示裂口报文
    .accesskey = s
preferences-relay-integration-checkbox2 =
    .label = 提议 { -relay-brand-name } 电子信函屏蔽到防卫你的电子信函地址
    .accesskey = r
relay-integration-learn-more-link = 学习更多

# Checkbox which controls filling saved logins into fields automatically when they appear, in some cases without user interaction.
forms-fill-usernames-and-passwords =
    .label = 填充由字母或数字组成的用户名称和密码自动地
    .accesskey = F
forms-fill-usernames-and-passwords-2 =
    .label = 保存和自动填充由字母或数字组成的用户名称和密码
    .accesskey = f
forms-saved-passwords =
    .label = 保存密码
    .accesskey = d
forms-saved-passwords-2 =
    .label = 管理保存密码
    .accesskey = d
forms-saved-passwords-searchkeywords = 注册(程序) 为了那下列各项位置是储存的在你的计算机

# Header for additional protections when managing password settings.
forms-additional-protections-header =
    .label = 附加的保护
forms-primary-pw-use =
    .label = 使用一个初等量密码
    .accesskey = U
forms-primary-pw-use-2 =
    .label = 使用一个初等量密码
    .description = 添加一个额外的事物层的安全到防卫你的保存密码.
    .accesskey = U
forms-primary-pw-set =
    .label = 日落初等量密码
forms-primary-pw-on =
    .label = 初等量密码是 ON
forms-primary-pw-change-2 =
    .label = 更改初等量密码
# Label for button to disable primary password.
forms-primary-pw-turn-off =
    .label = 转弯它关闭
# This operation requires the user to authenticate with the operating system (device sign-in)
forms-os-reauth =
    .label = 需要装置正负号在到填充和管理密码
forms-os-reauth-2 =
    .label = 需要装置正负号在到管理密码
forms-primary-pw-learn-more-link = 学习更多
# This string uses the former name of the Primary Password feature
# ("Master Password" in English) so that the preferences can be found
# when searching for the old name. The accesskey is unused.
forms-master-pw-change =
    .label = 更改主人密码…
    .accesskey = M
forms-primary-pw-change =
    .label = 更改初等量密码…
    .accesskey = P
# Leave this message empty if the translation for "Primary Password" matches
# "Master Password" in your language. If you're editing the FTL file directly,
# use { "" } as the value.
forms-primary-pw-former-name = 从前已知的作为主人密码

forms-primary-pw-fips-title = 你是当前在 FIPS 模式. FIPS 需要一个非-empty 初等量密码.
forms-master-pw-fips-desc = 密码更改失败的
forms-windows-sso =
    .label = 允许窗单精度型正负号-on 为了巨硬, 工作, 和学校帐户
forms-windows-sso-learn-more-link = 学习更多
forms-windows-sso-desc = 管理帐户在你的装置设置

windows-passkey-settings-label = 管理总钥匙在系统设置

## OS Authentication dialog

# This message can be seen by trying to add a Primary Password.
primary-password-os-auth-dialog-message-win = 到创建一个初等量密码, 输入你的窗注册(程序) 国书. 这帮忙防卫那安全的你的帐户.

# This message can be seen by trying to add a Primary Password.
# The macOS strings are preceded by the operating system with "Firefox is trying to "
# and includes subtitle of "Enter password for the user "xxx" to allow this." These
# notes are only valid for English. Please test in your locale.
primary-password-os-auth-dialog-message-macosx = 创建一个初等量密码
master-password-os-auth-dialog-caption = { -brand-full-name }

# The macOS string is preceded by the operating system with "Firefox is trying to ".
autofill-creditcard-os-dialog-message = { PLATFORM () ->
    [macos] 更改那设置为了付款方法
    *[other] { -brand-short-name } 正尝试更改那设置为了付款方法. 使用你的装置正负号在到允许这.
}
autofill-creditcard-os-auth-dialog-caption = { -brand-full-name }

## Privacy section - Autofill

payments-group =
    .label = 付款方法

autofill-payment-methods-header =
    .aria-label = 付款方法
autofill-payment-methods-checkbox-message-2 =
    .label = 保存和自动填充付款信息
    .accesskey = p
autofill-payment-methods-manage-payments-title =
    .heading = 管理付款方法
autofill-payment-methods-manage-payments-button =
    .label = 管理付款方法
    .accesskey = m
# This operation requires the user to authenticate with the operating system (device sign-in)
autofill-reauth-payment-methods-checkbox-2 =
    .label = 需要装置正负号在到自动填充和管理付款方法
    .accesskey = o

autofill-payment-methods-add-button = 添加新的付款方法
payments-list-header =
  .label = 付款方法
payments-delete-payment-prompt-title = 删除这付款方法?
payments-delete-payment-prompt-confirm-button = 删除
payments-delete-payment-prompt-cancel-button = 取消
payments-delete-payment-button-label =
    .aria-label = 删除
payments-edit-payment-button-label =
    .aria-label = 编辑

# This message is displayed when no payment methods such as credit card are stored in Firefox
payments-no-payments-stored-message =
    .label = 无付款方法额外的

# These values are displayed for each credit card record listed on the Manage Payment methods
# settings page.
# Variables:
#   $cardNumber (string) - The obscured credit card number (for example: ********* 2423)
#   $expDate (string) - The obscured expiry date of the credit card (for example: XX/2027)
payment-moz-box-item =
  .label = { $cardNumber }
  .description = { $expDate }

addresses-group =
    .label = 地址和更多
autofill-addresses-checkbox-message =
    .label = 保存和自动填充地址
    .accesskey = S
autofill-addresses-manage-addresses-button =
    .label = 管理地址和更多
    .accesskey = M
addresses-list-header =
    .label = 地址
addreses-delete-address-button-label =
    .aria-label = 删除
addreses-edit-address-button-label =
    .aria-label = 编辑
addresses-delete-address-prompt-title = 删除这地址?
addresses-delete-address-prompt-confirm-button = 删除
addresses-delete-address-prompt-cancel-button = 取消
autofill-addresses-add-button = 添加新的地址
autofill-addresses-manage-addresses-title =
    .heading = 管理地址和更多

# This message is displayed when no addresses are stored in Firefox
addresses-no-addresses-stored-message =
    .label = 无地址额外的

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
    .description = 每一窗口先进通信技术相似的一个私人的窗口. 何时在, 扩展名需要到是允许.
history-remember-option-custom2 =
    .label = 定制历史记录

history-remember-description4 =
    .aria-label = { history-group.label }
    .description = { -brand-short-name } 将记住你的浏览, 下载, 表单, 和搜索历史记录.

history-dontremember-description4 =
    .aria-label = { history-group.label }
    .description = { -brand-short-name } 将使用那相同的设置作为私人的浏览, 和将不记住任何的历史记录作为你浏览那网.

history-custom-description4 =
    .aria-label = { history-group.label }
    .description = { -brand-short-name } 将使用定制设置为了你的浏览, 下载, 表单和搜索历史记录.

history-private-browsing-permanent =
    .label = 总是使用私人的浏览模式
    .accesskey = p

history-remember-browser-option =
    .label = 记住浏览和下载历史记录
    .accesskey = b

history-remember-search-option =
    .label = 记住搜索和表单历史记录
    .accesskey = f

history-clear-on-close-option =
    .label = 清除历史记录何时 { -brand-short-name } 关闭
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
    .description = 选取什么你想要 { -brand-short-name } 到记住何时你关闭那浏览器.

history-custom-section-header =
    .label = 在前的设置
    .description = 定制什么你想要 { -brand-short-name } 到记住何时你关闭那浏览器.

history-custom-button =
    .label = 选取什么你想要 { -brand-short-name } 到记住

## Privacy Section - Site Data

cookies-site-data-group =
    .label = 饼干和位置论据

sitedata-total-size-calculating = 计算站点数据和高速缓冲存储器大小…

# Variables:
#   $value (number) - Value of the unit (for example: 4.6, 500)
#   $unit (string) - Name of the unit (for example: "bytes", "KB")
sitedata-total-size3 = 网站（全球资讯网的主机站）是当前使用 <strong>{ $value } { $unit }</strong> 的磁盘空白.

sitedata-learn-more = 学习更多

sitedata-delete-on-close2 =
    .label = 清除 Cookie 和站点数据每一时间你关闭 { -brand-short-name }
    .accesskey = c

sitedata-delete-on-close-private-browsing3 =
    .message = 立基于在你的历史记录设置, { -brand-short-name } 删除 Cookie 和站点数据从你的会话何时你关闭那浏览器.

sitedata-delete-on-close-private-browsing4 =
    .heading = 历史记录将不是保存.
    .message = { -brand-short-name } 清除 Cookie 和站点数据从你的会话何时你关闭那浏览器.

sitedata-option-block-cross-site-trackers =
    .label = 交叉-site 追踪者
sitedata-option-block-cross-site-tracking-cookies =
    .label = 交叉-site 跟踪饼干
sitedata-option-block-cross-site-cookies2 =
    .label = 使隔离交叉-site 饼干
sitedata-option-block-unvisited =
    .label = 饼干从 unvisited 网站（全球资讯网的主机站）
sitedata-option-block-all-cross-site-cookies =
    .label = 所有的交叉-site 饼干 (可以引起网站（全球资讯网的主机站）到中断)
sitedata-option-block-all =
    .label = 所有的饼干 (将引起网站（全球资讯网的主机站）到中断)

sitedata-clear2 =
    .label = 清除浏览论据
    .accesskey = l

sitedata-settings2 =
    .label = 管理浏览论据
    .accesskey = M

sitedata-cookies-exceptions =
    .label = 管理例外…
    .accesskey = x

sitedata-cookies-exceptions2 =
    .label = 管理例外
    .accesskey = x
    .description = 你能指定哪个网站（全球资讯网的主机站）是总是或从不允许到使用 Cookie 和站点数据.

sitedata-heading =
    .label = 浏览论据
    .description = 管理你的饼干, 历史记录, 高速缓冲存储器, 网站（全球资讯网的主机站）论据, 和更多.

sitedata-settings3 =
    .label = 清除论据为了特效药位置
    .accesskey = s

sitedata-cookies-exceptions3 =
    .label = 管理例外
    .accesskey = x
    .description = 选取如何特效药位置句柄 Cookie 和站点数据.

## Privacy Section - Cookie Banner Blocking

cookie-banner-blocker-header = 饼干旗帜阻滞物
cookie-banner-blocker-description = 何时一个位置询问如果他们能使用饼干在私人的浏览模式, { -brand-short-name } 自动地拒绝为了你. 仅在被支持的位置.
cookie-banner-learn-more = 学习更多
cookie-banner-blocker-checkbox-label =
    .label = 自动地拒绝饼干旗帜

## Privacy Section - Content Blocking

content-blocking-enhanced-tracking-protection = 增大的跟踪保护

content-blocking-learn-more = 学习更多

content-blocking-fpi-incompatibility-warning = 你是使用首先宴会隔绝 (FPI), 哪个推翻一些的 { -brand-short-name }'s 饼干设置.

# There is no need to translate "Resist Fingerprinting (RFP)". This is a
# feature that can only be enabled via about:config, and it's not exposed to
# standard users (e.g. via Settings).
content-blocking-rfp-incompatibility-warning = 你是使用抵抗指纹法 (RFP), 哪个代替一些的 { -brand-short-name }'s 指纹法保护设置. 这可能引起一些位置到中断.

## These strings are used to define the different levels of
## Enhanced Tracking Protection.

# "Standard" in this case is an adjective, meaning "default" or "normal".
enhanced-tracking-protection-setting-standard =
  .label = 标准
  .accesskey = d
enhanced-tracking-protection-setting-strict =
  .label = 严厉的
  .accesskey = r
enhanced-tracking-protection-setting-custom =
  .label = 定制
  .accesskey = C

##

content-blocking-etp-standard-desc = 平衡的为了保护和施行. 页将加载正规地.
content-blocking-etp-strict-desc = 强劲的保护, 除了可以引起一些位置或内容到中断.
content-blocking-etp-custom-desc = 选取哪个追踪者和手写体到阻止.
content-blocking-etp-blocking-desc = { -brand-short-name } 阻止那下列各项:

content-blocking-private-windows = 跟踪内容在私人的窗
content-blocking-cross-site-cookies-in-all-windows2 = 交叉-site 饼干在全部窗
content-blocking-cross-site-tracking-cookies = 交叉-site 跟踪饼干
content-blocking-all-cross-site-cookies-private-windows = 交叉-site 饼干在私人的窗
content-blocking-isolate-cross-site-cookies = 使隔离交叉-site 饼干
content-blocking-social-media-trackers = 社会的媒质追踪者
content-blocking-all-cookies = 所有的饼干
content-blocking-unvisited-cookies = 饼干从 unvisited 位置
content-blocking-all-windows-tracking-content = 跟踪内容在全部窗
content-blocking-all-cross-site-cookies = 所有的交叉-site 饼干
content-blocking-cryptominers = Cryptominers
content-blocking-fingerprinters = Fingerprinters
# The known fingerprinters are those that are known for collecting browser fingerprints from user devices. And
# the suspected fingerprinters are those that we are uncertain about browser fingerprinting activities. But they could
# possibly acquire browser fingerprints because of the behavior on accessing APIs that expose browser fingerprints.
content-blocking-known-and-suspected-fingerprinters = 已知的和有嫌疑的 fingerprinters

# The tcp-rollout strings are no longer used for the rollout but for tcp-by-default in the standard section

# "Contains" here means "isolates", "limits".
content-blocking-etp-standard-tcp-rollout-description = 全体的饼干保护包含饼干到那位置你是在, 如此追踪者不能使用他们到跟随你在...之间位置.
content-blocking-etp-standard-tcp-rollout-learn-more = 学习更多

content-blocking-etp-standard-tcp-title = 包含全体的饼干保护, 我们的最多有力的隐私特性曾经

content-blocking-warning-title-2 = 一些位置可以中断与严厉的跟踪保护
content-blocking-warning-title-custom = 一些位置可以中断与定制跟踪保护
# “Fix site issues” references the string content-blocking-exceptions-subheader
content-blocking-and-isolating-etp-warning-description-4 = { -brand-short-name } 推荐使用那“修复位置发行”设置到缩小坏掉的位置特性和内容. 如果一个位置象是坏掉的, 尝试旋转关闭跟踪保护为了那位置到加载所有的内容.
content-blocking-warning-learn-how = 学习如何

content-blocking-baseline-exceptions-3 =
    .label = 修复主要位置发行 (被推荐的)
    .description = 帮忙加载位置和特性由块分解仅本质冒险部分那可以包含追踪者. 盖子最多公用块问题.

# This option to fix minor site issues must be used with the option to fix major site issues (string content-blocking-baseline-exceptions-3)
content-blocking-convenience-exceptions-3 =
    .label = 修复次要位置发行
    .description = 回复事物相似的影像在一个信件或备注扇区由块分解部分那可以包含追踪者. 这能缩小位置发行除了给予(物) 最低成本估算与调度法保护. 必须是使用与修复为了主要发行.

content-blocking-baseline-uncheck-warning-dialog-title = 你确定你想要到使旋转关闭修复?
content-blocking-baseline-uncheck-warning-dialog-body = 这设置帮忙修复那最多公用块位置问题. 如果你使旋转它关闭, 一些位置可以不工作, 和 { -brand-short-name } 将不是能干的到帮助障碍修理那些发行.
content-blocking-baseline-uncheck-warning-dialog-ok-button = 转弯修复关闭
content-blocking-baseline-uncheck-warning-dialog-cancel-button = 保持修复在

content-blocking-reload-description = 你将需要到再装你的标签页以应用这些更改.
content-blocking-reload-tabs-button =
  .label = 再装所有的标签页
  .accesskey = R

content-blocking-tracking-content-label =
  .label = 跟踪内容
  .accesskey = T
content-blocking-tracking-protection-option-all-windows =
  .label = 在全部窗
  .accesskey = A
content-blocking-option-private =
  .label = 仅在私人的窗
  .accesskey = p

content-blocking-cookies-label =
  .label = 饼干
  .accesskey = C

content-blocking-expand-section =
  .tooltiptext = 更多信息

# Cryptomining refers to using scripts on websites that can use a computer’s resources to mine cryptocurrency without a user’s knowledge.
content-blocking-cryptominers-label =
  .label = Cryptominers
  .accesskey = y

# Browser fingerprinting is a method of tracking users by the configuration and settings information (their "digital fingerprint")
# that is visible to websites they browse, rather than traditional tracking methods such as IP addresses and unique cookies.
#
# The known fingerprinters are those that are known for collecting browser fingerprints from user devices.
content-blocking-known-fingerprinters-label =
  .label = 已知的 fingerprinters
  .accesskey = K

# The suspected fingerprinters are those that we are uncertain about browser fingerprinting activities. But they could
# possibly acquire browser fingerprints because of the behavior on accessing APIs that expose browser fingerprints.
content-blocking-suspected-fingerprinters-label =
  .label = 有嫌疑的 fingerprinters
  .accesskey = S

## Privacy Section - Tracking

tracking-manage-exceptions =
    .label = 管理例外…
    .accesskey = x

## Privacy Section - Permissions

permissions-data-section =
    .heading = 许可和论据

pane-permissions-data-title2 = 许可和论据
  .title = 许可和论据

permissions-header3 =
    .label = 许可
    .description = 管理什么网站（全球资讯网的主机站）能访问, 控制, 或切换开关.

permissions-location2 =
    .label = 位置

permissions-localhost2 =
    .label = 装置应用和服务

permissions-local-network2 =
    .label = 本地的网络装置

permissions-xr2 =
    .label = 虚拟实在

permissions-camera2 =
    .label = 摄影

permissions-microphone2 =
    .label = 扩音器

# Privacy permission for sound output devices.
permissions-speaker2 =
    .label = 扬声器

permissions-notification2 =
    .label = 通知

permissions-notification-pause =
    .label = 暂停通知直到 { -brand-short-name } 重新启动
    .accesskey = n

permissions-autoplay2 =
    .label = 自动播放

permissions-block-popups2 =
    .label = 阻止出现点-ups 和第三-party 重定向
    .accesskey = B

# "popup" is a misspelling that is more popular than the correct spelling of
# "pop-up" so it's included as a search keyword, not displayed in the UI.
permissions-block-popups-exceptions-button4 =
    .label = 管理例外
    .description = 添加网站（全球资讯网的主机站）那能打开出现点-ups 和使用第三-party 重定向.
    .accesskey = E
    .searchkeywords = 跃上型

permissions-addon-install-warning3 =
    .label = 显示警告何时网站（全球资讯网的主机站）尝试到安装扩展名
    .accesskey = W

permissions-addon-exceptions2 =
    .label = 选取哪个网站（全球资讯网的主机站）能安装扩展名
    .accesskey = E

## Privacy Section - Data Collection

# The search keyword isn't shown to users but is used to find relevant settings in about:preferences.
data-collection =
    .label = { -brand-short-name } 论据收集和使用
    .description = 我们努力到提供你与选择和收集仅那最小的论据必要的到改良 { -brand-product-name } 为了系统中的一个组名.
    .searchkeywords = 遥测技术
data-collection-link = 查看隐私注意
data-collection-preferences-across-profiles =
    .message = 这些设置应用到每一 { -brand-product-name } 提问档在这装置.
data-collection-profiles-link = 查看所有的提问档
data-collection-health-report-telemetry-disabled =
    .message = 你是无比较久允许 { -vendor-short-name } 到截获命令技术上的和交互作用论据. 所有的过去论据将是删除内部 30 天.
data-collection-health-report =
    .label = 发送技术上的和交互作用论据到 { -vendor-short-name }
    .accesskey = r
    .description = 这帮忙我们改良 { -brand-product-name } 特性, 施行, 和安定.
data-collection-health-report-disabled =
    .label = 发送技术上的和交互作用论据到 { -vendor-short-name }
    .accesskey = r
    .description = 论据报道是禁用为了这构造配置.
data-collection-run-studies =
    .label = 允许 { -brand-short-name } 到运行特性学习
    .description = { -brand-short-name } 随机地选择用户到测试特性, 哪个帮忙改良品质为了系统中的一个组名.
data-collection-studies-link =
    .label = 查看 { -brand-short-name } 学习
data-collection-backlogged-crash-reports =
    .label = 自动地发送崩溃报告
    .description = 这帮忙 { -vendor-short-name } 诊断和修复发行与那浏览器. 报告可以包含私人的或敏感的论据.
    .accesskey = c
data-collection-usage-ping =
    .label = 发送每日的用法 internet网络包测程序到 { -vendor-short-name }
    .description = 这帮忙 { -vendor-short-name } 到估计活跃的用户.
    .accesskey = u

backup-multi-profile-warning-message =
    .message = 到确保这更改是包含的在你的倒车, 打开每个提问档和选取“倒车现在”在设置.

nimbus-rollouts =
    .label = 允许 { -brand-short-name } 到改良特性, 施行, 和安定在...之间更新
    .description = 更改将是辗压的外面的极小地.
addon-recommendations3 =
    .label = 允许个人化的扩展名推荐
    .description = 获得扩展名推荐到改良你的浏览经历.

# This message is displayed above disabled data sharing options in developer builds
# or builds with no Telemetry support available.
collection-health-report-disabled2 = 论据报道是禁用为了这构造配置.

collection-backlogged-crash-reports2 =
    .label = 自动地发送崩溃报告
    .accesskey = c
collection-backlogged-crash-reports-description = 这帮忙 { -vendor-short-name } 诊断和修复发行与那浏览器. 报告可以包含私人的或敏感的论据.

# Promotional message displayed in the Settings panes to inform users of the new redesign
settings-redesign-promo =
    .heading = 相同的设置, 新的一看!
    .message = 我们改组这页如此它是更简单到网络软件目录和探险. 你的私人的设置没有更改, 和 everything's 仍然这里. 终端接口处理器: 使用搜索到转移直线到什么你需要.
settings-redesign-promo-dismiss-button =
    .label = 获得它

privacy-segmentation-section-header = 新的特性那提高你的浏览

privacy-segmentation-section-description = 何时我们提供特性那使用你的论据到给你一个更多私人的经历:

privacy-segmentation-radio-off =
    .label = 使用 { -brand-product-name } 推荐

privacy-segmentation-radio-on =
    .label = 显示详细的信息

## Privacy Section - Security
##
## It is important that wording follows the guidelines outlined on this page:
## https://developers.google.com/safe-browsing/developers_guide_v2#AcceptableUsage

security-header = 安全

browsing-protection-group2 =
    .label = 迷惑的内容和危险的软设备保护
    .description = 危险的位置和下载能发送文件你的论据和装置在冒险. { -brand-short-name } 自动地阻止他们, 和警告你关于危险的或没人要的软设备.

security-enable-safe-browsing =
    .label = 阻止危险的和迷惑的内容
    .accesskey = B
security-enable-safe-browsing-link = 学习更多

security-safe-browsing-warning =
    .message = 旋转这关闭缩小保护反对骗局, 怀恶意的位置, 和危险的下载.

security-block-downloads =
    .label = 阻止危险的下载
    .accesskey = d

security-block-uncommon-software =
    .label = 警告你关于没人要的和不寻常的软设备
    .accesskey = c

## Privacy Section - Certificates

certs-description3 =
    .label = 证书
    .description = 装配那证书那 { -brand-short-name } 使用到证明无虑的连接.

certs-view2 =
    .label = 管理证书
    .accesskey = C

certs-devices2 =
    .label = 管理安全装置
    .accesskey = D

certs-thirdparty-toggle =
    .label = 允许 { -brand-short-name } 到自动地信任第三-party 根证书你安装
    .accesskey = t

certs-devices-enable-fips = 启用 FIPS

space-alert-over-5gb-settings-button =
    .label = 打开设置
    .accesskey = O

space-alert-over-5gb-message2 = <strong>{ -brand-short-name } 是运行外面的的磁盘空白.</strong> 网站（全球资讯网的主机站）内容可以不显示器适当地. 你能清除储存的论据在设置 > 隐私 & 安全 > Cookie 和站点数据.

space-alert-under-5gb-message2 = <strong>{ -brand-short-name } 是运行外面的的磁盘空白.</strong> 网站（全球资讯网的主机站）内容可以不显示器适当地. 拜访“学习更多”到优化你的磁盘用法为了较好的浏览经历.

## Privacy Section - HTTPS-Only

httpsonly-group =
    .label = HTTPS-仅模式
    .description = 仅允许无虑的连接到网站（全球资讯网的主机站）. { -brand-short-name } 将询问在...之前接线的不安全地.

httpsonly-label2 =
    .aria-label = { httpsonly-group.label }

httpsonly-learn-more2 = 如何 HTTPS-仅工作

httpsonly-radio-enabled =
    .label = 启用 HTTPS-仅模式在全部窗

httpsonly-radio-enabled-pbm =
    .label = 启用 HTTPS-仅模式在私人的窗仅

httpsonly-radio-disabled3 =
    .label = 不要启用 HTTPS-仅模式
    .description = { -brand-short-name } 可以仍然升级一些连接

## DoH Section

preferences-doh-header = DNS 结束 HTTPS
dns-over-https-group2 =
    .label = DNS 结束 HTTPS
    .description = 域名称系统结束 HTTPS (卫生部) 加密位置查找如此它是更难的为了你的因特网提供器或其他的到看见什么网站（全球资讯网的主机站）你是关于到拜访.

preferences-doh-description2 = 域名称系统 (DNS) 结束 HTTPS 发送你的请求为了一个域名称穿越一个加密连接, 以...为条件一个无虑的 DNS 和制造它更难的为了其他的到看见哪个网站（全球资讯网的主机站）你是关于到访问.

# Variables:
#   $status (string) - The status of the DoH connection
preferences-doh-status = 状态: { $status }
# Variables:
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-resolver = 提供器: { $name }
# This is displayed instead of $name in preferences-doh-resolver
# when the DoH URL is not a valid URL
preferences-doh-bad-url = 病人 URL
preferences-doh-steering-status = 使用本地的提供器

preferences-doh-status-active = 活跃的
preferences-doh-status-disabled = 关闭
# Variables:
#   $reason (string) - A string representation of the reason DoH is not active. For example NS_ERROR_UNKNOWN_HOST or TRR_RCODE_FAIL.
preferences-doh-status-not-active = 不活跃的 ({ $reason })

preferences-doh-group-message2 = 启用 DNS 结束 HTTPS 使用:

preferences-doh-expand-section =
  .tooltiptext = 更多信息

preferences-doh-setting-default =
  .label = 默认保护
  .accesskey = D
preferences-doh-default-desc = { -brand-short-name } 决定何时到使用无虑的 DNS 到防卫你的隐私.
preferences-doh-default-detailed-desc-1 = 使用无虑的 DNS 在区哪里它是可利用的
preferences-doh-default-detailed-desc-2 = 使用你的默认 DNS 裁决器如果那里是一个问题与那无虑的 DNS 提供器
preferences-doh-default-detailed-desc-3 = 使用一个本地的提供器, 如果可能的
preferences-doh-default-detailed-desc-4 = 转弯关闭何时 VPN, 父母亲的控制, 或企业政策是活跃的
preferences-doh-default-detailed-desc-5 = 转弯关闭何时一个网络告诉 { -brand-short-name } 它不应该使用无虑的 DNS

preferences-doh-setting-enabled =
  .label = 增强的保护
  .accesskey = I
preferences-doh-enabled-desc = 你控制何时到使用无虑的 DNS 和选取你的提供器.
preferences-doh-enabled-detailed-desc-1 = 使用那提供器你选择
preferences-doh-enabled-detailed-desc-2 = 仅使用你的默认 DNS 裁决器如果那里是一个问题与无虑的 DNS

preferences-doh-setting-strict =
  .label = 最大保护
  .accesskey = M
preferences-doh-strict-desc = { -brand-short-name } 将总是使用无虑的 DNS. 你将看见一个安全冒险警告在...之前我们使用你的系统 DNS.
preferences-doh-strict-detailed-desc-1 = 仅使用那提供器你选择
preferences-doh-strict-detailed-desc-2 = 总是警告如果无虑的 DNS 不是可利用的
preferences-doh-strict-detailed-desc-3 = 如果无虑的 DNS 是不可利用的位置将不加载或功能适当地

preferences-doh-setting-off =
  .label = 关闭
  .accesskey = O
preferences-doh-off-desc = 使用你的默认 DNS 裁决器

preferences-doh-select-resolver = 选取提供器:

preferences-doh-manage-exceptions =
    .label = 管理例外…
    .accesskey = x

preferences-doh-overview-default =
    .label = 默认保护
    .description = 使用无虑的 DNS 在区哪里它是可利用的.

preferences-doh-overview-custom =
    .label = 定制
    .description = 总是使用无虑的 DNS 与控制结束你的提供器和撤退行为.

preferences-doh-overview-off =
    .label = 关闭
    .description = 使用你的默认 DNS 裁决器.

preferences-doh-advanced-button =
    .label = 在前的设置

preferences-doh-advanced-section =
    .label = 在前的设置
    .description = 域名称系统结束 HTTPS (卫生部) 加密位置查找如此它是更难的为了你的因特网提供器或其他的到看见什么网站（全球资讯网的主机站）你是关于到拜访.

preferences-doh-manage-exceptions2 =
    .label = 管理例外
    .accesskey = x

preferences-doh-radio-default =
    .label = 默认
    .description = 使用无虑的 DNS 在区哪里它是可利用的

preferences-doh-radio-custom =
    .label = 定制
    .description = 总是使用无虑的 DNS 与控制结束你的提供器和撤退行为

preferences-doh-radio-off =
    .label = 关闭
    .description = 使用你的默认 DNS 裁决器

preferences-doh-fallback-label =
    .label = 总是警告我如果无虑的 DNS 不是可利用的

preferences-doh-status-item-off =
    .message = DNS 结束 HTTPS 是关闭

# Variables:
#   $reason (string) - A string representation of the reason DoH is not active. For example NS_ERROR_UNKNOWN_HOST or TRR_RCODE_FAIL.
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-status-item-not-active =
    .message = DNS 结束 HTTPS 是不工作因为我们遇到一个错误 ({ $reason }) 一会儿尝试到使用那提供器 { $name }


# Variables:
#   $reason (string) - A string representation of the reason DoH is not active. For example NS_ERROR_UNKNOWN_HOST or TRR_RCODE_FAIL.
preferences-doh-status-item-not-active-bad-url =
    .message = DNS 结束 HTTPS 是不工作因为我们被一般承认的一个病人 URL ({ $reason })


# Variables:
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-status-item-active =
    .message = DNS 结束 HTTPS 是使用那提供器 { $name }

# Variables:
#   $reason (string) - A string representation of the reason DoH is not active. For example NS_ERROR_UNKNOWN_HOST or TRR_RCODE_FAIL.
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-status-item-not-active-local =
    .message = DNS 结束 HTTPS 是不工作因为我们遇到一个错误 ({ $reason }) 一会儿尝试到使用那本地的提供器 { $name }

# Variables:
#   $name (string) - The name of the DNS over HTTPS resolver. If a custom resolver is used, the name will be the domain of the URL.
preferences-doh-status-item-active-local =
    .message = DNS 结束 HTTPS 是使用那本地的提供器 { $name }

preferences-doh-select-resolver-label =
    .label = 选取提供器:

# Variables:
#   $name (String) - Display name or URL for the DNS over HTTPS provider
connection-dns-over-https-url-item =
    .label = { $name }
    .tooltiptext = 使用这提供器为了解析 DNS 结束 HTTPS

preferences-doh-custom-provider-label =
    .aria-label = Enter 一个定制提供器 URL

preferences-doh-header2 =
  .heading = DNS 结束 HTTPS

## Connection and software security section

preferences-connection-header =
    .heading = 连接和软设备安全

preferences-connection-link-section =
    .label = 连接和软设备安全
    .description = 看见如何连接停留无虑的, 有害的软设备是阻止, 和网站（全球资讯网的主机站）是已查清的.

preferences-connection-link-button =
    .label = 在前的设置

## The following strings are used in the Download section of settings

desktop-folder-name = 桌面
downloads-folder-name = 下载

## Appearance page

preferences-appearance-header =
    .heading = 外观

browser-theme-group =
    .label = 浏览器主题
    .description = 风格 { -brand-short-name } 你的方式. 主题颜色应用到工具栏, 菜单, 和报文.

browser-theme-manage-link =
    .label = 管理 { -brand-short-name } 主题

related-settings-group =
    .label = 讲述的设置

related-settings-accessibility-link =
    .label = 定制缩放和字体设置在易接近

related-settings-home-link =
    .label = 定制 { -firefox-home-brand-name }

related-settings-tabs-browsing-link =
    .label = 定制浏览器页面布局

## Accessibility page

preferences-accessibility-header =
    .heading = 易接近

preferences-default-zoom-select =
    .aria-label = 默认缩放

preferences-fonts-family =
    .label = 字体家庭
    .accesskey = D

preferences-fonts-size =
    .label = 字体大小
    .accesskey = s

preferences-fonts-advanced-settings =
    .label = 在前的设置
    .accesskey = A

browsing-use-autoscroll =
    .label = 使用 autoscrolling
    .accesskey = a

keyboard-and-scrolling-group =
  .label = 键盘航行和卷动

motion-and-link-group =
  .label = 移动和连接款式

## AI controls page

preferences-ai-controls-header3 =
    .heading = AI 控制

preferences-ai-controls-description = 你总是有一个选择在 { -brand-short-name }, 包含是否到使用特性增大的与 AI. 更多控制来临不久.

preferences-ai-controls-block-ai-label = 阻止 AI 增强
preferences-ai-controls-block-ai =
    .label = { preferences-ai-controls-block-ai-label }
preferences-ai-controls-block-ai-description = 组成块低劣的你将不看见新的或当前的 AI 增强在 { -brand-short-name }, 或出现点-ups 关于他们. <a data-l10n-name="link">获得更多详细数据</a> 关于什么是包含的和如何到控制传统的机器学习特性, 相似的搜索提议和推荐.

preferences-ai-controls-blocked-message =
    .message = 新的和当前的 AI 增强是阻止默认情况下. 到解锁一个特效药特性, 使用那控制在下面.

preferences-ai-controls-on-device-group =
    .label = 在-device AI
    .description = 这些使用小的 AI 模型那下载到你的装置如果你使用那特性. 这接近帮忙防卫你的隐私.

preferences-ai-controls-translations-control =
    .label = 转换
    .description = 无空隙地浏览那网在你的首选的语言.
preferences-ai-controls-translations-more-link = 更多转换设置

preferences-ai-controls-pdfjs-control =
    .label = 图象更换电文在 { -brand-short-name } PDF 观察者
    .description = 何时你添加图象到概率分部函数, 这添加描述到使他们易接近的.

preferences-ai-controls-tab-group-suggestions-control =
    .label = Tab 创建组提议
    .description = 获得提议到名称和组织你的标签页.

preferences-ai-controls-key-points-control =
    .label = 键点在连接预览
    .description = 看见一个新长出的肉摘要在...之前打开一个连接.

preferences-ai-controls-sidebar-chatbot-group =
    .label = AI chatbot 提供器在其他选项
    .description = 保持一个 chatbot 在查看作为你浏览. 选取从人类的克劳德（男子名）, ChatGPT, 副驾驶员, 谷歌双胎, 和小于或等于闲谈密史脱拉风.

preferences-ai-controls-sidebar-chatbot-control =
    .label = Chatbot 在其他选项

# This option means that a user will see the feature and can use it.
preferences-ai-controls-state-available =
    .label = 可利用的
# This option means a user has opted in to use the feature.
preferences-ai-controls-state-enabled =
    .label = 启用
# This option means the user won't see and can't use the feature. For on-device AI, any models already downloaded are removed.
preferences-ai-controls-state-blocked =
    .label = 阻止

preferences-ai-controls-state-description-before = 什么那选项低劣的:
preferences-ai-controls-state-description-available = <strong>可利用的:</strong> 你将看见那特性和能使用它.
preferences-ai-controls-state-description-enabled = <strong>启用:</strong> 你有选择在到使用那特性.
preferences-ai-controls-state-description-blocked = <strong>阻止:</strong> 你将不看见和不能使用那特性. 为了在-device AI, 任何的模型已经将（程序是离开的.

preferences-ai-controls-block-confirmation-heading = 阻止 AI 增强?
preferences-ai-controls-block-confirmation-description = 你将不看见新的或当前的 AI 增强在 { -brand-short-name }, 或出现点-ups 关于他们. 然后, 你能解锁任何事你想要到保持使用.

preferences-ai-controls-block-confirmation-features-start = 什么将是阻止:
preferences-ai-controls-block-confirmation-translations = 转换
preferences-ai-controls-block-confirmation-pdfjs = 图象更换电文在 { -brand-short-name } PDF 观察者
preferences-ai-controls-block-confirmation-tab-group-suggestions = Tab 创建组提议
preferences-ai-controls-block-confirmation-key-points = 键点在连接预览
preferences-ai-controls-block-confirmation-sidebar-chatbot = Chatbot 提供器在其他选项
preferences-ai-controls-block-confirmation-features-after = 组成块也影响扩展名那使用 AI 倘若由 { -brand-short-name }.

preferences-ai-controls-block-confirmation-cancel =
    .label = 取消
preferences-ai-controls-block-confirmation-confirm =
    .label = 阻止

## Privacy and security status card

security-privacy-status-ok-header = { -brand-short-name } 是在守卫者

# This is the header above a section telling the user about problems in their settings
security-privacy-status-problem-header = { -brand-short-name } 推荐一些安全进步
security-privacy-status-ok-label = 增强跟踪保护是在
security-privacy-status-problem-label = 我们发现设置感人的你的保护
security-privacy-status-problem-helper-label = 查看发行
security-privacy-status-pending-trackers-label = 有…相貌的向上的如何多数追踪者 { -brand-short-name } 阻止结束那最后月

# This label tells the user how many trackers we have blocked for them.
# Variables:
#   $trackerCount (Number) - Number of trackers we have blocked in the last month
security-privacy-status-trackers-label = { $trackerCount ->
      [one] { $trackerCount } 追踪者阻止结束那最后月
      *[other] { $trackerCount } 追踪者阻止结束那最后月
  }
# This string appears under "Enhanced Tracking Protection is on" when a user has enabled "Strict" in Enhanced Tracking Protection advanced settings
security-privacy-status-strict-enabled-label = 你有 <a data-l10n-name="strict-tracking-protection">严厉的保护</a>
# This string appears under "Enhanced Tracking Protection is on" when a user has enabled "Custom" in Enhanced Tracking Protection advanced settings
security-privacy-status-custom-enabled-label = 你有 <a data-l10n-name="custom-tracking-protection">定制保护</a>
security-privacy-status-up-to-date-label = 你有获得那最近的, 安全的版本的 { -brand-short-name }
security-privacy-status-update-needed-label = 一个新版本的 { -brand-short-name } 是可利用的.
security-privacy-status-update-error-label = { -brand-short-name } 是财产烦恼校正它本身
security-privacy-status-update-checking-label = { -brand-short-name } 是检查的为了更新
security-privacy-status-update-needed-description = 更新为了那最近的中央处理机速度设置程序, 安定, 和安全更新.
security-privacy-status-update-button-label =
  .label = 更新 { -brand-short-name }

security-privacy-image-warning =
  .alt = 一个盾与一个惊呼标志, 表达关心结束你的安全警告
security-privacy-image-ok =
  .alt = 一个盾与一个复选标志, 显示那你有无杰出的安全发行

security-privacy-issue-card =
  .heading = 安全警告
issue-card-reset-button =
  .label = 重置
issue-card-dismiss-button =
  .tooltiptext = 解散
  .aria-label = 解散

## Enhanced Tracking Protection (ETP) status section

preferences-etp-status-header =
    .label = 增大的跟踪保护
    .description = 位置使用追踪者到跟随你联机和显示爬行的精确定义系统. { -brand-short-name } 盾你作为你浏览, 组成块追踪者自动地如此你是在控制的你的数字踪迹.

preferences-etp-level-standard =
    .label = 标准 (默认)
    .description = 强壮的, 可靠的保护那工作平滑地与最多网站（全球资讯网的主机站）.

preferences-etp-level-strict =
    .label = 严厉的
    .description = 强劲的保护那阻止更多追踪者, 除了可以引起一些位置到中断.

preferences-etp-level-custom =
    .label = 定制
    .description = 选取哪个保护到使旋转在或关闭.

preferences-etp-status-advanced-button =
    .label = 在前的设置

preferences-etp-status-protections-dashboard-link =
        .label = 查看你的个人化的保护仪表板
        .description = 看见如何多数鬼祟的追踪者 { -brand-short-name } 有阻止为了你, 包含社会的媒质追踪者, fingerprinters, 和 cryptominers.

preferences-etp-header =
    .heading = 增大的跟踪保护

preferences-etp-advanced-settings-group =
    .label = 在前的设置
    .description = 位置使用追踪者到跟随你联机和显示爬行的精确定义系统. { -brand-short-name } 盾你作为你浏览, 组成块最多追踪者自动地如此你是在控制的你的数字踪迹.

preferences-etp-customize-button =
    .label = 定制跟踪保护

preferences-etp-reload-tabs-hint =
    .message = 再装你的标签页以应用这些更改.
preferences-etp-reload-tabs-hint-button =
  .label = 再装所有的标签页

preferences-etp-rfp-warning-message =
    .message = 你是使用抵抗指纹法 (RFP), 哪个代替一些的 { -brand-short-name }'s 指纹法保护设置. 这可能引起一些位置到中断.

preferences-etp-level-warning-message =
    .heading = 头抬起! 一些位置可以不工作作为预期的.
    .message = 一些位置建立追踪者进入...之内他们的特性或内容. 何时 { -brand-short-name } 阻止他们, 那位置一看坏掉的. 尝试使用“修复位置发行”或旋转关闭跟踪保护在那位置.

preferences-etp-manage-exceptions-button =
    .label = 管理例外
    .description = 管理网站（全球资讯网的主机站）哪里增强跟踪保护是禁用.

preferences-etp-customize-header =
    .heading = 定制跟踪保护

preferences-etp-reset =
    .label = 重置定制
    .description = 回复设置到一个边框形式保护级别.

preferences-etp-reset-standard-button =
    .label = 重置到标准

preferences-etp-reset-strict-button =
    .label = 重置到严厉的

preferences-etp-custom-control-group =
    .label = 跟踪保护
    .description = 选取哪个保护到使旋转在或关闭.

preferences-etp-custom-cookies-enabled =
    .label = 饼干

preferences-etp-custom-cookie-behavior =
    .aria-label = 饼干

preferences-etp-custom-cookie-behavior-accept-all =
    .label = 允许所有的饼干
preferences-etp-custom-cookie-behavior-block-cross-site-cookies =
    .label = 阻止交叉-site 饼干
preferences-etp-custom-cookie-behavior-isolate-cross-site-cookies =
    .label = 使隔离交叉-site 饼干
preferences-etp-custom-cookie-behavior-block-unvisited =
    .label = 阻止饼干从 unvisited 网站（全球资讯网的主机站）
preferences-etp-custom-cookie-behavior-block-all-cross-site-cookies =
    .label = 阻止所有的交叉-site 饼干 (可以引起网站（全球资讯网的主机站）到中断)
preferences-etp-custom-cookie-behavior-block-all =
    .label = 阻止所有的饼干 (将引起网站（全球资讯网的主机站）到中断)

preferences-etp-custom-tracking-protection-enabled =
    .label = 跟踪内容

preferences-etp-custom-tracking-protection-enabled-context =
    .aria-label = 跟踪内容

preferences-etp-custom-crypto-mining-protection-enabled =
    .label = Cryptominers

preferences-etp-custom-known-fingerprinting-protection-enabled =
    .label = 已知的 fingerprinters

preferences-etp-custom-suspect-fingerprinting-protection-enabled =
    .label = 有嫌疑的 fingerprinters

preferences-etp-custom-suspect-fingerprinting-protection-enabled-context =
    .aria-label = 有嫌疑的 fingerprinters

## Warnings section

security-privacy-issue-warning-fingerprinters =
  .label = 已知的 fingerprinters 是不阻止
  .description = 这可以允许一些追踪者到跟随你没有饼干.

security-privacy-issue-warning-third-party-cookies =
  .label = 第三-party 饼干是启用
  .description = 第三-party 饼干是使用到跟踪你越过网站（全球资讯网的主机站）.

security-privacy-issue-warning-password-manager =
  .label = 密码管理器是禁用
  .description = 密码管理器帮忙你存储器操作强壮的密码为了你的帐户.

security-privacy-issue-warning-popup-blocker =
  .label = 跃上型阻滞物是禁用
  .description = 跃上型是中断的和可能地有害的.

security-privacy-issue-warning-extension-install =
  .label = 网站（全球资讯网的主机站）能安装扩展名
  .description = 网站（全球资讯网的主机站）能安装扩展名到 { -brand-short-name } 没有请求.

security-privacy-issue-warning-safe-browsing =
  .label = 危险的和迷惑的内容是不阻止
  .description = 你的暴露到骗局和恶意软件从网站（全球资讯网的主机站）是增强的.

security-privacy-issue-warning-doh =
  .label = DNS 结束 HTTPS 是禁用
  .description = DNS 结束 HTTPS 隐藏什么位置你拜访从你的网络提供器.

security-privacy-issue-warning-ech =
  .label = 加密客户喂是禁用
  .description = 加密客户喂隐藏什么位置你拜访从你的网络提供器.

security-privacy-issue-warning-proxy-autodetection =
  .label = 代理汽车-configuration 是启用
  .description = 代理汽车-configuration 能够让非置信的网络到监视器你的活动.


session-restore-learn-more = 什么如果它做不工作?

## Vantage preferences

# Sidebar
pane-librewolf-title = 优势
category-librewolf =
    .tooltiptext = 关于:显示配置信息命令更改, 逻辑化合的和容易地易接近的

# Main content
# About Vantage
vantage-about-heading = 关于优势
vantage-about-version = 版本 { $version }
vantage-about-update-checking = 检查的为了更新…
vantage-about-update-available = 一个新版本是可利用的—访问官方网站到下载
vantage-about-up-to-date = 你是已是最新

vantage-update-heading = 更新
vantage-update-checkbox =
    .label = 自动地复选为了更新
vantage-theme-checkbox =
    .label = 启用优势主题 (需要浏览器重新启动)
vantage-theme-description = 书写器那优势主题到你的提问档, 加法的圆形的工具栏和标签页为了一个现代人一看. 需要一个浏览器重新启动到采取效果. 笔记: 一些第三-party 主题可以推翻这些视觉的风格—这仅影响外观, 不浏览器功能性.

vantage-update-description = 复选为了新的版本的优势在启动. 你将是通知何时一个新版本是可利用的, 除了更新将不是安装自动地.

vantage-ai-heading = AI 其他选项
vantage-ai-checkbox =
    .label = 启用 AI 其他选项
vantage-ai-description = 打开 AI chatbots 在那其他选项. 支持 DeepSeek, Qwen, Doubao, ChatGPT, 双胎, 和克劳德（男子名）. 你的会话去直接的到那提供器—优势做不收集或进程任何的论据.

librewolf-header = 优势首选项
librewolf-warning-title = 头抬起!
librewolf-warning-description = 我们小心地选取默认设置到焦点在隐私和安全. 何时更改这些设置, 读取那描述到理解那牵连的那些更改.

# Page Layout
librewolf-general-heading = 浏览器行为
librewolf-extension-update-checkbox =
    .label = 更新添加-ons 自动地
librewolf-sync-checkbox =
    .label = 启用火狐同步的
librewolf-autocopy-checkbox =
    .label = 启用中央单击粘贴
librewolf-styling-checkbox = 
    .label = 允许 userChrome.css 定制

librewolf-network-heading = 连网
librewolf-ipv6-checkbox =
    .label = 启用改造的6

librewolf-privacy-heading = 隐私
librewolf-webrtc-ip-checkbox =
    .label = 界限 WebRTC 本地的 IP 暴露
librewolf-webrtc-ip-description = 限制 WebRTC 到使用仅那默认网络接口, 预防本地的 IP 地址漏洞.
librewolf-font-vis-checkbox =
    .label = 界限字体可见性
librewolf-font-vis-description = 仅使暴露基准系统字体到网站（全球资讯网的主机站）, 预防字体指纹法. 做不影响如何字体是已渲染的在页.

librewolf-xorigin-ref-checkbox =
    .label = 界限交叉-origin 推荐人

librewolf-broken-heading = 指纹法
librewolf-webgl-checkbox =
    .label = 启用 WebGL
librewolf-rfp-checkbox =
    .label = 启用 ResistFingerprinting
librewolf-letterboxing-checkbox =
    .label = 启用（电影、电视等的）宽银幕式

librewolf-security-heading = 安全
librewolf-goog-safe-checkbox =
    .label = 启用谷歌保险箱浏览
librewolf-goog-safe-download-checkbox =
    .label = 网络软件目录下载

# In-depth descriptions
librewolf-extension-update-description = 保持扩展名已是最新没有人工的插入. 一个善行选择为了你的安全.
librewolf-extension-update-warning1 = 如果你不要检讨那代码的你的扩展名在...之前每一更新, 你应该启用这选项.

librewolf-ipv6-description = 允许 { -brand-short-name } 到连接使用改造的6.
librewolf-ipv6-warning1 = 作为替代的组成块改造的6 在浏览器中, 我们提议有可能那改造的6 隐私扩展名在你的 OS.
librewolf-sync-description = 同步的你的论据与其他的浏览器. 需要重新启动.
librewolf-sync-warning1 = 火狐同步的加密论据地方性地在...之前传递它到那服务器.

librewolf-autocopy-description = 选择一些电文到复制它, 然后粘贴它与一个中央-mouse 单击.

librewolf-download-tmp-checkbox =
    .label = 保存下载到临时目录
librewolf-download-tmp-description = 何时启用: 将（程序文件是保存到那系统临时目录和自动地（使）清洁向上的何时那浏览器关闭, 预防论据痕迹.
librewolf-download-tmp-warning1 = 何时禁用: 文件是保存直接的到你的下载文件夹为了更简单访问. 笔记那将（程序文件可以离开可回复的痕迹偶数在...之后删除.

librewolf-tabs-heading = Tab 行为
librewolf-tabs-scroll-checkbox =
    .label = 滚动到开关标签页
librewolf-tabs-dblclick-checkbox =
    .label = 双精度型-click 到关闭标签页
librewolf-tabs-urlbar-checkbox =
    .label = 打开地址棒形图在新的标签页
librewolf-tabs-bookmarks-checkbox =
    .label = 打开书签在新的标签页
librewolf-tabs-search-checkbox =
    .label = 打开搜索在新的标签页
librewolf-tabs-ctrlTab-checkbox =
    .label = Ctrl+Tab by recent use

librewolf-styling-description = 何时启用: 定制那浏览器外观 (工具栏, 标签页, 及其他.) 经由一个 userChrome.css 文件. 理想为了在前的用户谁想要一个个人化的一看.
librewolf-styling-warning1 = 何时禁用: 使用那默认浏览器外观. 仅加载 CSS 主题从可信的来源—怀恶意的样式表能够截获命令你的输入.

librewolf-xorigin-ref-description = 何时启用: 仅发送来源页信息何时航行内部那相同的网站（全球资讯网的主机站）. 外部位置将不知道哪个页你过来从.
librewolf-xorigin-ref-warning1 = 何时禁用: 所有的网站（全球资讯网的主机站）能看见哪个页你过来从. 一些网站（全球资讯网的主机站）那需要推荐人证实可以中断何时这是启用.

librewolf-webgl-description = 何时启用: 网站（全球资讯网的主机站）能使用 WebGL 为了 3数据图形的, 除了它可以也是使用到识别你的装置 (指纹法).
librewolf-webgl-warning1 = 何时禁用: 较好的隐私, 除了网站（全球资讯网的主机站）使用 WebGL (3数据实用程序, 浏览器博弈) 可以不工作对.

librewolf-rfp-description = 何时启用: 隐藏浏览器阶 (筛选图形分辨率, 时区, 字体, 语言, 及其他.), 制造你看同一的到其他的用户. 很提高隐私.
librewolf-rfp-warning1 = 何时禁用: 你的浏览器阶是十分地暴露的, 制造你容易地可跟踪的. 一些网站（全球资讯网的主机站）信赖在这些为了标准运算.

librewolf-letterboxing-description = 何时启用: 窗口大小是圆形的到标准计算结果, 预防网站（全球资讯网的主机站）从跟踪你由你的窗口尺寸. 黑色棒形图可以出现在那旁边.
librewolf-letterboxing-warning1 = 何时禁用: 网站（全球资讯网的主机站）能使用你的窗口大小到帮助识别你. 需要 ResistFingerprinting 到是启用首先.

librewolf-goog-safe-description = 如果你是担心的关于恶意软件和网络仿冒, 考虑有可能它.
librewolf-goog-safe-warning1 = 禁用结束检查制度关心除了被推荐的为了最低成本估算与调度法在前的用户. 所有的那复选发生地方性地.

librewolf-goog-safe-download-description = 允许保险箱浏览到网络软件目录你的下载到识别可疑的文件.
librewolf-goog-safe-download-warning1 = 所有的那复选发生地方性地.

librewolf-signatures-checkbox =
    .label = 需要有符号的添加-奥运信息服务
librewolf-signatures-description = 何时启用: 仅添加-ons 有符号的由摩斯拉能是安装, 保护你从可能地怀恶意的扩展名.
librewolf-signatures-warning1 = 何时禁用: 无符号的添加-ons 能是安装, 哪个是有用的为了显影器测试他们的自己的扩展名. 行使警告与添加-ons 从未知物来源.

librewolf-pdfjs-scripting-checkbox =
    .label = 允许 Java描述语言（一种程序语言）在 PDF 观察者
librewolf-pdfjs-scripting-description = 何时启用: PDF 文件能执行 Java描述语言（一种程序语言）, 有可能交互表单和动态的内容. 一些 PDF 表单需要这到功能对.
librewolf-pdfjs-scripting-warning1 = 何时禁用: Java描述语言（一种程序语言）执行在 PDF 文件是阻止, 保护你从 PDF-based 攻击. 最多 PDF 文档将仍然显示器对.

# Footer
librewolf-footer = 有用的连接
librewolf-config-link = 所有的在前的设置 (关于:显示配置信息命令)
librewolf-open-profile = 发现并修理故障信息 (关于:支持)

librewolf-debug = 除错添加-奥运信息服务
vantage-privacy-dashboard-link = 隐私仪表板

content-blocking-section-top-level-description = 优势支持和启用增强跟踪保护在严格模式下默认情况下. 这是最重要的要点设置在浏览器中, 作为它提供状态分区, 严厉的 blocklists, 和其他的 (色彩、音调、措词、意味、香韵、感情等)有细微差别的隐私功能. 我们不推荐更改到不同的模式.

vantage-nova-checkbox =
    .label = 启用诺瓦计算机接口
vantage-nova-description = 诺瓦计算机是那新的火狐 153 外观 (圆形的标签页, 漂浮的工具栏). 何时启用, 那优势主题开关到它的诺瓦计算机-adapted 颜色 (蓝色-green 倾斜度标题棒形图). 采取效果直接地.

# Profile backup & restore
vantage-backup-heading = 提问档倒车 & 回复
vantage-backup-description = 导出你的提问档 (书签, 历史记录, 扩展名, 设置) 作为一个 ZIP 挡案库, 或回复从一个倒车. 恢复的改写当前配置和重新启动那浏览器.
vantage-backup-export-button = 导出倒车…
vantage-backup-export-title = 导出提问档倒车
vantage-backup-export-success = 提问档出口成功.
vantage-backup-export-fail = 导出失败的: { $error }
vantage-backup-import-button = 回复从倒车…
vantage-backup-import-title = 回复提问档从倒车
vantage-backup-import-invalid = 那被选的文件是不一个有确实根据的优势提问档倒车.
vantage-backup-import-invalid-path = 那倒车包含违法的路径和曾是被弃之物.
vantage-backup-import-confirm-title = 回复提问档
vantage-backup-import-confirm = 这将改写你的当前的配置 (书签, 历史记录, 设置, 扩展名) 和重新启动那浏览器. 一个倒车的你的当前的提问档是创建自动地. 继续?
vantage-backup-import-backup-fail = 失败的到自动地回向上的当前提问档: { $error }
vantage-backup-import-locked = 一些文件是上锁的和能够不是取代 ({ $files }...). 请关闭那浏览器和回复再一次. 你的早先的提问档倒车是保险箱.
vantage-backup-import-done = 提问档精力充沛的. 那浏览器将重启现在.

vantage-backup-export-confirm-title = 导出提问档倒车
vantage-backup-export-confirm = 那倒车将包含敏感的论据: 饼干 (网站（全球资讯网的主机站）注册(程序) 会话), 浏览历史, 保存表单论据和网站（全球资讯网的主机站）论据. 注册(程序) 密码是排除为了你的安全. 请存储器操作那倒车文件安全地和从不部分它. 继续?


vantage-download-speed-heading = 下载加速（实验功能）
vantage-download-mt-checkbox =
    .label = 启用多-threaded 下载
vantage-download-mt-description = 何时启用: 文件从服务器那支持量程请求是将（程序在并联段和合并, 超速行驶向上的大的下载. 禁用如果下载失败在确定的网站（全球资讯网的主机站）.
vantage-download-maxparts-label = 最大值连接:
vantage-download-maxparts-warning = 更多比 8 连接可以是比率-limited 或阻止由一些网站（全球资讯网的主机站）.
vantage-download-minsize-label = 最小值文件大小为了多-穿线:
vantage-download-tmpdir-label = 部分高速缓冲存储器目录:
vantage-download-tmpdir-browse = 浏览…
vantage-download-tmpdir-hint = 许可空到使用那系统临时目录. 选取一个位置与充足自由的空白为了大的下载.
vantage-download-tmpdir-picker-title = 选取部分高速缓冲存储器目录
vantage-doh-checkbox =
    .label = 启用 DNS 结束 HTTPS (卫生部)
vantage-doh-description = 何时启用: DNS 查询是加密和下定决心的穿越 AliDNS. 落下回到系统 DNS 何时卫生部是得不到的, 如此内联网和 VPN 访问保持工作.
librewolf-tabs-unload-checkbox =
    .label = 睡眠非活动的标签页在...之下存储器压

vantage-download-resume-checkbox =
    .label = 恢复中断的下载
vantage-download-resume-description = 何时启用: 如果下载是被中断在它完成之前(例如, 浏览器被关闭), 点击“重试”继续它从它离开的地方而不是下载整个文件再次. 仅应用何时多-连接下载是启用的.


vantage-download-cancelkeep-checkbox =
    .label = 取消时保留数据（可暂停并恢复）
vantage-download-cancelkeep-description = 何时启用: 取消一个活跃的下载会暂停它并保留已经下载的数据, 因此你能在任何时候从它被中断的地方恢复它. 何时停用: 取消移除部分数据, 像标准下载管理器(因关闭浏览器或崩溃被中断的下载仍能在重新启动之后被恢复). 仅应用何时恢复中断的下载是启用的.
vantage-download-minsize-description = 文件比这尺寸小是被下载与一个单独的连接(分开他们仅会使他们更慢). 更大的文件是被分割成多份并行下载, 最多到最大连接设置在上面.
