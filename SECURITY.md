# 安全策略

Vantage 基于 Firefox ESR，安全修复会随 ESR 更新同步。如果你发现安全问题，请先不要公开。

## 支持范围

- 仅支持最新发布的 Vantage 版本（当前 153.7 系列）
- 旧版本请先升级到最新版再复测

## 如何报告

优先使用 GitHub 的私密漏洞报告：

https://github.com/asystech-chen/Vantage/security/advisories/new

如果无法使用 GitHub，请通过官网 https://asystech.cn/ 的联系方式，并注明「安全报告」。

请不要用公开 issue 报告安全问题。

## 属于 Vantage 的范围

- Vantage 自有补丁、设置与构建脚本
- 安装包与更新机制（含 WinUpdater）
- 预装扩展与默认配置
- 因 Vantage 改动引入的问题

## 属于上游 Firefox 的范围

Firefox / Gecko 本身的问题请报告给 Mozilla：

https://www.mozilla.org/en-US/security/

如果问题只在 Vantage 出现，或由 Vantage 的补丁、配置引起，请报告给我们。

## 报告时请附上

- Vantage 版本、操作系统
- 复现步骤或最小示例
- 影响说明
- 如有，崩溃日志或截图

## 处理方式

- 3 个工作日内确认收到
- 评估后给出修复计划；修复发布前请勿公开细节
- 修复后按需在更新日志中说明
- 不提供漏洞赏金
- 可以署名致谢，也可以保持匿名
