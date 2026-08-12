# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### Strings used in about:unloads, allowing users to manage the "tab unloading"

about-unloads-page-title = 标签页卸载
about-unloads-intro =
    { -brand-short-name } 具备自动卸载标签页的功能，以防止当系统可用内存不足时，
    应用程序因内存不足而崩溃。下一个将被卸载的标签页是根据多种属性选择的。
    本页面显示 { -brand-short-name } 如何对标签页进行优先级排序，
    以及当触发标签页卸载时将卸载哪一个标签页。您可以手动触发标签页卸载，
    通过单击下方的<em>卸载</em>按钮。

### feature.
about-unloads-learn-more =
    请参阅<a data-l10n-name="doc-link">标签页卸载</a>，以了解有关该功能
    及本页面的详细信息。

about-unloads-last-updated =
    最后更新：{ DATETIME($date,
        year: "numeric", month: "numeric", day: "numeric",
        hour: "numeric", minute: "numeric", second: "numeric",
        hour12: "false") }
about-unloads-button-unload = 卸载
  .title = 卸载优先级最高的标签页
about-unloads-no-unloadable-tab = 不存在可卸载的标签页。

about-unloads-column-priority = 优先级
about-unloads-column-host = 主机
about-unloads-column-last-accessed = 最后访问时间
about-unloads-column-weight = 基本权重
  .title = 标签页首先根据此值进行排序，该值源于某些特殊属性，如播放声音、WebRTC 等。
about-unloads-column-sortweight = 次要权重
  .title = 如果可用，标签页在根据基本权重排序后，将根据此值进行排序。该值源于标签页的内存使用情况以及进程数量。
about-unloads-column-memory = 内存
  .title = 标签页的估计内存使用量
about-unloads-column-processes = 进程标识符
  .title = 承载标签页内容的进程标识符

about-unloads-last-accessed = { DATETIME($date,
        year: "numeric", month: "numeric", day: "numeric",
        hour: "numeric", minute: "numeric", second: "numeric",
        hour12: "false") }
about-unloads-memory-in-mb = { NUMBER($mem, maxFractionalUnits: 2) } MB
about-unloads-memory-in-mb-tooltip =
  .title = { NUMBER($mem, maxFractionalUnits: 2) } MB
