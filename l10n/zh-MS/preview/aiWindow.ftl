# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Chrome

main-context-menu-open-link-new-smart-window =
    .label = 在新智能窗口中启动链接
    .accesskey = S

appmenuitem-new-ai-window =
    .label = 新智能窗口
    .value = 新智能窗口

appmenuitem-new-classic-window =
    .label = 新经典窗口

menu-file-new-ai-window =
    .label = 新智能窗口

menu-file-new-classic-window =
    .label = 新经典窗口

menu-history-chats =
    .label = 对话

menu-history-chats-recent =
    .label = 最近对话

smartwindow-fullpage-heading = 智能窗口

smartwindow-document-title = 新选项卡

## Smart Window Toggle Button

toolbar-button-ai-window-toggle =
    .label = 窗口类型
    .tooltiptext = 在智能窗口与经典窗口之间进行切换。

ai-window-toggleview-switch-classic =
    .label = 经典窗口
    .value = 经典窗口

ai-window-toggleview-switch-classic-description =
    .label = 标准浏览
    .value = 标准浏览

ai-window-toggleview-switch-ai =
    .label = 智能窗口
    .value = 智能窗口

ai-window-toggleview-switch-ai-description =
    .label = 浏览时进行提问
    .value = 浏览时进行提问

ai-window-toggleview-switch-private =
    .label = 隐私窗口

ai-window-toggleview-open-private =
    .label = 打开新的隐私窗口

ai-window-toggleview-status-label-active = 智能窗口

ai-window-toggleview-status-label-inactive = 经典窗口

## Input CTA

aiwindow-input-cta-submit-label-chat = 提问
aiwindow-input-cta-submit-label-navigate = 前往
aiwindow-input-cta-submit-label-search = 搜索
aiwindow-input-cta-submit-label-stop = 停止

# Text announced to screen readers when response generation starts.
aiwindow-generation-started-announcement = 响应生成已开始

aiwindow-input-cta-menu-label-chat = 提问
aiwindow-input-cta-menu-label-navigate = 前往网站
# $searchEngineName (string) - The name of the default search engine
aiwindow-input-cta-menu-label-search = 使用{ $searchEngineName }进行搜索
aiwindow-input-cta-menu-label-search-with = 使用…进行搜索

aiwindow-input-cta-search-submenu-header = 搜索

aiwindow-input-cta-stop-button =
    .aria-label = 停止响应生成
    .title = 停止响应

## Smartbar

smartbar-placeholder =
    .placeholder = 提问、搜索或输入URL
smartbar-placeholder-hint-1 = 使用@提及最近的选项卡…
smartbar-placeholder-hint-2 = 提问任何内容…
smartbar-placeholder-hint-3 = 输入网址…
smartbar-placeholder-hint-4 = 搜索网页…

## Mentions

smartbar-mention-typing-placeholder = 标记选项卡或网站
smartbar-mentions-list-no-results-label = 未找到任何结果
smartbar-mentions-list-recent-tabs-label = 最近的选项卡

## Context mentions menu toggle button

smartbar-context-menu-button =
    .aria-label = 添加选项卡或网站
    .tooltiptext = 添加选项卡或网站

## Website Chip

aiwindow-website-chip-placeholder = 标记选项卡或网站
aiwindow-website-chip-history-deleted = 历史记录已删除
aiwindow-website-chip-remove-button =
    .aria-label = 移除

## Firstrun onboarding

aiwindow-firstrun-title = 欢迎使用智能窗口
aiwindow-firstrun-model-title = 您认为哪些内容对您最为重要？
aiwindow-firstrun-model-subtitle = 请选择用于驱动智能窗口的模型。您可以随时进行切换。
aiwindow-firstrun-model-fast-label = 快速
aiwindow-firstrun-model-fast-body = 回答迅速
# $model (string) - The name of the AI model
# $ownerName (string) - The name of the model owner/provider
aiwindow-firstrun-model-chip-subtitle = 模型 { $model }，由 { $ownerName } 提供
aiwindow-firstrun-model-allpurpose-label = 灵活
aiwindow-firstrun-model-allpurpose-body = 适合大多数需求的稳固选择
aiwindow-firstrun-model-personal-label = 个性化
aiwindow-firstrun-model-personal-body = 最具定制性的回答
aiwindow-firstrun-button = 让我们开始吧！
aiwindow-firstrun-back-button = 返回
aiwindow-firstrun-next-button = 下一步

## These are labels describing model types in the smartbar model select.

aiwindow-input-model-select-button-label-fast = 快速
aiwindow-input-model-select-button-label-allpurpose = 灵活
aiwindow-input-model-select-button-label-personal = 个性化
aiwindow-input-model-select-button-label-custom = 自定义

# Variables:
# $ownerName (string) - The name of the model owner/provider
# $model (string) - The model name
aiwindow-input-model-select-menu-item-description = { $ownerName } { $model }
aiwindow-input-model-select-menu-item-description-custom = 使用您自己的LLM
aiwindow-input-model-select-default-badge =
    .label = 默认
    .title = 所选的默认模型
aiwindow-input-model-select-settings-link = 模型设置

## Firstrun memories onboarding

aiwindow-firstrun-memories-title = 更多有益的回答，按您的条款
aiwindow-firstrun-memories-subtitle = 智能窗口可以从您的聊天、浏览或两者中学习，以创建记忆。它们使回答随着时间的推移更加有益。

aiwindow-firstrun-memories-conversation-title = 保持对话的继续进行
aiwindow-firstrun-memories-conversation-body = 从聊天中学习意味着您将不得不减少重复您自己的内容。

aiwindow-firstrun-memories-relevance-title = 更相关的回答
aiwindow-firstrun-memories-relevance-body = 从浏览中学习给予智能窗口更大的全局视野。

aiwindow-firstrun-memories-privacy-title = 设计上即为私密
aiwindow-firstrun-memories-privacy-body = 记忆存储在此设备上。随时删除或关闭。

aiwindow-firstrun-memories-choose-label = 选择智能窗口学习的内容
aiwindow-firstrun-memories-checkbox-chats = 智能窗口中的聊天
aiwindow-firstrun-memories-checkbox-browsing = 跨 { -brand-product-name } 的浏览活动
aiwindow-firstrun-memories-update-settings = 随时在设置中更新。
aiwindow-firstrun-memories-no-create = 已了解。智能窗口将不会创建记忆。随时在设置中更新。

## Firstrun set as default onboarding

aiwindow-firstrun-default-title = 使智能窗口成为您的首选
aiwindow-firstrun-default-subtitle = 在单一位置进行浏览、搜索和提问。当您需要时，仍可打开私密窗口和经典窗口。
aiwindow-firstrun-default-checkbox-label = 始终在智能窗口中打开 { -brand-product-name }
aiwindow-firstrun-default-checkbox-description = 随时在设置中切换

## Ask Toolbar Button

smartwindow-ask-button =
    .label = 提问

## Memories toggle button

aiwindow-memories-on =
    .tooltiptext = 在回答中有用时使用记忆
    .aria-label = 记忆开启
aiwindow-memories-off =
    .tooltiptext = 不在回答中使用记忆
    .aria-label = 记忆关闭

## New Chat Button

aiwindow-new-chat =
    .tooltiptext = 新聊天
    .aria-label = 新聊天

## Close Sidebar Button

aiwindow-close-sidebar =
    .tooltiptext = 关闭
    .aria-label = 关闭

## Sign out dialog

fxa-signout-dialog-body-aiwindow = 同步的数据将保留在您的账户中。打开的智能窗口将切换为经典窗口。

## Smart Window Toggle Button (in-page)

smartwindow-switch-to-smart-window = 切换到智能窗口

## Fullpage Footer Actions

smartwindow-footer-chats =
    .tooltiptext = 聊天
    .aria-label = 聊天
    .label = 聊天

smartwindow-footer-history =
    .tooltiptext = 历史记录
    .aria-label = 历史记录
    .label = 历史记录

## Disclaimer
## Text displayed to user to warn user about potential mistakes.

smartwindow-disclaimer = 人工智能可能犯错。

## FirefoxView Chats
## Chats in this context refers to chats saved from the Smart Window Assistant

firefoxview-chats-nav = 聊天
  .title = 聊天
firefoxview-chats-header = 聊天

firefoxview-chat-context-delete = 从聊天中删除
    .accesskey = D

# Placeholder for the input field to search in open tabs ("search" is a verb).
firefoxview-search-text-box-chats =
.placeholder = 正在搜索聊天记录...

## Variables:
##   $date (string) - Date to be formatted based on locale

firefoxview-chat-date-today = 今日 - { DATETIME($date, dateStyle: "full") }
firefoxview-chat-date-yesterday = 昨日 - { DATETIME($date, dateStyle: "full") }
firefoxview-chat-date-this-month = { DATETIME($date, dateStyle: "full") }
firefoxview-chat-date-prev-month = { DATETIME($date, month: "long", year: "numeric") }

## Message displayed in Firefox View when the user has no chat data

firefoxview-chats-empty-header = 返回至您的聊天记录
firefoxview-chats-empty-description = 当您使用智能窗口时，您的聊天记录将被保存于此。

## Count displayed in fxview chat search results

# Variables:
#   $count (Number) - The number of chats matching the search query.

firefoxview-search-chat-results-count = { $count ->
  [one] { $count } 条聊天记录
 *[other] { $count } 条聊天记录
}

## Clear browsing data dialog

item-history-downloads-and-chat =
    .label = 浏览、下载及聊天历史记录
    .accesskey = B

item-history-downloads-and-chat-description = 清除站点、下载及聊天历史记录

## Natural Language Interactions

smart-window-confirm-select-all =
    .aria-label = 全选
    .label = 全选

smart-window-confirm-deselect-all =
    .aria-label = 取消全选
    .label = 取消全选

smart-window-close-confirm =
    .tooltiptext = 关闭确认
    .aria-label = 关闭确认

smart-window-confirm-close-tab = 关闭

# Variables
#   $count (number) - Number of tabs to close
smart-window-confirm-close-tabs =
    { $count ->
        [one] 关闭 { $count } 个标签页
       *[other] 关闭 { $count } 个标签页
    }

## Natural Language action callouts

# Shown after the Smart Window closes the user's current tab in response to a
# natural language prompt action, anchored to the toolbar menu button.
smartwindow-close-tab-callout-title = 标签页已关闭
smartwindow-close-tab-callout-subtitle = 您可以随时从历史记录中重新开启已关闭的标签页。

## Smart Window new tab promo

smart-window-default-promo-heading = 是否将智能窗口设置为您的默认窗口？
smart-window-default-promo-message = { -brand-short-name } 将每次在智能窗口中启动。
smart-window-default-promo-primary-button = 设置为默认
smart-window-default-promo-additional-button = 暂不设置

## Feedback modal

aiwindow-feedback-modal-title = 分享您的反馈意见
aiwindow-feedback-what-worked-well = 哪些方面运行良好？请勿包含个人信息。
aiwindow-feedback-choose-any = 请选择所有适用的选项
aiwindow-feedback-add-details = 如果您愿意，请添加详细信息。请勿包含个人信息。
aiwindow-feedback-disclaimer = 提交即表示您同意分享此反馈及本次聊天内容，以帮助 { -brand-shorter-name } 改进智能窗口。您的其他聊天记录将保持私密。<a data-l10n-name="learn-more">了解更多</a>
aiwindow-feedback-submit = 提交
aiwindow-feedback-cancel = 取消
aiwindow-feedback-reason-incorrect-or-misleading = 不正确或具有误导性
aiwindow-feedback-reason-doesnt-address-my-request = 未满足我的请求
aiwindow-feedback-reason-lacks-personalization = 缺乏个性化或上下文信息
aiwindow-feedback-reason-performance-or-usability = 性能或可用性问题
aiwindow-feedback-reason-harmful-or-offensive = 有害或冒犯性内容
aiwindow-feedback-reason-other = 其他
aiwindow-feedback-preview-report = 查看聊天详情
aiwindow-feedback-preview-report-with-page = 查看聊天及页面详情
aiwindow-feedback-include-page-content = 共享此聊天中引用的页面

## Smart Window ai-chat-grid

aiwindow-ai-chat-grid-view-controls =
    .aria-label = 切换视图布局
aiwindow-ai-chat-grid-list-view =
    .aria-label = 切换模式：列表视图
    .tooltiptext = 列表视图
aiwindow-ai-chat-grid-grid-view =
    .aria-label = 切换模式：网格视图
    .tooltiptext = 网格视图