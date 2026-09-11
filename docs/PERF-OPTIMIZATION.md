# Vantage 性能 / 体积优化（2026-09-11）

目标：**① 缩短启动到可上网的时间 ② 减小包体积**。全部改动均可一键回退。

## 改动清单

| 项 | 文件 | 作用 |
|---|---|---|
| LTO（thin，**非 cross**） | `assets/mozconfig.new`、`mozconfig.linux-arm64`、`mozconfig.win-cross`、`mozconfig.win-cross.arm64` | 提速 + 缩 `libxul`/`xul.dll` |
| PGO（复用 Mozilla 官方 profile） | `assets/mozconfig.new`、`mozconfig.win-cross`、`mozconfig.win-cross.arm64`、`mozconfig.osx-cross`、`mozconfig.osx-cross-arm64` | 启动提速 + 缩体积（最大杠杆） |
| PGO profile 拉取脚本 | `scripts/fetch-pgo-profile.sh`（新增） | 从 Taskcluster 拉 `merged.profdata` |
| PGO 拉取钩子 | `build.sh`（`build_target` 内、`make build` 前） | 构建前自动拉取；失败则跳过 PGO |
| 语言包裁剪 | `Makefile`（`package` 目标） | 只打包 6 个语言包，≈-10MB |

## 生效方式

- **LTO**：无条件启用。build.sh 用 `MOZCONFIG=assets/mozconfig.<target>` 交给 mach；mach 检测到 mozconfig 变化会重新 configure 并全量重编。
- **PGO**：`scripts/fetch-pgo-profile.sh <目标>` 把官方 `profdata.tar.xz` 解开成
  `.cache/pgo/<平台>/merged.profdata`；mozconfig 里**检测到该文件才**追加
  `--enable-profile-use=cross --with-pgo-profile-path=...`。文件缺失 → 自动跳过，构建不受影响。
  平台映射：linux-x64→linux64、windows-x64→win64、windows-arm64→win64-aarch64、
  macos-x64→macosx64、macos-arm64→macosx64-aarch64。linux-arm64 / loong64 官方无 profile（跳过）。
- **语言包**：`make package` 直接调用 `mach package-multi-locale --locales en-US en-GB en-CA zh-CN zh-MS zh-TW`。

## 回退（随时可退）

1. **整体回退**：`git checkout -- Makefile build.sh assets/mozconfig.*` 并删除 `scripts/fetch-pgo-profile.sh`。
   （回退点：`218d7bb`；改动前快照另存于 `~/.openclaw/workspace/backup/perf-20260911/`）
2. **只关 PGO**：删掉 `.cache/pgo/` 目录（mozconfig 自动跳过），或注释各 mozconfig 内的 `VANTAGE_PGO_PROFILE` 块。
3. **只关 LTO**：注释各 mozconfig 内的 `ac_add_options --enable-lto=thin`。
4. **恢复全部语言包**：把 `Makefile` 里 `package` 目标那行换回注释中的原行为
   `cat browser/locales/shipped-locales | xargs ./mach package-multi-locale --locales`。

## ⚠️ 为什么 LTO 不用 cross（血泪）

首次尝试 `--enable-lto=cross`（跨语言 LTO）在链接期失败：
`ld.lld: error: libgkrust.a(...rcgu.o): Invalid record`。
根因：本地 rustc 是 rustup 的 **1.95（LLVM 22.1.2）**，而 clang 是 bootstrap 的 **21.1.8（LLVM 21）**；
cross 的 `-Clinker-plugin-lto` 让 clang 的 LTO 插件去读 rust 的 bitcode → 版本不匹配。
（最小复现已确认：非 cross 的 `-Clto` + clang `-flto=thin` 链接正常。）
Mozilla 官方能用 cross，是因为他们 CI 里 rust/clang LLVM 版本一致；本地环境做不到，故用 **thin（非 cross）**。

**另一个坑**：改完 LTO 模式后首次重编仍可能失败——因为 **cargo 不认 RUSTFLAGS 变化**，不会自动重建 rust，会复用上一次（cross）留下的 bitcode 版 `libgkrust.a`。
解决：强制重建 rust（删 cargo target 目录，或整树重建）：
```bash
rm -rf ~/Vantage/librewolf-153.2.0-1/obj-x86_64-pc-linux-gnu/x86_64-unknown-linux-gnu
```

## 注意

- 改 mozconfig / Makefile / build.sh 都会触发**全量重编**（LTO 改了编译 flags）。
- 若 PGO profile 与源码/工具链不匹配，编译期可能告警；源码已带 `-Wno-error=backend-plugin` 容错，
  真失败就删 `.cache/pgo/` 回退到纯 LTO。
- 实际提速由桶哥实测（我看不到界面）。
