# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Toolbar button tooltip reflects VPN state

ipprotection-button =
  .label = VPN
  .tooltiptext = VPN

ipprotection-button-error =
  .label = 启动VPN
  .tooltiptext = 启动VPN

##

# The word "Beta" is intended to be uppercase in the experiment label.
ipprotection-experiment-badge =
  .label = BETA

ipprotection-help-button =
  .tooltiptext = 启动VPN支持页面

ipprotection-title = VPN

## Feature introduction callout

# Original strings

ipprotection-feature-introduction-title = 向您介绍VPN，现在已直接集成于您的浏览器内部
ipprotection-feature-introduction-link-text-2 = 请使用我们的新<a data-l10n-name="learn-more-vpn">内置VPN</a>以隐藏您的位置并保护您的数据。

# Used for callout for users who expressed interest in privacy in onboarding
ipprotection-feature-introduction-title-privacy = 请添加另一层隐私保护
ipprotection-feature-introduction-link-text-privacy-1 = <a data-l10n-name="learn-more-vpn">{ -brand-product-name }的内置VPN</a>有助于保护您的浏览活动。请从多个位置中进行选择，以保持您浏览位置的更高私密性。

# Original strings for private browsing callout

ipprotection-feature-introduction-link-text-private-browsing-2 = 请使用我们的新<a data-l10n-name="learn-more-vpn">内置VPN</a>以隐藏您的位置并保护您的数据，即使在私密窗口中也不例外。
ipprotection-feature-introduction-description-private-browsing = 请通过隐藏您的位置获得额外保护进行浏览，即使在私密窗口中也不例外。

# Used for callout shown on login to public wi-fi through a captive portal
ipprotection-feature-introduction-title-captive-portal = 您是否处于公共Wi-Fi环境中？请尝试使用{ -brand-product-name }的内置VPN。
ipprotection-feature-introduction-description-captive-portal = 请通过隐藏您的位置获得额外保护进行浏览，即使在公共Wi-Fi上也不例外。

# Used for discovery callouts for both captive portal login and private browsing
ipprotection-feature-introduction-link-text-captive-portal-1 = 请通过从多个位置中进行选择以隐藏您浏览的位置，获取<a data-l10n-name="learn-more-vpn">额外隐私保护</a>。

## Buttons used for all feature introduction callouts

ipprotection-feature-introduction-button-primary = 下一步
ipprotection-feature-introduction-button-secondary-not-now = 暂时不要
ipprotection-feature-introduction-button-secondary-not-now-menuitem =
    .label = 暂时不要
ipprotection-feature-introduction-button-secondary-no-thanks = 不用了，谢谢
ipprotection-feature-introduction-button-secondary-no-thanks-menuitem =
    .label = 不用了，谢谢
ipprotection-feature-introduction-button-secondary-remove = 从工具栏中移除VPN
ipprotection-feature-introduction-button-secondary-remove-1 =
    .label = 从工具栏中移除VPN

## Site settings callout

ipprotection-site-settings-callout-title = 请选择您使用VPN的位置
ipprotection-site-settings-callout-subtitle = 请为特定站点关闭VPN，我们将在您下次访问时记住此设置。
ipprotection-site-settings-callout-button = 已了解

## Location selection callout

ipprotection-location-selection-callout-title = 新增功能：请切换您的位置
ipprotection-location-selection-callout-description-1 = <a data-l10n-name="learn-more-vpn">{ -brand-product-name }的内置VPN</a>允许您从多个浏览位置中进行选择，或让我们为您挑选最快的那个。
ipprotection-location-selection-callout-primary-button = 请尝试
ipprotection-location-selection-callout-secondary-button = 请关闭

## Panel

# Also used for the callout shown in private browsing
unauthenticated-vpn-title = 请尝试{ -brand-product-name }的内置VPN

unauthenticated-hide-location-message-3 = 请在{ -brand-product-name }中浏览时<a data-l10n-name="learn-more-vpn">隐藏您的位置</a>。
unauthenticated-private-location-message = 有助于在{ -brand-product-name }中<a data-l10n-name="learn-more-vpn">保持您的位置私密</a>。
unauthenticated-choose-location-message-1 = 请从多个位置中进行选择，或让{ -brand-product-name }为您挑选最快的那个。
unauthenticated-get-started = 请开始使用
unauthenticated-terms-of-service-privacy-notice = 通过继续操作，您同意<a data-l10n-name="vpn-terms-of-service">服务条款</a>和<a data-l10n-name="vpn-privacy-notice">隐私声明</a>。

site-exclusion-toggle-enabled-1 =
  .label = 对此站点使用VPN
  .aria-label = VPN对此站点已启用
site-exclusion-toggle-disabled-1 =
  .label = 对此站点使用VPN
  .aria-label = VPN对此站点已关闭
site-exclusion-toggle-description = 站点是否无法正常工作？请尝试关闭VPN。

ipprotection-settings-link =
  .label = 设置

## Status card

ipprotection-connection-status-connected-1 = VPN已开启
  .aria-label = VPN已开启
ipprotection-connection-status-disconnected-1 = VPN已关闭
  .aria-label = VPN已关闭
ipprotection-connection-status-excluded-1 = VPN对此站点已关闭
  .aria-label = VPN对此站点已关闭
ipprotection-connection-status-connecting-1 = VPN正在连接…
  .aria-label = VPN正在连接…

# Button to turn off the VPN
ipprotection-button-turn-vpn-off = 请关闭VPN
# Button to turn off the VPN when the VPN panel is open while viewing
ipprotection-button-turn-vpn-off-excluded-site = 请在所有位置关闭VPN
# a page from an excluded site.
ipprotection-button-turn-vpn-on = 请开启VPN
# Button to turn on the VPN
ipprotection-button-connecting = 正在开启…

# Button while VPN is connecting

## Location controls
# This shows the default selection, "Recommended" which is the recommended location as determined by Firefox.
ipprotection-recommended-location-button = 位置：推荐
ipprotection-recommended-location-description = { -brand-product-name } 正在为您查找最快的连接位置
ipprotection-recommended-location-badge = 新

# Variables
#   $country (string) - The country selected for the VPN server location
ipprotection-location-country-button = 位置：{ $country }

ipprotection-locations-subview =
    .title = 选择位置
ipprotection-locations-subview-description = 请选择不同的位置，以便从该位置进行浏览。

ipprotecion-locations-subview-recommended-label = 推荐
ipprotection-locations-subview-recommended-description = 正在查找最快的连接位置

# Label shown next to a VPN location that the user cannot select.
ipprotection-locations-unavailable-label = 不可用

ipprotection-locations-subview-promo =
  .heading = 通过 { -mozilla-vpn-brand-name } 将保护功能进一步扩展
  .message = 请从 300 多个位置中进行选择，并在多达 5 台设备上保护您的所有应用程序。
ipprotection-locations-subview-promo-button = 获取 { -mozilla-vpn-brand-name }

## VPN paused state

ipprotection-connection-status-paused-title-2 = VPN 已暂停
  .aria-label = VPN 已暂停
# Variables
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ipprotection-connection-status-paused-description-1 = 您已使用了全部 { $maxUsage } GB 的 VPN 数据。访问权限将于下个月重置。
upgrade-vpn-title = 获取浏览器之外额外保护
upgrade-vpn-description = 请选择您的 VPN 位置，在所有应用程序及多达 5 台设备上使用 VPN，并在任何网络上保持安全——无论是家中还是公共 Wi-Fi。
upgrade-vpn-button = 试用 { -mozilla-vpn-brand-name }

## Messages and errors

ipprotection-connection-status-generic-error-title-1 = 无法连接到 VPN
  .aria-label = 无法连接到 VPN
ipprotection-connection-status-generic-error-description = 请于几分钟后再次尝试。
ipprotection-connection-status-generic-error-try-again = 请稍后再次尝试。

ipprotection-connection-status-network-error-title-1 = 请检查您的互联网连接
  .aria-label = 请检查您的互联网连接
ipprotection-connection-status-network-error-description = 请先连接到互联网，然后尝试启动 VPN。

ipprotection-connection-status-blocked-error-title-1 = VPN 不可用
  .aria-label = VPN 不可用
ipprotection-connection-status-blocked-error-description = 当地法律禁止我们在该地区提供 VPN 服务。<a data-l10n-name="learn-more-link">了解更多</a>

# Variables
#   $usageLeft (string) - The amount of data a user has left in a month (in GB)
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ipprotection-message-bandwidth-warning =
  .heading = 已接近您的 VPN 数据使用上限
  .message = 本月您剩余 { $usageLeft } GB，上限为 { $maxUsage } GB。

# Variables
#   $usageLeft (number) - The amount of data a user has left in a month (in MB)
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ipprotection-message-bandwidth-warning-mb =
  .heading = 已接近您的 VPN 数据使用上限
  .message = 本月您剩余 { $usageLeft } MB，上限为 { $maxUsage } GB。

ipprotection-message-continuous-onboarding-intro = 请启动 VPN 以隐藏您的位置，并为您的浏览添加额外的加密。
ipprotection-message-continuous-onboarding-autostart = <a data-l10n-name="setting-link">将 VPN 设置为自动启动</a>，每当您打开 { -brand-short-name } 时即可获得额外一层的保护。
ipprotection-message-continuous-onboarding-site-settings = { -brand-short-name } 将记住您已设置使用 VPN 的网站。您可以随时在<a data-l10n-name="setting-link">设置</a>中更新这些内容。

confirmation-hint-ipprotection-navigated-to-excluded-site = 针对此站点，VPN 已关闭

## IP Protection bandwidth callouts

ipprotection-bandwidth-upgrade-title = 喜欢内置 VPN？请通过 { -mozilla-vpn-brand-name } 在 { -brand-product-name } 之外获取更多保护。
ipprotection-bandwidth-upgrade-text = 请选择一个 VPN 位置，并在多达 5 台设备上为您的所有应用程序添加保护，无论您在家中还是公共 Wi-Fi 上。

## IP Protection bandwidth warning infobar

# Variables
#   $usageLeft (string) - The amount of data a user has left in a month (in GB)
ip-protection-bandwidth-warning-infobar-message-75 = <strong>已接近您的 VPN 数据使用上限。</strong> 您剩余 { $usageLeft } GB。您的数据将于下个月月初重置。

# Variables
#   $usageLeft (string) - The amount of data a user has left in a month (in GB)
ip-protection-bandwidth-warning-infobar-message-90 = <strong>您的 VPN 数据即将用尽。</strong> 您剩余 { $usageLeft } GB。一旦使用完毕，您的 VPN 将暂停，直到您的数据于下个月一日重置。

# Variables
#   $usageLeft (number) - The amount of data a user has left in a month (in MB)
ip-protection-bandwidth-warning-infobar-message-90-mb = <strong>您的 VPN 数据即将用尽。</strong> 您剩余 { $usageLeft } MB。一旦使用完毕，您的 VPN 将暂停，直到您的数据于下个月一日重置。

## IP Protection Settings

ip-protection-description =
  .label = VPN
  .description = 内置 VPN，用于在 { -brand-short-name } 上浏览时增强您的隐私。
ip-protection-description-1 =
  .label = 内置 VPN
  .description = 通过隐藏您的位置在浏览时获取额外隐私。
ip-protection-learn-more = 了解更多

# Variables
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ip-protection-not-opted-in-4 =
  .heading = 试用 { -brand-short-name } 的内置 VPN
  .message = 通过隐藏您的位置使用额外保护进行浏览。
ip-protection-not-opted-in-button = 开始使用

# Variables:
#   $count (number) - The number of sites saved as VPN exclusions.
ip-protection-site-exceptions-all-sites-button =
  .label = 管理网站设置
  .description =
    { $count ->
        [one] { $count } 个网站
       *[other] { $count } 个网站
    }

ip-protection-autostart =
  .label = 自动启动 VPN
ip-protection-autostart-checkbox =
  .label = 当我打开 { -brand-short-name } 时
ip-protection-autostart-private-checkbox =
  .label = 在隐私窗口中

ip-protection-vpn-upgrade-link =
  .label = 在 { -brand-short-name } 之外获取更多保护，借助 { -mozilla-vpn-brand-name }
  .description = 您可选择自定义 VPN 位置，并将保护扩展到您最多五台设备上的所有应用程序，无论您身处家中或公共 Wi-Fi 环境。
ip-protection-vpn-upgrade-link-1 =
  .label = 将保护进一步扩展，借助 { -mozilla-vpn-brand-name }
  .description = 您可从 300 多个位置中选择，并在最多 5 台设备上保护您所有的应用程序。

## IP Protection dialogs

ip-protection-exceptions-dialog-window =
  .title = 管理网站设置
ip-protection-exclusions-desc = 对所有网站使用 VPN，但此列表中的网站除外。您可以在此处或通过启动 VPN 来添加网站。

## IP Protection Bandwidth

ip-protection-bandwidth-header-1 = 每月数据限制

# Variables
#   $usageLeft (string) - The amount of data a user has left in a month (in GB)
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ip-protection-bandwidth-left-this-month-gb = 本月剩余 { $usageLeft } GB（共 { $maxUsage } GB）

# Variables
#   $usageLeft (string) - The amount of data a user has left in a month (in GB)
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ip-protection-bandwidth-left-gb = 剩余 { $usageLeft } GB（共 { $maxUsage } GB）

# Variables
#   $usageLeft (number) - The amount of data a user has left in a month (in MB)
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ip-protection-bandwidth-left-this-month-mb = 本月剩余 { $usageLeft } MB（共 { $maxUsage } GB）

# Variables
#   $usageLeft (number) - The amount of data a user has left in a month (in MB)
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ip-protection-bandwidth-left-mb = 剩余 { $usageLeft } MB（共 { $maxUsage } GB）

# Variables
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ip-protection-bandwidth-hit-for-the-month = 您已使用完 { $maxUsage } GB 的 VPN 数据。访问权限将于下月重置。

# Variables
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ip-protection-bandwidth-help-text = 将于每月第一天重置为 { $maxUsage } GB。

## IP Protection bandwidth reset callout

# Variables
#  $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
ipprotection-bandwidth-reset-title = { $maxUsage } GB 的 VPN 数据已刷新，随时可用
ipprotection-bandwidth-reset-text = 请启动 VPN，以获取额外的隐私增强，每月免费提供。
ipprotection-bandwidth-reset-button = 已了解

## IP Protection add-on breakage warnings

ipp-activator-breakage-sign-in-warning = <strong>此网站可能无法与 VPN 配合工作。</strong> 请尝试登录，或在使用此网站时关闭 VPN。
ipp-activator-breakage-turn-off-warning = <strong>此网站可能无法与 VPN 配合工作。</strong> 请尝试在使用此网站时关闭 VPN。

## IP Protection alerts

vpn-paused-alert-title = VPN 已暂停

# Variables
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
vpn-paused-alert-body = 您已使用完 { $maxUsage } GB 的 VPN 数据。VPN 访问权限将于下月重置。

# Variables
#   $maxUsage (number) - The maximum amount of data a user can use in a month (in GB)
vpn-error-page-paused-description = 您已使用完 { $maxUsage } GB 的 VPN 数据。访问权限将于下月重置。
vpn-error-page-continue-description = 请选择如何在无 VPN 的情况下继续
vpn-error-page-keep-browsing = 在此会话中继续浏览
vpn-error-page-new-session = 启动新会话

vpn-paused-alert-close-tabs-button = 关闭所有标签页
vpn-paused-alert-continue-wo-vpn-button = 在无 VPN 的情况下继续

vpn-error-alert-title = VPN 当前无法正常工作。
vpn-error-alert-body = 请稍后重试。