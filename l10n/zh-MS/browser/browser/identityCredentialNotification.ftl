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

identity-credential-header-providers = 请使用登录提供程序进行登录
identity-credential-header-accounts = 正在使用 { $provider } 进行登录
identity-credential-urlbar-anchor =
    .tooltiptext = 启动登录面板
identity-credential-cancel-button =
    .label = 取消
    .accesskey = n
identity-credential-accept-button =
    .label = 继续
    .accesskey = C
identity-credential-sign-in-button =
    .label = 登录
    .accesskey = S
identity-credential-policy-title = 使用 { $provider } 作为登录提供程序
identity-credential-policy-description = 使用 { $provider } 账户登录 { $host } 时，您需要遵守其<label data-l10n-name="privacy-url">隐私政策</label>和<label data-l10n-name="tos-url">服务条款</label>。
