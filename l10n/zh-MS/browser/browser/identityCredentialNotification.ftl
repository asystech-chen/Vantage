# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Credential panel
##
## Identity providers are websites you use to log in to another website, for
## example: Google when you Log in with Google.
##
## Variables:
##  $host (String): the hostname of the site that is being displayed.
##  $provider (String): the hostname of another website you are using to log in to the site being displayed

identity-credential-header-providers = 正负号在与一个注册(程序) 提供器
identity-credential-header-accounts = 正负号在与 { $provider }
identity-credential-urlbar-anchor =
    .tooltiptext = 打开注册(程序) 嵌板
identity-credential-cancel-button =
    .label = 取消
    .accesskey = n
identity-credential-accept-button =
    .label = 继续
    .accesskey = C
identity-credential-sign-in-button =
    .label = 正负号在
    .accesskey = S
identity-credential-policy-title = 使用 { $provider } 作为一个注册(程序) 提供器
identity-credential-policy-description = (木材)采运作业在到 { $host } 与一个 { $provider } 帐户是主题到他们的 <label data-l10n-name="privacy-url">隐私政策</label> 和 <label data-l10n-name="tos-url">检索词的服务</label>.
