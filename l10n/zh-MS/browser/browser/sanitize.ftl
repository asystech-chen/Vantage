# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

sanitize-prefs2 =
    .title = 设置为了清扫历史记录
    .style = min-width: 34媒体用毕符

sanitize-prefs-style =
    .style = 宽度: 17媒体用毕符

sanitize-dialog-title2 =
    .title = 清除浏览论据和饼干
    .style = min-width: 34媒体用毕符

sanitize-dialog-title =
    .title = 清除最近的历史记录
    .style = min-width: 34媒体用毕符

# When "Time range to clear" is set to "Everything", this message is used for the
# title instead of dialog-title.
sanitize-dialog-title-everything =
    .title = 清除所有的历史记录
    .style = min-width: 34媒体用毕符

clear-data-settings-label = 何时关闭, { -brand-short-name } 应该自动地清除所有的

sanitize-on-shutdown-description = 自动地清除所有的选中的项何时 { -brand-short-name } 关闭.

## clear-time-duration-prefix is followed by a dropdown list, with
## values localized using clear-time-duration-value-* messages.
## clear-time-duration-suffix is left empty in English, but can be
## used in other languages to change the structure of the message.
##
## This results in English:
## Time range to clear: (Last Hour, Today, etc.)

clear-time-duration-prefix =
    .value = 时间量程到清除:{ " " }
    .accesskey = T

clear-time-duration-prefix2 =
    .value = 何时:
    .accesskey = W

clear-time-duration-value-last-hour =
    .label = 最后的小时

clear-time-duration-value-last-2-hours =
    .label = 最后的二小时

clear-time-duration-value-last-4-hours =
    .label = 最后的四小时

# Variables:
#   $midnightTime (String) - Time of midnight (00:00 hours) - to inform the user that history will be cleared after midnight
clear-time-duration-value-since-midnight =
    .label = 自...以后 { $midnightTime }

clear-time-duration-value-today =
    .label = 今天

clear-time-duration-value-everything =
    .label = 每件事物

clear-time-duration-suffix =
    .value = { "" }

## These strings are used as section comments and checkboxes
## to select the items to remove

history-section-label = 历史记录

item-history-and-downloads =
    .label = 浏览 & 下载历史记录
    .accesskey = B

item-history-and-downloads-description2 = 清除位置和下载历史记录

item-cookies =
    .label = 饼干
    .accesskey = C

# Variables:
#   $amount (Number) - Amount of site data currently stored on disk
#   $unit (String) - Abbreviation of the unit that $amount is in, e.g. "MB"
item-cookies-site-data-with-size =
    .label = Cookie 和站点数据 ({ $amount } { $unit })
    .accesskey = e

item-cookies-site-data =
    .label = 饼干和位置论据
    .accesskey = e

item-cookies-site-data-description = 可以正负号你外面的的位置或空买东西二轮运货马车

item-active-logins =
    .label = 活跃的注册(程序)
    .accesskey = l

item-cache =
    .label = 高速缓冲存储器
    .accesskey = a

# Variables:
#   $amount (Number) - Amount of cached data
#   $unit (String) - Abbreviation of the unit that $amount is in, e.g. "MB"
item-cached-content-with-size =
    .label = 临时贮藏起来文件和页 ({ $amount } { $unit })
    .accesskey = f

item-cached-content =
    .label = 临时贮藏起来文件和页
    .accesskey = f

item-cached-content-description = 清除项那帮忙位置加载加快

item-form-search-history =
    .label = 表单 & 搜索历史记录
    .accesskey = F

item-site-prefs =
    .label = 位置设置
    .accesskey = i

item-formdata-prefs =
    .label = 保存表单信息
    .accesskey = o

item-formdata-description = 清除事物相似的名称, 电子信函, 和其他的项你输入在表单

item-site-prefs-description = 重置你的许可和位置首选项到最初的设置

data-section-label = 论据

item-site-settings =
    .label = 位置设置
    .accesskey = S

item-offline-apps =
    .label = 挂线网站（全球资讯网的主机站）论据
    .accesskey = O

sanitize-everything-undo-warning = 此操作无法撤销.

window-close =
    .key = w

sanitize-button-ok =
    .label = 清除现在

sanitize-button-ok2 =
    .label = 清除

sanitize-button-ok-on-shutdown =
    .label = 保存更改

# The label for the default button between the user clicking it and the window
# closing.  Indicates the items are being cleared.
sanitize-button-clearing =
    .label = 清扫

# Warning that appears when "Time range to clear" is set to "Everything" in Clear
# Recent History dialog, provided that the user has not modified the default set
# of history items to clear.
sanitize-everything-warning = 所有的历史记录将是使干净.

# Warning that appears when "Time range to clear" is set to "Everything" in Clear
# Recent History dialog, provided that the user has modified the default set of
# history items to clear.
sanitize-selected-warning = 所有的被选的项将是使干净.

# Label shown next to the loading spinner while calculating the size of cached data
# and cookies in the clear data dialog.
sanitize-calculating-size = 计算…
