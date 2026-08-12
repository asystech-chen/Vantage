# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

xpinstall-prompt = { -brand-short-name } 已阻止此站点向您请求在您的计算机上安装软件的操作。

## Variables:
##   $host (String): The hostname of the site the add-on is being installed from.

xpinstall-prompt-header = 是否允许 { $host } 安装附加组件？
xpinstall-prompt-message = 您正在尝试从 { $host } 安装附加组件。在继续之前，请确保您信任此站点。

##

xpinstall-prompt-header-unknown = 是否允许未知站点安装附加组件？
xpinstall-prompt-message-unknown = 您正在尝试从未知站点安装附加组件。在继续之前，请确保您信任此站点。

xpinstall-prompt-dont-allow =
    .label = 不允许
    .accesskey = D
xpinstall-prompt-never-allow =
    .label = 永不允许
    .accesskey = N
# Long text in this context make the dropdown menu extend awkwardly to the left,
# avoid a localization that's significantly longer than the English version.
xpinstall-prompt-never-allow-and-report =
    .label = 报告可疑站点
    .accesskey = R
# Accessibility Note:
# Be sure you do not choose an accesskey that is used elsewhere in the active context (e.g. main menu bar, submenu of the warning popup button)
# See https://website-archive.mozilla.org/www.mozilla.org/access/access/keyboard/ for details
xpinstall-prompt-install =
    .label = 继续安装
    .accesskey = C

# These messages are shown when a website invokes navigator.requestMIDIAccess.

site-permission-install-first-prompt-midi-header = 此站点正在请求访问您的 MIDI（乐器数字接口）设备。可通过安装附加组件来启用设备访问。
site-permission-install-first-prompt-midi-message = 此访问不能保证安全。仅当您信任此站点时才继续。

site-permission-install-first-prompt-serial-header = 此站点正在请求访问您的串行设备。可通过安装附加组件来启用设备访问。
site-permission-install-first-prompt-serial-message = 此访问不能保证安全。仅当您信任此站点时才继续。

##

xpinstall-disabled-by-policy = 软件安装已由您的组织禁用。
xpinstall-disabled = 软件安装当前已被禁用。请单击“启用”并重试。
xpinstall-disabled-button =
    .label = 启用
    .accesskey = n

# This message is shown when the installation of an add-on is blocked by enterprise policy.
# Variables:
#   $addonName (String): the name of the add-on.
#   $addonId (String): the ID of add-on.
addon-installation-blocked-by-policy = { $addonName } ({ $addonId }) 已被您的组织阻止。
# This message is shown when the installation of add-ons from a domain is blocked by enterprise policy.
addon-install-domain-blocked-by-policy = 您的组织已阻止此站点向您请求在您的计算机上安装软件的操作。
addon-install-full-screen-blocked = 在进入全屏模式期间或之前，不允许进行附加组件安装。

# Variables:
#   $addonName (String): the localized name of the sideloaded add-on.
webext-perms-sideload-menu-item = { $addonName } 已添加到 { -brand-short-name }
# Variables:
#   $addonName (String): the localized name of the extension which has been updated.
webext-perms-update-menu-item = { $addonName } 需要新权限

# This message is shown when one or more extensions have been imported from a
# different browser into Firefox, and the user needs to complete the import to
# start these extensions. This message is shown in the appmenu.
webext-imported-addons = 完成从其他浏览器导入到 { -brand-short-name } 的扩展安装

## Add-on removal warning

# Variables:
#  $name (String): The name of the add-on that will be removed.
addon-removal-title = 是否移除 { $name }？
addon-removal-button = 移除
addon-removal-abuse-report-checkbox = 向 { -vendor-short-name } 报告此扩展
# "it" refers to the local AI model that is paired to the AI feature
addon-mlmodel-removal-body = 如果您使用使用此模型的功能或扩展，它将被重新添加。

# Variables:
#   $addonCount (Number): the number of add-ons being downloaded
addon-downloading-and-verifying =
    { $addonCount ->
        [1] 正在下载并验证附加组件…
       *[other] 正在下载并验证 { $addonCount } 个附加组件…
    }
addon-download-verifying = 正在验证

addon-install-cancel-button =
    .label = 取消
    .accesskey = C
addon-install-accept-button =
    .label = 添加
    .accesskey = A

## Variables:
##   $addonCount (Number): the number of add-ons being installed

addon-confirm-install-message =
    { $addonCount ->
        [1] 此站点希望在 { -brand-short-name } 中安装附加组件：
       *[other] 此站点希望在 { -brand-short-name } 中安装 { $addonCount } 个附加组件：
    }
addon-confirm-install-unsigned-message =
    { $addonCount ->
        [1] 警告：此站点希望在 { -brand-short-name } 中安装未经验证的附加组件。请自行承担风险继续。
       *[other] 警告：此站点希望在 { -brand-short-name } 中安装 { $addonCount } 个未经验证的附加组件。请自行承担风险继续。
    }
# Variables:
#   $addonCount (Number): the number of add-ons being installed (at least 2)
addon-confirm-install-some-unsigned-message =
    { $addonCount ->
       *[other] 警告：此站点希望在 { -brand-short-name } 中安装 { $addonCount } 个附加组件，其中部分未经验证。请自行承担风险继续。
    }

## Add-on install errors
## Variables:
##   $addonName (String): the add-on name.

addon-install-error-network-failure = 由于连接故障，无法下载该附加组件。
addon-install-error-incorrect-hash = 无法安装该附加组件，因为它与{ -brand-short-name }所预期的附加组件不匹配。
addon-install-error-corrupt-file = 无法安装从此站点下载的附加组件，因为它似乎已损坏。
addon-install-error-file-access = 无法安装{ $addonName }，因为{ -brand-short-name }无法修改所需的文件。
addon-install-error-not-signed = { -brand-short-name }已阻止此站点安装未经验证的附加组件。
addon-install-error-invalid-domain = 无法从此位置安装附加组件{ $addonName }。
addon-install-error-no-addon-name-file-access = 无法安装该附加组件，因为{ -brand-short-name }无法修改所需的文件。
addon-local-install-error-network-failure = 由于文件系统错误，无法安装此附加组件。
addon-local-install-error-incorrect-hash = 无法安装此附加组件，因为它与{ -brand-short-name }所预期的附加组件不匹配。
addon-local-install-error-corrupt-file = 无法安装此附加组件，因为它似乎已损坏。
addon-local-install-error-file-access = 无法安装{ $addonName }，因为{ -brand-short-name }无法修改所需的文件。
addon-local-install-error-not-signed = 无法安装此附加组件，因为它尚未经过验证。
addon-local-install-no-addon-name-error-file-access = 无法安装该附加组件，因为{ -brand-short-name }无法修改所需的文件。
# Variables:
#   $appVersion (String): the application version.
addon-install-error-incompatible = 无法安装{ $addonName }，因为它与{ -brand-short-name } { $appVersion }不兼容。
addon-install-error-hard-blocked = { $addonName }违反了Mozilla的政策，无法安装在{ -brand-short-name }上。
addon-install-error-soft-blocked2 = { $addonName }受到限制，无法安装在{ -brand-short-name }上。
# Enterprise policies is a feature aimed at system administrators who want to deploy custom settings for Firefox.
addon-install-error-admin-install-only = 您不能作为最终用户安装{ $addonName }，它只能由使用企业策略的组织安装。
