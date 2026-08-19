
cert-error-intro = { $hostname } 使用一个病人安全证书.

cert-error-mitm-intro = 网站（全球资讯网的主机站）证明他们的 (打)标记经由证书, 哪个是发布由证书权力.

cert-error-mitm-mozilla = { -brand-short-name } 是有背的由那非-profit 摩斯拉, 哪个管理一个完全地打开证书权力 (CA) 存储器操作. 那 CA 存储器操作帮忙确定那证书权力是下列各项最好的实践为了用户安全.

cert-error-mitm-connection = { -brand-short-name } 使用那摩斯拉 CA 存储器操作到证明那一个连接是无虑的, 宁可比证书有...提供的由那 user's 操作的系统. 如此, 如果一个抗病毒素程序或一个网络是被截终端一个连接与一个安全证书发布由一个 CA 那是不在那摩斯拉 CA 存储器操作, 那连接是考虑过的不安全的.

cert-error-trust-unknown-issuer-intro = 有人能够是尝试到模仿那位置和你应该不继续.

cert-error-trust-unknown-issuer = 网站（全球资讯网的主机站）证明他们的 (打)标记经由证书. { -brand-short-name } 做不信任 { $hostname } 因为它的证书发行者是不知道的, 那证书是自己-有符号的, 或那服务器是不发送那正确的中级证书.

cert-error-trust-cert-invalid = 那证书是不可信的因为它曾是发布由一个病人 CA 证书.

cert-error-trust-untrusted-issuer = 那证书是不可信的因为那发行者证书是不可信的.

cert-error-trust-signature-algorithm-disabled = 那证书是不可信的因为它曾是有符号的使用一个签名附件算法那曾是禁用因为那算法是不固定.

cert-error-trust-expired-issuer = 那证书是不可信的因为那发行者证书有失效的.

cert-error-trust-self-signed = 那证书是不可信的因为它是自己-signed.

cert-error-trust-certificate-transparency = { -brand-short-name } 不信任 { $hostname } 因为它不能证明它遇见公众证书透明性需求.


cert-error-revoked-certificate = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 有是取消的和不是可信的再也不.
cert-error-bad-signature = { -brand-short-name } 阻止你的拜访到此站点因为那签名附件在那证书倘若为了 { $hostname } 不是有确实根据的.
cert-error-key-pinning-failure = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 使用一个不同的公众键比预期的.
cert-error-bad-der = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 不是适当地编码的.
cert-error-cert-not-in-name-space = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 不跟随那名称约束的一个证书那发布它.
cert-error-inadequate-cert-type = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 不是允许到是使用由一个网服务器.
cert-error-path-len-constraint-invalid = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 有也多数中级证书在那路径到那根证书.
cert-error-invalid-key = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 有一个键那是病人. 最多有可能的, 它是也小的到是无虑的.
cert-error-unknown-critical-extension = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 包含一个未经证实的批评的扩展名.
cert-error-extension-value-invalid = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 包含一个病人扩展名.
cert-error-untrusted-issuer = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 曾是发布由一个证书权力那不是可信的再也不.
cert-error-untrusted-cert = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 是有记号的作为不可信的.
cert-error-invalid-integer-encoding = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 包含一个病人编码的一个整数. 公用块原因包含负数连续的数字, 负数 RSA 模（模件, 和编码那是比较久比必要的.
cert-error-unsupported-keyalg = { -brand-short-name } 阻止你的拜访到此站点因为那证书倘若为了 { $hostname } 有一个未经证实的键类型.
cert-error-issuer-no-longer-trusted = { -brand-short-name } 阻止你的拜访到此站点因为那证书权力那发布那证书倘若为了 { $hostname } 不是可信的再也不.
cert-error-signature-algorithm-mismatch = { -brand-short-name } 阻止你的拜访到此站点因为那签名附件算法的那证书倘若为了 { $hostname } 不比较它的签名附件算法域.

cert-error-untrusted-default = 那证书做不过来从一个可信的来源.

cert-error-domain-mismatch = 网站（全球资讯网的主机站）证明他们的 (打)标记经由证书. { -brand-short-name } 做不信任此站点因为它使用一个证书那是不有确实根据的为了 { $hostname }.

cert-error-domain-mismatch-single = 网站（全球资讯网的主机站）证明他们的 (打)标记经由证书. { -brand-short-name } 做不信任此站点因为它使用一个证书那是不有确实根据的为了 { $hostname }. 那证书是仅有确实根据的为了 <a data-l10n-name="domain-mismatch-link">{ $alt-name }</a>.

cert-error-domain-mismatch-single-nolink = 网站（全球资讯网的主机站）证明他们的 (打)标记经由证书. { -brand-short-name } 做不信任此站点因为它使用一个证书那是不有确实根据的为了 { $hostname }. 那证书是仅有确实根据的为了 { $alt-name }.

cert-error-domain-mismatch-multiple = 网站（全球资讯网的主机站）证明他们的 (打)标记经由证书. { -brand-short-name } 做不信任此站点因为它使用一个证书那是不有确实根据的为了 { $hostname }. 那证书是仅有确实根据的为了那下列各项名称: { $subject-alt-names }

cert-error-expired-now = 网站（全球资讯网的主机站）证明他们的 (打)标记经由证书, 哪个是有确实根据的为了一个日落时间时期. 那证书为了 { $hostname } 失效的在 { $not-after-local-time }.

cert-error-not-yet-valid-now = 网站（全球资讯网的主机站）证明他们的 (打)标记经由证书, 哪个是有确实根据的为了一个日落时间时期. 那证书为了 { $hostname } 将不是有确实根据的直到 { $not-before-local-time }.

cert-error-code-prefix = 错误代码: { $error }

cert-error-code-prefix-link = 错误代码: <a data-l10n-name="error-code-link">{ $error }</a>

cert-error-ssl-connection-error = 一个错误发生在...的时候一个连接到 { $hostname }. { $errorMessage }

cert-error-old-tls-version = 这网站（全球资讯网的主机站）可能不支持那 TLS 1.2 协议, 哪个是那最小值版本被支持的由 { -brand-short-name }.

cert-error-details-hsts-label = HTTP 严厉的传送安全: { $hasHSTS }

cert-error-details-key-pinning-label = HTTP 公众键阻塞: { $hasHPKP }

cert-error-details-cert-chain-label = 证书链:

csp-xfo-blocked-long-desc = 到防卫你的安全, { $hostname } 将不允许 { -brand-short-name } 到显示器那页如果另外的位置有植入的它. 到看见这页, 你需要到打开它在一个新的窗口.


connectionFailure-title = 不能的到连接
deniedPortAccess-title = 这地址是受限制的
dnsNotFound-title = 隐马尔可夫模型. 我们是财产烦恼发现那位置.
internet-connection-offline-title = 一看相似的那里是一个问题与你的因特网连接.

fileNotFound-title = 文件不发现
fileAccessDenied-title = 访问到那文件曾是拒绝
generic-title = 面向对象的程序设计.
captivePortal-title = 日志在到网络
malformedURI-title = 隐马尔可夫模型. 那地址不一看右.
netInterrupt-title = 那连接曾是断续的
notCached-title = 文档失效的
netOffline-title = 挂线模式
contentEncodingError-title = 内容编码错误
unsafeContentType-title = 不安全的文件类型
netReset-title = 那连接曾是重置
netTimeout-title = 那连接有时控的外面的
httpErrorPage-title = 一看相似的那里是一个问题与此站点
serverError-title = 一看相似的那里是一个问题与此站点
unknownProtocolFound-title = 那地址不是和过去分词
proxyConnectFailure-title = 那代理服务器是拒绝连接
proxyResolveFailure-title = 不能的到发现那代理服务器
redirectLoop-title = 那页不是（以新的方式或目的）重新使用适当地
unknownSocketType-title = 料想不到的应答从服务器
nssFailure2-title = 无虑的连接失败的
csp-xfo-error-title = { -brand-short-name } 不能打开这页
corruptedContentErrorv2-title = 毁坏的内容错误
sslv3Used-title = 不能的到连接安全地
inadequateSecurityError-title = 你的连接是不固定
blockedByPolicy-title = 阻止页
clockSkewError-title = 你的计算机时钟是错误的
networkProtocolError-title = 网络协议错误
nssBadCert-title = 警告: 潜在性安全冒险领先的
nssBadCert-sts-title = 做不连接: 潜在性安全发行
certerror-mitm-title = 软设备是预防 { -brand-short-name } 从安全地接线的到此站点


fp-certerror-page-title = 警告: 安全冒险
fp-certerror-body-title = 是小心的. 某事不一看右.

fp-certerror-why-site-dangerous = 什么使那位置一看危险的?
fp-certerror-what-can-you-do = 什么能你做关于它?

fp-certerror-advanced-title = 在前的

fp-certerror-advanced-button = 在前的
fp-certerror-hide-advanced-button = 隐藏在前的


fp-certerror-override-exception-button-2 = 继续进行到 { $hostname } (危险的)
    .accesskey = P
fp-certerror-intro = { -brand-short-name } 有斑点的一个可能地严肃的安全发行与 <strong>{ $hostname }</strong>. 有人假装到是那位置能够试到剽窃事物相似的信用量卡片信息, 密码, 或电子信函.
fp-certerror-expired-into = { -brand-short-name } 有斑点的一个安全发行与 <strong>{ $hostname }</strong>. (两者之中)任一的那位置不是日落向上的右或你的 device's 时钟是日落到那错误的日期/时间.
fp-certerror-transparency-intro = 有人假装到是 <strong>{ $hostname }</strong> 能够试到剽窃事物相似的信用量卡片信息, 密码, 或电子信函.


fp-certerror-view-certificate-link = 查看那 site's 证书
fp-certerror-return-to-previous-page-recommended-button-2 = 去回 (被推荐的)
    .accesskey = G

fp-certerror-revoked-why-dangerous-body = { -brand-short-name } 是警告你关于此站点因为那证书倘若为了 { $hostname } 有是取消的和不是可信的再也不.
fp-certerror-revoked-what-can-you-do-body = 大概无, 自...以后它是有可能的那里是一个问题与那位置它本身. 你能复选与那网站（全球资讯网的主机站）拥有者到看见如果他们是工作在那问题.

fp-certerror-bad-domain-why-dangerous-body = 那位置是日落向上的到允许仅无虑的连接, 除了那里是一个问题与那 site's 证书. 它是可能的那一个坏男演员正尝试模仿那位置. 位置使用证书发布由一个证书权力到证明他们是实际上谁他们说他们是. { -brand-short-name } 不信任此站点因为它的证书不是有确实根据的为了 { $hostname }. 那证书是仅有确实根据的为了: { $validHosts }.
fp-certerror-bad-domain-what-can-you-do-body = 大概无, 自...以后它是有可能的那里是一个问题与那位置它本身. 位置使用证书发布由一个证书权力到证明他们是实际上谁他们说他们是. 除了如果你是在一个社团的网络, 你的支持队可以有更多信息. 如果你是使用抗病毒素软设备, 尝试搜索的为了潜在性冲突或已知的发行.

fp-certerror-untrusted-issuer-why-dangerous-body = { -brand-short-name } 是警告你关于此站点因为那证书倘若为了 { $hostname } 曾是发布由一个证书权力那不是可信的再也不.
fp-certerror-untrusted-issuer-what-can-you-do-body = 大概无, 自...以后它是有可能的那里是一个问题与那位置它本身. 你能复选与那网站（全球资讯网的主机站）拥有者到看见如果他们是工作在那问题.

fp-certerror-unknown-issuer-why-dangerous-body = 那里是一个发行与那 site's 证书. 它是可能的那一个坏男演员正尝试模仿那位置. 位置使用证书发布由一个证书权力到证明他们是实际上谁他们说他们是. { -brand-short-name } 不信任此站点因为我们不能告诉谁发布那证书, 它是自己-有符号的, 或那位置不是发送中级证书我们信任.
fp-certerror-unknown-issuer-what-can-you-do-body = 大概无, 自...以后它是有可能的那里是一个问题与那位置它本身. 除了如果你是在一个社团的网络, 你的支持队可以有更多信息. 如果你是使用抗病毒素软设备, 它可以需要到是配置的到工作与 { -brand-short-name }.

fp-certerror-self-signed-why-dangerous-body = 因为那里是一个发行与那 site's 证书. 位置使用证书发布由一个证书权力到证明他们是实际上谁他们说他们是. 此站点's 证书是自己-signed. 它不是发布由一个经过验证的证书权力–如此我们不要信任它默认情况下.
fp-certerror-self-signed-what-can-you-do-body = 不大量. 它是有可能的那里是一个问题与那位置它本身.
fp-certerror-self-signed-important-note = IMPORTANT NOTE: 如果你是尝试到拜访此站点在一个社团的内联网, 你的 IT 全体人员可以使用自己-signed 证书. 他们能帮助你复选他们的可靠性.

fp-certerror-expired-why-dangerous-body = 位置使用证书发布由一个证书权力到证明他们是实际上谁他们说他们是. { -brand-short-name } 不信任此站点因为它看相似的那证书失效的在 { DATETIME($date, month: "numeric", day: "numeric", year: "numeric") }.

fp-certerror-not-yet-valid-why-dangerous-body = 位置使用证书发布由一个证书权力到证明他们是实际上谁他们说他们是. { -brand-short-name } 不信任此站点因为它看相似的那证书将不是有确实根据的直到 { DATETIME($date, month: "numeric", day: "numeric", year: "numeric") }.

fp-certerror-expired-what-can-you-do-body = 你的 device's 时钟是日落到 { DATETIME($date, month: "numeric", day: "numeric", year: "numeric") }. 如果这是正确的, 那安全发行是大概与那位置它本身. 如果它是错误的, 你能更改它在你的 device's 系统设置.

fp-cert-error-code = 错误代码: { $error }

fp-datetime = { DATETIME($datetime, month: "short", year: "numeric", day: "numeric") } { DATETIME($datetime, timeStyle: "long") }

fp-certerror-transparency-why-dangerous-body = { -brand-short-name } 不信任 { $hostname } 因为它不能证明它遇见公众证书透明性需求.
fp-certerror-transparency-what-can-you-do-body = 大概无, 自...以后它是有可能的那里是一个问题与那位置它本身.


fp-learn-more-about-secure-connection-failures = 学习更多关于无虑的连接故障
fp-learn-more-about-cert-issues = 学习更多关于这些种类的证书发行
fp-learn-more-about-time-related-errors = 学习更多关于发现并修理故障时间-related 错误

fp-certerror-pkix-not-yet-valid-why-dangerous-body = { -brand-short-name } 不信任此站点因为它看相似的那证书倘若不是有确实根据的直到 { DATETIME($date, timeStyle: "short") } 在 { DATETIME($date, month: "numeric", day: "numeric", year: "numeric") }.

fp-certerror-pkix-not-yet-valid-what-can-you-do-body = 你的 device's 时钟是日落到 { DATETIME($date, timeStyle: "short") } { DATETIME($date, month: "numeric", day: "numeric", year: "numeric") }. 如果这是正确的, 那安全发行是大概与那位置它本身. 如果它是错误的, 你能更改它在你的 device's 系统设置.

fp-certerror-invalid-cert-why-dangerous = 那拥有者的 { $hostname } 没有日落它向上的适当地和一个无虑的连接不能是创建.

fp-certerror-clock-skew-intro = 你的计算机想它是 { DATETIME($now, dateStyle: "medium") }, 哪个预防 { -brand-short-name } 从接线的安全地. 到拜访 <strong>{ $hostname }</strong>, 更新你的计算机时钟在你的系统设置到当前日期, 时间, 和时间卡片顶部的三行区, 和然后刷新那页.
fp-certerror-clock-skew-what-can-you-do-body = 更新你的计算机时钟在你的系统设置到当前日期, 时间, 和时间卡片顶部的三行区. 你的计算机想它是 { DATETIME($now, dateStyle: "medium") }.
