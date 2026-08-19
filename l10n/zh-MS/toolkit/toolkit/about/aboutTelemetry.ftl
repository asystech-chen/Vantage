
about-telemetry-ping-data-source = internet网络包测程序论据来源:
about-telemetry-show-current-data = 当前的论据
about-telemetry-show-archived-ping-data = 存档 internet网络包测程序论据
about-telemetry-show-subsession-data = 显示 subsession 论据
about-telemetry-choose-ping = 选取 internet网络包测程序:
about-telemetry-archive-ping-type = internet网络包测程序类型
about-telemetry-archive-ping-header = internet网络包测程序
about-telemetry-option-group-today = 今天
about-telemetry-option-group-yesterday = 昨天
about-telemetry-option-group-older = 年长的
about-telemetry-previous-ping = <<
about-telemetry-next-ping = >>
about-telemetry-page-title = 遥测技术论据
about-telemetry-current-store = 当前的存储器操作:
about-telemetry-more-information = 有…相貌的为了更多信息?
about-telemetry-firefox-data-doc = 那 <a data-l10n-name="data-doc-link">火狐论据文件编制</a> 包含辅助线关于如何到工作与我们的论据工具.
about-telemetry-telemetry-client-doc = 那 <a data-l10n-name="client-doc-link">火狐遥测技术客户文件编制</a> 包含清晰度为了观念, API 文件编制和论据引用.
about-telemetry-telemetry-dashboard = 那 <a data-l10n-name="dashboard-link">遥测技术仪表板</a> 允许你到使看得见那论据摩斯拉接收经由遥测技术.
about-telemetry-telemetry-probe-dictionary = 那 <a data-l10n-name="probe-dictionary-link">探索词典</a> 提供详细数据和描述为了那探索收集成的由遥测技术.
about-telemetry-show-in-Firefox-json-viewer = 打开在那 JSON 观察者
about-telemetry-home-section = 主页
about-telemetry-general-data-section = 常规论据
about-telemetry-environment-data-section = 环境论据
about-telemetry-session-info-section = 会话信息
about-telemetry-scalar-section = 标量
about-telemetry-keyed-scalar-section = 键的标量
about-telemetry-histograms-section = 直方图
about-telemetry-keyed-histogram-section = 键的直方图
about-telemetry-events-section = 事件
about-telemetry-simple-measurements-section = 简单的度量
about-telemetry-slow-sql-section = 慢的 SQL 程序语句
about-telemetry-addon-details-section = 添加-on 详细数据
about-telemetry-late-writes-section = 迟的书写器
about-telemetry-raw-payload-section = 写后读商务载重
about-telemetry-raw = 写后读 JSON
about-telemetry-full-sql-warning = NOTE: 慢的 SQL 调试是启用. 完整 SQL 字符串可以是显示的在下面除了他们将不是递交到遥测技术.
about-telemetry-fetch-stack-symbols = 取功能名称为了堆积
about-telemetry-hide-stack-symbols = 显示写后读堆积论据
about-telemetry-data-type =
    { $channel ->
        [release] 版本论据
       *[prerelease] 炼油工程师-release 论据
    }
about-telemetry-upload-type =
    { $uploadcase ->
        [enabled] 启用
       *[disabled] 禁用
    }
about-telemetry-histogram-stats =
    { $sampleCount ->
        [one] { $sampleCount } 示例, 平均 = { $prettyAverage }, 系统实用程序和维护 = { $sum }
       *[other] { $sampleCount } 示例, 平均 = { $prettyAverage }, 系统实用程序和维护 = { $sum }
    }
about-telemetry-page-subtitle = 这页显示那信息关于施行, 硬件, 用法和定制收集成的由遥测技术. 这信息是递交到 { $telemetryServerOwner } 到帮助改良 { -brand-full-name }.
about-telemetry-settings-explanation = 遥测技术是收集 { about-telemetry-data-type } 和上装是 <a data-l10n-name="upload-link">{ about-telemetry-upload-type }</a>.
about-telemetry-ping-details = 每个块的信息是发送附随的进入...之内“<a data-l10n-name="ping-link">internet网络包测程序</a>”. 你是有…相貌的在那 { $name }, { $timestamp } internet网络包测程序.
about-telemetry-data-details-current = 每个块的信息是发送附随的进入...之内“<a data-l10n-name="ping-link">internet网络包测程序</a>“. 你是有…相貌的在当前论据.
about-telemetry-filter-placeholder =
    .placeholder = 发现在 { $selectedTitle }
about-telemetry-filter-all-placeholder =
    .placeholder = 发现在全部扇区
about-telemetry-results-for-search = 结果为了“{ $searchTerms }”
about-telemetry-no-search-results = 难过的! 那里是无结果在 { $sectionName } 为了“{ $currentSearchText }”
about-telemetry-no-search-results-all = 难过的! 那里是无结果在任何的扇区为了“{ $searchTerms }”
about-telemetry-no-data-to-display = 难过的! 那里是当前无论据可利用的在“{ $sectionName }”
about-telemetry-current-data-sidebar = 当前的论据
about-telemetry-telemetry-ping-type-all = 所有的
about-telemetry-histogram-copy = 复制
about-telemetry-slow-sql-main = 慢的 SQL 程序语句在主群组线索
about-telemetry-slow-sql-other = 慢的 SQL 程序语句在帮忙者线索
about-telemetry-slow-sql-hits = 击中
about-telemetry-slow-sql-average = 平均值. 时间 (主存储器)
about-telemetry-slow-sql-statement = 程序语句
about-telemetry-addon-table-id = 添加-on ID
about-telemetry-addon-table-details = 详细数据
about-telemetry-addon-provider = { $addonProvider } 提供器
about-telemetry-keys-header = 属性
about-telemetry-names-header = 名称
about-telemetry-values-header = 计算结果
about-telemetry-late-writes-title = 迟的书写器 #{ $lateWriteCount }
about-telemetry-stack-title = 堆积:
about-telemetry-memory-map-title = 存储器实用程序:
about-telemetry-error-fetching-symbols = 一个错误发生一会儿动人的符号. 复选那你是连接的到那因特网和尝试再一次.
about-telemetry-time-stamp-header = 时间戳
about-telemetry-category-header = 分类
about-telemetry-method-header = 方法
about-telemetry-object-header = 对象
about-telemetry-extra-header = 额外的事物
about-telemetry-process = { $process } 进程
