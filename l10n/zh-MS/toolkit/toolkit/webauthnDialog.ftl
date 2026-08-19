
webauthn-pin-invalid-long-prompt =
    { $retriesLeft ->
        [one] 不正确的 PIN. 你有 { $retriesLeft } 尝试许可在...之前你永久性的遗失访问到那国书在这装置.
       *[other] 不正确的 PIN. 你有 { $retriesLeft } 尝试许可在...之前你永久性的遗失访问到那国书在这装置.
    }
webauthn-pin-invalid-short-prompt = 不正确的 PIN. 尝试再一次.
webauthn-pin-required-prompt = 请输入那 PIN 为了你的装置.

webauthn-select-sign-result-unknown-account = 不知道的帐户

webauthn-a-passkey-label = 使用一个总钥匙
webauthn-another-passkey-label = 使用另外的总钥匙

webauthn-specific-passkey-label = 总钥匙为了 { $domain }

webauthn-uv-invalid-long-prompt =
    { $retriesLeft ->
        [one] 用户验证失败的. 你有 { $retriesLeft } 尝试许可. 尝试再一次.
       *[other] 用户验证失败的. 你有 { $retriesLeft } 尝试许可. 尝试再一次.
    }
webauthn-uv-invalid-short-prompt = 用户验证失败的. 尝试再一次.


webauthn-user-presence-prompt = 触觉你的安全键到继续与 { $hostname }.
webauthn-register-direct-prompt =
    { $hostname } is requesting extended information about your security key, which may affect your privacy.
webauthn-register-direct-prompt-hint =
    { -brand-short-name } can anonymize this for you, but the website might decline this key. If declined, you can try again.
webauthn-select-sign-result-prompt =
    倍数帐户发现为了 { $hostname }. 选择哪个到使用或取消.
webauthn-select-device-prompt =
    倍数装置发现为了 { $hostname }. 请选择一(个).
webauthn-device-blocked-prompt =
    用户验证失败的在 { $hostname }. 那里是无尝试许可和你的装置有是上锁的, 因为那错误的 PIN 曾是倘若也多数时间. 那装置需要一个重置.
webauthn-pin-auth-blocked-prompt =
    用户验证失败的在 { $hostname }. 那里曾是也多数失败的尝试在一个行和 PIN 验证有是暂时阻止. 你的装置需要一个功率环路 (拔开...的塞子和赖斯编码-insert).
webauthn-pin-not-set-prompt =
    用户验证失败的在 { $hostname }. 你可以需要到放一个 PIN 在你的装置.
webauthn-uv-blocked-prompt =
    用户验证失败的在 { $hostname }. 那里曾是也多数失败的尝试和那构造-in 用户验证方法有是阻止.
webauthn-already-registered-prompt =
    这装置是已经注册的. 尝试一个不同的装置.
webauthn-cancel = 取消
    .accesskey = c
webauthn-allow = 允许
    .accesskey = A
webauthn-block = 阻止
    .accesskey = B
webauthn-continue = 继续
    .accesskey = n

webauthn-related-origin-create-header = { $origin } 想要到创建一个总钥匙为了 { $rpId }.
webauthn-related-origin-use-header = { $origin } 想要到使用一个总钥匙为了 { $rpId }.
