# Vantage 多线程下载（MultiThreadSaver）实现方案 v1.0

> 状态：✅ 技术验证已完成（基于 Firefox ESR 153.1.0 源码树 `~/Vantage/librewolf-153.1.0-1/`）
> 本文档自包含，实现者无需额外上下文即可开工。
> 目标：**最小代码量、纯 JS、不碰 C++**，服务器支持 Range 就多线程提速，不支持自动降级为原生单线程。

---

## 0. 开工前必读（按顺序）

1. 本文档全文
2. `~/Vantage/README.md`、`~/Vantage/MERGE-GUIDE.md` — 项目规则
3. 源码树中以下文件（对照本文档核对行号/接口）：
   - `librewolf-153.1.0-1/toolkit/components/downloads/DownloadCore.sys.mjs`（核心）
   - `librewolf-153.1.0-1/toolkit/components/downloads/Downloads.sys.mjs`
   - `librewolf-153.1.0-1/toolkit/components/downloads/moz.build`
4. `~/Vantage/scripts/librewolf-patches.py` — patch 应用机制（`patch --forward --binary -p1 -i`）

### 红线（Vantage 项目规则）

- `librewolf-153.1.0-1/` 是编译产物/源码树，**只读**，绝不在其中直接改文件，所有修改必须走 patch 文件
- patch 文件放 `~/Vantage/patches/`，并同步更新 `~/Vantage/assets/patches.txt`
- 所有改动完成后运行 `~/Vantage/scripts/check-merge.sh` 验证
- 改仓库已有文件前需桶哥确认

---

## 1. 背景与目标

Firefox（及 Vantage）内置下载器是**单线程**的。本方案实现一个可替换的下载传输引擎（saver）：

- 服务器支持 HTTP `Range` 且文件 ≥ 阈值 → 切成 4 片并行下载 → 合并
- 不支持 / 文件太小 / 动态内容 → 静默降级单线程，用户无感
- 下载面板、通知、about:downloads、文件落盘位置**全部复用原生逻辑，零 UI 改动**

### 明确不做（第一版范围外）

- ❌ 分片级断点续传（暂停=取消，恢复=重新下载）
- ❌ 自适应分片数 / 动态调度
- ❌ 下载完成后自动校验（SHA-256 由原生 `getSha256Hash` 机制保留即可）
- ❌ 修改任何 C++ 代码

---

## 2. 已验证的技术事实（基于 ESR 153.1.0 源码，实现时以此为准）

### 2.1 DownloadSaver 扩展点存在且完整

文件：`toolkit/components/downloads/DownloadCore.sys.mjs`（ESM 格式，非 .jsm）

```js
// 约 2175 行
export var DownloadSaver = function () {};

DownloadSaver.prototype = {
  download: null,              // Download 对象引用（反序列化时自动建立）
  async execute(aSetProgressBytesFn, aSetPropertiesFn) {},  // 主入口
  cancel() {},                 // 取消
  async removeData() {},       // 清理（execute settle 后调用）
  addToHistory() {},           // 内置实现，直接复用
  toSerializable() {},         // 序列化
  getSha256Hash() {},          // 原生默认实现可用
  getSignatureInfo() {},
};
```

### 2.2 自定义 saver 注册点

```js
// 约 2279 行
DownloadSaver.fromSerializable = function (aSerializable) {
  let serializable = isString(aSerializable) ? { type: aSerializable } : aSerializable;
  let saver;
  switch (serializable.type) {
    case "copy":    saver = DownloadCopySaver.fromSerializable(serializable); break;
    case "legacy":  saver = DownloadLegacySaver.fromSerializable(serializable); break;
    // TODO: 在这里加 case "multithread"
    default: throw new Error("Unrecoginzed download saver type.");
  }
  return saver;
};
```

### 2.3 挂载点：所有下载的唯一入口

`toolkit/components/downloads/Downloads.sys.mjs`：

```js
// 约 93 行
async createDownload(properties) {
  return Download.fromSerializable(properties);
}
```

浏览器 UI 与 WebExtension `downloads` API 的下载**全部经过这里**。`properties.saver` 缺省时默认为 `"copy"`（`Download.fromSerializable` 约 1491 行）。

### 2.4 文件生命周期机制（原生语义，必须保持）

- `download.target.path` — 最终文件路径
- `download.target.partFilePath` — 下载中的 .part 路径（调用方提供，如 `contentAreaUtils.js` 的 `file.path + ".part"`；**可能为 null**）
- 下载开始：saver 先 `await IOUtils.writeUTF8(targetPath, "", { mode: "appendOrCreate" })` 创建占位文件（防文件名复用）
- 下载完成：saver 负责 `IOUtils.move(partFilePath, targetPath)`（参考 DownloadCopySaver 约 2871 行）
- 失败/取消：`removeData()` 清理（参考约 2920 行，`_tryToRemoveFile(partFilePath)`）
- UI 依赖 `partFilePath` 显示"下载中"状态（`browser/components/downloads/content/downloads.js:1200`），**分片模式也必须写 .part 文件**

### 2.5 channel 创建模式（原生代码，分片下载必须复用）

参考 `DownloadCopySaver.execute`（约 2596-2680 行）。关键点：

```js
let channel = lazy.NetUtil.newChannel({
  uri: download.source.url,
  contentPolicyType: Ci.nsIContentPolicy.TYPE_SAVEAS_DOWNLOAD,
  loadUsingSystemPrincipal: true,          // 或 loadingPrincipal 分支，照抄原生
});
if (channel instanceof Ci.nsIPrivateBrowsingChannel) {
  channel.setPrivate(download.source.isPrivate);
}
if (channel instanceof Ci.nsIHttpChannel && download.source.referrerInfo) {
  channel.referrerInfo = download.source.referrerInfo;
}
if (channel instanceof Ci.nsIHttpChannel && download.source.cookieJarSettings) {
  channel.loadInfo.cookieJarSettings = download.source.cookieJarSettings;
}
if (channel instanceof Ci.nsIHttpChannelInternal) {
  channel.channelIsForDownload = true;
  channel.forceAllowThirdPartyCookie = true;   // 保留第三方 cookie
}
// 分片时在此加：
// channel.QueryInterface(Ci.nsIHttpChannel).setRequestHeader("Range", "bytes=X-Y", false);
```

⚠️ **必须保留** cookie / referrer / authHeader / userContextId / isPrivate 的处理，否则登录态下载会挂。

### 2.6 后台写盘组件（直接复用，不重新发明）

```js
// DownloadCore.sys.mjs 约 43 行
const BackgroundFileSaverStreamListener = Components.Constructor(
  "@mozilla.org/network/background-file-saver;1?mode=streamlistener",
  "nsIBackgroundFileSaver"
);
```

用法：`new BackgroundFileSaverStreamListener()` → 设 `observer`（`onSaveComplete(aSaver, aStatus)`）→ `setTarget(file, keepPartialData)` → 把 channel 的 stream listener 转发给它 → `channel.asyncOpen(backgroundFileSaver)`。**每个分片一个实例**，C++ 后台线程流式写盘，不占 JS 内存。

### 2.7 进度汇报契约

```js
// saver 内任意时刻调用：
aSetProgressBytesFn(currentBytes, totalBytes, canUsePartialData);
// currentBytes: 已下载字节（分片模式=各分片累计）
// totalBytes: 总字节（-1 表示未知）
// canUsePartialData: 第一版恒传 false（不保留分片部分数据）
```

下载面板 UI 自动更新，无需改 UI。

### 2.8 模块注册

`toolkit/components/downloads/moz.build` 的 `EXTRA_JS_MODULES` 列表：

```python
EXTRA_JS_MODULES += [
    "DownloadCore.sys.mjs",
    "DownloadIntegration.sys.mjs",
    # ... 在此加 "MultiThreadSaver.sys.mjs",
]
```

### 2.9 patch 机制

- `scripts/librewolf-patches.py` 进入 `librewolf-{version}-{release}/`（当前 `librewolf-153.1.0-1/`）后，对 `assets/patches.txt` 每行执行 `patch --forward --binary -p1 -i patches/xxx.patch`
- patch 文件格式：标准 git diff（`--- a/...` / `+++ b/...`），新文件也可包含在 patch 中
- 已在 `patches/` 的补丁（9 个独有）是合并时的底线，**不要动它们**

---

## 3. 设计决策（含理由）

| 决策 | 值 | 理由 |
|------|-----|------|
| 分片数 | 固定 4 | 代码最少；兼顾提速与不被服务器限流 |
| 最小文件阈值 | 5 MB（pref 可调） | 小文件分片无意义，还增加服务器负担 |
| 降级策略 | saver 内部单 channel 下载 | 与原生等效，用户无感；不重开下载流程 |
| 写盘 | 每片一个 BackgroundFileSaver | C++ 后台线程流式，性能与原生一致 |
| 暂停/恢复 | 暂停=取消；恢复=重下 | 第一版简化，状态机最简单 |
| canUsePartialData | 恒 false | 避免分片部分数据管理复杂度 |
| 进度 | 各分片字节累计 | UI 无需任何改动 |
| pref 开关 | `vantage.download.multithread` 默认 true | 符合 Vantage pref 命名空间 |

---

## 4. 数据流

```
Downloads.sys.mjs createDownload(properties)
  └─ pref 开启 && URL 是 http/https
       └─ properties.saver = "multithread"
            └─ Download.fromSerializable → MultiThreadSaver
                 └─ execute():
                     1. addToHistory()（复用基类）
                     2. 创建占位文件（照抄原生）
                     3. Range 探测
                        ├─ 支持 && Content-Length ≥ 阈值
                        │    └─ 4 个分片 channel（Range: bytes=a-b）
                        │         └─ 各配 BackgroundFileSaver → .part.mt0~3
                        │              └─ 全部完成 → 流式合并到 .part → move 到 target.path
                        └─ 不支持 / 太小 / 异常
                             └─ 单 channel 下载（原生逻辑简化版）→ move 到 target.path
```

分片文件命名：`partFilePath + ".mt" + i`（如 `foo.zip.part.mt0`）；`partFilePath` 为 null 时用 `targetPath + ".part.mt" + i` 并在完成时直接 move 到 targetPath。

---

## 5. 改动清单（共 6 处，全部在源码树内 → 打成一个 patch）

### 5.1 新文件：`toolkit/components/downloads/MultiThreadSaver.sys.mjs`（核心，~350 行）

骨架如下（实现者需补全细节，所有 API 均已验证存在）：

```js
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. ... */

import { Integration } from "resource://gre/modules/Integration.sys.mjs";
import { XPCOMUtils } from "resource://gre/modules/XPCOMUtils.sys.mjs";
import { AppConstants } from "resource://gre/modules/AppConstants.sys.mjs";

const lazy = {};
ChromeUtils.defineESModuleGetters(lazy, {
  DownloadHistory: "resource://gre/modules/DownloadHistory.sys.mjs",
  FileUtils: "resource://gre/modules/FileUtils.sys.mjs",
  NetUtil: "resource://gre/modules/NetUtil.sys.mjs",
});

// 与 DownloadCore.sys.mjs 相同的后台写盘组件
const BackgroundFileSaverStreamListener = Components.Constructor(
  "@mozilla.org/network/background-file-saver;1?mode=streamlistener",
  "nsIBackgroundFileSaver"
);

const kMaxChunkSize = 4 * 1024 * 1024;  // 合并时单块读 4MB，控制内存

export var MultiThreadSaver = function () {};

MultiThreadSaver.prototype = {
  download: null,
  _canceled: false,
  _channels: [],        // 活跃 channel，cancel 时逐个 cancel
  _partFiles: [],       // 分片文件路径清单

  /* 主入口 */
  async execute(aSetProgressBytesFn, aSetPropertiesFn) {
    // 1. addToHistory（照抄 DownloadCopySaver.execute 开头）
    // 2. 创建占位文件（照抄原生，IOUtils.writeUTF8(targetPath,"",{mode:"appendOrCreate"}))
    // 3. _probeRange(aSetProgressBytesFn, aSetPropertiesFn) 返回 { supported, totalBytes } 或 null
    // 4. supported && totalBytes >= threshold → _downloadSegmented(...)
    //    否则 → _downloadSingleChannel(...)   // 原生逻辑简化版
  },

  cancel() {
    this._canceled = true;
    for (let ch of this._channels) { try { ch.cancel(Cr.NS_BINDING_ABORTED); } catch (e) {} }
  },

  async removeData() {
    // 删除所有分片文件 + partFilePath（参考原生 _tryToRemoveFile 模式）
  },

  /* ---- 内部方法 ---- */

  // Range 探测：HEAD 优先，405/不支持则 Range GET（bytes=0-0）验证 206
  // 判定：responseStatus == 206 且 Content-Range 完整 → supported
  //       Content-Length < 阈值 → 不启用分片
  async _probeRange(...) { ... },

  // 分片下载：4 片并行，每片：
  //   channel（照抄 §2.5 模式 + setRequestHeader("Range", `bytes=${start}-${end}`, false)）
  //   → BackgroundFileSaver.setTarget(FileUtils.File(partFile), false)
  //   → channel.asyncOpen(backgroundFileSaver)
  //   → onSaveComplete 时累计字节数 → aSetProgressBytesFn
  // 全部完成后 → _mergeParts(aSetProgressBytesFn) → IOUtils.move(partFilePath, targetPath)
  async _downloadSegmented(...) { ... },

  // 单 channel 降级：channel → BackgroundFileSaver.setTarget(partFile) → asyncOpen
  // 完成 → IOUtils.move(partFilePath, targetPath)
  // （照抄 DownloadCopySaver 关键路径，去掉 resume/entityID 逻辑）
  async _downloadSingleChannel(...) { ... },

  // 流式合并：按顺序读每个分片（IOUtils.read(path, {maxBytes, offset}) 循环）
  // → IOUtils.write(partFilePath, chunk, {mode:"append"})（首块用 appendOrCreate 建空文件）
  // → 每块更新 aSetProgressBytesFn → 全部读完 IOUtils.remove(分片)
  async _mergeParts(...) { ... },

  toSerializable() {
    return { type: "multithread" };
  },

  getSha256Hash() { return null; },   // 原生默认为空即可（不做校验）
  getSignatureInfo() { return null; },
};

/* 工厂（与 DownloadCopySaver.fromSerializable 同构） */
MultiThreadSaver.fromSerializable = function () {
  return new MultiThreadSaver();
};
```

实现注意：

- `aSetProgressBytesFn` 的调用要防抖：分片 onSaveComplete 时才汇报（而非每 chunk），合并阶段每 4MB 汇报一次
- 任一时刻 `_canceled === true` 则立即中断并抛 `new DownloadError({ message: "Saver canceled." })`
- `DownloadError` 从 DownloadCore.sys.mjs import（`export var DownloadError`，约 3000 行附近，实现时确认导出名）
- 所有 `IOUtils` 调用失败要 catch 并转成 `DownloadError`（`becauseTargetFailed` 语义照抄原生）

### 5.2 `DownloadCore.sys.mjs`：注册 saver 类型（~5 行）

```js
// DownloadSaver.fromSerializable 的 switch 中加：
case "multithread":
  saver = MultiThreadSaver.fromSerializable(serializable);
  break;
```

并在文件头 import：`import { MultiThreadSaver } from "resource://gre/modules/MultiThreadSaver.sys.mjs";`

⚠️ 注意循环依赖：MultiThreadSaver.sys.mjs 不能 import DownloadCore 里的东西（除 DownloadError 外尽量不依赖）。若 DownloadError 需要，考虑把错误构造逻辑内联到 MultiThreadSaver 或从 DownloadCore 单向 import（DownloadCore import MultiThreadSaver，MultiThreadSaver 不 import DownloadCore → 无环）。**建议：MultiThreadSaver 内联一个极简错误对象或直接 throw，避免循环依赖。实现者需验证。**

### 5.3 `Downloads.sys.mjs`：createDownload 拦截（~10 行）

```js
async createDownload(properties) {
  // 多线程下载：http/https + pref 开启时启用自定义 saver
  const url =
    typeof properties.source === "string"
      ? properties.source
      : properties.source?.url;
  if (
    Services.prefs.getBoolPref("vantage.download.multithread", true) &&
    url &&
    /^https?:/i.test(url)
  ) {
    properties = { ...properties, saver: "multithread" };
  }
  return Download.fromSerializable(properties);
}
```

（`Services` 在该文件已可用，实现时确认。）

### 5.4 `moz.build`：注册模块（1 行）

```python
EXTRA_JS_MODULES += [
    "DownloadCore.sys.mjs",
    # ...
    "MultiThreadSaver.sys.mjs",   # 新增
]
```

### 5.5 `settings/librewolf.cfg`：pref 开关（2 行）

```js
defaultPref("vantage.download.multithread", true);
```

（放在其他 `defaultPref("vantage.*")` 附近，注意 cfg 首行必须保持 `null;`。）

### 5.6 `assets/patches.txt`：登记 patch

在文件末尾追加：

```
patches/multithread-download.patch
```

### 5.7 patch 生成流程

1. 在**源码树副本**（或临时 checkout）中完成 5.1-5.4 的修改
2. `cd ~/Vantage && git diff` 生成 diff（或对源码树 `diff -ruN` 原树/新树）
3. 保存为 `patches/multithread-download.patch`（含新文件，格式 `--- a/...` / `+++ b/...`）
4. **验证 patch 干净可应用**：`patch --forward --binary -p1 --dry-run -i patches/multithread-download.patch`（在未修改的源码树目录执行）
5. 跑 `scripts/check-merge.sh`

---

## 6. 边界情况清单（实现时必须覆盖）

| # | 场景 | 处理 |
|---|------|------|
| 1 | 服务器不支持 Range（200 而非 206） | 降级单 channel |
| 2 | HEAD 被拒（405/403） | Range GET 探测；仍不行降级 |
| 3 | 文件 < 5MB | 直接单 channel（不做探测也可，看 Content-Length） |
| 4 | Content-Length 未知（chunked） | 降级单 channel |
| 5 | 某分片失败/超时 | 取消其余分片 → 抛错 → 原生错误 UI；removeData 清理分片 |
| 6 | 分片合并时目标已存在 | 参考原生 2881 行，move 到唯一路径 |
| 7 | 私有浏览下载 | channel.setPrivate（照抄原生） |
| 8 | 登录态/带 cookie 下载 | 照抄 §2.5 全部 channel 属性 |
| 9 | 重定向 | 原生 channel 自动跟随；最终 URL 的 Range 支持由探测判定（探测用最终响应） |
| 10 | 服务器返回 206 但 Content-Range 格式异常 | 判定不支持，降级 |
| 11 | 用户中途取消 | cancel() 逐个 cancel channel；removeData 清分片 |
| 12 | 磁盘空间不足（合并阶段） | 抛 DownloadError(becauseTargetFailed) |
| 13 | 分片下载中浏览器重启 | 进程重启后任务状态由 DownloadStore 恢复，但分片文件残留 → removeData 兜底清理（第一版不恢复，重新下载） |
| 14 | 文件名含特殊字符 | 分片路径基于 partFilePath 拼接，无额外处理 |

---

## 7. 测试方案

### 7.1 本地 Range 测试服务器（Python 一行起）

```bash
# 生成测试文件
dd if=/dev/urandom of=/tmp/bigfile.bin bs=1M count=200

# 支持 Range 的静态服务器
cd /tmp && python3 -m http.server 8000
# 访问 http://localhost:8000/bigfile.bin（Python http.server 支持 Range）
```

### 7.2 测试矩阵

| 用例 | 预期 |
|------|------|
| 200MB 文件，本地 http.server | 下载成功，文件 md5 与源一致；下载面板进度正常；完成时无 .part/.mt 残留 |
| 小文件（1MB） | 走单 channel，成功 |
| 不支持 Range 的服务器（可写个返回 200 的简单 handler） | 降级，成功 |
| 带登录态（需 cookie 的站点） | 与原生行为一致 |
| 下载中点击取消 | 无残留文件，UI 状态正确 |
| 私有窗口下载 | 正常 |
| pref 关闭（about:config 设 false） | 完全走原生路径，行为与未打补丁一致 |
| 下载到磁盘满（/dev/full 或小 tmpfs） | 报错不崩溃，清理分片 |

### 7.3 功能验证方式

打补丁后需要**重新编译**才能生效（JS 模块进 omni.ja）。开发期可用 `mach run` 跑源码树验证：

```bash
cd ~/Vantage/librewolf-153.1.0-1
./mach run --profile /tmp/mtprofile   # 临时 profile 测试
```

（编译由构建流程负责，`build.sh` 会自动应用补丁。只改 JS 的话增量编译很快。）

---

## 8. 验收标准

1. `patches/multithread-download.patch` 干净可应用（dry-run 通过），且 `check-merge.sh` 通过
2. 大文件下载时网络层确实出现 4 个并发 Range 请求（可用 devtools 网络面板或服务端日志确认）
3. 下载成功文件与源文件字节一致
4. 所有边界用例（§6）行为正确
5. 降级场景用户无感（无报错、无额外弹窗）
6. 原生下载面板/通知/about:downloads 显示正常
7. `vantage.download.multithread=false` 时行为与未打补丁完全一致（回归基准）

---

## 9. 风险与回滚

- **升级冲突**：ESR 维护版升级时若 hunk 冲突，修 patch 即可（例行操作，参考 MERGE-GUIDE.md）
- **扩展点消失**（远期小概率）：功能自动失效，浏览器本体无损（patch 应用失败或功能禁用，用户回原生下载）
- **回滚**：从 `assets/patches.txt` 删除该行 + 删除 patch 文件即可，无残留

---

## 10. 参考代码索引（实现时对照）

| 需求 | 位置 |
|------|------|
| execute 开头（历史/占位文件） | DownloadCore.sys.mjs ~2353-2375 |
| channel 创建与属性 | ~2596-2680 |
| BackgroundFileSaver 接入 | ~2395-2450 |
| onSaveComplete / sha256 | ~2405-2430 |
| 完成 move / 唯一路径 | ~2871-2885 |
| removeData / _tryToRemoveFile | ~2900-2925 |
| fromSerializable switch | ~2279-2295 |
| createDownload | Downloads.sys.mjs ~93-95 |
| EXTRA_JS_MODULES | moz.build |
