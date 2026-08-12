# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are used inside the Accessibility panel.

accessibility-learn-more = 学习更多

accessibility-text-label-header = 电文标签和全国制造商协会(美国)

accessibility-keyboard-header = 键盘

## These strings are used in the overlay displayed when running an audit in the accessibility panel

accessibility-progress-initializing = 初始的…
  .aria-valuetext = 初始的…

# This string is displayed in the audit progress bar in the accessibility panel.
# Variables:
#   $nodeCount (Integer) - The number of nodes for which the audit was run so far.
accessibility-progress-progressbar =
    { $nodeCount ->
        [one] 检查的 { $nodeCount } 节点
       *[other] 检查的 { $nodeCount } 点头
    }

accessibility-progress-finishing = 最后的向上的…
  .aria-valuetext = 最后的向上的…

## Text entries that are used as text alternative for icons that depict accessibility issues.

accessibility-warning =
  .alt = 警告

accessibility-fail =
  .alt = 错误

accessibility-best-practices =
  .alt = 最好的实践的

## Text entries for a paragraph used in the accessibility panel sidebar's checks section
## that describe that currently selected accessible object has an accessibility issue
## with its text label or accessible name.

accessibility-text-label-issue-area = 使用 <code>更换</code> 属性到贴标签于 <div>区域</div> 部分那有那 <span>超文本引用（hypertext reference）</span> 属性. <a>学习更多</a>

accessibility-text-label-issue-dialog = 对话应该是有标签的. <a>学习更多</a>

accessibility-text-label-issue-document-title = 文档必须有一个 <code>标题</code>. <a>学习更多</a>

accessibility-text-label-issue-embed = 植入的内容必须是有标签的. <a>学习更多</a>

accessibility-text-label-issue-figure = 图形与可选择的标题应该是有标签的. <a>学习更多</a>

accessibility-text-label-issue-fieldset = <code>fieldset</code> 部分必须是有标签的. <a>学习更多</a>

accessibility-text-label-issue-fieldset-legend2 = 使用一个 <code>图例</code> 部分到贴标签于一个 <span>fieldset</span>. <a>学习更多</a>

accessibility-text-label-issue-form = 表单部分必须是有标签的. <a>学习更多</a>

accessibility-text-label-issue-form-visible = 表单部分应该有一个可见物电文标签. <a>学习更多</a>

accessibility-text-label-issue-frame = <code>框架</code> 部分必须是有标签的. <a>学习更多</a>

accessibility-text-label-issue-glyph = 使用 <code>更换</code> 属性到贴标签于 <span>mglyph</span> 部分. <a>学习更多</a>

accessibility-text-label-issue-heading = 上标题必须是有标签的. <a>学习更多</a>

accessibility-text-label-issue-heading-content = 上标题应该有看得见的电文内容. <a>学习更多</a>

accessibility-text-label-issue-iframe = 使用 <code>标题</code> 属性到描述 <span>内嵌框架</span> 内容. <a>学习更多</a>

accessibility-text-label-issue-image = 内容与复数虚部必须是有标签的. <a>学习更多</a>

accessibility-text-label-issue-interactive = 交互部分必须是有标签的. <a>学习更多</a>

accessibility-text-label-issue-optgroup-label2 = 使用一个 <code>标签</code> 属性到贴标签于一个 <span>optgroup</span>. <a>学习更多</a>

accessibility-text-label-issue-toolbar = 工具栏必须是有标签的何时那里是更多比一(个) 工具栏. <a>学习更多</a>

## Text entries for a paragraph used in the accessibility panel sidebar's checks section
## that describe that currently selected accessible object has a keyboard accessibility
## issue.

accessibility-keyboard-issue-semantics = 可聚焦的部分应该有交互语义. <a>学习更多</a>

accessibility-keyboard-issue-tabindex = 避免使用 <code>tabindex</code> 属性大的比零. <a>学习更多</a>

accessibility-keyboard-issue-action = 交互部分必须是能干的到是活性化的使用一个键盘. <a>学习更多</a>

accessibility-keyboard-issue-focusable = 交互部分必须是可聚焦的. <a>学习更多</a>

accessibility-keyboard-issue-focus-visible = 可聚焦的部分可以是不见的焦点款式. <a>学习更多</a>

accessibility-keyboard-issue-mouse-only = 可以点击的部分必须是可聚焦的和应该有交互语义. <a>学习更多</a>
