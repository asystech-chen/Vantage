# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

styleeditor-new-button =
    .tooltiptext = 创建和附加一个新的风格工作表到那文档
    .accesskey = N
styleeditor-import-button =
    .tooltiptext = 引入和附加一个现成的风格工作表到那文档
    .accesskey = I
styleeditor-filter-input =
    .placeholder = 过滤器风格工作表
styleeditor-visibility-toggle =
    .tooltiptext = 切换风格工作表可见性
    .accesskey = S
styleeditor-visibility-toggle-system =
    .tooltiptext = 系统风格工作表不能是禁用
styleeditor-save-button = 保存
    .tooltiptext = 保存这风格工作表到一个文件
    .accesskey = S
styleeditor-options-button =
    .tooltiptext = 风格编辑器选项
styleeditor-at-rules = 在-右上外侧
styleeditor-no-stylesheet = 这页有无风格工作表.
styleeditor-no-stylesheet-tip = 也许 (=you had)(=you would) 相似的到 <a data-l10n-name="append-new-stylesheet">附加一个新的风格工作表</a>?
styleeditor-open-link-new-tab =
    .label = 打开连接在新的 Tab
styleeditor-copy-url =
    .label = 复制 URL
styleeditor-find =
    .label = 发现
    .accesskey = F
styleeditor-find-again =
    .label = 发现再一次
    .accesskey = g
styleeditor-go-to-line =
    .label = 转移到线路…
    .accesskey = J
# Label displayed when searching a term that is not found in any stylesheet path
styleeditor-stylesheet-all-filtered = 无匹配风格工作表有是发现.

# This string is shown in the style sheets list
# Variables:
#   $ruleCount (Integer) - The number of rules in the stylesheet.
styleeditor-stylesheet-rule-count =
    { $ruleCount ->
        [one] { $ruleCount } 规则.
       *[other] { $ruleCount } 右上外侧.
    }

# Title for the pretty print button in the editor footer.
styleeditor-pretty-print-button =
    .title = 漂亮的打印风格工作表

# Title for the pretty print button in the editor footer, when it's disabled
styleeditor-pretty-print-button-disabled =
    .title = 能仅漂亮的打印 CSS 文件

# Title for the pretty print button in the editor footer, when it's disabled because
# the stylesheet is read-only
styleeditor-pretty-print-button-disabled-read-only =
    .title = 不能漂亮的打印读取-only 风格工作表.
