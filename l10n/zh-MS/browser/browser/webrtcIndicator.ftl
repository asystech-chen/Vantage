# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These strings are used so that the window has a title in tools that
## enumerate/look for window titles. It is not normally visible anywhere.

webrtc-indicator-title = { -brand-short-name } — 共享指示器

## Used as list items in sharing menu

webrtc-item-camera = 摄像头
webrtc-item-microphone = 麦克风
webrtc-item-audio-capture = 标签页音频
webrtc-item-application = 应用程序
webrtc-item-screen = 屏幕
webrtc-item-window = 窗口
webrtc-item-browser = 标签页

##

# This is used for the website origin for the sharing menu if no readable origin could be deduced from the URL.
webrtc-sharing-menuitem-unknown-host = 未知来源

# Variables:
#   $origin (String): The website origin (e.g. www.mozilla.org)
#   $itemList (String): A formatted list of items (e.g. "camera, microphone and tab audio")
webrtc-sharing-menuitem =
    .label = { $origin } ({ $itemList })
webrtc-sharing-menu =
    .label = 正在共享设备的标签页
    .accesskey = d

webrtc-sharing-window = 您正在共享另一个应用程序窗口。
webrtc-sharing-browser-window = 您正在共享 { -brand-short-name }。
webrtc-sharing-screen = 您正在共享您的整个屏幕。
webrtc-stop-sharing-button = 停止共享
webrtc-microphone-unmuted =
    .title = 关闭麦克风
webrtc-microphone-muted =
    .title = 开启麦克风
webrtc-camera-unmuted =
    .title = 关闭摄像头
webrtc-camera-muted =
    .title = 开启摄像头
webrtc-minimize =
    .title = 最小化指示器

## These strings will display as a tooltip on supported systems where we show
## device sharing state in the OS notification area. We do not use these strings
## on macOS, as global menu bar items do not have native tooltips.

webrtc-camera-system-menu =
    .label = 您正在共享您的摄像头。单击以控制共享。
webrtc-microphone-system-menu =
    .label = 您正在共享您的麦克风。单击以控制共享。
webrtc-screen-system-menu =
    .label = 您正在共享一个窗口或一个屏幕。单击以控制共享。

## These strings are only used on Mac for menus attached to icons
## near the clock on the mac menubar.
## Variables:
##   $streamTitle (String): the host of the tab using the share.
##   $tabCount (Number): the title of the tab using the share.

webrtc-indicator-menuitem-control-sharing =
    .label = 控制共享
webrtc-indicator-menuitem-control-sharing-on =
    .label = 控制“{ $streamTitle }”上的共享

webrtc-indicator-menuitem-sharing-camera-with =
    .label = 正在与“{ $streamTitle }”共享摄像头
webrtc-indicator-menuitem-sharing-camera-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 正在与 { $tabCount } 个标签页共享摄像头
           *[other] 正在与 { $tabCount } 个标签页共享摄像头
        }

webrtc-indicator-menuitem-sharing-microphone-with =
    .label = 正在与“{ $streamTitle }”共享麦克风
webrtc-indicator-menuitem-sharing-microphone-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 正在与 { $tabCount } 个标签页共享麦克风
           *[other] 正在与 { $tabCount } 个标签页共享麦克风
        }

webrtc-indicator-menuitem-sharing-application-with =
    .label = 正在与“{ $streamTitle }”共享应用程序
webrtc-indicator-menuitem-sharing-application-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 正在与 { $tabCount } 个标签页共享应用程序
           *[other] 正在与 { $tabCount } 个标签页共享应用程序
        }

webrtc-indicator-menuitem-sharing-screen-with =
    .label = 正在与“{ $streamTitle }”共享屏幕
webrtc-indicator-menuitem-sharing-screen-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 正在与 { $tabCount } 个标签页共享屏幕
           *[other] 正在与 { $tabCount } 个标签页共享屏幕
        }

webrtc-indicator-menuitem-sharing-window-with =
    .label = 正在与“{ $streamTitle }”共享窗口
webrtc-indicator-menuitem-sharing-window-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 正在与 { $tabCount } 个标签页共享窗口
           *[other] 正在与 { $tabCount } 个标签页共享窗口
        }

webrtc-indicator-menuitem-sharing-browser-with =
    .label = 正在与“{ $streamTitle }”共享标签页
# This message is shown when the contents of a tab is shared during a WebRTC
# session, which currently is only possible with Loop/Hello.
webrtc-indicator-menuitem-sharing-browser-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 正在与 { $tabCount } 个标签页共享
           *[other] 正在与 { $tabCount } 个标签页共享
        }

## Variables:
##   $origin (String): the website origin (e.g. www.mozilla.org).

webrtc-allow-share-audio-capture = 是否允许 { $origin } 监听此标签页的音频？
webrtc-allow-share-camera = 是否允许 { $origin } 使用您的摄像头？
webrtc-allow-share-microphone = 是否允许 { $origin } 使用您的麦克风？
webrtc-allow-share-screen = 是否允许 { $origin } 查看您的屏幕？
# "Speakers" is used in a general sense that might include headphones or
# another audio output connection.
webrtc-allow-share-speaker = 是否允许 { $origin } 使用其他扬声器？
webrtc-allow-share-camera-and-microphone = 是否允许 { $origin } 使用您的摄像头和麦克风？
webrtc-allow-share-camera-and-audio-capture = 是否允许 { $origin } 使用您的摄像头并监听此标签页的音频？
webrtc-allow-share-screen-and-microphone = 是否允许 { $origin } 使用您的麦克风并查看您的屏幕？
webrtc-allow-share-screen-and-audio-capture = 是否允许 { $origin } 监听此标签页的音频并查看您的屏幕？

## Special phrasing for sharing devices when the origin is a file url.

webrtc-allow-share-audio-capture-with-file = 是否允许此本地文件监听此标签页的音频？
webrtc-allow-share-camera-with-file = 是否允许此本地文件使用您的摄像头？
webrtc-allow-share-microphone-with-file = 是否允许此本地文件使用您的麦克风？
webrtc-allow-share-screen-with-file = 是否允许此本地文件查看您的屏幕？
# "Speakers" is used in a general sense that might include headphones or
# another audio output connection.
webrtc-allow-share-speaker-with-file = 是否允许此本地文件使用其他扬声器？
webrtc-allow-share-camera-and-microphone-with-file = 是否允许此本地文件使用您的摄像头和麦克风？
webrtc-allow-share-camera-and-audio-capture-with-file = 是否允许此本地文件使用您的摄像头并监听此标签页的音频？
webrtc-allow-share-screen-and-microphone-with-file = 是否允许此本地文件使用您的麦克风并查看您的屏幕？
webrtc-allow-share-screen-and-audio-capture-with-file = 是否允许此本地文件监听此标签页的音频并查看您的屏幕？

## Variables:
##   $origin (String): the first party origin.
##   $thirdParty (String): the third party origin.

webrtc-allow-share-audio-capture-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 监听此标签页音频的权限？
webrtc-allow-share-camera-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 访问您的摄像头的权限？
webrtc-allow-share-microphone-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 访问您的麦克风的权限？
webrtc-allow-share-screen-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 查看您的屏幕的权限？
# "Speakers" is used in a general sense that might include headphones or
# another audio output connection.
webrtc-allow-share-speaker-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 访问其他扬声器的权限？
webrtc-allow-share-camera-and-microphone-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 访问您的摄像头和麦克风的权限？
webrtc-allow-share-camera-and-audio-capture-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 访问您的摄像头并监听此标签页音频的权限？
webrtc-allow-share-screen-and-microphone-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 访问您的麦克风并查看您的屏幕的权限？
webrtc-allow-share-screen-and-audio-capture-unsafe-delegation = 是否允许 { $origin } 授予 { $thirdParty } 监听此标签页音频并查看您的屏幕的权限？

##

webrtc-share-screen-warning = 请仅与您信任的网站共享屏幕。共享可能允许欺骗性网站以您的身份浏览并窃取您的私人数据。
webrtc-share-browser-warning = 请仅与您信任的网站共享 { -brand-short-name }。共享可能允许欺骗性网站以您的身份浏览并窃取您的私人数据。

webrtc-pick-window-or-screen = 选择窗口或屏幕
webrtc-share-entire-screen = 整个屏幕
webrtc-share-pipe-wire-portal = 使用操作系统设置
# Variables:
#   $monitorIndex (String): screen number (digits 1, 2, etc).
webrtc-share-monitor = 屏幕 { $monitorIndex }
# Variables:
#   $windowCount (Number): the number of windows currently displayed by the application.
#   $appName (String): the name of the application.
webrtc-share-application =
    { $windowCount ->
        [one] { $appName }（{ $windowCount } 个窗口）
       *[other] { $appName }（{ $windowCount } 个窗口）
    }

## These buttons are the possible answers to the various prompts in the "webrtc-allow-share-*" strings.

webrtc-action-allow =
    .label = 允许
    .accesskey = A
webrtc-action-block =
    .label = 阻止
    .accesskey = B
webrtc-action-always-block =
    .label = 始终阻止
    .accesskey = w
webrtc-action-not-now =
    .label = 现在不
    .accesskey = N

##

webrtc-remember-allow-checkbox = 记住此决定
webrtc-remember-allow-checkbox-camera = 记住所有摄像头
webrtc-remember-allow-checkbox-microphone = 记住所有麦克风
webrtc-remember-allow-checkbox-camera-and-microphone = 记住所有摄像头和麦克风
webrtc-mute-notifications-checkbox = 共享期间静音网站通知

webrtc-reason-for-no-permanent-allow-screen = { -brand-short-name } 无法允许永久访问您的屏幕。
webrtc-reason-for-no-permanent-allow-audio = { -brand-short-name } 无法在未询问要共享哪个标签页的情况下允许永久访问您标签页的音频。
webrtc-reason-for-no-permanent-allow-insecure = 您与此网站的连接不安全。为保护您，{ -brand-short-name } 仅允许本次会话的访问。
