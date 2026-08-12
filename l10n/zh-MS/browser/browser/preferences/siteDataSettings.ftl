# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Settings

site-data-settings-window =
    .title = 管理 Cookie 和站点数据

site-data-settings-description = 那下列各项网站（全球资讯网的主机站）存储器操作 Cookie 和站点数据在你的计算机. { -brand-short-name } 保持资料从网站（全球资讯网的主机站）与固执的存放处直到你删除它, 和删除资料从网站（全球资讯网的主机站）与非-persistent 存放处作为空白是需要的.

site-data-search-textbox =
    .placeholder = 搜索网站（全球资讯网的主机站）
    .accesskey = S

site-data-column-host =
    .label = 位置
site-data-column-cookies =
    .label = 饼干
site-data-column-storage =
    .label = 存放处
site-data-column-last-used =
    .label = 最后的使用

# This label is used in the "Host" column for local files, which have no host.
site-data-local-file-host = (本地的文件)

site-data-remove-selected =
    .label = 移除被选的
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
    .value = { site-storage-usage.value } (固执的)

site-data-remove-all =
    .label = 移除所有的
    .accesskey = e

site-data-remove-shown =
    .label = 移除所有的显示
    .accesskey = e

## Removing

site-data-removing-dialog =
    .title = { site-data-removing-header }
    .buttonlabelaccept = 移除

site-data-removing-header = 拆迁 Cookie 和站点数据

site-data-removing-desc = 拆迁 Cookie 和站点数据可以日志你外面的的网站（全球资讯网的主机站）. 你确定你想要到使那更改?
# Variables:
#   $baseDomain (String) - The single domain for which data is being removed
site-data-removing-single-desc = 拆迁 Cookie 和站点数据可以日志你外面的的网站（全球资讯网的主机站）. 你确定你想要到移除 Cookie 和站点数据为了 <strong>{ $baseDomain }</strong>?

site-data-removing-table = Cookie 和站点数据为了那下列各项网站（全球资讯网的主机站）将是离开的
