# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These strings are used so that the window has a title in tools that
## enumerate/look for window titles. It is not normally visible anywhere.

webrtc-indicator-title = { -brand-short-name } —共享指示器

## Used as list items in sharing menu

webrtc-item-camera = 摄影
webrtc-item-microphone = 扩音器
webrtc-item-audio-capture = 标签页音频的
webrtc-item-application = 应用
webrtc-item-screen = 筛选
webrtc-item-window = 窗口
webrtc-item-browser = 标签页

##

# This is used for the website origin for the sharing menu if no readable origin could be deduced from the URL.
webrtc-sharing-menuitem-unknown-host = 不知道的原点

# Variables:
#   $origin (String): The website origin (e.g. www.mozilla.org)
#   $itemList (String): A formatted list of items (e.g. "camera, microphone and tab audio")
webrtc-sharing-menuitem =
    .label = { $origin } ({ $itemList })
webrtc-sharing-menu =
    .label = 标签页共享装置
    .accesskey = d

webrtc-sharing-window = 你是共享另外的应用窗口.
webrtc-sharing-browser-window = 你是共享 { -brand-short-name }.
webrtc-sharing-screen = 你是共享你的整个筛选.
webrtc-stop-sharing-button = 停止共享
webrtc-microphone-unmuted =
    .title = 转弯扩音器关闭
webrtc-microphone-muted =
    .title = 转弯扩音器在
webrtc-camera-unmuted =
    .title = 转弯摄影关闭
webrtc-camera-muted =
    .title = 转弯摄影在
webrtc-minimize =
    .title = 最小化指示器

## These strings will display as a tooltip on supported systems where we show
## device sharing state in the OS notification area. We do not use these strings
## on macOS, as global menu bar items do not have native tooltips.

webrtc-camera-system-menu =
    .label = 你是共享你的摄影. 单击到控制共享.
webrtc-microphone-system-menu =
    .label = 你是共享你的扩音器. 单击到控制共享.
webrtc-screen-system-menu =
    .label = 你是共享一个窗口或一个筛选. 单击到控制共享.

## These strings are only used on Mac for menus attached to icons
## near the clock on the mac menubar.
## Variables:
##   $streamTitle (String): the host of the tab using the share.
##   $tabCount (Number): the title of the tab using the share.

webrtc-indicator-menuitem-control-sharing =
    .label = Control 共享
webrtc-indicator-menuitem-control-sharing-on =
    .label = Control 共享在“{ $streamTitle }”

webrtc-indicator-menuitem-sharing-camera-with =
    .label = 共享摄影与“{ $streamTitle }”
webrtc-indicator-menuitem-sharing-camera-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 共享摄影与 { $tabCount } 标签页
           *[other] 共享摄影与 { $tabCount } 标签页
        }

webrtc-indicator-menuitem-sharing-microphone-with =
    .label = 共享扩音器与“{ $streamTitle }”
webrtc-indicator-menuitem-sharing-microphone-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 共享扩音器与 { $tabCount } 标签页
           *[other] 共享扩音器与 { $tabCount } 标签页
        }

webrtc-indicator-menuitem-sharing-application-with =
    .label = 共享一个应用与“{ $streamTitle }”
webrtc-indicator-menuitem-sharing-application-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 共享一个应用与 { $tabCount } 标签页
           *[other] 共享应用与 { $tabCount } 标签页
        }

webrtc-indicator-menuitem-sharing-screen-with =
    .label = 共享筛选与“{ $streamTitle }”
webrtc-indicator-menuitem-sharing-screen-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 共享筛选与 { $tabCount } 标签页
           *[other] 共享筛选与 { $tabCount } 标签页
        }

webrtc-indicator-menuitem-sharing-window-with =
    .label = 共享一个窗口与“{ $streamTitle }”
webrtc-indicator-menuitem-sharing-window-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 共享一个窗口与 { $tabCount } 标签页
           *[other] 共享窗与 { $tabCount } 标签页
        }

webrtc-indicator-menuitem-sharing-browser-with =
    .label = 共享一个 Tab 与“{ $streamTitle }”
# This message is shown when the contents of a tab is shared during a WebRTC
# session, which currently is only possible with Loop/Hello.
webrtc-indicator-menuitem-sharing-browser-with-n-tabs =
    .label =
        { $tabCount ->
            [one] 共享一个 Tab 与 { $tabCount } 标签页
           *[other] 共享标签页与 { $tabCount } 标签页
        }

## Variables:
##   $origin (String): the website origin (e.g. www.mozilla.org).

webrtc-allow-share-audio-capture = 允许 { $origin } 到听到这 tab's 音频的?
webrtc-allow-share-camera = 允许 { $origin } 到使用你的摄影?
webrtc-allow-share-microphone = 允许 { $origin } 到使用你的扩音器?
webrtc-allow-share-screen = 允许 { $origin } 到看见你的筛选?
# "Speakers" is used in a general sense that might include headphones or
# another audio output connection.
webrtc-allow-share-speaker = 允许 { $origin } 到使用其他的扬声器?
webrtc-allow-share-camera-and-microphone = 允许 { $origin } 到使用你的摄影和扩音器?
webrtc-allow-share-camera-and-audio-capture = 允许 { $origin } 到使用你的摄影和听到这 tab's 音频的?
webrtc-allow-share-screen-and-microphone = 允许 { $origin } 到使用你的扩音器和看见你的筛选?
webrtc-allow-share-screen-and-audio-capture = 允许 { $origin } 到听到这 tab's 音频的和看见你的筛选?

## Special phrasing for sharing devices when the origin is a file url.

webrtc-allow-share-audio-capture-with-file = 允许这本地的文件到听到这 tab's 音频的?
webrtc-allow-share-camera-with-file = 允许这本地的文件到使用你的摄影?
webrtc-allow-share-microphone-with-file = 允许这本地的文件到使用你的扩音器?
webrtc-allow-share-screen-with-file = 允许这本地的文件到看见你的筛选?
# "Speakers" is used in a general sense that might include headphones or
# another audio output connection.
webrtc-allow-share-speaker-with-file = 允许这本地的文件到使用其他的扬声器?
webrtc-allow-share-camera-and-microphone-with-file = 允许这本地的文件到使用你的摄影和扩音器?
webrtc-allow-share-camera-and-audio-capture-with-file = 允许这本地的文件到使用你的摄影和听到这 tab's 音频的?
webrtc-allow-share-screen-and-microphone-with-file = 允许这本地的文件到使用你的扩音器和看见你的筛选?
webrtc-allow-share-screen-and-audio-capture-with-file = 允许这本地的文件到听到这 tab's 音频的和看见你的筛选?

## Variables:
##   $origin (String): the first party origin.
##   $thirdParty (String): the third party origin.

webrtc-allow-share-audio-capture-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 许可到听到这 tab's 音频的?
webrtc-allow-share-camera-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 访问到你的摄影?
webrtc-allow-share-microphone-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 访问到你的扩音器?
webrtc-allow-share-screen-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 许可到看见你的筛选?
# "Speakers" is used in a general sense that might include headphones or
# another audio output connection.
webrtc-allow-share-speaker-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 访问到其他的扬声器?
webrtc-allow-share-camera-and-microphone-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 访问到你的摄影和扩音器?
webrtc-allow-share-camera-and-audio-capture-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 访问到你的摄影和听到这 tab's 音频的?
webrtc-allow-share-screen-and-microphone-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 访问到你的扩音器和看见你的筛选?
webrtc-allow-share-screen-and-audio-capture-unsafe-delegation = 允许 { $origin } 到给 { $thirdParty } 许可到听到这 tab's 音频的和看见你的筛选?

##

webrtc-share-screen-warning = 仅部分筛选与位置你信任. 共享能允许迷惑的位置到浏览作为你和剽窃你的私人的论据.
webrtc-share-browser-warning = 仅部分 { -brand-short-name } 与位置你信任. 共享能允许迷惑的位置到浏览作为你和剽窃你的私人的论据.

webrtc-pick-window-or-screen = 选择窗口或筛选
webrtc-share-entire-screen = 整个筛选
webrtc-share-pipe-wire-portal = 使用操作的系统设置
# Variables:
#   $monitorIndex (String): screen number (digits 1, 2, etc).
webrtc-share-monitor = 筛选 { $monitorIndex }
# Variables:
#   $windowCount (Number): the number of windows currently displayed by the application.
#   $appName (String): the name of the application.
webrtc-share-application =
    { $windowCount ->
        [one] { $appName } ({ $windowCount } 窗口)
       *[other] { $appName } ({ $windowCount } 窗)
    }

## These buttons are the possible answers to the various prompts in the "webrtc-allow-share-*" strings.

webrtc-action-allow =
    .label = 允许
    .accesskey = A
webrtc-action-block =
    .label = 阻止
    .accesskey = B
webrtc-action-always-block =
    .label = 总是阻止
    .accesskey = w
webrtc-action-not-now =
    .label = 不现在
    .accesskey = N

##

webrtc-remember-allow-checkbox = 记住这判定
webrtc-remember-allow-checkbox-camera = 记住为了全部摄影
webrtc-remember-allow-checkbox-microphone = 记住为了全部扩音器
webrtc-remember-allow-checkbox-camera-and-microphone = 记住为了全部摄影和扩音器
webrtc-mute-notifications-checkbox = 哑子网站（全球资讯网的主机站）通知一会儿共享

webrtc-reason-for-no-permanent-allow-screen = { -brand-short-name } 能不允许永久的访问到你的筛选.
webrtc-reason-for-no-permanent-allow-audio = { -brand-short-name } 能不允许永久的访问到你的 tab's 音频的没有请求哪个标签页到均分.
webrtc-reason-for-no-permanent-allow-insecure = 你的连接到此站点是不固定. 到防卫你, { -brand-short-name } 将仅允许访问为了这会话.
