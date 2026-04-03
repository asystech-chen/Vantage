# Vantage Browser 更新日志

## v149.0-2 — 2026-03-31

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
