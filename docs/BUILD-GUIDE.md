# Vantage 编译指南（Debian / 交叉编译）

> 面向「从零开始在一台 x86_64 Debian 上把 Vantage 编译出来」的完整操作手册。
> 覆盖：环境准备 → 各平台编译 → 打包签名 → 性能/体积配置 → 排错。
> 更偏「交叉编译平台细节」的内容见 [`CROSS-COMPILE.md`](CROSS-COMPILE.md)、[`LOONG64-CROSS-COMPILE.md`](LOONG64-CROSS-COMPILE.md)；编译提速见 [`COMPILE-SPEEDUP.md`](COMPILE-SPEEDUP.md)。

- 当前基线：**Firefox ESR 153.2**（`version`=`153.2.0`，`release`=`1`）
- 入口脚本：`./build.sh`
- 维护平台：**Linux x64 / arm64 / loong64 + Windows x64 / arm64**（macOS 已放弃）

---

## 目录

1. [平台总览](#1-平台总览)
2. [快速开始](#2-快速开始)
3. [Debian 宿主机准备](#3-debian-宿主机准备)
4. [编译流程详解](#4-编译流程详解)
5. [性能 / 体积优化配置（LTO / PGO / 语言包）](#5-性能--体积优化配置lto--pgo--语言包)
6. [各平台编译](#6-各平台编译)
7. [打包与签名](#7-打包与签名)
8. [常见问题与排错](#8-常见问题与排错)
9. [清理 / 回退](#9-清理--回退)
10. [CI 自动化](#10-ci-自动化)

---

## 1. 平台总览

| 目标 | 架构 | mozconfig | 工具链 | 产物 |
|------|------|-----------|--------|------|
| `linux-x64` | x86_64 | `assets/mozconfig.new` | 原生 clang（bootstrap） | tar.xz / deb / rpm / AppImage / portable.tar.gz |
| `linux-arm64` | aarch64 | `assets/mozconfig.linux-arm64` | bootstrap 交叉 clang | 同上 |
| `linux-loong64` | loongarch64 | `assets/mozconfig.linux-loong64` | 系统 clang 19 + 自制 sysroot | tar.xz / deb / rpm / portable.tar.gz（**无 AppImage**） |
| `windows-x64` | x86_64 | `assets/mozconfig.win-cross` | MSVC（clang-cl via msvc-wine，bootstrap 管理） | installer.exe / portable.zip / msix |
| `windows-arm64` | aarch64 | `assets/mozconfig.win-cross.arm64` | 同上 | 同上 |
| `macos-x64` / `macos-arm64` | — | `assets/mozconfig.osx-cross*` | osxcross | **已放弃（近期不维护），保留 mozconfig 仅供参考** |

简写：`lx` / `la` / `ll` / `wx` / `wa` / `mx` / `ma`。

> 架构命名：内核语境 `loong64` = 编译器 triplet `loongarch64-linux-gnu`；`arm64` = `aarch64`。deb 用 `loong64`/`arm64`，rpm 用 `loongarch64`/`aarch64`。

---

## 2. 快速开始

```bash
# 交互式菜单
./build.sh

# 单个目标
./build.sh lx

# 多个目标
./build.sh lx wx wa

# 全部
./build.sh all

# 只打包（跳过编译，要求 objdir 已存在）
./build.sh package lx

# 只签名（仅 Linux 目标）
./build.sh sign lx
```

`build.sh <目标>` 自动完成：**准备源码树（`make dir`）→ 拉 PGO profile（见 §5）→ 检查/安装 rust → 编译（`make build`）→ 打包（`make package`）→ 平台附加打包 → `make checksum`（生成 SHA256SUMS）**。

> 本机的编译完成通知（QQ/邮件）由 workspace 里的 `build-monitor.sh` 提供，**不在仓库内**，CI 上自动跳过。

---

## 3. Debian 宿主机准备

### 3.1 硬件要求

| 项 | 建议 |
|----|------|
| CPU/内存 | ≥ 16 核 / **≥ 32GB**（全量 24 线程实测 32GB 勉强；16GB 需降 `MOZ_PARALLEL_BUILD` 或加 swap） |
| 磁盘 | 源码 tarball ~800MB + **每目标 objdir 15~30GB** + 产物，建议 ≥ 200GB 空闲 |
| 系统 | x86_64 **Debian 13（trixie）**，其他发行版包名可能不同 |

> 内存不够时可用仓库脚本加 swap：`sudo ./scripts/setup-swapfile.sh`（创建 32G swap，Windows 交叉编译常用）。

### 3.2 基础工具链（apt）

```bash
sudo apt update
sudo apt install -y clang lld llvm pkg-config zip unzip curl m4 perl python3 \
  ccache sccache mold aria2 wget git
```

- `ccache`：编译缓存（默认启用）
- `mold` / `lld`：快速链接器（mozconfig 已用 `--enable-linker=lld`）
- `aria2`：多线程下载（Mozilla 源 / PGO profile 都用它，**重要**）

各平台额外依赖：

```bash
# linux-arm64
sudo apt install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu

# windows-x64 / arm64（MSVC via wine）
sudo apt install -y wine gcc-mingw-w64-x86-64

# linux-loong64（见 §6.3）
sudo apt install -y qemu-user qemu-user-binfmt debootstrap lld
```

### 3.3 Rust（关键，版本有讲究）

Vantage 的 4 个 desktop 主力平台（linux-x64/arm64、win-x64/arm64）mozconfig 里都写了：

```
export RUSTUP_TOOLCHAIN=1.94.1
```

**为什么固定 1.94.1**：要启用**跨语言 LTO**（Rust ↔ C++），rustc 的 LLVM 必须 ≤ clang 的 LLVM。本仓库使用 Mozilla bootstrap 的 **clang 21.1.8（LLVM 21）**，而 1.94.1 恰好是 **LLVM 21.1.8**（完全一致）；更新的 rust（如 1.95 = LLVM 22）会让链接期报 `Invalid record`。

```bash
# 安装（国内建议加镜像，官方源常卡）
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
rustup toolchain install 1.94.1 --profile minimal

# 交叉编译所需的 rust targets
rustup target add --toolchain 1.94.1 \
  aarch64-unknown-linux-gnu \
  x86_64-pc-windows-msvc \
  aarch64-pc-windows-msvc
```

> - `build.sh` 会**幂等检查**并自动补装（缺失才装），所以多数情况下不用手动做，但网络差时建议先手动装好。
> - loong64 目标**不使用** 1.94.1（它没有 LTO，沿用默认 toolchain 即可），需另装：
>   `rustup target add loongarch64-unknown-linux-gnu`
> - 源码要求：`MINIMUM_RUST_VERSION = 1.90.0`。

### 3.4 `~/.mozbuild`（mach bootstrap）

clang、cbindgen、nasm、node、pkgconf、nsis、sccache、dump_syms 等辅助工具由 `mach bootstrap` 统一管理在 `~/.mozbuild/`。正常**不需要手动跑**：mozconfig 里的 `--enable-bootstrap` 会在 configure 阶段自动下载。

如要手动初始化（或补 python 依赖）：

```bash
make bootstrap
# 等价于: cd librewolf-<ver>-<rel> && ./mach --no-interactive bootstrap --application-choice=browser
```

> loong64 目标**不开** bootstrap，但会借用 `~/.mozbuild` 里的 cbindgen/nasm/node/pkgconf（mozconfig 里已配 PATH）。

### 3.5 ccache（可选优化）

```bash
ccache -M 50G          # 设缓存上限
ccache -s              # 看命中率
```

---

## 4. 编译流程详解

### 4.1 目录与文件

| 路径 | 说明 |
|------|------|
| `firefox-<ver>.source.tar.xz` | 上游源码 tarball（`make fetch` 下载） |
| `librewolf-<ver>-<rel>/` | **打了补丁的源码树 + objdir**（编译产物，**不要手改**） |
| `assets/mozconfig.*` | 各平台编译配置（**只改这里**） |
| `patches/` + `assets/patches.txt` | 补丁及其清单 |
| `settings/` | `librewolf.cfg`、`policies.json` 等运行时配置 |

### 4.2 Makefile 目标

| 命令 | 作用 |
|------|------|
| `make fetch` | 下载 Firefox 源码 tarball（+ GPG 校验） |
| `make dir` | 解包 + 打补丁，生成/更新 `librewolf-<ver>-<rel>/` |
| `make build` | `mach build`（并行度由 mozconfig 或 `VANTAGE_JOBS` 决定） |
| `make package` | 基础打包（tar / NSIS / dmg） |
| `make package-all` | Linux：deb + rpm + AppImage + portable.tar.gz（+ 签名） |
| `make package-msix` | Windows：msix 预打包 |
| `make checksum` | 生成 `SHA256SUMS` |
| `make bootstrap` | mach bootstrap 初始化 |
| `make clean` / `veryclean` / `distclean` | 见 §9 |
| `make run` | 运行编译产物 |

> **并行度**：`MOZ_PARALLEL_BUILD`（mozconfig 内）或临时 `VANTAGE_JOBS=8 ./build.sh lx`。

### 4.3 `make dir` 的刷新规则（重要）

`make dir` 会**删除并重建** `librewolf-<ver>-<rel>/`（连 objdir 一起！），仅当它的依赖更新时才触发：

```
firefox-<ver>.source.tar.xz / version / release / scripts/librewolf-patches.py / assets/mozconfig / assets/patches.txt
```

- 改了 `assets/patches.txt`、`version`、`release` 或 `librewolf-patches.py` → 触发整树重建（= 全量重编）
- **只改 `patches/` 里的文件内容** → **不会自动触发**，需要 `touch assets/patches.txt` 或手动重建
- 日常小改想跳过重建：`touch librewolf-<ver>-<rel>`（让它比依赖新）

### 4.4 单目标手动流程（等价于 build.sh）

```bash
export MOZCONFIG="$(pwd)/assets/mozconfig.new"   # 换成目标对应文件
make dir
./scripts/fetch-pgo-profile.sh linux-x64          # 可选，见 §5
make build
make package
make package-all      # 仅 Linux
make checksum
```

---

## 5. 性能 / 体积优化配置（LTO / PGO / 语言包）

> 以下为 2026-09 起生效的默认配置，**无需手动操作**，了解即可（含回退方式）。详见 [`PERF-OPTIMIZATION.md`](PERF-OPTIMIZATION.md)。

### 5.1 LTO（链接时优化）

4 个主力平台 mozconfig 均含：

```
ac_add_options --enable-lto=cross,full
```

- `full` = full LTO；`cross` = **跨语言 LTO**（Rust ↔ C++），即 Mozilla 官方配置
- 依赖 §3.3 的 rust 1.94.1（LLVM 与 clang 一致）
- ⚠️ **full LTO 链接很吃内存**（libxul 峰值可能 20–40GB）；本机 33GB 有 OOM 风险，**建议在 CI（62GB）上构建**。OOM 就把 `cross,full` 改成 `cross`（thin，省内存）

### 5.2 PGO（复用 Mozilla 官方 profile）

- 脚本：`scripts/fetch-pgo-profile.sh <目标>` → 从 Taskcluster 下载官方 `profdata.tar.xz`，解出 `merged.profdata` 到
  **`~/.cache/vantage-pgo/<平台>/merged.profdata`**（`$HOME` 下，**不在仓库/workspace 内**；可用 `VANTAGE_PGO_CACHE` 覆盖）
- 平台映射：`linux-x64→linux64`、`windows-x64→win64`、`windows-arm64→win64-aarch64`
  （linux-arm64 / loong64 官方无 profile，自动跳过；macOS 已放弃）
- mozconfig 里是**条件块**：只有 profile 文件存在时才加 `--enable-profile-use=cross --with-pgo-profile-path=...`
  → 文件缺失 = 自动跳过 PGO，**构建不受影响**（这也是回退方式）
- `build.sh` 在 `make build` 前自动调用脚本（失败只告警）
- ⚠️ 下载**必须用 aria2c**（`curl` 到 Taskcluster 可能只有 ~20KB/s）；脚本已内置，无 aria2c 才回退 curl

手动操作：

```bash
./scripts/fetch-pgo-profile.sh linux-x64     # 单独拉
rm -rf ~/.cache/vantage-pgo                  # 关闭 PGO（下次构建自动跳过）
VANTAGE_PGO_FORCE=1 ./scripts/fetch-pgo-profile.sh windows-x64   # 强制重下
```

### 5.3 语言包裁剪

`Makefile` 的 `package` 目标只打包维护中的 6 种语言：

```
mach package-multi-locale --locales en-US en-GB en-CA zh-CN zh-MS zh-TW
```

（原行为 `cat browser/locales/shipped-locales | xargs ...` 已注释保留，改回即可恢复全语言。）

---

## 6. 各平台编译

### 6.1 Linux x64（原生）

```bash
./build.sh lx
```

### 6.2 Linux arm64

```bash
sudo apt install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
rustup target add --toolchain 1.94.1 aarch64-unknown-linux-gnu
./build.sh la
```

（mozconfig 用 `--target=aarch64-linux-gnu` + `--enable-bootstrap`，mach 自动拉交叉 clang。）

### 6.3 Linux loong64（最繁琐，需自制 sysroot）

概要（完整逐坑见 [`LOONG64-CROSS-COMPILE.md`](LOONG64-CROSS-COMPILE.md)）：

1. `sudo apt install qemu-user qemu-user-binfmt debootstrap lld`；`rustup target add loongarch64-unknown-linux-gnu`
2. `debootstrap --arch=loong64 --no-check-gpg sid /sysroot-loong64 https://deb.debian.org/debian-ports`
3. chroot 进 sysroot 装 `g++` + GTK/Pango/Wayland 等桌面库 dev 包
4. **ALSA 拼装**：sid ports 的 `libasound2-dev` 冲突 → 提取 `libasound2t64` 的 `.so` + 假 `alsa.pc` + stub 头 + `--disable-alsa`
5. mozconfig 已配好（系统 clang 19 + `--with-sysroot` + `--without-wasm-sandboxed-libraries`）
6. `./build.sh ll` → 产物**无 AppImage**

> loong64 **不使用** rust 1.94.1 / LTO（保持原样，零风险）。

### 6.4 Windows x64 / arm64（MSVC via msvc-wine）

```bash
sudo apt install -y wine
rustup target add --toolchain 1.94.1 x86_64-pc-windows-msvc aarch64-pc-windows-msvc
./build.sh wx      # x64
./build.sh wa      # arm64
```

- 走 `--target=*-pc-windows-msvc` + `--enable-bootstrap`（clang-cl / MSVC headers / Windows SDK 自动下载）
- 宿主需要 **wine**（MSVC 工具链是 Windows 程序）
- `MOZ_PARALLEL_BUILD=16`（Windows 目标别开 24，内存扛不住）
- 流程额外包含：WinUpdater 打包 + `make package-msix`
- 产物：`*-installer.exe`、`*.win-<arch>.portable.zip`、`*.msix-prepackage.zip`（预打包，不发布）

### 6.5 macOS（已放弃）

`assets/mozconfig.osx-cross*` 保留仅供将来参考；**近期不维护**，本机也未安装 osxcross 工具链（配置步骤见 `CROSS-COMPILE.md` §8）。

---

## 7. 打包与签名

| 命令 | 内容 | 平台 |
|------|------|------|
| `make package` | 基础包（tar / NSIS / dmg） | 全平台 |
| `make package-all` | deb / rpm / AppImage / portable.tar.gz + GPG 签名 | Linux |
| `make package-msix` | msix 预打包（上传 release 时排除） | Windows |
| `make checksum` | `SHA256SUMS` | 全平台 |

- GPG 私钥：`$HOME/vantage-repo-private-key.asc`，Key ID `907587D2812D7F8C`；产物 `SHA256SUMS.asc`
- AppImage runtime 缓存在 `assets/appimage-runtime/runtime-{x86_64,aarch64}`（loong64 无）

---

## 8. 常见问题与排错

### 8.1 编译失败类

| 现象 | 原因 | 解决 |
|------|------|------|
| `ld.lld: error: libgkrust.a(...rcgu.o): Invalid record` / `Unknown attribute kind` | rust 的 LLVM 与 clang 不一致（跨语言 LTO） | 确认 `RUSTUP_TOOLCHAIN=1.94.1` 已装；`rustc +1.94.1 --version --verbose` 应显示 `LLVM version: 21.1.8` |
| 改了 LTO 模式后**仍报同样错** | **cargo 不认 RUSTFLAGS 变化**，复用了旧 rust 产物 | 强制重建 rust：`rm -rf librewolf-<ver>-<rel>/obj-*/x86_64-unknown-linux-gnu`（或整树重建） |
| 链接期 OOM / 被 KILL | full LTO 链接吃内存 | 用更大内存机器（CI 62G），或把 `--enable-lto=cross,full` 降为 `--enable-lto=cross`；或加 swap |
| `git clone` / `make fetch` 报 HTTP/2 framing 错误 | GitHub/网络 | `git config --global http.version HTTP/1.1`；下载用 aria2c |
| configure 报工具链/库找不到 | rust target 或 apt 依赖缺失 | 对照 §3.2 / §3.3 补齐 |
| Windows 目标编译 OOM/卡死 | `-j` 太高 | `MOZ_PARALLEL_BUILD=16`（勿用 24） |
| loong64 各类报错 | sysroot 缺库 / ALSA 冲突 / wasm runtime | 见 §6.3 与 `LOONG64-CROSS-COMPILE.md` 的踩坑表 |

### 8.2 配置/流程类

| 现象 | 说明 |
|------|------|
| 改了 mozconfig 后行为没变 | 改 mozconfig 会触发 mach **重新 configure + 全量重编**；确认 `MOZCONFIG` 指向的文件正确（`export MOZCONFIG=$(pwd)/assets/mozconfig.xxx`） |
| 改了 `patches/` 但没生效 | `make dir` 不会因 patch 内容变化触发，需 `touch assets/patches.txt`（会整树重建） |
| PGO 没生效（想看有没有） | 看 configure 日志是否含 `--enable-profile-use` / `--with-pgo-profile-path`；`config.status` 里搜 `MOZ_PGO` / `PROFILE_USE_CFLAGS` |
| PGO profile 拉取慢/失败 | 用 aria2c（脚本已内置）；失败会自动跳过 PGO，构建继续 |
| rustup 下载卡住 | 用镜像：`export RUSTUP_DIST_SERVER=https://rsproxy.cn RUSTUP_UPDATE_ROOT=https://rsproxy.cn/rustup` |
| 想确认 LTO 真生效 | 编译出的 `.o` 应为 `LLVM IR bitcode`（`file foo.o`）；`config.status` 里 `MOZ_LTO=1`、`MOZ_LTO_CFLAGS`、`MOZ_LTO_RUST_CROSS` |

### 8.3 调试技巧

```bash
# 看完整编译/链接命令
(cd librewolf-<ver>-<rel> && ./mach build --verbose)

# 查看 configure 实际用的选项
grep -nE "enable-lto|profile-use|pgo-profile-path" librewolf-<ver>-<rel>/obj-*/.mozconfig
grep -nE "MOZ_LTO|MOZ_PGO|PROFILE_USE_CFLAGS|RUSTC_LLVM_VERSION" librewolf-<ver>-<rel>/obj-*/config.status

# 并行度覆盖（不改 mozconfig）
VANTAGE_JOBS=8 ./build.sh lx
```

---

## 9. 清理 / 回退

```bash
make clean        # 删源码 tarball 中间态、firefox-<ver>/ 等（保留 librewolf-<ver>-<rel>/）
make veryclean    # 再删 librewolf-<ver>-<rel>/（= 下次 make dir 全量重建）
make distclean    # 连 tarball 一起删（需要重新下载）
```

单项目回退：

```bash
# 关 PGO（最快）：删除缓存即可
rm -rf ~/.cache/vantage-pgo

# 关 LTO：注释 mozconfig 内 --enable-lto=cross,full
# 回退 rust：注释 export RUSTUP_TOOLCHAIN=1.94.1（同时把 LTO 降回 thin）
rustup toolchain uninstall 1.94.1

# 恢复全语言包：Makefile 里 package 目标换回注释中的原行为
```

---

## 10. CI 自动化

- **触发**：push tag `v*` → 自动构建 **5 平台**（linux-x64/arm64/loong64、windows-x64/arm64）；`workflow_dispatch` 可手动选
- **Runner**：self-hosted `vantage-builder`（标签 `vantage-builder`），先增量同步本地 mirror `/home/chen/git/vantage.git` 再 checkout，失败回退直连 GitHub
- **授权**：仅 `asystech-chen` / `Liangchenxu` 可触发
- **发布**：以构建生成的 `SHA256SUMS` 为权威清单 `gh release upload`，4 并发；跳过 `*.msix*` 预打包产物；release notes 由 `CHANGELOG.md` 按版本提取
- **CI 侧注意**：
  - `build.sh` 会**自动**拉 PGO profile、检查 rust（runner 已预装 rust 1.94.1 + 交叉 target）
  - PGO 缓存在 `$HOME/.cache/vantage-pgo`（CI 会 `rm -rf $GITHUB_WORKSPACE/*`，放 `$HOME` 下可跨构建保留）
  - **首次构建会全量重编**（LTO flags / rust 版本变化，ccache 命中低），属正常

---

*维护提示：改 `assets/mozconfig.*`、`build.sh`、`Makefile`、`.github/workflows/build-vantage.yml` 后，请同步更新本文档与 `PERF-OPTIMIZATION.md`。*
