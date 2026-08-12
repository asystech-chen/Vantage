# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Generative AI (GenAI) Settings section

genai-settings-chat-chatgpt-links = 由选择 ChatGPT, 你同意到那 OpenAI <a data-l10n-name="link1">检索词的使用</a> 和 <a data-l10n-name="link2">隐私政策</a>.
genai-settings-chat-claude-links = 由选择人类的克劳德（男子名）, 你同意到那人类的 <a data-l10n-name="link1">消费者检索词的服务</a>, <a data-l10n-name="link2">用法政策</a>, 和 <a data-l10n-name="link3">隐私政策</a>.
genai-settings-chat-copilot-links = 由选择副驾驶员, 你同意到那 <a data-l10n-name="link1">副驾驶员 AI 经历( experience的名词复数 ) 检索词</a> 和 <a data-l10n-name="link2">巨硬隐私程序语句</a>.
genai-settings-chat-gemini-links = 由选择谷歌双胎, 你同意到那 <a data-l10n-name="link1">谷歌检索词的服务</a>, <a data-l10n-name="link2">生殖的 AI 禁止使用政策</a>, 和 <a data-l10n-name="link3">双胎应用程序隐私注意</a>.
genai-settings-chat-huggingchat-links = 由选择 HuggingChat, 你同意到那 <a data-l10n-name="link1">HuggingChat 隐私注意</a> 和 <a data-l10n-name="link2">热烈地拥抱现场可改变的控制元件隐私政策</a>.
genai-settings-chat-lechat-links = 由选择小于或等于闲谈密史脱拉风, 你同意到那密史脱拉风 AI <a data-l10n-name="link1">检索词的服务</a> 和 <a data-l10n-name="link2">隐私政策</a>.
genai-settings-chat-localhost-links = 带来你的自己的私人的本地的 chatbot 如此的作为 <a data-l10n-name="link1">llamafile</a> 从 { -vendor-short-name }'s 改革创建组.

## Chatbot prompts
## Prompts are plain language ‘instructions’ sent to a chatbot.
## These prompts have been made concise and direct in English because some chatbot providers
## have character restrictions and being direct reduces the chance for misinterpretation.
## When localizing, please be concise and direct, but not at the expense of losing meaning.

# This prompt is added to the beginning of selection prompts sent to a chatbot.
# $tabTitle (string) - title of the webpage
# $selection (string) - selected text
genai-prompt-prefix-selection = 我是（缩写）在页“{ $tabTitle }”与“{ $selection }”被选的.

# Prompt purpose: help users understand what a selection covers at a glance
genai-prompts-summarize =
    .label = 概述
    .value = 请概述那选择使用精确的和简洁的语言. 使用页眉和强调符号列表在那摘要, 到使它可细察的. 维持那意义和事实的准确度.
# Prompt purpose: make a selection easier to read
genai-prompts-simplify =
    .label = 单一化语言
    .value = 请重写那选择使用短的判决和简单的字. 维持那意义和事实的准确度.
# Prompt purpose: test understanding of selection in an interactive way
genai-prompts-quiz =
    .label = 考查我
    .value = 请戏弄我在这选择. 询问我一个多样的类型（type）的询问, 为了例子倍数选择, 真实的或错误的, 和短的用户问题及答案新闻组. 等待为了我的应答在...之前动人的在到那近邻干扰询问.
# Prompt purpose: helps users understand words, phrases, concepts
genai-prompts-explain =
    .label = 解释这
    .value = 请解释那键观念在这选择, 使用简单的字. 也, 使用例子.
# Prompt purpose: writing tool that helps users with spelling and grammar mistakes and produce a response that identifies errors and rewrites the inputted text correctly
genai-prompts-proofread =
    .label = 校正
    .value = 请校正那选择为了拼写检查和语法检查错误. 识别任何的错误( mistake的名词复数 ) 和提供一个修正的版本的那电文. 维持那意义和事实的准确度和输出那列表的被提议的订正首先, 跟随的由那期末考试, 修正的版本的那电文.

## Chatbot menu shortcuts

genai-menu-no-provider-2 =
    .label = 询问一个 AI Chatbot
    .accesskey = z
genai-menu-choose-chatbot =
    .label = 选取一个 AI Chatbot
genai-menu-ask-generic-2 =
    .label = 询问 AI Chatbot
    .accesskey = z
# $provider (string) - name of the provider
genai-menu-ask-provider-2 =
    .label = 询问 { $provider }
    .accesskey = z
genai-menu-open-generic =
    .label = 打开 AI Chatbot
# $provider (string) - name of the provider
genai-menu-open-provider =
    .label = 打开 { $provider }
genai-menu-remove-generic =
    .label = 移除 AI Chatbot
# $provider (string) - name of the provider
genai-menu-remove-provider =
    .label = 移除 { $provider }
genai-menu-remove-sidebar =
    .label = 移除从其他选项
# $provider (string) - name of the AI chat provider
genai-shortcut-button =
    .aria-label = 询问 { $provider }

genai-menu-new-badge = 新的
genai-menu-summarize-page = 概述页

genai-input-ask-generic =
    .placeholder = 询问 AI chatbot…
# $provider (string) - name of the provider
genai-input-ask-provider =
    .placeholder = 询问 { $provider }…

# $selectionLength (number) - selected text length
# $maxLength (number) - max length of what can be selected
genai-shortcuts-selected-warning-generic =
    .heading = AI chatbot 将不获得你的完整选择
    .message = { $selectionLength ->
        *[other] you have 你（们）已经被选的关于 { $selectionLength } 字符. 那数字的字符我们能发送到那 AI chatbot 是关于 { $maxLength }.
    }
# $provider (string) - name of the provider
# $selectionLength (number) - selected text length
# $maxLength (number) - max length of what can be selected
genai-shortcuts-selected-warning =
    .heading = { $provider } 将不获得你的完整选择
    .message = { $selectionLength ->
        *[other] you have 你（们）已经被选的关于 { $selectionLength } 字符. 那数字的字符我们能发送到 { $provider } 是关于 { $maxLength }.
    }
genai-shortcuts-hide =
    .label = 隐藏 chatbot 快捷方式

## Chatbot header

genai-chatbot-title = AI chatbot
genai-header-provider-menu =
    .title = 选取一个 chatbot
genai-header-settings-button =
    .title = AI 闲谈设置
genai-header-close-button =
    .title = 关闭

genai-provider-view-details =
    .label = 查看 chatbot 详细数据
genai-options-reload-generic =
    .label = 再装 AI chatbot
# $provider (string) - name of the provider
genai-options-reload-provider =
    .label = 再装 { $provider }
genai-options-show-shortcut =
    .label = 显示快捷方式何时选择电文
genai-options-hide-shortcut =
    .label = 隐藏快捷方式何时选择电文
genai-options-about-chatbot =
    .label = 关于 AI chatbots 在 { -brand-short-name }

## Chatbot message

genai-page-warning =
    .message = 自...以后那页是长, 这是一个分音摘要.

## Chatbot footer

genai-page-button-summarize = 概述页

## Chatbot onboarding

genai-chatbot-summarize-title = 新的! 概述页在一(个) 单击
genai-chatbot-summarize-button = 概述页

# “Summarize Page” should be consistent with the translation for the string genai-menu-summarize-page
genai-chatbot-summarize-sidebar-provider-subtitle = 右-click 在你的 AI chatbot 在那其他选项和选取“概述页”.
# “Summarize Page” should be consistent with the translation for the string genai-menu-summarize-page
genai-chatbot-summarize-sidebar-generic-subtitle = 右-click 那发火花按钮在那其他选项和选取“概述页”. 那开始时间, (=you will 也选取一个 AI chatbot.

# “Summarize page” should be consistent with the translation for the string genai-page-button-summarize
genai-chatbot-summarize-footer-provider-subtitle = 打开你的 AI chatbot 在那其他选项和选取“概述页”在那底部.
genai-chatbot-summarize-footer-generic-subtitle = 添加一个 AI chatbot 到那 { -brand-short-name } 其他选项到很快地概述页.

genai-chatbot-contextual-title = 使用一个 AI chatbot 没有交换标签页
genai-chatbot-contextual-subtitle = 闲谈和浏览旁边-by-side 何时你添加一个 AI chatbot 在那 { -brand-short-name } 其他选项.
genai-chatbot-contextual-button = 选取一个 chatbot

genai-onboarding-choose-header = 选取一个 AI chatbot 到使用在那 { -brand-short-name } 其他选项
# "Switch anytime" refers to allowing the user to switch to a different chatbot.
genai-onboarding-choose-description = 开关任何时候. 为了帮忙选择, <a data-l10n-name="learn-more">学习更多关于每个 chatbot</a>.
genai-onboarding-primary = 继续
genai-onboarding-secondary = 关闭
genai-onboarding-deepseek-tooltip =
    .label = 询问 DeepSeek 到弄短, 单一化, 或概述内容
genai-onboarding-qwen-tooltip =
    .label = 询问 Qwen 到弄短, 单一化, 或概述内容
genai-onboarding-doubao-tooltip =
    .label = 询问豆包到弄短, 单一化, 或概述内容
genai-onboarding-claude-tooltip =
    .title = 人类的克劳德（男子名）
genai-onboarding-chatgpt-tooltip =
    .title = ChatGPT
genai-onboarding-copilot-tooltip =
    .title = 副驾驶员
genai-onboarding-gemini-tooltip =
    .title = 谷歌双胎
genai-onboarding-huggingchat-tooltip =
    .title = HuggingChat
genai-onboarding-lechat-tooltip =
    .title = 小于或等于闲谈密史脱拉风

## Model Optin Component

genai-model-optin-continue =
  .label = 继续

genai-model-optin-optout =
  .label = 取消

genai-model-optin-cancel =
  .label = 取消

## Link previews

# ‘min’ is short for “minute”
# ‘mins’ is short for “minutes”
# An estimate for how long it takes to read an article,
# expressed as a range covering both slow and fast readers.
# Variables:
#   $rangePlural (String): The plural category of the range, using the same set as for numbers.
#   $range (String): The range of minutes as a localised string. Examples: "3-7", "~1".
link-preview-reading-time =
    { $rangePlural ->
        [one] { $range } 部长（Minister）阅读时间
       *[other] { $range } 需监护的未成年人（Minors In Need of Supervision）阅读时间
    }

# Error message displayed when a link preview cannot be generated
link-preview-error-message-v2 = { -brand-short-name } 不能预览这连接

# Text for the link to visit the original URL when in error state
link-preview-visit-link = 拜访连接

# Error message when key points generation (summary highlights or main ideas of page content) fails for a page
link-preview-generation-error-missing-data-v2 = { -brand-short-name } 不能产生键点为了这网页.

# Error message when something went wrong during key point generation
link-preview-generation-error-unexpected = 某事去错误的.

# Text for the retry link when generation fails
link-preview-generation-retry = 尝试再一次

# Button that opens the Link Preview settings
link-preview-settings-button =
    .title = 连接预览设置

link-preview-settings-enable =
    .label = 启用连接预览
    .description = 看见那页标题, 描述, 和更多何时你使用那快捷方式或右-click 在一个连接.
link-preview-settings-key-points =
    .label = 允许 AI 到读取那开始的那页和产生键点
link-preview-settings-long-press =
    .label = 快捷方式: 单击和保留那连接为了 1 秒 (长压)

# Title that appears when user is shown the opt-in flow for link previews
link-preview-optin-title = 看见更多与 AI?

# Message that appears when user is shown the opt-in flow for link previews
link-preview-optin-message = { -brand-short-name } 使用 AI 到读取那开始的那页和产生一个少数键点. 到按优先次序列出你的隐私, 这发生在你的装置.

# Onboarding card title for long press
link-preview-onboarding-title-long-press = 新的: 单击和保留任何的连接为了一个预览

# Onboarding card description for long press
link-preview-onboarding-description-long-press = 看见一个扼要描述, 阅读时间, 和更多到决定如果那连接是价值打开. 也可利用的在右-click.

# Header for the key points section
link-preview-key-points-header = 键点

# Disclaimer for AI-generated key points
link-preview-key-points-disclaimer = 键点是 AI-generated 和可以有错误( mistake的名词复数 ).

# Progress message for the first-time setup
# $progress (number) - The percentage value 1-100 indicating the progress of the setup.
link-preview-setup = 首先-time 设置• <strong>{ $progress }%</strong>

# Message indicating faster performance after initial setup
link-preview-setup-faster-next-time = (=you will 看见键点更多很快地近邻干扰时间.

# Onboarding card See a preview button
link-preview-onboarding-button = 看见一个预览

# Onboarding card Close button
link-preview-onboarding-close = 关闭

# Title for the first-time setup modal
link-preview-first-time-setup-title = 首先-time 设置

# Message for the first-time setup modal
link-preview-first-time-setup-message = 这可以采取一个片刻. (=you will 看见键点更多很快地近邻干扰时间.
