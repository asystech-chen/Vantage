# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings appear in the Unified Extensions panel.

## Panel

unified-extensions-header-title = 扩展名
unified-extensions-manage-extensions =
    .label = 管理扩展名
unified-extensions-discover-extensions =
    .label = 发现扩展名
unified-extensions-empty-reason-private-browsing-not-allowed = 你有扩展名安装, 除了不启用在私人的窗
unified-extensions-empty-reason-extension-not-enabled = 你有扩展名安装, 除了不启用
# In this headline, “Level up” means to enhance your browsing experience.
unified-extensions-empty-reason-zero-extensions-onboarding = 级别向上的你的浏览与扩展名
unified-extensions-empty-content-explain-enable2 = 选择“{ unified-extensions-manage-extensions.label }”到启用他们在设置.
unified-extensions-empty-content-explain-manage2 = 选择“{ unified-extensions-manage-extensions.label }”到管理他们在设置.
unified-extensions-empty-content-explain-extensions-onboarding = (贬)使个人化 { -brand-short-name } 由更改如何它看和进行或助推隐私和安全.

## An extension in the main list

# Each extension in the unified extensions panel (list) has a secondary button
# to open a context menu. This string is used for each of these buttons.
# Variables:
#   $extensionName (String) - Name of the extension
unified-extensions-item-open-menu =
    .aria-label = 打开菜单为了 { $extensionName }

unified-extensions-item-message-manage = 管理扩展名

# Variables:
#   $extensionName (String) - Name of the user-enabled soft-blocked extension.
unified-extensions-item-messagebar-softblocked2 = { $extensionName } 是受限制的. 使用它可以是危险的.

## Extension's context menu

unified-extensions-context-menu-pin-to-toolbar =
    .label = 大头针到工具栏

unified-extensions-context-menu-manage-extension =
    .label = 管理扩展名

unified-extensions-context-menu-remove-extension =
    .label = 移除扩展名

unified-extensions-context-menu-report-extension =
    .label = 报告扩展名

unified-extensions-context-menu-move-widget-up =
    .label = 移动向上的

unified-extensions-context-menu-move-widget-down =
    .label = 移动向下

## Notifications

unified-extensions-notice-safe-mode =
    .message = 所有的扩展名有是禁用由障碍修理模式.

# .heading is processed by moz-message-bar to be used as a heading attribute
unified-extensions-mb-quarantined-domain-message-3 =
    .heading = 一些扩展名是不允许
    .message = 到防卫你的论据, 一些扩展名不能读取或更改论据在此站点. 使用那 extension's 设置到允许在位置受限制的由 { -vendor-short-name }.

unified-extensions-mb-quarantined-domain-learn-more = 学习更多
    .aria-label = 学习更多: 一些扩展名是不允许

unified-extensions-mb-about-addons-link = 去到扩展名设置

# Variables:
#   $extensionName (String) - Name of the extension disabled through a soft-block.
unified-extensions-mb-blocklist-warning-single2 =
    .heading = { $extensionName } 禁用
    .message =
        这扩展名是受限制的和有是禁用.
        你能启用它在设置, 除了这可以是危险的.

# Variables:
#   $extensionName (String) - Name of the extension disabled through a hard-block.
unified-extensions-mb-blocklist-error-single =
    .heading = { $extensionName } 禁用
    .message =
        这扩展名违犯 Mozilla's 政策和有是禁用.

# Variables:
#   $extensionsCount (Number) - Number of extensions disabled through both soft and hard-blocks (always going to be greater than 1)
unified-extensions-mb-blocklist-warning-multiple2 =
    .heading =
        { $extensionsCount ->
            *[other] { $extensionsCount } 扩展名禁用
        }
    .message =
        一些的你的扩展名是受限制的和有是禁用.
        你能启用他们在设置, 除了这可以是危险的.

# Variables:
#   $extensionsCount (Number) - Number of extensions disabled through hard-blocks.
unified-extensions-mb-blocklist-error-multiple =
    .heading =
        { $extensionsCount ->
            *[other] { $extensionsCount } 扩展名禁用
        }
    .message =
        一些的你的扩展名有是禁用为了亵渎 Mozilla's 政策.
