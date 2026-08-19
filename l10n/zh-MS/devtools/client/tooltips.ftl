# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### Localization for Developer Tools tooltips.

learn-more = <span data-l10n-name="link">学习更多</span>

## In the Rule View when a CSS property cannot be successfully applied we display
## an icon. When this icon is hovered this message is displayed to explain why
## the property is not applied.
## The variables are all passed from the same place, in `InactiveCssTooltipHelper#getTemplate`
## (devtools/client/shared/widgets/tooltip/inactive-css-tooltip-helper.js#95)
## Variables:
##   $property (string) - A CSS property name e.g. "color".
##   $display (string) - A CSS display value e.g. "inline-block".

inactive-css-not-grid-or-flex-container = <strong>{ $property }</strong> 有无效果在这部分自...以后它是皆不一个屈曲容器或非一个网格容器.

inactive-css-not-grid-or-flex-container-or-multicol-container = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个屈曲容器, 一个网格容器, 或一个多-column 容器.

inactive-css-not-multicol-container = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个多-column 容器.

inactive-css-column-span = <strong>{ $property }</strong> 有无生成效果在这部分自...以后它是不内部一个多-column 容器.

inactive-css-not-grid-or-flex-item = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个网格或弯曲项.

inactive-css-not-grid-or-flex-or-absolutely-positioned-item = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个网格或弯曲项, 或非一个完全地放置的部分.

inactive-css-not-grid-or-absolutely-positioned-item = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个网格项或非一个完全地放置的部分.

inactive-css-not-absolutely-positioned-item = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个完全地放置的部分.

inactive-css-no-default-anchor = <strong>{ $property }</strong> 有无效果在这部分自...以后它不有一个默认锚部分.

inactive-css-not-grid-item = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个网格项.

inactive-css-not-grid-container = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个网格容器.

inactive-css-not-flex-item = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个屈曲项.

inactive-css-not-flex-container = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个屈曲容器.

inactive-css-not-inline-or-tablecell = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个内联或表格-cell 部分.

inactive-css-first-line-pseudo-element-not-supported = <strong>{ $property }</strong> 是不被支持的在 ::开始-line 假的-elements.

inactive-css-first-letter-pseudo-element-not-supported = <strong>{ $property }</strong> 是不被支持的在 ::开始-letter 假的-elements.

inactive-css-placeholder-pseudo-element-not-supported = <strong>{ $property }</strong> 是不被支持的在 ::占位符假的-elements.

inactive-css-property-because-of-display = <strong>{ $property }</strong> 有无效果在这部分自...以后它有一个显示器的 <strong>{ $display }</strong>.

inactive-css-not-display-block-on-floated-2 = 那 <strong>显示器</strong> 计算结果有是更改由那引擎到 <strong>{ $display }</strong> 因为那部分是 <strong>浮动的</strong>.

inactive-css-only-non-grid-or-flex-item = <strong>{ $property }</strong> 有无效果因为它无法是使用在网格或弯曲项.

inactive-css-not-block = <strong>{ $property }</strong> 有无效果在这部分因为它仅应用到阻止-level 部分.

inactive-css-not-block-container = <strong>{ $property }</strong> 有无效果在这部分因为它仅应用到阻止容器部分.

inactive-css-not-block-flex-grid-container = <strong>{ $property }</strong> 有无效果在这部分因为它仅应用到阻止, 弯曲, 和网格容器部分.

inactive-css-not-floated = <strong>{ $property }</strong> 有无效果因为它仅应用到浮动的部分.

inactive-css-property-is-impossible-to-override-in-visited = 它是不可能的到推翻 <strong>{ $property }</strong> 由于 <strong>:拜访</strong> 限定.

inactive-css-position-property-on-unpositioned-box = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个放置的部分.

inactive-css-only-replaced-elements = <strong>{ $property }</strong> 有无效果在这部分自...以后它能仅是应用到取代部分.

inactive-text-overflow-when-no-overflow = <strong>{ $property }</strong> 有无效果在这部分自...以后 <strong>上溢:隐藏的</strong> 是不放.

inactive-css-no-size-containment = <strong>{ $property }</strong> 有无效果在这部分自...以后它有无大小抑制.

inactive-css-not-for-internal-table-elements = <strong>{ $property }</strong> 有无效果在内在的表格部分.

inactive-css-not-for-internal-table-elements-except-table-cells = <strong>{ $property }</strong> 有无效果在内在的表格部分除表格单元.

inactive-css-not-table = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个表格.

inactive-css-collapsed-table-borders = <strong>{ $property }</strong> 有无效果在这部分自...以后它是一个表格与倒塌的边框.

inactive-css-not-table-cell = <strong>{ $property }</strong> 有无效果在这部分自...以后它是不一个表格单元.

inactive-scroll-padding-when-not-scroll-container = <strong>{ $property }</strong> 有无效果在这部分自...以后它不滚动.

inactive-css-border-image = <strong>{ $property }</strong> 有无效果在这部分自...以后它无法是应用到内在的表格部分哪里 <strong>边框-折叠</strong> 是日落到 <strong>折叠</strong> 在那父母表格部分.

inactive-css-resize = <strong>{ $property }</strong> 有无效果在这部分自...以后它能仅是应用到部分与一个上溢计算结果其他的比看得见的, 和到确定的取代部分, 如此的作为 textareas.

inactive-css-ruby-element = <strong>{ $property }</strong> 有无效果在这部分自...以后它是一个红宝石部分. 它的大小是坚决的由那字体大小的那红宝石电文.

inactive-css-highlight-pseudo-elements-not-supported = <strong>{ $property }</strong> 是不被支持的在突出假的-elements.

inactive-css-cue-pseudo-element-not-supported = <strong>{ $property }</strong> 是不被支持的在 ::尾接指令假的-elements.

inactive-css-at-position-try-not-supported = <strong>{ $property }</strong> 是不被支持的在 <strong>@位置-尝试</strong> 规则.

# Variables:
#   $lineCount (integer) - The number of lines the element has.
inactive-css-text-wrap-balance-lines-exceeded =
    { $lineCount ->
         [one] <strong>{ $property }</strong> 有无效果在这部分因为它有更多比 { $lineCount } 线路.
        *[other] <strong>{ $property }</strong> 有无效果在这部分因为它有更多比 { $lineCount } 线路.
     }

inactive-css-text-wrap-balance-fragmented = <strong>{ $property }</strong> 有无效果在这部分因为它是成碎片的, 电流.元件. 它的内容是拆分越过倍数列或页.

inactive-css-no-width-height = <strong>{ $property }</strong> 有无效果在这部分自...以后它的宽度和高度无法是日落.

inactive-css-no-principal-box = <strong>{ $property }</strong> 有无效果在这部分自...以后它做不创建一个校长方框.

## In the Rule View when a CSS property cannot be successfully applied we display
## an icon. When this icon is hovered this message is displayed to explain how
## the problem can be solved. CSS properties and values in <strong> tags should
## not be translated.

inactive-css-not-grid-or-flex-container-fix = 尝试加法的 <strong>显示器:网格</strong> 或 <strong>显示器:弯曲</strong>. { learn-more }

inactive-css-not-grid-or-flex-or-block-container-fix = 尝试加法的 <strong>显示器:网格</strong>, <strong>显示器:弯曲</strong> 或 <strong>显示器:阻止</strong>. { learn-more }

inactive-css-not-grid-or-flex-container-or-multicol-container-fix = 尝试加法的 (两者之中)任一的 <strong>显示器:网格</strong>, <strong>显示器:弯曲</strong>, 或 <strong>列:2</strong>. { learn-more }

inactive-css-not-multicol-container-fix = 尝试加法的 (两者之中)任一的 <strong>列-计数</strong> 或 <strong>列-宽度</strong>. { learn-more }

inactive-css-column-span-fix = 尝试加法的 <strong>列-计数</strong> 或 <strong>列-宽度</strong> 到一(个) 的它的祖先部分. { learn-more }

inactive-css-not-grid-or-flex-or-absolutely-positioned-item-fix = 尝试加法的 <strong>位置:绝对的</strong> 到那部分, 或 <strong>显示器:网格</strong>, <strong>显示器:弯曲</strong>, <strong>显示器:内联-网格</strong>, 或 <strong>显示器:内联-弯曲</strong> 到那 element's 父母. { learn-more }

inactive-css-not-grid-or-absolutely-positioned-item-fix = 尝试加法的 <strong>位置:绝对的</strong> 到那部分, 或 <strong>显示器:网格</strong> 或 <strong>显示器:内联-网格</strong> 到那 element's 父母. { learn-more }

inactive-css-not-absolutely-positioned-item-fix = 尝试加法的 <strong>位置:绝对的</strong> 到那部分. { learn-more }

inactive-css-no-default-anchor-fix = 尝试加法的 <strong>位置-锚</strong> 与一个有确实根据的锚名称. { learn-more }

inactive-css-not-grid-or-flex-item-fix-3 = 尝试加法的 <strong>显示器:网格</strong>, <strong>显示器:弯曲</strong>, <strong>显示器:内联-网格</strong>, 或 <strong>显示器:内联-弯曲</strong> 到那 element's 父母. { learn-more }

inactive-css-not-grid-item-fix-2 =尝试加法的 <strong>显示器:网格</strong> 或 <strong>显示器:内联-网格</strong> 到那 element's 父母. { learn-more }

inactive-css-not-grid-container-fix = 尝试加法的 <strong>显示器:网格</strong> 或 <strong>显示器:内联-网格</strong>. { learn-more }

inactive-css-not-flex-item-fix-2 = 尝试加法的 <strong>显示器:弯曲</strong> 或 <strong>显示器:内联-弯曲</strong> 到那 element's 父母. { learn-more }

inactive-css-not-flex-container-fix = 尝试加法的 <strong>显示器:弯曲</strong> 或 <strong>显示器:内联-弯曲</strong>. { learn-more }

inactive-css-not-inline-or-tablecell-fix = 尝试加法的 <strong>显示器:内联</strong> 或 <strong>显示器:表格-单元</strong>. { learn-more }

inactive-css-non-replaced-inline-or-table-row-or-row-group-fix = 尝试加法的 <strong>显示器:内联-阻止</strong> 或 <strong>显示器:阻止</strong>. { learn-more }

inactive-css-non-replaced-inline-or-table-column-or-column-group-fix = 尝试加法的 <strong>显示器:内联-阻止</strong>. { learn-more }

inactive-css-not-display-block-on-floated-fix = 尝试拆迁 <strong>浮动</strong> 或加法的 <strong>显示器:阻止</strong>. { learn-more }

inactive-css-only-non-grid-or-flex-item-fix = 尝试更改那计算结果的 <strong>显示器</strong> 的那 element's 容器到某事别的比 <strong>弯曲</strong>, <strong>网格</strong>, <strong>内联-弯曲</strong>, 或 <strong>内联-网格</strong>, 或拆迁 <strong>浮动</strong>. { learn-more }

inactive-css-not-block-fix = 尝试加法的属性相似的 <strong>显示器:阻止</strong> 或 <strong>浮动:许可</strong>. { learn-more }

inactive-css-not-block-container-fix = 尝试加法的 <strong>显示器:阻止</strong>, <strong>显示器:内联-阻止</strong> 或 <strong>显示器:流程-根</strong>. { learn-more }

inactive-css-not-block-flex-grid-container-fix = 尝试加法的 <strong>显示器:阻止</strong>, <strong>显示器:内联-阻止</strong>, <strong>显示器:弯曲</strong>, <strong>显示器:内联-弯曲</strong>, <strong>显示器:网格</strong>, <strong>显示器:内联-网格</strong> 或 <strong>显示器:流程-根</strong>. { learn-more }

inactive-css-not-floated-fix = 尝试加法的那 <strong>浮动</strong> 属性与一个计算结果其他的比 <strong>一点也不</strong>. { learn-more }

inactive-css-position-property-on-unpositioned-box-fix = 尝试设置它的 <strong>位置</strong> 属性到某事其他的比 <strong>静电</strong>. { learn-more }

inactive-css-only-replaced-elements-fix = 确定你是加法的那属性到一个取代部分. { learn-more }

inactive-text-overflow-when-no-overflow-fix = 尝试加法的 <strong>上溢:隐藏的</strong>. { learn-more }

inactive-css-no-size-containment-fix = 尝试设置它的 <strong>显示器</strong> 属性到某事别的比 <strong>一点也不</strong>, <strong>内容</strong>, <strong>表格</strong>, 或 <strong>内联-表格</strong> 和确保它是不内部一个表格或红宝石段. { learn-more }

inactive-css-not-for-internal-table-elements-fix = 尝试设置它的 <strong>显示器</strong> 属性到某事别的比 <strong>表格-单元</strong>, <strong>表格-列</strong>, <strong>表格-行</strong>, <strong>表格-列-创建组</strong>, <strong>表格-行-创建组</strong>, 或 <strong>表格-页脚-创建组</strong>. { learn-more }

inactive-css-not-for-internal-table-elements-except-table-cells-fix = 尝试设置它的 <strong>显示器</strong> 属性到某事别的比 <strong>表格-列</strong>, <strong>表格-行</strong>, <strong>表格-列-创建组</strong>, <strong>表格-行-创建组</strong>, 或 <strong>表格-页脚-创建组</strong>. { learn-more }

inactive-css-not-table-fix = 尝试加法的 <strong>显示器:表格</strong> 或 <strong>显示器:内联-表格</strong>. { learn-more }

inactive-css-collapsed-table-borders-fix = 尝试加法的 <strong>边框-折叠:独立件</strong>. { learn-more }

inactive-css-not-table-cell-fix = 尝试加法的 <strong>显示器:表格-单元</strong>. { learn-more }

inactive-scroll-padding-when-not-scroll-container-fix = 尝试加法的 <strong>上溢:汽车</strong>, <strong>上溢:滚动</strong>, 或 <strong>上溢:隐藏的</strong>. { learn-more }

inactive-css-border-image-fix = 在那父母表格部分, 移除那属性或更改那计算结果的 <strong>边框-折叠</strong> 到一个计算结果其他的比 <strong>折叠</strong>. { learn-more }

inactive-css-resize-fix = 尝试设置 <strong>上溢</strong> 到一个计算结果其他的比 <strong>看得见的</strong> 或目标市场选择一个取代部分次要的它. { learn-more }

inactive-css-ruby-element-fix = 尝试更改那 <strong>字体-大小</strong> 的那红宝石电文. { learn-more }

inactive-css-text-wrap-balance-lines-exceeded-fix = 尝试到缩小那数字的线路. { learn-more }

inactive-css-text-wrap-balance-fragmented-fix = 避免爆裂似的那 element's 内容元件.千兆. 由拆迁那列或由使用 <strong>页-中断-内部:避免</strong>. { learn-more }

inactive-css-no-principal-box-fix = 尝试加法的一个 <strong>显示器</strong> 计算结果那创建一个校长方框, 如此的作为 <strong>阻止</strong>, <strong>内联-阻止</strong>, <strong>弯曲</strong>, 或 <strong>网格</strong>. { learn-more }

## In the Rule View when a CSS property may have compatibility issues with other browsers
## we display an icon. When this icon is hovered this message is displayed to explain why
## the property is incompatible and the platforms it is incompatible on.
## Variables:
##   $property (string) - A CSS declaration name e.g. "-moz-user-select" that can be a platform specific alias.
##   $rootProperty (string) - A raw CSS property name e.g. "user-select" that is not a platform specific alias.

css-compatibility-default-message = <strong>{ $property }</strong> 是不被支持的在那下列各项浏览器:

css-compatibility-deprecated-experimental-message = <strong>{ $property }</strong> 曾是一个实验的属性那是现在不赞成由等待3调用标准. 它是不被支持的在那下列各项浏览器:

css-compatibility-deprecated-experimental-supported-message = <strong>{ $property }</strong> 曾是一个实验的属性那是现在不赞成由等待3调用标准.

css-compatibility-deprecated-message = <strong>{ $property }</strong> 是不赞成由等待3调用标准. 它是不被支持的在那下列各项浏览器:

css-compatibility-deprecated-supported-message = <strong>{ $property }</strong> 是不赞成由等待3调用标准.

css-compatibility-experimental-message = <strong>{ $property }</strong> 是一个实验的属性. 它是不被支持的在那下列各项浏览器:

css-compatibility-experimental-supported-message = <strong>{ $property }</strong> 是一个实验的属性.

css-compatibility-learn-more-message = <span data-l10n-name="link">学习更多</span> 关于 <strong>{ $rootProperty }</strong>

## In the Rule View when a rule selector can causes issues, we display an icon.
## When this icon is hovered one or more of those messages are displayed to explain what
## the issue are.

# :has() should not be translated
css-selector-warning-unconstrained-has = 这选择器使用不受约束的 <strong>:有()</strong>, 哪个能是慢的

# :scope should not be translated
css-selector-warning-sibling-combinator-after-scope = 兄弟选择器在...之后 <strong>:作用域</strong> 将从不比较任何事

## In the Rule View we display a tooltip when a @container condition is hovered.
## We want to show a specific message if the condition doesn't match a container for the
## currently selected element
## Variables:
##   $name (string) - The condition name.

css-selector-container-query-condition-no-container = 无容器 '{ $name }' 发现
