# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

navbar-tooltip-instruction =
    .value = { PLATFORM() ->
        [macos] 拉向下到显示历史记录
       *[other] 右-click 或拉向下到显示历史记录
    }

## Back

# Variables
#   $shortcut (String) - A keyboard shortcut for the Go Back command.
main-context-menu-back-2 =
    .tooltiptext = 去回一(个) 页 ({ $shortcut })
    .aria-label = 回
    .accesskey = B

# This menuitem is only visible on macOS
main-context-menu-back-mac =
    .label = 回
    .accesskey = B

navbar-tooltip-back-2 =
    .value = { main-context-menu-back-2.tooltiptext }

toolbar-button-back-2 =
    .label = { main-context-menu-back-2.aria-label }

## Forward

# Variables
#   $shortcut (String) - A keyboard shortcut for the Go Forward command.
main-context-menu-forward-2 =
    .tooltiptext = 去前推一(个) 页 ({ $shortcut })
    .aria-label = 前推
    .accesskey = F

# This menuitem is only visible on macOS
main-context-menu-forward-mac =
    .label = 前推
    .accesskey = F

navbar-tooltip-forward-2 =
    .value = { main-context-menu-forward-2.tooltiptext }

toolbar-button-forward-2 =
    .label = { main-context-menu-forward-2.aria-label }

## Reload

main-context-menu-reload =
    .aria-label = 再装
    .accesskey = R

# This menuitem is only visible on macOS
main-context-menu-reload-mac =
    .label = 再装
    .accesskey = R

toolbar-button-reload =
    .label = { main-context-menu-reload.aria-label }

## Stop

main-context-menu-stop =
    .aria-label = 停止
    .accesskey = S

# This menuitem is only visible on macOS
main-context-menu-stop-mac =
    .label = 停止
    .accesskey = S

toolbar-button-stop =
    .label = { main-context-menu-stop.aria-label }

## Stop-Reload Button

toolbar-button-stop-reload =
    .title = { main-context-menu-reload.aria-label }

## Account toolbar Button

toolbar-button-account =
    .label = 帐户
    .tooltiptext = 帐户

## Save Page

main-context-menu-page-save =
    .label = 保存页作为…
    .accesskey = P

## Simple menu items

main-context-menu-bookmark-page =
    .aria-label = 书签页…
    .accesskey = m
    .tooltiptext = 书签页

# This menuitem is only visible on macOS
# Cannot be shown at the same time as main-context-menu-edit-bookmark-mac,
# so should probably have the same access key if possible.
main-context-menu-bookmark-page-mac =
    .label = 书签页…
    .accesskey = m

# This menuitem is only visible on macOS
# Cannot be shown at the same time as main-context-menu-bookmark-page-mac,
# so should probably have the same access key if possible.
main-context-menu-edit-bookmark-mac =
    .label = 编辑书签…
    .accesskey = m

# Variables
#   $shortcut (String) - A keyboard shortcut for the add bookmark command.
main-context-menu-bookmark-page-with-shortcut =
    .aria-label = 书签页…
    .accesskey = m
    .tooltiptext = 书签页 ({ $shortcut })

main-context-menu-edit-bookmark =
    .aria-label = 编辑书签…
    .accesskey = m
    .tooltiptext = 编辑书签

# Variables
#   $shortcut (String) - A keyboard shortcut for the edit bookmark command.
main-context-menu-edit-bookmark-with-shortcut =
    .aria-label = 编辑书签…
    .accesskey = m
    .tooltiptext = 编辑书签 ({ $shortcut })

main-context-menu-open-link =
    .label = 打开连接
    .accesskey = O

main-context-menu-open-link-new-tab =
    .label = 打开连接在新的 Tab
    .accesskey = T

main-context-menu-open-link-split-view =
    .label = 打开连接在拆分查看
    .accesskey = M

main-context-menu-open-link-container-tab =
    .label = 打开连接在新的容器 Tab
    .accesskey = w

main-context-menu-open-link-new-window =
    .label = 打开连接在新的窗口
    .accesskey = d

main-context-menu-open-link-new-private-window =
    .label = 打开连接在新的私人的窗口
    .accesskey = P

main-context-menu-bookmark-link-2 =
    .label = 书签连接…
    .accesskey = B

main-context-menu-save-link =
    .label = 保存连接作为…
    .accesskey = k

## The access keys for "Copy Link" and "Copy Email Address"
## should be the same if possible; the two context menu items
## are mutually exclusive.

main-context-menu-copy-email =
    .label = 复制电子信函地址
    .accesskey = l

main-context-menu-copy-link-simple =
    .label = 复制连接
    .accesskey = L

##

main-context-menu-copy-phone =
    .label = 复制电话数字
    .accesskey = o

main-context-menu-preview-link =
    .label = 预览连接
    .accesskey = J

# "Copy Clean Link" means that Firefox will remove things from the link you
# copied, like items that identify you for advertising purposes, and other items
# sites add into URLs to help them deliver a certain browsing experience.
main-context-menu-copy-clean-link =
    .label = 复制干净的连接
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
    .label = 哑子
    .accesskey = M

main-context-menu-media-unmute =
    .label = Unmute
    .accesskey = m

main-context-menu-media-play-speed-2 =
    .label = 中央处理机速度设置程序
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
    .label = 显示控制
    .accesskey = C

main-context-menu-media-hide-controls =
    .label = 隐藏控制
    .accesskey = C

##

main-context-menu-media-video-fullscreen =
    .label = 完整筛选
    .accesskey = F

main-context-menu-media-video-leave-fullscreen =
    .label = 出口完整筛选
    .accesskey = u

# This is used when right-clicking on a video in the
# content area when the Picture-in-Picture feature is enabled.
main-context-menu-media-watch-pip =
    .label = 观察在图象-在-图象
    .accesskey = u

main-context-menu-image-reload =
    .label = 再装图象
    .accesskey = R

main-context-menu-image-view-new-tab =
    .label = 打开图象在新的 Tab
    .accesskey = I

main-context-menu-video-view-new-tab =
    .label = 打开影像在新的 Tab
    .accesskey = i

main-context-menu-image-copy =
    .label = 复制图象
    .accesskey = y

main-context-menu-image-copy-link =
    .label = 复制图象连接
    .accesskey = o

main-context-menu-video-copy-link =
    .label = 复制影像连接
    .accesskey = o

main-context-menu-audio-copy-link =
    .label = 复制音频的连接
    .accesskey = o

main-context-menu-image-save-as =
    .label = 保存图象作为…
    .accesskey = v

main-context-menu-image-email =
    .label = 电子信函图象…
    .accesskey = g

main-context-menu-image-set-image-as-background =
    .label = 日落图象作为桌面背景…
    .accesskey = S

main-context-menu-image-copy-text =
    .label = 复制电文从图象
    .accesskey = x

main-context-menu-image-info =
    .label = 查看图象信息
    .accesskey = f

main-context-menu-image-desc =
    .label = 查看描述
    .accesskey = D

# Variables
#   $engine (String) - Name of the search engine that will perform the search.
main-context-menu-visual-search-2 =
    .label = 搜索图象与 { $engine }
    .accesskey = e

main-context-menu-video-save-as =
    .label = 保存影像作为…
    .accesskey = v

main-context-menu-audio-save-as =
    .label = 保存音频的作为…
    .accesskey = v

main-context-menu-video-take-snapshot =
    .label = 采取瞬象…
    .accesskey = S

main-context-menu-video-email =
    .label = 电子信函影像…
    .accesskey = a

main-context-menu-audio-email =
    .label = 电子信函音频的…
    .accesskey = a

main-context-menu-send-to-device-2 =
    .label = 发送到装置
    .accesskey = n

main-context-menu-send-to-mobile-2 =
    .label = 发送到移动的
    .accesskey = n

## Displayed within the send tab submenu to prompt users to sign in, enable sync, pair a device, or troubleshoot device issues.

main-context-menu-send-to-mobile-sign-in = 正负号在到发送标签页
main-context-menu-send-to-mobile-enable-sync2 = 启用同步的到发送一个标签页
main-context-menu-send-to-mobile-connect-phone2 = 连接你的电话
main-context-menu-send-to-mobile-device-missing2 = 不要看见你的装置?
main-context-menu-send-to-mobile-sign-in-from-link = 正负号在到发送一个连接
main-context-menu-send-to-mobile-sign-in-from-page = 正负号在到发送一个页
main-context-menu-send-to-mobile-enable-sync3 = 转弯在同步的到发送标签页
main-context-menu-send-to-mobile-enable-sync-from-link = 转弯在同步的到发送一个连接
main-context-menu-send-to-mobile-enable-sync-from-page = 转弯在同步的到发送一个页
main-context-menu-send-to-mobile-connect-phone3 = 连接一个装置到发送标签页
main-context-menu-send-to-mobile-connect-phone-from-link = 连接一个装置到发送一个连接
main-context-menu-send-to-mobile-connect-phone-from-page = 连接一个装置到发送一个页

##

# Displayed when there are saved passwords and the user clicks inside a username or password field
main-context-menu-use-saved-password =
    .label = 使用保存密码
    .accesskey = o

main-context-menu-use-relay-mask =
    .label = 使用 { -relay-brand-short-name } 电子信函屏蔽
    .accesskey = E

main-context-menu-suggest-strong-password =
    .label = 提议强壮的密码…
    .accesskey = S

main-context-menu-manage-passwords =
    .label = 管理密码
    .accesskey = M

main-context-menu-add-engine =
    .label = 添加搜索引擎
    .accesskey = S

main-context-menu-link-send-to-device =
    .label = 发送连接到装置
    .accesskey = n

main-context-menu-link-send-to-mobile =
    .label = 发送连接到移动的
    .accesskey = n

main-context-menu-frame =
    .label = 这框架
    .accesskey = h

main-context-menu-frame-show-this =
    .label = 显示仅这框架
    .accesskey = S

main-context-menu-frame-open-tab =
    .label = 打开框架在新的 Tab
    .accesskey = T

main-context-menu-frame-open-window =
    .label = 打开框架在新的窗口
    .accesskey = W

main-context-menu-frame-reload =
    .label = 再装框架
    .accesskey = R

main-context-menu-frame-add-bookmark =
    .label = 书签框架…
    .accesskey = m

main-context-menu-frame-save-as =
    .label = 保存框架作为…
    .accesskey = F

main-context-menu-frame-print =
    .label = 打印框架…
    .accesskey = P

main-context-menu-frame-view-source =
    .label = 查看框架来源
    .accesskey = V

main-context-menu-frame-view-info =
    .label = 查看框架信息
    .accesskey = I

main-context-menu-print-selection-2 =
    .label = 打印选择…
    .accesskey = r

main-context-menu-view-selection-source =
    .label = 查看选择来源
    .accesskey = e

main-context-menu-take-screenshot =
    .label = 采取屏幕截图
    .accesskey = T

main-context-menu-view-page-source =
    .label = 查看页来源
    .accesskey = V

main-context-menu-bidi-switch-text =
    .label = 开关电文方向
    .accesskey = w

main-context-menu-bidi-switch-page =
    .label = 开关页方向
    .accesskey = D

main-context-menu-inspect =
    .label = 检查
    .accesskey = Q

main-context-menu-inspect-a11y-properties =
    .label = 检查易接近属性

main-context-menu-eme-learn-more =
    .label = 学习更多关于 DRM…
    .accesskey = D

# Variables
#   $containerName (String): The name of the current container
main-context-menu-open-link-in-container-tab =
    .label = 打开连接在新的 { $containerName } Tab
    .accesskey = T

main-context-menu-reveal-password =
    .label = 露出密码
    .accesskey = v

# The label of a badge shown in menu items to call out new features.
main-context-menu-new-feature-badge = 新的

main-context-menu-pdfjs-copy-page =
    .label = 复制页

main-context-menu-pdfjs-cut-page =
    .label = 剪切页

main-context-menu-pdfjs-delete-page =
    .label = 删除页

main-context-menu-pdfjs-save-page =
    .label = 保存选择作为…
