# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Generative AI (GenAI) Settings section

genai-settings-chat-chatgpt-links = 选择 ChatGPT 即表示您同意 OpenAI 的<a data-l10n-name="link1">使用条款</a>及<a data-l10n-name="link2">隐私政策</a>。
genai-settings-chat-claude-links = 选择 Anthropic Claude 即表示您同意 Anthropic 的<a data-l10n-name="link1">消费者服务条款</a>、<a data-l10n-name="link2">使用政策</a>及<a data-l10n-name="link3">隐私政策</a>。
genai-settings-chat-copilot-links = 选择 Copilot 即表示您同意<a data-l10n-name="link1">Copilot AI 体验条款</a>及<a data-l10n-name="link2">巨硬隐私声明</a>。
genai-settings-chat-gemini-links = 选择 Google Gemini 即表示您同意<a data-l10n-name="link1">Google 服务条款</a>、<a data-l10n-name="link2">生成式 AI 禁止使用政策</a>及<a data-l10n-name="link3">Gemini 应用隐私通知</a>。
genai-settings-chat-huggingchat-links = 选择 HuggingChat 即表示您同意<a data-l10n-name="link1">HuggingChat 隐私通知</a>及<a data-l10n-name="link2">Hugging Face 隐私政策</a>。
genai-settings-chat-lechat-links = 选择 Le Chat Mistral 即表示您同意 Mistral AI 的<a data-l10n-name="link1">服务条款</a>及<a data-l10n-name="link2">隐私政策</a>。
genai-settings-chat-localhost-links = 请携带您自行拥有的本地私有聊天机器人，例如来自 { -vendor-short-name } 创新部门的 <a data-l10n-name="link1">llamafile</a>。

## Chatbot prompts
## Prompts are plain language ‘instructions’ sent to a chatbot.
## These prompts have been made concise and direct in English because some chatbot providers
## have character restrictions and being direct reduces the chance for misinterpretation.
## When localizing, please be concise and direct, but not at the expense of losing meaning.

# This prompt is added to the beginning of selection prompts sent to a chatbot.
# $tabTitle (string) - title of the webpage
# $selection (string) - selected text
genai-prompt-prefix-selection = 我正在页面“{ $tabTitle }”上，且已选定“{ $selection }”。

# Prompt purpose: help users understand what a selection covers at a glance
genai-prompts-summarize =
    .label = 摘要
    .value = 请使用精确且简洁的语言为您概括选定内容。请在摘要中使用标题及项目符号列表，以便于扫描阅读。请保持原意及事实准确性。
# Prompt purpose: make a selection easier to read
genai-prompts-simplify =
    .label = 简化语言
    .value = 请使用短句及简单词汇为您重写选定内容。请保持原意及事实准确性。
# Prompt purpose: test understanding of selection in an interactive way
genai-prompts-quiz =
    .label = 测验我
    .value = 请就选定内容对您进行测验。请提出多种类型的问题，例如选择题、判断题及简答题。在您作答完毕之前，请等待您的回应后再进入下一题。
# Prompt purpose: helps users understand words, phrases, concepts
genai-prompts-explain =
    .label = 解释此项
    .value = 请使用简单词汇为您解释选定内容中的关键概念。同时，请提供示例。
# Prompt purpose: writing tool that helps users with spelling and grammar mistakes and produce a response that identifies errors and rewrites the inputted text correctly
genai-prompts-proofread =
    .label = 校对
    .value = 请为您校对选定内容中的拼写及语法错误。请指出任何错误并提供更正后的文本版本。请保持原意及事实准确性，并先输出建议更正列表，随后输出最终的更正后文本版本。

## Chatbot menu shortcuts

genai-menu-no-provider-2 =
    .label = 询问 AI 聊天机器人
    .accesskey = z
genai-menu-choose-chatbot =
    .label = 选择 AI 聊天机器人
genai-menu-ask-generic-2 =
    .label = 询问 AI 聊天机器人
    .accesskey = z
# $provider (string) - name of the provider
genai-menu-ask-provider-2 =
    .label = 询问 { $provider }
    .accesskey = z
genai-menu-open-generic =
    .label = 启动 AI 聊天机器人
# $provider (string) - name of the provider
genai-menu-open-provider =
    .label = 启动 { $provider }
genai-menu-remove-generic =
    .label = 移除 AI 聊天机器人
# $provider (string) - name of the provider
genai-menu-remove-provider =
    .label = 移除 { $provider }
genai-menu-remove-sidebar =
    .label = 从侧边栏移除
# $provider (string) - name of the AI chat provider
genai-shortcut-button =
    .aria-label = 询问 { $provider }

genai-menu-new-badge = 新建
genai-menu-summarize-page = 摘要页面

genai-input-ask-generic =
    .placeholder = 询问 AI 聊天机器人…
# $provider (string) - name of the provider
genai-input-ask-provider =
    .placeholder = 询问 { $provider }…

# $selectionLength (number) - selected text length
# $maxLength (number) - max length of what can be selected
genai-shortcuts-selected-warning-generic =
    .heading = AI 聊天机器人将无法获取您的完整选定内容
    .message = { $selectionLength ->
        *[other] 您已选定约 { $selectionLength } 个字符。您可以发送至 AI 聊天机器人的字符数约为 { $maxLength }。
    }
# $provider (string) - name of the provider
# $selectionLength (number) - selected text length
# $maxLength (number) - max length of what can be selected
genai-shortcuts-selected-warning =
    .heading = { $provider } 将无法获取您的完整选定内容
    .message = { $selectionLength ->
        *[other] 您已选定约 { $selectionLength } 个字符。您可以发送至 { $provider } 的字符数约为 { $maxLength }。
    }
genai-shortcuts-hide =
    .label = 隐藏聊天机器人快捷方式

## Chatbot header

genai-chatbot-title = AI 聊天机器人
genai-header-provider-menu =
    .title = 选择聊天机器人
genai-header-settings-button =
    .title = AI 聊天设置
genai-header-close-button =
    .title = 关闭

genai-provider-view-details =
    .label = 查看聊天机器人详情
genai-options-reload-generic =
    .label = 重新加载 AI 聊天机器人
# $provider (string) - name of the provider
genai-options-reload-provider =
    .label = 重新加载 { $provider }
genai-options-show-shortcut =
    .label = 选择文本时显示快捷方式
genai-options-hide-shortcut =
    .label = 选择文本时隐藏快捷方式
genai-options-about-chatbot =
    .label = 了解 { -brand-short-name } 中的 AI 聊天机器人

## Chatbot message

genai-page-warning =
    .message = 由于页面内容较长，此为部分摘要。

## Chatbot footer

genai-page-button-summarize = 摘要页面

## Chatbot onboarding

genai-chatbot-summarize-title = 新功能！一键摘要页面
genai-chatbot-summarize-button = 摘要页面

# “Summarize Page” should be consistent with the translation for the string genai-menu-summarize-page
genai-chatbot-summarize-sidebar-provider-subtitle = 请右键单击侧边栏中的 AI 聊天机器人，然后选择“摘要页面”。
# “Summarize Page” should be consistent with the translation for the string genai-menu-summarize-page
genai-chatbot-summarize-sidebar-generic-subtitle = 请右键单击侧边栏中的闪光按钮，然后选择“摘要页面”。首次使用时，您还需要选择一个 AI 聊天机器人。

# “Summarize page” should be consistent with the translation for the string genai-page-button-summarize
genai-chatbot-summarize-footer-provider-subtitle = 请在侧边栏中启动您的 AI 聊天机器人，然后选择底部的“摘要页面”。
genai-chatbot-summarize-footer-generic-subtitle = 请向 { -brand-short-name } 侧边栏添加 AI 聊天机器人，以便快速摘要页面。

genai-chatbot-contextual-title = 无需切换标签页即可使用 AI 聊天机器人
genai-chatbot-contextual-subtitle = 当您在 { -brand-short-name } 侧边栏中添加 AI 聊天机器人后，可并排进行聊天和浏览。
genai-chatbot-contextual-button = 选择聊天机器人

genai-onboarding-choose-header = 请选择要在 { -brand-short-name } 侧边栏中使用的 AI 聊天机器人
# "Switch anytime" refers to allowing the user to switch to a different chatbot.
genai-onboarding-choose-description = 您可以随时切换。如需帮助选择，<a data-l10n-name="learn-more">请了解每个聊天机器人的更多信息</a>。
genai-onboarding-primary = 继续
genai-onboarding-secondary = 关闭
genai-onboarding-deepseek-tooltip =
    .label = 请向 DeepSeek 询问以缩短、简化或摘要内容
genai-onboarding-qwen-tooltip =
    .label = 请向 Qwen 询问以缩短、简化或摘要内容
genai-onboarding-doubao-tooltip =
    .label = 请向 豆包 询问以缩短、简化或摘要内容
genai-onboarding-claude-tooltip =
    .title = Anthropic Claude
genai-onboarding-chatgpt-tooltip =
    .title = ChatGPT
genai-onboarding-copilot-tooltip =
    .title = Copilot
genai-onboarding-gemini-tooltip =
    .title = Google Gemini
genai-onboarding-huggingchat-tooltip =
    .title = HuggingChat
genai-onboarding-lechat-tooltip =
    .title = Le Chat Mistral

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
        [one] { $range } 分钟阅读时间
       *[other] { $range } 分钟阅读时间
    }

# Error message displayed when a link preview cannot be generated
link-preview-error-message-v2 = { -brand-short-name } 无法预览此链接

# Text for the link to visit the original URL when in error state
link-preview-visit-link = 访问链接

# Error message when key points generation (summary highlights or main ideas of page content) fails for a page
link-preview-generation-error-missing-data-v2 = { -brand-short-name } 无法为此网页生成关键要点。

# Error message when something went wrong during key point generation
link-preview-generation-error-unexpected = 发生错误。

# Text for the retry link when generation fails
link-preview-generation-retry = 重试

# Button that opens the Link Preview settings
link-preview-settings-button =
    .title = 链接预览设置

link-preview-settings-enable =
    .label = 启用链接预览
    .description = 当您使用快捷方式或右键单击链接时，可查看页面标题、描述等信息。
link-preview-settings-key-points =
    .label = 允许 AI 读取页面开头并生成关键要点
link-preview-settings-long-press =
    .label = 快捷方式：单击并按住链接 1 秒（长按）

# Title that appears when user is shown the opt-in flow for link previews
link-preview-optin-title = 您是否希望通过 AI 查看更多信息？

# Message that appears when user is shown the opt-in flow for link previews
link-preview-optin-message = { -brand-short-name } 使用 AI 读取页面开头并生成若干关键要点。为优先保护您的隐私，此操作将在您的设备上完成。

# Onboarding card title for long press
link-preview-onboarding-title-long-press = 新功能：单击并按住任何链接即可预览
# Onboarding card description for long press
link-preview-onboarding-description-long-press = 您将看到简短的描述、阅读时间以及其他信息，以便您决定该链接是否值得打开。此功能同样适用于右键单击。

# Header for the key points section
link-preview-key-points-header = 关键要点

# Disclaimer for AI-generated key points
link-preview-key-points-disclaimer = 关键要点由AI生成，可能存在错误。

# Progress message for the first-time setup
# $progress (number) - The percentage value 1-100 indicating the progress of the setup.
link-preview-setup = 首次设置 • <strong>{ $progress }%</strong>

# Message indicating faster performance after initial setup
link-preview-setup-faster-next-time = 您将在下次更快地看到关键要点。

# Onboarding card See a preview button
link-preview-onboarding-button = 查看预览

# Onboarding card Close button
link-preview-onboarding-close = 关闭

# Title for the first-time setup modal
link-preview-first-time-setup-title = 首次设置

# Message for the first-time setup modal
link-preview-first-time-setup-message = 此操作可能需要一些时间。您将在下次更快地看到关键要点。
