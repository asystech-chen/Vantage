# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

toolbar-context-menu-new-tab =
    .label = 新建选项卡
    .accesskey = w
toolbar-context-menu-reload-selected-tab =
    .label = 重新加载所选选项卡
    .accesskey = R
toolbar-context-menu-reload-selected-tabs =
    .label = 重新加载所选选项卡组
    .accesskey = R
toolbar-context-menu-bookmark-selected-tab =
    .label = 为所选选项卡添加书签…
    .accesskey = T
toolbar-context-menu-bookmark-selected-tabs =
    .label = 为所选选项卡组添加书签…
    .accesskey = T
toolbar-context-menu-select-all-tabs =
    .label = 选择所有选项卡
    .accesskey = S
# Variables
#   $tabCount (number) - Number of tabs
toolbar-context-menu-reopen-closed-tabs =
    .label =
        { $tabCount ->
            [1] 重新打开已关闭的选项卡
           *[other] 重新打开已关闭的选项卡组
        }
    .accesskey = o

toolbar-context-turn-on-vertical-tabs =
    .label = 开启垂直选项卡模式
toolbar-context-turn-off-vertical-tabs =
    .label = 关闭垂直选项卡模式
toolbar-context-customize-sidebar =
    .label = 自定义侧边栏

toolbar-context-menu-manage-extension =
    .label = 管理扩展
    .accesskey = E
toolbar-context-menu-remove-extension =
    .label = 移除扩展
    .accesskey = v

# This label is used in the extensions toolbar buttons context menus,
# a user can use this command to submit to Mozilla an abuse report
# related to that extension. "Report" is a verb.
toolbar-context-menu-report-extension =
    .label = 报告扩展问题
    .accesskey = o

# Can appear on the same context menu as toolbar-context-menu-menu-bar-cmd
# ("Menu Bar") and personalbarCmd ("Bookmarks Toolbar"), so they should
# have different access keys.
toolbar-context-menu-pin-to-overflow-menu =
    .label = 固定到溢出菜单
    .accesskey = P
toolbar-context-menu-auto-hide-downloads-button-2 =
    .label = 按钮为空时自动隐藏
    .accesskey = H
toolbar-context-menu-always-open-downloads-panel =
    .label = 下载开始时显示面板
    .accesskey = S
# Label of checkbox menu item to toggle visibility of Extensions Button.
toolbar-context-menu-always-show-extensions-button =
    .label = 始终在工具栏中显示
    .accesskey = A
toolbar-context-menu-remove-from-toolbar =
    .label = 从工具栏中移除
    .accesskey = R
toolbar-context-menu-view-customize-toolbar =
    .label = 自定义…
    .accesskey = C
toolbar-context-menu-view-customize-toolbar-2 =
    .label = 自定义工具栏…
    .accesskey = C
# This is only ever shown when toolbar-context-menu-pin-to-overflow-menu
# is hidden, so they can share access keys.
toolbar-context-menu-pin-to-toolbar =
    .label = 固定到工具栏
    .accesskey = P

toolbar-context-menu-bookmarks-toolbar-always-show-2 =
    .label = 始终显示
    .accesskey = A
toolbar-context-menu-bookmarks-toolbar-never-show-2 =
    .label = 永不显示
    .accesskey = N
toolbar-context-menu-bookmarks-toolbar-on-new-tab-2 =
    .label = 仅在新选项卡中显示
    .accesskey = O

toolbar-context-menu-bookmarks-show-other-bookmarks =
    .label = 显示其他书签
    .accesskey = h

toolbar-context-menu-menu-bar-cmd =
    .toolbarname = 菜单栏
    .accesskey = M