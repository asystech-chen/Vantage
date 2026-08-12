# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

privatebrowsingpage-open-private-window-label = 打开一个私人的窗口
    .accesskey = P
about-private-browsing-search-placeholder = 搜索那网
about-private-browsing-search-btn =
    .title = 搜索那网
# Variables
#  $engine (String): the name of the user's default search engine
about-private-browsing-handoff =
    .title = 搜索与 { $engine } 或输入地址
about-private-browsing-handoff-no-engine =
    .title = 搜索或输入地址
# Variables
#  $engine (String): the name of the user's default search engine
about-private-browsing-handoff-text = 搜索与 { $engine } 或输入地址
about-private-browsing-handoff-text-no-engine = 搜索或输入地址
about-private-browsing-not-private = 你是当前不在一个私人的窗口.

about-private-browsing-hide-activity = 隐藏你的活动和位置, 各处你浏览
about-private-browsing-get-privacy = 获得隐私保护各处你浏览
about-private-browsing-hide-activity-1 = 隐藏浏览活动和位置与 { -mozilla-vpn-brand-name }. 一(个) 单击创建一个无虑的连接, 偶数在公众熟铁（Wrought Iron）-格式标识码.
about-private-browsing-prominent-cta = 停留私人的与 { -mozilla-vpn-brand-name }

about-private-browsing-focus-promo-cta = 下载 { -focus-brand-name }
about-private-browsing-focus-promo-header = { -focus-brand-name }: 私人的浏览在-那-去
about-private-browsing-focus-promo-text = 我们的专注的私人的浏览移动的应用清除你的历史记录和饼干每一时间.

## The following strings will be used for experiments in Fx99 and Fx100

about-private-browsing-focus-promo-header-c = 近邻干扰-level 隐私在活动物体
about-private-browsing-focus-promo-text-c = { -focus-brand-name } 清除你的历史记录每一时间一会儿组成块精确定义系统和追踪者.

# This string is the title for the banner for search engine selection
# in a private window.
# Variables:
#   $engineName (String) - The engine name that will currently be used for the private window.
about-private-browsing-search-banner-title = { $engineName } 是你的默认搜索引擎在私人的窗口
about-private-browsing-search-banner-description = {
  PLATFORM() ->
     [windows] 到选择一个不同的搜索引擎去到 <a data-l10n-name="link-options">选项</a>
    *[other] 到选择一个不同的搜索引擎去到 <a data-l10n-name="link-options">参数选择</a>
  }
about-private-browsing-search-banner-close-button =
    .aria-label = 关闭

about-private-browsing-promo-close-button =
  .title = 关闭

## Strings used in a “pin promotion” message, which prompts users to pin a private window

about-private-browsing-pin-promo-header = 私人的浏览自由在一(个) 单击
about-private-browsing-pin-promo-link-text = { PLATFORM() ->
    [macos] 保持在码头
   *[other] 大头针到任务栏
}
about-private-browsing-pin-promo-title = 无保存饼干或历史记录, 右从你的桌面. 浏览相似的无人们的观看.

## Strings used in a promotion message for cookie banner reduction

# Simplified version of the headline if the original text doesn't work
# in your language: `{ -brand-short-name } will show fewer cookie requests`
about-private-browsing-cookie-banners-promo-heading = { -brand-short-name } 采取小心的饼干旗帜为了你
about-private-browsing-cookie-banners-promo-body = 我们现在自动地拒绝多数饼干旗帜如此你能获得有履带的最低成本估算与调度法和去后面的到娱乐-free 浏览.

## Strings for the info section of about:privatebrowsing

about-private-browsing-felt-privacy-v1-info-header = 许可无牵引车辆（Tractor）在这装置
about-private-browsing-felt-privacy-v1-info-body = { -brand-short-name} 删除你的饼干, 历史记录, 和站点数据何时你关闭所有的你的私人的窗口.
about-private-browsing-felt-privacy-v1-info-link = 谁可能是能干的到看见我的活动?

## Strings for the Nova redesign of about:privatebrowsing

about-private-browsing-nova-info-body = 关闭所有的你的私人的窗口删除你的饼干, 历史记录和站点数据.
