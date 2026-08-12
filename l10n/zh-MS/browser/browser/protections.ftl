# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Variables:
#   $count (Number) - Number of tracking events blocked.
graph-week-summary =
  { $count ->
     [one] { -brand-short-name } 阻止 { $count } 追踪者结束那过去星期
    *[other] { -brand-short-name } 阻止 { $count } 追踪者结束那过去星期
  }

# Variables:
#   $count (Number) - Number of tracking events blocked.
#   $earliestDate (Number) - Unix timestamp in ms, representing a date. The
# earliest date recorded in the database.
graph-total-tracker-summary =
  { $count ->
     [one] <b>{ $count }</b> 追踪者阻止自...以后 { DATETIME($earliestDate, day: "numeric", month: "long", year: "numeric") }
    *[other] <b>{ $count }</b> 追踪者阻止自...以后 { DATETIME($earliestDate, day: "numeric", month: "long", year: "numeric") }
  }

# Text displayed instead of the graph when in Private Mode
graph-private-window = { -brand-short-name } 继续到阻止追踪者在私人的窗口, 除了做不保持一个录制的什么曾是阻止.
# Weekly summary of the graph when the graph is empty in Private Mode
graph-week-summary-private-window = 追踪者 { -brand-short-name } 阻止这星期

protection-report-webpage-title = 保护仪表板
protection-report-page-content-title = 保护仪表板
# This message shows when all privacy protections are turned off, which is why we use the word "can", Firefox is able to protect your privacy, but it is currently not.
protection-report-page-summary = { -brand-short-name } 能防卫你的隐私在后地那现场一会儿你浏览. 这是一个个人化的摘要的那些保护, 包含工具到采取控制的你的联机安全.
# This message shows when at least some protections are turned on, we are more assertive compared to the message above, Firefox is actively protecting you.
protection-report-page-summary-default = { -brand-short-name } 防卫你的隐私在后地那现场一会儿你浏览. 这是一个个人化的摘要的那些保护, 包含工具到采取控制的你的联机安全.

protection-report-settings-link = 管理你的隐私和安全设置

etp-card-title-always = 增强跟踪保护: 总是在
etp-card-title-custom-not-blocking = 增大的跟踪保护: OFF
etp-card-content-description = { -brand-short-name } 自动地停止公司从秘密地下列各项你包围那网.
protection-report-etp-card-content-custom-not-blocking = 所有的保护是当前变质的关闭. 选取哪个追踪者到阻止由管理的你的 { -brand-short-name } 保护设置.
protection-report-manage-protections = 管理设置

# This string is used to label the X axis of a graph. Other days of the week are generated via Intl.DateTimeFormat,
# capitalization for this string should match the output for your locale.
graph-today = 今天

# This string is used to describe the graph for screenreader users.
graph-legend-description = 一个图形包含那总数数字的每个类型的追踪者阻止这星期.

social-tab-title = 社会的媒质追踪者
social-tab-contant = 社会的网络地方追踪者在其他的网站（全球资讯网的主机站）到跟随什么你做, 看见, 和观察联机. 这允许社会的媒质公司到学习更多关于你超过什么你均分在你的联欢会媒质提问档. <a data-l10n-name="learn-more-link">学习更多</a>

cookie-tab-title = 交叉-位置跟踪饼干
cookie-tab-content = 这些饼干跟随你从位置到给...择址到聚集资料关于什么你做联机. 他们是日落由第三宴会如此的作为做广告者和分析的公司. 组成块交叉-site 跟踪饼干减少那数字的精确定义系统那跟随你包围. <a data-l10n-name="learn-more-link">学习更多</a>

tracker-tab-title = 跟踪内容
tracker-tab-description = 网站（全球资讯网的主机站）可以加载外部精确定义系统, 视频文件, 和其他的内容与跟踪代码. 组成块跟踪内容能帮助坐加载加快, 除了一些按钮, 表单, 和注册(程序) 域可能不工作. <a data-l10n-name="learn-more-link">学习更多</a>

fingerprinter-tab-title = Fingerprinters
fingerprinter-tab-content = Fingerprinters 收集设置从你的浏览器和计算机到创建一个提问档的你. 使用这数字指纹, 他们能跟踪你越过不同的网站（全球资讯网的主机站）. <a data-l10n-name="learn-more-link">学习更多</a>

cryptominer-tab-title = Cryptominers
cryptominer-tab-content = Cryptominers 使用你的 system's 计算力到挖掘数字金钱. Cryptomining 手写体排水沟你的电池, 慢的向下你的计算机, 和能增加你的精力帐单. <a data-l10n-name="learn-more-link">学习更多</a>

protections-close-button2 =
  .aria-label = 关闭
  .title = 关闭

mobile-app-title = 阻止地址追踪者越过更多德维克（男子名、姓氏）
mobile-app-card-content = 使用那活动物体浏览器与构造-in 保护反对地址跟踪.
mobile-app-links = { -brand-product-name } 浏览器为了 <a data-l10n-name="android-mobile-inline-link">机器人</a> 和 <a data-l10n-name="ios-mobile-inline-link">网间网操作系统（Internet work 0perating System）</a>

lockwise-title = 从不忘记一个密码再一次
passwords-title-logged-in = 管理你的密码
passwords-header-content = { -brand-product-name } 安全地贮藏（storage）你的密码在你的浏览器中.
lockwise-header-content-logged-in = 安全地存储器操作和同步的你的密码对所有人你的德维克（男子名、姓氏）.
protection-report-passwords-save-passwords-button = 保存密码
  .title = 保存密码
protection-report-passwords-manage-passwords-button = 管理密码
  .title = 管理密码


# Variables:
# $count (Number) - Number of passwords exposed in data breaches.
lockwise-scanned-text-breached-logins =
  { $count ->
      [one] 1 密码可以有是暴露的在一个资料裂口.
     *[other] { $count } 密码可以有是暴露的在一个资料裂口.
  }

# While English doesn't use the number in the plural form, you can add $count to your language
# if needed for grammatical reasons.
# Variables:
# $count (Number) - Number of passwords stored in Lockwise.
lockwise-scanned-text-no-breached-logins =
  { $count ->
     [one] 1 密码储存的安全地.
    *[other] 你的密码是存在储存的安全地.
  }
lockwise-how-it-works-link = 如何它工作

monitor-title = 一看外面的为了资料裂口
monitor-link = 如何它工作
monitor-header-content-no-account = 复选 { -monitor-brand-name } 到看见如果 you have 你（们）已经是部分的一个已知的资料裂口, 和获得警觉的关于新的裂口.
monitor-header-content-signed-in = { -monitor-brand-name } 警告你如果你的信息有出现在一个已知的资料裂口.
monitor-sign-up-link = 正负号向上的为了裂口警觉的
  .title = 正负号向上的为了裂口警觉的在 { -monitor-brand-name }
auto-scan = 自动地已扫描的今天

monitor-emails-tooltip =
  .title = 查看指导电子信函地址在 { -monitor-brand-short-name }
monitor-breaches-tooltip =
  .title = 查看已知的资料裂口在 { -monitor-brand-short-name }
monitor-passwords-tooltip =
  .title = 查看暴露的密码在 { -monitor-brand-short-name }

# This string is displayed after a large numeral that indicates the total number
# of email addresses being monitored. Don’t add $count to
# your localization, because it would result in the number showing twice.
info-monitored-emails =
  { $count ->
     [one] 电子信函地址存在指导
    *[other] 电子信函地址存在指导
  }

# This string is displayed after a large numeral that indicates the total number
# of known data breaches. Don’t add $count to
# your localization, because it would result in the number showing twice.
info-known-breaches-found =
  { $count ->
     [one] 已知的资料裂口有暴露的你的信息
    *[other] 已知的资料裂口有暴露的你的信息
  }

# This string is displayed after a large numeral that indicates the total number
# of known data breaches that are marked as resolved by the user. Don’t add $count
# to your localization, because it would result in the number showing twice.
info-known-breaches-resolved =
  { $count ->
     [one] 已知的资料裂口有记号的作为下定决心的
    *[other] 已知的资料裂口有记号的作为下定决心的
  }

# This string is displayed after a large numeral that indicates the total number
# of exposed passwords. Don’t add $count to
# your localization, because it would result in the number showing twice.
info-exposed-passwords-found =
  { $count ->
     [one] 密码暴露的越过所有的裂口
    *[other] 密码暴露的越过所有的裂口
  }

# This string is displayed after a large numeral that indicates the total number
# of exposed passwords that are marked as resolved by the user. Don’t add $count
# to your localization, because it would result in the number showing twice.
info-exposed-passwords-resolved =
  { $count ->
     [one] 密码暴露的在非分辩的裂口
    *[other] 密码暴露的在非分辩的裂口
  }

monitor-no-breaches-title = 善行新闻!
monitor-no-breaches-description = 你有无已知的裂口. 如果那更改, 我们将让你知道.
monitor-view-report-link = 查看报告
  .title = 决定裂口在 { -monitor-brand-short-name }
monitor-breaches-unresolved-title = 决定你的裂口
monitor-breaches-unresolved-description = 在...之后检验( review的现在分词 ) 裂口详细数据和取得步骤到防卫你的信息, 你能标志裂口作为下定决心的.
monitor-manage-breaches-link = 管理裂口
  .title = 管理裂口在 { -monitor-brand-short-name }
monitor-breaches-resolved-title = 美好的! you have 你（们）已经下定决心的所有的已知的裂口.
monitor-breaches-resolved-description = 如果你的电子信函出现在任何的新的裂口, 我们将让你知道.

# Variables:
# $numBreachesResolved (Number) - Number of breaches marked as resolved by the user on Monitor.
# $numBreaches (Number) - Number of breaches in which a user's data was involved, detected by Monitor.
monitor-partial-breaches-title =
  { $numBreaches ->
   *[other] { $numBreachesResolved } 外面的的 { $numBreaches } 裂口有记号的作为下定决心的
  }

# Variables:
# $percentageResolved (Number) - Percentage of breaches marked as resolved by a user on Monitor.
monitor-partial-breaches-percentage = { $percentageResolved }% 完全的

monitor-partial-breaches-motivation-title-start = 大的启动!
monitor-partial-breaches-motivation-title-middle = 保持它向上的!
monitor-partial-breaches-motivation-title-end = 几乎完成了的! 保持它向上的.
monitor-partial-breaches-motivation-description = 决定那休息的你的裂口在 { -monitor-brand-short-name }.
monitor-resolve-breaches-link = 决定裂口
  .title = 决定裂口在 { -monitor-brand-short-name }

## The title attribute is used to display the type of protection.
## The aria-label is spoken by screen readers to make the visual graph accessible to blind users.
##
## Variables:
##   $count (Number) - Number of specific trackers
##   $percentage (Number) - Percentage this type of tracker contributes to the whole graph

bar-tooltip-social =
  .title = 社会的媒质追踪者
  .aria-label =
    { $count ->
       [one] { $count } 社会的媒质追踪者 ({ $percentage }%)
      *[other] { $count } 社会的媒质追踪者 ({ $percentage }%)
    }
bar-tooltip-cookie =
  .title = 交叉-位置跟踪饼干
  .aria-label =
    { $count ->
       [one] { $count } 交叉-site 跟踪饼干 ({ $percentage }%)
      *[other] { $count } 交叉-site 跟踪饼干 ({ $percentage }%)
    }
bar-tooltip-tracker =
  .title = 跟踪内容
  .aria-label =
    { $count ->
       [one] { $count } 跟踪内容 ({ $percentage }%)
      *[other] { $count } 跟踪内容 ({ $percentage }%)
    }
bar-tooltip-fingerprinter =
  .title = Fingerprinters
  .aria-label =
    { $count ->
       [one] { $count } fingerprinter ({ $percentage }%)
      *[other] { $count } fingerprinters ({ $percentage }%)
    }
bar-tooltip-cryptominer =
  .title = Cryptominers
  .aria-label =
    { $count ->
       [one] { $count } cryptominer ({ $percentage }%)
      *[other] { $count } cryptominers ({ $percentage }%)
    }

# Privacy Metrics Card
privacy-metrics-title = 隐私保护
# Variables:
#   $count (Number) - Total number of trackers blocked this week
privacy-metrics-blocked-this-week =
    { $count ->
        [one] { $count } 阻止这星期
       *[other] { $count } 阻止这星期
    }
# Variables:
#   $count (Number) - Number of trackers blocked
privacy-metrics-trackers =
    { $count ->
        [one] { $count } 追踪者
       *[other] { $count } 追踪者
    }
# Variables:
#   $count (Number) - Number of fingerprinters blocked
privacy-metrics-fingerprinters =
    { $count ->
        [one] { $count } fingerprinter
       *[other] { $count } fingerprinters
    }
# Variables:
#   $count (Number) - Number of tracking cookies blocked
privacy-metrics-cookies =
    { $count ->
        [one] { $count } 跟踪饼干
       *[other] { $count } 跟踪饼干
    }
# Variables:
#   $count (Number) - Number of social trackers blocked
privacy-metrics-social =
    { $count ->
        [one] { $count } 社会的追踪者
       *[other] { $count } 社会的追踪者
    }
privacy-metrics-empty = 无追踪者阻止这星期. { -brand-short-name } 防卫你从那下列各项恐吓作为你浏览.
privacy-metrics-loading = 装载保护静…
privacy-metrics-error = 不能的到加载保护静.
privacy-metrics-private-window = { -brand-short-name } 继续到阻止追踪者在私人的窗口, 除了做不保持一个录制的什么曾是阻止.

## VPN promo card and banner

protections-vpn-title = 采取隐私保护超过那浏览器
protections-vpn-header-content = 防卫你的整个装置与 { -mozilla-vpn-brand-name }. 一(个) 接头加密所有的通信量和 hide的过去式和过去分词你的位置.
protections-get-vpn-link = 获得 { -mozilla-vpn-brand-name }

protections-vpn-title-subscribed = VPN: 捐助( subscribe的过去式和过去分词 )
# Variables
#   $count (number): Number of devices
protections-vpn-header-content-subscribed =
    { $count ->
       *[other] 使用那 { -mozilla-vpn-brand-name } 加密所有的你的通信量和 hide的过去式和过去分词你的位置—在向上的到 { $count } 德维克（男子名、姓氏）. 获得那最多从你的捐献—添加它从那 <a data-l10n-name="playstore-link">谷歌播放存储器操作</a> 或 <a data-l10n-name="appstore-link">苹果应用存储器操作</a>.
    }

protections-vpn-banner-header = 保护那扩展超过那浏览器
protections-vpn-banner-content = 尝试 { -mozilla-vpn-brand-name } 冒险-free 和看见为什么 TechRadar 说（第三人称单数）, “它的中央处理机速度设置程序, 简明性和低点月刊价格使它价值一个一看.”
protections-vpn-banner-link = 获得 { -mozilla-vpn-brand-name }


# Vantage Privacy Dashboard - additional l10n strings

vantage-dashboard-total-blocked = 全体的阻止
vantage-dashboard-trackers = 追踪者
vantage-dashboard-cookies = 交叉-位置饼干
vantage-dashboard-fingerprinters = Fingerprinters
vantage-dashboard-cryptominers = Cryptominers
vantage-dashboard-social = 社会的追踪者

vantage-dashboard-status-title = 保护状态
vantage-dashboard-status-tp = 跟踪保护
vantage-dashboard-status-cookie = 饼干组成块
vantage-dashboard-status-fingerprint = 指纹法保护
vantage-dashboard-status-cryptominer = Cryptominer 组成块
vantage-dashboard-status-social = 社会的跟踪保护

vantage-privacy-dashboard-link = 查看隐私仪表板
