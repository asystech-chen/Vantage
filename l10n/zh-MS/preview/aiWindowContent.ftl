# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

smartwindow-messages-document-title = 聪明的窗口闲谈报文

## Error messages in the chat content

smartwindow-assistant-error-generic-header = 某事去错误的. 请试再一次.
smartwindow-assistant-error-budget-header = 你有到达 today's 闲谈界限.
smartwindow-assistant-error-account-header = 到使用聪明的窗口, 你将需要到正负号在.
smartwindow-assistant-error-capacity-header = 聪明的窗口是在容量右现在. 请试再一次以后.

## TODO: ET timezone should be replaced before rolling to other locales: https://bugzilla.mozilla.org/show_bug.cgi?id=2017944

smartwindow-assistant-error-budget-body = 你能仍然浏览在这窗口. 闲谈将是可利用的再一次在...之后午夜 ET.
smartwindow-assistant-error-many-requests-header = 请等待一个片刻和尝试再一次. 也多数报文曾是发送在一个扼要时间.
smartwindow-assistant-error-max-length-header = 它是时间到启动一个新的闲谈. 这人们的到达它的记录长度界限.
smartwindow-assistant-error-request-blocked-header = 聪明的窗口不能伸出那服务器. 尝试一个不同的网络, 或禁用你的 VPN.
# Variables:
#   $status (Number) - HTTP status code returned by the inference back-end
smartwindow-assistant-error-http-header = 服务器错误 (HTTP { $status }). 请试再一次.
smartwindow-retry-btn = 尝试再一次
smartwindow-clear-btn = 新的闲谈
smartwindow-signin-btn = 正负号在

## Assistant Message footer

aiwindow-memories-used = 存储器使用
aiwindow-memories-callout-description = 存储器帮助 (贬)使个人化这应答.
aiwindow-memories-learn-more = 学习更多
aiwindow-manage-memories =
    .label = 存储器设置
aiwindow-retry-without-memories =
    .label = 重发没有存储器
aiwindow-retry =
  .tooltiptext = 重发
  .aria-label = 重发
aiwindow-copy-message =
    .tooltiptext = 复制
    .aria-label = 复制报文
aiwindow-copy-table =
    .tooltiptext = 复制表格
    .aria-label = 复制表格
aiwindow-thumbs-up =
    .tooltiptext = 部分肯定的反馈
    .aria-label = 部分肯定的反馈
aiwindow-thumbs-down =
    .tooltiptext = 部分负数反馈
    .aria-label = 部分负数反馈
aiwindow-applied-memories-popover =
    .aria-label = 存储器嵌板
aiwindow-applied-memories-list =
    .aria-label = 存储器
# Variables:
#   $summary (String) - The memory text that will be deleted
aiwindow-delete-memory-button =
    .aria-label = 删除 { $summary }

## Jump to Bottom Button

aiwindow-jump-to-bottom =
    .tooltiptext = 转移到给...装底
    .aria-label = 转移到给...装底的闲谈

## Natural Language Action

smartwindow-nl-retry-tool-button =
    .label = 重发

smartwindow-nl-retry-message = 如果你仍然想要到关闭标签页, 选取 <strong>重发</strong> 和使你的选择在那卡片那打开.

smartwindow-nl-thinking = 有…相貌的为了匹配标签页…
smartwindow-loading-assistant-response =
    .aria-label = 装载助手应答
smartwindow-nl-undo-button =
    .label = 撤消

## Variables
##   $count (number) - Number of tabs closed/restored

smart-window-closed-tabs-label =
    { $count ->
        [one] 关闭 { $count } 标签页
       *[other] 关闭 { $count } 标签页
    }
smart-window-closed-tabs-summary =
    { $count ->
        [one] 完成了的! Tab 关闭.
       *[other] 完成了的! 标签页关闭.
    }
smart-window-closed-tabs-row-label = 关闭标签页
smart-window-closed-and-restored-label = 关闭和精力充沛的标签页
smart-window-restored-row-label =
    { $count ->
        [one] 精力充沛的 { $count } 标签页
       *[other] 精力充沛的 { $count } 标签页
    }
smart-window-restore-success-summary =
    { $count ->
        [one] Tab 关闭, 然后精力充沛的.
       *[other] 标签页关闭, 然后精力充沛的.
    }
smart-window-cancelled-label = 请求被取消的.

## Action log

action-log-searching-tabs = 搜索的标签页
action-log-searched-open-tabs = 找寻打开标签页
action-log-searching-history = 搜索的历史记录
action-log-searched-history = 找寻历史记录
action-log-reading-page = 阅读页
action-log-read-page = 读取页内容
action-log-searching-web = 搜索的那网
action-log-searched-web = 找寻那网
action-log-checking-memories = 检查的存储器
action-log-checked-memories = 选中的存储器
action-log-searching-settings = 搜索的设置
action-log-searched-settings = 找寻设置
action-log-searching-world-cup-matches = 搜索的世界杯子比较
action-log-searched-world-cup-matches = 找寻世界杯子比较
action-log-checking-world-cup-live = 检查的活的世界杯子比较
action-log-checked-world-cup-live = 选中的活的世界杯子比较

# Variables
#   $count (Number) - how many tool steps completed in the turn
action-log-completed-steps =
    { $count ->
        [one] 完整的 1 步骤
       *[other] 完整的 { $count } 步骤
    }

## Assistant Loader

# Shown while the assistant analyzes search results that it loaded into the
# current tab on the user's behalf. Communicates both that the tab's content
# changed and that the assistant is reviewing the results before responding.
smartwindow-search-loader-text = 有负载的搜索结果在这标签页. 分析的…
