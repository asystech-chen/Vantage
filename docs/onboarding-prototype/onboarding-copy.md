# Vantage 新手引导（about:onboarding）文案草案

- 版本：2026-10-31（第 3 稿：简化隐私、主题独立、扩展只介绍现有）
- 状态：**待桶哥审核**（确认后才写入源码与 Fluent）
- 范围：仅引导页；不含源码改动

## 全局

- 右上角：**跳过**
- 底部：步骤点（1–7）+ **返回** / **继续**
- 最后一屏主按钮：**完成**
- 文案原则：不替用户做决定；不用程度词。
- 配色：取自 `browser/themes/shared/vantage-theme.css`
  - 主色 `#3B82F6`，悬停 `#2563EB`，按下 `#1D4ED8`
  - 品牌渐变 `#3B82F6 → #0EA5A0 → #10B981`
  - 浅色文本 `#1A2B3C` / 次要 `#5A6B7C` / 背景 `#F8FAFC`
  - 深色文本 `#EBF4F5` / 次要 `#8FA8AE` / 背景 `#1D1B1F`

## 第 1 屏 — 欢迎

**标题**：欢迎使用 Vantage

**正文**：先花一分钟，把外观和常用功能设好。所有选项之后都能改。

**要点**

- 基于 Firefox ESR，更新稳定
- 默认开启跟踪保护，不收集数据
- 设置随时可改

## 第 2 屏 — 外观

**标题**：先让它看起来顺眼

**正文**：选一套自己喜欢的样子，所有选项都能随时改。

**选项**

1. **Vantage 主题**（开关，默认开）
   - 蓝系配色，工具栏、侧栏和菜单使用同一套颜色。
2. **界面风格**
   - Nova：Firefox 153 的新布局
   - Proton：经典布局
3. **颜色模式**
   - 跟随系统 / 浅色 / 深色
4. **工具栏密度**（默认普通）
   - 普通 / 紧凑（实验）/ 触摸

**主题商店引导**

- 卡片：**想换个样子？** 主题商店里有更多配色和背景，装上就是你的。
- 按钮：**浏览主题**（打开 addons.mozilla.org/firefox/themes/）

**动效**：每屏只做一次入场（淡入上浮）和离场（淡出上移），不做持续动画、浮动或装饰动效。

## 第 3 屏 — 自定义

**标题**：自定义你的旅途

**正文**：挑几个顺手的设置。这里只列常用的，更多在设置面板里。

**开关**

1. **多线程下载**（默认关）
   - 服务器支持分段时并行下载；不支持时自动回退为单线程。
2. **侧栏悬停弹出**（默认关）
   - 鼠标移到窗口左侧边缘时，自动弹出侧栏。
3. **Chromium 样式查找栏**（默认关）
4. **标签自动休眠**（默认开）
   - 内存紧张时休眠不活跃标签页，需要时再唤醒。
5. **自动检查更新**（默认开）
   - 启动后检查 Vantage 新版本，只提示，不自动安装。
6. **AI 侧栏**（默认关）
   - 在侧边栏打开 AI 聊天，支持 DeepSeek、Qwen、豆包、ChatGPT、Gemini 和 Claude。

**脚注**：完整列表在 [设置 → Vantage]。之后随时可以改。

## 第 4 屏 — 隐私（简化）

**标题**：隐私默认已经调好

**正文**：Vantage 默认使用严格跟踪保护，不需要你在级别之间选择。遇到网站因为保护而显示异常时，可以只对这个网站放宽。

**默认项**

- **严格保护（默认）**
  - 拦截已知跟踪器、跨站 Cookie、指纹脚本和挖矿脚本。不需要额外设置。

**开关**

1. **自动修复轻微的网站问题**（默认开）
   - 对已知会被跟踪保护弄坏的网站自动放宽，只影响这些站点，不改变全局保护级别。
2. **DNS over HTTPS（DoH）**（默认开）
   - 加密 DNS 查询。使用国内可用节点，故障时回退系统 DNS。

**脚注**：单个网站出问题时，点地址栏的盾牌图标，就能只对这个网站关闭保护。

## 第 5 屏 — 扩展

**标题**：扩展：两个已随附

**正文**：这两个扩展默认启用，可以在扩展管理器里停用。其他扩展去商店自己装。

**已随附（默认启用）**

1. **I still don't care about cookies**
   - 自动处理 Cookie 同意提示。
2. **Re-enable right click**
   - 强制允许无法右键和复制的网页进行复制。

**商店**

3. **扩展商店**
   - 其他扩展都在这里。装在 Vantage 里的扩展与 Firefox 通用。[打开扩展商店]

**脚注**：扩展的权限、更新和停用都在 [扩展管理器] 里统一管理。

## 第 6 屏 — 导入与默认

**标题**：最后两件事

**正文**：需要的话，把旧浏览器里的书签、密码和历史带过来；也可以让 Vantage 成为默认浏览器。

**选项**

1. **从其他浏览器导入**
   - 书签、密码、历史、扩展和设置。[导入…] 打开迁移向导。
2. **设为默认浏览器**
   - 打开网页链接时优先使用 Vantage。（开关，默认关）

**脚注**：这两项之后都能在「设置 → 常规」里重新操作。

## 完成态

**标题**：设置完成
**正文**：随时可以在「设置 → 常规」里重新打开这个引导。
**按钮**：关闭 / 打开新标签页

## 实现映射（供后续接源码）

| 控件 | 行为 |
| --- | --- |
| Vantage 主题开关 | `vantage.theme.enabled`（bool） |
| 界面风格 Nova / Proton | `browser.nova.enabled`（bool） |
| 颜色模式 浅色 / 深色 / 跟随系统 | `browser.theme.toolbar-theme` = 1 / 0 / 2；`browser.theme.content-theme` = 1 / 0 / 2；`layout.css.prefers-color-scheme.content-override` = 1 / 0 / 2（int） |
| 工具栏密度 普通 / 紧凑 / 触摸 | `browser.uidensity` = 0 / 1 / 2（int）；紧凑项可见性 `browser.compactmode.show = true` |
| 多线程下载 | `vantage.download.multithread`（bool） |
| 侧栏悬停弹出 | `vantage.sidebar.hover-autohide.enabled`（bool） |
| Chromium 样式查找栏 | `vantage.findbar.topright`（bool） |
| 标签自动休眠 | `browser.tabs.unloadOnLowMemory`（bool） |
| 自动检查更新 | `vantage.updateCheck.enabled`（bool） |
| AI 侧栏 | `browser.ml.chat.enabled`（bool，Vantage 默认 false） |
| 自动修复网站问题 | `privacy.trackingprotection.allow_list.baseline.enabled` + `...convenience.enabled`（bool） |
| DoH | `network.trr.mode`（2 优先 / 5 仅 DoH / 0 关闭） |
| 主题商店 / 扩展商店 | 打开 addons.mozilla.org |
| 从其他浏览器导入 | 打开迁移向导（`MigrationUtils` / migration-wizard） |
| 设为默认浏览器 | `ShellService.setDefaultBrowser()` |
| 完成 | 写入 `vantage.onboarding.done = true`，关闭当前标签页 |

## 待确认

- 6 屏顺序：欢迎 → 外观（含主题与主题商店）→ 自定义 → 隐私 → 扩展 → 导入与默认
- 隐私屏去掉了三档选择，只保留「自动修复轻微的网站问题」和 DoH，是否合适
- 扩展屏只介绍现有两个，不推荐其他扩展，交由商店，是否合适
- 功能开关这 6 项是否合适，要不要增减
- README 第 80 / 103 行的「不预装捆绑扩展」与新口径不一致，待确认后修改
- 语言：en-US / en-CA / en-GB / zh-CN / zh-TW（不做 zh-MS）
