# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Chrome

main-context-menu-open-link-new-smart-window =
    .label = 打开连接在新的聪明的窗口
    .accesskey = S

appmenuitem-new-ai-window =
    .label = 新的聪明的窗口
    .value = 新的聪明的窗口

appmenuitem-new-classic-window =
    .label = 新的古典作品窗口

menu-file-new-ai-window =
    .label = 新的聪明的窗口

menu-file-new-classic-window =
    .label = 新的古典作品窗口

menu-history-chats =
    .label = 闲谈

menu-history-chats-recent =
    .label = 最近的闲谈

smartwindow-fullpage-heading = 聪明的窗口

smartwindow-document-title = 新的 Tab

## Smart Window Toggle Button

toolbar-button-ai-window-toggle =
    .label = 窗口类型
    .tooltiptext = 开关在...之间刺痛和古典作品窗.

ai-window-toggleview-switch-classic =
    .label = 古典作品窗口
    .value = 古典作品窗口

ai-window-toggleview-switch-classic-description =
    .label = 标准浏览
    .value = 标准浏览

ai-window-toggleview-switch-ai =
    .label = 聪明的窗口
    .value = 聪明的窗口

ai-window-toggleview-switch-ai-description =
    .label = 询问作为你浏览
    .value = 询问作为你浏览

ai-window-toggleview-switch-private =
    .label = 私人的窗口

ai-window-toggleview-open-private =
    .label = 打开新的私人的窗口

ai-window-toggleview-status-label-active = 聪明的窗口

ai-window-toggleview-status-label-inactive = 古典作品窗口

## Input CTA

aiwindow-input-cta-submit-label-chat = 询问
aiwindow-input-cta-submit-label-navigate = 去
aiwindow-input-cta-submit-label-search = 搜索
aiwindow-input-cta-submit-label-stop = 停止

# Text announced to screen readers when response generation starts.
aiwindow-generation-started-announcement = 应答一代启动

aiwindow-input-cta-menu-label-chat = 询问
aiwindow-input-cta-menu-label-navigate = 去到给...择址
# $searchEngineName (string) - The name of the default search engine
aiwindow-input-cta-menu-label-search = 搜索与 { $searchEngineName }
aiwindow-input-cta-menu-label-search-with = 搜索与…

aiwindow-input-cta-search-submenu-header = 搜索

aiwindow-input-cta-stop-button =
    .aria-label = 停止应答一代
    .title = 停止应答

## Smartbar

smartbar-placeholder =
    .placeholder = 询问, 搜索, 或类型一个 URL
smartbar-placeholder-hint-1 = 使用 @ 到提到最近的标签页…
smartbar-placeholder-hint-2 = 询问任何事…
smartbar-placeholder-hint-3 = Enter 一个网地址…
smartbar-placeholder-hint-4 = 搜索那网…

## Mentions

smartbar-mention-typing-placeholder = 标记一个标签页或位置
smartbar-mentions-list-no-results-label = 无结果发现
smartbar-mentions-list-recent-tabs-label = 最近的标签页

## Context mentions menu toggle button

smartbar-context-menu-button =
    .aria-label = 添加一个标签页或位置
    .tooltiptext = 添加一个标签页或位置

## Website Chip

aiwindow-website-chip-placeholder = 标记一个标签页或位置
aiwindow-website-chip-history-deleted = 历史记录删除
aiwindow-website-chip-remove-button =
    .aria-label = 移除

## Firstrun onboarding

aiwindow-firstrun-title = 欢迎到刺痛窗口
aiwindow-firstrun-model-title = 什么是要点到你?
aiwindow-firstrun-model-subtitle = 拾取一个模型到功率聪明的窗口. 开关任何时候.
aiwindow-firstrun-model-fast-label = 快速的
aiwindow-firstrun-model-fast-body = 用户问题及答案新闻组很快地
# $model (string) - The name of the AI model
# $ownerName (string) - The name of the model owner/provider
aiwindow-firstrun-model-chip-subtitle = 模型 { $model } 由 { $ownerName }
aiwindow-firstrun-model-allpurpose-label = 易曲的
aiwindow-firstrun-model-allpurpose-body = 原色非特为了最多需要
aiwindow-firstrun-model-personal-label = 私人的
aiwindow-firstrun-model-personal-body = 最多裁缝做的用户问题及答案新闻组
aiwindow-firstrun-button = 让我们去!
aiwindow-firstrun-back-button = 回
aiwindow-firstrun-next-button = 近邻干扰

## These are labels describing model types in the smartbar model select.

aiwindow-input-model-select-button-label-fast = 快速的
aiwindow-input-model-select-button-label-allpurpose = 易曲的
aiwindow-input-model-select-button-label-personal = 私人的
aiwindow-input-model-select-button-label-custom = 定制

# Variables:
# $ownerName (string) - The name of the model owner/provider
# $model (string) - The model name
aiwindow-input-model-select-menu-item-description = { $ownerName } { $model }
aiwindow-input-model-select-menu-item-description-custom = 使用你的自己的 LLM
aiwindow-input-model-select-default-badge =
    .label = 默认
    .title = 那被选的默认模型
aiwindow-input-model-select-settings-link = 模型设置

## Firstrun memories onboarding

aiwindow-firstrun-memories-title = 更多有帮助的用户问题及答案新闻组, 在你的检索词
aiwindow-firstrun-memories-subtitle = 聪明的窗口能学习从你的闲谈, 浏览, 或两者的到创建存储器. 他们使用户问题及答案新闻组更多有帮助的结束时间.

aiwindow-firstrun-memories-conversation-title = 保持那会话去
aiwindow-firstrun-memories-conversation-body = 学习从闲谈低劣的你将有到重复你自己最低成本估算与调度法.

aiwindow-firstrun-memories-relevance-title = 更多有关联的用户问题及答案新闻组
aiwindow-firstrun-memories-relevance-body = 学习从浏览弹性聪明的窗口那更大的图象.

aiwindow-firstrun-memories-privacy-title = 私人的由设计
aiwindow-firstrun-memories-privacy-body = 存储器是储存的在这装置. 删除或转弯关闭任何时候.

aiwindow-firstrun-memories-choose-label = 选取什么聪明的窗口学习从
aiwindow-firstrun-memories-checkbox-chats = 闲谈在刺痛窗口
aiwindow-firstrun-memories-checkbox-browsing = 浏览越过 { -brand-product-name }
aiwindow-firstrun-memories-update-settings = 更新在设置任何时候.
aiwindow-firstrun-memories-no-create = 获得它. 刺痛窗口将不创建存储器. 更新在设置任何时候.

## Firstrun set as default onboarding

aiwindow-firstrun-default-title = 使聪明的窗口你的去-到
aiwindow-firstrun-default-subtitle = 浏览, 搜索, 和询问在一(个) 地方. 你能仍然打开私人的和古典作品窗何时你想要.
aiwindow-firstrun-default-checkbox-label = 总是打开 { -brand-product-name } 在刺痛窗口
aiwindow-firstrun-default-checkbox-description = 开关在设置任何时候

## Ask Toolbar Button

smartwindow-ask-button =
    .label = 询问

## Memories toggle button

aiwindow-memories-on =
    .tooltiptext = 使用存储器在应答何时有帮助的
    .aria-label = 存储器在
aiwindow-memories-off =
    .tooltiptext = 不要使用存储器在应答
    .aria-label = 存储器关闭

## New Chat Button

aiwindow-new-chat =
    .tooltiptext = 新的闲谈
    .aria-label = 新的闲谈

## Close Sidebar Button

aiwindow-close-sidebar =
    .tooltiptext = 关闭
    .aria-label = 关闭

## Sign out dialog

fxa-signout-dialog-body-aiwindow = synchronization 的缩略词论据将保持在你的帐户. 打开聪明的窗将开关到古典作品窗.

## Smart Window Toggle Button (in-page)

smartwindow-switch-to-smart-window = 开关到刺痛窗口

## Fullpage Footer Actions

smartwindow-footer-chats =
    .tooltiptext = 闲谈
    .aria-label = 闲谈
    .label = 闲谈

smartwindow-footer-history =
    .tooltiptext = 历史记录
    .aria-label = 历史记录
    .label = 历史记录

## Disclaimer
## Text displayed to user to warn user about potential mistakes.

smartwindow-disclaimer = AI 能使错误.

## FirefoxView Chats
## Chats in this context refers to chats saved from the Smart Window Assistant

firefoxview-chats-nav = 闲谈
  .title = 闲谈
firefoxview-chats-header = 闲谈

firefoxview-chat-context-delete = 删除从闲谈
    .accesskey = D

# Placeholder for the input field to search in open tabs ("search" is a verb).
firefoxview-search-text-box-chats =
  .placeholder = 搜索闲谈

## Variables:
##   $date (string) - Date to be formatted based on locale

firefoxview-chat-date-today = 今天 - { DATETIME($date, dateStyle: "full") }
firefoxview-chat-date-yesterday = 昨天 - { DATETIME($date, dateStyle: "full") }
firefoxview-chat-date-this-month = { DATETIME($date, dateStyle: "full") }
firefoxview-chat-date-prev-month = { DATETIME($date, month: "long", year: "numeric") }

## Message displayed in Firefox View when the user has no chat data

firefoxview-chats-empty-header = 获得回到你的闲谈
firefoxview-chats-empty-description = 作为你使用聪明的窗口, 你的闲谈将是保存这里.

## Count displayed in fxview chat search results

# Variables:
#   $count (Number) - The number of chats matching the search query.

firefoxview-search-chat-results-count = { $count ->
  [one] { $count } 闲谈
 *[other] { $count } 闲谈
}

## Clear browsing data dialog

item-history-downloads-and-chat =
    .label = 浏览, 下载, & 闲谈历史记录
    .accesskey = B

item-history-downloads-and-chat-description = 清除位置, 下载, 和闲谈历史记录

## Natural Language Interactions

smart-window-confirm-select-all =
    .aria-label = 选择所有的
    .label = 选择所有的

smart-window-confirm-deselect-all =
    .aria-label = 取消选定所有的
    .label = 取消选定所有的

smart-window-close-confirm =
    .tooltiptext = 关闭确认
    .aria-label = 关闭确认

smart-window-confirm-close-tab = 关闭

# Variables
#   $count (number) - Number of tabs to close
smart-window-confirm-close-tabs =
    { $count ->
        [one] 关闭 { $count } 标签页
       *[other] 关闭 { $count } 标签页
    }

## Natural Language action callouts

# Shown after the Smart Window closes the user's current tab in response to a
# natural language prompt action, anchored to the toolbar menu button.
smartwindow-close-tab-callout-title = Tab 关闭
smartwindow-close-tab-callout-subtitle = 重开标签页从历史记录任何时候.

## Smart Window new tab promo

smart-window-default-promo-heading = 使聪明的窗口你的默认?
smart-window-default-promo-message = { -brand-short-name } 将打开在刺痛窗口每一时间.
smart-window-default-promo-primary-button = 日落作为默认
smart-window-default-promo-additional-button = 不现在

## Feedback modal

aiwindow-feedback-modal-title = 部分反馈
aiwindow-feedback-what-worked-well = 什么和过去分词井? 无私人的信息, 请.
aiwindow-feedback-choose-any = 选取任何的那应用
aiwindow-feedback-add-details = 添加详细数据如果你将相似的. 无私人的信息, 请.
aiwindow-feedback-disclaimer = 顺从部分你的反馈和这闲谈到帮助 { -brand-shorter-name } 改良聪明的窗口. 你的其他的闲谈停留私人的. <a data-l10n-name="learn-more">学习更多</a>
aiwindow-feedback-submit = 提交
aiwindow-feedback-cancel = 取消
aiwindow-feedback-reason-incorrect-or-misleading = 不正确的或引入歧途的
aiwindow-feedback-reason-doesnt-address-my-request = 不地址我的请求
aiwindow-feedback-reason-lacks-personalization = 缺乏人格化或上下文
aiwindow-feedback-reason-performance-or-usability = 施行或可用性发行
aiwindow-feedback-reason-harmful-or-offensive = 有害的或令人不快的
aiwindow-feedback-reason-other = 其他的
aiwindow-feedback-preview-report = 查看闲谈详细数据
aiwindow-feedback-preview-report-with-page = 查看闲谈和页详细数据
aiwindow-feedback-include-page-content = 部分那页引用的在这闲谈

## Smart Window ai-chat-grid

aiwindow-ai-chat-grid-view-controls =
    .aria-label = 开关查看页面布局
aiwindow-ai-chat-grid-list-view =
    .aria-label = 开关模式: 列表查看
    .tooltiptext = 列表查看
aiwindow-ai-chat-grid-grid-view =
    .aria-label = 开关模式: 网格查看
    .tooltiptext = 网格查看
