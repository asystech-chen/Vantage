pane-privacy-title2 = 隐私与安全

librewolf-footer = 有用的链接
pane-librewolf-title = Vantage
category-librewolf =
    .tooltiptext = about:config 更改，逻辑分组且易于访问
librewolf-header = Vantage 首选项
librewolf-warning-title = 注意！
librewolf-warning-description = 我们仔细选择默认设置，专注于隐私和安全。更改这些设置时，请阅读描述以了解这些更改的影响。

vantage-update-heading = 更新
# 关于 Vantage
vantage-about-heading = 关于 Vantage
vantage-about-version = 版本 { $version }
vantage-about-update-checking = 正在检查更新…
vantage-about-update-available = 发现新版本，前往官网下载
vantage-about-up-to-date = 已是最新版本

vantage-update-checkbox =
    .label = 自动检查更新
vantage-theme-checkbox =
    .label = 启用 Vantage 主题（需要重启浏览器生效）
vantage-theme-description = 自动将 Vantage 主题写入配置目录，为浏览器添加圆角工具栏、圆角标签页等现代化样式。开启或关闭后需重启浏览器生效。注意：部分第三方主题可能会覆盖这些效果，仅影响外观样式，不影响浏览器正常功能。

vantage-update-description = 在启动时检查 Vantage 新版本。发现新版本时会通知您，但不会自动安装更新。

vantage-ai-heading = AI 侧边栏
vantage-ai-checkbox =
    .label = 启用 AI 侧边栏
vantage-ai-description = 在侧边栏中打开 AI 聊天机器人。支持 DeepSeek、Qwen、豆包、ChatGPT、Gemini 和 Claude。您的对话直接发送给供应商——Vantage 不会收集或处理任何数据。

librewolf-general-heading = 浏览器行为
librewolf-extension-update-checkbox =
    .label = 自动更新附加组件
librewolf-sync-checkbox =
    .label = 启用 Firefox 同步
librewolf-autocopy-checkbox =
    .label = 启用中键粘贴
librewolf-styling-checkbox =
    .label = 允许 userChrome.css 自定义
librewolf-network-heading = 网络
librewolf-ipv6-checkbox =
    .label = 启用 IPv6
vantage-doh-checkbox =
    .label = 启用 DNS over HTTPS（DoH）
vantage-doh-description = 开启后：DNS 查询通过加密的 HTTPS 发送至阿里 AliDNS 解析。DoH 不可用时自动回退系统 DNS，内网/VPN 访问不受影响。
librewolf-privacy-heading = 隐私
librewolf-webrtc-ip-checkbox =
    .label = 限制 WebRTC 本地 IP 暴露
librewolf-webrtc-ip-description = 限制 WebRTC 仅使用默认网络接口，防止泄露内网 IP 地址。
librewolf-font-vis-checkbox =
    .label = 限制字体可见性
librewolf-font-vis-description = 仅向网站暴露基础系统字体，防止字体指纹追踪。不影响网页字体渲染效果。

librewolf-xorigin-ref-checkbox =
    .label = 限制跨域引用
librewolf-broken-heading = 指纹追踪
librewolf-webgl-checkbox =
    .label = 启用 WebGL
librewolf-rfp-checkbox =
    .label = 启用防指纹追踪
librewolf-letterboxing-checkbox =
    .label = 启用 letterboxing
librewolf-security-heading = 安全
librewolf-goog-safe-checkbox =
    .label = 启用 Google 安全浏览
librewolf-goog-safe-download-checkbox =
    .label = 扫描下载
librewolf-extension-update-description = 无需手动干预即可保持扩展程序最新。
librewolf-extension-update-warning1 = 如果您不在每次更新前审查扩展程序的代码，应启用此选项。
librewolf-ipv6-description = 允许 { -brand-short-name } 使用 IPv6 连接。
librewolf-ipv6-warning1 = 与其在浏览器中阻止 IPv6，我们建议在您的操作系统中启用 IPv6 隐私扩展。
librewolf-sync-description = 将数据与其它浏览器同步。需要重新启动。
librewolf-sync-warning1 = Firefox 同步在传输到服务器之前在本地加密数据。
librewolf-autocopy-description = 选择文本后自动复制，鼠标中键粘贴。

librewolf-download-tmp-checkbox =
    .label = 下载文件存入临时目录
librewolf-download-tmp-description = 开启后：下载的文件存入系统临时目录，关闭浏览器后自动清理，避免数据残留。
librewolf-download-tmp-warning1 = 关闭后：文件直接存入下载文件夹，方便管理。注意即使手动删除，下载文件仍可能被恢复工具找回。

# 下载提速
vantage-download-speed-heading = 下载提速（实验功能）
vantage-download-mt-checkbox =
    .label = 启用多线程下载
vantage-download-mt-description = 开启后：支持分段请求的服务器会并行下载文件片段再合并，提升大文件下载速度。若某些网站下载失败，可关闭此选项。
vantage-download-maxparts-label = 最大连接数：
vantage-download-maxparts-warning = 超过 8 个连接可能被部分网站限速或封禁。
vantage-download-minsize-label = 多线程最小文件尺寸：
vantage-download-tmpdir-label = 分片缓存目录：
vantage-download-tmpdir-browse = 浏览…
vantage-download-tmpdir-hint = 留空使用系统临时目录。大文件下载请选择剩余空间充足的位置。
vantage-download-tmpdir-picker-title = 选择分片缓存目录

librewolf-tabs-heading = 标签页行为
librewolf-tabs-scroll-checkbox =
    .label = 滚轮切换标签页
librewolf-tabs-dblclick-checkbox =
    .label = 双击关闭标签页
librewolf-tabs-urlbar-checkbox =
    .label = 地址栏回车在新标签页打开
librewolf-tabs-bookmarks-checkbox =
    .label = 书签在新标签页打开
librewolf-tabs-search-checkbox =
    .label = 搜索在新标签页打开
librewolf-tabs-ctrlTab-checkbox =
    .label = Ctrl+Tab 按最近使用排序
librewolf-tabs-unload-checkbox =
    .label = 内存不足时休眠不活跃标签页

librewolf-styling-description = 开启后：可通过 userChrome.css 文件自定义浏览器外观（如修改工具栏、标签页样式等）。适合喜欢高度自定义的用户。
librewolf-styling-warning1 = 关闭后：使用默认浏览器外观。建议只加载信任来源的 CSS 主题，恶意样式可能窃取输入内容。
librewolf-xorigin-ref-description = 开启后：只在同一网站内跳转时才发送来源信息，访问外部网站时不暴露您从哪个页面而来。
librewolf-xorigin-ref-warning1 = 关闭后：所有网站都能看到您从哪个页面跳转而来。部分需要验证来源的网站可能无法正常访问。
librewolf-webgl-description = 开启后：网页可以使用 WebGL 渲染 3D 图形，但可能被用来识别您的设备（指纹追踪）。
librewolf-webgl-warning1 = 关闭后：增强隐私，但使用 WebGL 的网页（如 3D 地图、在线游戏）可能无法正常显示。
librewolf-rfp-description = 开启后：统一隐藏浏览器特征（屏幕分辨率、时区、字体、语言等），使您看起来与其他用户相同，极大增强隐私。
librewolf-rfp-warning1 = 关闭后：浏览器特性完全暴露，网站可轻松识别和追踪您。部分网站可能依赖这些特性正常工作。
librewolf-letterboxing-description = 开启后：浏览器窗口尺寸将被限制为几个标准值，防止网站通过窗口大小识别和追踪您。窗口两侧可能出现黑边。
librewolf-letterboxing-warning1 = 关闭后：网站可以通过您的窗口尺寸辅助识别您的身份。此功能需要先开启「防指纹追踪」才会生效。
librewolf-goog-safe-description = 如果您担心恶意软件和网络钓鱼，请考虑启用。
librewolf-goog-safe-warning1 = 因审查顾虑而默认禁用，但推荐普通用户开启。所有检查在本地进行。
librewolf-goog-safe-download-description = 允许安全浏览扫描下载文件以识别可疑内容。
librewolf-goog-safe-download-warning1 = 所有检查在本地进行。

librewolf-signatures-checkbox =
    .label = 要求扩展签名
librewolf-signatures-description = 开启后：仅允许安装经 Mozilla 签名的扩展，防止恶意扩展侵害浏览器安全。
librewolf-signatures-warning1 = 关闭后：允许安装未签名扩展，方便开发者测试自编扩展。请谨慎安装来源不明的扩展。

librewolf-pdfjs-scripting-checkbox =
    .label = 允许 PDF 查看器执行脚本
librewolf-pdfjs-scripting-description = 开启后：PDF 文件可执行 JavaScript，支持交互式表单和动态内容。部分 PDF 表单依赖此功能。
librewolf-pdfjs-scripting-warning1 = 关闭后：禁止 PDF 文件执行脚本，防止基于 PDF 的安全攻击。绝大多数 PDF 文档仍可正常查看。
librewolf-config-link = 所有高级设置 (about:config)
librewolf-open-profile = 故障排除信息 (about:support)
librewolf-debug = 调试附加组件
vantage-privacy-dashboard-link = 隐私保护仪表板

content-blocking-section-top-level-description = Vantage 默认支持并启用严格模式下的增强跟踪保护。这是浏览器中最重要的设置之一，因为它提供状态分区、严格的阻止列表和其他精妙的隐私功能。我们不建议更改为其他模式。

vantage-nova-checkbox =
    .label = 启用 Nova 新界面
vantage-nova-description = Nova 是 Firefox 153 引入的新外观（圆润标签、浮动工具栏）。开启后 Vantage 主题会自动切换为 Nova 适配配色（蓝绿渐变标题栏）。切换即时生效。

# 配置备份与恢复
vantage-backup-heading = 配置备份与恢复
vantage-backup-description = 将浏览器配置（书签、历史、扩展、设置）导出为压缩包，或从备份恢复。恢复会覆盖当前配置并重启浏览器。
vantage-backup-export-button = 导出备份…
vantage-backup-export-title = 导出配置备份
vantage-backup-export-success = 配置已成功导出。
vantage-backup-export-fail = 导出失败：{ $error }
vantage-backup-import-button = 从备份恢复…
vantage-backup-import-title = 从备份恢复配置
vantage-backup-import-invalid = 所选文件不是有效的 Vantage 配置备份。
vantage-backup-import-invalid-path = 备份包含非法路径，已拒绝恢复。
vantage-backup-import-confirm-title = 恢复配置
vantage-backup-import-confirm = 这将覆盖当前所有配置（书签、历史、设置、扩展）并重启浏览器。恢复前会自动备份当前配置。确定继续吗？
vantage-backup-import-backup-fail = 自动备份当前配置失败：{ $error }
vantage-backup-import-locked = 部分文件被占用，无法替换（{ $files }…）。请关闭浏览器后重新恢复。您原有的配置备份是安全的。
vantage-backup-import-done = 配置已恢复，浏览器即将重启。

vantage-backup-export-confirm-title = 导出配置备份
vantage-backup-export-confirm = 备份将包含敏感数据：Cookie（网站登录状态）、浏览历史、表单记录和网站数据。登录密码已排除，以保障安全。请妥善保管备份文件，切勿分享给他人。继续吗？

vantage-download-resume-checkbox =
    .label = 断点续传
vantage-download-resume-description = 启用后：下载中断时（例如浏览器被关闭），点击“重试”可从断点继续，无需重新下载整个文件。仅在启用多线程下载时生效。

vantage-download-minsize-description = 小于此尺寸的文件使用单线程下载（强行分片只会更慢）；更大的文件才会拆分为多份并行下载，最多不超过上方设置的最大连接数。
