# Vantage 合并上游 LibreWolf 代码指南

> 最后更新: 2026-03-31

合并 LibreWolf 上游代码时，以下文件**不能直接替换**，必须手动合并或跳过。

---

## 🔴 绝对不能直接替换（包含 Vantage 定制内容）

### Patch 文件

| 文件 | 说明 |
|------|------|
| `patches/moz-configure.patch` | MOZ_APP_VENDOR=Vantage, MOZ_APP_PROFILE=vantage。上游是 LibreWolf/librewolf。**合并后需运行 `rebrand.sh`** |
| `patches/mozilla_dirs.patch` | 8 处目录路径改为 Vantage/.vantage。上游是 LibreWolf/.librewolf。**合并后需运行 `rebrand.sh`** |
| `patches/windows-theming-bug.patch` | exe manifest 改为 vantage.exe.manifest + name="Vantage"。上游是 librewolf |
| `patches/installer-zhcn.patch` | **Vantage 独有**，强制安装器 AB_CD=zh-CN。上游没有此文件 |
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
# 1. 备份当前代码
git stash  # 或 git commit

# 2. 拉取上游更新（只拉取，不合并）
git fetch upstream

# 3. 对比差异，重点关注上面列出的文件
git diff HEAD upstream/main -- patches/ settings/ assets/ l10n/

# 4. 手动合并需要注意的文件
#    - 对于 patch 文件：看上游是否有新增/修改的逻辑，合入后运行 rebrand
#    - 对于 librewolf.cfg：逐段对比，保留 Vantage 定制段
#    - 对于 l10n：看上游是否有新增条目，追加翻译

# 5. 运行 rebrand 脚本（自动处理路径替换）
./scripts/rebrand.sh   # Linux
# 或
.\scripts\rebrand.ps1  # Windows

# 6. 检查残留
grep -in 'librewolf' patches/moz-configure.patch patches/mozilla_dirs.patch
grep -n 'overrides' settings/librewolf.cfg

# 7. 编译验证
make dir && make build && make package-zhcn
```

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
