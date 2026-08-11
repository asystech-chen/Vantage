# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings appear in the Unified Extensions panel.

## Panel

unified-extensions-header-title = 扩展
unified-extensions-manage-extensions =
    .label = 管理扩展
unified-extensions-discover-extensions =
    .label = 发现扩展
unified-extensions-empty-reason-private-browsing-not-allowed = 您已安装扩展，但未在隐私浏览窗口中启用
unified-extensions-empty-reason-extension-not-enabled = 您已安装扩展，但未启用
# In this headline, “Level up” means to enhance your browsing experience.
unified-extensions-empty-reason-zero-extensions-onboarding = 通过扩展升级您的浏览体验
unified-extensions-empty-content-explain-enable2 = 请在设置中选择“{ unified-extensions-manage-extensions.label }”以启用它们。
unified-extensions-empty-content-explain-manage2 = 请在设置中选择“{ unified-extensions-manage-extensions.label }”以管理它们。
unified-extensions-empty-content-explain-extensions-onboarding = 通过更改外观和性能或提升隐私与安全来个性化{ -brand-short-name }。

## An extension in the main list

# Each extension in the unified extensions panel (list) has a secondary button
# to open a context menu. This string is used for each of these buttons.
# Variables:
#   $extensionName (String) - Name of the extension
unified-extensions-item-open-menu =
    .aria-label = 为{ $extensionName }打开菜单

unified-extensions-item-message-manage = 管理扩展

# Variables:
#   $extensionName (String) - Name of the user-enabled soft-blocked extension.
unified-extensions-item-messagebar-softblocked2 = { $extensionName }受到限制。使用它可能存在风险。

## Extension's context menu

unified-extensions-context-menu-pin-to-toolbar =
    .label = 固定到工具栏

unified-extensions-context-menu-manage-extension =
    .label = 管理扩展

unified-extensions-context-menu-remove-extension =
    .label = 移除扩展

unified-extensions-context-menu-report-extension =
    .label = 报告扩展

unified-extensions-context-menu-move-widget-up =
    .label = 向上移动

unified-extensions-context-menu-move-widget-down =
    .label = 向下移动

## Notifications

unified-extensions-notice-safe-mode =
    .message = 所有扩展已被故障排除模式禁用。

# .heading is processed by moz-message-bar to be used as a heading attribute
unified-extensions-mb-quarantined-domain-message-3 =
    .heading = 某些扩展不被允许
    .message = 为保护您的数据，某些扩展无法在此站点上读取或更改数据。请使用扩展的设置，以允许在{ -vendor-short-name }限制的站点上使用。

unified-extensions-mb-quarantined-domain-learn-more = 了解详情
    .aria-label = 了解详情：某些扩展不被允许

unified-extensions-mb-about-addons-link = 前往扩展设置

# Variables:
#   $extensionName (String) - Name of the extension disabled through a soft-block.
unified-extensions-mb-blocklist-warning-single2 =
    .heading = { $extensionName }已禁用
    .message =
        此扩展受到限制并已被禁用。
        您可在设置中启用它，但这可能存有风险。

# Variables:
#   $extensionName (String) - Name of the extension disabled through a hard-block.
unified-extensions-mb-blocklist-error-single =
    .heading = { $extensionName }已禁用
    .message =
        此扩展违反了Mozilla的政策并已被禁用。

# Variables:
#   $extensionsCount (Number) - Number of extensions disabled through both soft and hard-blocks (always going to be greater than 1)
unified-extensions-mb-blocklist-warning-multiple2 =
    .heading =
        { $extensionsCount ->
            *[other] { $extensionsCount }个扩展已被禁用
        }
    .message =
        您的某些扩展受到限制并已被禁用。
        您可在设置中启用它们，但这可能存有风险。

# Variables:
#   $extensionsCount (Number) - Number of extensions disabled through hard-blocks.
unified-extensions-mb-blocklist-error-multiple =
    .heading =
        { $extensionsCount ->
            *[other] { $extensionsCount }个扩展已被禁用
        }
    .message =
        某些扩展因违反Mozilla政策而已被禁用。