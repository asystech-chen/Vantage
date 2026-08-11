# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

webpage-languages-window2 =
    .title = 网页语言设置
    .style = min-width: 40em

languages-close-key =
    .key = w

languages-description = 网页有时会以多种语言提供。请选择用于显示这些网页的语言，按您的偏好顺序排列

languages-customize-spoof-english =
    .label = 请求网页的英文版本以增强隐私保护

languages-customize-moveup =
    .label = 上移
    .accesskey = U

languages-customize-movedown =
    .label = 下移
    .accesskey = D

languages-customize-remove =
    .label = 移除
    .accesskey = R

languages-customize-select-language =
    .placeholder = 选择要添加的语言…

languages-customize-add =
    .label = 添加
    .accesskey = A

# The pattern used to generate strings presented to the user in the
# locale selection list.
#
# Example:
#   Icelandic [is]
#   Spanish (Chile) [es-CL]
#
# Variables:
#   $locale (String) - A name of the locale (for example: "Icelandic", "Spanish (Chile)")
#   $code (String) - Locale code of the locale (for example: "is", "es-CL")
languages-code-format =
    .label = { $locale } [{ $code }]

languages-active-code-format =
    .value = { languages-code-format.label }

browser-languages-window2 =
    .title = { -brand-short-name } 语言设置
    .style = min-width: 40em

browser-languages-description = { -brand-short-name } 将显示第一种语言作为您的默认语言，并在必要时按显示顺序显示备选语言。

browser-languages-search = 搜索更多语言…

browser-languages-searching =
    .label = 正在搜索语言…

browser-languages-downloading =
    .label = 正在下载…

browser-languages-select-language =
    .label = 选择要添加的语言…
    .placeholder = 选择要添加的语言…

browser-languages-installed-label = 已安装的语言
browser-languages-available-label = 可用的语言

browser-languages-error = { -brand-short-name } 目前无法更新您的语言。请检查您是否已连接到互联网，或稍后重试。