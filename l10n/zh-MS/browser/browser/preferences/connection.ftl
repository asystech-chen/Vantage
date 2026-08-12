# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

connection-window2 =
    .title = 连接设置
    .style =
        { PLATFORM() ->
            [macos] 最小宽度：44em
           *[other] 最小宽度：49em
        }

connection-close-key =
    .key = w

connection-disable-extension =
    .label = 禁用扩展

connection-proxy-configure = 配置代理以访问互联网

connection-proxy-option-no =
    .label = 无代理
    .accesskey = y
connection-proxy-option-system =
    .label = 使用系统代理设置
    .accesskey = U
connection-proxy-option-wpad =
    .label = 使用系统Web代理自动发现设置
    .accesskey = g
connection-proxy-option-auto =
    .label = 自动检测此网络的代理设置
    .accesskey = w
connection-proxy-option-manual =
    .label = 手动代理配置
    .accesskey = M

connection-proxy-http = HTTP代理
    .accesskey = x
connection-proxy-http-port = 端口
    .accesskey = P
connection-proxy-https-sharing =
    .label = 同时将此代理用于HTTPS
    .accesskey = s

connection-proxy-https = HTTPS代理
    .accesskey = H
connection-proxy-ssl-port = 端口
    .accesskey = o

connection-proxy-socks = SOCKS主机
    .accesskey = C
connection-proxy-socks-port = 端口
    .accesskey = t

connection-proxy-socks4 =
    .label = SOCKS v4
    .accesskey = K
connection-proxy-socks5 =
    .label = SOCKS v5
    .accesskey = v
connection-proxy-noproxy = 不代理以下地址
    .accesskey = N

connection-proxy-noproxy-desc = 示例：.mozilla.org、.net.nz、192.168.1.0/24

# Do not translate "localhost", "127.0.0.1/8" and "::1". (You can translate "and".)
connection-proxy-noproxy-localhost-desc-2 = 对localhost、127.0.0.1/8和::1的连接从不被代理。

connection-proxy-autotype =
    .label = 自动代理配置URL
    .accesskey = A

connection-proxy-reload =
    .label = 重新加载
    .accesskey = e

connection-proxy-autologin-checkbox =
    .label = 若已保存密码，则不提示身份验证
    .accesskey = i
    .tooltiptext = 当您已为代理保存凭据时，此选项将静默地验证您的身份。若验证失败，将提示您进行认证。

connection-proxy-socks4-remote-dns =
    .label = 使用SOCKS v4时代理DNS
    .accesskey = 4

connection-proxy-socks-remote-dns =
    .label = 使用SOCKS v5时代理DNS
    .accesskey = D

# Variables:
#   $name (String) - Display name or URL for the DNS over HTTPS provider
connection-dns-over-https-url-item-default =
    .label = { $name }（默认）
    .tooltiptext = 使用默认URL进行DNS over HTTPS解析

connection-dns-over-https-url-custom =
    .label = 自定义
    .accesskey = C
    .tooltiptext = 输入您首选的URL以进行DNS over HTTPS解析
