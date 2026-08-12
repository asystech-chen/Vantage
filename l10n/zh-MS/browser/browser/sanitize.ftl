# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

sanitize-prefs2 =
    .title = 清除历史记录的设置
    .style = min-width: 34em

sanitize-prefs-style =
    .style = width: 17em

sanitize-dialog-title2 =
    .title = 清除浏览数据和Cookie
    .style = min-width: 34em

sanitize-dialog-title =
    .title = 清除最近的历史记录
    .style = min-width: 34em

# When "Time range to clear" is set to "Everything", this message is used for the
# title instead of dialog-title.
sanitize-dialog-title-everything =
    .title = 清除全部历史记录
    .style = min-width: 34em

clear-data-settings-label = 当关闭时，{ -brand-short-name } 应自动清除所有

sanitize-on-shutdown-description = 当 { -brand-short-name } 关闭时，自动清除所有已选中的项目。

## clear-time-duration-prefix is followed by a dropdown list, with
## values localized using clear-time-duration-value-* messages.
## clear-time-duration-suffix is left empty in English, but can be
## used in other languages to change the structure of the message.
##
## This results in English:
## Time range to clear: (Last Hour, Today, etc.)

clear-time-duration-prefix =
    .value = 清除时间范围：{ " " }
    .accesskey = T

clear-time-duration-prefix2 =
    .value = 时间点：
    .accesskey = W

clear-time-duration-value-last-hour =
    .label = 最近一小时

clear-time-duration-value-last-2-hours =
    .label = 最近两小时

clear-time-duration-value-last-4-hours =
    .label = 最近四小时

# Variables:
#   $midnightTime (String) - Time of midnight (00:00 hours) - to inform the user that history will be cleared after midnight
clear-time-duration-value-since-midnight =
    .label = 自 { $midnightTime } 起

clear-time-duration-value-today =
    .label = 今日

clear-time-duration-value-everything =
    .label = 全部

clear-time-duration-suffix =
    .value = { "" }

## These strings are used as section comments and checkboxes
## to select the items to remove

history-section-label = 历史记录

item-history-and-downloads =
    .label = 浏览和下载历史记录
    .accesskey = B

item-history-and-downloads-description2 = 清除站点和下载历史记录

item-cookies =
    .label = Cookie
    .accesskey = C

# Variables:
#   $amount (Number) - Amount of site data currently stored on disk
#   $unit (String) - Abbreviation of the unit that $amount is in, e.g. "MB"
item-cookies-site-data-with-size =
    .label = Cookie 和站点数据 ({ $amount } { $unit })
    .accesskey = e

item-cookies-site-data =
    .label = Cookie 和站点数据
    .accesskey = e

item-cookies-site-data-description = 可能导致您从站点注销或清空购物车

item-active-logins =
    .label = 活动登录
    .accesskey = l

item-cache =
    .label = 缓存
    .accesskey = a

# Variables:
#   $amount (Number) - Amount of cached data
#   $unit (String) - Abbreviation of the unit that $amount is in, e.g. "MB"
item-cached-content-with-size =
    .label = 临时缓存文件和页面 ({ $amount } { $unit })
    .accesskey = f

item-cached-content =
    .label = 临时缓存文件和页面
    .accesskey = f

item-cached-content-description = 清除有助于站点加载速度更快的项目

item-form-search-history =
    .label = 表单和搜索历史记录
    .accesskey = F
item-site-prefs =
    .label = 站点设置
    .accesskey = i

item-formdata-prefs =
    .label = 已保存的表单信息
    .accesskey = o

item-formdata-description = 清除诸如您输入的表单中的姓名、电子邮件及其他项目

item-site-prefs-description = 将您的权限和站点偏好重置为原始设置

data-section-label = 数据

item-site-settings =
    .label = 站点设置
    .accesskey = S

item-offline-apps =
    .label = 离线网站数据
    .accesskey = O

sanitize-everything-undo-warning = 此操作无法被撤销。

window-close =
    .key = w

sanitize-button-ok =
    .label = 立即清除

sanitize-button-ok2 =
    .label = 清除

sanitize-button-ok-on-shutdown =
    .label = 保存更改

# The label for the default button between the user clicking it and the window
# closing.  Indicates the items are being cleared.
sanitize-button-clearing =
    .label = 正在清除

# Warning that appears when "Time range to clear" is set to "Everything" in Clear
# Recent History dialog, provided that the user has not modified the default set
# of history items to clear.
sanitize-everything-warning = 所有历史记录将被清除。

# Warning that appears when "Time range to clear" is set to "Everything" in Clear
# Recent History dialog, provided that the user has modified the default set of
# history items to clear.
sanitize-selected-warning = 所有选定的项目将被清除。

# Label shown next to the loading spinner while calculating the size of cached data
# and cookies in the clear data dialog.
sanitize-calculating-size = 正在计算…
