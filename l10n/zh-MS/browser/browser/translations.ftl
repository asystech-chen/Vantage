# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# The button for "Firefox Translations" in the url bar. Note that here "Beta" should
# not be translated, as it is a reflection of the un-localized BETA icon that is in the
# panel.
urlbar-translations-button2 =
  .tooltiptext = 转换此页面 - Beta

# Note that here "Beta" should not be translated, as it is a reflection of the
# un-localized BETA icon that is in the panel.
urlbar-translations-button-intro =
  .tooltiptext = 在 { -brand-shorter-name } 中尝试私人转换 - Beta

# If your language requires declining the language name, a possible solution
# is to adapt the structure of the phrase, or use a support noun, e.g.
# `Page translated from: { $fromLanguage }. Current target language: { $toLanguage }`
#
# Variables:
#   $fromLanguage (string) - The original language of the document.
#   $toLanguage (string) - The target language of the translation.
urlbar-translations-button-translated =
  .tooltiptext = 页面已从 { $fromLanguage } 转换为 { $toLanguage }

urlbar-translations-button-loading =
  .tooltiptext = 转换正在处理之中…

translations-panel-settings-button =
  .aria-label = 管理您的转换设置

## Options in the Firefox Translations settings.

translations-panel-settings-manage-languages =
  .label = 管理您的语言
translations-panel-settings-about2 =
  .label = 关于 { -brand-shorter-name } 中的转换功能

# Text displayed for the option to always translate a given language
# Variables:
#   $language (string) - The localized display name of the detected language
translations-panel-settings-always-translate-language =
  .label = 始终转换 { $language }
translations-panel-settings-always-translate-unknown-language =
  .label = 始终转换此语言
translations-panel-settings-always-offer-translation =
  .label = 始终提供转换选项

# Text displayed for the option to never translate a given language
# Variables:
#   $language (string) - The localized display name of the detected language
translations-panel-settings-never-translate-language =
  .label = 始终不转换 { $language }
translations-panel-settings-never-translate-unknown-language =
  .label = 始终不转换此语言

# Text displayed for the option to never translate this website
translations-panel-settings-never-translate-site =
  .label = 始终不转换此网站

## The translation panel appears from the url bar, and this view is the default
## translation view.

translations-panel-header = 是否转换此页面？
translations-panel-translate-button =
  .label = 转换
translations-panel-translate-button-loading =
  .label = 正在处理您的请求，请稍候…
translations-panel-translate-cancel =
  .label = 取消
translations-panel-learn-more-link = 了解更多

translations-panel-intro-header = 在 { -brand-shorter-name } 中尝试私人转换
translations-panel-intro-description = 为保障您的隐私，转换操作绝不会离开您的设备。新语言和改进功能即将推出！

translations-panel-error-translating = 转换过程中发生错误。请您重新尝试。
translations-panel-error-load-languages = 无法加载语言
translations-panel-error-load-languages-hint = 请您检查您的互联网连接并重新尝试。
translations-panel-error-load-languages-hint-button =
  .label = 重新尝试

translations-panel-error-unsupported = 此页面不具备转换可用性
translations-panel-error-dismiss-button =
  .label = 已了解
translations-panel-error-change-button =
  .label = 更改源语言
# If your language requires declining the language name, a possible solution
# is to adapt the structure of the phrase, or use a support noun, e.g.
# `Sorry, we don't support translations from this language yet: { $language }
#
# Variables:
#   $language (string) - The language of the document.
translations-panel-error-unsupported-hint-known-2 = 很抱歉，我们不支持从 { $language } 进行转换，此功能尚未启用。
translations-panel-error-unsupported-hint-unknown-2 = 很抱歉，我们不支持从该语言进行转换，此功能尚未启用。

## Each label is followed, on a new line, by a dropdown list of language names.
## If this structure is problematic for your locale, an alternative way is to
## translate them as `Source language:` and `Target language:`

translations-panel-from-label = 从以下语言转换
translations-panel-to-label = 转换为以下语言

## The translation panel appears from the url bar, and this view is the "restore" view
## that lets a user restore a page to the original language, or translate into another
## language.

# If your language requires declining the language name, a possible solution
# is to adapt the structure of the phrase, or use a support noun, e.g.
# `The page is translated from: { $fromLanguage }. Current target language: { $toLanguage }`
#
# Variables:
#   $fromLanguage (string) - The original language of the document.
#   $toLanguage (string) - The target language of the translation.
translations-panel-revisit-header = 此页面已从 { $fromLanguage } 转换为 { $toLanguage }
translations-panel-choose-language =
  .label = 请您选择一种语言
translations-panel-restore-button =
  .label = 显示原始页面

## Firefox Translations language management in about:preferences.
translations-manage-header = 翻译管理
translations-manage-settings-button =
    .label = 设置…
    .accesskey = t
translations-manage-intro-2 = 请设定您的语言及站点翻译偏好设置，并管理已下载以供离线翻译的语言。
translations-manage-download-description = 下载语言以进行离线翻译
translations-manage-language-download-button =
    .label = 下载
translations-manage-language-download-all-button =
    .label = 全部下载
    .accesskey = D
translations-manage-language-remove-button =
    .label = 移除
translations-manage-language-remove-all-button =
    .label = 全部移除
    .accesskey = e
translations-manage-error-download = 在下载语言文件时发生了一个问题。请您重新尝试。
translations-manage-error-remove = 在移除语言文件时发生了一个错误。请您重新尝试。
translations-manage-error-list = 未能获取可用于翻译的语言列表。请您刷新页面以重新尝试。

translations-settings-title =
    .title = 翻译设置
    .style = min-width: 36em
translations-settings-close-key =
    .key = w
translations-settings-always-translate-langs-description = 对于以下语言，翻译将自动进行
translations-settings-never-translate-langs-description = 对于以下语言，将不提供翻译服务
translations-settings-never-translate-sites-description = 对于以下站点，将不提供翻译服务
translations-settings-languages-column =
    .label = 语言
translations-settings-remove-language-button =
    .label = 移除语言
    .accesskey = R
translations-settings-remove-all-languages-button =
    .label = 移除所有语言
    .accesskey = e
translations-settings-sites-column =
    .label = 网站
translations-settings-remove-site-button =
    .label = 移除站点
    .accesskey = S
translations-settings-remove-all-sites-button =
    .label = 移除所有站点
    .accesskey = m
translations-settings-close-dialog =
    .buttonlabelaccept = 关闭
    .buttonaccesskeyaccept = C

# Text displayed in the right-click context menu for translating
# selected text to a yet-to-be-determined language.
main-context-menu-translate-selection =
    .label = 翻译所选内容…
    .accesskey = n

# Text displayed in the right-click context menu for translating
# selected text to a target language.
#
# Variables:
#   $language (string) - The localized display name of the target language
main-context-menu-translate-selection-to-language =
    .label = 将所选内容翻译为{ $language }
    .accesskey = n

# Text displayed in the right-click context menu for translating
# the text of a hyperlink to a yet-to-be-determined language.
main-context-menu-translate-link-text =
    .label = 翻译链接文本…
    .accesskey = n

# Text displayed in the right-click context menu for translating
# the text of a hyperlink to a target language.
#
# Variables:
#   $language (string) - The localized display name of the target language
main-context-menu-translate-link-text-to-language =
    .label = 将链接文本翻译为{ $language }
    .accesskey = n

# Text displayed in the select translations panel header.
select-translations-panel-header = 翻译

# Text displayed above the from-language dropdown menu.
select-translations-panel-from-label = 来源

# Text displayed above the to-language dropdown menu.
select-translations-panel-to-label = 目标

# Text displayed above the try-another-source-language dropdown menu.
select-translations-panel-try-another-language-label = 请尝试其他来源语言

select-translations-panel-cancel-button =
    .label = 取消

# Text displayed on the copy button before it is clicked.
select-translations-panel-copy-button =
    .label = 复制

# Text displayed on the copy button after it is clicked.
select-translations-panel-copy-button-copied =
    .label = 已复制

select-translations-panel-done-button =
    .label = 完成

select-translations-panel-translate-full-page-button =
    .label = 翻译整页

select-translations-panel-translate-button =
    .label = 翻译

select-translations-panel-try-again-button =
    .label = 重新尝试

# Text displayed as a placeholder when the panel is idle.
select-translations-panel-idle-placeholder-text = 翻译后的文本将显示在此处。

# Text displayed as a placeholder when the panel is actively translating.
select-translations-panel-translating-placeholder-text = 正在翻译中…
select-translations-panel-init-failure-message =
    .message = 无法加载语言。请检查您的互联网连接并重试。

# Text displayed when the translation fails to complete.
select-translations-panel-translation-failure-message =
    .message = 翻译过程中存在问题。请重试。

# If your language requires declining the language name, a possible solution
# is to adapt the structure of the phrase, or use a support noun, e.g.
# `Sorry, we don't support translations from { $language } yet.
#
# Variables:
#   $language (string) - The language of the document.
select-translations-panel-unsupported-language-message-known-2 =
    .message = 很抱歉，我们尚不支持从 { $language } 进行翻译。
select-translations-panel-unsupported-language-message-unknown-2 =
    .message = 很抱歉，我们尚不支持从该语言进行翻译。

# Text displayed on the menuitem that opens the Translation Settings page.
select-translations-panel-open-translations-settings-menuitem =
    .label = 翻译设置

# An announcement made to assistive technology when the translation is complete
select-translations-panel-translation-complete-announcement = 翻译已完成


translations-panel-disable-translations =
  .label = 完全禁用翻译功能

translations-manage-enable = 
  .label = 启用以全页方式执行翻译操作
translations-manage-autopopup = 
  .label = 当页面不在浏览器的已配置语言范围内时，提示您进行翻译

# Text displayed in the right-click context menu for translating
# the current page.
main-context-menu-translate-page =
    .label = 翻译页面…
    .accesskey = T
