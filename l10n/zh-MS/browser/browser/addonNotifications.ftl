# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

xpinstall-prompt = { -brand-short-name } 预防此站点从请求你到安装软设备在你的计算机.

## Variables:
##   $host (String): The hostname of the site the add-on is being installed from.

xpinstall-prompt-header = 允许 { $host } 到安装附加组件?
xpinstall-prompt-message = 你是试图到安装附加组件从 { $host }. 确保你信任此站点继续之前.

##

xpinstall-prompt-header-unknown = 允许一个未知物位置到安装附加组件?
xpinstall-prompt-message-unknown = 你是试图到安装附加组件从一个未知物位置. 确保你信任此站点继续之前.

xpinstall-prompt-dont-allow =
    .label = 不要允许
    .accesskey = D
xpinstall-prompt-never-allow =
    .label = 从不允许
    .accesskey = N
# Long text in this context make the dropdown menu extend awkwardly to the left,
# avoid a localization that's significantly longer than the English version.
xpinstall-prompt-never-allow-and-report =
    .label = 报告可疑的位置
    .accesskey = R
# Accessibility Note:
# Be sure you do not choose an accesskey that is used elsewhere in the active context (e.g. main menu bar, submenu of the warning popup button)
# See https://website-archive.mozilla.org/www.mozilla.org/access/access/keyboard/ for details
xpinstall-prompt-install =
    .label = 继续到安装
    .accesskey = C

# These messages are shown when a website invokes navigator.requestMIDIAccess.

site-permission-install-first-prompt-midi-header = 此站点是要求访问到你的 MIDI (音乐片工具数字接口) 装置. 装置访问能是启用由安装一个 add-on.
site-permission-install-first-prompt-midi-message = 这访问是不有保证的到是保险箱. 仅继续如果你信任此站点.

site-permission-install-first-prompt-serial-header = 此站点是要求访问到你的连续的装置. 装置访问能是启用由安装一个 add-on.
site-permission-install-first-prompt-serial-message = 这访问是不有保证的到是保险箱. 仅继续如果你信任此站点.

##

xpinstall-disabled-by-policy = 软设备安装有是禁用由你的组织.
xpinstall-disabled = 软设备安装是当前禁用. 单击启用和尝试再一次.
xpinstall-disabled-button =
    .label = 启用
    .accesskey = n

# This message is shown when the installation of an add-on is blocked by enterprise policy.
# Variables:
#   $addonName (String): the name of the add-on.
#   $addonId (String): the ID of add-on.
addon-installation-blocked-by-policy = { $addonName } ({ $addonId }) 是阻止由你的组织.
# This message is shown when the installation of add-ons from a domain is blocked by enterprise policy.
addon-install-domain-blocked-by-policy = 你的组织预防此站点从请求你到安装软设备在你的计算机.
addon-install-full-screen-blocked = 添加-on 安装是不允许一会儿在或在...之前进入 fullscreen 模式.

# Variables:
#   $addonName (String): the localized name of the sideloaded add-on.
webext-perms-sideload-menu-item = { $addonName } 额外的到 { -brand-short-name }
# Variables:
#   $addonName (String): the localized name of the extension which has been updated.
webext-perms-update-menu-item = { $addonName } 需要新的许可

# This message is shown when one or more extensions have been imported from a
# different browser into Firefox, and the user needs to complete the import to
# start these extensions. This message is shown in the appmenu.
webext-imported-addons = 使结束安装扩展名输入到 { -brand-short-name }

## Add-on removal warning

# Variables:
#  $name (String): The name of the add-on that will be removed.
addon-removal-title = 移除 { $name }?
addon-removal-button = 移除
addon-removal-abuse-report-checkbox = 报告这扩展名到 { -vendor-short-name }
# "it" refers to the local AI model that is paired to the AI feature
addon-mlmodel-removal-body = 如果你使用那特性或扩展名那使用这模型, 它将是赖斯编码-added.

# Variables:
#   $addonCount (Number): the number of add-ons being downloaded
addon-downloading-and-verifying =
    { $addonCount ->
        [1] 下装和检验 add-on…
       *[other] 下装和检验 { $addonCount } 添加-奥运信息服务…
    }
addon-download-verifying = 检验

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
        [1] 此站点会喜欢到安装附加组件在 { -brand-short-name }:
       *[other] 此站点会喜欢到安装 { $addonCount } 添加-ons 在 { -brand-short-name }:
    }
addon-confirm-install-unsigned-message =
    { $addonCount ->
        [1] 警告: 此站点会喜欢到安装一个未经核对的 add-on 在 { -brand-short-name }. 继续进行在你的自己的冒险.
       *[other] 警告: 此站点会喜欢到安装 { $addonCount } 未经核对的添加-ons 在 { -brand-short-name }. 继续进行在你的自己的冒险.
    }
# Variables:
#   $addonCount (Number): the number of add-ons being installed (at least 2)
addon-confirm-install-some-unsigned-message =
    { $addonCount ->
       *[other] 警告: 此站点会喜欢到安装 { $addonCount } 添加-ons 在 { -brand-short-name }, 一些的哪个是未经核对的. 继续进行在你的自己的冒险.
    }

## Add-on install errors
## Variables:
##   $addonName (String): the add-on name.

addon-install-error-network-failure = 那 add-on 能够不是将（程序因为的一个连接故障.
addon-install-error-incorrect-hash = 那 add-on 能够不是安装因为它做不比较那 add-on { -brand-short-name } 预期的.
addon-install-error-corrupt-file = 那 add-on 将（程序从此站点能够不是安装因为它出现到是腐败的.
addon-install-error-file-access = { $addonName } 能够不是安装因为 { -brand-short-name } 无法修改那需要的文件.
addon-install-error-not-signed = { -brand-short-name } 有预防此站点从安装一个未经核对的 add-on.
addon-install-error-invalid-domain = 那 add-on { $addonName } 能不是安装从这位置.
addon-install-error-no-addon-name-file-access = 那 add-on 能够不是安装因为 { -brand-short-name } 无法修改那需要的文件.
addon-local-install-error-network-failure = 这 add-on 能够不是安装因为的一个文件系统错误.
addon-local-install-error-incorrect-hash = 这 add-on 能够不是安装因为它做不比较那 add-on { -brand-short-name } 预期的.
addon-local-install-error-corrupt-file = 这 add-on 能够不是安装因为它出现到是腐败的.
addon-local-install-error-file-access = { $addonName } 能够不是安装因为 { -brand-short-name } 无法修改那需要的文件.
addon-local-install-error-not-signed = 这 add-on 能够不是安装因为它有不是已查清的.
addon-local-install-no-addon-name-error-file-access = 那 add-on 能够不是安装因为 { -brand-short-name } 无法修改那需要的文件.
# Variables:
#   $appVersion (String): the application version.
addon-install-error-incompatible = { $addonName } 能够不是安装因为它是不相容的与 { -brand-short-name } { $appVersion }.
addon-install-error-hard-blocked = { $addonName } 违犯 Mozilla's 政策和不能是安装在 { -brand-short-name }.
addon-install-error-soft-blocked2 = { $addonName } 是受限制的和不能是安装在 { -brand-short-name }.
# Enterprise policies is a feature aimed at system administrators who want to deploy custom settings for Firefox.
addon-install-error-admin-install-only = 你无法安装 { $addonName } 作为一个端用户, 它能仅是安装由一个组织使用企业政策.
