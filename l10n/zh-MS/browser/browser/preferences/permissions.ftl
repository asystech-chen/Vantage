# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

permissions-window2 =
    .title = 例外
    .style = min-width: 45em

permissions-close-key =
    .key = w

permissions-address = 网站地址
    .accesskey = d

permissions-block =
    .label = 阻止
    .accesskey = B

permissions-disable-etp =
    .label = 添加例外
    .accesskey = E

permissions-session =
    .label = 允许本次会话
    .accesskey = S

permissions-allow =
    .label = 允许
    .accesskey = A

permissions-add =
    .label = 添加
    .accesskey = A

permissions-button-off =
    .label = 关闭
    .accesskey = O

permissions-button-off-temporarily =
    .label = 暂时关闭
    .accesskey = T

permissions-site-name =
    .label = 网站

permissions-status =
    .label = 状态

permissions-remove =
    .label = 移除网站
    .accesskey = R

permissions-remove-all =
    .label = 移除所有网站
    .accesskey = e

permission-dialog =
    .buttonlabelaccept = 保存更改
    .buttonaccesskeyaccept = S

permissions-autoplay-menu = 所有网站的默认设置：

permissions-searchbox =
    .placeholder = 搜索网站

permissions-capabilities-autoplay-allow =
    .label = 允许音频和视频
permissions-capabilities-autoplay-block =
    .label = 阻止音频
permissions-capabilities-autoplay-blockall =
    .label = 阻止音频和视频

permissions-capabilities-allow =
    .label = 允许
permissions-capabilities-block =
    .label = 阻止
permissions-capabilities-prompt =
    .label = 始终询问

permissions-capabilities-listitem-allow =
    .value = 允许
permissions-capabilities-listitem-block =
    .value = 阻止
permissions-capabilities-listitem-allow-session =
    .value = 允许本次会话

permissions-capabilities-listitem-off =
    .value = 关闭
permissions-capabilities-listitem-off-temporarily =
    .value = 暂时关闭

## Invalid Hostname Dialog

permissions-invalid-uri-title = 输入了无效的主机名
permissions-invalid-uri-label = 请输入有效的主机名

## Exceptions - Tracking Protection

permissions-exceptions-etp-window2 =
    .title = 增强跟踪保护的例外
    .style = { permissions-window2.style }
permissions-exceptions-manage-etp-desc = 您可以指定哪些网站已关闭增强跟踪保护。请输入您要管理的网站的确切地址，然后单击“添加例外”。

## Exceptions - Cookies

permissions-exceptions-cookie-window2 =
    .title = 例外 - Cookie 和站点数据
    .style = { permissions-window2.style }
permissions-exceptions-cookie-desc = 您可以指定哪些网站始终允许或永远不允许使用 Cookie 和站点数据。请输入您要管理的网站的确切地址，然后单击“阻止”、“允许本次会话”或“允许”。

## Exceptions - HTTPS-Only Mode

permissions-exceptions-https-only-window2 =
    .title = 例外 - 仅 HTTPS 模式
    .style = { permissions-window2.style }
permissions-exceptions-https-only-desc2 = 您可以针对特定网站关闭仅 HTTPS 模式。{ -brand-short-name } 将不会尝试为这些网站将连接升级到安全的 HTTPS。

## Exceptions - Pop-ups And Third-Party Redirects

permissions-exceptions-popup-window3 =
.title = 允许的网站 - 弹窗和第三方重定向
    .style = { permissions-window2.style }
permissions-exceptions-popup-desc2 = 您可以指定哪些网站被允许打开弹窗窗口并被第三方框架重定向。

## Exceptions - Saved Passwords

permissions-exceptions-saved-passwords-window =
    .title = 例外 - 已保存的密码
    .style = { permissions-window2.style }
permissions-exceptions-saved-passwords-desc = { -brand-short-name } 将不会为此处列出的网站保存密码。

## Exceptions - Add-ons

permissions-exceptions-addons-window2 =
    .title = 允许的网站 - 附加组件安装
    .style = { permissions-window2.style }
permissions-exceptions-addons-desc = 您可以指定哪些网站被允许安装附加组件。请输入您要允许的网站的精确地址，然后单击“允许”。

## Site Permissions - Autoplay

permissions-site-autoplay-window2 =
    .title = 设置 - 自动播放
    .style = { permissions-window2.style }
permissions-site-autoplay-desc = 您可以在此管理不遵循您的默认自动播放设置的网站。

## Site Permissions - Notifications

permissions-site-notification-window2 =
    .title = 设置 - 通知权限
    .style = { permissions-window2.style }
permissions-site-notification-desc = 以下网站已请求向您发送通知。您可以指定哪些网站被允许向您发送通知。您还可以阻止新的请求以允许通知。
permissions-site-notification-disable-label =
    .label = 阻止新的请求以允许通知
permissions-site-notification-disable-desc = 这将阻止未在上方列出的任何网站请求发送通知的权限。阻止通知可能会破坏某些网站的功能。

## Site Permissions - Location

permissions-site-location-window2 =
    .title = 设置 - 位置权限
    .style = { permissions-window2.style }
permissions-site-location-desc = 以下网站已请求访问您的位置。您可以指定哪些网站被允许访问您的位置。您还可以阻止新的请求以访问您的位置。
permissions-site-location-disable-label =
    .label = 阻止新的请求以访问您的位置
permissions-site-location-disable-desc = 这将阻止未在上方列出的任何网站请求访问您的位置的权限。阻止访问您的位置可能会破坏某些网站的功能。

## Site Permissions - Virtual Reality

permissions-site-xr-window2 =
    .title = 设置 - 虚拟现实权限
    .style = { permissions-window2.style }
permissions-site-xr-desc = 以下网站已请求访问您的虚拟现实设备。您可以指定哪些网站被允许访问您的虚拟现实设备。您还可以阻止新的请求以访问您的虚拟现实设备。
permissions-site-xr-disable-label =
    .label = 阻止新的请求以访问您的虚拟现实设备
permissions-site-xr-disable-desc = 这将阻止未在上方列出的任何网站请求访问您的虚拟现实设备的权限。阻止访问您的虚拟现实设备可能会破坏某些网站的功能。

## Site Permissions - Camera

permissions-site-camera-window2 =
    .title = 设置 - 相机权限
    .style = { permissions-window2.style }
permissions-site-camera-desc = 以下网站已请求访问您的相机。您可以指定哪些网站被允许访问您的相机。您还可以阻止新的请求以访问您的相机。
permissions-site-camera-disable-label =
    .label = 阻止新的请求以访问您的相机
permissions-site-camera-disable-desc = 这将阻止未在上方列出的任何网站请求访问您的相机的权限。阻止访问您的相机可能会破坏某些网站的功能。

## Site Permissions - Loopback network

permissions-site-localhost-window =
    .title = 设置 - 设备应用程序和服务
    .style = { permissions-window2.style }
permissions-site-localhost-desc = 这些网站已请求访问此设备上的应用程序和服务。您可以选择允许或阻止网站执行此操作。

permissions-site-localhost-disable-label =
    .label = 阻止新的请求访问此设备上的应用程序和服务
permissions-site-localhost-disable-desc = 这将停止未在上方列出的任何网站请求访问此设备上的应用程序和服务。执行此操作可能会破坏某些网站的功能。

## Site Permissions - Local network

permissions-site-local-network-window =
    .title = 设置 - 本地网络设备
    .style = { permissions-window2.style }
permissions-site-local-network-desc = 这些网站已请求访问连接到您的 Wi-Fi 或本地网络的设备上的应用程序和服务。您可以选择允许或阻止网站执行此操作。

permissions-site-local-network-disable-label =
    .label = 阻止新的请求访问连接到您的 Wi-Fi 或本地网络的设备上的应用程序和服务。

permissions-site-local-network-disable-desc = 这将停止未在上方列出的任何网站请求访问连接到您的 Wi-Fi 或本地网络的设备上的应用程序和服务。执行此操作可能会破坏某些网站的功能。

## Site Permissions - Microphone

permissions-site-microphone-window2 =
    .title = 设置 - 麦克风权限
    .style = { permissions-window2.style }
permissions-site-microphone-desc = 以下网站已请求访问您的麦克风。您可以指定哪些网站被允许访问您的麦克风。您还可以阻止新的请求以访问您的麦克风。
permissions-site-microphone-disable-label =
    .label = 阻止新的请求以访问您的麦克风
permissions-site-microphone-disable-desc = 这将阻止未在上方列出的任何网站请求访问您的麦克风的权限。阻止访问您的麦克风可能会破坏某些网站的功能。

## Site Permissions - Speaker
##
## "Speaker" refers to an audio output device.

permissions-site-speaker-window =
    .title = 设置 - 扬声器权限
    .style = { permissions-window2.style }
permissions-site-speaker-desc = 以下网站已请求选择音频输出设备。您可以指定哪些网站被允许选择音频输出设备。

permissions-exceptions-doh-window =
    .title = 针对 HTTPS 上的 DNS 的网站例外
    .style = { permissions-window2.style }
permissions-exceptions-manage-doh-desc = { -brand-short-name } 将不会在这些网站及其子域上使用安全 DNS。

permissions-doh-entry-field = 输入网站域名
    .accesskey = d

permissions-doh-add-exception =
    .label = 添加
    .accesskey = A

permissions-doh-col =
.label = 域

permissions-doh-remove =
    .label = 删除
    .accesskey = R

permissions-doh-remove-all =
    .label = 删除全部
    .accesskey = e


## Site Permissions - EME

permissions-site-eme-window2 =
    .title = 设置 - EME 权限
    .style = { permissions-window2.style }
permissions-site-eme-desc = 以下网站已请求播放 DRM 受控内容。您可以指定允许播放 DRM 受控内容的网站。您也可以阻止新请求，请求播放 DRM 受控内容。
permissions-site-eme-disable-label =
    .label = 阻止新请求，请求播放 DRM 受控内容
permissions-site-eme-disable-desc = 此项操作将阻止未在上面列出的任何网站请求播放 DRM 受控内容的权限。

## Site Permissions - WebGL

permissions-site-webgl-window2 =
    .title = 设置 - WebGL 权限
    .style = { permissions-window2.style }
permissions-site-webgl-desc = 以下网站已请求创建 WebGL 上下文。您可以指定允许创建 WebGL 上下文的网站。您也可以阻止新请求，请求创建 WebGL 上下文。