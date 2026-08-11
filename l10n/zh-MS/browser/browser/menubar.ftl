# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# NOTE: For English locales, strings in this file should be in APA-style Title Case.
# See https://apastyle.apa.org/style-grammar-guidelines/capitalization/title-case
#
# NOTE: For Engineers, please don't reuse these strings outside of the menubar.

## Application Menu (macOS only)

menu-application-preferences =
    .label = 偏好设置
# Starting with macOS Ventura (13), the name of the "Preferences" menu item changed to "Settings".
menu-application-settings =
    .label = 设置…
menu-application-set-as-default =
    .label = 将 { -brand-shorter-name } 设置为默认浏览器
menu-application-services =
    .label = 服务
menu-application-hide-this =
    .label = 隐藏 { -brand-shorter-name }
menu-application-hide-other =
    .label = 隐藏其他
menu-application-show-all =
    .label = 显示全部
menu-application-touch-bar =
    .label = 自定义触控栏…

##

# These menu-quit strings are only used on Windows and Linux.
menu-quit =
    .label =
        { PLATFORM() ->
            [windows] 退出
           *[other] 退出
        }
    .accesskey =
        { PLATFORM() ->
            [windows] x
           *[other] Q
        }

# This menu-quit-mac string is only used on macOS.
menu-quit-mac =
    .label = 退出 { -brand-shorter-name }

menu-about =
    .label = 关于 { -brand-shorter-name }
    .accesskey = A

## File Menu

menu-file =
    .label = 文件
    .accesskey = F
menu-file-new-tab =
    .label = 新建选项卡
    .accesskey = T
menu-file-new-container-tab =
    .label = 新建容器选项卡
    .accesskey = b
menu-file-new-window =
    .label = 新建窗口
    .accesskey = N
menu-file-new-private-window =
    .label = 新建隐私窗口
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
            [1] 关闭选项卡
           *[other] 关闭 { $tabCount } 个选项卡
        }
    .accesskey = C
menu-file-close-window =
    .label = 关闭窗口
    .accesskey = d
menu-file-save-page =
    .label = 页面另存为…
    .accesskey = A
menu-file-email-link =
    .label = 电子邮件链接…
    .accesskey = E
menu-file-share-url =
    .label = 分享
    .accesskey = h
menu-file-share-qrcode =
    .label = 生成二维码…
    .accesskey = Q
menu-file-share-qrcode2 =
    .label = 生成二维码
    .accesskey = Q
menu-file-print-setup =
    .label = 页面设置…
    .accesskey = u
menu-file-print =
    .label = 打印…
    .accesskey = P
menu-file-import-from-another-browser =
    .label = 从其他浏览器导入…
    .accesskey = I
menu-file-go-offline =
    .label = 脱机工作
    .accesskey = k

## Edit Menu

menu-edit =
    .label = 编辑
    .accesskey = E
menu-edit-find-in-page =
    .label = 在页面中查找…
    .accesskey = F
menu-edit-find-again =
    .label = 再次查找
    .accesskey = g
menu-edit-bidi-switch-text-direction =
    .label = 切换文本方向
    .accesskey = w

## View Menu

menu-view =
    .label = 查看
    .accesskey = V
menu-view-toolbars-menu =
    .label = 工具栏
    .accesskey = T
menu-view-customize-toolbar2 =
    .label = 自定义工具栏…
    .accesskey = C
menu-view-sidebar =
    .label = 侧边栏
    .accesskey = e
menu-view-bookmarks =
    .label = 书签
menu-view-history-button =
    .label = 历史记录
menu-view-synced-tabs-sidebar =
    .label = 已同步的标签页
menu-view-full-zoom =
    .label = 缩放
    .accesskey = Z
menu-view-full-zoom-enlarge =
    .label = 放大
    .accesskey = I
menu-view-full-zoom-reduce =
    .label = 缩小
    .accesskey = O
menu-view-full-zoom-actual-size =
    .label = 实际大小
    .accesskey = A
menu-view-full-zoom-toggle =
    .label = 仅缩放文本
    .accesskey = T
menu-view-page-style-menu =
    .label = 页面样式
    .accesskey = y
menu-view-page-style-no-style =
    .label = 无样式
    .accesskey = n
menu-view-page-basic-style =
    .label = 基本页面样式
    .accesskey = B
menu-view-repair-text-encoding =
    .label = 修复文本编码
    .accesskey = c

## These should match what Safari and other Apple applications
## use on macOS.

menu-view-enter-full-screen =
    .label = 进入全屏幕
    .accesskey = F
menu-view-exit-full-screen =
    .label = 退出全屏幕
    .accesskey = F
menu-view-full-screen =
    .label = 全屏幕
    .accesskey = F

## These menu items may use the same accesskey.

# This should match reader-view-enter-button in browser.ftl
menu-view-enter-readerview =
    .label = 进入阅读模式
    .accesskey = R
# This should match reader-view-close-button in browser.ftl
menu-view-close-readerview =
    .label = 关闭阅读模式
    .accesskey = R

##

menu-view-show-all-tabs =
    .label = 显示所有标签页
    .accesskey = A
menu-view-bidi-switch-page-direction =
    .label = 切换页面方向
    .accesskey = D

## History Menu

menu-history =
    .label = 历史记录
    .accesskey = s
menu-history-show-all-history =
    .label = 显示全部历史记录
menu-history-clear-recent-history =
    .label = 清除最近的历史记录…
menu-history-synced-tabs =
    .label = 已同步的标签页
menu-history-restore-last-session =
    .label = 恢复上一次会话
menu-history-hidden-tabs =
    .label = 隐藏的标签页
menu-history-undo-menu =
    .label = 最近关闭的标签页
menu-history-undo-window-menu =
    .label = 最近关闭的窗口
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
    .label = 将此选项卡加入书签…
menu-edit-bookmark =
    .label = 编辑此书签…
# "Search" is a verb, as in "Search in bookmarks"
menu-bookmarks-search =
    .label = 搜索书签
menu-bookmarks-all-tabs =
    .label = 将所有选项卡加入书签…
menu-bookmarks-toolbar =
    .label = 书签工具栏
menu-bookmarks-other =
    .label = 其他书签
menu-bookmarks-mobile =
    .label = 移动设备书签

## Profiles Menu

menu-profiles-menu =
    .label = 配置文件
    .accesskey = P
menu-profiles-manage-profiles =
    .label = 管理配置文件
menu-profiles-new-profile =
    .label = 新建配置文件
# Variables:
#  $profileName (String): the name of the users profile
menu-profiles-current =
    .label = { $profileName }（当前）

## Tools Menu

menu-tools =
    .label = 工具
    .accesskey = T
menu-tools-downloads =
    .label = 下载
    .accesskey = D
menu-tools-extensions-and-themes =
    .label = 扩展和主题
    .accesskey = E
menu-tools-fxa-sign-in2 =
    .label = 登录
    .accesskey = g
menu-tools-turn-on-sync2 =
    .label = 启用同步…
    .accesskey = n
menu-tools-sync-now =
    .label = 立即同步
    .accesskey = o
menu-tools-fxa-re-auth =
    .label = 重新连接到 { -brand-product-name }…
    .accesskey = R
menu-tools-browser-tools =
    .label = 浏览器工具
    .accesskey = B
menu-tools-task-manager =
    .label = 任务管理器
    .accesskey = M
menu-tools-page-source =
    .label = 页面源代码
    .accesskey = o
menu-tools-page-info =
    .label = 页面信息
    .accesskey = I
menu-settings =
    .label = 设置
    .accesskey =
        { PLATFORM() ->
            [windows] S
           *[other] n
        }
menu-tools-layout-debugger =
    .label = 布局调试器
    .accesskey = L

## Window Menu

menu-window-menu =
    .label = 窗口
menu-window-bring-all-to-front =
    .label = 全部置于顶层

## Help Menu

# NOTE: For Engineers, any additions or changes to Help menu strings should
# also be reflected in the related strings in appmenu.ftl. Those strings, by
# convention, will have the same ID as these, but prefixed with "app".
# Example: appmenu-get-help
#
# These strings are duplicated to allow for different casing depending on
# where the strings appear.

menu-help =
    .label = 帮助
    .accesskey = H
menu-get-help =
    .label = 获取帮助
    .accesskey = H
menu-help-more-troubleshooting-info =
    .label = 更多故障排除信息
    .accesskey = T
menu-help-share-ideas =
    .label = 分享想法和反馈…
    .accesskey = S
menu-help-enter-troubleshoot-mode2 =
    .label = 故障排除模式…
    .accesskey = M
menu-help-exit-troubleshoot-mode =
    .label = 关闭故障排除模式
    .accesskey = M
menu-help-switch-device =
    .label = 切换到新设备
    .accesskey = N
# Label of the Help menu item. Either this or
# menu-help-notdeceptive is shown.
menu-help-report-deceptive-site =
.label = 报告欺骗性网站…
    .accesskey = D
menu-help-not-deceptive =
    .label = 此网站并非欺骗性网站…
    .accesskey = D
menu-report-broken-site =
  .label = 报告损坏的网站