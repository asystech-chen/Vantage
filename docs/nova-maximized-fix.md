# Nova 最大化窗口边缘边框问题修复方案

> 状态：**方案已定，待实施**（2026-08-30 调研完成）
> 上游：Bug 2054183（VERIFIED FIXED，Nightly 156 已验证）
> 修复方式：纯 CSS，进 `settings/librewolf.cfg` 的 `THEME_CSS_NOVA` 段，**无需重新编译**

---

## 1. 问题现象

启用 Nova 外观（`browser.nova.enabled=true`）并**最大化窗口**时：

- 窗口四周多出一圈边框/padding（Nova 的 `--chrome-window-gap` 外边距 + `--chrome-block-radius` 圆角 + 1px 边框）
- 关闭/最小化按钮不再紧贴显示器右上角，鼠标点在屏幕最右上角落在边框上，**点击无反应**
- 边缘区域同样无法点击（顶部边缘切标签、右侧边缘抓滚动条均失效）

**影响范围**：Vantage 已在 `settings/librewolf.cfg` 默认开启 Nova
（`defaultPref("browser.nova.enabled", true)`），所以**所有 Vantage 用户**最大化窗口都会遇到。

关闭 Nova（Proton 外观）无此问题。

## 2. 上游定位

| 项 | 内容 |
|---|---|
| 主 Bug | [2054183](https://bugzilla.mozilla.org/show_bug.cgi?id=2054183) "Remove Nova outer window padding when the window is maximized" |
| 同源 Bug | 2059907（最大化拖拽标题栏失效）、2059915（标题栏按钮在 padding 区不可点）、2038022（边缘点击无响应） |
| 修复 commit | autoland `a34846f458d2` / GitHub `2a95e83f8632`，2026-08-06 推送，08-24 在 Nightly 156 Windows/Ubuntu/macOS 三平台验证 |
| ESR 状态 | **未 backport 到 mozilla-esr153 / release**（404），等 153.1.xesr 维护版不会自动带上，需自移植 |

修复思路：最大化（含贴边）窗口时，把 chrome 块的外层圆角、边框、padding 清零；
只保留内部结构分隔线（toolbox 底边分隔线、块间 gap）。

## 3. 上游改动文件

| 文件 | 改动 | 语义 |
|---|---|---|
| `browser/themes/shared/browser-shared.css` | +34 | `.chrome-block`：最大化时 `#navigator-toolbox` / `#sidebar-container` 清零圆角与边框 |
| `browser/themes/shared/customizableui/customizeMode.css` | +13 | `#customization-container`（定制模式浮动画板）最大化时贴边 |
| `browser/themes/shared/tabbrowser/content-area.css` | +37 | `#navigator-toolbox` 外边距、`#browser` padding、`.browserContainer` 底角清零 |
| 其余 | 测试文件 | `browser_maximized_decoration.js` 等，Vantage 不需要 |

## 4. 移植方案（Vantage）

**不采用源码 patch**（避免编译周期），把上游规则转成 userChrome.css 写法，
追加到 `settings/librewolf.cfg` 的 `THEME_CSS_NOVA` 模板字符串末尾（隐私窗口段之后、`` `; `` 之前）。

> ⚠️ 注意：Nova tokens 在 `@layer` 内，userChrome.css 需 `!important` 才能覆盖（文件内已有先例）。

### 4.1 拟插入 CSS

```css
/* ===== Nova 最大化：清零窗口边缘圆角/边框/padding（上游 Bug 2054183，Nightly 156 验证）===== */
:root[sizemode="maximized"] #navigator-toolbox {
  margin-block-start: 0 !important;
  margin-inline: 0 !important;
  border-radius: 0 !important;
  border-style: none !important;
  border-block-end-style: solid !important; /* 保留与内容区的分隔线 */
}
:root[sizemode="maximized"] #browser {
  padding-inline: 0 !important;
  padding-block-end: 0 !important;
}
:root[sizemode="maximized"] :is(#sidebar-container, #sidebar-box) {
  border-end-start-radius: 0 !important;
  border-end-end-radius: 0 !important;
  border-block-end: none !important;
}
:root[sizemode="maximized"] #sidebar-container:not([sidebar-positionend]) {
  border-start-start-radius: 0 !important;
  border-inline-start: none !important;
}
:root[sizemode="maximized"] #sidebar-container[sidebar-positionend] {
  border-start-end-radius: 0 !important;
  border-inline-end: none !important;
}
:root[sizemode="maximized"] #sidebar-container[sidebar-panel-open] {
  border-radius: 0 !important;
}
:root[sizemode="maximized"] .browserContainer {
  border-end-start-radius: 0 !important;
  border-end-end-radius: 0 !important;
  border-block-end: none !important;
}
:root[sizemode="maximized"] #tabbrowser-tabbox:not([sidebar-shown]) .browserContainer,
:root[sizemode="maximized"] #tabbrowser-tabbox[sidebar-shown][sidebar-positionend] .browserContainer {
  border-start-start-radius: 0 !important;
  border-inline-start: none !important;
}
:root[sizemode="maximized"] #tabbrowser-tabbox:not([sidebar-positionend], [ai-window-open]) .browserContainer {
  border-start-end-radius: 0 !important;
  border-inline-end: none !important;
}
:root[sizemode="maximized"] #customization-container {
  margin-inline: 0 !important;
  margin-block-end: 0 !important;
  border-radius: 0 !important;
  border-inline: none !important;
  border-block-end: none !important;
}
```

### 4.2 实施注意

- **本地结构差异**：ESR 153.1.0 的 `.chrome-block` 比 nightly 157 简单
  （无 `&[sidebar-positionend]` 圆角分支，sidebar 属性体系可能不同）。
  属性选择器（`[sidebar-shown]` / `[ai-window-open]` 等）不匹配时规则自然跳过，无害。
- **核心规则**：`#navigator-toolbox` 清零是解决「关闭键不贴边、右上角点击落空」的关键；
  `.browserContainer` / `#customization-container` 是细节打磨。
- 全部规则仅 `:root[sizemode="maximized"]` 下生效，不影响普通/全屏窗口。

## 5. 验证清单

- [ ] 开 Nova + 最大化：关闭按钮贴屏幕右上角，边缘点击有响应
- [ ] 顶部边缘可切标签、右侧边缘可抓滚动条
- [ ] 最大化时侧边栏各方向（左/右、展开/收起）底角无圆角残留
- [ ] 定制模式（customize）最大化时画板贴边
- [ ] 非最大化窗口样式不变（回归）
- [ ] 全屏（F11）行为不变（回归）

## 6. 相关链接

- Bug: https://bugzilla.mozilla.org/show_bug.cgi?id=2054183
- Commit: https://hg.mozilla.org/mozilla-central/rev/a34846f458d2
- 调研过程原始 diff 暂存：`~/.openclaw/workspace/tmp/nova-maximized-fix.diff`（31KB，含全部测试文件，仅本机）
