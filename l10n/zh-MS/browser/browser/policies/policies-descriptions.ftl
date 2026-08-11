# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this

# file, You can obtain one at http://mozilla.org/MPL/2.0/.
## The Enterprise Policies feature is aimed at system administrators
## who want to deploy these settings across several Firefox installations
## all at once. This is traditionally done through the Windows Group Policy
## feature, but the system also supports other forms of deployment.

policy-3rdparty = 设置WebExtensions可通过chrome.storage.managed访问的政策。

policy-AIControls = 配置AI控件。

policy-AllowedDomainsForApps = 定义允许访问Google Workspace的域。

policy-AllowFileSelectionDialogs = 允许文件选择对话框。

policy-AppAutoUpdate = 启用或禁用应用程序自动更新。

policy-AppUpdatePin = 阻止{ -brand-short-name }更新至超出指定版本。

policy-AppUpdateURL = 设置自定义应用程序更新URL。

policy-Authentication = 为支持集成的网站配置集成身份验证。

policy-AutofillAddressEnabled = 为地址启用自动填充。

policy-AutofillCreditCardEnabled = 为支付方式启用自动填充。

policy-AutoLaunchProtocolsFromOrigins = 定义可从未经提示的列出来源使用的外部协议列表。

policy-BackgroundAppUpdate2 = 启用或禁用后台更新程序。

policy-Backup = 禁用配置文件数据的备份或还原。

policy-BlockAboutAddons = 阻止访问附加组件管理器（about:addons）。

policy-BlockAboutConfig = 阻止访问about:config页面。

policy-BlockAboutProfiles = 阻止访问about:profiles页面。

policy-BlockAboutSupport = 阻止访问about:support页面。

policy-Bookmarks = 在书签工具栏、书签菜单或其中指定的文件夹中创建书签。

policy-CaptivePortal = 启用或禁用强制门户支持。

policy-CertificatesDescription = 添加证书或使用内置证书。

policy-ContentAnalysis = 启用或禁用与防数据丢失代理的连接。

policy-Cookies = 允许或拒绝网站设置Cookie。

## These are short descriptions for individual policies, to be displayed
policy-Containers = 设置与容器相关的政策。

policy-DisableAccounts = 禁用基于账户的服务，包括同步。

policy-DisabledCiphers = 禁用密码套件。

policy-DefaultDownloadDirectory = 设置默认下载目录。

policy-DefaultSerialGuardSetting = 控制串行API的使用。

policy-DisableAppUpdate = 阻止浏览器更新。

policy-DisableBuiltinPDFViewer = 禁用{ -brand-short-name }中的内置PDF查看器PDF.js。

policy-DisableDefaultBrowserAgent = 阻止默认浏览器代理执行任何操作。仅适用于Windows；其他平台不包含该代理。

policy-DisableDeveloperTools = 阻止访问开发者工具。

policy-DisableEncryptedClientHello = 禁用TLS功能的加密客户端问候（ECH）。

policy-DisableFeedbackCommands = 禁用从帮助菜单发送反馈的命令（提交反馈和报告欺骗性网站）。

## in the documentation section in about:policies.
policy-DisableFirefoxAccounts1 = 禁用基于账户的服务，包括同步。

# Containers in this context is referring to container tabs in Firefox.
policy-DisableFirefoxScreenshots = 禁用Firefox Screenshots功能。

policy-DisableFirefoxStudies = 阻止{ -brand-short-name }运行研究。

policy-DisableForgetButton = 阻止访问“忘记”按钮。

policy-DisableFormHistory = 不记住搜索和表单历史记录。

policy-DisablePrimaryPasswordCreation = 若为真，则无法创建主密码。

policy-DisablePasswordReveal = 不允许在已保存的登录信息中显示密码。

policy-DisablePrivateBrowsing = 禁用隐私浏览。

policy-DisableProfileImport = 禁用从另一浏览器导入数据的菜单命令。

policy-DisableProfileRefresh = 禁用about:support页面上的“刷新{ -brand-short-name }”按钮。

policy-DisableRemoteImprovements = 阻止{ -brand-short-name }在更新之间应用性能、稳定性和功能更改。

policy-DisableRemoteSettingsAndAcceptSecurityConsequences = 禁用远程设置。

policy-DisableSafeMode = 禁用安全模式重启功能。注意：进入安全模式的Shift键仅在Windows上可通过组策略禁用。

policy-DisableSecurityBypass = 阻止用户绕过某些安全警告。

policy-DisableSetAsDesktopBackground = 禁用图像“设置为桌面背景”的菜单命令。

policy-DisableSystemAddonUpdate = 阻止浏览器安装和更新系统附加组件。

policy-DisableTelemetry = 关闭遥测。

policy-DisableThirdPartyModuleBlocking = 阻止用户阻止注入到{ -brand-short-name }进程中的第三方模块。

policy-DisplayBookmarksToolbar = 默认显示书签工具栏。

policy-DisplayMenuBar = 默认显示菜单栏。
policy-DNSOverHTTPS = 配置基于 HTTPS 的 DNS 服务。

policy-DontCheckDefaultBrowser = 启动时禁用对默认浏览器的检查。

policy-DownloadDirectory = 设置并锁定下载目录。

# “lock” means that the user won’t be able to change this setting
policy-EnableTrackingProtection = 启用或禁用内容拦截，并可选地将其锁定。

# “lock” means that the user won’t be able to change this setting
policy-EncryptedMediaExtensions = 启用或禁用加密媒体扩展，并可选地将其锁定。

policy-ExemptDomainFileTypePairsFromFileTypeDownloadWarnings = 针对特定域上的特定文件类型，禁用基于文件扩展名的警告。

# A “locked” extension can’t be disabled or removed by the user. This policy
# takes 3 keys (“Install”, ”Uninstall”, ”Locked”), you can either keep them in
# English or translate them as verbs.
policy-Extensions = 安装、卸载或锁定扩展。Install 选项接受 URL 或路径作为参数。Uninstall 和 Locked 选项接受扩展 ID。

policy-ExtensionSettings = 管理扩展安装的所有方面。

policy-ExtensionUpdate = 启用或禁用自动扩展更新。

policy-FirefoxHome2 = 配置 { -firefox-home-brand-name }。

policy-FirefoxSuggest = 配置 { -firefox-suggest-brand-name }。

policy-GenerativeAI = 配置生成式人工智能功能。

policy-GoToIntranetSiteForSingleWordEntryInAddressBar = 在地址栏中键入单词条目时，强制直接进行 Intranet 站点导航，而非执行搜索。

policy-Handlers = 配置默认应用程序处理程序。

policy-HardwareAcceleration = 如果为 false，则关闭硬件加速。

# “lock” means that the user won’t be able to change this setting
policy-Homepage = 设置并可选地锁定主页。

policy-HttpAllowlist = 将不会升级到 HTTPS 的来源。

policy-HttpsOnlyMode = 允许启用仅 HTTPS 模式。

policy-InstallAddonsPermission = 允许特定网站安装附加组件。

policy-IPProtectionAvailable = 阻止内置 VPN 对用户可用。

policy-LegacyProfiles = 禁用针对每次安装强制使用单独配置文件的该功能。

## Do not translate "SameSite", it's the name of a cookie attribute.

policy-LegacySameSiteCookieBehaviorEnabled = 启用默认的旧版 SameSite Cookie 行为设置。

policy-LegacySameSiteCookieBehaviorEnabledForDomainList = 对指定站点上的 Cookie 还原为旧版 SameSite 行为。

##

policy-LocalFileLinks = 允许特定网站链接到本地文件。

policy-LocalNetworkAccess = 启用或禁用本地网络访问检查。

policy-ManagedBookmarks = 配置由管理员管理的书签列表，用户无法更改此列表。

policy-ManualAppUpdateOnly = 仅允许手动更新，并且不通知用户有关更新的信息。

policy-PrimaryPassword = 要求或阻止使用主密码。

policy-PrintingEnabled = 启用或禁用打印功能。

policy-NetworkPrediction = 启用或禁用网络预测（DNS 预取）。

policy-NewTabPage = 启用或禁用新标签页。

policy-NoDefaultBookmarks = 禁用随 { -brand-short-name } 捆绑的默认为书签的创建，以及智能书签（最常访问、最近的标签）。注意：此策略仅在配置文件的首次运行之前生效。

policy-OfferToSaveLogins = 强制实施允许 { -brand-short-name } 提供记住所保存登录信息和密码的设置的设置。接受 true 和 false 值。

policy-OfferToSaveLoginsDefault = 设置允许 { -brand-short-name } 提供记住所保存登录信息和密码的默认值。接受 true 和 false 值。

policy-OverrideFirstRunPage = 覆盖首次运行页面。如果您希望禁用首次运行页面，请将此策略设置为空白。

policy-OverridePostUpdatePage = 覆盖更新后的“新增功能”页面。如果您希望禁用更新后页面，请将此策略设置为空白。

policy-PasswordManagerEnabled = 启用到密码管理器的密码保存功能。

policy-PasswordManagerExceptions = 阻止 { -brand-short-name } 为特定站点保存密码。

# Post-quantum refers to cryptography that is safe from attacks by quantum
# computers. See https://en.wikipedia.org/wiki/Post-quantum_cryptography
policy-PostQuantumKeyAgreementEnabled = 启用用于 TLS 的后量子密钥协议。

# PDF.js and PDF should not be translated
policy-PDFjs = 禁用或配置 PDF.js，即 { -brand-short-name } 中内置的 PDF 查看器。

policy-Permissions2 = 配置相机、麦克风、位置、通知和自动播放的权限。

policy-PictureInPicture = 启用或禁用画中画功能。

policy-PopupBlocking2 = 允许特定网站显示弹出窗口，并由第三方框架进行重定向。

policy-Preferences = 设置并锁定部分首选项的值。

policy-PrivateBrowsingModeAvailability = 设置隐私浏览模式的可用性。

policy-PromptForDownloadLocation = 下载时询问文件的保存位置。

policy-Proxy = 配置代理设置。

policy-RelaunchRequired = 要求在指定期限内重新启动 { -brand-short-name }，并通知用户即将进行重新启动。

policy-RequestedLocales = 按偏好顺序设置应用程序的请求区域设置列表。

policy-SanitizeOnShutdown2 = 在关机时清除导航数据。

policy-SearchBar = 设置搜索栏的默认位置。仍允许用户对其进行自定义。

policy-SearchEngines = 配置搜索引擎设置。此策略仅在扩展支持版本（ESR）中可用。

policy-SearchSuggestEnabled = 启用或禁用搜索建议。

# For more information, see https://wikipedia.org/wiki/PKCS_11
policy-SecurityDevices2 = 添加或删除 PKCS #11 模块。

policy-ShowHomeButton = 在工具栏上显示主页按钮。

policy-SitePolicies = 网站特定策略。

# ”You represent that...” means ”You confirm/declare that...”
policy-SkipTermsOfUse2 = 启动时不显示使用条款和隐私声明。您声明您接受并有权代表您向其提供此浏览器访问权限的所有个人接受使用条款。

policy-SSLVersionMax = 设置最大 SSL 版本。

policy-SSLVersionMin = 设置最小 SSL 版本。

policy-StartDownloadsInTempDirectory = 强制下载从本地临时位置开始，而非默认下载目录。

policy-SupportMenu = 在帮助菜单中添加自定义支持菜单项。

policy-TranslateEnabled = 启用或禁用网页翻译。

policy-UserMessaging = 不向用户显示某些消息。

policy-UseSystemPrintDialog = 使用系统打印对话框进行打印。

policy-VisualSearchEnabled = 启用或禁用视觉搜索。

# “format” refers to the format used for the value of this policy.
policy-WebsiteFilter = 阻止网站被访问。有关格式的详细信息，请参阅文档。

policy-Windows10SSO = 允许 Microsoft、工作和学校账户的 Windows 单点登录。

# Entra is the name of a Microsoft product.
policy-MicrosoftEntraSSO = 允许 Microsoft Entra 账户的单点登录。

# Do not translate "XSLTProcessor" as it is the name of an API interface.
policy-XSLTEnabled = 启用或禁用对 XSLTProcessor JavaScript API 和 XSLT 处理指令的支持。