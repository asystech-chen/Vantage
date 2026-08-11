# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These strings appear in Origin Controls for Extensions.  Currently,
## they are visible in the context menu for extension toolbar buttons,
## and are used to inform the user how the extension can access their
## data for the current website, and allow them to control it.

origin-controls-no-access =
    .label = 扩展程序无法读取和更改数据

origin-controls-quarantined-status =
    .label = 扩展程序在受限站点上不被允许

origin-controls-quarantined-allow =
    .label = 在受限站点上允许

origin-controls-options =
    .label = 扩展程序可以读取和更改数据：

origin-controls-option-all-domains =
    .label = 在所有站点上

origin-controls-option-when-clicked =
    .label = 仅在单击时

# This string denotes an option that grants the extension access to
# the current site whenever they visit it.
# Variables:
#   $domain (String) - The domain for which the access is granted.
origin-controls-option-always-on =
    .label = 始终在 { $domain } 上允许

## These strings are used to map Origin Controls states to user-friendly
## messages. They currently appear in the unified extensions panel.

origin-controls-state-no-access = 无法在此站点上读取和更改数据

origin-controls-state-quarantined = 在此站点上未被 { -vendor-short-name } 允许

origin-controls-state-always-on = 始终可以在此站点上读取和更改数据

origin-controls-state-when-clicked = 需要权限以读取和更改数据

origin-controls-state-hover-run-visit-only = 仅为此访问运行

origin-controls-state-runnable-hover-open = 启动扩展程序

origin-controls-state-runnable-hover-run = 运行扩展程序

origin-controls-state-temporary-access = 可以为此访问读取和更改数据

## Extension's toolbar button.
## Variables:
##   $extensionTitle (String) - Extension name or title message.

origin-controls-toolbar-button =
    .label = { $extensionTitle }
    .tooltiptext = { $extensionTitle }

# Extension's toolbar button when permission is needed.
# Note that the new line is intentionally part of the tooltip.
origin-controls-toolbar-button-permission-needed =
    .label = { $extensionTitle }
    .tooltiptext =
        { $extensionTitle }
        需要权限

# Extension's toolbar button when quarantined.
# Note that the new line is intentionally part of the tooltip.
origin-controls-toolbar-button-quarantined =
    .label = { $extensionTitle }
    .tooltiptext =
        { $extensionTitle }
        在此站点上未被 { -vendor-short-name } 允许