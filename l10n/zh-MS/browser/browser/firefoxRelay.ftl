# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Error messages for failed HTTP web requests.
## https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status#client_error_responses
## Variables:
##   $status (Number) - HTTP status code, for example 403

firefox-relay-mask-generation-failed = { -relay-brand-name } 能够不产生一个新的屏蔽. HTTP 错误代码: { $status }.
firefox-relay-get-reusable-masks-failed = { -relay-brand-name } 能够不发现可重复使用的屏蔽. HTTP 错误代码: { $status }.

##

firefox-relay-must-login-to-account = 正负号在到你的帐户到使用你的 { -relay-brand-name } 电子信函屏蔽.
firefox-relay-get-unlimited-masks =
    .label = 管理屏蔽
    .accesskey = M
# $count (Number) - The number of free email masks the user has used
firefox-relay-reuse-masks-header =
    { $count ->
        *[other] you have 你（们）已经使用所有的 { $count } 自由的电子信函屏蔽
    }
# Description following warning that the user has used all their free email masks.
# The user is presented a list of recently used masks to select, or they can click a button to see all masks.
firefox-relay-reuse-masks-description-v2 = 你能再使用一(个) 或看见所有的屏蔽到选取一个不同的一(个).
firefox-relay-reuse-masks-select-label = 选择一个最近的屏蔽
firefox-relay-see-all-masks =
    .label = 看见所有的屏蔽
    .accesskey = S
firefox-relay-dismiss =
    .label = 解散
    .accesskey = D
# This is followed, on a new line, by firefox-relay-opt-in-subtitle-1
firefox-relay-opt-in-title-1 = 防卫你的电子信函地址:
# This is preceded by firefox-relay-opt-in-title-1 (on a different line), which
# ends with a colon. You might need to adapt the capitalization of this string.
firefox-relay-opt-in-subtitle-1 = 使用 { -relay-brand-name } 电子信函屏蔽
firefox-relay-use-mask-title-1 = 使用一个电子信函屏蔽
firefox-relay-use-mask-title = 使用 { -relay-brand-name } 电子信函屏蔽
# This is followed, on a new line, by firefox-relay-opt-in-subtitle-b
firefox-relay-opt-in-title-b = 获得一个自由的电子信函屏蔽
# This is preceded by firefox-relay-opt-in-title-b (on a different line)
firefox-relay-opt-in-subtitle-b = 防卫你的入站从罐头猪肉
firefox-relay-opt-in-confirmation-enable-button =
    .label = 使用电子信函屏蔽
    .accesskey = U
firefox-relay-opt-in-confirmation-disable =
    .label = 不要显示我这再一次
    .accesskey = D
firefox-relay-opt-in-confirmation-postpone =
    .label = 不现在
    .accesskey = N

firefox-relay-and-fxa-opt-in-confirmation-disable =
    .label = 不要显示我这再一次
    .accesskey = D
firefox-relay-and-fxa-opt-in-confirmation-postpone =
    .label = 不现在
    .accesskey = N

## The "with-domain" variation of the Relay offer popup

firefox-relay-and-fxa-popup-notification-header-with-domain = 获得一个自由的电子信函屏蔽

firefox-relay-and-fxa-popup-notification-first-sentence = 防卫你的入站从罐头猪肉由使用一个自由的 <label data-l10n-name="firefox-relay-learn-more-url">{ -relay-brand-name } 电子信函屏蔽</label> 到隐藏你的实数地址. 电子信函从 <label data-l10n-name="firefox-fxa-and-relay-offer-domain">此站点</label> 将仍然过来到你的入站, 除了与你的电子信函隐藏的.

firefox-relay-offer-why-to-use-relay-1 = 防卫你的入站从罐头猪肉由使用一个自由的 <label data-l10n-name="firefox-relay-learn-more-url">{ -relay-brand-name } 电子信函屏蔽</label> 到隐藏你的实数地址. 电子信函从 <label data-l10n-name="firefox-fxa-and-relay-offer-domain">此站点</label> 将仍然过来到你的入站, 除了与你的电子信函隐藏的.

## The "with-domain-and-value-prop" variation of the Relay offer popup

firefox-relay-and-fxa-popup-notification-second-sentence-with-domain-and-value-prop = 首先, 正负号向上的或正负号在到你的帐户到使用一个电子信函屏蔽.

firefox-relay-and-fxa-opt-in-confirmation-enable-button-with-domain-and-value-prop =
    .label = 近邻干扰
    .accesskey = N
