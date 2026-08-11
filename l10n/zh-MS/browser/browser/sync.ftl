# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

fxa-toolbar-sync-syncing2 = 正在执行同步操作…

sync-disconnect-dialog-title2 = 是否执行断开连接？
sync-disconnect-dialog-body = { -brand-product-name } 将停止同步您的账户，但不会删除此设备上的任何浏览数据。
sync-disconnect-dialog-button = 断开连接

fxa-signout-dialog-title2 = 是否退出您的账户？
fxa-signout-dialog-body = 已同步的数据将保留在您的账户中。
fxa-signout-dialog2-button = 退出登录
fxa-signout-dialog2-checkbox = 从此设备删除数据（密码、历史记录、书签等）

fxa-menu-sync-settings =
    .label = 同步设置
fxa-menu-turn-on-sync =
    .value = 开启同步
fxa-menu-turn-on-sync-default = 开启同步

fxa-menu-connect-another-device =
    .label = 连接另一台设备…
# Variables:
#   $tabCount (Number): The number of tabs sent to the device.
# The following string intentionally omits the word "tab" from the singular and includes it in the plural.
fxa-menu-send-to-device =
    .label =
        { $tabCount ->
            [1] 发送到设备
           *[other] 发送 { $tabCount } 个标签页到设备
        }
# Variables:
#   $tabCount (Number): The number of tabs sent to the device.
# The following string intentionally omits the word "tab" from the singular and includes it in the plural.
fxa-menu-send-to-mobile =
    .label =
        { $tabCount ->
            [1] 发送到移动设备
           *[other] 发送 { $tabCount } 个标签页到移动设备
        }

## The following strings are for displaying elements in the FxA send tab submenu to prompt users to sign in, enable sync, pair a device, troubleshoot device issues, or verify account.

fxa-menu-send-to-mobile-sign-in = 请登录以发送标签页
fxa-menu-send-to-mobile-turn-on-sync = 请开启同步以发送标签页
fxa-menu-send-to-mobile-connect-device = 请连接设备以发送标签页
fxa-menu-send-to-mobile-device-missing2 = 未找到您的设备？
fxviewtabrow-send-to-mobile-not-verified = 账户未经验证
fxviewtabrow-send-to-mobile-verify-account = 请验证您的账户

##

# This is shown dynamically within "Send tab to device" in fxa menu.
fxa-menu-send-tab-to-device-syncnotready =
    .label = 正在同步设备…

# This is shown within "Send tab to device" in fxa menu if account is not configured.
fxa-menu-send-tab-to-device-description = 将标签页即时发送到您已登录的任何设备。

fxa-menu-sign-out =
    .label = 退出登录…


fxa-menu-sync-description = 在任意位置访问您的网页

fxa-avatar-sign-in = 登录
fxa-avatar-sign-up = 注册
fxa-avatar-tooltip =
    .tooltiptext = 请登录您的账户

## Dialog strings that we show the user when signing into Mozilla account/setting up sync

sync-setup-verify-continue = 继续
sync-setup-verify-title = 合并警告
sync-setup-verify-heading = 您确实要登录以执行同步吗？

##

# The user was previously signed into sync. This dialog confirms to the user
# that they will be merging the data from the previously signed in into the newly signed in one
# Variables:
#   $email - Email address of a user previously signed into sync.
sync-setup-verify-description = 此前已有一位不同的用户在您此计算机上登录了同步。执行登录操作将合并此浏览器的书签、密码和其他设置与 { $email }

## Sync warning strings that support the browser profiles feature, these will be shown when the user might be merging data

# Dialog 1 - different account signing in without option to merge
sync-profile-different-account-title = 此配置文件已达到账户限制
sync-profile-different-account-header = 此配置文件此前已同步到不同的账户

# Variables:
#   $acctEmail (String) - Email of the account signing into sync.
sync-profile-different-account-description = 为保持您的数据组织有序且安全，每个 { -brand-product-name } 配置文件仅可同步到一个账户。若要使用 { $acctEmail } 登录，请创建一个新的配置文件。

# Dialog 1 - different account signing in with merge option
sync-profile-different-account-title-merge = 配置文件已同步到不同的账户

# Variables:
#   $acctEmail (String) - Email of the account signing into sync.
#   $profileName (String) - Name of the current profile
sync-profile-different-account-description-merge = 为保持您的数据组织有序且安全，我们建议您创建一个新的配置文件以使用 { $acctEmail } 登录。如果您选择继续在此配置文件上执行同步，两个账户的数据将永久合并到“{ $profileName }”。

# Dialog 2 - account signed in on another profile without option to merge
sync-account-in-use-header = 账户已被使用

# Variables:
#   $acctEmail (String) - Email of the account signing into sync.
#   $otherProfile (String) - Name of the other profile that is associated with the account
sync-account-in-use-header-merge = { $acctEmail } 已登录到“{ $otherProfile }”配置文件
sync-account-in-use-description = 您只能将您的此账户与此计算机上的一个配置文件进行关联。

# Dialog 2 - account signed in on another profile with merge option
sync-account-already-signed-in-header = 此账户已登录到另一配置文件。是否同步两个配置文件？

# Variables:
#   $acctEmail (String) - Email of the account signing into sync.
#   $currentProfile (String): Name of the current profile signing in
#   $otherProfile (String): Name of the profile that is already signed in
sync-account-in-use-description-merge = { $acctEmail } 已在此计算机上登录到“{ $otherProfile }”配置文件。同步“{ $currentProfile }”配置文件将永久合并两个配置文件的数据，例如密码和书签。
# Variables:
#   $profileName (String) - Name of the profile to switch to
sync-button-switch-profile = 切换至“{ $profileName }”
sync-button-create-profile = 创建新配置文件
sync-button-sync-and-merge = 同步并合并数据
# Variables:
#   $profileName (String) - Name of the profile to switch to
sync-button-sync-profile = 同步“{ $profileName }”