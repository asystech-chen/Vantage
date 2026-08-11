# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this

navbar-tooltip-instruction =
    .value = { PLATFORM() ->
        [macos] 向下拉动以显示历史记录
       *[other] 右键单击或向下拉动以显示历史记录
    }

# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Back
# Variables
main-context-menu-back-2 =
    .tooltiptext = 后退一页 ({ $shortcut })
    .aria-label = 后退
    .accesskey = B

#   $shortcut (String) - A keyboard shortcut for the Go Back command.
main-context-menu-back-mac =
    .label = 后退
    .accesskey = B

navbar-tooltip-back-2 =
    .value = { main-context-menu-back-2.tooltiptext }

toolbar-button-back-2 =
    .label = { main-context-menu-back-2.aria-label }

# This menuitem is only visible on macOS

## Forward
# Variables
main-context-menu-forward-2 =
    .tooltiptext = 前进一页 ({ $shortcut })
    .aria-label = 前进
    .accesskey = F

#   $shortcut (String) - A keyboard shortcut for the Go Forward command.
main-context-menu-forward-mac =
    .label = 前进
    .accesskey = F

navbar-tooltip-forward-2 =
    .value = { main-context-menu-forward-2.tooltiptext }

toolbar-button-forward-2 =
    .label = { main-context-menu-forward-2.aria-label }

# This menuitem is only visible on macOS

main-context-menu-reload =
    .aria-label = 重新加载
    .accesskey = R

## Reload
main-context-menu-reload-mac =
    .label = 重新加载
    .accesskey = R

toolbar-button-reload =
    .label = { main-context-menu-reload.aria-label }

# This menuitem is only visible on macOS

main-context-menu-stop =
    .aria-label = 停止
    .accesskey = S

## Stop
main-context-menu-stop-mac =
    .label = 停止
    .accesskey = S

toolbar-button-stop =
    .label = { main-context-menu-stop.aria-label }

# This menuitem is only visible on macOS

toolbar-button-stop-reload =
    .title = { main-context-menu-reload.aria-label }

## Stop-Reload Button

toolbar-button-account =
    .label = 账户
    .tooltiptext = 账户

## Account toolbar Button

main-context-menu-page-save =
    .label = 页面另存为…
    .accesskey = P

## Save Page

main-context-menu-bookmark-page =
    .aria-label = 将页面加入书签…
    .accesskey = m
    .tooltiptext = 将页面加入书签

## Simple menu items
# This menuitem is only visible on macOS
# Cannot be shown at the same time as main-context-menu-edit-bookmark-mac,
main-context-menu-bookmark-page-mac =
    .label = 将页面加入书签…
    .accesskey = m

# so should probably have the same access key if possible.
# This menuitem is only visible on macOS
# Cannot be shown at the same time as main-context-menu-bookmark-page-mac,
main-context-menu-edit-bookmark-mac =
    .label = 编辑书签…
    .accesskey = m

# so should probably have the same access key if possible.
# Variables
main-context-menu-bookmark-page-with-shortcut =
    .aria-label = 将页面加入书签…
    .accesskey = m
    .tooltiptext = 将页面加入书签（{ $shortcut }）

main-context-menu-edit-bookmark =
    .aria-label = 编辑书签…
    .accesskey = m
    .tooltiptext = 编辑该书签

# Variables
#   $shortcut (String) - A keyboard shortcut for the edit bookmark command.
main-context-menu-edit-bookmark-with-shortcut =
    .aria-label = 编辑书签…
    .accesskey = m
    .tooltiptext = 编辑书签（{ $shortcut }）

main-context-menu-open-link =
    .label = 打开链接
    .accesskey = O

main-context-menu-open-link-new-tab =
    .label = 在新标签页中打开链接
    .accesskey = T

main-context-menu-open-link-split-view =
    .label = 在拆分视图中打开链接
    .accesskey = M

main-context-menu-open-link-container-tab =
    .label = 在新容器标签页中打开链接
    .accesskey = w

main-context-menu-open-link-new-window =
    .label = 在新窗口中打开链接
    .accesskey = d

main-context-menu-open-link-new-private-window =
    .label = 在新隐私窗口中打开链接
    .accesskey = P

main-context-menu-bookmark-link-2 =
    .label = 将链接加入书签…
    .accesskey = B

main-context-menu-save-link =
    .label = 将链接另存为…
    .accesskey = k

## The access keys for "Copy Link" and "Copy Email Address"
## should be the same if possible; the two context menu items
## are mutually exclusive.

main-context-menu-copy-email =
    .label = 复制电子邮件地址
    .accesskey = l

main-context-menu-copy-link-simple =
    .label = 复制链接
    .accesskey = L

##

main-context-menu-copy-phone =
    .label = 复制电话号码
    .accesskey = o

main-context-menu-preview-link =
    .label = 预览链接
    .accesskey = J

# "Copy Clean Link" means that Firefox will remove things from the link you
# copied, like items that identify you for advertising purposes, and other items
# sites add into URLs to help them deliver a certain browsing experience.
main-context-menu-copy-clean-link =
    .label = 复制纯净链接
    .accesskey = u

## Media (video/audio) controls
##
## The accesskey for "Play" and "Pause" are the
## same because the two context-menu items are
## mutually exclusive.

main-context-menu-media-play =
    .label = 播放
    .accesskey = P

main-context-menu-media-pause =
    .label = 暂停
    .accesskey = P

##

main-context-menu-media-mute =
    .label = 静音
    .accesskey = M

main-context-menu-media-unmute =
    .label = 取消静音
    .accesskey = m

main-context-menu-media-play-speed-2 =
    .label = 速度
    .accesskey = d

main-context-menu-media-play-speed-slow-2 =
    .label = 0.5×

main-context-menu-media-play-speed-normal-2 =
    .label = 1.0×

main-context-menu-media-play-speed-fast-2 =
    .label = 1.25×

main-context-menu-media-play-speed-faster-2 =
    .label = 1.5×

main-context-menu-media-play-speed-fastest-2 =
    .label = 2×

main-context-menu-media-loop =
    .label = 循环
    .accesskey = L

## The access keys for "Show Controls" and "Hide Controls" are the same
## because the two context-menu items are mutually exclusive.

main-context-menu-media-show-controls =
    .label = 显示控件
    .accesskey = C

main-context-menu-media-hide-controls =
    .label = 隐藏控件
    .accesskey = C

##

main-context-menu-media-video-fullscreen =
    .label = 全屏
    .accesskey = F

main-context-menu-media-video-leave-fullscreen =
    .label = 退出全屏
    .accesskey = u

# This is used when right-clicking on a video in the
# content area when the Picture-in-Picture feature is enabled.
main-context-menu-media-watch-pip =
    .label = 在画中画中观看
    .accesskey = u

main-context-menu-image-reload =
    .label = 重新加载图像
    .accesskey = R

main-context-menu-image-view-new-tab =
    .label = 在新标签页中打开图像
    .accesskey = I

main-context-menu-video-view-new-tab =
    .label = 在新标签页中打开视频
    .accesskey = i

main-context-menu-image-copy =
    .label = 复制图像
    .accesskey = y

main-context-menu-image-copy-link =
    .label = 复制图像链接
    .accesskey = o

main-context-menu-video-copy-link =
    .label = 复制视频链接
    .accesskey = o

main-context-menu-audio-copy-link =
    .label = 复制音频链接
    .accesskey = o

main-context-menu-image-save-as =
    .label = 图像另存为…
    .accesskey = v

main-context-menu-image-email =
    .label = 通过电子邮件发送图像…
    .accesskey = g

main-context-menu-image-set-image-as-background =
    .label = 将图像设置为桌面背景…
    .accesskey = S

main-context-menu-image-copy-text =
    .label = 从图像复制文本
    .accesskey = x

main-context-menu-image-info =
    .label = 查看图像信息
    .accesskey = f

main-context-menu-image-desc =
    .label = 查看描述
    .accesskey = D

# Variables
#   $engine (String) - Name of the search engine that will perform the search.
main-context-menu-visual-search-2 =
    .label = 使用 { $engine } 搜索图像
    .accesskey = e

main-context-menu-video-save-as =
    .label = 视频另存为…
    .accesskey = v

main-context-menu-audio-save-as =
    .label = 音频另存为…
    .accesskey = v

main-context-menu-video-take-snapshot =
    .label = 拍摄快照…
    .accesskey = S

main-context-menu-video-email =
    .label = 通过电子邮件发送视频…
    .accesskey = a

main-context-menu-audio-email =
    .label = 通过电子邮件发送音频…
    .accesskey = a

main-context-menu-send-to-device-2 =
    .label = 发送到设备
    .accesskey = n

main-context-menu-send-to-mobile-2 =
    .label = 发送到移动设备
    .accesskey = n

## Displayed within the send tab submenu to prompt users to sign in, enable sync, pair a device, or troubleshoot device issues.

main-context-menu-send-to-mobile-sign-in = 登录以发送标签页
main-context-menu-send-to-mobile-enable-sync2 = 启用同步以发送标签页
main-context-menu-send-to-mobile-connect-phone2 = 连接您的手机
main-context-menu-send-to-mobile-device-missing2 = 未看到您的设备？
main-context-menu-send-to-mobile-sign-in-from-link = 登录以发送链接
main-context-menu-send-to-mobile-sign-in-from-page = 登录以发送页面
main-context-menu-send-to-mobile-enable-sync3 = 启用同步以发送标签页
main-context-menu-send-to-mobile-enable-sync-from-link = 启用同步以发送链接
main-context-menu-send-to-mobile-enable-sync-from-page = 启用同步以发送页面
main-context-menu-send-to-mobile-connect-phone3 = 连接设备以发送标签页
main-context-menu-send-to-mobile-connect-phone-from-link = 连接设备以发送链接
main-context-menu-send-to-mobile-connect-phone-from-page = 连接设备以发送页面

##

# Displayed when there are saved passwords and the user clicks inside a username or password field
main-context-menu-use-saved-password =
    .label = 使用已保存的密码
    .accesskey = o

main-context-menu-use-relay-mask =
    .label = 使用 { -relay-brand-short-name } 电子邮件掩码
    .accesskey = E

main-context-menu-suggest-strong-password =
    .label = 建议强密码…
    .accesskey = S

main-context-menu-manage-passwords =
    .label = 管理密码
    .accesskey = M

main-context-menu-add-engine =
    .label = 添加搜索引擎
    .accesskey = S

main-context-menu-link-send-to-device =
    .label = 发送链接至设备
    .accesskey = n

main-context-menu-link-send-to-mobile =
    .label = 发送链接至移动设备
    .accesskey = n

main-context-menu-frame =
    .label = 此框架
    .accesskey = h

main-context-menu-frame-show-this =
    .label = 仅显示此框架
    .accesskey = S

main-context-menu-frame-open-tab =
    .label = 在新标签页中打开框架
    .accesskey = T

main-context-menu-frame-open-window =
    .label = 在新窗口中打开框架
    .accesskey = W

main-context-menu-frame-reload =
    .label = 重新加载框架
    .accesskey = R

main-context-menu-frame-add-bookmark =
    .label = 为此框架添加书签…
    .accesskey = m

main-context-menu-frame-save-as =
    .label = 将框架另存为…
    .accesskey = F

main-context-menu-frame-print =
    .label = 打印框架…
    .accesskey = P

main-context-menu-frame-view-source =
    .label = 查看框架源代码
    .accesskey = V

main-context-menu-frame-view-info =
    .label = 查看框架信息
    .accesskey = I

main-context-menu-print-selection-2 =
    .label = 打印所选内容…
    .accesskey = r

main-context-menu-view-selection-source =
    .label = 查看所选内容的来源
    .accesskey = e

main-context-menu-take-screenshot =
    .label = 截取屏幕截图
    .accesskey = T

main-context-menu-view-page-source =
    .label = 查看页面源代码
    .accesskey = V

main-context-menu-bidi-switch-text =
    .label = 切换文本方向
    .accesskey = w

main-context-menu-bidi-switch-page =
    .label = 切换页面方向
    .accesskey = D

main-context-menu-inspect =
    .label = 检查
    .accesskey = Q

main-context-menu-inspect-a11y-properties =
    .label = 检查辅助功能属性

main-context-menu-eme-learn-more =
    .label = 了解更多有关 DRM 的信息…
    .accesskey = D

# Variables
#   $containerName (String): The name of the current container
main-context-menu-open-link-in-container-tab =
    .label = 在新{ $containerName }选项卡中启动链接
    .accesskey = T

main-context-menu-reveal-password =
    .label = 显示您的密码
    .accesskey = v

# The label of a badge shown in menu items to call out new features.
main-context-menu-new-feature-badge = 新功能

main-context-menu-pdfjs-copy-page =
    .label = 复制页面

main-context-menu-pdfjs-cut-page =
    .label = 剪切页面

main-context-menu-pdfjs-delete-page =
    .label = 删除页面

main-context-menu-pdfjs-save-page =
    .label = 将您的所选内容保存为…