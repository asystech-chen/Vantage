# IronFox 定制化指南

本文档详细说明如何基于 IronFox 源码进行品牌定制和功能调整，适用于 Vantage 安卓版等衍生项目。

---

## 目录

1. [快速开始](#快速开始)
2. [品牌定制](#品牌定制)
3. [功能定制](#功能定制)
4. [搜索引擎配置](#搜索引擎配置)
5. [隐私与安全设置](#隐私与安全设置)
6. [构建配置](#构建配置)
7. [常见问题](#常见问题)

---

## 快速开始

### 前置要求

- Android SDK 34+
- JDK 17+
- Git
- Docker（推荐）或 Linux/macOS 构建环境
- 至少 100GB 可用磁盘空间

### 源码结构

```
android/
├── configs/              # 构建配置
│   └── mozconfigs/       # Gecko 编译配置
├── docs/                 # 文档
├── patches/              # 补丁文件
│   ├── a-c-overlay/      # Android Components 覆盖
│   ├── fenix-overlay/    # Fenix 覆盖
│   └── gecko-overlay/    # Gecko 覆盖
├── scripts/              # 构建脚本
│   ├── patches.yaml      # 补丁分类和说明
│   └── versions.sh       # 版本配置
└── uBlock/               # uBlock Origin 配置
```

---

## 品牌定制

### 1. 应用名称和包名

**修改位置**: `scripts/versions.sh`

```bash
# 应用 ID（包名）
MOZ_ANDROID_PACKAGE_NAME="org.vantage.browser"

# 应用名称
MOZ_APP_BASENAME="Vantage"

# 显示名称
MOZ_APP_DISPLAYNAME="Vantage Browser"
```

**修改位置**: `patches/fenix-ironfox-branding.patch`

```diff
-                    "https://gitlab.com/ironfox-oss/IronFox/-/issues",
+                    "https://your-project/support",
```

### 2. 图标和视觉资源

**修改位置**: `patches/fenix-overlay/app/src/release/res/`

| 文件 | 说明 | 尺寸要求 |
|------|------|----------|
| `ic_launcher_foreground.xml` | 主图标前景 | 矢量图 |
| `ic_launcher_monochrome.xml` | 单色图标（Android 13+） | 矢量图 |
| `ic_wordmark_logo.webp` | 文字标志 | 推荐 512x512 |
| `ic_wordmark_text_normal.webp` | 普通模式文字标 | 推荐 512x100 |
| `ic_wordmark_text_private.webp` | 隐私模式文字标 | 推荐 512x100 |
| `animated_splash_screen.xml` | 启动动画 | 矢量动画 |

**多分辨率资源**（如需要）:
```
drawable-hdpi/    - 72dpi (1.5x)
drawable-mdpi/    - 48dpi (1x)
drawable-xhdpi/   - 96dpi (2x)
drawable-xxhdpi/  - 144dpi (3x)
drawable-xxxhdpi/ - 192dpi (4x)
```

### 3. 颜色主题

**修改位置**: `patches/fenix-ironfox-oled-theme.patch`

```diff
-    <color name="fx_mobile_layer1">#000000</color>
+    <color name="fx_mobile_layer1">#1A1A2E</color>  # 自定义深色背景
```

**主要颜色变量**:
- `fx_mobile_layer1` - 主背景色
- `fx_mobile_layer2` - 次级背景色
- `fx_mobile_accent` - 强调色
- `fx_mobile_text_primary` - 主文字颜色

### 4. 关于页面

**修改位置**: `patches/gecko-overlay/ironfox/about/ironfox/`

**ironfox.html** - 关于页面结构:
```html
<!DOCTYPE html>
<html>
<head>
  <link rel="localization" href="ironfox/ironfox.ftl" />
  <title data-l10n-id="about-vantage-title"></title>
</head>
<body>
  <section>
    <p data-l10n-id="about-vantage-description"></p>
  </section>
</body>
</html>
```

**locales/en-US/ironfox/ironfox.ftl** - 本地化文本:
```ftl
about-vantage-title = 关于 Vantage
about-vantage-description = Vantage 是一个基于 Firefox 的隐私浏览器。
about-vantage-quote = 你的定制化描述文字...
```

### 5. 引导页面

**修改位置**: `patches/fenix-ironfox-onboarding.patch`

在 `mobile/android/fenix/app/onboarding.fml.yaml` 中添加自定义引导卡片:

```yaml
features:
  onboarding:
    variables:
      cards:
        variants:
          vantage-features:
            card-type: vantage-features
            enabled: true
            title: onboarding_vantage_title
            body: onboarding_vantage_description
            image-res: ic_launcher_foreground
            ordering: 10000
            primary-button-label: onboarding_get_started
```

---

## 功能定制

### 1. 启用/禁用功能

通过 patch 控制功能开关：

| Patch 文件 | 功能 | 默认 |
|-----------|------|------|
| `fenix-enable-etp-strict.patch` | 严格跟踪保护 | ✅ 启用 |
| `fenix-enable-doh-via-quad9-by-default.patch` | DNS over HTTPS | ✅ 启用 |
| `fenix-enable-https-only-mode-by-default.patch` | HTTPS-Only 模式 | ✅ 启用 |
| `fenix-disable-password-mgr-and-autofill-by-default.patch` | 密码管理器 | ❌ 禁用 |
| `fenix-disable-telemetry.patch` | 遥测 | ❌ 禁用 |
| `fenix-disable-nimbus.patch` | A/B 测试 | ❌ 禁用 |

**自定义示例** - 启用密码管理器:

```diff
--- a/mobile/android/fenix/app/src/main/java/org/mozilla/fenix/utils/Settings.kt
+++ b/mobile/android/fenix/app/src/main/java/org/mozilla/fenix/utils/Settings.kt
@@ -174,7 +174,7 @@ class Settings(
     var shouldPromptToSaveLogins by booleanPreference(
         appContext.getPreferenceKey(R.string.pref_key_save_logins),
-        default = false,
+        default = true,
     )
```

### 2. 菜单项定制

**修改位置**: `patches/fenix-ironfox-ui.patch`

```kotlin
// 显示/隐藏同步菜单
if (isSyncActive) {
    MozillaAccountMenuItem(...)
}

// 显示/隐藏密码管理器
if (isPasswordManagerEnabled) {
    LibraryMenuItem(
        labelRes = R.string.browser_menu_passwords,
        ...
    )
}
```

### 3. 设置页面定制

**修改位置**: `patches/fenix-ironfox-settings.patch`

添加自定义设置入口到 `preferences.xml`:

```xml
<androidx.preference.PreferenceCategory
    android:title="@string/vantage_title"
    app:iconSpaceReserved="false">
    
    <androidx.preference.Preference
        android:key="@string/pref_key_vantage_settings"
        android:title="@string/vantage_preferences"
        app:iconSpaceReserved="false" />
</androidx.preference.PreferenceCategory>
```

---

## 搜索引擎配置

### 1. 添加搜索引擎

**修改位置**: `patches/a-c-overlay/components/feature/search/src/main/assets/search/`

**list.json** - 搜索引擎列表:
```json
{
  "default": {
    "searchDefault": "YourSearch",
    "searchOrder": [
      "YourSearch",
      "DuckDuckGo",
      "Wikipedia"
    ],
    "visibleDefaultEngines": [
      "yoursearch",
      "ddg",
      "wikipedia"
    ]
  }
}
```

### 2. 创建搜索引擎定义

**修改位置**: `patches/a-c-overlay/components/feature/search/src/main/assets/searchplugins/`

创建 `yoursearch.xml`:
```xml
<SearchPlugin xmlns="http://www.mozilla.org/2006/browser/search/">
  <ShortName>YourSearch</ShortName>
  <InputEncoding>UTF-8</InputEncoding>
  <Image width="16" height="16">data:image/png;base64,...</Image>
  <Url type="text/html" method="GET" template="https://search.example.com/search">
    <Param name="q" value="{searchTerms}"/>
  </Url>
</SearchPlugin>
```

### 3. 区域特定配置

在 `list.json` 的 `locales` 部分为不同语言配置不同的默认搜索引擎:

```json
"locales": {
  "zh-CN": {
    "default": {
      "visibleDefaultEngines": ["baidu", "ddg", "wikipedia-zh-CN"]
    }
  }
}
```

---

## 隐私与安全设置

### 1. 指纹防护

**修改位置**: `patches/gecko-overlay/ironfox/dumps/`

指纹防护覆盖配置文件:
- `ironfox-fingerprinting-protection-overrides-harden.json` - 强化模式
- `ironfox-fingerprinting-protection-overrides-unbreak.json` - 兼容模式
- `ironfox-fingerprinting-protection-overrides-unbreak-webgl.json` - WebGL 兼容
- `ironfox-fingerprinting-protection-overrides-unbreak-timezone.json` - 时区兼容

**示例配置**:
```json
{
  "privacy.resistFingerprinting": true,
  "privacy.resistFingerprinting.letterboxing": false,
  "webgl.disabled": false,
  "canvas.randomization.enabled": true
}
```

### 2. 网络隐私

**修改位置**: `patches/fenix-enable-doh-via-quad9-by-default.patch`

```kotlin
// DoH 模式：0=关闭，1=回退，2=最大保护，3=关闭
var trrMode = 2  // 最大保护（无回退）

// DoH 提供商
val dohDefaultProviderUrl = "https://dns.quad9.net/dns-query"
```

### 3. 数据清理

**修改位置**: `patches/fenix-sanitize-data-on-exit-by-default.patch`

```kotlin
var shouldDeleteBrowsingDataOnQuit = true

// 清理项目
private val deleteOnQuitSettings = setOf(
    DeleteOnQuitItem.HISTORY,
    DeleteOnQuitItem.COOKIES,
    DeleteOnQuitItem.CACHE,
    DeleteOnQuitItem.DOWNLOADS
)
```

### 4. 权限控制

**修改位置**: `patches/fenix-default-site-permissions.patch`

```kotlin
// 默认阻止的权限
val blockedPermissions = setOf(
    SitePermissions.Permission.NOTIFICATION,
    SitePermissions.Permission.LOCATION,
    SitePermissions.Permission.CAMERA,
    SitePermissions.Permission.MICROPHONE
)
```

---

## 构建配置

### 1. Mozconfig 配置

**修改位置**: `configs/mozconfigs/`

**android-arm64** 示例:
```bash
. $topsrcdir/mobile/android/config/mozconfigs/common

ac_add_options --target=aarch64-linux-android

# 应用标识
ac_add_options --with-app-name=vantage
ac_add_options --with-branding=mobile/android/branding/vantage

# 功能开关
ac_add_options --enable-release
ac_add_options --disable-tests
ac_add_options --disable-debug

# 隐私选项
ac_add_options --disable-telemetry
ac_add_options --disable-crashreporter
```

### 2. 版本配置

**修改位置**: `scripts/versions.sh`

```bash
# Firefox 基础版本
GECKO_VERSION="135.0"
GECKO_BRANCH="releases/mozilla-release"

# Android Components 版本
AC_VERSION="135.0.20241201"

# 应用版本
APP_VERSION="1.0.0"
APP_VERSION_CODE="1"
```

### 3. Patch 管理

**修改位置**: `scripts/patches.yaml`

添加自定义 patch 分类:
```yaml
categories:
  - name: "Vantage Custom"
    excerpt: "Vantage 专属定制补丁"
    description: "品牌定制和功能调整"

patches:
  - file: "vantage-branding.patch"
    name: "Vantage 品牌定制"
    category: "Vantage Custom"
```

### 4. 构建命令

**使用 Docker**（推荐）:
```bash
# 拉取构建镜像
docker pull registry.gitlab.com/ironfox-oss/ironfox:latest

# 运行构建
./scripts/run-docker.sh ./scripts/build.sh arm64
```

**本地构建**:
```bash
# 初始化环境
./scripts/bootstrap.sh

# 获取源码
./scripts/get_sources.sh

# 准备源码（打补丁）
./scripts/prebuild.sh

# 构建
./scripts/build.sh arm64
```

### 5. 签名配置

**修改位置**: `scripts/sign.sh`

```bash
# 密钥库路径
KEYSTORE_PATH="$HOME/.android/keystore.jks"

# 密钥别名
KEY_ALIAS="vantage-release"

# 签名
apksigner sign \
  --ks "$KEYSTORE_PATH" \
  --ks-key-alias "$KEY_ALIAS" \
  --out vantage-signed.apk \
  vantage-unsigned.apk
```

---

## 常见问题

### Q1: 如何修改应用包名？

修改 `scripts/versions.sh` 中的 `MOZ_ANDROID_PACKAGE_NAME`，然后清理构建缓存:
```bash
./scripts/prebuild.sh --clean
```

### Q2: 如何添加自定义 about 页面？

1. 在 `gecko-overlay/ironfox/about/` 创建页面目录
2. 添加 HTML 和本地化文件
3. 在 `moz.build` 中注册页面
4. 参考 `about:ironfox` 的实现

### Q3: 如何禁用某个 patch？

在 `scripts/patches.yaml` 中找到对应 patch，添加 `enabled: false`:
```yaml
patches:
  - file: "fenix-disable-pocket.patch"
    enabled: false
```

### Q4: 构建失败怎么办？

1. 检查磁盘空间（至少 100GB）
2. 确保 JDK 版本正确（JDK 17）
3. 清理缓存：`./scripts/prebuild.sh --clean`
4. 查看详细日志：`./scripts/build.sh arm64 2>&1 | tee build.log`

### Q5: 如何测试修改？

使用模拟器或真机调试:
```bash
# 安装到设备
adb install -r vantage-arm64.apk

# 查看日志
adb logcat | grep -i vantage
```

### Q6: 如何更新 Firefox 基础版本？

1. 更新 `scripts/versions.sh` 中的 `GECKO_VERSION`
2. 更新 `AC_VERSION`（Android Components）
3. 运行 `./scripts/get_sources.sh` 获取新源码
4. 检查并更新不兼容的 patch

---

## 参考资源

- [IronFox 官方文档](https://ironfoxoss.org/docs/)
- [Firefox for Android 源码](https://github.com/mozilla-mobile/firefox-android)
- [GeckoView 文档](https://mozilla.github.io/geckoview/)
- [Android Components](https://github.com/mozilla-mobile/android-components)

---

_最后更新：2026-05-02_
