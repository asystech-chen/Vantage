# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

styleeditor-new-button =
    .tooltiptext = 创建并追加一个新样式表至文档
    .accesskey = N
styleeditor-import-button =
    .tooltiptext = 导入并追加一个现有样式表至文档
    .accesskey = I
styleeditor-filter-input =
    .placeholder = 筛选样式表
styleeditor-visibility-toggle =
    .tooltiptext = 切换样式表可见性
    .accesskey = S
styleeditor-visibility-toggle-system =
    .tooltiptext = 系统样式表无法被禁用
styleeditor-save-button = 保存
    .tooltiptext = 将此样式表保存至一个文件
    .accesskey = S
styleeditor-options-button =
    .tooltiptext = 样式编辑器选项
styleeditor-at-rules = At 规则
styleeditor-no-stylesheet = 此页面不具有任何样式表。
styleeditor-no-stylesheet-tip = 或许您愿意<a data-l10n-name="append-new-stylesheet">追加一个新样式表</a>？
styleeditor-open-link-new-tab =
    .label = 在新选项卡中打开链接
styleeditor-copy-url =
    .label = 复制 URL
styleeditor-find =
    .label = 查找
    .accesskey = F
styleeditor-find-again =
    .label = 再次查找
    .accesskey = g
styleeditor-go-to-line =
    .label = 跳转至行…
    .accesskey = J
# Label displayed when searching a term that is not found in any stylesheet path
styleeditor-stylesheet-all-filtered = 未找到任何匹配的样式表。

# This string is shown in the style sheets list
# Variables:
#   $ruleCount (Integer) - The number of rules in the stylesheet.
styleeditor-stylesheet-rule-count =
    { $ruleCount ->
        [one] { $ruleCount } 条规则。
       *[other] { $ruleCount } 条规则。
    }

# Title for the pretty print button in the editor footer.
styleeditor-pretty-print-button =
    .title = 美化打印样式表

# Title for the pretty print button in the editor footer, when it's disabled
styleeditor-pretty-print-button-disabled =
    .title = 仅能对 CSS 文件执行美化打印操作

# Title for the pretty print button in the editor footer, when it's disabled because
# the stylesheet is read-only
styleeditor-pretty-print-button-disabled-read-only =
    .title = 无法对只读样式表执行美化打印操作。