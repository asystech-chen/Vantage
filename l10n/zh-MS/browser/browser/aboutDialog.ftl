# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

aboutDialog-title =
    .title = 关于 { -brand-full-name }

releaseNotes-link = 新增内容

update-checkForUpdatesButton =
    .label = 检查更新
    .accesskey = C

update-updateButton =
    .label = 重新启动以更新 { -brand-shorter-name }
    .accesskey = R

update-checkingForUpdates = 正在检查更新…
settings-update-checking-for-updates =
    .label = 正在检查更新…

## Variables:
##   $transfer (string) - Transfer progress.

settings-update-downloading-2 =
    .label = 正在下载更新 — { $transfer }
aboutdialog-update-downloading = 正在下载更新 — <label data-l10n-name="download-status">{ $transfer }</label>

##

update-applying = 正在应用更新…
settings-update-applying =
    .label = 正在应用更新…

update-failed = 更新失败。<label data-l10n-name="failed-link">下载最新版本</label>
update-failed-main =
    更新失败。<a data-l10n-name="failed-link-main">下载最新版本</a>

update-policy-disabled = 更新已由您的组织禁用
settings-update-policy-disabled =
    .label = 更新已由您的组织禁用
update-noUpdatesFound = { -brand-short-name } 已是最新版本
settings-update-no-updates-found =
    .label = { -brand-short-name } 已是最新版本
aboutdialog-update-checking-failed = 检查更新失败。
settings-update-checking-failed =
    .label = 检查更新失败。
update-otherInstanceHandlingUpdates = { -brand-short-name } 正在由另一实例进行更新
settings-update-other-instance-handling-updates =
    .label = { -brand-short-name } 正在由另一实例进行更新

## Variables:
##   $displayUrl (String): URL to page with download instructions. Example: www.mozilla.org/firefox/nightly/

aboutdialog-update-manual-with-link = 更新可在 <label data-l10n-name="manual-link">{ $displayUrl }</label> 获取
settings-update-manual-with-link = 更新可在 <a data-l10n-name="manual-link">{ $displayUrl }</a> 获取

update-unsupported = 您无法在此系统上执行进一步更新。<label data-l10n-name="unsupported-link">了解更多</label>
settings-update-unsupported = 您无法在此系统上执行进一步更新。<a data-l10n-name="unsupported-link">了解更多</a>

update-restarting = 正在重新启动…
settings-update-restarting =
    .label = 正在重新启动…

update-internal-error2 = 由于内部错误，无法检查更新。更新可在 <label data-l10n-name="manual-link">{ $displayUrl }</label> 获取
settings-update-internal-error = 由于内部错误，无法检查更新。更新可在 <a data-l10n-name="manual-link">{ $displayUrl }</a> 获取

##

# Variables:
#   $channel (String): description of the update channel (e.g. "release", "beta", "nightly" etc.)
aboutdialog-channel-description = 您当前处于 <label data-l10n-name="current-channel">{ $channel }</label> 更新通道。

warningDesc-version = { -brand-short-name } 属实验性产品，可能不稳定。

aboutdialog-help-user = { -brand-product-name } 帮助
aboutdialog-submit-feedback = 提交反馈

community-exp = <label data-l10n-name="community-exp-mozillaLink">{ -vendor-short-name }</label> 是一个 <label data-l10n-name="community-exp-creditsLink">全球社区</label>，共同努力保持 Web 的开放、公开和可访问性。

community-2 = { -brand-short-name } 由 <label data-l10n-name="community-mozillaLink">{ -vendor-short-name }</label> 设计，这是一个 <label data-l10n-name="community-creditsLink">全球社区</label>，共同努力保持 Web 的开放、公开和可访问性。

helpus = 想要提供帮助？<label data-l10n-name="helpus-donateLink">进行捐赠</label> 或 <label data-l10n-name="helpus-getInvolvedLink">参与其中！</label>

bottomLinks-license = 许可信息
bottom-links-terms = 使用条款
bottom-links-privacy = 隐私声明

# Example of resulting string: 66.0.1 (64-bit)
# Variables:
#   $version (String): version of Firefox, e.g. 66.0.1
#   $bits (Number): bits of the architecture (32 or 64)
aboutDialog-version = { $version } ({ $bits }-位)

# Example of resulting string: 66.0a1 (2019-01-16) (64-bit)
# Variables:
#   $version (String): version of Firefox for Nightly builds, e.g. 66.0a1
#   $isodate (String): date in ISO format, e.g. 2019-01-16
#   $bits (Number): bits of the architecture (32 or 64)
aboutDialog-version-nightly = { $version } ({ $isodate }) ({ $bits }-位)

# Example of resulting string: 131.0a1 (aarch64)
# Variables:
#   $version (String): version of Firefox, e.g. 66.0.1
#   $arch (String): name of the architecture (arm, aarch64, etc.)
aboutdialog-version-arch = { $version } ({ $arch })

# Example of resulting string: 131.0a1 (2024-08-27) (aarch64)
# Variables:
#   $version (String): version of Firefox for Nightly builds, e.g. 66.0a1
#   $isodate (String): date in ISO format, e.g. 2019-01-16
#   $arch (String): name of the architecture (arm, aarch64, etc.)
aboutdialog-version-arch-nightly = { $version } ({ $isodate }) ({ $arch })


about-librewolf = Vantage Browser 由 ASYS Technology 开发，基于 Mozilla Firefox 和 LibreWolf 开源项目构建。在保留 Firefox 全部功能的同时，强化了隐私保护（禁用数据报告和遥测），追求隐私、速度与易用性的平衡。
official-site1 = 官方网站
changelog-link = 新增内容
github-link = GitHub
