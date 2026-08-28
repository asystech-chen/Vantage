# Vantage 多平台交叉编译指南

> 本文档覆盖 Vantage **桌面版**的全部 7 个编译目标，基于 x86_64 Debian 13 宿主机实测整理。
> 目标是让任何人在一台 x86_64 Linux 机器上完成所有平台的编译与打包。
> 如果你在实际折腾过程中有新的踩坑经验，欢迎提 PR！

---

## 目录

1. [平台总览](#1-平台总览)
2. [快速开始](#2-快速开始)
3. [通用前置准备](#3-通用前置准备)
4. [Linux x86_64（原生编译）](#4-linux-x86_64原生编译)
5. [Linux ARM64 交叉编译](#5-linux-arm64-交叉编译)
6. [Linux LoongArch64 交叉编译](#6-linux-loongarch64-交叉编译)
7. [Windows x64 / ARM64 交叉编译](#7-windows-x64--arm64-交叉编译)
8. [macOS x64 / ARM64 交叉编译（osxcross）](#8-macos-x64--arm64-交叉编译osxcross)
9. [打包与签名](#9-打包与签名)
10. [CI 自动化](#10-ci-自动化)
11. [产物清单示例](#11-产物清单示例)
12. [常见问题汇总](#12-常见问题汇总)

---

## 1. 平台总览

| 目标 | 架构 | mozconfig | 工具链 | 产物格式 | 本机状态 |
|------|------|-----------|--------|----------|----------|
| `linux-x64` | x86_64 | `assets/mozconfig.new` | 原生 gcc/clang | tar.xz / deb / rpm / AppImage / portable.tar.gz | ✅ 就绪 |
| `linux-arm64` | aarch64 | `assets/mozconfig.linux-arm64` | `aarch64-linux-gnu-gcc` + bootstrap | tar.xz / deb / rpm / AppImage / portable.tar.gz | ✅ 就绪 |
| `linux-loong64` | loongarch64 | `assets/mozconfig.linux-loong64` | clang 19 + `loongarch64-linux-gnu-gcc` + 自制 sysroot | tar.xz / deb / rpm / portable.tar.gz（**无 AppImage**） | ✅ 就绪 |
| `windows-x64` | x86_64 | `assets/mozconfig.win-cross` | MSVC via msvc-wine（bootstrap 自动管理） | installer.exe / portable.zip / msix | ✅ 就绪 |
| `windows-arm64` | aarch64 | `assets/mozconfig.win-cross.arm64` | MSVC via msvc-wine（bootstrap 自动管理） | installer.exe / portable.zip / msix | ✅ 就绪 |
| `macos-x64` | x86_64 | `assets/mozconfig.osx-cross` | osxcross（cctools + clang + Xcode SDK） | dmg | ❌ 工具链未装 |
| `macos-arm64` | aarch64 | `assets/mozconfig.osx-cross-arm64` | osxcross（cctools + clang + Xcode SDK） | dmg | ❌ 工具链未装 |

> **架构命名对照**：Linux 内核/发行版语境 `loong64` = 编译器 triplet `loongarch64-linux-gnu`；`arm64` = `aarch64`。deb 包架构名用 `loong64`/`arm64`，rpm 用 `loongarch64`/`aarch64`。

---

## 2. 快速开始

统一入口脚本 `build.sh`，支持目标名或简写：

```bash
./build.sh                          # 交互式菜单选择
./build.sh lx                       # 只编 Linux x64
./build.sh ll wa                    # 多目标（Linux loong64 + Windows arm64）
./build.sh all                      # 全部 7 个目标
./build.sh package lx la            # 只打包不编译
./build.sh sign linux-x64           # 只签名（仅 Linux）
```

| 简写 | 目标 | 简写 | 目标 |
|------|------|------|------|
| `lx` | linux-x64 | `wx` | windows-x64 |
| `la` | linux-arm64 | `wa` | windows-arm64 |
| `ll` | linux-loong64 | `mx` / `ma` | macos-x64 / arm64 |

**编译流程自动包含**：编译 → 打包 → 签名（Linux 目标）→ `make checksum` 生成 SHA256SUMS。
编译开始时自动挂载编译监控（QQ + 邮件双通道通知，详见本机 `~/.openclaw/workspace/scripts/build-monitor.sh`，不在仓库内）。

每个目标的实际流程（`build.sh` 内 `build_target()`）：

```bash
export MOZCONFIG="$REPO_ROOT/<对应 mozconfig>"
make dir          # 准备源码树
make build        # 编译
make package      # 基础打包
# Linux 额外:  make package-all   → deb/rpm/AppImage/tar.gz + GPG 签名
# Windows 额外: make package-msix → msix 预打包产物
```

---

## 3. 通用前置准备

### 3.1 宿主机要求

- **系统**：x86_64 Debian 13（bookworm+ 实测），其他发行版同理但包名可能不同
- **内存**：≥ 32GB（全量并行编译 24 线程实测 32GB 勉强；Windows 目标建议 `-j12`）
- **磁盘**：源码 tarball ~800MB + 每个目标的 objdir 15~30GB + 产物，建议预留 ≥ 200GB
- **网络**：Mozilla 源下载慢时用 aria2c 多线程加速（见 `docs/COMPILE-SPEEDUP.md`）

### 3.2 基础工具链

```bash
sudo apt install clang lld llvm pkg-config zip unzip curl m4 perl python3 \
  ccache sccache mold
```

### 3.3 Rust targets（交叉编译必需）

```bash
rustup target add \
  aarch64-unknown-linux-gnu \      # linux-arm64
  loongarch64-unknown-linux-gnu \  # linux-loong64
  x86_64-pc-windows-msvc \         # windows-x64
  aarch64-pc-windows-msvc          # windows-arm64
```

### 3.4 `~/.mozbuild`（mach bootstrap 共享目录）

所有目标的辅助工具（clang、cbindgen、nasm、node、pkgconf、nsis、sccache、dump_syms 等）由 mach bootstrap 统一管理在 `~/.mozbuild/`。loong64 目标不开 bootstrap，但会**借用**其中的 cbindgen/nasm/node/pkgconf（见 mozconfig 内 PATH 配置）。

### 3.5 下载加速

```bash
# Mozilla 直连超时用 aria2c 多线程填带宽（仓库已内置，见 git log ba80c1b）
sudo apt install aria2
```

---

## 4. Linux x86_64（原生编译）

无需交叉工具链，直接：

```bash
./build.sh lx
# 等价于: MOZCONFIG=$(pwd)/assets/mozconfig.new make dir && make build && make package && make package-all
```

产物：

```
vantage-<ver>-<rel>.x86_64.tar.xz          # 官方 tar 包
vantage-<ver>-<rel>.x86_64.AppImage        # AppImage（用 assets/appimage-runtime/runtime-x86_64）
vantage-<ver>-<rel>.x86_64.portable.tar.gz # 便携版
vantage-<ver>-<rel>.x86_64.rpm             # RPM
vantage_<ver>-<rel>_amd64.deb              # DEB
```

> 本机 `assets/appimage-runtime/` 有 x86_64 / aarch64 两个缓存的 AppImage runtime，避免每次联网下载。

---

## 5. Linux ARM64 交叉编译

### 5.1 安装工具链

```bash
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
rustup target add aarch64-unknown-linux-gnu
```

### 5.2 Mozconfig

`assets/mozconfig.linux-arm64`（要点）：

- `--target=aarch64-linux-gnu` + `--enable-bootstrap`（mach 自动下载 aarch64 的 clang 交叉工具链和辅助工具）
- 其余选项与 `mozconfig.new` 对齐（release/hardening/jemalloc/lld 链接器/ccache）
- `MOZ_PARALLEL_BUILD=24`

### 5.3 编译

```bash
./build.sh la
# 或手动: MOZCONFIG=$(pwd)/assets/mozconfig.linux-arm64 make dir && make build && make package && make package-all
```

产物与 x86_64 一致，AppImage 用 `assets/appimage-runtime/runtime-aarch64`。

---

## 6. Linux LoongArch64 交叉编译

> 这是工程量最大的目标：loong64 没有现成的发行版交叉工具链套装，需要**自制 sysroot**。
> 更详细的逐坑记录见旧版 `docs/LOONG64-CROSS-COMPILE.md`，本节省略版。

### 6.1 安装宿主工具链

```bash
sudo apt install qemu-user qemu-user-binfmt debootstrap lld
which qemu-loongarch64   # 确认 qemu 模拟器存在（跑 chroot 里的包管理器用）
rustup target add loongarch64-unknown-linux-gnu
```

### 6.2 创建 loong64 sysroot（约 2GB）

```bash
# 用 Debian Ports（sid）创建基础系统
sudo debootstrap --arch=loong64 --no-check-gpg \
  sid /sysroot-loong64 https://deb.debian.org/debian-ports

# 配置 qemu + DNS 进 sysroot（chroot 内跑 apt 必需）
sudo cp /usr/bin/qemu-loongarch64 /sysroot-loong64/usr/bin/
sudo cp /etc/resolv.conf /sysroot-loong64/etc/
```

### 6.3 安装编译依赖（chroot 内）

```bash
sudo chroot /sysroot-loong64 bash -c '
  export DEBIAN_FRONTEND=noninteractive
  apt update
  apt install -y g++ pkgconf zip unzip curl m4 perl python3
  apt install -y --no-install-recommends \
    libgtk-3-dev libpango1.0-dev libcairo2-dev libglib2.0-dev \
    libwayland-dev wayland-protocols libxkbcommon-dev \
    libx11-dev libxext-dev libxrender-dev \
    libx11-xcb-dev libxcb-shm0-dev libxcursor-dev libxi-dev \
    libdbus-1-dev libdbus-glib-1-dev \
    libfontconfig-dev libfreetype-dev \
    libffi-dev libdrm-dev \
    libpulse-dev libatspi2.0-dev \
    libharfbuzz-dev libevent-dev
'
```

### 6.4 解决 ALSA 依赖冲突（关键坑）

sid ports 的 `libasound2-dev` / `libasound2-data` 版本冲突装不上，用**真实运行时库 + stub 头文件 + `--disable-alsa`** 绕过：

```bash
# 提取运行时共享库
sudo chroot /sysroot-loong64 apt download libasound2t64
sudo dpkg-deb -x /sysroot-loong64/libasound2t64*.deb /tmp/alsa-tmp
sudo cp /tmp/alsa-tmp/usr/lib/loongarch64-linux-gnu/libasound.so* \
  /sysroot-loong64/usr/lib/loongarch64-linux-gnu/
# ⚠️ 必须用真库做软链，旧 stub（无 snd_seq_* 符号）会导致链接报 undefined symbol
sudo ln -sf libasound.so.2 /sysroot-loong64/usr/lib/loongarch64-linux-gnu/libasound.so

# 假头文件 + pkg-config
sudo mkdir -p /sysroot-loong64/usr/include/alsa
echo '/* stub for cross-compilation with --disable-alsa */' | \
  sudo tee /sysroot-loong64/usr/include/alsa/asoundlib.h
sudo mkdir -p /sysroot-loong64/usr/lib/loongarch64-linux-gnu/pkgconfig
cat << 'PC' | sudo tee /sysroot-loong64/usr/lib/loongarch64-linux-gnu/pkgconfig/alsa.pc
Name: alsa
Description: ALSA (stub, use --disable-alsa)
Version: 1.2.16
Libs: -lasound
Cflags:
PC
```

### 6.5 Mozconfig 要点

`assets/mozconfig.linux-loong64`：

- `--target=loongarch64-linux-gnu` + `--with-sysroot=/sysroot-loong64`
- **CC/CXX 用系统 clang 19**（`/usr/bin/clang --target=loongarch64-linux-gnu`），**不能用** Mozilla bootstrap 的 clang（不支持 loong64 target）
- `AR/NM/RANLIB` 用 llvm 系列（`llvm-ar-19` 等）
- `PKG_CONFIG_LIBDIR` 指向 sysroot 内 loong64 的 pkgconfig
- `--without-wasm-sandboxed-libraries`（系统 clang 缺 wasm32 runtime：`libclang_rt.builtins.a`）
- `--disable-alsa` + 上面的 stub 组合拳
- PATH 借用 `~/.mozbuild` 的 cbindgen/nasm/node/pkgconf（**不开** `--enable-bootstrap`）

### 6.6 编译

```bash
./build.sh ll
# 或手动: MOZCONFIG=$(pwd)/assets/mozconfig.linux-loong64 make dir && make build && make package && make package-all
```

产物（**无 AppImage**——loong64 没有现成 runtime）：

```
vantage-<ver>-<rel>.linux-loongarch64.tar.xz
vantage-<ver>-<rel>.loongarch64.portable.tar.gz
vantage-<ver>-<rel>.loongarch64.rpm
vantage_<ver>-<rel>_loong64.deb
```

### 6.7 loong64 踩坑速查

| 问题 | 原因 | 解决 |
|------|------|------|
| configure 报 GTK/Pango/pkg-config 找不到 | sysroot 没装桌面库 dev 包 | 装 `libgtk-3-dev` 等（6.3） |
| `fatal error: 'cstddef' file not found` | sysroot 缺 C++ 头文件 | `apt install g++` |
| `Package alsa was not found` | `--disable-alsa` 没完全跳过检查 | 提取 `libasound.so.2` + 假 `alsa.pc` + stub 头 |
| `fatal error: 'alsa/asoundlib.h' file not found` | MIDI 模块需要 ALSA 头 | stub 头文件 |
| `wasm-ld: error: cannot open libclang_rt.builtins.a` | 系统 clang 缺 wasm32 runtime | `--without-wasm-sandboxed-libraries` |
| `ld.lld: unable to find library -lasound` | sysroot 没有 libasound | 提取 `libasound2t64.deb` 中的 so |
| `undefined symbol: snd_seq_*` | 旧 stub `libasound.so` 无 sequencer 符号 | `rm libasound.so && ln -s libasound.so.2 libasound.so` |
| debootstrap 报 base 包配置失败（adduser/vim-tiny 版本漂移） | sid ports 依赖漂移 | 忽略即可，不影响交叉编译 |

> ⚠️ 安全说明：loong64 的 WASM sandbox 被禁用、ALSA 为 stub（真机走 PulseAudio/PipeWire），功能不受影响，但移植到真机后建议验证。

---

## 7. Windows x64 / ARM64 交叉编译

### 7.1 机制说明（MSVC via msvc-wine）

Vantage 的 Windows 目标走 **MSVC 路线**（`--target=x86_64-pc-windows-msvc` / `aarch64-pc-windows-msvc`）+ `--enable-bootstrap`：

- mach bootstrap 自动下载 **clang-cl、MSVC headers/libs、Windows SDK** 到 `~/.mozbuild/`（toolchains 目录，如 `winappsdk-x86_64-pc-windows-msvc.tar.zst`）
- 宿主需要 **wine** 来运行 MSVC 工具链（cl.exe/link.exe 是 Windows 程序）
- 与 Firefox 官方 win64 cross 配置同路线，功能完整（WebRTC ✅、geckodriver ✅）

### 7.2 安装宿主依赖

```bash
sudo apt install wine           # 实测 wine-10.0
# mingw 可选（部分辅助工具用），主路线是 MSVC：
sudo apt install gcc-mingw-w64-x86-64
```

Rust targets：

```bash
rustup target add x86_64-pc-windows-msvc aarch64-pc-windows-msvc
```

### 7.3 Mozconfig 要点

`assets/mozconfig.win-cross` / `assets/mozconfig.win-cross.arm64`（差异只有 `--target`）：

- `--target=x86_64-pc-windows-msvc`（或 `aarch64-pc-windows-msvc`）
- `--enable-bootstrap`（clang-cl/MSVC/SDK 全自动管理）
- `ENABLE_CLANG_PLUGIN=1`、`MOZ_PARALLEL_BUILD=16`（⚠️ Windows 目标不要开 24，32GB 内存扛不住全量，见踩坑）
- `--disable-maintenance-service`（Windows 服务不需要）

### 7.4 编译

```bash
./build.sh wx        # Windows x64
./build.sh wa        # Windows arm64
```

流程自动包含：`make package`（NSIS 安装器 + portable zip + **WinUpdater 自动打包**）→ `make package-msix`。

### 7.5 产物

```
vantage-<ver>-<rel>.x86_64-installer.exe      # NSIS 安装器（多语言：自动匹配系统语言 英/简/繁）
vantage-<ver>-<rel>.x86_64.msix-prepackage.zip # msix 预打包（CI 上传时排除）
vantage-<ver>-<rel>.win-x86_64.portable.zip   # 便携版
# arm64 同理：aarch64-installer.exe / win-aarch64.portable.zip / aarch64.msix-prepackage.zip
```

### 7.6 Windows 踩坑速查

| 问题 | 原因 | 解决 |
|------|------|------|
| git clone 报 HTTP/2 framing 错误 | GitHub HTTP/2 流问题 | `git config --global http.version HTTP/1.1` |
| 编译 OOM / 卡死 | `-j24` 内存超载 | Windows 目标用 `MOZ_PARALLEL_BUILD=16` |
| WinUpdater 下载更新超时 | 默认超时太短（大版本更新） | 放宽至 1 小时（curl `--max-time 3600`） |
| 安装器中文乱码 | locale overlay 误用 write 模式 | l10n 文件名必须用 `.inc.properties`（append 模式） |
| NSIS helper.exe 构建失败 | 多语言预处理参数问题 | `--preprocess-multilocale` 方式生成 |
| msix 产物上传 release | 预打包文件不该发布 | CI 上传时显式跳过 `*.msix*` |

> 安装器相关补丁：`installer-zhcn.patch`（强制 AB_CD=zh-CN）、`installer-locale.patch`（PPL_LOCALE_ARGS 优先 zh-CN）、`installer-publisher.patch`（注册表 Publisher → Vantage）、`installer-multilang.patch`（系统语言自动匹配）、`uninstaller-cleanup.patch`（移除卸载问卷）。

---

## 8. macOS x64 / ARM64 交叉编译（osxcross）

> ⚠️ **当前状态：本机尚未安装 osxcross，此章节为配置说明 + 部署步骤，未实测。**

### 8.1 原理

从 Linux 交叉编译 macOS 需要 [osxcross](https://github.com/tpoechtrager/osxcross)：

- **cctools/ld64**：苹果的链接器/归档工具（从 Apple 开源代码编译）
- **clang**：自带一套（或复用系统 clang），支持 `*-apple-darwin` target
- **Xcode SDK**：`MacOSX.sdk`（**硬门槛**，见 8.2）
- **hfsplus/dmg 工具**：制作 DMG 镜像（`newfs_hfs`、`dmg`、`hfsplus`）

### 8.2 SDK 获取（唯一硬门槛）

SDK 来自苹果 Xcode，需要从 macOS 环境提取：

```bash
# 在 Mac 上（Xcode 已安装）：
# 方式 A：xcodebuild
xcodebuild -sdk macosx -version
# SDK 实际路径：
ls /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/
# 方式 B：从 Xcode_26.1.xip 提取（xip --expand Xcode_26.1.xip 后从内部挖 MacOSX.sdk）
```

提取后压缩上传到 Linux：

```bash
# Mac 上打包
tar -C /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs \
  -czf MacOSX26.1.sdk.tar.gz MacOSX26.1.sdk
# 拿到 Linux 后放到 osxcross SDK 目录（见 8.3）
```

> 也可以尝试公开渠道的 SDK 提取包（社区维护的 SDK 镜像），但**注意苹果 SDK 的许可协议**，最合规的方式是从自己的 Mac 提取。

### 8.3 构建 osxcross（部署步骤）

```bash
# 目录布局必须匹配 mozconfig（CROSS=$HOME/osx-cross）
git clone https://github.com/tpoechtrager/osxcross ~/osx-cross/src
cd ~/osx-cross/src

# 放入 SDK
mkdir -p ~/osx-cross/src/tarballs
cp MacOSX26.1.sdk.tar.gz ~/osx-cross/src/tarballs/

# 编译 cctools/ld64（自动解包 SDK → osxcross-output）
./build.sh
# 产物: ~/osx-cross/osxcross-output/{bin,SDK/MacOSX26.1.sdk,...}

# clang：osxcross 自带或复用系统 clang（mozconfig 指向 $CROSS/clang/bin/clang）
# 注意：osxcross 的 clang 没有 wasm target，WASM_CC 需指回 ~/.mozbuild/clang/bin/clang

# DMG 工具
git clone https://github.com/tpoechtrager/dmg ~/osx-cross/dmg
cd ~/osx-cross/dmg && make
git clone https://github.com/tpoechtrager/hfsplus-tools ~/osx-cross/hfsplus-tools
cd ~/osx-cross/hfsplus-tools && make
```

最终目录布局（mozconfig 硬编码）：

```
~/osx-cross/
├── osxcross-output/
│   ├── bin/                    # ld64, ar, ranlib, xcrun ...
│   └── SDK/MacOSX26.1.sdk/     # SDKROOT
├── clang/bin/                  # CC/CXX/DSYMUTIL
├── hfsplus-tools/newfs_hfs     # MKFSHFS
└── dmg/{dmg,hfsplus}           # DMG_TOOL / HFS_TOOL
```

### 8.4 Mozconfig 要点

`assets/mozconfig.osx-cross` / `mozconfig.osx-cross-arm64`（差异只有 `--target`）：

- `--target=x86_64-apple-darwin`（或 `aarch64-apple-darwin`）
- `export MACOS_SDK_DIR="$CCTOOLS/SDK/MacOSX26.1.sdk"` + `SDKROOT` 同步导出（Rust cc crate 需要）
- `CC/CXX/HOST_CC/HOST_CXX` 全指 osxcross 的 clang
- `DSYMUTIL` 指向 osxcross clang 的 dsymutil（Rust debug symbols 需要）
- `WASM_CC/WASM_CXX` 指回 `~/.mozbuild/clang/bin/clang`（osxcross clang 无 wasm target）
- `MKFSHFS/DMG_TOOL/HFS_TOOL` 指向 hfsplus/dmg 工具
- `MOZ_PARALLEL_BUILD=24`

### 8.5 编译

```bash
./build.sh mx        # macOS x64
./build.sh ma        # macOS arm64
# 产物: vantage-<ver>-<rel>.macos-x86_64.dmg / .macos-aarch64.dmg
```

---

## 9. 打包与签名

### 9.1 打包目标（Makefile）

| 命令 | 作用 | 适用 |
|------|------|------|
| `make package` | 基础打包（NSIS 安装器 / dmg / tar） | 全平台 |
| `make package-all` | deb + rpm + AppImage + portable.tar.gz，并自动 GPG 签名 | Linux |
| `make package-msix` | msix 预打包（CI 上传时排除） | Windows |
| `make checksum` | 生成 SHA256SUMS（build.sh 自动执行） | 全平台 |

### 9.2 GPG 签名

- 私钥：`$HOME/vantage-repo-private-key.asc`（导入后使用）
- Key ID：`907587D2812D7F8C`
- 签名产物：`SHA256SUMS.asc`（随 release 发布）

### 9.3 AppImage runtime

- 本机缓存：`assets/appimage-runtime/runtime-x86_64`、`runtime-aarch64`
- loong64 **跳过** AppImage（无对应 runtime），改用 .deb/.tar.gz

---

## 10. CI 自动化

`.github/workflows/build-vantage.yml`：

- **触发**：push tag `v*` → 自动构建 **5 平台**（linux-x64 / linux-arm64 / linux-loong64 / windows-x64 / windows-arm64）；`workflow_dispatch` 可手动勾选全部 **7 平台**
- **Runner**：self-hosted `vantage-builder`（本机），先同步本地 mirror（`/home/chen/git/vantage.git` 增量 fetch）再 checkout，mirror 失败回退直连 GitHub
- **授权**：仅 `asystech-chen` / `Liangchenxu` 可触发
- **发布**：以构建生成的 SHA256SUMS 为权威清单上传 release 资产（`gh release` 显式指定 `GH_REPO`，避免本地 mirror remote 导致创建失败），4 并发上传；跳过 `*.msix*` 预打包产物；release notes 从 CHANGELOG.md 按版本提取
- 辅助：`winget.yml`（Windows 上架 winget）、`release.yml`

---

## 11. 产物清单示例

以 v153.1.0-1 实测为例（GitHub Release 全量资产）：

```
Linux:
  vantage-153.1.0-1.linux-x86_64.tar.xz          vantage-153.1.0-1.x86_64.AppImage
  vantage-153.1.0-1.x86_64.portable.tar.gz       vantage-153.1.0-1.x86_64.rpm
  vantage_153.1.0-1_amd64.deb
  vantage-153.1.0-1.linux-aarch64.tar.xz         vantage-153.1.0-1.aarch64.AppImage
  vantage-153.1.0-1.aarch64.portable.tar.gz      vantage-153.1.0-1.aarch64.rpm
  vantage_153.1.0-1_arm64.deb
  vantage-153.1.0-1.linux-loongarch64.tar.xz     vantage-153.1.0-1.loongarch64.portable.tar.gz
  vantage-153.1.0-1.loongarch64.rpm              vantage_153.1.0-1_loong64.deb

Windows:
  vantage-153.1.0-1.x86_64-installer.exe         vantage-153.1.0-1.win-x86_64.portable.zip
  vantage-153.1.0-1.aarch64-installer.exe        vantage-153.1.0-1.win-aarch64.portable.zip

通用: SHA256SUMS + SHA256SUMS.asc
```

---

## 12. 常见问题汇总

**Q: 编译很慢 / 卡住？**
A: 首次全量 6h+ 属正常；增量编译命中 ccache 后小版本升级约 1h。检查 `MOZ_PARALLEL_BUILD` 是否超内存（32GB 机器 Windows 目标用 16）。加速方案见 `docs/COMPILE-SPEEDUP.md`（sccache + mold）。

**Q: 某目标 configure 报工具链找不到？**
A: 核对 3.3 的 rustup targets 是否齐全；Linux 交叉目标确认对应 `gcc-<triplet>` 已装；Windows 目标确认 wine 可用（bootstrap 要跑 MSVC 工具链）。

**Q: 产物发布到 release 但下载不全？**
A: CI 以 SHA256SUMS 为权威清单，若某平台产物缺失说明该目标构建失败（看 workflow 日志），或文件被 `*.msix*` 过滤规则排除。

**Q: 需要新增语言 / 改 pref-pane？**
A: 参见 `MERGE-GUIDE.md` 与记忆中的修改指南（pref-pane 需同步改 5 个文件；l10n 只维护 en-US / zh-CN / zh-TW，其他语言自动回退英文）。

**Q: loong64 真机上跑起来有什么限制？**
A: WASM sandbox 禁用、ALSA stub（走 PulseAudio/PipeWire），其余功能完整。

---

*维护提示：本文档与 `assets/mozconfig.*`、`build.sh`、`.github/workflows/build-vantage.yml` 同步演进；改 mozconfig 或打包流程后请同步更新本文档对应章节。*
