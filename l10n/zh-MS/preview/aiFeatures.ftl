# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

preferences-ai-controls-block-confirmation-smart-window = 智能窗口
smart-window-block-title = 是否阻止智能窗口？
smart-window-block-description-both = 此操作将删除您的智能窗口聊天记录和记忆。
smart-window-block-description-chats = 此操作将删除您的智能窗口聊天记录。
smart-window-block-description-memories = 此操作将删除您的智能窗口记忆。

ai-window-features-group =
    .label = 智能窗口
    .description = 通过内置助手提问、比较页面并获取个性化建议。

smart-window-select-label =
    .label = 智能窗口

ai-window-activate-link =
    .label = 开始使用

ai-window-personalize-button =
    .label = 智能窗口设置

ai-window-personalize-header =
    .heading = 智能窗口

ai-window-default-section =
    .label = 默认设置
ai-window-is-default-window =
    .label = 默认使用智能窗口
    .description = 当{-brand-short-name}启动、重新启动或从其他应用打开链接时，将启动智能窗口。
ai-window-open-sidebar =
    .label = 自动启动助手
    .description = 在每个新标签页上显示助手侧边栏。您可以随时将其关闭。
ai-window-smart-cursor-in-smart-window =
    .label = 选择文本时显示快捷方式
    .description = 快速访问摘要、解释等功能。

smart-window-model-section =
    .label = 助手模型
    .description = 根据您重视的内容选择模型。
smart-window-model-learn-link = 了解模型

## Variables:
##   $model (string) - The name of the AI model
##   $ownerName (String) - The name of owner of the AI model

smart-window-model-fast =
    .label = 快速：快速回答问题
    .description = 由{ $ownerName }提供的模型{ $model }
smart-window-model-flexible =
    .label = 灵活：适合大多数需求
    .description = 由{ $ownerName }提供的模型{ $model }
smart-window-model-personal =
    .label = 个性化：最贴切的回答
    .description = 由{ $ownerName }提供的模型{ $model }
smart-window-model-custom =
    .label = 自定义：使用您自己的LLM
smart-window-model-custom-name =
    .label = 模型名称
    .placeholder = 例如：glm4
smart-window-model-custom-url =
    .label = 模型端点
    .placeholder = 例如：http://localhost:11434/v1
smart-window-model-custom-token =
    .label = API密钥或认证令牌（如需要）
smart-window-model-custom-info =
    .message = 使用自定义模型时，智能窗口可能无法按预期工作。
smart-window-model-custom-more-link = 更多自定义模型信息
smart-window-model-custom-save =
    .label = 保存
smart-window-model-custom-save-confirmation = 模型详细信息已保存。启动新的聊天以进行测试。

ai-window-memories-section =
    .label = 记忆
    .description = {-brand-short-name}可以从您的活动中学习以创建记忆。这些记忆用于帮助个性化回应，并存储在此设备上。

ai-window-learn-from-chat-activity =
    .label = 从智能窗口中的聊天中学习

ai-window-learn-from-browsing-activity =
    .label = 从经典窗口和智能窗口的浏览活动中学习

ai-window-manage-memories-button =
    .label = 管理记忆

ai-window-manage-memories-header =
    .heading = 管理记忆
    .description = 记忆存储在此设备上以帮助保护您的隐私。当您使用智能窗口时，记忆会在一天内刷新数次，因此最近的活动可能需要一些时间才会反映在记忆中。

ai-window-no-memories =
    .label = 尚无记忆
    .description = 当智能窗口从您的活动中学习时，您将在此处看到记忆。

ai-window-no-memories-learning-off =
    .label = 无记忆可显示
    .description = 活动学习已关闭，因此智能窗口不会创建记忆。

ai-window-delete-all-memories-button =
    .label = 全部删除

ai-window-delete-all-memories-title = 是否删除所有记忆？
ai-window-delete-all-memories-message = 现有记忆将被删除。如果您不希望创建任何新记忆，请在智能窗口设置中取消选中“从…学习”选项。
ai-window-delete-all-memories-confirm = 删除
ai-window-delete-all-memories-cancel = 取消

# Variables:
#   $label (String) - The memory summary text that will be deleted
ai-window-memory-delete-button =
    .title = 删除记忆
    .aria-label = 删除{ $label }
