# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# NOTE: For English locales, strings in this file should be in APA-style Title Case.
# See https://apastyle.apa.org/style-grammar-guidelines/capitalization/title-case
#
# NOTE: For Engineers, please don't reuse these strings outside of the menubar.

## Application Menu (macOS only)

menu-application-preferences =
    .label = 参数选择
# Starting with macOS Ventura (13), the name of the "Preferences" menu item changed to "Settings".
menu-application-settings =
    .label = 设置…
menu-application-set-as-default =
    .label = 日落 { -brand-shorter-name } 作为默认浏览器
menu-application-services =
    .label = 服务
menu-application-hide-this =
    .label = 隐藏 { -brand-shorter-name }
menu-application-hide-other =
    .label = 隐藏其他的
menu-application-show-all =
    .label = 显示所有的
menu-application-touch-bar =
    .label = 定制触觉棒形图…

##

# These menu-quit strings are only used on Windows and Linux.
menu-quit =
    .label =
        { PLATFORM() ->
            [windows] 出口
           *[other] 结束
        }
    .accesskey =
        { PLATFORM() ->
            [windows] x
           *[other] Q
        }

# This menu-quit-mac string is only used on macOS.
menu-quit-mac =
    .label = 结束 { -brand-shorter-name }

menu-about =
    .label = 关于 { -brand-shorter-name }
    .accesskey = A

## File Menu

menu-file =
    .label = 文件
    .accesskey = F
menu-file-new-tab =
    .label = 新的 Tab
    .accesskey = T
menu-file-new-container-tab =
    .label = 新的容器 Tab
    .accesskey = b
menu-file-new-window =
    .label = 新的窗口
    .accesskey = N
menu-file-new-private-window =
    .label = 新的私人的窗口
    .accesskey = W
# "Open Location" is only displayed on macOS, and only on windows
# that aren't main browser windows, or when there are no windows
# but Firefox is still running.
menu-file-open-location =
    .label = 打开位置…
menu-file-open-file =
    .label = 打开文件…
    .accesskey = O
# Variables:
#  $tabCount (Number): the number of tabs that are affected by the action.
menu-file-close-tab =
    .label =
        { $tabCount ->
            [1] 关闭 Tab
           *[other] 关闭 { $tabCount } 标签页
        }
    .accesskey = C
menu-file-close-window =
    .label = 关闭窗口
    .accesskey = d
menu-file-save-page =
    .label = 保存页作为…
    .accesskey = A
menu-file-email-link =
    .label = 电子信函连接…
    .accesskey = E
menu-file-share-url =
    .label = 部分
    .accesskey = h
menu-file-share-qrcode =
    .label = 产生 QR 代码…
    .accesskey = Q
menu-file-share-qrcode2 =
    .label = 产生 QR 代码
    .accesskey = Q
menu-file-print-setup =
    .label = 页设置…
    .accesskey = u
menu-file-print =
    .label = 打印…
    .accesskey = P
menu-file-import-from-another-browser =
    .label = 引入从另外的浏览器…
    .accesskey = I
menu-file-go-offline =
    .label = 工作挂线
    .accesskey = k

## Edit Menu

menu-edit =
    .label = 编辑
    .accesskey = E
menu-edit-find-in-page =
    .label = 发现在页…
    .accesskey = F
menu-edit-find-again =
    .label = 发现再一次
    .accesskey = g
menu-edit-bidi-switch-text-direction =
    .label = 开关电文方向
    .accesskey = w

## View Menu

menu-view =
    .label = 查看
    .accesskey = V
menu-view-toolbars-menu =
    .label = 工具栏
    .accesskey = T
menu-view-customize-toolbar2 =
    .label = 定制工具栏…
    .accesskey = C
menu-view-sidebar =
    .label = 其他选项
    .accesskey = e
menu-view-bookmarks =
    .label = 书签
menu-view-history-button =
    .label = 历史记录
menu-view-synced-tabs-sidebar =
    .label = synchronization 的缩略词标签页
menu-view-full-zoom =
    .label = 缩放
    .accesskey = Z
menu-view-full-zoom-enlarge =
    .label = 缩放在
    .accesskey = I
menu-view-full-zoom-reduce =
    .label = 缩放外面的
    .accesskey = O
menu-view-full-zoom-actual-size =
    .label = 真实的大小
    .accesskey = A
menu-view-full-zoom-toggle =
    .label = 缩放电文仅
    .accesskey = T
menu-view-page-style-menu =
    .label = 页风格
    .accesskey = y
menu-view-page-style-no-style =
    .label = 无风格
    .accesskey = n
menu-view-page-basic-style =
    .label = 基本原理页风格
    .accesskey = B
menu-view-repair-text-encoding =
    .label = 修理电文编码
    .accesskey = c

## These should match what Safari and other Apple applications
## use on macOS.

menu-view-enter-full-screen =
    .label = Enter 完整筛选
    .accesskey = F
menu-view-exit-full-screen =
    .label = 出口完整筛选
    .accesskey = F
menu-view-full-screen =
    .label = 完整筛选
    .accesskey = F

## These menu items may use the same accesskey.

# This should match reader-view-enter-button in browser.ftl
menu-view-enter-readerview =
    .label = Enter 阅读程序查看
    .accesskey = R
# This should match reader-view-close-button in browser.ftl
menu-view-close-readerview =
    .label = 关闭阅读程序查看
    .accesskey = R

##

menu-view-show-all-tabs =
    .label = 显示所有的标签页
    .accesskey = A
menu-view-bidi-switch-page-direction =
    .label = 开关页方向
    .accesskey = D

## History Menu

menu-history =
    .label = 历史记录
    .accesskey = s
menu-history-show-all-history =
    .label = 显示所有的历史记录
menu-history-clear-recent-history =
    .label = 清除最近的历史记录…
menu-history-synced-tabs =
    .label = synchronization 的缩略词标签页
menu-history-restore-last-session =
    .label = 回复早先的会话
menu-history-hidden-tabs =
    .label = 隐藏的标签页
menu-history-undo-menu =
    .label = 最近关闭标签页
menu-history-undo-window-menu =
    .label = 最近关闭窗口
# "Search" is a verb, as in "Search in History"
menu-history-search =
    .label = 搜索历史记录

## Bookmarks Menu

menu-bookmarks-menu =
    .label = 书签
    .accesskey = B
menu-bookmarks-manage =
    .label = 管理书签
menu-bookmark-tab =
    .label = 书签当前的 Tab…
menu-edit-bookmark =
    .label = 编辑这书签…
# "Search" is a verb, as in "Search in bookmarks"
menu-bookmarks-search =
    .label = 搜索书签
menu-bookmarks-all-tabs =
    .label = 书签所有的标签页…
menu-bookmarks-toolbar =
    .label = 书签工具栏
menu-bookmarks-other =
    .label = 其他的书签
menu-bookmarks-mobile =
    .label = 移动的书签

## Profiles Menu

menu-profiles-menu =
    .label = 提问档
    .accesskey = P
menu-profiles-manage-profiles =
    .label = 管理提问档
menu-profiles-new-profile =
    .label = 新的提问档
# Variables:
#  $profileName (String): the name of the users profile
menu-profiles-current =
    .label = { $profileName } (当前的)

## Tools Menu

menu-tools =
    .label = 工具
    .accesskey = T
menu-tools-downloads =
    .label = 下载
    .accesskey = D
menu-tools-extensions-and-themes =
    .label = 扩展名和他们
    .accesskey = E
menu-tools-fxa-sign-in2 =
    .label = 正负号在
    .accesskey = g
menu-tools-turn-on-sync2 =
    .label = 转弯在同步的…
    .accesskey = n
menu-tools-sync-now =
    .label = 同步的现在
    .accesskey = o
menu-tools-fxa-re-auth =
    .label = 使再接合到 { -brand-product-name }…
    .accesskey = R
menu-tools-browser-tools =
    .label = 浏览器工具
    .accesskey = B
menu-tools-task-manager =
    .label = 任务管理器
    .accesskey = M
menu-tools-page-source =
    .label = 页来源
    .accesskey = o
menu-tools-page-info =
    .label = 页信息
    .accesskey = I
menu-settings =
    .label = 设置
    .accesskey =
        { PLATFORM() ->
            [windows] S
           *[other] n
        }
menu-tools-layout-debugger =
    .label = 页面布局调试程序
    .accesskey = L

## Window Menu

menu-window-menu =
    .label = 窗口
menu-window-bring-all-to-front =
    .label = 带来所有的到面对

## Help Menu

# NOTE: For Engineers, any additions or changes to Help menu strings should
# also be reflected in the related strings in appmenu.ftl. Those strings, by
# convention, will have the same ID as these, but prefixed with "app".
# Example: appmenu-get-help
#
# These strings are duplicated to allow for different casing depending on
# where the strings appear.

menu-help =
    .label = 帮忙
    .accesskey = H
menu-get-help =
    .label = 获得帮忙
    .accesskey = H
menu-help-more-troubleshooting-info =
    .label = 更多发现并修理故障信息
    .accesskey = T
menu-help-share-ideas =
    .label = 部分工业设计优秀奖和反馈…
    .accesskey = S
menu-help-enter-troubleshoot-mode2 =
    .label = 障碍修理模式…
    .accesskey = M
menu-help-exit-troubleshoot-mode =
    .label = 转弯障碍修理模式关闭
    .accesskey = M
menu-help-switch-device =
    .label = 交换到一个新的装置
    .accesskey = N
# Label of the Help menu item. Either this or
# menu-help-notdeceptive is shown.
menu-help-report-deceptive-site =
    .label = 报告迷惑的位置…
    .accesskey = D
menu-help-not-deceptive =
    .label = 这 (=is not)不是一个迷惑的位置…
    .accesskey = D
menu-report-broken-site =
  .label = 报告坏掉的位置
