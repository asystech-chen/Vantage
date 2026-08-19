# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These strings appear in Origin Controls for Extensions.  Currently,
## they are visible in the context menu for extension toolbar buttons,
## and are used to inform the user how the extension can access their
## data for the current website, and allow them to control it.

origin-controls-no-access =
    .label = 扩展名不能读取和更改论据

origin-controls-quarantined-status =
    .label = 扩展名不允许在受限制的位置

origin-controls-quarantined-allow =
    .label = 允许在受限制的位置

origin-controls-options =
    .label = 扩展名能读取和更改论据:

origin-controls-option-all-domains =
    .label = 在全部位置

origin-controls-option-when-clicked =
    .label = 仅何时使发出咔哒声

# This string denotes an option that grants the extension access to
# the current site whenever they visit it.
# Variables:
#   $domain (String) - The domain for which the access is granted.
origin-controls-option-always-on =
    .label = 总是允许在 { $domain }

## These strings are used to map Origin Controls states to user-friendly
## messages. They currently appear in the unified extensions panel.

origin-controls-state-no-access = 不能读取和更改论据在此站点

origin-controls-state-quarantined = 不允许由 { -vendor-short-name } 在此站点

origin-controls-state-always-on = 能总是读取和更改论据在此站点

origin-controls-state-when-clicked = 许可需要的到读取和更改论据

origin-controls-state-hover-run-visit-only = 运行为了这拜访仅

origin-controls-state-runnable-hover-open = 打开扩展名

origin-controls-state-runnable-hover-run = 运行扩展名

origin-controls-state-temporary-access = 能读取和更改论据为了这拜访

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
        许可需要的

# Extension's toolbar button when quarantined.
# Note that the new line is intentionally part of the tooltip.
origin-controls-toolbar-button-quarantined =
    .label = { $extensionTitle }
    .tooltiptext =
        { $extensionTitle }
        不允许由 { -vendor-short-name } 在此站点
