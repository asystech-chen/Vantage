

-fog-brand-name = FOG
-glean-brand-name = 拾落穗
glean-sdk-brand-name = { -glean-brand-name } SDK
glean-debug-ping-viewer-brand-name = { -glean-brand-name } 除错 internet网络包测程序观察者

about-glean-page-title2 = 关于 { -glean-brand-name }
about-glean-header = 关于 { -glean-brand-name }
about-glean-interface-description =
  那 <a data-l10n-name="glean-sdk-doc-link">{ glean-sdk-brand-name }</a>
  是一个资料收集库使用在 { -vendor-short-name } 计划.
  这接口是故意的到是使用由显影器和考试人到用手
  <a data-l10n-name="fog-link">测试乐器法</a>.

about-glean-category-about-glean = 关于 { -glean-brand-name }
about-glean-category-manual-testing = 人工的测试
about-glean-category-adhoc-testing = 地址下议院测试
about-glean-category-profiler = 使用那靠模工具机
about-glean-category-about-data = 关于资料
about-glean-category-metrics-table = 公尺的表格

about-glean-upload-enabled = 资料上装是启用.
about-glean-upload-disabled = 资料上装是禁用.
about-glean-upload-enabled-local = 资料上装是启用仅为了发送到一个本地的服务器.
about-glean-upload-fake-enabled =
  资料上装是禁用,
  除了 (we are 的常用口语形式) 说谎和有效的那 { glean-sdk-brand-name } 它是启用
  如此那资料是仍然记录的地方性地.
  笔记: 如果你放一个除错标记, internet网络包测程序将是上传到那
  <a data-l10n-name="glean-debug-ping-viewer">{ glean-debug-ping-viewer-brand-name }</a> 不管的设置.

about-glean-prefs-and-defines = 有关联的 <a data-l10n-name="fog-prefs-and-defines-doc-link">参数选择和定义</a> 包含:
about-glean-data-upload = <code>datareporting.healthreport.uploadEnabled</code>: { $data-upload-pref-value }
about-glean-local-port = <code>遥测技术.fog.test.本地主机_端口</code>: { $local-port-pref-value }
about-glean-glean-android = <code>Mezhdunarodnaya Organizacia Zhurnlistov (Russian=International Organization of Journalists) （俄语）国际记者组织_拾落穗_机器人</code>: { $glean-android-define-value }
about-glean-moz-official =<code>摩斯拉_官员</code>: { $moz-official-define-value }

about-glean-additional-links =
  为了一个解释的不同的方法（way的复数）到录制和发现资料, 请引用那
  <strong>关于资料</strong> 标签页.

about-glean-manual-testing =
  完整指令是备有证明文件的在那
  <a data-l10n-name="fog-instrumentation-test-doc-link">{ -fog-brand-name } 乐器法测试说明文件</a>
  和在那 <a data-l10n-name="glean-sdk-doc-link">{ glean-sdk-brand-name } 文件编制</a>,
  除了, 在扼要, 到用手测试那你的乐器法工作, 你应该:


about-glean-ping-list-optgroup-built-in =
  .label = 建立-in internet网络包测程序
about-glean-ping-list-optgroup-custom =
  .label = 定制 internet网络包测程序


about-glean-no-ping-label = (不要提交任何的 internet网络包测程序)
about-glean-label-for-tag-pings-with-requirements =
  日落一个值得纪念的除错标记 <span>(20 字符或较少的, 字母数字的和 - 仅)</span> 如此你能认出你的 internet网络包测程序以后.
about-glean-label-for-ping-names =
  选择从那在前的列表那 internet网络包测程序你的乐器法是在.
  如果它是在一个 <a data-l10n-name="custom-ping-link">定制 internet网络包测程序</a>, 选取那一(个).
  否则, 那默认为了 <code>事件</code> 公尺的是
  那 <code>事件</code> internet网络包测程序
  和那默认为了全部其他的公尺的是
  那 <code>公尺的</code> internet网络包测程序.
about-glean-label-for-log-pings =
  (可选择的. 复选那在前的方框如果你想要 internet网络包测程序到也是笨重的何时他们是递交.
  你将另外需要到 <a data-l10n-name="enable-logging-link">启用 (木材)采运作业</a>.)
about-glean-label-for-controls-submit =
  压那在前的按钮到标记所有的 { -glean-brand-name } internet网络包测程序与你的标记和提交那被选的 internet网络包测程序.
  (所有的 internet网络包测程序递交从那时直到你重新启动那应用将是标记的与
  <code>{ $debug-tag }</code>.)
about-glean-li-for-visit-gdpv =
  <a data-l10n-name="gdpv-tagged-pings-link">拜访那 { glean-debug-ping-viewer-brand-name } 页为了 internet网络包测程序与你的标记</a>.
  它不该采取更多比一个少数秒从有精力的那按钮到你的 internet网络包测程序到达.
  有时它可以采取一个狭小部分少数的分钟.

about-glean-adhoc-explanation2 =
  为了更多 <i>地址下议院</i> 测试,
  你能也决定当前计算结果的一个一项(或条、点) 块的乐器法
  由打开一个 devtools 控制台这里在 <code>关于:拾落穗</code>
  和使用那 <code>testGetValue()</code> API 相似的
  <code>拾落穗.metricCategory.metricName.testGetValue()</code>
  为了一个公尺的命名的 <code>公尺的.分类.公尺的_名称</code>.

about-glean-adhoc-note =
  请记录那你是使用那拾落穗 JS API 由使用那 devtools 控制台.
  这平均数那公尺的分类和公尺的名称是格式化（的）在
  <code>camelCase</code> 不像的在那锈和调用++ 蜂属.

about-glean-profiler-explanation =
  到看见一个完整查看的全部记录的公尺的, 你能使用那 { -profiler-brand-name }.
  首先你必须 <a data-l10n-name="firefox-profiler-link">截获命令一个施行提问档</a>.
  一次你截获命令那提问档, 选择 <q>标记图表</q> 和一看在那标记在...之下 <q>遥测技术</q>.

about-glean-profiler-explanation-profiler =
  在那施行提问档你能看见所有的那公尺的收集成的, 何时他们曾是
  收集成的, 和确切地什么对价值的看法曾是收集成的. 由停悬在人标记,
  你能证明那那正确的计算结果曾是收集成的和那收集发生（happen的过去式在那右时间.

controls-button-label-verbose = 应用设置和提交 internet网络包测程序

about-glean-feedback-settings-only =
  .message = 设置应用!

about-glean-feedback-settings-and-ping =
  .message = 设置应用和 internet网络包测程序发送!

about-glean-about-data-header = 关于资料
about-glean-about-data-description =
  那里是一个少数不同的工具你能使用到看见你的资料, 依赖在
  什么你是有…相貌的为了.
about-glean-about-data-description-list-intro =
  请引用那列表在下面为了特效药使用
  中国科学院（Chinese Academy of Sciences）为了每个工具:

about-glean-about-data-list-item-dictionary =
  到浏览那列表的资料收集成的由 { -glean-brand-name } 每一应用, 请商讨那
  <a data-l10n-name="glean-dictionary-link">{ -glean-brand-name } 词典</a>.
about-glean-about-data-list-item-about-telemetry =
  到浏览那资料存在收集成的由祖先传下来之物遥测技术, 请商讨
  <a data-l10n-name="about-telemetry-link">关于:遥测技术</a>.
about-glean-about-data-list-item-debug-ping-viewer =
  到浏览除错标签, 看见完整 internet网络包测程序, 看见一个活的事件流, 或查看公尺的
  可见性, 请商讨那
  <a data-l10n-name="glean-debug-ping-viewer">{ glean-debug-ping-viewer-brand-name }</a>.
about-glean-about-data-list-item-firefox-profiler =
  到录制一个施行提问档和看见所有的记录的公尺的, 请使用那
  <a data-l10n-name="about-glean-firefox-profiler">{ -profiler-brand-name }</a>.

about-glean-metrics-table-header = 所有的公尺的
about-glean-metrics-table-header-category = 分类
about-glean-metrics-table-header-name = 名称
about-glean-metrics-table-header-type = 类型
about-glean-metrics-table-header-value = 计算结果
about-glean-metrics-table-header-actions = 操作
about-glean-metrics-table-settings-button = 设置

about-glean-metrics-table-settings-title = 公尺的表格设置
about-glean-metrics-table-settings-category-general = 常规
about-glean-metrics-table-settings-hide-empty-value-rows = 隐藏空计算结果返回引用中的行数

about-glean-metrics-table-settings-category-visualizations = 可见性
about-glean-metrics-table-settings-visualization-example = 例子

about-glean-metrics-table-settings-category-visualizations-histogram = 直方图
about-glean-metrics-table-settings-histograms-chart-max = 图表最大值高度
about-glean-metrics-table-settings-histograms-scaled-max = 有鳞(斑)的最大值高度
about-glean-metrics-table-settings-histograms-box-padding = 方框填充
about-glean-metrics-table-settings-histograms-chart-padding = 图表填充
about-glean-metrics-table-settings-histograms-left-padding = 附加的许可填充

about-glean-metrics-table-settings-category-visualizations-timeline = 时间轴
about-glean-metrics-table-settings-timelines-height = 高度
about-glean-metrics-table-settings-timelines-width = 宽度
about-glean-metrics-table-settings-timelines-chart-padding = 图表填充
about-glean-metrics-table-settings-timelines-circle-radius = 圆周半径
about-glean-metrics-table-settings-timelines-vertical-line-x-offset = 原型-axis 交换偏移量
about-glean-metrics-table-settings-timelines-vertical-line-y-offset = 原型-axis 原型偏移量


about-glean-label-for-filter-metrics = 过滤器
about-glean-description-for-filter-metrics = 这将过滤器那表格在下面立基于在分类, 名称, 类型, 和计算结果 (如果那计算结果是一个出身低微者类型).

about-glean-button-load-all = 加载所有的对价值的看法
about-glean-button-export-data = 导出资料
about-glean-button-load-value = 加载
about-glean-button-dictionary-link = 说明文件
about-glean-button-watch = 观察
about-glean-button-unwatch = Unwatch

about-glean-no-data-to-display = 无资料到显示器.

about-glean-dual-labeled-metric-warning = <code>DualLabeledCounter</code> 公尺的是不还被支持的在那 <code>关于:拾落穗</code> 查看.
about-glean-unknown-metric-type-warning = 不知道的公尺的类型.
