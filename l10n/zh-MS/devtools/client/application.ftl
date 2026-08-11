# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are used inside the Application panel which is available
### by setting the preference `devtools-application-enabled` to true.

### The correct localization of this file might be to keep it in English, or another
### language commonly spoken among web developers. You want to make that choice consistent
### across the developer tools. A good criteria is the language in which you'd find the
### best documentation on web development on the web.

# Header for the list of Service Workers displayed in the application panel for the current page.
serviceworker-list-header = 服务工作者

# Text displayed next to the list of Service Workers to encourage users to check out
# about:debugging to see all registered Service Workers.
serviceworker-list-aboutdebugging = 单击<a>about:debugging</a>以查看其他域名的服务工作者

# Text for the button to unregister a Service Worker. Displayed for active Service Workers.
serviceworker-worker-unregister = 取消注册

# Alt text for the image icon displayed inside a debug link for a service worker.
serviceworker-worker-inspect-icon =
  .alt = 检查

# Text for the start link displayed for a registered but not running Service Worker.
# Clicking on the link will attempt to start the service worker.
serviceworker-worker-start3 = 启动

# Text displayed for the updated time of the service worker. The <time> element will
# display the last update time of the service worker script.
# Variables:
#   $date (date) - Update date
serviceworker-worker-updated = 更新于<time>{ DATETIME($date, month: "long", year: "numeric", day: "numeric", hour: "numeric", minute: "numeric", second: "numeric") }</time>

## Service Worker status strings: all serviceworker-worker-status-* strings are also
## defined in aboutdebugging.properties and should be synchronized with them.

# Service Worker status. A running service worker is registered, currently executed, can
# be debugged and stopped.
serviceworker-worker-status-running = 正在运行...

# Service Worker status. A stopped service worker is registered but not currently active.
serviceworker-worker-status-stopped = 已停止

# Text displayed when no service workers are visible for the current page.
serviceworker-empty-intro2 = 未找到任何服务工作者

# Link will open https://developer.mozilla.org/docs/Web/API/Service_Worker_API/Using_Service_Workers
serviceworker-empty-intro-link = 了解更多信息

# Text displayed when there are no Service Workers to display for the current page,
# introducing hints to debug Service Worker issues.
# <a> and <span> are links that will open the webconsole and the debugger, respectively.
serviceworker-empty-suggestions2 = 如果当前页面应具有服务工作者，您可以在<a>控制台</a>中查找错误，或在<span>调试器</span>中逐步执行您的服务工作者注册过程。

# Suggestion to go to about:debugging in order to see Service Workers for all domains.
# Link will open about:debugging in a new tab.
serviceworker-empty-suggestions-aboutdebugging2 = 查看其他域名的服务工作者

# Header for the Manifest page when we have an actual manifest
manifest-view-header = 应用清单

# Header for the Manifest page when there's no manifest to inspect
manifest-empty-intro2 = 未检测到 Web 应用清单

# The link will open https://developer.mozilla.org/en-US/docs/Web/Manifest
manifest-empty-intro-link = 了解如何添加清单

# Header for the Errors and Warnings section of Manifest inspection displayed in the application panel.
manifest-item-warnings = 错误和警告

# Header for the Identity section of Manifest inspection displayed in the application panel.
manifest-item-identity = 身份

# Header for the Presentation section of Manifest inspection displayed in the application panel.
manifest-item-presentation = 呈现

# Header for the Icon section of Manifest inspection displayed in the application panel.
manifest-item-icons = 图标

# Text displayed while we are loading the manifest file
manifest-loading = 正在加载清单...

# Text displayed when the manifest has been successfully loaded
manifest-loaded-ok = 清单已成功加载。

# Text displayed as a caption when there has been an error while trying to
# load the manifest
manifest-loaded-error = 加载清单时发生了错误：

# Text displayed as an error when there has been a Firefox DevTools error while
# trying to load the manifest
manifest-loaded-devtools-error = Firefox 开发工具错误

# Text displayed when the page has no manifest available
manifest-non-existing = 未找到可检查的清单。

# Text displayed when the page has a manifest embedded in a Data URL and
# thus we cannot link to it.
manifest-json-link-data-url = 清单已嵌入在数据 URL 中。

# Text displayed at manifest icons to label their purpose, as declared
# in the manifest.
# Variables:
#   $purpose (string) - Manifest purpose
manifest-icon-purpose = 用途：<code>{ $purpose }</code>

# Text displayed as the alt attribute for <img> tags showing the icons in the
# manifest.
manifest-icon-img =
  .alt = 图标

# Text displayed as the title attribute for <img> tags showing the icons in the
# manifest.
# Variables:
#   $sizes (string) - User-dependent string that has been parsed as a
#                     space-separated list of `<width>x<height>` sizes or
#                     the keyword `any`.
manifest-icon-img-title = 图标尺寸：{ $sizes }
manifest-icon-img-title = 具有尺寸 { $sizes } 的图标

# Text displayed as the title attribute for <img> tags showing the icons in the
# manifest, in case there's no icon size specified by the user
manifest-icon-img-title-no-sizes = 未指定尺寸的图标

# Sidebar navigation item for Manifest sidebar item section
sidebar-item-manifest = 清单
  .alt = 清单图标
  .title = 清单

# Sidebar navigation item for Service Workers sidebar item section
sidebar-item-service-workers = Service Workers
  .alt = Service Workers 图标
  .title = Service Workers

# Sidebar navigation item for Session History sidebar item section
sidebar-item-session-history = 会话历史
  .alt = 会话历史图标
  .title = 会话历史

# Entry in the Session History diagram
session-history-entry-info-button-title =
  .title = 显示会话历史数据

# Header for the Session History page when session history diagrams are unavailable
session-history-unavailable = 会话历史图表不可用

# Text displayed for when the target does not support showing session history diagrams
session-history-target-unsupported = 目标不支持显示会话历史图表

# Text for the ALT and TITLE attributes of the warning icon
icon-warning =
  .alt = 警告图标
  .title = 警告

# Text for the ALT and TITLE attributes of the error icon
icon-error =
  .alt = 错误图标
  .title = 错误