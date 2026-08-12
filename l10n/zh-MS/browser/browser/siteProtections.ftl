# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

content-blocking-trackers-view-empty = 一点也不检测到的在此站点

content-blocking-cookies-blocking-trackers-label = 交叉-位置跟踪饼干
content-blocking-cookies-blocking-third-party-label = 第三-宴会饼干
content-blocking-cookies-blocking-unvisited-label = Unvisited 位置饼干
content-blocking-cookies-blocking-all-label = 所有的饼干

content-blocking-cookies-view-first-party-label = 从这位置
content-blocking-cookies-view-trackers-label = 交叉-位置跟踪饼干
content-blocking-cookies-view-third-party-label = 第三-宴会饼干

# This label is shown next to a cookie origin in the cookies subview.
# It forms the end of the (imaginary) sentence "www.example.com [was] Allowed"
content-blocking-cookies-view-allowed-label =
    .value = 允许
# This label is shown next to a cookie origin in the cookies subview.
# It forms the end of the (imaginary) sentence "www.example.com [was] Blocked"
content-blocking-cookies-view-blocked-label =
    .value = 阻止

# Variables:
#   $domain (String): the domain of the site.
content-blocking-cookies-view-remove-button =
    .tooltiptext = 清除饼干例外为了 { $domain }

tracking-protection-icon-active = 组成块社会的媒质追踪者, 交叉-site 跟踪饼干, 和 fingerprinters.
tracking-protection-icon-active-container =
    .aria-label = { tracking-protection-icon-active }
tracking-protection-icon-disabled = 增强跟踪保护是 OFF 为了此站点.
tracking-protection-icon-disabled-container =
    .aria-label = { tracking-protection-icon-disabled }
tracking-protection-icon-no-trackers-detected = 无追踪者已知的到 { -brand-short-name } 曾是检测到的在这页.
tracking-protection-icon-no-trackers-detected-container =
    .aria-label = { tracking-protection-icon-no-trackers-detected }

## Variables:
##   $host (String): the site's hostname

# Header of the Protections Panel.
protections-header = 保护为了 { $host }

## Blocking and Not Blocking sub-views in the Protections Panel

protections-blocking-fingerprinters =
    .title = Fingerprinters 阻止
protections-blocking-cryptominers =
    .title = Cryptominers 阻止
protections-blocking-cookies-trackers =
    .title = 交叉-位置跟踪饼干阻止
protections-blocking-cookies-third-party =
    .title = 第三-宴会饼干阻止
protections-blocking-cookies-all =
    .title = 所有的饼干阻止
protections-blocking-cookies-unvisited =
    .title = Unvisited 位置饼干阻止
protections-blocking-tracking-content =
    .title = 跟踪内容阻止
protections-blocking-social-media-trackers =
    .title = 社会的媒质追踪者阻止
protections-not-blocking-fingerprinters =
    .title = 不组成块 Fingerprinters
protections-not-blocking-cryptominers =
    .title = 不组成块 Cryptominers
protections-not-blocking-cookies-third-party =
    .title = 不组成块第三-宴会饼干
protections-not-blocking-cookies-all =
    .title = 不组成块饼干
protections-not-blocking-cross-site-tracking-cookies =
    .title = 不组成块交叉-位置跟踪饼干
protections-not-blocking-tracking-content =
    .title = 不组成块跟踪内容
protections-not-blocking-social-media-trackers =
    .title = 不组成块社会的媒质追踪者

## Footer and Milestones sections in the Protections Panel
## Variables:
##   $trackerCount (Number): number of trackers blocked
##   $date (Date): the date on which we started counting

# This text indicates the total number of trackers blocked on all sites.
# In its tooltip, we show the date when we started counting this number.
protections-footer-blocked-tracker-counter =
    { $trackerCount ->
        [one] { $trackerCount } 阻止
       *[other] { $trackerCount } 阻止
    }
    .tooltiptext = 自...以后 { DATETIME($date, year: "numeric", month: "long", day: "numeric") }
# This text indicates the total number of trackers blocked on all sites.
# It should be the same as protections-footer-blocked-tracker-counter;
# this message is used to leave out the tooltip when the date is not available.
protections-footer-blocked-tracker-counter-no-tooltip =
    { $trackerCount ->
        [one] { $trackerCount } 阻止
       *[other] { $trackerCount } 阻止
    }

# In English this looks like "Firefox blocked over 10,000 trackers since October 2019"
protections-milestone =
    { $trackerCount ->
        [one] { -brand-short-name } 阻止 { $trackerCount } 追踪者自...以后 { DATETIME($date, year: "numeric", month: "long") }
       *[other] { -brand-short-name } 阻止结束 { $trackerCount } 追踪者自...以后 { DATETIME($date, year: "numeric", month: "long") }
    }
