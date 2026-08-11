# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### Localization for Developer Tools tooltips.

learn-more = <span data-l10n-name="link">了解更多</span>

## In the Rule View when a CSS property cannot be successfully applied we display
## an icon. When this icon is hovered this message is displayed to explain why
## the property is not applied.
## The variables are all passed from the same place, in `InactiveCssTooltipHelper#getTemplate`
## (devtools/client/shared/widgets/tooltip/inactive-css-tooltip-helper.js#95)
## Variables:
##   $property (string) - A CSS property name e.g. "color".
##   $display (string) - A CSS display value e.g. "inline-block".

inactive-css-not-grid-or-flex-container = <strong>{ $property }</strong> 对该元素无效果，因为其既不是弹性容器也不是网格容器。

inactive-css-not-grid-or-flex-container-or-multicol-container = <strong>{ $property }</strong> 对该元素无效果，因为其不是弹性容器、网格容器或多列容器。

inactive-css-not-multicol-container = <strong>{ $property }</strong> 对该元素无效果，因为其不是多列容器。

inactive-css-column-span = <strong>{ $property }</strong> 对该元素无跨列效果，因为其不位于多列容器内。

inactive-css-not-grid-or-flex-item = <strong>{ $property }</strong> 对该元素无效果，因为其不是网格或弹性项。

inactive-css-not-grid-or-flex-or-absolutely-positioned-item = <strong>{ $property }</strong> 对该元素无效果，因为其不是网格或弹性项，也不是绝对定位元素。

inactive-css-not-grid-or-absolutely-positioned-item = <strong>{ $property }</strong> 对该元素无效果，因为其不是网格项也不是绝对定位元素。

inactive-css-not-absolutely-positioned-item = <strong>{ $property }</strong> 对该元素无效果，因为其不是绝对定位元素。

inactive-css-no-default-anchor = <strong>{ $property }</strong> 对该元素无效果，因为其没有默认锚点元素。

inactive-css-not-grid-item = <strong>{ $property }</strong> 对该元素无效果，因为其不是网格项。

inactive-css-not-grid-container = <strong>{ $property }</strong> 对该元素无效果，因为其不是网格容器。

inactive-css-not-flex-item = <strong>{ $property }</strong> 对该元素无效果，因为其不是弹性项。

inactive-css-not-flex-container = <strong>{ $property }</strong> 对该元素无效果，因为其不是弹性容器。

inactive-css-not-inline-or-tablecell = <strong>{ $property }</strong> 对该元素无效果，因为其不是内联或表格单元格元素。

inactive-css-first-line-pseudo-element-not-supported = <strong>{ $property }</strong> 在 ::first-line 伪元素上不受支持。

inactive-css-first-letter-pseudo-element-not-supported = <strong>{ $property }</strong> 在 ::first-letter 伪元素上不受支持。

inactive-css-placeholder-pseudo-element-not-supported = <strong>{ $property }</strong> 在 ::placeholder 伪元素上不受支持。

inactive-css-property-because-of-display = <strong>{ $property }</strong> 对该元素无效果，因为其显示值为 <strong>{ $display }</strong>。

inactive-css-not-display-block-on-floated-2 = 由于该元素为<strong>浮动</strong>状态，引擎已将<strong>display</strong>值更改为<strong>{ $display }</strong>。

inactive-css-only-non-grid-or-flex-item = <strong>{ $property }</strong> 无效果，因为它不能用于网格或弹性项。

inactive-css-not-block = <strong>{ $property }</strong> 对该元素无效果，因为它仅适用于块级元素。

inactive-css-not-block-container = <strong>{ $property }</strong> 对该元素无效果，因为它仅适用于块容器元素。

inactive-css-not-block-flex-grid-container = <strong>{ $property }</strong> 对该元素无效果，因为它仅适用于块、弹性和网格容器元素。

inactive-css-not-floated = <strong>{ $property }</strong> 无效果，因为它仅适用于浮动元素。

inactive-css-property-is-impossible-to-override-in-visited = 由于<strong>:visited</strong>限制，无法覆盖<strong>{ $property }</strong>。

inactive-css-position-property-on-unpositioned-box = <strong>{ $property }</strong> 对该元素无效果，因为其不是定位元素。

inactive-css-only-replaced-elements = <strong>{ $property }</strong> 对该元素无效果，因为它只能应用于替换元素。

inactive-text-overflow-when-no-overflow = <strong>{ $property }</strong> 对该元素无效果，因为未设置 <strong>overflow:hidden</strong>。

inactive-css-no-size-containment = <strong>{ $property }</strong> 对该元素无效果，因为它没有尺寸包含。

inactive-css-not-for-internal-table-elements = <strong>{ $property }</strong> 对内部表格元素无效果。

inactive-css-not-for-internal-table-elements-except-table-cells = <strong>{ $property }</strong> 对除表格单元格外的内部表格元素无效果。

inactive-css-not-table = <strong>{ $property }</strong> 对该元素无效果，因为其不是表格。

inactive-css-collapsed-table-borders = <strong>{ $property }</strong> 对该元素无效果，因为其是具有折叠边框的表格。

inactive-css-not-table-cell = <strong>{ $property }</strong> 对该元素无效果，因为其不是表格单元格。

inactive-scroll-padding-when-not-scroll-container = <strong>{ $property }</strong> 对该元素无效果，因为其不滚动。

inactive-css-border-image = <strong>{ $property }</strong> 对该元素无效果，因为它不能应用于内部表格元素，其中父表格元素上的<strong>border-collapse</strong>设置为<strong>collapse</strong>。

inactive-css-resize = <strong>{ $property }</strong> 对该元素无效果，因为它只能应用于溢出值不是visible的元素，以及某些替换元素（如文本区域）。

inactive-css-ruby-element = <strong>{ $property }</strong> 对该元素无效果，因为它是ruby元素。其大小由ruby文本的字号决定。

inactive-css-highlight-pseudo-elements-not-supported = <strong>{ $property }</strong> 在highlight伪元素上不受支持。

inactive-css-cue-pseudo-element-not-supported = <strong>{ $property }</strong> 在 ::cue 伪元素上不受支持。

inactive-css-at-position-try-not-supported = <strong>{ $property }</strong> 在<strong>@position-try</strong>规则中不受支持。

# Variables:
#   $lineCount (integer) - The number of lines the element has.
inactive-css-text-wrap-balance-lines-exceeded =
    { $lineCount ->
         [one] <strong>{ $property }</strong> 对该元素无效果，因为它有超过 { $lineCount } 行。
        *[other] <strong>{ $property }</strong> 对该元素无效果，因为它有超过 { $lineCount } 行。
     }

inactive-css-text-wrap-balance-fragmented = <strong>{ $property }</strong> 对该元素无效果，因为它是分片的，即其内容被分割到多列或多页中。

inactive-css-no-width-height = <strong>{ $property }</strong> 对该元素无效果，因为其宽度和高度无法设置。

inactive-css-no-principal-box = <strong>{ $property }</strong> 对该元素无效果，因为它不创建主体框。

## In the Rule View when a CSS property cannot be successfully applied we display
## an icon. When this icon is hovered this message is displayed to explain how
## the problem can be solved. CSS properties and values in <strong> tags should
## not be translated.

inactive-css-not-grid-or-flex-container-fix = 请尝试添加 <strong>display:grid</strong> 或 <strong>display:flex</strong>。{ learn-more }
inactive-css-not-grid-or-flex-or-block-container-fix = 尝试添加 <strong>display:grid</strong>、<strong>display:flex</strong> 或 <strong>display:block</strong>。{ learn-more }

inactive-css-not-grid-or-flex-container-or-multicol-container-fix = 尝试添加 <strong>display:grid</strong>、<strong>display:flex</strong> 或 <strong>columns:2</strong>。{ learn-more }

inactive-css-not-multicol-container-fix = 尝试添加 <strong>column-count</strong> 或 <strong>column-width</strong>。{ learn-more }

inactive-css-column-span-fix = 尝试向其祖先元素之一添加 <strong>column-count</strong> 或 <strong>column-width</strong>。{ learn-more }

inactive-css-not-grid-or-flex-or-absolutely-positioned-item-fix = 尝试向该元素添加 <strong>position:absolute</strong>，或向其父元素添加 <strong>display:grid</strong>、<strong>display:flex</strong>、<strong>display:inline-grid</strong> 或 <strong>display:inline-flex</strong>。{ learn-more }

inactive-css-not-grid-or-absolutely-positioned-item-fix = 尝试向该元素添加 <strong>position:absolute</strong>，或向其父元素添加 <strong>display:grid</strong> 或 <strong>display:inline-grid</strong>。{ learn-more }

inactive-css-not-absolutely-positioned-item-fix = 尝试向该元素添加 <strong>position:absolute</strong>。{ learn-more }

inactive-css-no-default-anchor-fix = 尝试使用有效的锚点名称添加 <strong>position-anchor</strong>。{ learn-more }

inactive-css-not-grid-or-flex-item-fix-3 = 尝试向其父元素添加 <strong>display:grid</strong>、<strong>display:flex</strong>、<strong>display:inline-grid</strong> 或 <strong>display:inline-flex</strong>。{ learn-more }

inactive-css-not-grid-item-fix-2 =尝试向其父元素添加 <strong>display:grid</strong> 或 <strong>display:inline-grid</strong>。{ learn-more }

inactive-css-not-grid-container-fix = 尝试添加 <strong>display:grid</strong> 或 <strong>display:inline-grid</strong>。{ learn-more }

inactive-css-not-flex-item-fix-2 = 尝试向其父元素添加 <strong>display:flex</strong> 或 <strong>display:inline-flex</strong>。{ learn-more }

inactive-css-not-flex-container-fix = 尝试添加 <strong>display:flex</strong> 或 <strong>display:inline-flex</strong>。{ learn-more }

inactive-css-not-inline-or-tablecell-fix = 尝试添加 <strong>display:inline</strong> 或 <strong>display:table-cell</strong>。{ learn-more }

inactive-css-non-replaced-inline-or-table-row-or-row-group-fix = 尝试添加 <strong>display:inline-block</strong> 或 <strong>display:block</strong>。{ learn-more }

inactive-css-non-replaced-inline-or-table-column-or-column-group-fix = 尝试添加 <strong>display:inline-block</strong>。{ learn-more }

inactive-css-not-display-block-on-floated-fix = 尝试移除 <strong>float</strong> 或添加 <strong>display:block</strong>。{ learn-more }

inactive-css-only-non-grid-or-flex-item-fix = 尝试将元素容器的 <strong>display</strong> 值更改为除 <strong>flex</strong>、<strong>grid</strong>、<strong>inline-flex</strong> 或 <strong>inline-grid</strong> 以外的值，或移除 <strong>float</strong>。{ learn-more }

inactive-css-not-block-fix = 尝试添加 <strong>display:block</strong> 或 <strong>float:left</strong> 等属性。{ learn-more }

inactive-css-not-block-container-fix = 尝试添加 <strong>display:block</strong>、<strong>display:inline-block</strong> 或 <strong>display:flow-root</strong>。{ learn-more }

inactive-css-not-block-flex-grid-container-fix = 尝试添加 <strong>display:block</strong>、<strong>display:inline-block</strong>、<strong>display:flex</strong>、<strong>display:inline-flex</strong>、<strong>display:grid</strong>、<strong>display:inline-grid</strong> 或 <strong>display:flow-root</strong>。{ learn-more }

inactive-css-not-floated-fix = 尝试添加值为 <strong>none</strong> 以外的 <strong>float</strong> 属性。{ learn-more }

inactive-css-position-property-on-unpositioned-box-fix = 尝试将其 <strong>position</strong> 属性设置为 <strong>static</strong> 以外的值。{ learn-more }

inactive-css-only-replaced-elements-fix = 确保您要将该属性添加到可替换元素上。{ learn-more }

inactive-text-overflow-when-no-overflow-fix = 尝试添加 <strong>overflow:hidden</strong>。{ learn-more }

inactive-css-no-size-containment-fix = 尝试将其 <strong>display</strong> 属性设置为除 <strong>none</strong>、<strong>contents</strong>、<strong>table</strong> 或 <strong>inline-table</strong> 以外的值，并确保其不位于表格或 ruby 段内。{ learn-more }

inactive-css-not-for-internal-table-elements-fix = 尝试将其 <strong>display</strong> 属性设置为除 <strong>table-cell</strong>、<strong>table-column</strong>、<strong>table-row</strong>、<strong>table-column-group</strong>、<strong>table-row-group</strong> 或 <strong>table-footer-group</strong> 以外的值。{ learn-more }

inactive-css-not-for-internal-table-elements-except-table-cells-fix = 尝试将其 <strong>display</strong> 属性设置为除 <strong>table-column</strong>、<strong>table-row</strong>、<strong>table-column-group</strong>、<strong>table-row-group</strong> 或 <strong>table-footer-group</strong> 以外的值。{ learn-more }

inactive-css-not-table-fix = 尝试添加 <strong>display:table</strong> 或 <strong>display:inline-table</strong>。{ learn-more }

inactive-css-collapsed-table-borders-fix = 尝试添加 <strong>border-collapse:separate</strong>。{ learn-more }

inactive-css-not-table-cell-fix = 尝试添加 <strong>display:table-cell</strong>。{ learn-more }

inactive-scroll-padding-when-not-scroll-container-fix = 尝试添加 <strong>overflow:auto</strong>、<strong>overflow:scroll</strong> 或 <strong>overflow:hidden</strong>。{ learn-more }

inactive-css-border-image-fix = 在父表格元素上，移除该属性或将 <strong>border-collapse</strong> 的值更改为除 <strong>collapse</strong> 以外的值。{ learn-more }

inactive-css-resize-fix = 尝试将 <strong>overflow</strong> 设置为 <strong>visible</strong> 以外的值，或针对支持它的可替换元素。{ learn-more }

inactive-css-ruby-element-fix = 尝试更改 ruby 文本的 <strong>font-size</strong>。{ learn-more }

inactive-css-text-wrap-balance-lines-exceeded-fix = 尝试减少行数。{ learn-more }

inactive-css-text-wrap-balance-fragmented-fix = 避免分割元素的内容，例如通过移除列或使用 <strong>page-break-inside:avoid</strong>。{ learn-more }

inactive-css-no-principal-box-fix = 尝试添加创建主盒子的 <strong>display</strong> 值，例如 <strong>block</strong>、<strong>inline-block</strong>、<strong>flex</strong> 或 <strong>grid</strong>。{ learn-more }

## In the Rule View when a CSS property may have compatibility issues with other browsers
## we display an icon. When this icon is hovered this message is displayed to explain why
## the property is incompatible and the platforms it is incompatible on.
## Variables:
##   $property (string) - A CSS declaration name e.g. "-moz-user-select" that can be a platform specific alias.
##   $rootProperty (string) - A raw CSS property name e.g. "user-select" that is not a platform specific alias.

css-compatibility-default-message = <strong>{ $property }</strong> 在以下浏览器中不受支持：

css-compatibility-deprecated-experimental-message = <strong>{ $property }</strong> 是一项实验性属性，现已被 W3C 标准弃用。它在以下浏览器中不受支持：

css-compatibility-deprecated-experimental-supported-message = <strong>{ $property }</strong> 是一项实验性属性，现已被 W3C 标准弃用。

css-compatibility-deprecated-message = <strong>{ $property }</strong> 已被 W3C 标准弃用。它在以下浏览器中不受支持：

css-compatibility-deprecated-supported-message = <strong>{ $property }</strong> 已被 W3C 标准弃用。

css-compatibility-experimental-message = <strong>{ $property }</strong> 是一项实验性属性。它在以下浏览器中不受支持：

css-compatibility-experimental-supported-message = <strong>{ $property }</strong> 是一项实验性属性。

css-compatibility-learn-more-message = 关于 <strong>{ $rootProperty }</strong>，请<span data-l10n-name="link">了解更多</span>

## In the Rule View when a rule selector can causes issues, we display an icon.
## When this icon is hovered one or more of those messages are displayed to explain what
## the issue are.

# :has() should not be translated
css-selector-warning-unconstrained-has = 此选择器使用无约束的 <strong>:has()</strong>，这可能性能缓慢

# :scope should not be translated
css-selector-warning-sibling-combinator-after-scope = <strong>:scope</strong> 之后的兄弟选择器将永远不会匹配任何内容

## In the Rule View we display a tooltip when a @container condition is hovered.
## We want to show a specific message if the condition doesn't match a container for the
## currently selected element
## Variables:
##   $name (string) - The condition name.

css-selector-container-query-condition-no-container = 未找到容器 ‘{ $name }’