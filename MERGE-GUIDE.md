# Vantage 合并上游 LibreWolf 代码指南

> 最后更新: 2026-06-22（补充 151→152 合并经验）

合并 LibreWolf 上游代码时，以下文件**不能直接替换**，必须手动合并或跳过。

---

## 🔴 Vantage 独有补丁（合并时绝不可丢失！）

以下是**上游没有、Vantage 独有**的补丁。合并 `assets/patches.txt` 时**必须保留**这些条目，否则对应功能会丢失。

### 中文安装包相关（重点！）

| 文件 | 说明 |
|------|------|
| `patches/installer-zhcn.patch` | **强制安装器 AB_CD=zh-CN**，修改 `defines.nsi.in` 中 BrandFullName 为 Vantage。上游无此文件 |
| `patches/installer-locale.patch` | **安装器语言文件**，修改 `Makefile.in` 使 `PPL_LOCALE_ARGS` 优先使用 `lw/l10n/zh-CN/browser/installer`。上游无此文件 |
| `patches/installer-publisher.patch` | **注册表 Publisher** 从硬编码 `"Mozilla"` 改为 `"${CompanyName}"`（Windows 注册表显示 Vantage 发行商）。上游无此文件 |
| `patches/uninstaller-cleanup.patch` | **移除卸载调查**，删除 Firefox 的退出问卷调查（Survey/SendPing），改为静默卸载。上游无此文件 |

> **⚠️ 重要：** 这 4 个 patch 控制 Windows 安装包的中文界面、发行商信息和卸载行为。150→151 合并时曾因 `patches.txt` 被上游整体覆盖而全部丢失（commit `0f236d5`）。**每次合并后必须用 `check-merge.sh` 验证！**

### 品牌/界面相关

| 文件 | 说明 |
|------|------|
| `patches/vantage-ai-sidebar.patch` | **AI 侧边栏**：添加 DeepSeek/Qwen/豆包、移除 Copilot。涉及 GenAI.sys.mjs + chat.js + genai.ftl。上游无此文件 |
| `patches/vantage-privacy-dashboard.patch` | **隐私仪表板**：重设计 about:protections 页面布局。上游无此文件 |
| `patches/dmg-fix-permissions.patch` | **macOS 签名修复**。上游无此文件 |
| `patches/fix-7zsfx-branding.patch` | **7zSFX 品牌替换**：`other-licenses/7zstub/firefox/resource.rc` 中 CompanyName/FileDescription 改为 Vantage。⚠️ **需 LF 行尾！** 因为 `librewolf-patches.py` 在打补丁前会将所有源文件（含 .rc）转为 LF，CRLF patch 反而会导致 "different line endings" 错误。 |
| `patches/hide-passwordmgr.patch` | 隐藏密码管理器（Firefox Sync 特性，Vantage 不需要） |

---

## 🔴 不能直接替换（包含 Vantage 定制内容）

### Patch 文件（与上游共用但需手动合并）

| 文件 | 说明 |
|------|------|
| `patches/moz-configure.patch` | MOZ_APP_VENDOR=Vantage, MOZ_APP_PROFILE=vantage。上游是 LibreWolf/librewolf。**合并后需运行 `rebrand.sh`** |
| `patches/mozilla_dirs.patch` | 8 处目录路径改为 Vantage/.vantage。上游是 LibreWolf/.librewolf。**合并后需运行 `rebrand.sh`** |
| `patches/windows-theming-bug.patch` | exe manifest 改为 vantage.exe.manifest + name="Vantage"。上游是 librewolf |
| `patches/pref-pane/librewolf.js` | 新增 vantage.updateCheck.enabled pref 注册和事件绑定；修复了 openAboutConfig 和 openProfileDirectory 函数。上游可能也会改这个文件 |
| `patches/pref-pane/librewolf.inc.xhtml` | 新增"更新"设置区块。上游可能也会改这个文件 |

### 配置文件

| 文件 | 说明 |
|------|------|
| `settings/librewolf.cfg` | **大量定制**：overrides 路径改为 .vantage、app.support.baseURL 指向 Mozilla、checkDefaultBrowser=false、新增整段更新检查代码（约 100 行）。合并时**逐段对比**，不能整体替换 |
| `settings/distribution/policies.json` | uBlock xpi 地址指向 asystech.cn。上游指向 LibreWolf 的地址 |
| `settings/defaults/pref/local-settings.js` | 当前未改（仍引用 librewolf.cfg），但如果上游改了需注意 |

### 品牌/本地化

| 文件 | 说明 |
|------|------|
| `themes/browser/branding/vantage/` | **整个目录是 Vantage 独有**，不从上游合并 |
| `themes/browser/base/content/aboutDialog.js` | Vantage 自定义的版本检查逻辑，与上游完全不同 |
| `themes/browser/base/content/aboutDialog.xhtml` | about-librewolf 文本指向 ASYS Technology |
| `browser/browser/preferences/preferences.ftl` | 新增 vantage-update-* 条目 |
| `browser/toolkit/toolkit/branding/brandings.ftl` | 中文品牌翻译 |
| `l10n/en-US/**` | 包含 Vantage 品牌文本 + vantage-update 条目。**与上游 diff 后手动合并** |
| `l10n/zh-CN/**` | 同上，且补充了 WebGL 翻译 |
| `l10n/zh-TW/**` | 同上 |

### 构建文件

| 文件 | 说明 |
|------|------|
| `assets/mozconfig.new` | --with-app-name=vantage, --with-branding=browser/branding/vantage。不能替换 |
| `assets/patches.txt` | 包含 Vantage 独有 patch（installer-zhcn.patch），且移除了 hide-default-browser.patch。**合并时 diff 对比，新增的上游 patch 追加，不要整体替换** |
| `Makefile` | package-zhcn 目标有 Vantage 定制。上游新增目标可以合入，但不要覆盖已有的 |
| `scripts/librewolf-patches.py` | appstrings sed 改为 Firefox→Vantage（上游是→LibreWolf）。其他部分可以跟上游 |

---

## 🆕 FF151 兼容性变更（升级大版本时特别注意）

### ESM 模块迁移

Firefox 151 移除了大量 JSM 模块，改用 ESM。影响 Vantage 的关键项：

| 旧版 | 新版 | 影响 |
|------|------|------|
| `chrome://global/content/NetUtil.jsm` | `resource://gre/modules/NetUtil.sys.mjs` | `librewolf.cfg` 更新检查功能 |
| `ChromeUtils.import()` | `ChromeUtils.importESModule()` | 同上 |

### autoconfig 沙箱限制（致命！）

FF151 的 autoconfig 沙箱比旧版更严格，以下 API **不可用**：

| API | 状态 | 替代方案 |
|-----|------|----------|
| `console.warn/log/debug` | ❌ 破坏文件首行解析 | 删除所有 console 调用 |
| `Cc` / `Ci` / `Components.classes` | ❌ 无法创建 XHR | 用 `ChromeUtils.importESModule` + `NetUtil.asyncFetch` |
| `XMLHttpRequest` | ❌ 不存在 | `NetUtil.asyncFetch()` |
| `fetch()` | ❌ 不存在 | `NetUtil.asyncFetch()` |
| `Services.prompt.alert()` | ❌ 不可用 | `gNotificationBox.appendNotification()` |
| `dump()` | ⚠️ 不确定输出 | 不可依赖 |
| `ChromeUtils.importESModule()` | ✅ 可用 | 唯一推荐的模块导入方式 |
| `Services.*` 系列 | ✅ 可用 | prefs, obs, wm, io |
| `NetUtil.asyncFetch()` | ✅ 可用 | 通过 importESModule 导入 |

> **⚠️ 关键教训：** `librewolf.cfg` 首行必须是 `null;`（autoconfig 解析要求），且文件内不能有任何 console 调用。JSON.parse 在沙箱中可能出现编码问题，建议用正则表达式提取数据。

### CRLF 行尾问题

从 Windows 合并或通过某些工具复制 patch 时，行尾可能变成 CRLF。**Linux patch 命令不兼容 CRLF 文件。**

```bash
# 检查所有 patch 的行尾
file patches/*.patch | grep CRLF

# 批量修复（在 librewolf-patches.py 中已自动化）
# 但合并后手动验证可以避免后续问题
dos2unix patches/*.patch
```

**注意：** `librewolf-patches.py` 会在打补丁前将所有源文件（含 .rc）统一转为 LF。因此所有 patch 都应保持 LF 行尾，包括 `fix-7zsfx-branding.patch`。CRLF patch 会导致 "different line endings" 错误。

---

## 🆕 FF152 兼容性变更

### vantage-privacy-dashboard.patch 需重新生成

Firefox 152 的 `protections.mjs` 移除了 `ProxyCard` 导入（仅保留 LockwiseCard/MonitorCard/VPNCard），导致旧 patch 的 imports hunk 和 tail section hunk 失败。必须基于 Firefox 152 干净源文件重新生成整个 patch。

### pref-pane l10n id 变化

上游 152 的 `pref-pane-small.patch` 将侧边栏 l10n id 从 `pane-librewolf-title` 改为 `pane-librewolf-title2`。Vantage 使用自己的 l10n 体系（`pane-librewolf-title = Vantage`），需要在合并后将该 id 改回。

### pane 改名

Vantage 将 pref-pane 内部名从 `paneLibrewolf` 改为 `paneVantage`，设置页面地址变为 `about:preferences#vantage`。涉及 `pref-pane-small.patch`、`librewolf.inc.xhtml`、`librewolf.js`。

### 上游删除和新加

| 操作 | 文件 | Vantage 处理 |
|------|------|------|
| 上游删除 | `allow-JXL-in-non-nightly-browser.patch` | 跟删（JXL 已进 FF152 主线） |
| 上游新增 | `fix-canvas-extraction-permission.patch` | 跟加 |
| 上游新增 | `languages.patch` | 跟加 |
| 上游新增 | `remove-language-packs.patch` | **不跟！** Vantage 保留语言包给多语言用户 |
| 上游新增设置 | WebGL popup 开关、OCSP 硬失败 | **不跟！** 与 Vantage 安全策略冲突 |

---

## 🟡 合并时需要注意（可能有上游更新）

| 文件 | 注意事项 |
|------|----------|
| `patches/pref-pane/librewolf.css` | 如果上游改了 CSS 类名需同步 |
| `patches/pref-pane/librewolf.inc.xhtml` | 上游可能新增设置项，需合并进来，但不要丢失"更新"区块 |
| `patches/pref-pane/librewolf.js` | 上游可能改 WebGL 等逻辑，需合并但保留 Vantage 新增部分 |
| `patches/vendor-name.patch` | 当前未改，但留意上游变化 |
| `patches/xdg-dir.patch` | 当前未改，但涉及路径逻辑 |
| `patches/webgl-permission.patch` | librewolf.* pref 相关，上游可能更新 |

---

## 🟢 可以直接从上游替换

以下文件**没有 Vantage 定制**，可以安全地直接用上游版本覆盖：

- `patches/` 中**未在上面列出**的所有 patch 文件
- `settings/librewolfnew.cfg`（暂存文件，不参与编译）
- `settings/docs/`
- `scripts/fetch-*.sh`、`scripts/update-*.sh`
- `assets/search-config.json`、`assets/uBOAssets.json`
- `docs/`、`README.md`、`LICENSE`

---

## 📋 合并上游的推荐流程

```bash
# === 合并前 ===
# 1. 备份当前代码
git add -A && git commit -m "pre-merge: 保存当前状态"

# 2. 记录当前 Vantage 独有 patch 列表（供合并后对比）
grep -E "vantage|installer|uninstaller|dmg|zhcn" assets/patches.txt > /tmp/vantage-patches-before.txt

# === 合并过程 ===
# 3. 拉取上游更新并合并
git fetch upstream
git merge upstream/main  # 或 cherry-pick

# 4. 对比 patches.txt，重点关注 Vantage 独有条目
diff /tmp/vantage-patches-before.txt <(grep -E "vantage|installer|uninstaller|dmg|zhcn" assets/patches.txt)

# 5. 手动合并需要注意的文件
#    - 对于 patch 文件：看上游是否有新增/修改的逻辑，合入后运行 rebrand
#    - 对于 librewolf.cfg：逐段对比，保留 Vantage 定制段
#    - 对于 l10n：看上游是否有新增条目，追加翻译

# === 合并后 ===
# 6. 处理 FF 大版本升级的特殊问题（如适用）
#    - 检查 JSM→ESM 迁移（NetUtil.jsm → NetUtil.sys.mjs）
#    - 检查 autoconfig 沙箱是否有新限制
#    - 检查 gBrowser / gNotificationBox API 是否变化

# 7. 修复 CRLF 行尾（fix-7zsfx-branding 除外）
dos2unix patches/*.patch

# 8. 运行 rebrand 脚本（自动处理路径替换）
./scripts/rebrand.sh

# 9. 运行合并检查脚本（零副作用，只做检查）
./scripts/check-merge.sh

# 10. 编译验证
make dir && make build && make package-zhcn

# 11. 清理临时文件
rm /tmp/vantage-patches-before.txt
```

---

## 🔍 check-merge.sh 合并检查脚本

`scripts/check-merge.sh` 是零副作用的只读检查脚本，**合并后必须运行**。

```bash
# 基本检查（路径、patches.txt、cfg、l10n、policies）
./scripts/check-merge.sh

# 附带 patches.txt 差异对比（需要旧版本 tag）
./scripts/check-merge.sh v150.0.2-1
```

**检查项目（5 项）：**

| 检查项 | 内容 |
|--------|------|
| [1/5] 路径残留 | `moz-configure.patch`、`mozilla_dirs.patch`、`windows-theming-bug.patch` 中是否残留 librewolf 引用 |
| [2/5] patches.txt 完整性 | 9 个 Vantage 独有 patch 是否全部在册（中文安装包 4 个 + AI 侧边栏 + privacy-dashboard + dmg-fix + hide-passwordmgr + fix-7zsfx-branding） |
| [3/5] librewolf.cfg 关键内容 | 更新检查代码、NetUtil ESM 导入、`.vantage` 路径 |
| [4/5] l10n 品牌文本 | en-US aboutDialog/preferences 中是否包含 Vantage 品牌文本 |
| [5/5] policies.json | uBlock xpi 地址是否指向 asystech.cn |

---

## ⚠️ rebrand 脚本覆盖范围

`scripts/rebrand.sh` / `scripts/rebrand.ps1` **只处理路径相关的替换**：
- `patches/moz-configure.patch` — vendor/profile 默认值
- `patches/mozilla_dirs.patch` — 硬编码目录名
- `settings/librewolf.cfg` — overrides.cfg 路径

以下**不在 rebrand 脚本范围内**，需要手动检查：
- `windows-theming-bug.patch` 中的 manifest 文件名
- `librewolf-patches.py` 中的 appstrings sed 替换
- `l10n/` 中的品牌文本
- `aboutDialog.js` 中的 URL
- `librewolf.cfg` 中的 app.support.baseURL、更新检查代码等

---

## 📜 历史合并记录

| 版本 | 文档 | 关键问题 |
|------|------|----------|
| 150.0-1 | `MERGE-150-SECURITY.md` | 安全增强合并（13 项配置 + 2 个新 patch） |
| 150.0-1 | `UPGRADE-150-COMPLETE.md` | Pref-Pane 修复、Privacy Dashboard 重构 |
| 151.0.4 | 见 CHANGELOG.md | **CRLF 8 patch 失败、6 个 Vantage patch 丢失、autoconfig 沙箱适配、ESM 迁移** |
| 152.0.1 | 本次合并 | **vantage-privacy-dashboard 重新生成（ProxyCard 已移除）、fix-7zsfx-branding 改 LF、pref-pane l10n id 不跟 title2、pane 改名 vantage、不跟 remove-language-packs** |

---

## ✅ 合并后快速核对清单

- [ ] `./scripts/check-merge.sh` 全部通过（0 错误）
- [ ] `assets/patches.txt` 中 Vantage 独有 9 个 patch 全部在册
- [ ] `./scripts/rebrand.sh` 已运行且无残留
- [ ] 中文安装包 4 个 patch（installer-zhcn/locale/publisher/uninstaller-cleanup）未丢失
- [ ] `fix-7zsfx-branding.patch` 保持 LF（build 脚本先 dos2unix 源文件，CRLF 反而不匹配）
- [ ] 所有 patch 为 LF 行尾
- [ ] `librewolf.cfg` 首行是 `null;`（autoconfig 要求）
- [ ] `librewolf.cfg` 中 `NetUtil.sys.mjs` + `ChromeUtils.importESModule`（FF151+）
- [ ] `settings/distribution/policies.json` 中 uBlock 地址指向 asystech.cn
- [ ] `l10n/` 中 Vantage 品牌文本完整
