# settings/features

Vantage 独有功能的源码片段。构建时由 `scripts/cfg-merge.py` 展开进最终的
`librewolf.cfg`，运行时仍然只有一个 cfg 文件。

## 机制

在 `settings/vantage.cfg` 的对应位置写一行：

```js
// @VANTAGE_INCLUDE: features/compat.js
```

`cfg-merge.py --merge` 会把该行替换为 `settings/features/compat.js` 的全部内容，
展开位置就是原来的插入位置，所以加载顺序与拆分前完全一致。

- 路径相对 `settings/`，禁止跳出该目录
- 支持嵌套 include；循环引用会直接报错
- 文件不存在时合并失败
- `cfg-merge.py --check` 会输出 include 数量

## 文件与功能对应

| 文件 | 功能 | 入口 | 关键 pref | 平台 |
|---|---|---|---|---|
| `compat.js` | 右键用 Chromium 系浏览器打开页面/链接/标签页 | 页面右键、链接右键、标签页右键 | `vantage.compat.externalBrowser`（记住上次选择） | Windows / macOS / Linux |
| `chromium-ua.js` | 地址栏「网站兼容」按钮：按站点伪装 Chromium UA + 外部浏览器打开；依赖 `compat.js`（`globalThis.VantageCompat`） | 地址栏右侧页面操作区 | `vantage.compat.uaSites`（已启用域名）、`vantage.compat.chromeVersion`（UA 版本号） | Windows / macOS / Linux |
| `open-in-ie.js` | 右键用 IE 打开 | 页面右键、链接右键、标签页右键 | 无 | 仅 Windows |

后续可搬迁（尚未拆分，代码仍在 `vantage.cfg` 内）：

| 当前所在位置 | 建议文件 | 功能 |
|---|---|---|
| `[SECTION] VANTAGE: SIDEBAR HOVER` | `sidebar-hover.js` | 侧栏悬停自动弹出 |
| `Vantage: 查找栏选项收进折叠行` | `findbar.js` | 查找栏折叠选项 + Chromium 式计数 |
| 其它独立 IIFE | 按功能命名 | 新增功能优先直接放本目录 |

## 编写规则

1. 每个文件是**独立 IIFE 片段**，不以 `// @VANTAGE_BLOCK` 开头
2. 文件内容会被原样展开，保持 UTF-8、以 `\n` 结尾
3. 顶部用注释写清楚：功能、入口、平台限制、依赖的 pref
4. 不定义跨文件的全局变量；共享逻辑目前没有，需要时再抽 `shared.js`
5. 依赖加载顺序的功能（例如 `compat.js` 依赖 `open-in-ie.js` 先创建 IE 菜单项）
   要把 include 放在原位置，不要集中挪到文件尾
6. 代码运行在 Autoconfig 的 chrome 权限上下文，只允许在父进程操作 UI
7. 每段入口都保留 `try/catch`，单个功能失败不能影响浏览器启动

## 验证

```bash
# 结构校验（块 / include / 文件存在性）
python3 scripts/cfg-merge.py --check

# 生成合并结果并做语法检查
python3 scripts/cfg-merge.py --merge --output /tmp/vantage.cfg
cp /tmp/vantage.cfg /tmp/vantage.js && node --check /tmp/vantage.js

# 重构类改动：与重构前基线逐字节对比
diff -u /tmp/cfg-baseline.cfg /tmp/vantage.cfg
```

## 新增功能流程

1. 在 `settings/features/` 建 `<name>.js`
2. 在 `settings/vantage.cfg` 的目标块内加 include 行
3. 跑上面的校验
4. 真机验证后再提交
