# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### Strings used in about:unloads, allowing users to manage the "tab unloading"
### feature.

about-unloads-page-title = Tab 转储
about-unloads-intro =
    { -brand-short-name } has a feature that automatically unloads tabs
    到预防那应用从猛撞的由于不够的存储器
    何时那 system's 可利用的存储器是低点. 那近邻干扰标签页到是空载的是
    chosen 立基于在倍数属性. 这页显示如何
    { -brand-short-name } prioritizes tabs and which tab will be unloaded
    何时标签页转储是触发的. 你能切换开关标签页转储用手
    由微小静电干扰声那 <em>卸载</em> 按钮在下面.

# The link points to a Firefox documentation page, only available in English,
# with title "Tab Unloading"
about-unloads-learn-more =
    看见 <a data-l10n-name="doc-link">Tab 转储</a> 到学习更多关于
    那特性和这页.

about-unloads-last-updated =
    Last updated: { DATETIME($date,
        year: "numeric", month: "numeric", day: "numeric",
        hour: "numeric", minute: "numeric", second: "numeric",
        hour12: "false") }
about-unloads-button-unload = 卸载
  .title = 卸载标签页与那最高优先级
about-unloads-no-unloadable-tab = 那里是无 unloadable 标签页.

about-unloads-column-priority = 优先级
about-unloads-column-host = 主机
about-unloads-column-last-accessed = 最后的接近
about-unloads-column-weight = 基准粗细
  .title = 标签页是首先分选的由这计算结果, 哪个得自从一些专辑属性如此的作为游戏一个声音, WebRTC, 及其他.
about-unloads-column-sortweight = 中级的粗细
  .title = 如果可利用的, 标签页是分选的由这计算结果在...之后存在分选的由那基准粗细. 那计算结果得自从 tab's 存储器用法和那计数的进程.
about-unloads-column-memory = 存储器
  .title = Tab's 估算的存储器用法
about-unloads-column-processes = 进程标识部分
  .title = 标识部分的那进程作战 tab's 内容

about-unloads-last-accessed = { DATETIME($date,
        year: "numeric", month: "numeric", day: "numeric",
        hour: "numeric", minute: "numeric", second: "numeric",
        hour12: "false") }
about-unloads-memory-in-mb = { NUMBER($mem, maxFractionalUnits: 2) } MB
about-unloads-memory-in-mb-tooltip =
  .title = { NUMBER($mem, maxFractionalUnits: 2) } MB
