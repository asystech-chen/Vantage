# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

fxa-toolbar-sync-syncing2 = 【电影、电视】…

sync-disconnect-dialog-title2 = 断开?
sync-disconnect-dialog-body = { -brand-product-name } 将停止【电影、电视】你的帐户除了将不删除任何的的你的浏览资料在这装置.
sync-disconnect-dialog-button = 断开

fxa-signout-dialog-title2 = 正负号外面的的你的帐户?
fxa-signout-dialog-body = synchronization 的缩略词资料将保持在你的帐户.
fxa-signout-dialog2-button = 正负号外面的
fxa-signout-dialog2-checkbox = Delete 资料从这装置 (密码, 历史记录, 书签, 及其他.)

fxa-menu-sync-settings =
    .label = 同步的设置
fxa-menu-turn-on-sync =
    .value = 转弯在同步的
fxa-menu-turn-on-sync-default = 转弯在同步的

fxa-menu-connect-another-device =
    .label = 连接另外的装置…
# Variables:
#   $tabCount (Number): The number of tabs sent to the device.
# The following string intentionally omits the word "tab" from the singular and includes it in the plural.
fxa-menu-send-to-device =
    .label =
        { $tabCount ->
            [1] 发送到装置
           *[other] 发送 { $tabCount } 标签页到装置
        }
# Variables:
#   $tabCount (Number): The number of tabs sent to the device.
# The following string intentionally omits the word "tab" from the singular and includes it in the plural.
fxa-menu-send-to-mobile =
    .label =
        { $tabCount ->
            [1] 发送到移动的
           *[other] 发送 { $tabCount } 标签页到移动的
        }

## The following strings are for displaying elements in the FxA send tab submenu to prompt users to sign in, enable sync, pair a device, troubleshoot device issues, or verify account.

fxa-menu-send-to-mobile-sign-in = 正负号在到发送标签页
fxa-menu-send-to-mobile-turn-on-sync = 转弯在同步的到发送标签页
fxa-menu-send-to-mobile-connect-device = 连接一个装置到发送标签页
fxa-menu-send-to-mobile-device-missing2 = 不要看见你的装置?
fxviewtabrow-send-to-mobile-not-verified = 帐户不已查清的
fxviewtabrow-send-to-mobile-verify-account = 证明你的帐户

##

# This is shown dynamically within "Send tab to device" in fxa menu.
fxa-menu-send-tab-to-device-syncnotready =
    .label = 【电影、电视】德维克（男子名、姓氏）…

# This is shown within "Send tab to device" in fxa menu if account is not configured.
fxa-menu-send-tab-to-device-description = 发送一个标签页立即地到任何的装置 you are 你（你们）是有符号的在在.

fxa-menu-sign-out =
    .label = 正负号外面的…


fxa-menu-sync-description = 访问你的网无论何处

fxa-avatar-sign-in = 正负号在
fxa-avatar-sign-up = 正负号向上的
fxa-avatar-tooltip =
    .tooltiptext = 正负号在到你的帐户

## Dialog strings that we show the user when signing into Mozilla account/setting up sync

sync-setup-verify-continue = 继续
sync-setup-verify-title = 合并警告
sync-setup-verify-heading = 你确定你想要到正负号在到同步的?

##

# The user was previously signed into sync. This dialog confirms to the user
# that they will be merging the data from the previously signed in into the newly signed in one
# Variables:
#   $email - Email address of a user previously signed into sync.
sync-setup-verify-description = 一个不同的用户曾是先前地有符号的在到同步的在这计算机. 签署在将合并这 browser's 书签, 密码和其他的设置与 { $email }

## Sync warning strings that support the browser profiles feature, these will be shown when the user might be merging data

# Dialog 1 - different account signing in without option to merge
sync-profile-different-account-title = 帐户界限到达( reach的过去式和过去分词 ) 为了这提问档
sync-profile-different-account-header = 这提问档曾是先前地 synchronization 的缩略词到一个不同的帐户

# Variables:
#   $acctEmail (String) - Email of the account signing into sync.
sync-profile-different-account-description = 到保持你的资料有组织的和无虑的, 每个 { -brand-product-name } 提问档能仅是 synchronization 的缩略词到一(个) 帐户. 到正负号在使用 { $acctEmail }, 创建新配置文件.

# Dialog 1 - different account signing in with merge option
sync-profile-different-account-title-merge = 提问档 synchronization 的缩略词到不同的帐户

# Variables:
#   $acctEmail (String) - Email of the account signing into sync.
#   $profileName (String) - Name of the current profile
sync-profile-different-account-description-merge = 到保持你的资料有组织的和无虑的, 我们推荐创建一个新的提问档到正负号在使用 { $acctEmail }. 如果你选取到继续到同步的在这提问档, 资料从两者的帐户将是永久性的合并在“{ $profileName }”.

# Dialog 2 - account signed in on another profile without option to merge
sync-account-in-use-header = 帐户已经在使用

# Variables:
#   $acctEmail (String) - Email of the account signing into sync.
#   $otherProfile (String) - Name of the other profile that is associated with the account
sync-account-in-use-header-merge = { $acctEmail } 是已经有符号的在到那“{ $otherProfile }”提问档
sync-account-in-use-description = 你能仅关联这帐户与一(个) 提问档在这计算机.

# Dialog 2 - account signed in on another profile with merge option
sync-account-already-signed-in-header = 这帐户是有符号的在到另外的提问档. 同步的两者的提问档?

# Variables:
#   $acctEmail (String) - Email of the account signing into sync.
#   $currentProfile (String): Name of the current profile signing in
#   $otherProfile (String): Name of the profile that is already signed in
sync-account-in-use-description-merge = { $acctEmail } 是有符号的在到那“{ $otherProfile }”提问档在这计算机. 【电影、电视】那“{ $currentProfile }”提问档将永久性的 (使)联合资料从两者的提问档, 如此的作为密码和书签.

# Variables:
#   $profileName (String) - Name of the profile to switch to
sync-button-switch-profile = 开关到“{ $profileName }”
sync-button-create-profile = 创建一个新的提问档
sync-button-sync-and-merge = 同步的和合并资料
# Variables:
#   $profileName (String) - Name of the profile to switch to
sync-button-sync-profile = 同步的“{ $profileName }”
