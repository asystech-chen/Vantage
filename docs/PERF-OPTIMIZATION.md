# Vantage 性能 / 体积优化（2026-09-11）

目标：**① 缩短启动到可上网的时间 ② 减小包体积**。全部改动均可一键回退。

## 改动清单

| 项 | 文件 | 作用 |
|---|---|---|
| LTO（**full + 跨语言 cross**） | `assets/mozconfig.new`、`mozconfig.linux-arm64`、`mozconfig.win-cross`、`mozconfig.win-cross.arm64` | 提速 + 缩 `libxul`/`xul.dll` |
| rust 固定 1.94.1 | 同上 4 个 mozconfig（`export RUSTUP_TOOLCHAIN=1.94.1`） | LLVM 与 clang 一致 → 解锁跨语言 LTO + Rust PGO |
| rust 工具链保障 | `build.sh`（缺失才装 1.94.1 + 交叉 target） | 幂等；CI 首次会下载 |
| PGO（复用 Mozilla 官方 profile） | `assets/mozconfig.new`、`mozconfig.win-cross`、`mozconfig.win-cross.arm64` | 启动提速 + 缩体积（最大杠杆） |
| PGO profile 拉取脚本 | `scripts/fetch-pgo-profile.sh`（新增） | 从 Taskcluster 拉 `merged.profdata` |
| PGO 拉取钩子 | `build.sh`（`build_target` 内、`make build` 前） | 构建前自动拉取；失败则跳过 PGO |
| 语言包裁剪 | `Makefile`（`package` 目标） | 只打包 6 个语言包，≈-10MB |

## 生效方式

- **rust 版本**：4 个 mozconfig `export RUSTUP_TOOLCHAIN=1.94.1`（其 **LLVM 21.1.8 == bootstrap clang 21.1.8**）。缺失时 build.sh 会自动装（含 aarch64-linux / win-msvc 交叉 target）。
- **LTO**：`--enable-lto=cross,full`（full C++ LTO + 跨语言 Rust↔C++ LTO）。build.sh 用 `MOZCONFIG=assets/mozconfig.<target>` 交给 mach；mach 检测到 mozconfig 变化会重新 configure 并全量重编。
- **PGO**：`scripts/fetch-pgo-profile.sh <目标>` 把官方 `profdata.tar.xz` 解开成
  `~/.cache/vantage-pgo/<平台>/merged.profdata`（`$HOME` 下，不在仓库/workspace 内）；mozconfig 里**检测到该文件才**追加
  `--enable-profile-use=cross --with-pgo-profile-path=...`。文件缺失 → 自动跳过，构建不受影响。
  平台映射：linux-x64→linux64、windows-x64→win64、windows-arm64→win64-aarch64。
  linux-arm64 / loong64 官方无 profile（跳过）。
  ⚠️ **macOS 已放弃（近期不维护）**：不对 mac mozconfig 做任何 LTO/PGO 改动（脚本里保留 mac 映射仅为将来备用）。
- **语言包**：`make package` 直接调用 `mach package-multi-locale --locales en-US en-GB en-CA zh-CN zh-MS zh-TW`。

## 回退（随时可退）

1. **整体回退**：`git checkout -- Makefile build.sh assets/mozconfig.*` 并删除 `scripts/fetch-pgo-profile.sh`。
   （回退点：`218d7bb`；改动前快照另存于 `~/.openclaw/workspace/backup/perf-20260911/`）
2. **只关 PGO**：删掉 `~/.cache/vantage-pgo/` 目录（mozconfig 自动跳过；也可设 `VANTAGE_PGO_CACHE` 指向空目录），或注释各 mozconfig 内的 `VANTAGE_PGO_PROFILE` 块。
3. **只关 LTO**：注释各 mozconfig 内的 `ac_add_options --enable-lto=cross,full`（想降成 thin 就改回 `--enable-lto=thin`）。
   - **只回退 rust**：注释 `export RUSTUP_TOOLCHAIN=1.94.1`（同时要把 LTO 降回 thin，否则跨语言 LTO 会链接失败）；彻底删除：`rustup toolchain uninstall 1.94.1`。
   - ⚠️ **full LTO 链接很吃内存**（libxul 可能 20–40GB）；本机 33GB 有风险，**建议在 CI（62GB）上编**；OOM 就把 `cross,full` 降为 `cross`（thin）。
4. **恢复全部语言包**：把 `Makefile` 里 `package` 目标那行换回注释中的原行为
   `cat browser/locales/shipped-locales | xargs ./mach package-multi-locale --locales`。

## ⚠️ 跨语言 LTO 与 rust 版本（血泪 → 已解决）

- 第一阶段用 `--enable-lto=cross` 链接失败：`ld.lld: error: libgkrust.a(...rcgu.o): Invalid record`。
  根因：系统 rustc 是 rustup stable **1.95（LLVM 22.1.2）**，clang 是 bootstrap **21.1.8（LLVM 21）**，
  cross 的 `-Clinker-plugin-lto` 让 clang 21 的 LTO 插件读 rust 的 LLVM22 bitcode → 读不了。
- **解决**：把构建 rust 固定为 Mozilla 给 ESR153 钉的 **1.94.1（LLVM 21.1.8，与 clang 完全一致）**，
  于是 LTO 可以上 **`cross,full`**（= Mozilla 官方配置），且 Rust 侧 PGO 也不会再被丢弃。
- 最小复现（`/tmp/ltorepro`）已逐一验证：1.95 → 失败；1.90(LLVM20)/1.94.1(LLVM21) → 成功。

**另一个坑**：改完 LTO 模式后首次重编仍可能失败——因为 **cargo 不认 RUSTFLAGS 变化**，不会自动重建 rust，会复用上一次（cross）留下的 bitcode 版 `libgkrust.a`。
解决：强制重建 rust（删 cargo target 目录，或整树重建）：
```bash
rm -rf ~/Vantage/librewolf-153.2.0-1/obj-x86_64-pc-linux-gnu/x86_64-unknown-linux-gnu
```

## 注意

- 改 mozconfig / Makefile / build.sh 都会触发**全量重编**（LTO 改了编译 flags）。
- 若 PGO profile 与源码/工具链不匹配，编译期可能告警；源码已带 `-Wno-error=backend-plugin` 容错，
  真失败就删 `~/.cache/vantage-pgo/` 回退到纯 LTO。
- 实际提速由桶哥实测（我看不到界面）。

## 平台范围

- **在维护**：Linux x64/arm64/loong64、Windows x64/arm64（CI tag 发布就编这 5 个）
- **macOS 已放弃**（至少近期不碰）：本机 osx-cross 工具链也已不在

## CI（self-hosted runner）

- CI 跑 `./build.sh` → 自动拉 profile，**无需改 workflows**
- runner 已具备：`aria2c` / `jq` / `curl` / `tar` / `xz`；Taskcluster 可达
- 缓存放 `$HOME/.cache/vantage-pgo/`（**在 workspace 之外**）——CI 每次会
  `rm -rf "$GITHUB_WORKSPACE"/*`，放外面的缓存**跨构建保留**，不重复下载
- PGO 拉取失败/网络抖动 → 自动跳过 PGO，CI 不会因此失败
- ⚠️ 首次启用后 CI 会**全量重编**（LTO 改了 flags，ccache 命中率低），属正常
