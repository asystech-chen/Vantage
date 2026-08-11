# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These messages are used in the DevTools toolbox.

## These labels are shown in the "..." menu in the toolbox, and represent different
## commands such as the docking of DevTools, toggling features, and viewing some
## external links. Some of the commands have the keyboard shortcut shown next to
## the label.

toolbox-meatball-menu-dock-bottom-label = 停靠至底部
toolbox-meatball-menu-dock-left-label = 停靠至左侧
toolbox-meatball-menu-dock-right-label = 停靠至右侧
toolbox-meatball-menu-dock-separate-window-label = 分离窗口

toolbox-meatball-menu-splitconsole-label = 显示拆分控制台
toolbox-meatball-menu-hideconsole-label = 隐藏拆分控制台

toolbox-meatball-menu-settings-label = 设置
toolbox-meatball-menu-documentation-label = 文档…
toolbox-meatball-menu-community-label = 社区…

# This menu item is only available in the browser toolbox. It forces the popups/panels
# to stay visible on blur, which is primarily useful for addon developers and Firefox
# contributors.
toolbox-meatball-menu-noautohide-label = 禁用弹出窗口自动隐藏

toolbox-meatball-menu-pseudo-locale-accented = 启用“重音”区域设置
toolbox-meatball-menu-pseudo-locale-bidi = 启用“双向”区域设置

## These labels are shown in the top-toolbar in the Browser Toolbox and Browser Console

toolbox-mode-browser-toolbox-label = 浏览器工具箱模式
toolbox-mode-browser-console-label = 浏览器控制台模式

toolbox-mode-everything-label = 多进程
toolbox-mode-everything-sub-label = (较慢)
toolbox-mode-everything-container =
  .title = 在所有进程中调试一切

toolbox-mode-parent-process-label = 仅父进程
toolbox-mode-parent-process-sub-label = (快速)
toolbox-mode-parent-process-container =
  .title = 仅关注来自父进程的资源。

toolbox-always-on-top-enabled2 = 禁用始终置顶
  .title = 这将重新启动开发人员工具
toolbox-always-on-top-disabled2 = 启用始终置顶
  .title = 这将重新启动开发人员工具

## These two labels are shown when navigating to a file:// URL while having DevTools opened,
## in order to suggest enabling the Local Mode and load them from https instead.

# Variables:
#   $url (String): The local mode URL
toolbox-local-mode-notice = 此文档也可以从“{ $url }”使用DevTools的“本地模式”加载，您可以在设置面板中启用该模式。

toolbox-local-mode-notice-add-to-settings-button = 添加到设置
toolbox-local-mode-notice-try-it-button = 尝试
toolbox-local-mode-notice-navigate-to-existing-mapping = 导航至现有映射
toolbox-local-mode-notice-always-hide = 不再显示此信息