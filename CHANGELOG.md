# Vantage Browser 更新日志

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

- 基于 Firefox 149.0
- 上游参考：LibreWolf 最新源码 + settings + bsys6
- 编译方式：Linux 交叉编译 Windows (`x86_64-pc-mingw32`)
- 品牌信息：Vantage Browser, ASYS Technology, asystech.cn
