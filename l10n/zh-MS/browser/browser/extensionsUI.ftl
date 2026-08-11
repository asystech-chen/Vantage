# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Variables:
#   $addonName (String): localized named of the extension that is asking to change the default search engine.
#   $currentEngine (String): name of the current search engine.
#   $newEngine (String): name of the new search engine.
webext-default-search-description = 扩展 { $addonName } 请求将您的默认搜索引擎从 { $currentEngine } 更改为 { $newEngine }。您是否同意此操作？
webext-default-search-yes =
    .label = 是
    .accesskey = Y
webext-default-search-no =
    .label = 否
    .accesskey = N

# Variables:
#   $addonName (String): localized named of the extension that was just installed.
addon-post-install-message = 扩展 { $addonName } 已成功添加。

## A modal confirmation dialog to allow an extension on quarantined domains.

# Variables:
#   $addonName (String): localized name of the extension.
webext-quarantine-confirmation-title =
    是否在受限站点上运行 { $addonName }？

webext-quarantine-confirmation-line-1 =
    为保护您的数据，此扩展不允许在此站点上运行。
webext-quarantine-confirmation-line-2 =
    如果您信任此扩展能够读取和更改您在由 { -vendor-short-name } 限制的站点上的数据，请允许此扩展。

webext-quarantine-confirmation-allow =
    .label = 允许
    .accesskey = A

webext-quarantine-confirmation-deny =
    .label = 不允许
    .accesskey = D