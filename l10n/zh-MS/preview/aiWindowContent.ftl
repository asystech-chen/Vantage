# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

smartwindow-messages-document-title = 智能窗口聊天消息

## Error messages in the chat content

smartwindow-assistant-error-generic-header = 很抱歉，程序遇到了一个问题。建议您稍后重新尝试，以便完成操作。
smartwindow-assistant-error-budget-header = 您已达到今日的聊天配额上限。
smartwindow-assistant-error-account-header = 若要使用智能窗口功能，您需要先完成登录操作。
smartwindow-assistant-error-capacity-header = 智能窗口当前正处于容量满载状态。建议您在稍后的时间段重新尝试。

## TODO: ET timezone should be replaced before rolling to other locales: https://bugzilla.mozilla.org/show_bug.cgi?id=2017944

smartwindow-assistant-error-budget-body = 您仍可在本窗口中进行浏览操作。聊天功能将在美国东部时间午夜之后重新启用。
smartwindow-assistant-error-many-requests-header = 在短时间内发送了过多的消息。建议您稍候片刻并重新尝试。
smartwindow-assistant-error-max-length-header = 当前会话已达到长度限制。建议您启动一个新的聊天会话。
smartwindow-assistant-error-request-blocked-header = 智能窗口未能成功连接到服务器。建议您尝试更换网络环境，或停用您的VPN服务。
# Variables:
#   $status (Number) - HTTP status code returned by the inference back-end
smartwindow-assistant-error-http-header = 服务器发生错误（HTTP { $status }）。建议您稍后重新尝试。
smartwindow-retry-btn = 重新尝试
smartwindow-clear-btn = 新建聊天
smartwindow-signin-btn = 登录

## Assistant Message footer

aiwindow-memories-used = 已使用的记忆
aiwindow-memories-callout-description = 记忆功能有助于对此响应的个性化定制。
aiwindow-memories-learn-more = 了解更多
aiwindow-manage-memories =
    .label = 记忆设置
aiwindow-retry-without-memories =
    .label = 在不使用记忆的情况下重新尝试
aiwindow-retry =
  .tooltiptext = 重新尝试
  .aria-label = 重新尝试
aiwindow-copy-message =
    .tooltiptext = 复制
    .aria-label = 复制消息
aiwindow-copy-table =
    .tooltiptext = 复制表格
    .aria-label = 复制表格
aiwindow-thumbs-up =
    .tooltiptext = 分享正面反馈
    .aria-label = 分享正面反馈
aiwindow-thumbs-down =
    .tooltiptext = 分享负面反馈
    .aria-label = 分享负面反馈
aiwindow-applied-memories-popover =
    .aria-label = 记忆面板
aiwindow-applied-memories-list =
    .aria-label = 记忆
# Variables:
#   $summary (String) - The memory text that will be deleted
aiwindow-delete-memory-button =
    .aria-label = 删除 { $summary }

## Jump to Bottom Button

aiwindow-jump-to-bottom =
    .tooltiptext = 跳转到底部
    .aria-label = 跳转到聊天的底部

## Natural Language Action

smartwindow-nl-retry-tool-button =
    .label = 重新尝试

smartwindow-nl-retry-message = 若您仍希望关闭标签页，请选择<strong>重新尝试</strong>，并在随后打开的卡片中作出您的选择。

smartwindow-nl-thinking = 正在查找匹配的标签页…
smartwindow-loading-assistant-response =
    .aria-label = 正在加载助手的响应
smartwindow-nl-undo-button =
    .label = 撤销

## Variables
##   $count (number) - Number of tabs closed/restored

smart-window-closed-tabs-label =
    { $count ->
        [one] 已关闭 { $count } 个标签页
       *[other] 已关闭 { $count } 个标签页
    }
smart-window-closed-tabs-summary =
    { $count ->
        [one] 操作已完成！标签页已关闭。
       *[other] 操作已完成！标签页已关闭。
    }
smart-window-closed-tabs-row-label = 已关闭的标签页
smart-window-closed-and-restored-label = 已关闭并恢复的标签页
smart-window-restored-row-label =
    { $count ->
        [one] 已恢复 { $count } 个标签页
       *[other] 已恢复 { $count } 个标签页
    }
smart-window-restore-success-summary =
    { $count ->
        [one] 标签页已关闭，随后已恢复。
       *[other] 标签页已关闭，随后已恢复。
    }
smart-window-cancelled-label = 请求已被取消。

## Action log

action-log-searching-tabs = 正在搜索标签页
action-log-searched-open-tabs = 已完成对打开的标签页的搜索
action-log-searching-history = 正在搜索历史记录
action-log-searched-history = 已完成对历史记录的搜索
action-log-reading-page = 正在读取页面
action-log-read-page = 已读取页面内容
action-log-searching-web = 正在搜索网络
action-log-searched-web = 已完成对网络的搜索
action-log-checking-memories = 正在检查记忆
action-log-checked-memories = 已完成对记忆的检查
action-log-searching-settings = 正在搜索设置
action-log-searched-settings = 已完成对设置的搜索
action-log-searching-world-cup-matches = 正在搜索世界杯比赛
action-log-searched-world-cup-matches = 已搜索世界杯比赛
action-log-checking-world-cup-live = 正在检查世界杯实时比赛…
action-log-checked-world-cup-live = 已检查世界杯实时比赛

# Variables
#   $count (Number) - how many tool steps completed in the turn
action-log-completed-steps =
    { $count ->
        [one] 已完成 1 个步骤
       *[other] 已完成 { $count } 个步骤
    }

## Assistant Loader

# Shown while the assistant analyzes search results that it loaded into the
# current tab on the user's behalf. Communicates both that the tab's content
# changed and that the assistant is reviewing the results before responding.
smartwindow-search-loader-text = 已在当前选项卡中加载搜索结果。正在分析结果…