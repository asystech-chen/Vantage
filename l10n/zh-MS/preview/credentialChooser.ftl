# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Credential Chooser panel
##
## Variables:
##  $host (String): the hostname of the website that the user is on.
##  $provider (String): the hostname of a website the user has an account on, but is not the one they are on now (e.g. "apple.com", "accounts.google.com", "identity.example.com")

credential-chooser-header = 您是否希望登录至 { $host }？
credential-chooser-identity = 使用 { $provider } 账户
credential-chooser-sign-in-button =
    .label = 登录
    .accesskey = S
credential-chooser-cancel-button =
    .label = 取消
    .accesskey = C
credential-chooser-urlbar-anchor =
    .tooltiptext = 启动凭据面板
# This indicates that an account is initially from another website.
# This is short for "we are getting this thing from { $provider } in English.
# This is displayed on a new line below the provider's name.
credential-chooser-host-descriptor = 来自 { $provider }
