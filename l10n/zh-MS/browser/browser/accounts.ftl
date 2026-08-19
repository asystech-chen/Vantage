# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Used as the FxA toolbar menu item value when user has not
# finished setting up an account.
account-finish-account-setup = 完成帐户设置

# Used as the FxA toolbar menu item title when the user
# needs to reconnect their account.
account-disconnected2 = 帐户分离的

# Menu item that sends a tab to all synced devices.
account-send-to-all-devices = 发送到所有的装置

# Menu item that links to the Firefox Accounts settings for connected devices.
account-manage-devices = 管理装置…

## Variables:
##   $email (String): = Email address of user's Firefox Account.

account-reconnect = 使再接合 { $email }
account-verify = 证明 { $email }

## Displayed in the Send Tab/Page/Link to Device context menu when right clicking a tab, a page or a link.

account-send-to-all-devices-titlecase = 发送到所有的装置
account-manage-devices-titlecase = 管理装置…

## Displayed in the Send Tabs context menu when right clicking a tab, a page or a link
## and the Sync account is unverified. Redirects to the Sync preferences page.

account-send-tab-to-device-verify-status = 帐户不已查清的
account-send-tab-to-device-verify2 = 证明你的帐户

## These strings are used in a notification shown when a new device joins the Firefox account.

# The title shown in a notification when either this device or another device
# has connected to, or disconnected from, a Firefox account.
account-connection-title-2 = 帐户

# Variables:
#   $deviceName (String): the name of the new device
account-connection-connected-with = 这计算机是现在连接的与 { $deviceName }.

# Used when the name of the new device is not known.
account-connection-connected-with-noname = 这计算机是现在连接的与一个新的装置.

# Used in a notification shown after a Firefox account is connected to the current device.
account-connection-connected = 你有有符号的在成功

# Used in a notification shown after the Firefox account was disconnected remotely.
account-connection-disconnected = 这计算机有是分离的.

## These strings are used in a notification shown when we're opening
## a single tab another device sent us to display.
## The body for this notification is the URL of the received tab.

account-single-tab-arriving-title = Tab 被一般承认的
# Variables:
#   $deviceName (String): the device name.
account-single-tab-arriving-from-device-title = Tab 从 { $deviceName }

# Used when a tab from a remote device arrives but the URL must be truncated.
# Should display the URL with an indication that it's been truncated.
# Variables:
#   $url (String): the portion of the URL that remains after truncation.
account-single-tab-arriving-truncated-url = { $url }…

## These strings are used in a notification shown when we're opening
## multiple tabs another device or devices sent us to display.
## Variables:
##   $tabCount (Number): the number of tabs received

account-multiple-tabs-arriving-title = 标签页被一般承认的

# Variables:
#   $deviceName (String): the device name.
account-multiple-tabs-arriving-from-single-device =
    { $tabCount ->
        [one] { $tabCount } 标签页有抵达从 { $deviceName }
       *[other] { $tabCount } 标签页有抵达从 { $deviceName }
    }
account-multiple-tabs-arriving-from-multiple-devices =
    { $tabCount ->
        [one] { $tabCount } 标签页有抵达从你的连接的装置
       *[other] { $tabCount } 标签页有抵达从你的连接的装置
    }
# This version is used when we don't know any device names.
account-multiple-tabs-arriving-from-unknown-device =
    { $tabCount ->
        [one] { $tabCount } 标签页有抵达
       *[other] { $tabCount } 标签页有抵达
    }

## These strings are used in notifications in which the user remotely closed
## tabs from other devices
## Variables:
##   $closedCount (Number): the number of tabs closed

account-view-recently-closed-tabs = 查看最近关闭标签页
account-tabs-closed-remotely =
    {
        $closedCount ->
            [one] { $closedCount } { -brand-short-name } 标签页关闭
           *[other] { $closedCount } { -brand-short-name } 标签页关闭
    }
