# 巨硬翻译器（msz.jumern.cn）反向分析存档

> 来源：https://msz.jumern.cn/ 的 JS bundle（index-Ck1NBu3S.js，580KB）
> 提取日期：2026-08-11
> 用途：参考其 prompt 设计思路，**我们完全本地执行，不向其网站发送任何内容/API key**

## 技术结论

该网站本质是 LLM 套壳：
- 支持 DeepSeek / Kimi(月之暗面) / 智谱 GLM 三家 API（用户在网站上填自己的 key + endpoint + model）
- 默认模型：deepseek-v4-flash
- 有 intensity（mild/strong）和 mode（auto/zh2zh/en2zh）设置
- auto 模式用 `RE(text)` 检测输入中英文，再选对应 prompt

## 4 个 prompt 模板

矩阵：mode（zh2zh / en2zh）× intensity（mild / strong）

### IE = zh2zh + strong（2536 字符）
核心：7 大综合征
1. Terminology Worship 术语崇拜（打开→启动/初始化，点→单击，看→查看，找→定位/检索）
2. Passive Voice Dependency 被动语态依赖
3. Subject Evaporation 主语蒸发
4. "您" Inflation 您膨胀
5. Bureaucratic Expansion 官僚化膨胀（3 字想法扩到 15+ 字）
6. Ellipsis Ritual 省略号仪式（进行中操作必须以 …… 结尾）
7. Emotional Castration 情感阉割

诊断对照表：
- 请重启电脑 → 建议您重新启动您的计算机，以便使更改生效。
- 找不到文件 → 未能找到指定的文件。
- 点这里下载 → 单击此处以启动下载进程。
- 出错了 → 很抱歉，程序遇到了一个问题，需要关闭。我们对此引起的不便深表歉意。
- 我们更新了隐私政策 → 隐私政策已更新。

### _E = zh2zh + mild（966 字符）
8 特征列表 + 4 示例，无对照表。

### EE = en2zh + strong（3928 字符）
核心：8 大综合征（在 IE 基础上增加 Literal UI Translation 字面 UI 翻译）
1. Terminology Worship（Click→单击 never 点击，Open→启动/初始化，Close→终止/退出/关闭，Find→定位/检索/查找，Settings→设置）
2. Passive Voice Dependency（We updated→已更新，You don't have permission→不具备执行此操作的权限。）
3. Subject Evaporation（System is loading→正在加载...，We apologize→很抱歉）
4. "您" Inflation（英文没有 you 也要硬塞您）
5. Literal UI Translation（Home→主页 never 首页，Save→保存）
6. Bureaucratic Expansion（5 词 → 20 字，扩写 200-300%；Please wait→正在处理您的请求，请稍候...；Failed→操作未能成功完成。）
7. Ellipsis Ritual（半角 ...，因为微软爱 ASCII 艺术）
8. Emotional Castration（Oops!→发生错误。Great job!→操作已成功完成。）

翻译协议（8 步）：识别核心意义 → 选最正式的微软术语 → 主动转被动/无主语 → 扩写 200-300% → 至少插一次您 → 进行中加 ... → 移除人性 → 输出。

诊断对照表（Type A-G）：
- A 过度敬语：Please restart your computer. → 建议您重新启动您的计算机，以便使更改生效。
- B 被动羞耻盾：Password is wrong. → 您提供的凭据未能通过验证。
- C 术语替换：Click here to download. → 单击此处以启动下载进程。
- D 冗长冗余：Something went wrong. → 很抱歉，程序遇到了一个问题，需要关闭。我们对此引起的不便深表歉意。
- E 主语消失：We have updated the privacy policy. → 隐私政策已更新。
- F 字面 UI：Go to Home → 转到主页
- G 省略号仪式：Loading → 正在加载...

### zE = en2zh + mild（1255 字符）
8 特征 + 4 示例 + 逐词直译示范（Microsoft Edge→微软边缘浏览器，I love this application→我爱这个应用）。

## 页面文案（顺带提取）
- 建议您重新启动您的计算机，以便使更改生效。
- 很抱歉，程序遇到了一个问题，需要关闭。我们对此引起的不便深表歉意。

## 待办
- [ ] 写 Vantage 专用 prompt（EE 为基础 + 烂梗对照表 + ftl 占位符保护）
- [ ] 本地批量翻译脚本（读 en-US ftl → DeepSeek API → 输出 zh-MS ftl）
