# MSIX 打包（home-nas 远程封包）

## 0. 一句话

Linux 上只能生成 **MSIX 暂存目录**；真正的封包（`makeappx pack`）由 **home-nas 上的一个只做这件事的 HTTP 服务**完成。
`make package-msix` 会自动走完整条链路，产出的 `*.msix` **会随 release 一起发布**。

---

## 1. 为什么不能在 Linux 上封包

| 尝试 | 结果 |
|---|---|
| 本机装 `makeappx.exe` | Windows SDK 工具，Linux 上没有 |
| `wine` 跑 `makeappx.exe` | ❌ 能启动、能打印版本，但 `pack` 一律**静默 exit 1**。根因：wine 的 `ntdll` 把 `RtlInitializeGenericTableAvl` / `RtlInsertElementGenericTableAvl` 等 AVL 通用表 API 实现成空 stub，而 makeappx 依赖它们。试过 10.0.26100 / 10.0.28000 两个版本，一样 |
| 用 `makemsix`（msix-packaging） | 需要自行构建 C++ 项目，收益不如直接用真 Windows |

所以：**Linux 负责暂存，Windows 负责封包**。

---

## 2. 流水线

```
make package-msix
   │
   ├─ 1. 从 MOZCONFIG 推导架构（--target=），定位 obj-<arch>-pc-windows-msvc/dist/*.zip
   ├─ 2. 清空 mach 共享暂存槽位 ~/.mozbuild/cache/mach-msix/msix-temp-unofficial
   │     （mach 写死不区分架构，双架构编译时会互相污染）
   ├─ 3. ./mach repackage msix ... --makeappx scripts/msix-stage-shim
   │     → 生成暂存目录（AppxManifest.xml + Assets + VFS/...）
   │     shim 让 mach 正常返回，不再靠 `|| true` 吞异常
   ├─ 4. 压成 vantage-<ver>-<rel>.<arch>.msix-prepackage.zip
   └─ 5. scripts/msix-remote.sh（默认 --transport http）
          POST /v1/pack?arch=…  →  服务端解压 + makeappx pack
          GET  /v1/artifact/…   →  拉回 vantage-<ver>-<rel>.<arch>.msix
          双边 SHA256 对账
```

打包机不可达 / 没配 token → **只留预打包 zip，不阻塞构建**（退出码 0）。

---

## 3. 前置条件

### 3.1 打包机（只做一次）

在 Windows 打包机上以管理员运行：

```powershell
# 把 scripts/msix-service.ps1 与 scripts/msix-service-install.ps1 放到同一目录后：
powershell -NoProfile -ExecutionPolicy Bypass -File msix-service-install.ps1 -ClientIp <构建机IP>
```

（`-ClientIp` 是必填项：防火墙只放行这一个 IP，故意不写默认值。）

脚本会（幂等，可重复运行）：

1. 建目录 `D:\vantage-msix\{service,secrets,in,work,out,logs,tools}`
2. 生成 bearer token → `D:\vantage-msix\secrets\token.txt`
3. 建**非管理员**本地用户 `msixsvc`（随机密码存 `secrets\msixsvc.pass`），并只给它 `D:\vantage-msix` 的 Modify 权限
4. 授权“作为批处理作业登录”（**必需**，否则计划任务起不来，报 `0x80070569`）
5. `netsh http add urlacl` 只授权给 `msixsvc`
6. 防火墙入站 `TCP 38417` **仅允许构建机 IP**
7. 注册并启动计划任务 `VantageMsixService`（开机自启，以 msixsvc 运行，`RunLevel Limited`）
8. 自测 `GET /v1/health`

`makeappx.exe` 不用手动准备：`msix-remote.sh` 发现打包机缺它时会自动从 NuGet
（`Microsoft.Windows.SDK.BuildTools`，约 22MB）下载并上传。

### 3.2 构建机

token 解析顺序：`MSIX_TOKEN` 环境变量 → `--token-file` → `<repo>/.cache/msix-token` → `~/.config/vantage/msix-token`

```bash
mkdir -p ~/.config/vantage && umask 077
ssh <打包机> "powershell -NoProfile -Command \"(Get-Content 'D:\vantage-msix\secrets\token.txt').Trim()\"" \
  | tr -d '\r\n' > ~/.config/vantage/msix-token     # 注意必须去掉 CR
chmod 600 ~/.config/vantage/msix-token
```

> **CI 为什么放 HOME 下**：workflow 会整体清空 `$GITHUB_WORKSPACE`（仓库内文件全部没掉），
> 而 runner 的 `$HOME` 是持久的 → 放 `~/.config/vantage/msix-token` 就能开箱可用，
> **不依赖 GitHub Secret**。想走 Secret 也行：配 `MSIX_TOKEN` 即可（优先级最高）。
>
> 本地手动跑也可以再放一份到 `<repo>/.cache/msix-token`（`.cache/` 已 gitignore）。

---

## 4. 用法

```bash
# 一步到位：暂存 + 远程封包（架构从 MOZCONFIG 推导）
MOZCONFIG=$PWD/assets/mozconfig.win-cross        make package-msix     # x64
MOZCONFIG=$PWD/assets/mozconfig.win-cross.arm64  make package-msix     # arm64

# 只重封包（拿仓库根最新的 *.msix-prepackage.zip）
make package-msix-remote

# 只出预打包 zip，不联网
make package-msix MSIX_REMOTE=0

# 直接调脚本
scripts/msix-remote.sh --help
scripts/msix-remote.sh --transport ssh --provision-only   # 应急：只装备打包机
```

环境变量：

| 变量 | 默认 | 说明 |
|---|---|---|
| `MSIX_ARCH` | 从 `MOZCONFIG` 推导 | `x86_64` / `aarch64`，可手动指定 |
| `MSIX_REMOTE` | `1` | `0` = 不远程封包 |
| `MSIX_REMOTE_HOST` | `home-nas` | SSH 模式使用 |
| `MSIX_URL` | `http://home-nas.local:38417` | HTTP 模式服务地址 |
| `MSIX_TOKEN` | — | bearer token（优先于 token 文件） |
| `MSIX_TRANSPORT` | `http` | `http` / `ssh` |

---

## 5. 服务端 API

全部需要 `Authorization: Bearer <token>`；无 token / token 错 → 401。

| 方法 | 路径 | 说明 |
|---|---|---|
| GET | `/v1/health` | `{ok, makeappx, free_gb, time}` |
| GET | `/v1/jobs` | 列出 `out/` 里最近的产物 |
| POST | `/v1/pack?arch=x86_64\|aarch64` | body = `*.msix-prepackage.zip`；同步返回 `{job, out, size_mb, sha256, unzip_sec, pack_sec}` |
| GET | `/v1/artifact/<name>` | 下载 `.msix`（名字白名单 `^[A-Za-z0-9._-]+\.msix$`） |
| DELETE | `/v1/jobs/<id>` | 删除该任务的 `in/`、`work/`、`out/` 文件 |

设计要点：

- 请求参数**只有 `arch`**，所有路径由服务端决定 → 无目录穿越 / 无命令注入
- `makeappx` 参数写死，不经过 shell
- 单包上限 800MB
- token 每次请求实时读文件 → **改一行即可轮换，不用重启**
- 顺序处理（一次一个任务），扫描式 `GetContext()` 循环

服务端目录：

```
D:\vantage-msix\
├── service\   msix-service.ps1（+ 安装脚本副本）
├── secrets\   token.txt / msixsvc.pass
├── tools\     makeappx.exe 等（自动装备）
├── in\  work\  out\   任务中间目录
└── logs\service.log
```

---

## 6. CI（GitHub Actions）

`build-vantage.yml` 的 Build 步骤已经带上：

```yaml
env:
  MSIX_TOKEN: ${{ secrets.MSIX_TOKEN }}
  MSIX_URL: ${{ vars.MSIX_URL }}     # 可选，默认 http://home-nas.local:38417
```

- **不必须**配 GitHub Secret：自托管 runner 上把 token 放 `~/.config/vantage/msix-token` 即可（第一步就是解析它）
- 若配了 `MSIX_TOKEN` secret，则优先用它（适合多台 runner 或用临时凭据的场景）
- runner 与打包机需在同一网段、且打包机防火墙已放行该 runner 的 IP
- 未配置 token 时，Windows 目标**只会产出** `*.msix-prepackage.zip`，构建不失败
- 发布：`SHA256SUMS` 为权威清单，**只跳过 `*.msix-prepackage.zip`**，成品 `*.msix` 正常上传 release

---

## 7. 排错

| 现象 | 原因 / 处理 |
|---|---|
| `⚠️ 找不到 token` | 打包机 token 与 `~/.cache/msix-token` 不一致；去打包机读 `secrets\token.txt` |
| 服务 401 | token 错，或客户端 header 里混入了 `\r`（用 `tr -d '\r\n'` 生成 token 文件） |
| 客户端 curl 报 400 Bad Request | 同上，header 里的 CR 会让 http.sys 直接拒绝 |
| 计划任务起不来（`0x80070569`） | 服务账号缺“作为批处理作业登录”；重跑安装脚本 |
| `FATAL: cannot start listener ... 前缀注册冲突` | 端口 38417 已被别的进程占用——常见于手工前台跑过服务且没杀干净（`timeout N ssh …` 杀不掉远端 PowerShell） |
| 封包变慢（解压数十秒） | `in/`/`work/` 累积导致 Defender 反复扫描；用 `DELETE /v1/jobs/<id>` 或 `msix-remote.sh --clean` 清理 |
| 双架构产物混在一起 | 旧版 Makefile 的问题，现已修复：架构从 `MOZCONFIG` 推导，且封包前清空暂存槽位 |

查看服务日志：

```powershell
Get-Content D:\vantage-msix\logs\service.log -Tail 50
```

---

## 8. 变更记录

- **2026-09-13** 上线：`package-msix` 改为架构感知 + 自动远程封包；新增 `msix-stage-shim`、`msix-pack.ps1`、`msix-remote.sh`、`msix-service.ps1`、`msix-service-install.ps1`；CI 放行成品 `*.msix` 发布
