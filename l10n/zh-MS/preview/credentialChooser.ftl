# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Credential Chooser panel
##
## Variables:
##  $host (String): the hostname of the website that the user is on.
##  $provider (String): the hostname of a website the user has an account on, but is not the one they are on now (e.g. "apple.com", "accounts.google.com", "identity.example.com")

credential-chooser-header = 会你喜欢到正负号在到 { $host }?
credential-chooser-identity = 使用一个 { $provider } 帐户
credential-chooser-sign-in-button =
    .label = 正负号在
    .accesskey = S
credential-chooser-cancel-button =
    .label = 取消
    .accesskey = C
credential-chooser-urlbar-anchor =
    .tooltiptext = 打开国书嵌板
# This indicates that an account is initially from another website.
# This is short for "we are getting this thing from { $provider } in English.
# This is displayed on a new line below the provider's name.
credential-chooser-host-descriptor = 从 { $provider }
