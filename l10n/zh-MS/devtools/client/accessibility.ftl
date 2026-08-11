# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are used inside the Accessibility panel.

accessibility-learn-more = 了解更多

accessibility-text-label-header = 文本标签和名称

accessibility-keyboard-header = 键盘

## These strings are used in the overlay displayed when running an audit in the accessibility panel

accessibility-progress-initializing = 正在初始化…
  .aria-valuetext = 正在初始化…

# This string is displayed in the audit progress bar in the accessibility panel.
# Variables:
#   $nodeCount (Integer) - The number of nodes for which the audit was run so far.
accessibility-progress-progressbar =
    { $nodeCount ->
        [one] 正在检查 { $nodeCount } 个节点
       *[other] 正在检查 { $nodeCount } 个节点
    }

accessibility-progress-finishing = 正在完成…
  .aria-valuetext = 正在完成…

## Text entries that are used as text alternative for icons that depict accessibility issues.

accessibility-warning =
  .alt = 警告

accessibility-fail =
  .alt = 错误

accessibility-best-practices =
  .alt = 最佳实践

## Text entries for a paragraph used in the accessibility panel sidebar's checks section
## that describe that currently selected accessible object has an accessibility issue
## with its text label or accessible name.

accessibility-text-label-issue-area = 请使用 <code>alt</code> 属性为具有 <span>href</span> 属性的 <div>area</div> 元素添加标签。 <a>了解更多</a>

accessibility-text-label-issue-dialog = 对话框应被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-document-title = 文档必须具备 <code>title</code>。 <a>了解更多</a>

accessibility-text-label-issue-embed = 嵌入内容必须被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-figure = 带有可选标题的图形应被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-fieldset = <code>fieldset</code> 元素必须被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-fieldset-legend2 = 请使用 <code>legend</code> 元素为 <span>fieldset</span> 添加标签。 <a>了解更多</a>

accessibility-text-label-issue-form = 表单元素必须被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-form-visible = 表单元素应具有可见的文本标签。 <a>了解更多</a>

accessibility-text-label-issue-frame = <code>frame</code> 元素必须被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-glyph = 请使用 <code>alt</code> 属性为 <span>mglyph</span> 元素添加标签。 <a>了解更多</a>

accessibility-text-label-issue-heading = 标题必须被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-heading-content = 标题应具有可见的文本内容。 <a>了解更多</a>

accessibility-text-label-issue-iframe = 请使用 <code>title</code> 属性描述 <span>iframe</span> 的内容。 <a>了解更多</a>

accessibility-text-label-issue-image = 包含图像的内容必须被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-interactive = 交互元素必须被添加标签。 <a>了解更多</a>

accessibility-text-label-issue-optgroup-label2 = 请使用 <code>label</code> 属性为 <span>optgroup</span> 添加标签。 <a>了解更多</a>

accessibility-text-label-issue-toolbar = 当存在多个工具栏时，工具栏必须被添加标签。 <a>了解更多</a>

## Text entries for a paragraph used in the accessibility panel sidebar's checks section
## that describe that currently selected accessible object has a keyboard accessibility
## issue.

accessibility-keyboard-issue-semantics = 可聚焦元素应具有交互语义。 <a>了解更多</a>

accessibility-keyboard-issue-tabindex = 请避免使用大于零的 <code>tabindex</code> 属性。 <a>了解更多</a>

accessibility-keyboard-issue-action = 交互元素必须能够使用键盘进行激活。 <a>了解更多</a>

accessibility-keyboard-issue-focusable = 交互元素必须是可聚焦的。 <a>了解更多</a>

accessibility-keyboard-issue-focus-visible = 可聚焦元素可能缺少焦点样式。 <a>了解更多</a>

accessibility-keyboard-issue-mouse-only = 可单击元素必须是可聚焦的，并且应具有交互语义。 <a>了解更多</a>