# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# In left-to-right languages this should use "Right" and in right-to-left languages this should use "Left" to indicate the direction a new tab will open.
tab-context-new-tab-open =
    .label = 新的 Tab 到右
    .accesskey = w
tab-context-new-tab-open-vertical =
    .label = 新的 Tab 在下面
    .accesskey = w
tab-context-new-group =
    .label = 新的创建组
    .accesskey = G
reload-tab =
    .label = 再装 Tab
    .accesskey = R
reload-tab2 =
    .label = 再装
    .accesskey = R
select-all-tabs =
    .label = 选择所有的标签页
    .accesskey = S
tab-context-play-tab =
    .label = 播放 Tab
    .accesskey = l
tab-context-play-tabs =
    .label = 播放标签页
    .accesskey = y
duplicate-tab =
    .label = 复制 Tab
    .accesskey = D
duplicate-tab2 =
    .label = 复制
    .accesskey = D
duplicate-tabs =
    .label = 复制标签页
    .accesskey = D
duplicate-tabs2 =
    .label = 复制
    .accesskey = D
# The following string is displayed on a menuitem that will close the tabs from the start of the tabstrip to the currently targeted tab (excluding the currently targeted and any other selected tabs).
# In left-to-right languages this should use "Left" and in right-to-left languages this should use "Right".
close-tabs-to-the-start =
    .label = 关闭标签页到离开
    .accesskey = l
close-tabs-to-the-start-vertical =
    .label = 关闭标签页在上方
    .accesskey = l
# The following string is displayed on a menuitem that will close the tabs from the end of the tabstrip to the currently targeted tab (excluding the currently targeted and any other selected tabs).
# In left-to-right languages this should use "Right" and in right-to-left languages this should use "Left".
close-tabs-to-the-end =
    .label = 关闭标签页到右
    .accesskey = i
close-tabs-to-the-end-vertical =
    .label = 关闭标签页在下面
    .accesskey = i
close-other-tabs =
    .label = 关闭其他的标签页
    .accesskey = o

## Variables:
##  $tabCount (Number): the number of tabs that are affected by the action.

tab-context-unload-n-tabs =
    .label =
        { $tabCount ->
            [1] 卸载 Tab
           *[other] 卸载 { $tabCount } 标签页
        }
    .accesskey = U

# Context menu option, alternate label for unloading the content of 1 or more tabs to reduce memory usage
tab-context-unload-tabs =
    .label = 卸载
    .accesskey = U
reload-tabs =
    .label = 再装标签页
    .accesskey = R
pin-tab =
    .label = 大头针 Tab
    .accesskey = P
tab-context-pin-tab2 =
    .label = 大头针
    .accesskey = P
unpin-tab =
    .label = 取下...上的别针 Tab
    .accesskey = p
tab-context-unpin-tab2 =
    .label = 取下...上的别针
    .accesskey = p
pin-selected-tabs =
    .label = 大头针标签页
    .accesskey = P
unpin-selected-tabs =
    .label = 取下...上的别针标签页
    .accesskey = p
bookmark-selected-tabs =
    .label = 书签标签页…
    .accesskey = B
tab-context-bookmark-tab =
    .label = 书签 Tab…
    .accesskey = B
tab-context-bookmark-tab2 =
    .label = 书签
    .accesskey = B
tab-context-open-in-new-container-tab =
    .label = 打开在新的容器 Tab
    .accesskey = e
tab-context-open-in-new-container-tab2 =
    .label = 打开在一个新的容器 Tab
    .accesskey = e
move-to-start =
    .label = 移动到启动
    .accesskey = S
move-to-end =
    .label = 移动到端
    .accesskey = E
move-to-new-window =
    .label = 移动到新的窗口
    .accesskey = W
# Variables
#  $profileName (string): The name of the profile to move tab to
move-to-new-profile =
    .label = 移动到 { $profileName }
tab-context-close-multiple-tabs =
    .label = 关闭倍数标签页
    .accesskey = M
tab-context-close-multiple-tabs2 =
    .label = 关闭倍数
    .accesskey = M
tab-context-close-duplicate-tabs =
    .label = 关闭复制标签页
    .accesskey = x
tab-context-close-duplicate-tabs2 =
    .label = 关闭完全一样的东西的这 Tab
    .accesskey = x
tab-context-share-url =
    .label = 部分
    .accesskey = h

## Variables:
##  $tabCount (Number): the number of tabs that are affected by the action.

tab-context-reopen-closed-tabs =
    .label =
        { $tabCount ->
            [1] 重开关闭 Tab
           *[other] 重开关闭标签页
        }
    .accesskey = o
tab-context-close-n-tabs =
    .label =
        { $tabCount ->
            [1] 关闭 Tab
           *[other] 关闭 { $tabCount } 标签页
        }
    .accesskey = C
tab-context-close-n-tabs2 =
    .label =
        { $tabCount ->
            [1] 关闭
           *[other] 关闭 { $tabCount } 标签页
        }
    .accesskey = C
tab-context-move-tabs =
    .label =
        { $tabCount ->
            [1] 移动 Tab
           *[other] 移动标签页
        }
    .accesskey = v

# Context menu option, highlighting this shows a submenu of potential destinations to move one or more tabs to (tab groups, windows, profiles, start, end, etc.)
tab-context-move-tabs2 =
    .label =
        { $tabCount ->
            [1] 移动 Tab 到
           *[other] 移动 { $tabCount } 标签页到
        }
    .accesskey = v

# Context menu option, highlighting this shows a submenu of potential destinations to move two tabs of a split view together to (tab groups, windows, profiles, start, end, etc.)
tab-context-move-split-view =
    .label = 移动拆分查看到
    .accesskey = v

# The following string intentionally omits the word "Tab" from the singular and includes it in the plural.
tab-context-send-to-device =
    .label =
        { $tabCount ->
            [1] 发送到装置
           *[other] 发送 { $tabCount } 标签页到装置
        }
    .accesskey = n
tab-context-send-to-device2 =
    .label = 发送到你的德维克（男子名、姓氏）
    .accesskey = n
# The following string intentionally omits the word "Tab" from the singular and includes it in the plural.
tab-context-send-to-mobile =
    .label =
        { $tabCount ->
            [1] 发送到移动的
           *[other] 发送 { $tabCount } 标签页到移动的
        }
    .accesskey = n

# Verb: share a collection of selected tabs as a link
tab-context-share-selected-tabs =
    .label = 创建可共享的连接
    .accesskey = a
