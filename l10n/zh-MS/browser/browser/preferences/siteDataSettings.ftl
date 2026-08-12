# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Settings

site-data-settings-window =
    .title = 管理Cookies和站点数据

site-data-settings-description = 以下网站将在您的计算机上存储Cookies和站点数据。{ -brand-short-name } 将保留具有持久性存储的网站数据，直至您将其删除，并在空间需要时删除具有非持久性存储的网站数据。

site-data-search-textbox =
    .placeholder = 搜索网站
    .accesskey = S

site-data-column-host =
    .label = 站点
site-data-column-cookies =
    .label = Cookies
site-data-column-storage =
    .label = 存储
site-data-column-last-used =
    .label = 最后使用

# This label is used in the "Host" column for local files, which have no host.
site-data-local-file-host = （本地文件）

site-data-remove-selected =
    .label = 删除所选
    .accesskey = R

site-data-settings-dialog =
    .buttonlabelaccept = 保存更改
    .buttonaccesskeyaccept = a

# Variables:
#   $value (Number) - Value of the unit (for example: 4.6, 500)
#   $unit (String) - Name of the unit (for example: "bytes", "KB")
site-storage-usage =
    .value = { $value } { $unit }
site-storage-persistent =
    .value = { site-storage-usage.value } （持久性）

site-data-remove-all =
    .label = 删除全部
    .accesskey = e

site-data-remove-shown =
    .label = 删除全部显示内容
    .accesskey = e

## Removing

site-data-removing-dialog =
    .title = { site-data-removing-header }
    .buttonlabelaccept = 删除

site-data-removing-header = 正在删除Cookies和站点数据

site-data-removing-desc = 删除Cookies和站点数据可能会导致您退出网站登录。您确定要执行这些更改吗？
# Variables:
#   $baseDomain (String) - The single domain for which data is being removed
site-data-removing-single-desc = 删除Cookies和站点数据可能会导致您退出网站登录。您确定要删除<strong>{ $baseDomain }</strong>的Cookies和站点数据吗？

site-data-removing-table = 以下网站的Cookies和站点数据将被删除
