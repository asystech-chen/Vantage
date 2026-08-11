# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Variables:
#   $count (Number) - Number of tracking events blocked.
graph-week-summary =
  { $count ->
     [one] { -brand-short-name } 在过去一周内拦截了 { $count } 个跟踪器
    *[other] { -brand-short-name } 在过去一周内拦截了 { $count } 个跟踪器
  }

# Variables:
#   $count (Number) - Number of tracking events blocked.
#   $earliestDate (Number) - Unix timestamp in ms, representing a date. The
graph-total-tracker-summary =
  { $count ->
     [one] 自 { DATETIME($earliestDate, day: "numeric", month: "long", year: "numeric") } 起已拦截 <b>{ $count }</b> 个跟踪器
    *[other] 自 { DATETIME($earliestDate, day: "numeric", month: "long", year: "numeric") } 起已拦截 <b>{ $count }</b> 个跟踪器
  }

# earliest date recorded in the database.
graph-private-window = { -brand-short-name } 在隐私窗口中继续拦截跟踪器，但不保留被拦截内容的记录。
# Text displayed instead of the graph when in Private Mode
graph-week-summary-private-window = { -brand-short-name } 本周拦截的跟踪器

protection-report-webpage-title = 保护仪表板
protection-report-page-content-title = 保护仪表板
# Weekly summary of the graph when the graph is empty in Private Mode
protection-report-page-summary = { -brand-short-name } 能够在您浏览网页时于后台保护您的隐私。此为这些保护措施的个性化摘要，包括用于掌控您的在线安全之工具。
# This message shows when all privacy protections are turned off, which is why we use the word "can", Firefox is able to protect your privacy, but it is currently not.
protection-report-page-summary-default = { -brand-short-name } 在您浏览网页时于后台保护您的隐私。此为这些保护措施的个性化摘要，包括用于掌控您的在线安全之工具。

protection-report-settings-link = 管理您的隐私与安全设置

etp-card-title-always = 增强型跟踪保护：始终启用
etp-card-title-custom-not-blocking = 增强型跟踪保护：已关闭
etp-card-content-description = { -brand-short-name } 自动阻止公司在网络上暗中跟踪您。
protection-report-etp-card-content-custom-not-blocking = 所有保护功能目前均已关闭。您可通过管理 { -brand-short-name } 保护设置来选择要拦截的跟踪器。
protection-report-manage-protections = 管理设置

# This message shows when at least some protections are turned on, we are more assertive compared to the message above, Firefox is actively protecting you.
# This string is used to label the X axis of a graph. Other days of the week are generated via Intl.DateTimeFormat,
graph-today = 今日

# capitalization for this string should match the output for your locale.
graph-legend-description = 包含本周内每种类型被拦截跟踪器总数之图形。

social-tab-title = 社交媒体跟踪器
social-tab-contant = 社交网络在其他网站上放置跟踪器，以追踪您的在线行为、观看内容和浏览内容。这使得社交媒体公司能够了解超出您在社交媒体资料中分享内容的更多信息。<a data-l10n-name="learn-more-link">了解更多</a>

cookie-tab-title = 跨站跟踪 Cookie
cookie-tab-content = 此类 Cookie 在网站之间跟踪您，以收集您在线行为的资料。它们由广告商和分析公司等第三方设置。拦截跨站跟踪 Cookie 可减少跟随您的广告数量。<a data-l10n-name="learn-more-link">了解更多</a>

tracker-tab-title = 跟踪内容
tracker-tab-description = 网站可能加载包含跟踪代码的外部广告、视频和其他内容。拦截跟踪内容有助于加快网站加载速度，但某些按钮、表单和登录字段可能无法正常工作。<a data-l10n-name="learn-more-link">了解更多</a>

fingerprinter-tab-title = 指纹识别器
fingerprinter-tab-content = 指纹识别器从您的浏览器和计算机收集设置以创建您的配置文件。利用此数字指纹，他们能够跨不同网站跟踪您。<a data-l10n-name="learn-more-link">了解更多</a>

cryptominer-tab-title = 加密货币挖矿器
cryptominer-tab-content = 加密货币挖矿器使用您系统的计算功率来挖掘数字货币。加密货币挖矿脚本会耗尽您的电池电量、降低计算机速度，并且可能增加您的能源账单。<a data-l10n-name="learn-more-link">了解更多</a>

protections-close-button2 =
  .aria-label = 关闭
  .title = 关闭

mobile-app-title = 在更多设备上拦截广告跟踪器
mobile-app-card-content = 使用具备内置广告跟踪拦截保护功能的移动浏览器。
mobile-app-links = { -brand-product-name } 浏览器，适用于<a data-l10n-name="android-mobile-inline-link">安卓</a>和<a data-l10n-name="ios-mobile-inline-link">苹果移动操作系统</a>

lockwise-title = 从此不再忘记密码
passwords-title-logged-in = 管理您的密码
passwords-header-content = { -brand-product-name } 将您的密码安全存储在您的浏览器中。
lockwise-header-content-logged-in = 安全存储并将您的密码同步至您的所有设备。
protection-report-passwords-save-passwords-button = 保存密码
  .title = 保存密码
protection-report-passwords-manage-passwords-button = 管理密码
  .title = 管理密码


# This string is used to describe the graph for screenreader users.
# Variables:
lockwise-scanned-text-breached-logins =
  { $count ->
      [one] 有 1 个密码可能已在数据泄露中暴露。
     *[other] 有 { $count } 个密码可能已在数据泄露中暴露。
  }

# $count (Number) - Number of passwords exposed in data breaches.
# While English doesn't use the number in the plural form, you can add $count to your language
# if needed for grammatical reasons.
lockwise-scanned-text-no-breached-logins =
  { $count ->
     [one] 有 1 个密码存储安全。
    *[other] 您的密码正在被安全存储。
  }
lockwise-how-it-works-link = 工作原理

monitor-title = 警惕数据泄露
monitor-link = 工作原理
monitor-header-content-no-account = 请检查 { -monitor-brand-name } 以确认您是否涉及已知数据泄露，并获取关于新泄露的警报。
monitor-header-content-signed-in = 当您的信息出现在已知数据泄露中时，{ -monitor-brand-name } 会向您发出警告。
monitor-sign-up-link = 注册以获取泄露警报
  .title = 在 { -monitor-brand-name } 上注册以获取泄露警报
auto-scan = 今日已自动扫描

monitor-emails-tooltip =
  .title = 在 { -monitor-brand-short-name } 上查看受监控的电子邮件地址
monitor-breaches-tooltip =
  .title = 在 { -monitor-brand-short-name } 上查看已知数据泄露
monitor-passwords-tooltip =
  .title = 在 { -monitor-brand-short-name } 上查看已暴露的密码

# Variables:
# $count (Number) - Number of passwords stored in Lockwise.
info-monitored-emails =
{ $count ->
     [one] 正在监控的电子邮件地址
    *[other] 正在监控的电子邮件地址
  }

# This string is displayed after a large numeral that indicates the total number
# of known data breaches. Don’t add $count to
# your localization, because it would result in the number showing twice.
info-known-breaches-found =
  { $count ->
     [one] 已知的数据泄露事件已暴露您的信息
    *[other] 已知的数据泄露事件已暴露您的信息
  }

# This string is displayed after a large numeral that indicates the total number
# of known data breaches that are marked as resolved by the user. Don’t add $count
# to your localization, because it would result in the number showing twice.
info-known-breaches-resolved =
  { $count ->
     [one] 已知的数据泄露事件已标记为已解决
    *[other] 已知的数据泄露事件已标记为已解决
  }

# This string is displayed after a large numeral that indicates the total number
# of exposed passwords. Don’t add $count to
# your localization, because it would result in the number showing twice.
info-exposed-passwords-found =
  { $count ->
     [one] 密码已在所有泄露事件中暴露
    *[other] 密码已在所有泄露事件中暴露
  }

# This string is displayed after a large numeral that indicates the total number
# of exposed passwords that are marked as resolved by the user. Don’t add $count
# to your localization, because it would result in the number showing twice.
info-exposed-passwords-resolved =
  { $count ->
     [one] 密码已在未解决的泄露事件中暴露
    *[other] 密码已在未解决的泄露事件中暴露
  }

monitor-no-breaches-title = 好消息！
monitor-no-breaches-description = 您没有已知的数据泄露事件。如果情况发生变化，我们将通知您。
monitor-view-report-link = 查看报告
  .title = 在 { -monitor-brand-short-name } 上解决数据泄露事件
monitor-breaches-unresolved-title = 解决您的数据泄露事件
monitor-breaches-unresolved-description = 在查看泄露详情并采取步骤保护您的信息后，您可以将泄露事件标记为已解决。
monitor-manage-breaches-link = 管理数据泄露事件
  .title = 在 { -monitor-brand-short-name } 上管理数据泄露事件
monitor-breaches-resolved-title = 操作已成功完成。您已解决所有已知的数据泄露事件。
monitor-breaches-resolved-description = 如果您的电子邮件出现在任何新的泄露事件中，我们将通知您。

# Variables:
# $numBreachesResolved (Number) - Number of breaches marked as resolved by the user on Monitor.
# $numBreaches (Number) - Number of breaches in which a user's data was involved, detected by Monitor.
monitor-partial-breaches-title =
  { $numBreaches ->
   *[other] { $numBreachesResolved } 个数据泄露事件中的 { $numBreaches } 个已标记为已解决
  }

# Variables:
# $percentageResolved (Number) - Percentage of breaches marked as resolved by a user on Monitor.
monitor-partial-breaches-percentage = { $percentageResolved }% 完成

monitor-partial-breaches-motivation-title-start = 良好的开端！
monitor-partial-breaches-motivation-title-middle = 保持下去！
monitor-partial-breaches-motivation-title-end = 即将完成！请保持下去。
monitor-partial-breaches-motivation-description = 请在 { -monitor-brand-short-name } 上解决其余的数据泄露事件。
monitor-resolve-breaches-link = 解决数据泄露事件
  .title = 在 { -monitor-brand-short-name } 上解决数据泄露事件

## The title attribute is used to display the type of protection.
## The aria-label is spoken by screen readers to make the visual graph accessible to blind users.
##
## Variables:
##   $count (Number) - Number of specific trackers
##   $percentage (Number) - Percentage this type of tracker contributes to the whole graph

bar-tooltip-social =
  .title = 社交媒体跟踪器
  .aria-label =
    { $count ->
       [one] { $count } 个社交媒体跟踪器（{ $percentage }%）
      *[other] { $count } 个社交媒体跟踪器（{ $percentage }%）
    }
bar-tooltip-cookie =
  .title = 跨站跟踪 Cookie
  .aria-label =
    { $count ->
       [one] { $count } 个跨站跟踪 Cookie（{ $percentage }%）
      *[other] { $count } 个跨站跟踪 Cookie（{ $percentage }%）
    }
bar-tooltip-tracker =
  .title = 跟踪内容
  .aria-label =
    { $count ->
       [one] { $count } 个跟踪内容（{ $percentage }%）
      *[other] { $count } 个跟踪内容（{ $percentage }%）
    }
bar-tooltip-fingerprinter =
  .title = 指纹识别器
  .aria-label =
    { $count ->
       [one] { $count } 个指纹识别器（{ $percentage }%）
      *[other] { $count } 个指纹识别器（{ $percentage }%）
    }
bar-tooltip-cryptominer =
  .title = 加密货币挖掘器
  .aria-label =
    { $count ->
       [one] { $count } 个加密货币挖掘器（{ $percentage }%）
      *[other] { $count } 个加密货币挖掘器（{ $percentage }%）
    }

# Privacy Metrics Card
privacy-metrics-title = 隐私保护
# Variables:
#   $count (Number) - Total number of trackers blocked this week
privacy-metrics-blocked-this-week =
    { $count ->
[one] 本周已阻止 { $count } 个
       *[other] 本周已阻止 { $count } 个
    }
# Variables:
#   $count (Number) - Number of trackers blocked
privacy-metrics-trackers =
    { $count ->
        [one] 已阻止 { $count } 个跟踪器
       *[other] 已阻止 { $count } 个跟踪器
    }
# Variables:
#   $count (Number) - Number of fingerprinters blocked
privacy-metrics-fingerprinters =
    { $count ->
        [one] 已阻止 { $count } 个指纹识别器
       *[other] 已阻止 { $count } 个指纹识别器
    }
# Variables:
#   $count (Number) - Number of tracking cookies blocked
privacy-metrics-cookies =
    { $count ->
        [one] 已阻止 { $count } 个跟踪 Cookie
       *[other] 已阻止 { $count } 个跟踪 Cookie
    }
# Variables:
#   $count (Number) - Number of social trackers blocked
privacy-metrics-social =
    { $count ->
        [one] 已阻止 { $count } 个社交跟踪器
       *[other] 已阻止 { $count } 个社交跟踪器
    }
privacy-metrics-empty = 本周未阻止任何跟踪器。{ -brand-short-name } 正在保护您免受浏览过程中以下威胁的侵害。
privacy-metrics-loading = 正在加载保护统计数据…
privacy-metrics-error = 无法加载保护统计数据。
privacy-metrics-private-window = { -brand-short-name } 将在隐私窗口中继续阻止跟踪器，但不会记录已阻止的内容。

## VPN promo card and banner

protections-vpn-title = 将隐私保护扩展到浏览器之外
protections-vpn-header-content = 使用 { -mozilla-vpn-brand-name } 保护您的整个设备。一次单击即可加密所有流量并隐藏您的位置。
protections-get-vpn-link = 获取 { -mozilla-vpn-brand-name }

protections-vpn-title-subscribed = VPN：已订阅
# Variables
#   $count (number): Number of devices
protections-vpn-header-content-subscribed =
    { $count ->
       *[other] 使用 { -mozilla-vpn-brand-name } 可加密您所有流量并隐藏您的位置——最多可在 { $count } 台设备上使用。为充分利用您的订阅，请从 <a data-l10n-name="playstore-link">Google Play 商店</a>或 <a data-l10n-name="appstore-link">Apple App Store</a> 添加。
    }

protections-vpn-banner-header = 扩展至浏览器之外的保护
protections-vpn-banner-content = 无风险试用 { -mozilla-vpn-brand-name }，了解 TechRadar 为何称其“速度、简洁性和低廉的月费使其值得一试”。
protections-vpn-banner-link = 获取 { -mozilla-vpn-brand-name }


# Vantage Privacy Dashboard - additional l10n strings

vantage-dashboard-total-blocked = 已阻止总数
vantage-dashboard-trackers = 跟踪器
vantage-dashboard-cookies = 跨站 Cookie
vantage-dashboard-fingerprinters = 指纹识别器
vantage-dashboard-cryptominers = 加密矿工
vantage-dashboard-social = 社交跟踪器

vantage-dashboard-status-title = 保护状态
vantage-dashboard-status-tp = 跟踪保护
vantage-dashboard-status-cookie = Cookie 阻止
vantage-dashboard-status-fingerprint = 指纹保护
vantage-dashboard-status-cryptominer = 加密矿工阻止
vantage-dashboard-status-social = 社交跟踪保护

vantage-privacy-dashboard-link = 查看隐私仪表板