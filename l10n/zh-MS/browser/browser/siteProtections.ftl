# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

content-blocking-trackers-view-empty = 未在此站点上检测到任何跟踪器

content-blocking-cookies-blocking-trackers-label = 跨站点跟踪 Cookie
content-blocking-cookies-blocking-third-party-label = 第三方 Cookie
content-blocking-cookies-blocking-unvisited-label = 未访问站点 Cookie
content-blocking-cookies-blocking-all-label = 所有 Cookie

content-blocking-cookies-view-first-party-label = 来自此站点
content-blocking-cookies-view-trackers-label = 跨站点跟踪 Cookie
content-blocking-cookies-view-third-party-label = 第三方 Cookie

# This label is shown next to a cookie origin in the cookies subview.
# It forms the end of the (imaginary) sentence "www.example.com [was] Allowed"
content-blocking-cookies-view-allowed-label =
    .value = 已允许
# This label is shown next to a cookie origin in the cookies subview.
# It forms the end of the (imaginary) sentence "www.example.com [was] Blocked"
content-blocking-cookies-view-blocked-label =
    .value = 已阻止

# Variables:
#   $domain (String): the domain of the site.
content-blocking-cookies-view-remove-button =
    .tooltiptext = 清除针对 { $domain } 的 Cookie 例外

tracking-protection-icon-active = 正在阻止社交媒体跟踪器、跨站点跟踪 Cookie 和指纹识别器。
tracking-protection-icon-active-container =
    .aria-label = { tracking-protection-icon-active }
tracking-protection-icon-disabled = 此站点的增强型跟踪保护已关闭。
tracking-protection-icon-disabled-container =
    .aria-label = { tracking-protection-icon-disabled }
tracking-protection-icon-no-trackers-detected = 未在此页面上检测到 { -brand-short-name } 已知的任何跟踪器。
tracking-protection-icon-no-trackers-detected-container =
    .aria-label = { tracking-protection-icon-no-trackers-detected }

## Variables:
##   $host (String): the site's hostname

# Header of the Protections Panel.
protections-header = 针对 { $host } 的保护措施

## Blocking and Not Blocking sub-views in the Protections Panel

protections-blocking-fingerprinters =
    .title = 指纹识别器已被阻止
protections-blocking-cryptominers =
    .title = 加密货币矿工已被阻止
protections-blocking-cookies-trackers =
    .title = 跨站点跟踪 Cookie 已被阻止
protections-blocking-cookies-third-party =
    .title = 第三方 Cookie 已被阻止
protections-blocking-cookies-all =
    .title = 所有 Cookie 已被阻止
protections-blocking-cookies-unvisited =
    .title = 未访问站点 Cookie 已被阻止
protections-blocking-tracking-content =
    .title = 跟踪内容已被阻止
protections-blocking-social-media-trackers =
    .title = 社交媒体跟踪器已被阻止
protections-not-blocking-fingerprinters =
    .title = 未阻止指纹识别器
protections-not-blocking-cryptominers =
    .title = 未阻止加密货币矿工
protections-not-blocking-cookies-third-party =
    .title = 未阻止第三方 Cookie
protections-not-blocking-cookies-all =
    .title = 未阻止 Cookie
protections-not-blocking-cross-site-tracking-cookies =
    .title = 未阻止跨站点跟踪 Cookie
protections-not-blocking-tracking-content =
    .title = 未阻止跟踪内容
protections-not-blocking-social-media-trackers =
    .title = 未阻止社交媒体跟踪器

## Footer and Milestones sections in the Protections Panel
## Variables:
##   $trackerCount (Number): number of trackers blocked
##   $date (Date): the date on which we started counting

# This text indicates the total number of trackers blocked on all sites.
# In its tooltip, we show the date when we started counting this number.
protections-footer-blocked-tracker-counter =
    { $trackerCount ->
        [one] { $trackerCount } 个已阻止
       *[other] { $trackerCount } 个已阻止
    }
    .tooltiptext = 自 { DATETIME($date, year: "numeric", month: "long", day: "numeric") } 起
# This text indicates the total number of trackers blocked on all sites.
# It should be the same as protections-footer-blocked-tracker-counter;
# this message is used to leave out the tooltip when the date is not available.
protections-footer-blocked-tracker-counter-no-tooltip =
    { $trackerCount ->
        [one] { $trackerCount } 个已阻止
       *[other] { $trackerCount } 个已阻止
    }

# In English this looks like "Firefox blocked over 10,000 trackers since October 2019"
protections-milestone =
    { $trackerCount ->
        [one] { -brand-short-name } 自 { DATETIME($date, year: "numeric", month: "long") } 起阻止了 { $trackerCount } 个跟踪器
       *[other] { -brand-short-name } 自 { DATETIME($date, year: "numeric", month: "long") } 起阻止了超过 { $trackerCount } 个跟踪器
    }