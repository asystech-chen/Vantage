# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

toolbar-context-menu-new-tab =
    .label = 新的 Tab
    .accesskey = w
toolbar-context-menu-reload-selected-tab =
    .label = 再装被选的 Tab
    .accesskey = R
toolbar-context-menu-reload-selected-tabs =
    .label = 再装被选的标签页
    .accesskey = R
toolbar-context-menu-bookmark-selected-tab =
    .label = 书签被选的 Tab…
    .accesskey = T
toolbar-context-menu-bookmark-selected-tabs =
    .label = 书签被选的标签页…
    .accesskey = T
toolbar-context-menu-select-all-tabs =
    .label = 选择所有的标签页
    .accesskey = S
# Variables
#   $tabCount (number) - Number of tabs
toolbar-context-menu-reopen-closed-tabs =
    .label =
        { $tabCount ->
            [1] 重开关闭 Tab
           *[other] 重开关闭标签页
        }
    .accesskey = o

toolbar-context-turn-on-vertical-tabs =
    .label = 转弯在垂直的标签页
toolbar-context-turn-off-vertical-tabs =
    .label = 转弯关闭垂直的标签页
toolbar-context-customize-sidebar =
    .label = 定制其他选项

toolbar-context-menu-manage-extension =
    .label = 管理扩展名
    .accesskey = E
toolbar-context-menu-remove-extension =
    .label = 移除扩展名
    .accesskey = v

# This label is used in the extensions toolbar buttons context menus,
# a user can use this command to submit to Mozilla an abuse report
# related to that extension. "Report" is a verb.
toolbar-context-menu-report-extension =
    .label = 报告扩展名
    .accesskey = o

# Can appear on the same context menu as toolbar-context-menu-menu-bar-cmd
# ("Menu Bar") and personalbarCmd ("Bookmarks Toolbar"), so they should
# have different access keys.
toolbar-context-menu-pin-to-overflow-menu =
    .label = 大头针到上溢菜单
    .accesskey = P
toolbar-context-menu-auto-hide-downloads-button-2 =
    .label = 隐藏按钮何时空
    .accesskey = H
toolbar-context-menu-always-open-downloads-panel =
    .label = 显示嵌板何时下载开始
    .accesskey = S
# Label of checkbox menu item to toggle visibility of Extensions Button.
toolbar-context-menu-always-show-extensions-button =
    .label = 总是显示在工具栏
    .accesskey = A
toolbar-context-menu-remove-from-toolbar =
    .label = 移除从工具栏
    .accesskey = R
toolbar-context-menu-view-customize-toolbar =
    .label = 定制…
    .accesskey = C
toolbar-context-menu-view-customize-toolbar-2 =
    .label = 定制工具栏…
    .accesskey = C
# This is only ever shown when toolbar-context-menu-pin-to-overflow-menu
# is hidden, so they can share access keys.
toolbar-context-menu-pin-to-toolbar =
    .label = 大头针到工具栏
    .accesskey = P

toolbar-context-menu-bookmarks-toolbar-always-show-2 =
    .label = 总是显示
    .accesskey = A
toolbar-context-menu-bookmarks-toolbar-never-show-2 =
    .label = 从不显示
    .accesskey = N
toolbar-context-menu-bookmarks-toolbar-on-new-tab-2 =
    .label = 仅显示在新的 Tab
    .accesskey = O

toolbar-context-menu-bookmarks-show-other-bookmarks =
    .label = 显示其他的书签
    .accesskey = h

toolbar-context-menu-menu-bar-cmd =
    .toolbarname = 菜单棒形图
    .accesskey = M
