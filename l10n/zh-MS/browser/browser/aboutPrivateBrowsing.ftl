# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

privatebrowsingpage-open-private-window-label = 启动一个私密窗口
    .accesskey = P
about-private-browsing-search-placeholder = 搜索网络
about-private-browsing-search-btn =
    .title = 搜索网络
# Variables
#  $engine (String): the name of the user's default search engine
about-private-browsing-handoff =
    .title = 使用 { $engine } 搜索或输入地址
about-private-browsing-handoff-no-engine =
    .title = 搜索或输入地址
# Variables
#  $engine (String): the name of the user's default search engine
about-private-browsing-handoff-text = 使用 { $engine } 搜索或输入地址
about-private-browsing-handoff-text-no-engine = 搜索或输入地址
about-private-browsing-not-private = 您当前并未处于私密窗口中。

about-private-browsing-hide-activity = 隐藏您的活动和位置，在您浏览的任何地方
about-private-browsing-get-privacy = 在您浏览的任何地方获得隐私保护
about-private-browsing-hide-activity-1 = 使用 { -mozilla-vpn-brand-name } 隐藏浏览活动和位置。单击即可创建安全连接，即使在公共 Wi-Fi 上也可实现。
about-private-browsing-prominent-cta = 使用 { -mozilla-vpn-brand-name } 保持私密

about-private-browsing-focus-promo-cta = 下载 { -focus-brand-name }
about-private-browsing-focus-promo-header = { -focus-brand-name }：随时随地私密浏览
about-private-browsing-focus-promo-text = 我们专用的私密浏览移动应用会在每次使用时清除您的历史和 Cookie。

## The following strings will be used for experiments in Fx99 and Fx100

about-private-browsing-focus-promo-header-c = 移动设备上的下一级别隐私
about-private-browsing-focus-promo-text-c = { -focus-brand-name } 会在每次使用时清除您的历史记录，同时阻止广告和跟踪器。

# This string is the title for the banner for search engine selection
# in a private window.
# Variables:
#   $engineName (String) - The engine name that will currently be used for the private window.
about-private-browsing-search-banner-title = { $engineName } 是您在私密窗口中的默认搜索引擎
about-private-browsing-search-banner-description = {
  PLATFORM() ->
     [windows] 要选择不同的搜索引擎，请转到<a data-l10n-name="link-options">选项</a>
    *[other] 要选择不同的搜索引擎，请转到<a data-l10n-name="link-options">偏好设置</a>
  }
about-private-browsing-search-banner-close-button =
    .aria-label = 关闭

about-private-browsing-promo-close-button =
  .title = 关闭

## Strings used in a “pin promotion” message, which prompts users to pin a private window

about-private-browsing-pin-promo-header = 单击即可获得私密浏览的自由
about-private-browsing-pin-promo-link-text = { PLATFORM() ->
    [macos] 保留在 Dock 中
   *[other] 固定到任务栏
}
about-private-browsing-pin-promo-title = 无保存的 Cookie 或历史记录，直接从您的桌面开始。像无人观看一样浏览。

## Strings used in a promotion message for cookie banner reduction

# Simplified version of the headline if the original text doesn't work
# in your language: `{ -brand-short-name } will show fewer cookie requests`
about-private-browsing-cookie-banners-promo-heading = { -brand-short-name } 为您处理 Cookie 横幅
about-private-browsing-cookie-banners-promo-body = 我们现已自动拒绝许多 Cookie 横幅，以便您受到更少的跟踪，并返回无干扰的浏览状态。

## Strings for the info section of about:privatebrowsing

about-private-browsing-felt-privacy-v1-info-header = 在此设备上不留痕迹
about-private-browsing-felt-privacy-v1-info-body = 当您关闭所有私密窗口时，{ -brand-short-name} 会删除您的 Cookie、历史记录和站点数据。
about-private-browsing-felt-privacy-v1-info-link = 谁可能能够看到我的活动？

## Strings for the Nova redesign of about:privatebrowsing

about-private-browsing-nova-info-body = 关闭所有私密窗口将删除您的 Cookie、历史记录和站点数据。
