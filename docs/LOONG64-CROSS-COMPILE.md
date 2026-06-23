# Vantage LoongArch64 (loong64) Linux 交叉编译指南

## 前置条件

- x86_64 Debian 13 宿主机
- clang 19+（需支持 loongarch64 target）
- Rust loongarch64 target：`rustup target add loongarch64-unknown-linux-gnu`
- 约 2GB sysroot 磁盘空间 + 编译产物空间

## 1. 安装工具链

```bash
# qemu-user（模拟 loong64 指令跑包管理器）
sudo apt install qemu-user qemu-user-binfmt debootstrap lld

# 确认 qemu 二进制存在
which qemu-loongarch64
```

## 2. 创建 loong64 sysroot

```bash
# 用 Debian Ports（sid）创建基础系统
sudo debootstrap --arch=loong64 --no-check-gpg \
  sid /sysroot-loong64 https://deb.debian.org/debian-ports

# 配置 qemu + DNS 进 sysroot
sudo cp /usr/bin/qemu-loongarch64 /sysroot-loong64/usr/bin/
sudo cp /etc/resolv.conf /sysroot-loong64/etc/
```

## 3. 安装编译依赖

```bash
sudo chroot /sysroot-loong64 bash -c '
  export DEBIAN_FRONTEND=noninteractive

  # 基础工具
  apt update
  apt install -y g++ pkgconf zip unzip curl m4 perl python3

  # GTK/Pango/Wayland 等桌面库
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

## 4. 解决 ALSA 依赖冲突

sid ports 的 `libasound2-dev` 和 `libasound2-data` 版本冲突，装不了开发包。直接提取运行时共享库：

```bash
# 下载并提取 libasound.so.2
sudo chroot /sysroot-loong64 apt download libasound2t64
sudo dpkg-deb -x /sysroot-loong64/libasound2t64*.deb /tmp/alsa-tmp
sudo cp /tmp/alsa-tmp/usr/lib/loongarch64-linux-gnu/libasound.so* \
  /sysroot-loong64/usr/lib/loongarch64-linux-gnu/
sudo ln -sf libasound.so.2 /sysroot-loong64/usr/lib/loongarch64-linux-gnu/libasound.so

# 放假的 ALSA 头文件 + pkg-config
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

## 5. Mozconfig 配置

`assets/mozconfig.linux-loong64`（已就绪，关键点）：

- `--target=loongarch64-linux-gnu`
- `--with-sysroot=/sysroot-loong64`
- `--without-wasm-sandboxed-libraries`（WASM sandbox 编译依赖未完全满足）
- `--disable-alsa`（ALSA 用上面提取的运行时库 + stub 头文件绕过）
- `PKG_CONFIG_LIBDIR` 指向 sysroot 内的 loong64 pkgconfig
- CC/CXX 用系统 clang（不是 Mozilla bootstrap 的 clang，后者不支持 loong64）

## 6. 编译

```bash
cd ~/Vantage
MOZCONFIG=$(pwd)/assets/mozconfig.linux-loong64 make clean
MOZCONFIG=$(pwd)/assets/mozconfig.linux-loong64 make dir
MOZCONFIG=$(pwd)/assets/mozconfig.linux-loong64 make build
MOZCONFIG=$(pwd)/assets/mozconfig.linux-loong64 make package
```

或 `./build.sh ll`。

## 踩坑记录

| 问题 | 原因 | 解决 |
|------|------|------|
| configure 报 GTK/Pango/pkg-config 找不到 | sysroot 没装桌面库 dev 包 | 装 `libgtk-3-dev` 等 |
| `fatal error: 'cstddef' file not found` | sysroot 缺 C++ 头文件 | `apt install g++` |
| `Package alsa was not found` | `--disable-alsa` 没完全跳过检查，且 sid 里 libasound2-dev 有版本冲突 | 手动提取 `libasound.so.2` + 写假 `alsa.pc` + stub 头文件 |
| `fatal error: 'alsa/asoundlib.h' file not found` | MIDI 模块需要 ALSA 头 | stub 头文件 |
| `wasm-ld: error: cannot open libclang_rt.builtins.a` | 系统 clang 缺 wasm32 runtime | `--without-wasm-sandboxed-libraries` |
| `ld.lld: unable to find library -lasound` | sysroot 没有 libasound | 提取 `libasound2t64.deb` 中的 so |
| `undefined symbol: snd_seq_*` | 旧 stub `libasound.so`（无 sequencer 符号）没被替换 | `rm libasound.so && ln -s libasound.so.2 libasound.so` |
| `optional-extensions/*` 缺失（Windows 打包用） | `librewolf-patches.py` 里 manifest 和 moz.build 路径不一致 | 改 `@RESPATH@/distribution/optional-extensions/*` → `@RESPATH@/distribution/*.xpi`（已修） |

## 注意事项

1. **sid ports 依赖经常漂移**：如果 debootstrap 报 base packages 配置失败（adduser/vim-tiny 依赖版本不匹配），忽略即可，不影响交叉编译。
2. **WASM sandbox 禁用了**：安全影响很小，功能不受影响。
3. **ALSA 是假的**：用的是真实运行时库 + stub 头文件 + `--disable-alsa` 编译开关。loong64 真机上需要用 PulseAudio 或 PipeWire。
4. **增量编译**：第二次编译修改过的文件会很快，不需要全量重编。
5. **调试编译错误**：加 `--verbose` 可以看到完整编译/链接命令。
