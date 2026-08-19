# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# The button for "Firefox Translations" in the url bar. Note that here "Beta" should
# not be translated, as it is a reflection of the un-localized BETA icon that is in the
# panel.
urlbar-translations-button2 =
  .tooltiptext = 转换这页 - 希腊字母表的第二个字母

# Note that here "Beta" should not be translated, as it is a reflection of the
# un-localized BETA icon that is in the panel.
urlbar-translations-button-intro =
  .tooltiptext = 尝试私人的转换在 { -brand-shorter-name } - 希腊字母表的第二个字母

# If your language requires declining the language name, a possible solution
# is to adapt the structure of the phrase, or use a support noun, e.g.
# `Page translated from: { $fromLanguage }. Current target language: { $toLanguage }`
#
# Variables:
#   $fromLanguage (string) - The original language of the document.
#   $toLanguage (string) - The target language of the translation.
urlbar-translations-button-translated =
  .tooltiptext = 页译本从 { $fromLanguage } 到 { $toLanguage }

urlbar-translations-button-loading =
  .tooltiptext = 转换在进步

translations-panel-settings-button =
  .aria-label = 管理转换设置

## Options in the Firefox Translations settings.

translations-panel-settings-manage-languages =
  .label = 管理语言
translations-panel-settings-about2 =
  .label = 关于转换在 { -brand-shorter-name }

# Text displayed for the option to always translate a given language
# Variables:
#   $language (string) - The localized display name of the detected language
translations-panel-settings-always-translate-language =
  .label = 总是转换 { $language }
translations-panel-settings-always-translate-unknown-language =
  .label = 总是转换这语言
translations-panel-settings-always-offer-translation =
  .label = 总是给予(物) 到转换

# Text displayed for the option to never translate a given language
# Variables:
#   $language (string) - The localized display name of the detected language
translations-panel-settings-never-translate-language =
  .label = 从不转换 { $language }
translations-panel-settings-never-translate-unknown-language =
  .label = 从不转换这语言

# Text displayed for the option to never translate this website
translations-panel-settings-never-translate-site =
  .label = 从不转换这位置

## The translation panel appears from the url bar, and this view is the default
## translation view.

translations-panel-header = 转换这页?
translations-panel-translate-button =
  .label = 转换
translations-panel-translate-button-loading =
  .label = 请等待…
translations-panel-translate-cancel =
  .label = 取消
translations-panel-learn-more-link = 学习更多

translations-panel-intro-header = 尝试私人的转换在 { -brand-shorter-name }
translations-panel-intro-description = 为了你的隐私, 转换从不许可你的装置. 新的语言和进步来临不久!

translations-panel-error-translating = 那里曾是一个问题翻译. 请试再一次.
translations-panel-error-load-languages = 不能加载语言
translations-panel-error-load-languages-hint = 复选你的因特网连接和尝试再一次.
translations-panel-error-load-languages-hint-button =
  .label = 尝试再一次

translations-panel-error-unsupported = 转换不是可利用的为了这页
translations-panel-error-dismiss-button =
  .label = 获得它
translations-panel-error-change-button =
  .label = 更改来源语言
# If your language requires declining the language name, a possible solution
# is to adapt the structure of the phrase, or use a support noun, e.g.
# `Sorry, we don't support translations from this language yet: { $language }
#
# Variables:
#   $language (string) - The language of the document.
translations-panel-error-unsupported-hint-known-2 = 难过的, 我们不要支持转换从 { $language } 还.
translations-panel-error-unsupported-hint-unknown-2 = 难过的, 我们不要支持转换从这语言还.

## Each label is followed, on a new line, by a dropdown list of language names.
## If this structure is problematic for your locale, an alternative way is to
## translate them as `Source language:` and `Target language:`

translations-panel-from-label = 转换从
translations-panel-to-label = 转换到

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
translations-panel-revisit-header = 这页是译本从 { $fromLanguage } 到 { $toLanguage }
translations-panel-choose-language =
  .label = 选取一个语言
translations-panel-restore-button =
  .label = 显示最初的

## Firefox Translations language management in about:preferences.

translations-manage-header = 转换
translations-manage-settings-button =
    .label = 设置…
    .accesskey = t
translations-manage-intro-2 = 日落你的语言和位置转换首选项和管理语言将（程序为了挂线转换.
translations-manage-download-description = 下载语言为了挂线转换
translations-manage-language-download-button =
    .label = 下载
translations-manage-language-download-all-button =
    .label = 下载所有的
    .accesskey = D
translations-manage-language-remove-button =
    .label = 移除
translations-manage-language-remove-all-button =
    .label = 移除所有的
    .accesskey = e
translations-manage-error-download = 那里曾是一个问题下装那语言文件. 请试再一次.
translations-manage-error-remove = 那里曾是一个错误拆迁那语言文件. 请试再一次.
translations-manage-error-list = 失败的到获得那列表的可利用的语言为了转换. 刷新那页到试再一次.

translations-settings-title =
    .title = 转换设置
    .style = min-width: 36媒体用毕符
translations-settings-close-key =
    .key = w
translations-settings-always-translate-langs-description = 转换将发生自动地为了那下列各项语言
translations-settings-never-translate-langs-description = 转换将不是提供为了那下列各项语言
translations-settings-never-translate-sites-description = 转换将不是提供为了那下列各项位置
translations-settings-languages-column =
    .label = 语言
translations-settings-remove-language-button =
    .label = 移除语言
    .accesskey = R
translations-settings-remove-all-languages-button =
    .label = 移除所有的语言
    .accesskey = e
translations-settings-sites-column =
    .label = 网站（全球资讯网的主机站）
translations-settings-remove-site-button =
    .label = 移除位置
    .accesskey = S
translations-settings-remove-all-sites-button =
    .label = 移除所有的位置
    .accesskey = m
translations-settings-close-dialog =
    .buttonlabelaccept = 关闭
    .buttonaccesskeyaccept = C

# Text displayed in the right-click context menu for translating
# selected text to a yet-to-be-determined language.
main-context-menu-translate-selection =
    .label = 转换选择…
    .accesskey = n

# Text displayed in the right-click context menu for translating
# selected text to a target language.
#
# Variables:
#   $language (string) - The localized display name of the target language
main-context-menu-translate-selection-to-language =
    .label = 转换选择到 { $language }
    .accesskey = n

# Text displayed in the right-click context menu for translating
# the text of a hyperlink to a yet-to-be-determined language.
main-context-menu-translate-link-text =
    .label = 转换连接电文…
    .accesskey = n

# Text displayed in the right-click context menu for translating
# the text of a hyperlink to a target language.
#
# Variables:
#   $language (string) - The localized display name of the target language
main-context-menu-translate-link-text-to-language =
    .label = 转换连接电文到 { $language }
    .accesskey = n

# Text displayed in the select translations panel header.
select-translations-panel-header = 转换

# Text displayed above the from-language dropdown menu.
select-translations-panel-from-label = 从

# Text displayed above the to-language dropdown menu.
select-translations-panel-to-label = 到

# Text displayed above the try-another-source-language dropdown menu.
select-translations-panel-try-another-language-label = 尝试另外的来源语言

select-translations-panel-cancel-button =
    .label = 取消

# Text displayed on the copy button before it is clicked.
select-translations-panel-copy-button =
    .label = 复制

# Text displayed on the copy button after it is clicked.
select-translations-panel-copy-button-copied =
    .label = 已复制的

select-translations-panel-done-button =
    .label = 完成了的

select-translations-panel-translate-full-page-button =
    .label = 转换完整页

select-translations-panel-translate-button =
    .label = 转换

select-translations-panel-try-again-button =
    .label = 尝试再一次

# Text displayed as a placeholder when the panel is idle.
select-translations-panel-idle-placeholder-text = 译本电文将出现这里.

# Text displayed as a placeholder when the panel is actively translating.
select-translations-panel-translating-placeholder-text = 翻译…

select-translations-panel-init-failure-message =
    .message = 不能加载语言. 复选你的因特网连接和尝试再一次.

# Text displayed when the translation fails to complete.
select-translations-panel-translation-failure-message =
    .message = 那里曾是一个问题翻译. 请试再一次.

# If your language requires declining the language name, a possible solution
# is to adapt the structure of the phrase, or use a support noun, e.g.
# `Sorry, we don't support translations from { $language } yet.
#
# Variables:
#   $language (string) - The language of the document.
select-translations-panel-unsupported-language-message-known-2 =
    .message = 难过的, 我们不要支持转换从 { $language } 还.
select-translations-panel-unsupported-language-message-unknown-2 =
    .message = 难过的, 我们不要支持转换从这语言还.

# Text displayed on the menuitem that opens the Translation Settings page.
select-translations-panel-open-translations-settings-menuitem =
    .label = 转换设置

# An announcement made to assistive technology when the translation is complete
select-translations-panel-translation-complete-announcement = 转换完全的


translations-panel-disable-translations =
  .label = 禁用转换完全地

translations-manage-enable = 
  .label = 启用 fullpage 转换
translations-manage-autopopup = 
  .label = 激励到转换页那不是在浏览器中's 配置的语言

# Text displayed in the right-click context menu for translating
# the current page.
main-context-menu-translate-page =
    .label = 转换页…
    .accesskey = T
