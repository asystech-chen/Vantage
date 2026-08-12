# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

tabbrowser-empty-tab-title = 新选项卡
tabbrowser-empty-private-tab-title = 新建隐私选项卡

tabbrowser-menuitem-close-tab =
    .label = 关闭选项卡
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
            [one] 关闭选项卡
           *[other] 关闭 { $tabCount } 个选项卡
        }

## Tooltips for tab audio control
## Variables:
##   $tabCount (Number): The number of tabs that will be affected.

# Variables:
#   $shortcut (String): The keyboard shortcut for "Mute tab".
tabbrowser-mute-tab-audio-tooltip =
    .label =
        { $tabCount ->
            [one] 静音选项卡（{ $shortcut }）
           *[other] 静音 { $tabCount } 个选项卡（{ $shortcut }）
        }
# Variables:
#   $shortcut (String): The keyboard shortcut for "Unmute tab".
tabbrowser-unmute-tab-audio-tooltip =
    .label =
        { $tabCount ->
            [one] 取消静音选项卡（{ $shortcut }）
           *[other] 取消静音 { $tabCount } 个选项卡（{ $shortcut }）
        }
tabbrowser-mute-tab-audio-background-tooltip =
    .label =
        { $tabCount ->
            [one] 静音选项卡
           *[other] 静音 { $tabCount } 个选项卡
        }
tabbrowser-unmute-tab-audio-background-tooltip =
    .label =
        { $tabCount ->
            [one] 取消静音选项卡
           *[other] 取消静音 { $tabCount } 个选项卡
        }
tabbrowser-unblock-tab-audio-tooltip =
    .label =
        { $tabCount ->
            [one] 播放选项卡
           *[other] 播放 { $tabCount } 个选项卡
        }

## Tooltips for tab audio control

tabbrowser-unmute-tab-audio-aria-label =
    .aria-label = 取消静音选项卡
tabbrowser-mute-tab-audio-aria-label =
    .aria-label = 静音选项卡
# Used to unblock a tab with audio from autoplaying
tabbrowser-unblock-tab-audio-aria-label =
    .aria-label = 播放选项卡

## Confirmation dialog when closing a window with more than one tab open,
## or when quitting when only one window is open.

# The singular form is not considered since this string is used only for multiple tabs.
# Variables:
#   $tabCount (Number): The number of tabs that will be closed.
tabbrowser-confirm-close-tabs-title =
    { $tabCount ->
       *[other] 关闭 { $tabCount } 个选项卡？
    }
tabbrowser-confirm-close-tabs-button = 关闭选项卡
tabbrowser-ask-close-tabs-checkbox = 在关闭多个选项卡之前询问

## Confirmation dialog when quitting using the menu and multiple windows are open.

# The forms for 0 or 1 items are not considered since this string is used only for
# multiple windows.
# Variables:
#   $windowCount (Number): The number of windows that will be closed.
tabbrowser-confirm-close-windows-title =
    { $windowCount ->
       *[other] 关闭 { $windowCount } 个窗口？
    }
tabbrowser-confirm-close-windows-button =
    { PLATFORM() ->
        [windows] 关闭并退出
       *[other] 关闭并退出
    }

## Confirmation dialog when quitting using the keyboard shortcut (Ctrl/Cmd+Q)
## Windows does not show a prompt on quit when using the keyboard shortcut by default.
tabbrowser-confirm-close-tabs-with-key-title = 是否关闭窗口并退出 { -brand-short-name }？
tabbrowser-confirm-close-tabs-with-key-button = 退出 { -brand-short-name }
# Variables:
#   $quitKey (String): the text of the keyboard shortcut for quitting.
tabbrowser-ask-close-tabs-with-key-checkbox = 使用 { $quitKey } 退出之前询问您

## Confirmation dialog when quitting using the keyboard shortcut (Ctrl/Cmd+Q)
## and browser.warnOnQuitShortcut is true.

tabbrowser-confirm-close-warn-shortcut-title = 退出 { -brand-short-name } 还是关闭当前标签页？
tabbrowser-confirm-close-windows-warn-shortcut-button =
    { PLATFORM() ->
        [windows] 退出 { -brand-short-name }
       *[other] 退出 { -brand-short-name }
    }
tabbrowser-confirm-close-tab-only-button = 关闭当前标签页

## Confirmation dialog when opening multiple tabs simultaneously

tabbrowser-confirm-open-multiple-tabs-title = 确认打开
# Variables:
#   $tabCount (Number): The number of tabs that will be opened.
tabbrowser-confirm-open-multiple-tabs-message =
    { $tabCount ->
       *[other] 您即将打开 { $tabCount } 个标签页。此操作可能在页面加载期间降低 { -brand-short-name } 的性能。您是否确定要继续执行此操作？
    }
tabbrowser-confirm-open-multiple-tabs-button = 打开标签页
tabbrowser-confirm-open-multiple-tabs-checkbox = 当打开多个标签页可能降低 { -brand-short-name } 性能时向您发出警告

## Confirmation dialog for enabling caret browsing

tabbrowser-confirm-caretbrowsing-title = 插入符号浏览
tabbrowser-confirm-caretbrowsing-message = 按下 F7 键将启用或停用插入符号浏览。此功能会在网页中放置一个可移动的插入符号，使您能够使用键盘选择文本。您是否希望启用插入符号浏览？
tabbrowser-confirm-caretbrowsing-checkbox = 不再向您显示此对话框。

## Confirmation dialog for closing all duplicate tabs

tabbrowser-confirm-close-all-duplicate-tabs-title = 是否关闭重复标签页？
tabbrowser-confirm-close-all-duplicate-tabs-text = 我们将关闭此窗口中的重复标签页。最后活动的
 标签页将保持打开状态。
tabbrowser-confirm-close-all-duplicate-tabs-button-closetabs = 关闭标签页

##

# Variables:
#   $domain (String): URL of the page that is trying to steal focus.
tabbrowser-allow-dialogs-to-get-focus =
    .label = 允许来自 { $domain } 的此类通知将您带到其标签页

tabbrowser-customizemode-tab-title = 自定义 { -brand-short-name }

## Context menu buttons, of which only one will be visible at a time

tabbrowser-context-mute-tab =
    .label = 标签页静音
    .accesskey = M
tabbrowser-context-mute-tab2 =
    .label = 静音
    .accesskey = M
tabbrowser-context-unmute-tab =
    .label = 取消标签页静音
    .accesskey = m
tabbrowser-context-unmute-tab2 =
    .label = 取消静音
    .accesskey = m
# The accesskey should match the accesskey for tabbrowser-context-mute-tab
tabbrowser-context-mute-selected-tabs =
    .label = 标签页静音
    .accesskey = M
# The accesskey should match the accesskey for tabbrowser-context-unmute-tab
tabbrowser-context-unmute-selected-tabs =
    .label = 取消标签页静音
    .accesskey = m

# This string is used as an additional tooltip and accessibility description for tabs playing audio
tabbrowser-tab-audio-playing-description = 正在播放音频

## Ctrl-Tab dialog

# Variables:
#   $tabCount (Number): The number of tabs in the current browser window. It will always be 2 at least.
tabbrowser-ctrl-tab-list-all-tabs =
    .label =
        { $tabCount ->
           *[other] 列出全部 { $tabCount } 个标签页
        }

## Tab manager menu buttons
## Variables:
##  $tabGroupName (String): The name of the tab group. See also tab-group-name-default, which will be
##                          used when the group's name is empty.

tabbrowser-manager-mute-tab =
  .tooltiptext = 标签页静音
tabbrowser-manager-unmute-tab =
  .tooltiptext = 取消标签页静音
tabbrowser-manager-close-tab =
  .tooltiptext = 关闭标签页
# This is for tab groups that have been "saved and closed" (see tab-group-editor-action-save). It does
# not include "deleted" tab groups (see tab-group-editor-action-delete).
tabbrowser-manager-closed-tab-group =
  .label = { $tabGroupName }
  .tooltiptext = { $tabGroupName } — 已关闭
tabbrowser-manager-current-window-tab-group =
  .label = { $tabGroupName }
  .tooltiptext = { $tabGroupName } — 当前窗口

## Tab Groups
## Variables:
##  $tabGroupName (String): The name of the tab group. See also tab-group-name-default, which will be
##                          used when the group's name is empty.

# Title placed over a list of all of the user's tab groups
tab-groups-list-title = 标签页组

tab-group-name-default = 未命名组

tab-group-editor-title-create = 创建标签页组
tab-group-editor-title-edit = 管理标签页组
tab-group-editor-name-label = 名称
tab-group-editor-name-field =
  .placeholder = 示例：购物
tab-group-editor-cancel =
  .label = 取消
  .accesskey = C

tab-group-editor-color-selector =
  .aria-label = 标签页组颜色
tab-group-editor-color-selector2-blue = 蓝色
  .title = 蓝色
tab-group-editor-color-selector2-purple = 紫色
  .title = 紫色
tab-group-editor-color-selector2-cyan = 青色
  .title = 青色
tab-group-editor-color-selector2-orange = 橙色
  .title = 橙色
tab-group-editor-color-selector2-yellow = 黄色
  .title = 黄色
tab-group-editor-color-selector2-pink = 粉色
  .title = 粉色
tab-group-editor-color-selector2-green = 绿色
  .title = 绿色
tab-group-editor-color-selector2-gray = 灰色
  .title = 灰色
tab-group-editor-color-selector2-red = 红色
  .title = 红色

tab-group-menu-closed-tab-group =
  .label = { $tabGroupName }
  .title = { $tabGroupName } — 已关闭

## Variables:
##  $tabGroupName (String): The name of the tab group. Defaults to the value
##                          of tab-group-name-default.

tab-group-description = { $tabGroupName } — 标签页组
tab-group-label-tooltip-collapsed = { $tabGroupName } — 已折叠
tab-group-label-tooltip-expanded = { $tabGroupName } — 已展开
tab-group-preview-name =
  .aria-label = 折叠组中的标签页

## When collapsed, the tab group label's aria-description will indicate
## whether the hover menu is open or closed.

tab-group-preview-open-description = 标签页列表已打开
tab-group-preview-closed-description = 标签页列表已关闭

##

tab-context-unnamed-group =
    .label = 未命名组

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
        [one] 还有 { $tabCount } 个标签页
        *[other] 还有 { $tabCount } 个标签页
    }
tab-context-move-tab-to-new-group =
    .label =
        { $tabCount ->
            [1] 添加标签页到新组
           *[other] 添加标签页到新组
        }
    .accesskey = G
tab-context-move-tab-to-group =
    .label =
        { $tabCount ->
            [1] 添加标签页到组
           *[other] 添加标签页到组
        }
    .accesskey = G
tab-context-move-split-view-to-new-group =
    .label =
        { $splitViewCount ->
            [1] 添加拆分视图到新组
           *[other] 添加拆分视图到新组
        }
    .accesskey = G
tab-context-move-split-view-to-group =
    .label =
        { $splitViewCount ->
            [1] 添加拆分视图到组
           *[other] 添加拆分视图到组
        }
    .accesskey = G

##

tab-splitview-splitter =
    .aria-label = 调整拆分视图标签页的大小

tab-context-move-tab-to-group-saved-groups =
    .label = 已关闭的组
tab-group-editor-action-new-tab =
    .label = 在组中新建标签页
tab-group-editor-action-new-window =
    .label = 将组移动到新窗口
# Variables:
#  $linkCount (Number): the number of shareable links in the group.
tab-group-editor-action-copy-links =
    .label =
        { $linkCount ->
            [1] 复制组中的链接
           *[other] 复制组中的 { $linkCount } 个链接
        }
tab-group-editor-action-save =
    .label = 保存并关闭组
tab-group-editor-action-ungroup =
    .label = 取消分组标签页
tab-group-editor-action-delete =
    .label = 删除组
tab-group-editor-done =
    .label = 完成
    .accessKey = 完
# Share is a verb here. Meaning to "Share" the "tab group"
tab-group-editor-action-share-tab-group =
    .label = 共享标签页组

tab-context-reopen-tab-group =
    .label = 重新打开标签页组

# Variables:
#  $groupCount (Number): the number of tab groups that are affected by the action.
tab-context-ungroup-tab =
    .label =
        { $groupCount ->
            [1] 从组中移除
           *[other] 从各组中移除
        }
    .accesskey = 移

## The tab groups list provides a list of all open tab groups and saved tab
## groups in one place. When the user has no tab groups, the list instead
## recommends that the user create a tab group.

# Text for a button that, when clicked, creates a new tab group
tab-groups-list-create-group-button = 新建组

tab-groups-list-empty-header = 整理您的标签页
tab-groups-list-empty-description = 将一个标签页拖到另一个标签页上，或右键单击某个标签页以开始整理。我们将在此处保存您的组，以便您日后轻松找到它们。
tab-groups-list-empty-button = 创建标签页组

## Open/saved tab group context menu

# For right-click context menu use in the "all tabs"/"tab overflow menu" when
# right-clicking on a tab group that is currently open in one of the user's
# windows.

# For a tab group open in any window, clicking this will create a new
# window and move this tab group to that new window.
tab-group-context-move-to-new-window =
    .label = 将组移至新窗口

# For a tab group open in a different window from the one that the
# user is using to access the tab group menu, move that tab group into the
# user's current window.
tab-group-context-move-to-this-window =
    .label = 将组移至此窗口

# For a tab group that is open in any window, close the tab group and
# do not save it. For a tab group that is closed but saved by the user, clicking
# this will forget the saved tab group.
tab-group-context-delete =
    .label = 删除组

# For a saved tab group that is not open in any window, open the tab group
# in the user's current window.
tab-group-context-open-saved-group-in-this-window =
    .label = 在此窗口打开组

# For a saved tab group that is not open in any window, create a new window and
# open the tab group in that window.
tab-group-context-open-saved-group-in-new-window =
    .label = 在新窗口打开组

## Tab Notes

tab-context-add-note =
    .label = 添加笔记
    .accesskey = 添
tab-context-edit-note =
    .label = 编辑笔记
    .accesskey = 编

# TODO Bug 2023230: `tab-context-delete-note` is no longer used as of bug 2023200,
# but it seems likely to return, so this string is being left in place for now.

tab-context-delete-note =
    .label = 删除笔记
    .accesskey = 删
tab-note-editor-title-create = 添加笔记
tab-note-editor-title-edit = 编辑笔记
tab-note-editor-text-field =
    .placeholder = 您想记住关于此标签页的哪些内容？
tab-note-editor-button-cancel =
    .label = 取消
    .accesskey = 取
tab-note-editor-button-save =
    .label = 保存
    .accesskey = 存
tab-note-editor-button-delete =
    .title = 删除笔记
    .aria-label = 删除笔记
    .accesskey = 删
tab-note-preview-edit-icon =
    .alt = 编辑笔记
# Link to show the full tab note in case it was truncated.
tab-note-preview-expand = 阅读更多
tab-note-panel-add-note-new-badge =
    .label = 新建

# Displayed within the tab note edit dialog box when the user has entered more
# characters than are allowed.
# Variables:
#   $totalCharacters (Number): the number of characters the user has entered.
#   $maxAllowedCharacters (Number): the maximum number of characters allowed for a tab note.
tab-note-editor-character-limit =
    { $maxAllowedCharacters ->
         *[other] { NUMBER($totalCharacters, useGrouping: "false") }/{ NUMBER($maxAllowedCharacters, useGrouping: "false") } 个字符
    }

## Split View

# Split view tabs display their respective contents side by side
# Displayed within the tooltip on the left tab inside of a tab split view
# "left" corresponds to the visual position. Translate literally; do not swap for RTL languages.
# Variables:
#   $label (String): the text label of the tab visible in the tab strip
tabbrowser-tab-label-tab-split-view-left = { $label }，左侧拆分视图
# Displayed within the tooltip on the right tab inside of a tab split view
# "right" corresponds to the visual position. Translate literally; do not swap for RTL languages.
# Variables:
#   $label (String): the text label of the tab visible in the tab strip
tabbrowser-tab-label-tab-split-view-right = { $label }，右侧拆分视图

# Open a new tab next to the current tab and display their contents side by side
tab-context-add-split-view =
    .label = 添加拆分视图
    .accesskey = t
# Display the two selected tabs' contents side by side
tab-context-open-in-split-view =
    .label = 在拆分视图中打开
    .accesskey = t
# Separate the two split view tabs and display the tabs and their contents as normal
tab-context-separate-split-view =
    .label = 分离拆分视图
    .accesskey = t
# Reverse the order of the two tabs in the split view
tab-context-reverse-split-view =
    .label = 反转标签
    .accesskey = r
tab-context-badge-new = 新

## Manage Split View (icon in the address bar & three-dot menu in the footer)

# "Separate" is a verb, as in "separate the split view tabs and display them normally".
split-view-menuitem-separate-tabs =
    .label = 分离标签
# "Reverse" is a verb, as in "reverse the order of split view tabs".
split-view-menuitem-reverse-tabs =
    .label = 反转标签
split-view-menuitem-close-both-tabs =
    .label = 关闭这两个标签

##
