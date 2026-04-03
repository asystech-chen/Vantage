# Vantage Browser 项目记忆

## 项目概述
- **项目位置**: `~/vantage1/`
- **GitHub**: https://github.com/asystech-chen/Vantage.git
- **上游**: Fork 自 LibreWolf，LibreWolf 又基于 Firefox
- **当前版本**: Firefox 149.0-2
- **编译方式**: Linux 直接交叉编译 Windows (`x86_64-pc-mingw32`)，**不再使用 bsys6**
- **常用流程**: `make dir && make build && make package`
- **品牌**: Vantage Browser, ASYS Technology, asystech.cn
- **官网**: https://asystech.cn
- **更新 API**: https://asystech.cn/vantage/releases.json

## 2026-04-02 完成的修改

### NSIS 安装器中文化（进行中）
- **根因分析**: Firefox 内置 NSIS 安装器的语言不是由 `AB_CD` 变量单独决定的，而是由 `preprocess-locale.py` 从 properties 文件生成 `.nsh` 语言文件。`browser/installer/windows/Makefile.in` 里的 `PPL_LOCALE_ARGS` 决定读哪个 locale 目录。
- **`patches/installer-locale.patch`**: 修改 `PPL_LOCALE_ARGS`，让非 repack 构建也用 `--l10n-dir` 格式，优先搜索 `lw/l10n/zh-CN/browser/installer/` 目录
- **状态**: patch 能干净应用（fuzz 1），但完整构建验证尚未完成

### NSIS 卸载器改进
- **`patches/uninstaller-cleanup.patch`**: 
  - 移除 Mozilla 卸载调查问卷（`$ShouldOpenSurvey` 变量、`un.Survey` 函数、Finish 页面 checkbox、`un.onGUIEnd` 里打开 Edge 跳问卷的逻辑）
  - 卸载完成后弹窗询问是否清理用户数据：`%APPDATA%\Vantage\`、`%LOCALAPPDATA%\Vantage\`、`HKCU\Software\Mozilla\Vantage`
- **locale 翻译**: 通过 `l10n/` overlay 追加 `UN_CLEANUP_USERDATA` 字符串
  - `l10n/en-US/browser/installer/custom.inc.properties`
  - `l10n/zh-CN/browser/installer/custom.inc.properties`
  - **重要**: 文件名必须用 `.inc.properties` 才会以 append 模式追加，否则会覆盖整个文件！

### Makefile 修复
- `LW_ICON` 路径从 `themes/browser/branding/librewolf/` 改为 `themes/browser/branding/vantage/`（修复 AppImage 图标缺失）
- `package-deb`/`package-rpm`/`package-appimage`/`package-tar`/`package-all` 去掉对 `package` target 的依赖（避免重复构建）

### 未完成
- **安装包 EXE 图标和版本信息**: 还是 Firefox 的。需要改 `defines.nsi.in` 里的 `AppName`/`BrandProductName`/`DDEApplication`/`AppRegName` 为 Vantage，以及用 branding 目录的 ico 替换 `setup.ico`。优先级不高，可以暂时用 Resource Hacker 手动改。

## 2026-03-31 完成的修改

### 配置文件路径隔离（核心）
- `patches/moz-configure.patch` — MOZ_APP_VENDOR="Vantage", MOZ_APP_PROFILE="vantage"
- `patches/mozilla_dirs.patch` — 8处硬编码路径 LibreWolf→Vantage/.vantage
- `settings/librewolf.cfg` — overrides路径指向 .vantage/vantage.overrides.cfg
- **效果**: Windows `%APPDATA%\Vantage\vantage\`, Linux `~/.vantage/`, macOS `~/Library/Application Support/Vantage/`

### Windows 修复
- `patches/windows-theming-bug.patch` — exe manifest 改为 vantage.exe.manifest
- `scripts/migrate-profile-win.py` — 用户数据迁移工具(librewolf→vantage)

### 品牌/链接修复
- `scripts/librewolf-patches.py` — appstrings sed Firefox→Vantage
- `l10n/en-US/.../browser.inc.ftl` — identity-allow-site-data → Vantage
- `themes/browser/base/content/aboutDialog.js` — 下载页URL大小写修复
- `settings/librewolf.cfg` — app.support.baseURL 指向 Mozilla 支持页

### l10n 补全（WebGL 权限相关）
- zh-CN: 补充 permissions.inc.ftl, browser.inc.ftl, preferences.inc.ftl, browser.inc.properties, sitePermissions.inc.properties
- zh-TW: 同步更新检查翻译

### 功能改进
- 恢复"设为默认浏览器"UI（移除 hide-default-browser.patch，checkDefaultBrowser=false）
- 自动更新检查（librewolf.cfg 新增后台检查 + 通知栏，24h间隔，可忽略版本）
- 设置面板新增"更新"区块（vantage.updateCheck.enabled checkbox）
- pref-pane 按钮修复（openAboutConfig 用 openTrustedLinkIn, openProfileDirectory 直接 reveal）

### 构建辅助
- `scripts/rebrand.sh` + `scripts/rebrand.ps1` — 合并上游后一键替换脚本
- `assets/patches.txt` — 清理空行

## Firefox NSIS 安装器架构（参考）

### 构建流程
```
mach package
  → packager.mk: make -C windows installer (WINNT target 自动触发)
    → windows/Makefile.in: install_deps
      → preprocessor: defines.nsi.in → defines.nsi
      → preprocess-locale.py: properties → baseLocale.nsh / overrideLocale.nsh / customLocale.nsh
      → makensis.mk: makensis installer.nsi → setup.exe
      → makensis uninstaller.nsi → helper.exe
      → mach repackage: 7z SFX → 最终 .exe
```

### 关键文件
- `browser/installer/windows/Makefile.in` — 控制 locale 和 branding 文件的拷贝
- `browser/installer/windows/nsis/installer.nsi` — 安装器主脚本（非常复杂）
- `browser/installer/windows/nsis/uninstaller.nsi` — 卸载器主脚本
- `browser/installer/windows/nsis/defines.nsi.in` — 预处理器变量定义
- `themes/browser/branding/vantage/branding.nsi` — 品牌定义（已改为 Vantage）
- `toolkit/mozapps/installer/windows/nsis/preprocess-locale.py` — locale properties → NSIS nsh 转换器
- `toolkit/mozapps/installer/windows/nsis/makensis.mk` — makensis 调用逻辑

### locale 覆盖机制
- `preprocess-locale.py` 的 `lookup()` 按 `--l10n-dir` 顺序搜索
- `librewolf-patches.py` 的 l10n overlay：
  - 文件名含 `.inc` → append 模式（追加到已有文件末尾）
  - 文件名不含 `.inc` → write 模式（覆盖整个文件）
  - **坑**: 如果不小心用 write 模式覆盖了完整翻译文件，安装器会大面积乱码

## 关键文件结构
```
vantage1/
├── assets/mozconfig.new              # Linux 编译配置
├── assets/mozconfig.win-cross        # Windows 交叉编译配置
├── assets/patches.txt                # patch 列表
├── patches/installer-zhcn.patch      # AB_CD 硬编码 zh-CN
├── patches/installer-locale.patch    # PPL_LOCALE_ARGS 优先读 zh-CN
├── patches/uninstaller-cleanup.patch # 移除调查 + 加清理提示
├── patches/moz-configure.patch       # MOZ_APP_VENDOR/PROFILE
├── patches/mozilla_dirs.patch        # 硬编码目录路径
├── settings/librewolf.cfg            # 运行时配置
├── themes/browser/branding/vantage/  # 品牌资源
├── l10n/{en-US,zh-CN,zh-TW}/        # 本地化覆盖
│   └── browser/installer/custom.inc.properties  # 卸载清理提示翻译
├── scripts/librewolf-patches.py      # 打 patch + l10n overlay 的主脚本
├── scripts/rebrand.{sh,ps1}          # 合并上游后的自动替换
└── Makefile                          # 构建入口
```

## 注意事项
- cfg 文件名保持 librewolf.cfg 不改（内部加载名，不影响路径）
- pref key（librewolf.*）不改（改了功能会断）
- pref-pane 内部 ID/class（librewolf-*）不改（改要连锁改一大堆）
- 用户主要在 Windows 上做代码修改，Linux 交叉编译
- Linux 只有两个用户，路径迁移手动通知
- l10n overlay 文件名带 `.inc` = 追加，不带 = 覆盖，切记！
