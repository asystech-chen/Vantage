# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are used inside the about:debugging UI.

# Page Title strings

# Page title (ie tab title) for the Setup page
about-debugging-page-title-setup-page = 调试 - 设置

# Page title (ie tab title) for the Runtime page
# Variables:
#   $selectedRuntimeId - ID of the current runtime, such as "this-firefox", "localhost:6080", etc.
about-debugging-page-title-runtime-page = 调试 - 运行时 / { $selectedRuntimeId }

# Sidebar strings

# Display name of the runtime for the currently running instance of Firefox. Used in the
# Sidebar and in the Setup page.
about-debugging-this-firefox-runtime-name = 此 { -brand-shorter-name }

# Sidebar heading for selecting the currently running instance of Firefox
# .name is processed by fluent-react / SidebarFixedItem
about-debugging-sidebar-this-firefox =
  .name = { about-debugging-this-firefox-runtime-name }

# Sidebar heading for connecting to some remote source
# .name is processed by fluent-react / SidebarFixedItem
about-debugging-sidebar-setup =
  .name = 设置

# Text displayed in the about:debugging sidebar when USB devices discovery is enabled.
about-debugging-sidebar-usb-enabled = USB 已启用

# Text displayed in the about:debugging sidebar when USB devices discovery is disabled
# (for instance because the mandatory ADB extension is not installed).
about-debugging-sidebar-usb-disabled = USB 已禁用

# Connection status (connected) for runtime items in the sidebar
aboutdebugging-sidebar-runtime-connection-status-connected = 已连接
# Connection status (disconnected) for runtime items in the sidebar
aboutdebugging-sidebar-runtime-connection-status-disconnected = 已断开

# Text displayed in the about:debugging sidebar when no device was found.
about-debugging-sidebar-no-devices = 未发现任何设备

# Text displayed in buttons found in sidebar items representing remote runtimes.
# Clicking on the button will attempt to connect to the runtime.
about-debugging-sidebar-item-connect-button = 连接

# Text displayed in buttons found in sidebar items when the runtime is connecting.
about-debugging-sidebar-item-connect-button-connecting = 正在连接…

# Text displayed in buttons found in sidebar items when the connection failed.
about-debugging-sidebar-item-connect-button-connection-failed = 连接失败

# Text displayed in connection warning on sidebar item of the runtime when connecting to
# the runtime is taking too much time.
about-debugging-sidebar-item-connect-button-connection-not-responding = 连接仍在等待中，请检查目标浏览器上的消息

# Text displayed as connection error in sidebar item when the connection has timed out.
about-debugging-sidebar-item-connect-button-connection-timeout = 连接已超时

# Text displayed in sidebar items for remote devices where a compatible browser (eg
# Firefox) has not been detected yet. Typically, Android phones connected via USB with
# USB debugging enabled, but where Firefox is not started.
about-debugging-sidebar-runtime-item-waiting-for-browser = 正在等待浏览器…

# Text displayed in sidebar items for remote devices that have been disconnected from the
# computer.
about-debugging-sidebar-runtime-item-unplugged = 已拔出

# Title for runtime sidebar items that are related to a specific device (USB, WiFi).
# Variables:
#   $displayName (string) - Displayed name
#   $deviceName (string) - Name of the device
about-debugging-sidebar-runtime-item-name =
  .title = { $displayName } ({ $deviceName })
# Title for runtime sidebar items where we cannot get device information (network
# locations).
# Variables:
#   $displayName (string) - Displayed name
about-debugging-sidebar-runtime-item-name-no-device =
  .title = { $displayName }

# Text to show in the footer of the sidebar that links to a help page
# (currently: https://firefox-source-docs.mozilla.org/devtools-user/about_colon_debugging/)
about-debugging-sidebar-support = 调试支持

# Text to show as the ALT attribute of a help icon that accompanies the help about
# debugging link in the footer of the sidebar
about-debugging-sidebar-support-icon =
  .alt = 帮助图标

# Text displayed in a sidebar button to refresh the list of USB devices. Clicking on it
# will attempt to update the list of devices displayed in the sidebar.
about-debugging-refresh-usb-devices-button = 刷新设备

# Setup Page strings

# Title of the Setup page.
about-debugging-setup-title = 设置

# Introduction text in the Setup page to explain how to configure remote debugging.
about-debugging-setup-intro = 请配置您希望用于远程调试设备所需的连接方式。

# Explanatory text in the Setup page about what the 'This Firefox' page is for
about-debugging-setup-this-firefox2 = 请使用<a>{ about-debugging-this-firefox-runtime-name }</a>来调试此版本{ -brand-shorter-name }上的扩展和服务工作者。

# Title of the heading Connect section of the Setup page.
about-debugging-setup-connect-heading = 连接设备

# USB section of the Setup page
about-debugging-setup-usb-title = USB

# Explanatory text displayed in the Setup page when USB debugging is disabled
about-debugging-setup-usb-disabled = 启用此功能将下载并添加所需的 Android USB 调试组件至 { -brand-shorter-name }。

# Text of the button displayed in the USB section of the setup page when USB debugging is disabled.
# Clicking on it will download components needed to debug USB Devices remotely.
about-debugging-setup-usb-enable-button = 启用USB设备

# Text of the button displayed in the USB section of the setup page when USB debugging is enabled.
about-debugging-setup-usb-disable-button = 禁用USB设备

# Text of the button displayed in the USB section of the setup page while USB debugging
about-debugging-setup-usb-updating-button = 正在更新…

# components are downloaded and installed.
about-debugging-setup-usb-status-enabled = 已启用
about-debugging-setup-usb-status-disabled = 已禁用
about-debugging-setup-usb-status-updating = 正在更新…

# USB section of the Setup page (USB status)
about-debugging-setup-usb-step-enable-dev-menu2 = 请在您的Android设备上启用开发者菜单。

# USB section step by step guide
about-debugging-setup-usb-step-enable-debug2 = 请在Android开发者菜单中启用USB调试。

# USB section step by step guide
about-debugging-setup-usb-step-enable-file-transfer = 请启用文件传输，并确保您的设备不处于仅充电模式。

# USB section step by step guide
about-debugging-setup-usb-step-enable-debug-firefox2 = 请在Android设备上的Firefox中启用USB调试。

# USB section step by step guide
about-debugging-setup-usb-step-plug-device = 请将Android设备连接到您的计算机。

# USB section step by step guide
# Text shown in the USB section of the setup page with a link to troubleshoot connection errors.
about-debugging-setup-usb-troubleshoot = 连接USB设备时遇到问题？<a>进行疑难解答</a>

# The link goes to https://firefox-source-docs.mozilla.org/devtools-user/about_colon_debugging/index.html#connecting-to-a-remote-device
about-debugging-setup-network =
  .title = 网络位置

# Network section of the Setup page
# Text shown in the Network section of the setup page with a link to troubleshoot connection errors.
about-debugging-setup-network-troubleshoot = 通过网络位置连接时遇到问题？<a>进行疑难解答</a>

# The link goes to https://firefox-source-docs.mozilla.org/devtools-user/about_colon_debugging/index.html#connecting-over-the-network
# Text of a button displayed after the network locations "Host" input.
about-debugging-network-locations-add-button = 添加

# Clicking on it will add the new network location to the list.
# Text of the label for the text input that allows users to add new network locations in
about-debugging-network-locations-host-input-label = 主机

# the Connect page. A host is a hostname and a port separated by a colon, as suggested by
# the input's placeholder "localhost:6080".
about-debugging-network-locations-remove-button = 移除

# Text of a button displayed next to existing network locations in the Connect page.
# Clicking on it removes the network location from the list.
# Text used as error message if the format of the input value was invalid in the network locations form of the Setup page.
about-debugging-network-location-form-invalid = 主机“{ $host-value }”无效。预期格式为“主机名:端口号”。

# Variables:
#   $host-value (string) - The input value submitted by the user in the network locations form
# Text used as error message if the input value was already registered in the network locations form of the Setup page.
about-debugging-network-location-form-duplicate = 主机“{ $host-value }”已被注册

# Variables:

#   $host-value (string) - The input value submitted by the user in the network locations form
# Runtime Page strings
# Below are the titles for the various categories of debug targets that can be found
about-debugging-runtime-temporary-extensions =
  .name = 临时扩展
# on "runtime" pages of about:debugging.
# Title of the temporary extensions category (only available for "This Firefox" runtime).
about-debugging-runtime-extensions =
  .name = 扩展
# .name is processed by fluent-react / DebugTargetPane
# Title of the extensions category.
about-debugging-runtime-tabs =
  .name = 标签页
# .name is processed by fluent-react / DebugTargetPane
# Title of the tabs category.
about-debugging-runtime-service-workers =
  .name = 服务工作者
# .name is processed by fluent-react / DebugTargetPane
# Title of the service workers category.
about-debugging-runtime-shared-workers =
  .name = 共享工作者
# .name is processed by fluent-react / DebugTargetPane
# Title of the shared workers category.
about-debugging-runtime-other-workers =
  .name = 其他工作者
# .name is processed by fluent-react / DebugTargetPane
# Title of the other workers category.
about-debugging-runtime-processes =
  .name = 进程

# .name is processed by fluent-react / DebugTargetPane
about-debugging-runtime-profile-button2 = 分析性能

# Title of the processes category.
# .name is processed by fluent-react / DebugTargetPane
about-debugging-runtime-service-workers-not-compatible = 您的浏览器配置与服务工作者不兼容。<a>了解更多</a>

# Label of the button opening the performance profiler panel in runtime pages for remote
# runtimes.
# This string is displayed in the runtime page if the current configuration of the
# target runtime is incompatible with service workers. "Learn more" points to:
about-debugging-browser-version-too-old = 所连接的浏览器版本过旧（{ $runtimeVersion }）。最低支持版本为（{ $minVersion }）。此设置不受支持，可能导致DevTools失败。请更新所连接的浏览器。<a>进行疑难解答</a>

# https://firefox-source-docs.mozilla.org/devtools-user/about_colon_debugging/index.html#service-workers-not-compatible
# This string is displayed in the runtime page if the remote browser version is too old.
about-debugging-browser-version-too-old-fennec = 此版本的Firefox无法调试Android版Firefox（68）。建议您在手机上安装Firefox for Android Nightly 以进行测试。<a>更多详情</a>

# "Troubleshooting" link points to https://firefox-source-docs.mozilla.org/devtools-user/about_colon_debugging/
# { $runtimeVersion } is the version of the remote browser (for instance "67.0a1")
# { $minVersion } is the minimum version that is compatible with the current Firefox instance (same format)
# { $localID } is the build ID of the current Firefox instance (same format)
# { $runtimeVersion } is the version of the remote browser (for instance "67.0a1")
# { $localVersion } is the version of your current browser (same format)
about-debugging-browser-version-too-recent = 已连接的浏览器版本（{ $runtimeVersion }，构建 ID { $runtimeID }）比您的 { -brand-shorter-name }（{ $localVersion }，构建 ID { $localID }）更新。此配置不受支持，可能导致开发者工具无法正常工作。建议您更新 Firefox。<a>疑难解答</a>

# Displayed for runtime info in runtime pages.
# { $name } is brand name such as "Firefox Nightly"
# { $version } is version such as "64.0a1"
about-debugging-runtime-name = { $name }（{ $version }）

# Text of a button displayed in Runtime pages for remote runtimes.
# Clicking on the button will close the connection to the runtime.
about-debugging-runtime-disconnect-button = 断开连接

# Text of the connection prompt button displayed in Runtime pages, when the preference
# "devtools.debugger.prompt-connection" is false on the target runtime.
about-debugging-connection-prompt-enable-button = 启用连接提示

# Text of the connection prompt button displayed in Runtime pages, when the preference
# "devtools.debugger.prompt-connection" is true on the target runtime.
about-debugging-connection-prompt-disable-button = 禁用连接提示

# Title of a modal dialog displayed on remote runtime pages after clicking on the Profile Runtime button.
about-debugging-profiler-dialog-title2 = 分析器

# Clicking on the header of a debug target category will expand or collapse the debug
# target items in the category. This text is used as ’title’ attribute of the header,
# to describe this feature.
about-debugging-collapse-expand-debug-targets = 折叠 / 展开

# Debug Targets strings

# Displayed in the categories of "runtime" pages that don't have any debug target to
# show. Debug targets depend on the category (extensions, tabs, workers...).
about-debugging-debug-target-list-empty = 暂无内容。

# Text of a button displayed next to debug targets of "runtime" pages. Clicking on this
# button will open a DevTools toolbox that will allow inspecting the target.
# A target can be an addon, a tab, a worker...
about-debugging-debug-target-inspect-button = 检查

# Text of a button displayed in the "This Firefox" page, in the Temporary Extension
# section. Clicking on the button will open a file picker to load a temporary extension
about-debugging-tmp-extension-install-button = 加载临时附加组件...

# Text displayed when trying to install a temporary extension in the "This Firefox" page.
about-debugging-tmp-extension-install-error = 临时附加组件的安装过程中发生了错误。

# Text of a button displayed for a temporary extension loaded in the "This Firefox" page.
# Clicking on the button will reload the extension.
about-debugging-tmp-extension-reload-button = 重新加载

# Text of a button displayed for a temporary extension loaded in the "This Firefox" page.
# Clicking on the button will uninstall the extension and remove it from the page.
about-debugging-tmp-extension-remove-button = 移除

# Text of a button displayed for a temporary extension loaded in the "This Firefox" page.
# Clicking on the button will forcefully terminate the extension background script (button
# only visible in extensions that includes a non-persistent background script, either an
# event page or a background service worker).
about-debugging-tmp-extension-terminate-bgscript-button = 终止后台脚本

# Message displayed in the file picker that opens to select a temporary extension to load
# (triggered by the button using "about-debugging-tmp-extension-install-button")
# manifest.json .xpi and .zip should not be localized.
# Note: this message is only displayed in Windows and Linux platforms.
about-debugging-tmp-extension-install-message = 请选择 manifest.json 文件或 .xpi/.zip 存档

# This string is displayed as a message about the add-on having a temporaryID.
about-debugging-tmp-extension-temporary-id = 此 WebExtension 具有临时 ID。<a>了解更多</a>

# Text displayed for extensions in "runtime" pages, before displaying a link the extension's
# manifest URL.
about-debugging-extension-manifest-url =
  .label = Manifest URL

# Text displayed for extensions in "runtime" pages, before displaying the extension's uuid.
# UUIDs look like b293e463-481e-5148-a487-5aaf7a130429
about-debugging-extension-uuid =
  .label = 内部 UUID

# Text displayed for extensions (temporary extensions only) in "runtime" pages, before
# displaying the location of the temporary extension.
about-debugging-extension-location =
  .label = 位置

# Text displayed for extensions in "runtime" pages, before displaying the extension's ID.
# For instance "geckoprofiler@mozilla.com" or "{ed26ddcb-5611-4512-a89a-51b8db81cfb2}".
about-debugging-extension-id =
  .label = 扩展 ID

# Text displayed for extensions in "runtime" pages, before displaying the status of the
# extension background script.
about-debugging-extension-backgroundscript =
  .label = 后台脚本

# Displayed for extension using a non-persistent background page (either an event page or
# background service worker) when the background script is currently running.
about-debugging-extension-backgroundscript-status-running = 正在运行

# Displayed for extension using a non-persistent background page when is currently stopped.
about-debugging-extension-backgroundscript-status-stopped = 已停止

# This string is displayed as a label of the button that pushes a test payload
# to a service worker.
# Note this relates to the "Push" API, which is normally not localized so it is
# probably better to not localize it.
# .disabledTitle is processed by the fluent-react / ActionButton code.
about-debugging-worker-action-push2 = 推送
  .disabledTitle = 服务工作者推送当前已为多进程 { -brand-shorter-name } 禁用

# This string is displayed as a label of the button that starts a service worker.
# .disabledTitle is processed by the fluent-react / ActionButton code.
about-debugging-worker-action-start2 = 启动
  .disabledTitle = 服务工作者启动当前已为多进程 { -brand-shorter-name } 禁用

# This string is displayed as a label of the button that unregisters a service worker.
about-debugging-worker-action-unregister = 注销

# Displayed for service workers in runtime pages that listen to Fetch events.
about-debugging-worker-fetch-listening =
  .label = Fetch
  .value = 正在侦听获取事件...

# Displayed for service workers in runtime pages that do not listen to Fetch events.
about-debugging-worker-fetch-not-listening =
  .label = Fetch
  .value = 未在侦听获取事件

# Displayed for service workers in runtime pages that are currently running (service
# worker instance is active).
about-debugging-worker-status-running = 正在运行

# Displayed for service workers in runtime pages that are registered but stopped.
about-debugging-worker-status-stopped = 已停止

# Displayed for service workers in runtime pages that are registering.
about-debugging-worker-status-registering = 正在注册

# Displayed for service workers in runtime pages, to label the scope of a worker
about-debugging-worker-scope =
  .label = 作用域

# Displayed for service workers in runtime pages, to label the push service endpoint (url)
# of a worker
about-debugging-worker-push-service =
  .label = 推送服务

# Displayed for service workers in runtime pages, to label the origin of a worker.
about-debugging-worker-origin =
  .label = 来源

# Displayed as title of the inspect button when service worker debugging is disabled.
about-debugging-worker-inspect-action-disabled =
  .title = 对于多进程 { -brand-shorter-name }，Service Worker 检查功能目前处于禁用状态

# Displayed as title of the inspect button for zombie tabs (e.g. tabs loaded via a session restore).
about-debugging-zombie-tab-inspect-action-disabled =
  .title = 标签页尚未完全加载，因此无法对其进行检查

# Displayed as name for the Main Process debug target in the Processes category. Only for
# remote runtimes, if `devtools.aboutdebugging.process-debugging` is true.
about-debugging-multiprocess-toolbox-name = 多进程工具箱

# Displayed as description for the Main Process debug target in the Processes category.
# Only for remote browsers, if `devtools.aboutdebugging.process-debugging` is true.
about-debugging-multiprocess-toolbox-description = 目标浏览器的主进程和内容进程

# Alt text used for the close icon of message component (warnings, errors and notifications).
about-debugging-message-close-icon =
  .alt = 关闭消息

# Label text used for the error details of message component.
about-debugging-message-details-label-error = 错误详细信息

# Label text used for the warning details of message component.
about-debugging-message-details-label-warning = 警告详细信息

# Label text used for default state of details of message component.
about-debugging-message-details-label = 详细信息
