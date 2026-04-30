# Vantage Browser 更新日志

## v150.0-1 — 2026-04-30

### ⬆️ Firefox 150 上游升级

- **升级至 Firefox 150.0** — 同步 Mozilla 上游最新安全修复与功能更新
- **合并 LibreWolf 150.0-1 安全增强**（13 项配置 + 2 个新 patch）
- **移除已废弃 patches**：
  - `backport-build-fixes-from-150.patch` — 上游源码已原生包含
  - `bootstrap.patch` — 文件路径已不存在
  - `flatpak-autoconf.patch` — 上游已原生支持
- **更新适配 patches** 以匹配 Firefox 150 新文件结构：
  - `privacy-preferences.patch` — 移除已在主代码中的 hunk
  - `webgl-permission.patch` — 移除尾随逗号修复（已存在）
  - `vantage-privacy-dashboard.patch` — 完全重新生成
  - 同步上游 patches：`rust-build`、`autoconfig-setEnv`、`moz-official`、`trustpanel`

### 🎨 隐私仪表板重构

- **`about:protections` 完全重写** — 适配 Firefox 150 新结构
- **统计卡片** — 展示已阻止的 Trackers / Cookies / Fingerprinters / Cryptominers / Social Trackers 数量
- **保护状态面板** — 显示每项保护的启用/禁用状态（绿色/红色指示器）
- **ETP 图表** — Enhanced Tracking Protection 趋势图
- **移除冗余组件**：VPN Banner、Mobile Hanger、Monitor Card、Lockwise Card、Proxy Card、VPN Card

### 🔧 Pref-Pane 后端修复

- **修复 checkbox 同步问题** —— `setBoolSyncListeners` / `setSyncListeners` 监听循环从 `i=1` 改为 `i=0`
  - 影响范围：更新检查开关、IPv6 开关、同步开关等单 pref checkbox
  - 修复前：配置修改无法保存到 `about:config`
- **WebGL 设置**：`get/set` 使用 `value.value = !value`
- **IPv6 设置**：同 WebGL 修复
- **Cross-Origin Referrers**：`get` 正确判断 `value == 2`

### 🔐 安全增强（来自 LibreWolf 150.0-1）

**新增 Patches：**

- `limit-access.patch` — 限制网页访问 `chrome://branding/` 资源，防止通过 branding 进行浏览器指纹识别
- `rust-build.patch` — Rust 编译修复

**新增配置（settings/librewolf.cfg）：**

- **HTTPS 增强**：自动升级本地连接、提示不安全重定向
- **DoH 隐私**：使用 POST 方法（代替 GET）进行 DoH 查询
- **OCSP 禁用**：减少隐私泄露（已有 CRLite 补偿）
- **企业根证书禁用**：防止企业/杀毒软件中间人攻击
- **TLS 强化**：禁用 0-RTT（防重放攻击）、禁用弱加密套件
- **证书固定强化**：`cert_pinning.enforcement_level = 2`
- **CRLite 启用**：`crlite_filters.enabled = true`、`crlite_mode = 2`

### 🏗️ Android 源码引入

- **添加 IronFox Android 源码**（来自 `codeberg.org/ironfox-oss/IronFox`）
  - 完整的 Android 构建系统：Dockerfile、build/CI 脚本、Gradle 配置
  - 工程源码：定制版 Fenix（前端）+ Android Components + GeckoView
  - 全面的隐私 patches：去 Mozilla 遥测/同步/Nimbus/崩溃上报/Glean
  - 多架构支持：arm / arm64 / x86_64
  - 20+ 语言本地化
- 为后续 Vantage Android 版本做准备

### 🪟 Windows 平台改进

- **新增 `installer-publisher.patch`** — 设置 NSIS 安装器的 Publisher 名称为 Vantage
- **新增 `installer-locale.patch`** — 优先读取 zh-CN locale 目录，安装器界面中文化
- **修复 `policies.json`** — 修复 JSON 语法错误、ID 重复、结构错误
- **NSIS 卸载器增强** — 移除 Mozilla 调查问卷，卸载后询问是否清理用户数据
- **新增构建配置**：
  - `assets/mozconfig.win-cross` / `mozconfig.win-cross.msvc` — 完整 Windows 交叉编译配置
  - `assets/mozconfig.win-cross.new` / `mozconfig.win-cross.old` — 新旧版配置存档

### 🍎 macOS 交叉编译

- **x86_64 首次成功** — 产物通过 Rosetta 2 在 Apple Silicon MacBook Pro 真机测试
- **ARM64 工具链就绪** — `assets/mozconfig.osx-cross-arm64` 配置已创建
- 新增 patch：`macos-sdk-version.patch`、`dmg-fix-permissions.patch`

### ⚙️ 功能改进

- **更新检查**：移除 24 小时间隔限制，改为**每次启动时检查**
- **about:debugging 按钮恢复** — pref-pane 面板中恢复显示
- **默认固定扩展** — 截图工具等固定到工具栏
- **移除 Tampermonkey 默认安装**
- **修复扩展 ID** — `{b184d107-461b-4cfe-b4ba-771406e90c48}` 正确配置
- **新增默认图标尺寸** — `default22.png`、`default24.png`、`default256.png`

### 🇨🇳 本地化更新

- **隐私仪表板 l10n** — en-US / zh-CN / zh-TW 均添加 `vantage-dashboard-*` 翻译
- **安装器 l10n** — zh-CN / zh-TW NSIS 翻译通过 `.inc.properties` 追加
- **aboutDialog 更新** — 完善品牌链接文字

### 📦 打包改进

- **ARM64 Linux 打包支持** — AppImage / deb / rpm / portable tar.gz
- **新增 `build-fix-libc++.patch`** — 修复 libc++ 链接问题
- 完善 `Makefile`，新增 `package-all` 目标
- 新增 `migrate.bat` — Windows 用户数据迁移脚本

---

## v149.0-2 — 2026-04-03

### 🤖 AI 侧边栏（实验功能）

- **新增 AI 侧边栏** — 基于 Firefox 149 GenAI 组件，默认关闭
- **Provider 列表**：DeepSeek、Qwen（国际版 chat.qwen.ai）、豆包、ChatGPT、Gemini、Claude
- 移除不需要的 Provider：Ollama、Copilot、HuggingChat、Le Chat Mistral
- 国产 AI 不支持 `autoSubmit`，切换到国产 Provider 时**自动隐藏摘要按钮**
- **Onboarding 选择页面图标修复** — 为所有 Provider（含国产）添加品牌图标显示
- **设置页开关** — about:preferences Vantage 页面可勾选启用/禁用 AI 侧边栏
  - 同时控制 `browser.ml.chat.enabled` 和 `browser.ai.control.sidebarChatbot`
  - 修复 `lockPref` 导致开关无效的问题（改为 `defaultPref`）
- 新增品牌 SVG 图标：`deepseek-color.svg`、`qwen-color.svg`、`doubao-color.svg`
- l10n：en-US / zh-CN / zh-TW 均已添加 AI 侧边栏相关翻译

### 🍎 macOS 交叉编译

- **x86_64 首次成功** — 产物 `vantage-149.0-2.en-US.mac.dmg` (131MB)
- 编译耗时约 13 分钟（192 核 251GB RAM）
- 工具链：clang 21 + osxcross cctools + macOS 26.1 SDK + hfsplus-tools + libdmg-hfsplus
- 新增 patch：
  - `macos-sdk-version.patch` — SDK 版本要求 26.2→26.1
  - `dmg-fix-permissions.patch` — DMG 打包前自动修复 Mach-O 文件执行权限
- 新增 `assets/mozconfig.osx-cross` — 完整 macOS x86_64 交叉编译配置
- 真机测试通过（Apple Silicon MacBook Pro macOS 26.3，Rosetta 2）
- **ARM64 工具链就绪** — `assets/mozconfig.osx-cross-arm64` 已创建

### 🔧 设置面板修复

- **底部链接修复** — `about:config` 和 `about:support` 链接改为纯 HTML `<a href>` 实现
  - 原因：`setEventListener` 是 `main.js`/`privacy.js` 的局部函数，`librewolf.js` 作用域不可见
  - 链接在新标签页打开（`target="_blank"`）
- "打开用户配置文件目录" → "故障排除信息 (about:support)"，与 about:config 链接风格统一
- AI 侧边栏复选框缺失文字 → 添加 `vantage-ai-heading`/`vantage-ai-checkbox`/`vantage-ai-description` 三个 l10n id

### 🏗️ NSIS 卸载器改进

- 移除 Mozilla 卸载调查问卷
- 卸载完成后弹窗询问是否清理用户数据（`%APPDATA%\Vantage\`、注册表等）
- 通过 `.inc.properties` 追加模式添加翻译，避免覆盖完整 locale 文件

### 🌐 NSIS 安装器中文化（进行中）

- `patches/installer-locale.patch` — 修改 `PPL_LOCALE_ARGS` 优先读取 zh-CN locale 目录
- Patch 能干净应用（fuzz 1），完整构建验证待完成

---

## v149.0-2 — 2026-03-31 (初始版本)

### 🔐 隐私与数据隔离

- **独立的配置文件路径** — 完全与 Firefox/LibreWolf 隔离
  - Windows: `%APPDATA%\Vantage\vantage\`
  - Linux: `~/.vantage/`
  - macOS: `~/Library/Application Support/Vantage/`
- **独立的 overrides 配置** — `vantage.overrides.cfg` 不再与 LibreWolf 冲突

### 🪟 Windows 平台修复

- 修复 Windows 主题加载问题（exe manifest 重命名为 `vantage.exe.manifest`）
- 提供用户数据迁移工具 `scripts/migrate-profile-win.py`（从 LibreWolf 迁移至 Vantage）

### 🌐 本地化改进

- **简体中文** — 补全 WebGL 权限相关翻译：
  - `permissions.inc.ftl`
  - `browser.inc.ftl`
  - `preferences.inc.ftl`
  - `browser.inc.properties`
  - `sitePermissions.inc.properties`
- **繁体中文** — 同步更新并检查翻译一致性

### ⚙️ 功能改进

- **恢复"设为默认浏览器"选项** — 移除 `hide-default-browser.patch`，默认禁用检查提示
- **自动更新检查** — 后台每 24 小时检查一次，支持忽略特定版本
- **设置面板新增"更新"区块** — 可手动启用/禁用更新检查 (`vantage.updateCheck.enabled`)
- **修复 pref-pane 按钮行为** — `about:config` 用可信链接打开，"打开配置目录"直接定位文件

### 🔧 品牌与构建

- 完整品牌替换（Firefox → Vantage，LibreWolf → Vantage）
- 修复关于对话框下载链接大小写问题
- 支持页面 URL 指向 Mozilla 官方支持
- 新增 `scripts/rebrand.sh` / `rebrand.ps1` — 合并上游后一键替换品牌
- 清理 `assets/patches.txt` 空行

### 📦 打包改进

- 修复 AppImage 打包图标缺失问题（`LW_ICON` 指向正确的 branding 目录）
- 移除打包目标对 `package` 的冗余依赖，加速重复打包流程

---

## 已知问题

- ❌ **NSIS 安装器语言** — 强制中文的 patch 未生效，安装器界面仍为英文（已放弃修复）
- ⚠️ **卸载残留** — 卸载器不删除用户 profile 目录（Firefox 行业惯例，手动清理即可）

---

## 技术细节

- 基于 Firefox 150.0
- 上游参考：LibreWolf 150.0-1 源码 + settings + bsys6
- 编译方式：Linux 交叉编译 Windows (`x86_64-pc-mingw32`)、macOS (`x86_64-apple-darwin`)、Linux (x86_64 / aarch64)
- 品牌信息：Vantage Browser, ASYS Technology, asystech.cn
