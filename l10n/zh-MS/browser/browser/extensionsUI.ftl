# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Variables:
#   $addonName (String): localized named of the extension that is asking to change the default search engine.
#   $currentEngine (String): name of the current search engine.
#   $newEngine (String): name of the new search engine.
webext-default-search-description = { $addonName } 会喜欢到更改你的默认搜索引擎从 { $currentEngine } 到 { $newEngine }. 是那 OK?
webext-default-search-yes =
    .label = 是
    .accesskey = Y
webext-default-search-no =
    .label = 无
    .accesskey = N

# Variables:
#   $addonName (String): localized named of the extension that was just installed.
addon-post-install-message = { $addonName } 曾是额外的.

## A modal confirmation dialog to allow an extension on quarantined domains.

# Variables:
#   $addonName (String): localized name of the extension.
webext-quarantine-confirmation-title =
    运行 { $addonName } 在受限制的坐?

webext-quarantine-confirmation-line-1 =
    到防卫你的资料, 这扩展名是不允许在此站点.
webext-quarantine-confirmation-line-2 =
    允许这扩展名如果你信任它到读取和更改你的资料在坐受限制的由 { -vendor-short-name }.

webext-quarantine-confirmation-allow =
    .label = 允许
    .accesskey = A

webext-quarantine-confirmation-deny =
    .label = 不要允许
    .accesskey = D
