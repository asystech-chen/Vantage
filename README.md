# Vantage 浏览器

> **隐私 · 快速 · 易用**

[![Download](https://img.shields.io/badge/下载-最新版-blue?style=for-the-badge)](https://asystech.cn/pc/vdownload.html)
[![License](https://img.shields.io/badge/许可证-MPL--2.0-green?style=for-the-badge)](LICENSE)
[![GitHub](https://img.shields.io/badge/GitHub-源码-181717?style=for-the-badge&logo=github)](https://github.com/asystech-chen/Vantage)

# 软件截图
![10LTSC-2026-03-14-14-34-51.png](./_resources/10LTSC-2026-03-14-14-34-51.png)


---

## 📋 目录

- [什么是 Vantage？](#-什么是-vantage)
- [🗺️ 路线图](#-路线图)
- [✨ 核心特性](#-核心特性)
- [🖥️ 系统要求](#️-系统要求)
- [📦 安装指南](#-安装指南)
- [⚙️ 配置与使用](#️-配置与使用)
- [🤝 贡献指南](#-贡献指南)
- [❓ 常见问题](#-常见问题)
- [📄 许可证](#-许可证)
- [🔗 相关链接](#-相关链接)

---

## 🗺️ 路线图

### 🔄 迁移至 ESR 通道

Vantage 目前跟随 Firefox Release 通道（每 4 周发布一个版本），合并维护成本较高。我们计划在未来迁移至 **Firefox ESR（Extended Support Release）** 通道：

- **更稳定**：ESR 每年仅发布一个大版本，期间只合入安全修复
- **更低维护成本**：大幅降低上游频繁变更带来的补丁适配工作量
- **API 稳定**：autoconfig、扩展及系统集成接口不会频繁变动
- **预计时间**：下一轮 Firefox ESR 发布后评估迁移（约 2026 Q4）

### ✨ 新功能计划

| 优先级 | 功能 | 实现方式 | 状态 |
|:---:|---|------|:---:|
| 🔥 | 滚轮切换标签页 | `toolkit.tabbox.switchByScrolling` pref | 待加入 |
| 🔥 | 双击关闭标签页 | `browser.tabs.closeTabByDblclick` pref | 待加入 |
| 🔥 | 地址栏回车新标签页 | `browser.urlbar.openintab` pref | 待加入 |
| 🔥 | 书签新标签页打开 | `browser.tabs.loadBookmarksInTabs` pref | 待加入 |
| 🔥 | 搜索新标签页打开 | `browser.search.openintab` pref | 待加入 |
| 🔥 | Ctrl+Tab 最近使用优先 | `browser.ctrlTab.sortByRecentlyUsed` pref | 待加入 |
| 🛠 | 复制为 Markdown 链接 | 右键菜单扩展 | 计划中 |
| 🛠 | 右键关闭标签页 | CSS 注入 | 计划中 |
| 💭 | 下载完成提示音 | autoconfig observer | 评估中 |

---

## 🔍 什么是 Vantage？

**Vantage** 是一款由 **ASYS 科技** 深度定制的 Firefox 浏览器，基于 LibreWolf 代码实现，专注于**隐私 · 快速 · 易用**。

> ⚠️ Vantage 与 LibreWolf 或 Mozilla 官方无任何隶属关系或商业合作。

我们的目标：在保留 Firefox 强大扩展生态的同时，为用户提供开箱即用的隐私增强体验，摆脱追踪、遥测与不必要的干扰。

---

## ✨ 核心特性

| 特性 | 说明 |
|------|------|
| 🖥️ **多架构支持** | 支持 x86_64 (Windows / Linux) 及 LoongArch64 (Linux)，国产芯片原生适配 |
| 🤖 **AI 侧栏** | 内置 DeepSeek / 通义千问 / 豆包 AI 助手，侧栏即开即用 |
| 🚫 **无遥测** | 完全禁用 Firefox 遥测、实验功能、广告推送及数据收集模块 |
| 🛡️ **隐私加固** | RFP 指纹保护、WebRTC 防泄露、强制 HTTPS、预装 uBlock + 可选隐私扩展 |
| ⚙️ **专属设置** | `about:preferences#vantage` 面板，一键管理更新检查、AI、隐私与安全策略 |
| 🔍 **灵活搜索** | 默认 Bing，支持一键切换百度、谷歌、DuckDuckGo 等引擎 |
| 🔄 **跨端同步** | 支持 Mozilla 账号同步书签、扩展（可选启用） |
| 🔓 **开源透明** | 全部源码公开，MPL-2.0 许可证，欢迎审计与贡献 |

---

## 🖥️ 系统要求

### Windows
- **操作系统**：Windows 10 / 11 (64 位)
- **处理器**：x64 兼容处理器
- **内存**：≥ 4 GB RAM
- **存储**：≥ 500 MB 可用空间
- **显卡**：支持 DirectX 11 的 GPU（硬件加速）

### Linux
- **x86_64**：大多数主流发行版（Debian / Ubuntu / Fedora / Arch 等）
- **LoongArch64**：龙芯 3A6000+ 及兼容处理器，支持 Debian Ports / Arch Linux
- **依赖库**：安装包已包含常见依赖

### macOS
> 📋 macOS 版本列入未来适配计划

---

## 📦 安装指南

### Windows 用户
1. 访问官网下载页面：[https://asystech.cn/pc/vantage.html](https://asystech.cn/pc/vantage.html)
2. 下载安装包
3. 双击运行，按向导完成安装
4. 启动 Vantage，开始隐私浏览之旅 ✨

### Linux 用户

Debian、Ubuntu等使用APT包管理器的Linux发行版
```bash
cd ~
wget https://asystech.cn/vantage/vantage-latest.deb #通过官网下载（推荐）
wget https://github.com/asystech-chen/Vantage/releases/latest/download/vantage_latest_amd64.deb #通过GitHub下载

sudo apt update
sudo apt install -y ./vantage_latest_amd64.deb

```

Rocky等RHEL发行版
```bash
cd ~
wget https://github.com/asystech-chen/Vantage/releases/latest/download/vantage_latest.x86_64.rpm #通过GitHub下载

sudo dnf install -y ./vantage_latest.x86_64.rpm

```

其他发行版：使用AppImage包
```bash
cd ~
wget https://github.com/asystech-chen/Vantage/releases/latest/download/vantage_latest.x86_64.AppImage
chmod +x vantage_latest.x86_64.AppImage
./vantage_latest.x86_64.AppImage
```


# 方式二：使用压缩包手动安装
```bash
tar -xjf Vantage-linux-x86_64.tar.bz2 -C /opt/
ln -s /opt/vantage/vantage /usr/local/bin/vantage
```



---

## ⚙️ 配置与使用

### 首次启动建议
- ✅ 访问 `about:preferences#vantage` 了解 Vantage 专属设置（更新检查、AI 侧栏、隐私策略等）
- ✅ 检查 `about:preferences#privacy` 中的隐私设置
- ✅ 根据需要启用/禁用 Mozilla 同步功能
- ✅ 安装常用扩展（Vantage 兼容 Firefox 扩展商店）

### 高级配置（about:config）
> ⚠️ 修改前请备份配置，不当设置可能影响浏览器稳定性

```ini
# 示例：进一步禁用遥测（默认已禁用，供参考）
datareporting.healthreport.uploadEnabled = false
toolkit.telemetry.enabled = false
browser.ping-centre.telemetry = false

# 示例：增强 DNS over HTTPS
network.trr.mode = 3
network.trr.uri = "https://mozilla.cloudflare-dns.com/dns-query"
```

### 快捷键速查
| 快捷键 | 功能 |
|--------|------|
| `Ctrl+Shift+I` | 打开 AI 侧栏（DeepSeek / Qwen / 豆包） |
| `Ctrl+Shift+P` | 打开隐私浏览窗口 |
| `Ctrl+Shift+Delete` | 快速清除浏览数据 |
| `Ctrl+L` | 聚焦地址栏 |
| `F11` | 全屏模式 |



---

## 🤝 贡献指南

我们欢迎任何形式的贡献！🎉

### 你可以：
- 🐛 提交 Bug 报告（请附复现步骤与环境信息）
- 💡 提出新功能建议
- 🔧 提交 Pull Request 修复问题或增强功能
- 🌍 帮助翻译本地化内容
- 📝 完善文档与使用教程

### 贡献流程
1. Fork 本仓库
2. 创建特性分支：`git checkout -b feat/your-feature`
3. 提交更改：`git commit -am 'feat: 添加 XXX 功能'`
4. 推送分支：`git push origin feat/your-feature`
5. 发起 Pull Request

> 📌 请确保代码符合 [Mozilla 代码规范](https://firefox-source-docs.mozilla.org/code-quality/)，并通过基础测试。

---

## ❓ 常见问题

**Q: Vantage 和 Firefox / LibreWolf 有什么区别？**  
A: Vantage 基于 LibreWolf 代码基线，由 ASYS 科技针对中文用户习惯与隐私需求进行二次定制，预置更适合本地使用的搜索与拦截策略。

**Q: 扩展兼容吗？**  
A: ✅ 完全兼容 Firefox 扩展商店（addons.mozilla.org）中的扩展，可直接安装使用。

**Q: 同步功能会泄露隐私吗？**  
A: 同步功能默认关闭。如启用，数据将通过 Mozilla 服务器加密传输，我们不会额外收集同步内容。

**Q: 如何反馈问题？**  
A: 请通过 [GitHub Issues](https://github.com/asystech-chen/Vantage/issues) 提交，或访问官网联系客服。

---

## 📄 许可证

Vantage 浏览器主体代码遵循 **Mozilla Public License 2.0** 开源。  
部分预置扩展与资源遵循其各自许可证

> 📜 本软件按「原样」提供，不提供任何明示或暗示的担保。

---

## 🔗 相关链接

- 🌐 官网：[https://asystech.cn/vantage](https://asystech.cn/vantage)
- 💻 源码：[GitHub - ASYS-Tech/Vantage](https://github.com/asystech-chen/Vantage)
- 🐛 问题反馈：[Issues](https://github.com/asystech-chen/Vantage/issues)
- 📚 Firefox 文档：[MDN Web Docs](https://developer.mozilla.org/)

---

> 感谢 Mozilla、LibreWolf 社区及所有开源贡献者！  


