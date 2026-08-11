# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Error messages for failed HTTP web requests.
## https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status#client_error_responses
## Variables:
##   $status (Number) - HTTP status code, for example 403

firefox-relay-mask-generation-failed = { -relay-brand-name } 无法生成新的掩码。HTTP 错误代码：{ $status }。
firefox-relay-get-reusable-masks-failed = { -relay-brand-name } 无法找到可重复使用的掩码。HTTP 错误代码：{ $status }。

##

firefox-relay-must-login-to-account = 请登录您的账户以使用您的 { -relay-brand-name } 电子邮件掩码。
firefox-relay-get-unlimited-masks =
    .label = 管理掩码
    .accesskey = M
# $count (Number) - The number of free email masks the user has used
firefox-relay-reuse-masks-header =
    { $count ->
        *[other] 您已使用全部 { $count } 个免费电子邮件掩码
    }
# Description following warning that the user has used all their free email masks.
# The user is presented a list of recently used masks to select, or they can click a button to see all masks.
firefox-relay-reuse-masks-description-v2 = 您可以重复使用一个掩码，或查看所有掩码以选择不同的掩码。
firefox-relay-reuse-masks-select-label = 选择一个最近的掩码
firefox-relay-see-all-masks =
    .label = 查看所有掩码
    .accesskey = S
firefox-relay-dismiss =
    .label = 关闭
    .accesskey = D
# This is followed, on a new line, by firefox-relay-opt-in-subtitle-1
firefox-relay-opt-in-title-1 = 保护您的电子邮件地址：
# This is preceded by firefox-relay-opt-in-title-1 (on a different line), which
# ends with a colon. You might need to adapt the capitalization of this string.
firefox-relay-opt-in-subtitle-1 = 使用 { -relay-brand-name } 电子邮件掩码
firefox-relay-use-mask-title-1 = 使用电子邮件掩码
firefox-relay-use-mask-title = 使用 { -relay-brand-name } 电子邮件掩码
# This is followed, on a new line, by firefox-relay-opt-in-subtitle-b
firefox-relay-opt-in-title-b = 获取免费电子邮件掩码
# This is preceded by firefox-relay-opt-in-title-b (on a different line)
firefox-relay-opt-in-subtitle-b = 保护您的收件箱免受垃圾邮件的侵扰
firefox-relay-opt-in-confirmation-enable-button =
    .label = 使用电子邮件掩码
    .accesskey = U
firefox-relay-opt-in-confirmation-disable =
    .label = 不再向我显示此内容
    .accesskey = D
firefox-relay-opt-in-confirmation-postpone =
    .label = 暂不处理
    .accesskey = N

firefox-relay-and-fxa-opt-in-confirmation-disable =
    .label = 不再向我显示此内容
    .accesskey = D
firefox-relay-and-fxa-opt-in-confirmation-postpone =
    .label = 暂不处理
    .accesskey = N

## The "with-domain" variation of the Relay offer popup

firefox-relay-and-fxa-popup-notification-header-with-domain = 获取免费电子邮件掩码

firefox-relay-and-fxa-popup-notification-first-sentence = 使用免费的 <label data-l10n-name="firefox-relay-learn-more-url">{ -relay-brand-name } 电子邮件掩码</label> 隐藏您的真实地址，以保护您的收件箱免受垃圾邮件的侵扰。来自 <label data-l10n-name="firefox-fxa-and-relay-offer-domain">此站点</label> 的电子邮件仍将发送至您的收件箱，但您的电子邮件地址将被隐藏。

firefox-relay-offer-why-to-use-relay-1 = 使用免费的 <label data-l10n-name="firefox-relay-learn-more-url">{ -relay-brand-name } 电子邮件掩码</label> 隐藏您的真实地址，以保护您的收件箱免受垃圾邮件的侵扰。来自 <label data-l10n-name="firefox-fxa-and-relay-offer-domain">此站点</label> 的电子邮件仍将发送至您的收件箱，但您的电子邮件地址将被隐藏。

## The "with-domain-and-value-prop" variation of the Relay offer popup

firefox-relay-and-fxa-popup-notification-second-sentence-with-domain-and-value-prop = 首先，请注册或登录您的账户以使用电子邮件掩码。

firefox-relay-and-fxa-opt-in-confirmation-enable-button-with-domain-and-value-prop =
    .label = 下一步
    .accesskey = N