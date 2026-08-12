# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

connection-window2 =
    .title = 连接设置
    .style =
        { PLATFORM() ->
            [macos] min-width: 44媒体用毕符
           *[other] min-width: 49媒体用毕符
        }

connection-close-key =
    .key = w

connection-disable-extension =
    .label = 禁用扩展名

connection-proxy-configure = 装配代理访问到那因特网

connection-proxy-option-no =
    .label = 无代理
    .accesskey = y
connection-proxy-option-system =
    .label = 使用系统代理设置
    .accesskey = U
connection-proxy-option-wpad =
    .label = 使用系统网代理汽车-发现设置
    .accesskey = g
connection-proxy-option-auto =
    .label = 汽车-detect 代理设置为了这网络
    .accesskey = w
connection-proxy-option-manual =
    .label = 人工的代理配置
    .accesskey = M

connection-proxy-http = HTTP 代理
    .accesskey = x
connection-proxy-http-port = 端口
    .accesskey = P
connection-proxy-https-sharing =
    .label = 也使用这代理为了 HTTPS
    .accesskey = s

connection-proxy-https = HTTPS 代理
    .accesskey = H
connection-proxy-ssl-port = 端口
    .accesskey = o

connection-proxy-socks = SOCKS 主机
    .accesskey = C
connection-proxy-socks-port = 端口
    .accesskey = t

connection-proxy-socks4 =
    .label = SOCKS 溢出4
    .accesskey = K
connection-proxy-socks5 =
    .label = SOCKS 溢出5
    .accesskey = v
connection-proxy-noproxy = 无代理为了
    .accesskey = N

connection-proxy-noproxy-desc = 例子: .摩斯拉.org, .net.nz, 192.168.1.0/24

# Do not translate "localhost", "127.0.0.1/8" and "::1". (You can translate "and".)
connection-proxy-noproxy-localhost-desc-2 = 连接到本地主机, 127.0.0.1/8, 和 ::1 是从不 (proxy 的过去分词) n. 代理.

connection-proxy-autotype =
    .label = 自动手枪代理配置 URL
    .accesskey = A

connection-proxy-reload =
    .label = 再装
    .accesskey = e

connection-proxy-autologin-checkbox =
    .label = 做不激励为了验证如果密码是保存
    .accesskey = i
    .tooltiptext = 这选项默默地证明是真实的、可靠的或有效的( authenticate的名词复数 ) 你到代理何时你有保存国书为了他们. 你将是引起如果验证失败.

connection-proxy-socks4-remote-dns =
    .label = 代理 DNS 何时使用 SOCKS 溢出4
    .accesskey = 4

connection-proxy-socks-remote-dns =
    .label = 代理 DNS 何时使用 SOCKS 溢出5
    .accesskey = D

# Variables:
#   $name (String) - Display name or URL for the DNS over HTTPS provider
connection-dns-over-https-url-item-default =
    .label = { $name } (默认)
    .tooltiptext = 使用那默认 URL 为了解析 DNS 结束 HTTPS

connection-dns-over-https-url-custom =
    .label = 定制
    .accesskey = C
    .tooltiptext = Enter 你的首选的 URL 为了解析 DNS 结束 HTTPS
