# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

tabbrowser-empty-tab-title = 新的 Tab
tabbrowser-empty-private-tab-title = 新的私人的 Tab

tabbrowser-menuitem-close-tab =
    .label = 关闭 Tab
tabbrowser-menuitem-close =
    .label = 关闭

# Displayed within the tooltip on tabs inside of a tab group.
# Variables:
#   $tabGroupName (String): the user-defined name of the current tab group.
tabbrowser-tab-tooltip-tab-group = { $tabGroupName }

# Displayed within the tooltip on tabs in a container.
# Variables:
#   $containerName (String): the name of the current container.
tabbrowser-tab-tooltip-container = { $containerName }

# Displayed within the tooltip on tabs inside of a tab group if the tab is also in a container.
# Variables:
#   $tabGroupName (String): the user-defined name of the current tab group.
#   $containerName (String): the name of the current container.
tabbrowser-tab-tooltip-tab-group-container = { $tabGroupName } — { $containerName }

# This text serves as an on-screen tooltip as well as an accessible name for
# the "X" button that is shown on the active tab or, when multiple tabs are
# selected, to all their "X" buttons.
# Variables:
#   $tabCount (Number): The number of tabs that will be closed.
tabbrowser-close-tabs-button =
    .tooltiptext =
        { $tabCount ->
            [one] 关闭标签页
           *[other] 关闭 { $tabCount } 标签页
        }

## Tooltips for tab audio control
## Variables:
##   $tabCount (Number): The number of tabs that will be affected.

# Variables:
#   $shortcut (String): The keyboard shortcut for "Mute tab".
tabbrowser-mute-tab-audio-tooltip =
    .label =
        { $tabCount ->
            [one] 哑子标签页 ({ $shortcut })
           *[other] 哑子 { $tabCount } 标签页 ({ $shortcut })
        }
# Variables:
#   $shortcut (String): The keyboard shortcut for "Unmute tab".
tabbrowser-unmute-tab-audio-tooltip =
    .label =
        { $tabCount ->
            [one] Unmute 标签页 ({ $shortcut })
           *[other] Unmute { $tabCount } 标签页 ({ $shortcut })
        }
tabbrowser-mute-tab-audio-background-tooltip =
    .label =
        { $tabCount ->
            [one] 哑子标签页
           *[other] 哑子 { $tabCount } 标签页
        }
tabbrowser-unmute-tab-audio-background-tooltip =
    .label =
        { $tabCount ->
            [one] Unmute 标签页
           *[other] Unmute { $tabCount } 标签页
        }
tabbrowser-unblock-tab-audio-tooltip =
    .label =
        { $tabCount ->
            [one] 播放标签页
           *[other] 播放 { $tabCount } 标签页
        }

## Tooltips for tab audio control

tabbrowser-unmute-tab-audio-aria-label =
    .aria-label = Unmute 标签页
tabbrowser-mute-tab-audio-aria-label =
    .aria-label = 哑子标签页
# Used to unblock a tab with audio from autoplaying
tabbrowser-unblock-tab-audio-aria-label =
    .aria-label = 播放标签页

## Confirmation dialog when closing a window with more than one tab open,
## or when quitting when only one window is open.

# The singular form is not considered since this string is used only for multiple tabs.
# Variables:
#   $tabCount (Number): The number of tabs that will be closed.
tabbrowser-confirm-close-tabs-title =
    { $tabCount ->
       *[other] 关闭 { $tabCount } 标签页?
    }
tabbrowser-confirm-close-tabs-button = 关闭标签页
tabbrowser-ask-close-tabs-checkbox = 询问在...之前关闭倍数标签页

## Confirmation dialog when quitting using the menu and multiple windows are open.

# The forms for 0 or 1 items are not considered since this string is used only for
# multiple windows.
# Variables:
#   $windowCount (Number): The number of windows that will be closed.
tabbrowser-confirm-close-windows-title =
    { $windowCount ->
       *[other] 关闭 { $windowCount } 窗?
    }
tabbrowser-confirm-close-windows-button =
    { PLATFORM() ->
        [windows] 关闭和出口
       *[other] 关闭和结束
    }

## Confirmation dialog when quitting using the keyboard shortcut (Ctrl/Cmd+Q)
## Windows does not show a prompt on quit when using the keyboard shortcut by default.

tabbrowser-confirm-close-tabs-with-key-title = 关闭窗口和结束 { -brand-short-name }?
tabbrowser-confirm-close-tabs-with-key-button = 结束 { -brand-short-name }
# Variables:
#   $quitKey (String): the text of the keyboard shortcut for quitting.
tabbrowser-ask-close-tabs-with-key-checkbox = 询问在...之前书面收据与 { $quitKey }

## Confirmation dialog when quitting using the keyboard shortcut (Ctrl/Cmd+Q)
## and browser.warnOnQuitShortcut is true.

tabbrowser-confirm-close-warn-shortcut-title = 结束 { -brand-short-name } 或关闭当前的标签页?
tabbrowser-confirm-close-windows-warn-shortcut-button =
    { PLATFORM() ->
        [windows] 出口 { -brand-short-name }
       *[other] 结束 { -brand-short-name }
    }
tabbrowser-confirm-close-tab-only-button = 关闭当前的标签页

## Confirmation dialog when opening multiple tabs simultaneously

tabbrowser-confirm-open-multiple-tabs-title = 确认打开
# Variables:
#   $tabCount (Number): The number of tabs that will be opened.
tabbrowser-confirm-open-multiple-tabs-message =
    { $tabCount ->
       *[other] 你是关于到打开 { $tabCount } 标签页. 这可能 (使)慢下来向下 { -brand-short-name } 一会儿那页是装载. 你确定你想要到继续?
    }
tabbrowser-confirm-open-multiple-tabs-button = 打开标签页
tabbrowser-confirm-open-multiple-tabs-checkbox = 警告我何时打开倍数标签页可能 (使)慢下来向下 { -brand-short-name }

## Confirmation dialog for enabling caret browsing

tabbrowser-confirm-caretbrowsing-title = ^符号浏览
tabbrowser-confirm-caretbrowsing-message = 紧迫的故障7 转弯 ^符号浏览在或关闭. 这特性地方一个活动的东西光标在网页, 允许你到选择电文与那键盘. 你是否想要到使旋转 ^符号浏览在?
tabbrowser-confirm-caretbrowsing-checkbox = 做不显示我这对话方框再一次.

## Confirmation dialog for closing all duplicate tabs

tabbrowser-confirm-close-all-duplicate-tabs-title = 关闭复制标签页?
tabbrowser-confirm-close-all-duplicate-tabs-text = 我们将关闭复制标签页在这窗口. 那最后活跃的
 标签页将制止打开.
tabbrowser-confirm-close-all-duplicate-tabs-button-closetabs = 关闭标签页

##

# Variables:
#   $domain (String): URL of the page that is trying to steal focus.
tabbrowser-allow-dialogs-to-get-focus =
    .label = 允许通知相似的这从 { $domain } 到采取你到他们的标签页

tabbrowser-customizemode-tab-title = 定制 { -brand-short-name }

## Context menu buttons, of which only one will be visible at a time

tabbrowser-context-mute-tab =
    .label = 哑子 Tab
    .accesskey = M
tabbrowser-context-mute-tab2 =
    .label = 哑子
    .accesskey = M
tabbrowser-context-unmute-tab =
    .label = Unmute Tab
    .accesskey = m
tabbrowser-context-unmute-tab2 =
    .label = Unmute
    .accesskey = m
# The accesskey should match the accesskey for tabbrowser-context-mute-tab
tabbrowser-context-mute-selected-tabs =
    .label = 哑子标签页
    .accesskey = M
# The accesskey should match the accesskey for tabbrowser-context-unmute-tab
tabbrowser-context-unmute-selected-tabs =
    .label = Unmute 标签页
    .accesskey = m

# This string is used as an additional tooltip and accessibility description for tabs playing audio
tabbrowser-tab-audio-playing-description = 游戏音频的

## Ctrl-Tab dialog

# Variables:
#   $tabCount (Number): The number of tabs in the current browser window. It will always be 2 at least.
tabbrowser-ctrl-tab-list-all-tabs =
    .label =
        { $tabCount ->
           *[other] 列表所有的 { $tabCount } 标签页
        }

## Tab manager menu buttons
## Variables:
##  $tabGroupName (String): The name of the tab group. See also tab-group-name-default, which will be
##                          used when the group's name is empty.

tabbrowser-manager-mute-tab =
  .tooltiptext = 哑子标签页
tabbrowser-manager-unmute-tab =
  .tooltiptext = Unmute 标签页
tabbrowser-manager-close-tab =
  .tooltiptext = 关闭标签页
# This is for tab groups that have been "saved and closed" (see tab-group-editor-action-save). It does
# not include "deleted" tab groups (see tab-group-editor-action-delete).
tabbrowser-manager-closed-tab-group =
  .label = { $tabGroupName }
  .tooltiptext = { $tabGroupName } —关闭
tabbrowser-manager-current-window-tab-group =
  .label = { $tabGroupName }
  .tooltiptext = { $tabGroupName } —当前的窗口

## Tab Groups
## Variables:
##  $tabGroupName (String): The name of the tab group. See also tab-group-name-default, which will be
##                          used when the group's name is empty.

# Title placed over a list of all of the user's tab groups
tab-groups-list-title = Tab 创建组

tab-group-name-default = 无名的创建组
tab-group-editor-title-create = 创建标签页创建组
tab-group-editor-title-edit = 管理标签页创建组
tab-group-editor-name-label = 名称
tab-group-editor-name-field =
  .placeholder = 例子: 买东西
tab-group-editor-cancel =
  .label = 取消
  .accesskey = C

tab-group-editor-color-selector =
  .aria-label = Tab 创建组颜色
tab-group-editor-color-selector2-blue = 蓝色
  .title = 蓝色
tab-group-editor-color-selector2-purple = 紫色
  .title = 紫色
tab-group-editor-color-selector2-cyan = 蓝绿色
  .title = 蓝绿色
tab-group-editor-color-selector2-orange = 柑橘
  .title = 柑橘
tab-group-editor-color-selector2-yellow = 黄色
  .title = 黄色
tab-group-editor-color-selector2-pink = 粉红色
  .title = 粉红色
tab-group-editor-color-selector2-green = 绿色
  .title = 绿色
tab-group-editor-color-selector2-gray = 灰色
  .title = 灰色
tab-group-editor-color-selector2-red = 简化
  .title = 简化

tab-group-menu-closed-tab-group =
  .label = { $tabGroupName }
  .title = { $tabGroupName } —关闭

## Variables:
##  $tabGroupName (String): The name of the tab group. Defaults to the value
##                          of tab-group-name-default.

tab-group-description = { $tabGroupName } — Tab 创建组
tab-group-label-tooltip-collapsed = { $tabGroupName } —倒塌的
tab-group-label-tooltip-expanded = { $tabGroupName } —扩充的
tab-group-preview-name =
  .aria-label = 标签页在一个倒塌的创建组

## When collapsed, the tab group label's aria-description will indicate
## whether the hover menu is open or closed.

tab-group-preview-open-description = 标签页列表打开
tab-group-preview-closed-description = 标签页列表关闭

##

tab-context-unnamed-group =
    .label = 无名的创建组

## Variables:
##  $tabCount (Number): the number of tabs that are affected by the action.
##  $splitViewCount (Number): the number of split views that are affected by the action.

# When a tab group containing the active tab is collapsed, the active tab
# remains visible. An indicator appears at the end of the group showing the
# number of remaining tabs that are hidden by the collapsed group,
# e.g. "+2" for a group with 3 total tabs.
tab-group-overflow-count = +{ $tabCount }
tab-group-overflow-count-tooltip =
    { $tabCount ->
        [one] { $tabCount } 更多标签页
        *[other] { $tabCount } 更多标签页
    }
tab-context-move-tab-to-new-group =
    .label =
        { $tabCount ->
            [1] 添加 Tab 到新的创建组
           *[other] 添加标签页到新的创建组
        }
    .accesskey = G
tab-context-move-tab-to-group =
    .label =
        { $tabCount ->
            [1] 添加 Tab 到创建组
           *[other] 添加标签页到创建组
        }
    .accesskey = G
tab-context-move-split-view-to-new-group =
    .label =
        { $splitViewCount ->
            [1] 添加拆分查看到新的创建组
           *[other] 添加拆分查看到新的创建组
        }
    .accesskey = G
tab-context-move-split-view-to-group =
    .label =
        { $splitViewCount ->
            [1] 添加拆分查看到创建组
           *[other] 添加拆分查看到创建组
        }
    .accesskey = G

##

tab-splitview-splitter =
    .aria-label = 调整大小拆分查看标签页

tab-context-move-tab-to-group-saved-groups =
    .label = 关闭创建组
tab-group-editor-action-new-tab =
    .label = 新的标签页在创建组
tab-group-editor-action-new-window =
    .label = 移动创建组到新的窗口
# Variables:
#  $linkCount (Number): the number of shareable links in the group.
tab-group-editor-action-copy-links =
    .label =
        { $linkCount ->
            [1] 复制连接在创建组
           *[other] 复制 { $linkCount } 连接在创建组
        }
tab-group-editor-action-save =
    .label = 保存和关闭创建组
tab-group-editor-action-ungroup =
    .label = 取消组标签页
tab-group-editor-action-delete =
    .label = 删除创建组
tab-group-editor-done =
    .label = 完成了的
    .accessKey = D
# Share is a verb here. Meaning to "Share" the "tab group"
tab-group-editor-action-share-tab-group =
    .label = 部分标签页创建组

tab-context-reopen-tab-group =
    .label = 重开标签页创建组

# Variables:
#  $groupCount (Number): the number of tab groups that are affected by the action.
tab-context-ungroup-tab =
    .label =
        { $groupCount ->
            [1] 移除从创建组
           *[other] 移除从创建组
        }
    .accesskey = R

## The tab groups list provides a list of all open tab groups and saved tab
## groups in one place. When the user has no tab groups, the list instead
## recommends that the user create a tab group.

# Text for a button that, when clicked, creates a new tab group
tab-groups-list-create-group-button = 新的创建组

tab-groups-list-empty-header = 椅子的背罩向上的你的标签页
tab-groups-list-empty-description = 拖动一(个) 标签页在...之上另外的或右-click 一个标签页到启动组织. 我们将保存你的创建组这里如此他们是容易的到发现以后.
tab-groups-list-empty-button = 创建一个标签页创建组

## Open/saved tab group context menu

# For right-click context menu use in the "all tabs"/"tab overflow menu" when
# right-clicking on a tab group that is currently open in one of the user's
# windows.

# For a tab group open in any window, clicking this will create a new
# window and move this tab group to that new window.
tab-group-context-move-to-new-window =
    .label = 移动创建组到新的窗口

# For a tab group open in a different window from the one that the
# user is using to access the tab group menu, move that tab group into the
# user's current window.
tab-group-context-move-to-this-window =
    .label = 移动创建组到这窗口

# For a tab group that is open in any window, close the tab group and
# do not save it. For a tab group that is closed but saved by the user, clicking
# this will forget the saved tab group.
tab-group-context-delete =
    .label = 删除创建组

# For a saved tab group that is not open in any window, open the tab group
# in the user's current window.
tab-group-context-open-saved-group-in-this-window =
    .label = 打开创建组在这窗口

# For a saved tab group that is not open in any window, create a new window and
# open the tab group in that window.
tab-group-context-open-saved-group-in-new-window =
    .label = 打开创建组在新的窗口

## Tab Notes

tab-context-add-note =
    .label = 添加笔记
    .accesskey = A
tab-context-edit-note =
    .label = 编辑笔记
    .accesskey = E

# TODO Bug 2023230: `tab-context-delete-note` is no longer used as of bug 2023200,
# but it seems likely to return, so this string is being left in place for now.

tab-context-delete-note =
    .label = 删除笔记
    .accesskey = D
tab-note-editor-title-create = 添加笔记
tab-note-editor-title-edit = 编辑笔记
tab-note-editor-text-field =
    .placeholder = 什么你是否想要到记住关于这标签页?
tab-note-editor-button-cancel =
    .label = 取消
    .accesskey = C
tab-note-editor-button-save =
    .label = 保存
    .accesskey = S
tab-note-editor-button-delete =
    .title = 删除笔记
    .aria-label = 删除笔记
    .accesskey = D
tab-note-preview-edit-icon =
    .alt = 编辑笔记
# Link to show the full tab note in case it was truncated.
tab-note-preview-expand = 读取更多
tab-note-panel-add-note-new-badge =
    .label = 新的

# Displayed within the tab note edit dialog box when the user has entered more
# characters than are allowed.
# Variables:
#   $totalCharacters (Number): the number of characters the user has entered.
#   $maxAllowedCharacters (Number): the maximum number of characters allowed for a tab note.
tab-note-editor-character-limit =
    { $maxAllowedCharacters ->
         *[other] { NUMBER($totalCharacters, useGrouping: "false") }/{ NUMBER($maxAllowedCharacters, useGrouping: "false") } 字符
    }

## Split View

# Split view tabs display their respective contents side by side
# Displayed within the tooltip on the left tab inside of a tab split view
# "left" corresponds to the visual position. Translate literally; do not swap for RTL languages.
# Variables:
#   $label (String): the text label of the tab visible in the tab strip
tabbrowser-tab-label-tab-split-view-left = { $label }, 拆分查看许可

# Split view tabs display their respective contents side by side
# Displayed within the tooltip on the right tab inside of a tab split view
# "right" corresponds to the visual position. Translate literally; do not swap for RTL languages.
# Variables:
#   $label (String): the text label of the tab visible in the tab strip
tabbrowser-tab-label-tab-split-view-right = { $label }, 拆分查看右

# Open a new tab next to the current tab and display their contents side by side
tab-context-add-split-view =
    .label = 添加拆分查看
    .accesskey = t
# Display the two selected tabs' contents side by side
tab-context-open-in-split-view =
    .label = 打开在拆分查看
    .accesskey = t
# Separate the two split view tabs and display the tabs and their contents as normal
tab-context-separate-split-view =
    .label = 独立件拆分查看
    .accesskey = t
# Reverse the order of the two tabs in the split view
tab-context-reverse-split-view =
    .label = 反转标签页
    .accesskey = r
tab-context-badge-new = 新的

## Manage Split View (icon in the address bar & three-dot menu in the footer)

# "Separate" is a verb, as in "separate the split view tabs and display them normally".
split-view-menuitem-separate-tabs =
    .label = 独立件标签页
# "Reverse" is a verb, as in "reverse the order of split view tabs".
split-view-menuitem-reverse-tabs =
    .label = 反转标签页
split-view-menuitem-close-both-tabs =
    .label = 关闭两者的标签页

##
