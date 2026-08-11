# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# In left-to-right languages this should use "Right" and in right-to-left languages this should use "Left" to indicate the direction a new tab will open.
tab-context-new-tab-open =
    .label = 在右侧新建标签页
    .accesskey = w
tab-context-new-tab-open-vertical =
    .label = 在下方新建标签页
    .accesskey = w
tab-context-new-group =
    .label = 新建组
    .accesskey = G
reload-tab =
    .label = 重载标签页
    .accesskey = R
reload-tab2 =
    .label = 重载
    .accesskey = R
select-all-tabs =
    .label = 选择所有标签页
    .accesskey = S
tab-context-play-tab =
    .label = 播放标签页
    .accesskey = l
tab-context-play-tabs =
    .label = 播放标签页们
    .accesskey = y
duplicate-tab =
    .label = 复制标签页
    .accesskey = D
duplicate-tab2 =
    .label = 复制
    .accesskey = D
duplicate-tabs =
    .label = 复制标签页们
    .accesskey = D
duplicate-tabs2 =
    .label = 复制
    .accesskey = D
# The following string is displayed on a menuitem that will close the tabs from the start of the tabstrip to the currently targeted tab (excluding the currently targeted and any other selected tabs).
# In left-to-right languages this should use "Left" and in right-to-left languages this should use "Right".
close-tabs-to-the-start =
    .label = 关闭左侧标签页
    .accesskey = l
close-tabs-to-the-start-vertical =
    .label = 关闭上方标签页
    .accesskey = l
# The following string is displayed on a menuitem that will close the tabs from the end of the tabstrip to the currently targeted tab (excluding the currently targeted and any other selected tabs).
# In left-to-right languages this should use "Right" and in right-to-left languages this should use "Left".
close-tabs-to-the-end =
    .label = 关闭右侧标签页
    .accesskey = i
close-tabs-to-the-end-vertical =
    .label = 关闭下方标签页
    .accesskey = i
close-other-tabs =
    .label = 关闭其他标签页
    .accesskey = o

## Variables:
##  $tabCount (Number): the number of tabs that are affected by the action.

tab-context-unload-n-tabs =
    .label =
        { $tabCount ->
            [1] 卸载标签页
           *[other] 卸载 { $tabCount } 个标签页
        }
    .accesskey = U

# Context menu option, alternate label for unloading the content of 1 or more tabs to reduce memory usage
tab-context-unload-tabs =
    .label = 卸载
    .accesskey = U
reload-tabs =
    .label = 重载标签页们
    .accesskey = R
pin-tab =
    .label = 固定标签页
    .accesskey = P
tab-context-pin-tab2 =
    .label = 固定
    .accesskey = P
unpin-tab =
    .label = 取消固定标签页
    .accesskey = p
tab-context-unpin-tab2 =
    .label = 取消固定
    .accesskey = p
pin-selected-tabs =
    .label = 固定标签页们
    .accesskey = P
unpin-selected-tabs =
    .label = 取消固定标签页们
    .accesskey = p
bookmark-selected-tabs =
    .label = 书签标签页们…
    .accesskey = B
tab-context-bookmark-tab =
    .label = 书签标签页…
    .accesskey = B
tab-context-bookmark-tab2 =
    .label = 书签
    .accesskey = B
tab-context-open-in-new-container-tab =
    .label = 在新容器标签页中启动
    .accesskey = e
tab-context-open-in-new-container-tab2 =
    .label = 在新容器标签页中启动
    .accesskey = e
move-to-start =
    .label = 移动到起始位置
    .accesskey = S
move-to-end =
    .label = 移动到结束位置
    .accesskey = E
move-to-new-window =
    .label = 移动到新窗口
.accesskey = W
# Variables
#  $profileName (string): The name of the profile to move tab to
move-to-new-profile =
    .label = 移动到 { $profileName }
tab-context-close-multiple-tabs =
    .label = 关闭多个标签页
    .accesskey = M
tab-context-close-multiple-tabs2 =
    .label = 关闭多个
    .accesskey = M
tab-context-close-duplicate-tabs =
    .label = 关闭重复标签页
    .accesskey = x
tab-context-close-duplicate-tabs2 =
    .label = 关闭此标签页的重复项
    .accesskey = x
tab-context-share-url =
    .label = 分享
    .accesskey = h

## Variables:
##  $tabCount (Number): the number of tabs that are affected by the action.

tab-context-reopen-closed-tabs =
    .label =
        { $tabCount ->
            [1] 重新打开已关闭标签页
           *[other] 重新打开已关闭标签页
        }
    .accesskey = o
tab-context-close-n-tabs =
    .label =
        { $tabCount ->
            [1] 关闭标签页
           *[other] 关闭 { $tabCount } 个标签页
        }
    .accesskey = C
tab-context-close-n-tabs2 =
    .label =
        { $tabCount ->
            [1] 关闭
           *[other] 关闭 { $tabCount } 个标签页
        }
    .accesskey = C
tab-context-move-tabs =
    .label =
        { $tabCount ->
            [1] 移动标签页
           *[other] 移动标签页
        }
    .accesskey = v

# Context menu option, highlighting this shows a submenu of potential destinations to move one or more tabs to (tab groups, windows, profiles, start, end, etc.)
tab-context-move-tabs2 =
    .label =
        { $tabCount ->
            [1] 移动标签页至
           *[other] 移动 { $tabCount } 个标签页至
        }
    .accesskey = v

# Context menu option, highlighting this shows a submenu of potential destinations to move two tabs of a split view together to (tab groups, windows, profiles, start, end, etc.)
tab-context-move-split-view =
    .label = 移动拆分视图至
    .accesskey = v

# The following string intentionally omits the word "Tab" from the singular and includes it in the plural.
tab-context-send-to-device =
    .label =
        { $tabCount ->
            [1] 发送至设备
           *[other] 发送 { $tabCount } 个标签页至设备
        }
    .accesskey = n
tab-context-send-to-device2 =
    .label = 发送至您的设备
    .accesskey = n
# The following string intentionally omits the word "Tab" from the singular and includes it in the plural.
tab-context-send-to-mobile =
    .label =
        { $tabCount ->
            [1] 发送至移动设备
           *[other] 发送 { $tabCount } 个标签页至移动设备
        }
    .accesskey = n

# Verb: share a collection of selected tabs as a link
tab-context-share-selected-tabs =
    .label = 创建可共享链接
    .accesskey = a