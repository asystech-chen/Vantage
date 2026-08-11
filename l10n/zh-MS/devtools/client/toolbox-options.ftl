# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### Localization for Developer Tools options

## Default Developer Tools section

# The heading
options-select-default-tools-label = 默认开发者工具

# The label for the explanation of the * marker on a tool which is currently not supported
# for the target of the toolbox.
options-tool-not-supported-label = * 当前工具箱目标不支持

# The label for the heading of group of checkboxes corresponding to the developer tools
# added by add-ons. This heading is hidden when there is no developer tool installed by add-ons.
options-select-additional-tools-label = 由附加组件安装的开发者工具

# The label for the heading of group of checkboxes corresponding to the default developer
# tool buttons.
options-select-enabled-toolbox-buttons-label = 可用的工具箱按钮

# The label for the heading of the radiobox corresponding to the theme
options-select-dev-tools-theme-label = 主题

## Inspector section

# The heading
options-context-inspector = 检查器

# The label for the checkbox option to show user agent styles
options-show-user-agent-styles-label = 显示浏览器样式
options-show-user-agent-styles-tooltip =
    .title = 启用此选项将显示由浏览器加载的默认样式。

# The label for the checkbox option to show all anonymous content
options-show-user-agent-shadow-dom-label = 显示浏览器 Shadow DOM
options-show-user-agent-shadow-dom-tooltip =
    .title = 启用此选项将显示由浏览器处理的 Shadow DOM 元素。

# The label for the checkbox option to enable collapse attributes
options-collapse-attrs-label = 截断 DOM 属性
options-collapse-attrs-tooltip =
    .title = 在检查器中截断长属性

# The label for the checkbox option to enable the display of comments in the Inspector
options-show-comments-label = 显示注释
options-show-comments-tooltip =
    .title = 在检查器中显示注释节点

# The label for the checkbox option to enable the "drag to update" feature
options-inspector-draggable-properties-label = 单击并拖动以编辑尺寸值
options-inspector-draggable-properties-tooltip =
    .title = 在检查器规则视图中单击并拖动以编辑尺寸值。

# The label for the checkbox option to enable simplified highlighting on page elements
# within the inspector for users who enabled prefers-reduced-motion = reduce
options-inspector-simplified-highlighters-label = 在 prefers-reduced-motion 下使用更简化的高亮器
options-inspector-simplified-highlighters-tooltip =
    .title = 当启用 prefers-reduced-motion 时，启用简化的高亮器。在高亮元素周围绘制线条而非填充矩形，以避免闪烁效果。

# The label for the checkbox option to make the Enter key move the focus to the next input
# when editing a property name or value in the Inspector rules view
options-inspector-rules-focus-next-on-enter-label = 按 <kbd>Enter</kbd> 键时将焦点移至下一个输入
options-inspector-rules-focus-next-on-enter-tooltip =
    .title = 启用后，在编辑选择器、属性名或属性值时按 Enter 键将把焦点移至下一个输入。

## "Default Color Unit" options for the Inspector

options-default-color-unit-label = 默认颜色单位
options-default-color-unit-authored = 按源文件编写
options-default-color-unit-hex = 十六进制
options-default-color-unit-hsl = HSL(A)
options-default-color-unit-rgb = RGB(A)
options-default-color-unit-hwb = HWB
options-default-color-unit-name = 颜色名称

## Web Console section

# The heading
options-webconsole-label = Web 控制台

# The label for the checkbox that toggle whether the Split console is enabled
options-webconsole-split-console-label = 启用拆分控制台
options-webconsole-split-console-tooltip =
    .title = 按 Escape 键打开拆分控制台

## Style Editor section

# The heading
options-styleeditor-label = 样式编辑器

# The label for the checkbox that toggles autocompletion of css in the Style Editor
options-stylesheet-autocompletion-label = 自动完成 CSS
options-stylesheet-autocompletion-tooltip =
    .title = 在样式编辑器中输入时自动完成 CSS 属性、值和选择器

## Screenshot section

# The heading
options-screenshot-label = 截图行为

# Label for the checkbox that toggles screenshot to clipboard feature
options-screenshot-clipboard-only-label = 仅截图到剪贴板
options-screenshot-clipboard-tooltip2 =
    .title = 将截图直接保存到剪贴板

# Label for the checkbox that toggles the camera shutter audio for screenshot tool
options-screenshot-audio-label = 播放相机快门声音
options-screenshot-audio-tooltip =
    .title = 截图时启用相机快门声音

## Editor section

# The heading
options-sourceeditor-label = 编辑器偏好设置

options-sourceeditor-detectindentation-tooltip =
    .title = 根据源代码内容猜测缩进
options-sourceeditor-detectindentation-label = 侦测缩进
options-sourceeditor-autoclosebrackets-tooltip =
    .title = 自动插入闭合括号
options-sourceeditor-autoclosebrackets-label = 自动闭合括号
options-sourceeditor-expandtab-tooltip =
    .title = 使用空格代替制表符字符
options-sourceeditor-expandtab-label = 使用空格进行缩进
options-sourceeditor-tabsize-label = 制表符大小
options-sourceeditor-keybinding-label = 键位绑定
options-sourceeditor-keybinding-default-label = 默认

## Local Mode section

# The heading
options-local-mode-label = 本地模式

options-local-mode-only-work-locally = 本地模式仅在本地工作，在调试远程上下文时将被禁用

options-local-mode-behavior = 本地模式允许您通过 https URL 加载本地文件，不依赖任何外部依赖项。此类 URL 只能从已打开 DevTools 的标签页中加载。

options-local-mode-domain-label = 自定义域：

options-local-mode-origin-input =
    .placeholder = 本地映射的来源

# Errors shown when the origin input has an error
options-local-mode-origin-conflict = 此来源与另一个现有映射发生冲突
options-local-mode-origin-invalid = 此来源无效

options-local-mode-folder-label = 本地文件夹：

options-local-mode-choose-folder = 浏览…
    .title = 请选择一个本地文件夹以提供此映射

# Dialog's title when picking a folder for a mapping
# Variables:
#   $url (String): The url for the mapping being configured
options-local-mode-choose-folder-picker-title = 请为以下映射选择本地模式文件夹：{ $url }

# Error shown when the folder is invalid
# (can easily be triggered when using about:config and changing underlying mappings prefs)
options-local-mode-folder-invalid = 此文件夹不存在，或无效。

options-local-mode-toggle =
    .title = 切换此本地映射

options-local-mode-toggle-enable = 启用
options-local-mode-toggle-disable = 禁用

options-local-mode-navigate-to =
    .title = 导航到此映射 URL

# Dialog message prompted when clicking on the Delete button
# Variables:
#   $mappingOrigin (String): The origin for the mapping
options-local-mode-confirm-deletion = 您是否想要移除“{ $mappingOrigin }”映射？

options-local-mode-new-mapping = 添加新的本地映射

## Advanced section

# The heading (this item is also used in perftools.ftl)
options-context-advanced-settings = 高级设置

# The label for the checkbox that toggles the HTTP cache on or off
options-disable-http-cache-label = 禁用 HTTP 缓存（当工具箱处于打开状态时）
options-disable-http-cache-tooltip =
    .title = 启用此选项将禁用所有已打开工具箱的标签页的 HTTP 缓存。Service Workers 不受此选项影响。

# The label for checkbox that toggles JavaScript on or off
options-disable-javascript-label-2 = 禁用 JavaScript
options-disable-javascript-tooltip =
    .title = 启用此选项将禁用当前标签页的 JavaScript。如果标签页或工具箱被关闭，则此设置将被遗忘。

# The label for checkbox that toggles chrome debugging, i.e. the devtools.chrome.enabled preference
options-enable-chrome-label = 启用浏览器 chrome 和附加组件调试工具箱
options-enable-chrome-tooltip =
    .title = 启用此选项将允许您在浏览器上下文中使用各种开发者工具（通过“工具”>“Web 开发者”>“浏览器工具箱”），并从附加组件管理器中调试附加组件

# The label for checkbox that toggles remote debugging, i.e. the devtools.debugger.remote-enabled preference
options-enable-remote-label = 启用远程调试
options-enable-remote-tooltip2 =
    .title = 启用此选项将允许从远程调试此浏览器实例

# The label for checkbox that enables F12 as a shortcut to open DevTools
options-enable-f12-label = 使用 F12 键打开或关闭 DevTools
options-enable-f12-tooltip =
    .title = 启用此选项将绑定 F12 键以打开或关闭 DevTools 工具箱

# The label for checkbox that toggles custom formatters for objects
options-enable-custom-formatters-label = 启用自定义格式化程序
options-enable-custom-formatters-tooltip =
    .title = 启用此选项将允许站点为 DOM 对象定义自定义格式化程序

# The label for checkbox that toggles the service workers testing over HTTP on or off.
options-enable-service-workers-http-label = 通过 HTTP 启用 Service Workers（当工具箱处于打开状态时）
options-enable-service-workers-http-tooltip =
    .title = 启用此选项将为所有已打开工具箱的标签页通过 HTTP 启用 Service Workers。

# The label for the checkbox that toggles source maps in all tools.
options-source-maps-label = 启用 Source Maps
options-source-maps-tooltip =
    .title = 如果启用此选项，来源将在各工具中被映射。

# The message shown for settings that trigger page reload and will only apply to the current session
# This appears underneath the applicable options (e.g. options-disable-javascript-label-2).
options-context-triggers-page-refresh-temporary = （仅适用于当前会话，将重新加载页面）

# The message shown for settings that trigger page reload
# This appears underneath the applicable options (e.g. options-show-user-agent-shadow-dom-label).
options-context-triggers-page-refresh-persists = （将重新加载页面）

# This is used to add a * marker to the label for the Options Panel tool checkbox for the
# tool which is not supported for the current toolbox target.
# Variables:
#   $toolLabel (String): The name of the tool not being supported
options-tool-not-supported-marker = { $toolLabel } *

# Used as a label for auto theme
options-auto-theme-label = 自动
# This is the text that appears in the settings panel for panel that will be removed in future releases.
# This entire text is treated as a link to an MDN page.
options-deprecation-notice = 已弃用。了解更多…