# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These messages are used as headings in the recommendation doorhanger

cfr-doorhanger-extension-heading = 推荐扩展
cfr-doorhanger-feature-heading = 推荐功能

##

cfr-doorhanger-extension-sumo-link =
  .tooltiptext = 为何会显示此内容

cfr-doorhanger-extension-cancel-button = 暂不操作
  .accesskey = N

cfr-doorhanger-extension-ok-button = 立即添加
  .accesskey = A

cfr-doorhanger-extension-manage-settings-button = 管理推荐设置
  .accesskey = M

cfr-doorhanger-extension-never-show-recommendation = 不再向您显示此推荐
  .accesskey = S

cfr-doorhanger-extension-learn-more-link = 了解更多信息

# This string is used on a new line below the add-on name
# Variables:
#   $name (String) - Add-on author name
cfr-doorhanger-extension-author = 作者：{ $name }

# This is a notification displayed in the address bar.
# When clicked it opens a panel with a message for the user.
cfr-doorhanger-extension-notification = 推荐
# .a11y-announcement is extracted in JS and announced via A11y.announce.
cfr-doorhanger-extension-notification2 = 推荐
  .tooltiptext = 扩展推荐
  .a11y-announcement = 扩展推荐可用

# This is a notification displayed in the address bar.
# When clicked it opens a panel with a message for the user.
# .a11y-announcement is extracted in JS and announced via A11y.announce.
cfr-doorhanger-feature-notification = 推荐
  .tooltiptext = 功能推荐
  .a11y-announcement = 功能推荐可用

## Add-on statistics
## These strings are used to display the total number of
## users and rating for an add-on. They are shown next to each other.

# Variables:
#   $total (Number) - The rating of the add-on from 1 to 5
cfr-doorhanger-extension-rating =
  .tooltiptext =
    { $total ->
        [one] { $total } 星
       *[other] { $total } 星
    }
# Variables:
#   $total (Number) - The total number of users using the add-on
cfr-doorhanger-extension-total-users =
  { $total ->
      [one] { $total } 位用户
     *[other] { $total } 位用户
  }

## Mozilla Account messages

cfr-doorhanger-bookmark-fxa-header = 在您的所有设备上同步您的书签。
cfr-doorhanger-bookmark-fxa-body-2 = 操作已成功完成！请勿让您的移动设备上缺失此书签。请使用一个账户开始操作。
cfr-doorhanger-bookmark-fxa-link-text = 正在同步书签...
cfr-doorhanger-bookmark-fxa-close-btn-tooltip =
  .aria-label = 关闭按钮
  .title = 关闭

fxa-adoption-addresses-backup-title = 让我们备份您已保存的地址
fxa-adoption-addresses-backup-subtitle = 通过加密同步到您的设备，以保护您已保存的地址。
fxa-adoption-credit-cards-backup-title = 让我们备份您的支付方式
fxa-adoption-credit-cards-backup-subtitle = 通过加密同步到您的设备，以保护您的支付方式。
fxa-adoption-bookmarks-treatment-backup-title = 让我们备份您的书签
fxa-adoption-bookmarks-treatment-backup-subtitle = 通过加密同步到您的设备，以保护您的书签。

fxa-adoption-primary-button-label = 注册

## What's New toolbar button and panel

# This string is used by screen readers to offer a text based alternative for
# the notification icon
cfr-badge-reader-label-newfeature = 新功能：

cfr-whatsnew-button =
  .label = 新增内容
  .tooltiptext = 新增内容

cfr-whatsnew-release-notes-link-text = 阅读发行说明

## Enhanced Tracking Protection Milestones

# Variables:
#   $blockedCount (Number) - The total count of blocked trackers. This number will always be greater than 1.
#   $date (Datetime) - The date we began recording the count of blocked trackers
cfr-doorhanger-milestone-heading2 =
  { $blockedCount ->
    *[other] { -brand-short-name } 自 { DATETIME($date, month: "long", year: "numeric") } 起已阻止超过 <b>{ $blockedCount }</b> 个跟踪器！
  }
cfr-doorhanger-milestone-ok-button = 查看全部
  .accesskey = S
cfr-doorhanger-milestone-close-button = 关闭
  .accesskey = C

## DOH Message

cfr-doorhanger-doh-body = 您的隐私至关重要。{ -brand-short-name } 现在会尽可能安全地将您的 DNS 请求路由到合作伙伴服务，以在您浏览时保护您的安全。
cfr-doorhanger-doh-header = 更安全、加密的 DNS 查询
cfr-doorhanger-doh-primary-button-2 = 确定
  .accesskey = O
cfr-doorhanger-doh-secondary-button = 禁用
  .accesskey = D
## Full Video Support CFR message

cfr-doorhanger-video-support-body = 此网站上的视频可能无法在此版本的{ -brand-short-name }上正常播放。为获得完整的视频支持，请立即更新{ -brand-short-name }。
cfr-doorhanger-video-support-header = 更新{ -brand-short-name }以播放视频
cfr-doorhanger-video-support-primary-button = 立即更新
  .accesskey = U

## VPN promotion dialog for public Wi-Fi users
##
## If a user is detected to be on a public Wi-Fi network, they are given a
## bit of info about how to improve their privacy and then offered a button
## to the Mozilla VPN page and a link to dismiss the dialog.

# This header text can be explicitly wrapped.
spotlight-public-wifi-vpn-header = 您似乎正在使用公共 Wi-Fi
spotlight-public-wifi-vpn-body = 为隐藏您的位置和浏览活动，建议您考虑使用虚拟专用网络。这将有助于您在机场和咖啡店等公共场所浏览时保持受保护的状态。
spotlight-public-wifi-vpn-primary-button = 使用{ -mozilla-vpn-brand-name }保持私密
  .accesskey = S
spotlight-public-wifi-vpn-link = 暂不执行
  .accesskey = N

## Emotive Continuous Onboarding

spotlight-better-internet-header = 更美好的互联网始于您
spotlight-better-internet-body = 当您使用{ -brand-short-name }时，您即为一个对每个人都更好的开放且可访问的互联网投票。
spotlight-peace-mind-header = 我们已为您提供全面保护
spotlight-peace-mind-body = 每个月，{ -brand-short-name }平均为每位用户阻止超过3,000个跟踪器。因为没有任何事物——尤其是像跟踪器这样的隐私干扰——应阻隔在您与良好互联网之间。
spotlight-pin-primary-button = { PLATFORM() ->
    [macos] 保留在程序坞中
   *[other] 固定到任务栏
}
spotlight-pin-secondary-button = 暂不执行

## MR2022 Background Update Windows native toast notification strings.
##
## These strings will be displayed by the Windows operating system in
## a native toast, like:
##
## <b>multi-line title</b>
## multi-line text
## <img>
## [ primary button ] [ secondary button ]
##
## The button labels are fitted into narrow fixed-width buttons by
## Windows and therefore must be as narrow as possible.

mr2022-background-update-toast-title = 全新的{ -brand-short-name }。更加私密。更少跟踪器。毫无妥协。
mr2022-background-update-toast-text = 立即尝试最新的{ -brand-short-name }，其已升级至我们迄今最强的反跟踪保护。

# This button label will be fitted into a narrow fixed-width button by
# Windows. Try to not exceed the width of the English text (compare it
# using a variable font like Arial): the button can only fit 1-2
# additional characters, exceeding characters will be truncated.
mr2022-background-update-toast-primary-button-label = 立即启动{ -brand-shorter-name }

# This button label will be fitted into a narrow fixed-width button by
# Windows. Try to not exceed the width of the English text (compare it using a
# variable font like Arial): the button can only fit 1-2 additional characters,
# exceeding characters will be truncated.
mr2022-background-update-toast-secondary-button-label = 稍后提醒

## Cookie Banner Handling CFR

cookie-banner-blocker-onboarding-header = { -brand-short-name }刚刚为您拒绝了一个 Cookie 横幅
cookie-banner-blocker-onboarding-body = 更少的干扰，更少的 Cookie 在此网站上跟踪您。
cookie-banner-blocker-onboarding-learn-more = 了解更多

## These strings are used in the Fox doodle Pin/set default spotlights

july-jam-headline = 我们已为您提供全面保护
july-jam-body = 每个月，{ -brand-short-name }平均为每位用户阻止超过3,000个跟踪器，为您提供安全、快速的途径访问良好互联网。
july-jam-set-default-primary = 使用{ -brand-short-name }打开我的链接
fox-doodle-pin-headline = 欢迎您回来

# “indie” is short for the term “independent”.
# In this instance, free from outside influence or control.
fox-doodle-pin-body = 这里是一个快速提醒，您可以将您喜爱的独立浏览器始终保持在一键访问的距离内。
fox-doodle-pin-primary = 使用{ -brand-short-name }打开我的链接
fox-doodle-pin-secondary = 暂不执行

## These strings are used in the Set Firefox as Default PDF Handler for Existing Users experiment

set-default-pdf-handler-headline = <strong>您的 PDF 现已在{ -brand-short-name }中打开。</strong>您可以直接在浏览器中编辑或签署表单。如需更改，请在设置中搜索“PDF”。
set-default-pdf-handler-primary = 已获悉

## PDF Annotations strings

# “Sign on the dotted line” is an idiomatic English expression about
# where to place your signature.
# If this expression doesn’t have a direct translation, please
# translate this alternative string: "Add your signature anywhere!"
annotations-default-pdf-handler-headline = 在虚线上签名——或任意位置！

# “Go-to” is an idiomatic English expression referring to something that is used often.
annotations-default-pdf-handler-body = 绘制、键入或上传您的签名，然后将其精确放置在您希望的位置。保存您常用的签名以备下次使用。
annotations-make-default-pdf-handler-title = 将{ -brand-short-name }设置为您的默认 PDF 编辑器？
annotations-make-default-pdf-handler-subtitle = 您每次打开 PDF 时都可以使用我们的工具。
annotations-make-default-pdf-primary-cta-label = 设为默认
annotations-make-default-pdf-next-label = 下一步

## FxA sync CFR

fxa-sync-cfr-header = 您未来是否会有新设备？
fxa-sync-cfr-body = 请确保您最新的书签、密码和标签页在您每次打开新的{ -brand-product-name }浏览器时都能随您同行。
fxa-sync-cfr-primary = 了解更多
  .accesskey = L
fxa-sync-cfr-secondary = 稍后提醒
  .accesskey = R

## Device Migration FxA Spotlight

device-migration-fxa-spotlight-heavy-user-header = 请勿忘记备份您的数据
device-migration-fxa-spotlight-heavy-user-body = 请确保重要信息——如书签和密码——在您的所有设备上均已更新并保持受保护状态。
device-migration-fxa-spotlight-heavy-user-primary-button = 开始执行

device-migration-fxa-spotlight-older-device-header = 来自{ -brand-product-name }的安心保障
device-migration-fxa-spotlight-older-device-body = 一个账户可确保您的重要信息在您连接的任何设备上保持更新并受到保护。
device-migration-fxa-spotlight-older-device-primary-button = 创建账户
device-migration-fxa-spotlight-getting-new-device-header-2 = 您是否计划在不久的将来获取新设备？
device-migration-fxa-spotlight-getting-new-device-body-2 = 请遵循几个简单的步骤，以便在您开始使用新设备时，将您的书签、历史记录和密码一并携带。
device-migration-fxa-spotlight-getting-new-device-primary-button = 如何备份我的数据

device-migration-fxa-spotlight-sync-header = 浏览时不留一丝停顿
device-migration-fxa-spotlight-sync-body = 以加密方式同步您的所有重要信息（例如书签和密码）。您可以在任何使用 { -brand-product-name } 的位置调取全部内容。
device-migration-fxa-spotlight-sync-primary-button = 立即开始

## Set as Default PDF Reader Infobar

# The question portion of the following message should have the <strong> and </strong> tags surrounding it.
pdf-default-notification-message = <strong>是否将 { -brand-short-name } 设置为您的默认 PDF 阅读器？</strong>使用 { -brand-short-name } 阅读和编辑存储在您计算机上的 PDF 文件。
pdf-default-notification-set-default-button =
    .label = 设置为默认
pdf-default-notification-decline-button =
    .label = 暂不设置

## Launch on login infobar notification

launch-on-login-infobar-message = <strong>是否在您每次重新启动计算机时打开 { -brand-short-name }？</strong>现在您可以设置 { -brand-short-name }，使其在您重启设备时自动打开。
launch-on-login-learnmore = 了解更多
launch-on-login-infobar-confirm-button = 是的，打开 { -brand-short-name }
  .accesskey = Y
launch-on-login-infobar-reject-button = 暂不打开
  .accesskey = N

## These string variants are used when the “launch on login” infobar
## notification is displayed for a second time.

launch-on-login-infobar-final-message = <strong>是否在您每次重新启动计算机时打开 { -brand-short-name }？</strong>若要管理您的启动首选项，请在设置中搜索“启动”。
launch-on-login-infobar-final-reject-button = 无需操作，谢谢
  .accesskey = N

## Launch on login spotlight
##
## Shown as a spotlight message when the user closes the browser, offering to set
## { -brand-short-name } to launch when the computer starts up.

launch-on-login-spotlight-title = 是否在您的计算机下次启动时打开 { -brand-short-name }？
launch-on-login-spotlight-startup-checkbox = 在启动时启动 { -brand-short-name }
launch-on-login-spotlight-pin-taskbar-checkbox = 固定到任务栏
# This checkbox label intentionally matches “startup-restore-windows-and-tabs”
# in the Settings (preferences.ftl). Localizers can reuse the existing
# translation suggested by translation memory.
launch-on-login-spotlight-restore-checkbox = 打开之前的窗口和选项卡
launch-on-login-spotlight-primary-button = 保存并关闭 { -brand-short-name }

## Tail Fox Set Default Spotlight

# This title is displayed together with the picture of a running fox with a long tail.
# In English, this is a figure of speech meaning 'stop something from following you'.
# If the localization of this message is challenging, consider using a simplified
# alternative as a reference for translation: 'Keep unwanted trackers away'.
tail-fox-spotlight-title = 让烦人的跟踪器远离您的尾巴
tail-fox-spotlight-subtitle = 与恼人的广告跟踪器告别，并安居于更安全、更迅捷的互联网体验之中。
tail-fox-spotlight-primary-button = 使用 { -brand-short-name } 打开我的链接
tail-fox-spotlight-secondary-button = 暂不执行

## Welcome Back Spotlight and Import

welcome-back-spotlight-title = 跃回内置隐私保护之中
welcome-back-spotlight-subtitle = 欢迎您回到由非营利组织支持的唯一主要浏览器。我们会采取额外措施，以在您漫游于各处时保护您的数据。
welcome-back-embedded-import-title = 导入您的数据，并让 { -brand-short-name } 带给您宾至如归的感觉

## Root Certificate Succession Infobar

root-certificate-succession-infobar-january-message = <strong>旧版本的 { -brand-short-name } 可能会在 2025 年 1 月 14 日开始出现问题。</strong>
root-certificate-succession-infobar-march-message = <strong>请更新，以便在 2025 年 3 月 14 日之后继续使用 { -brand-short-name }。</strong>
root-certificate-succession-infobar-link = 为何我需要更新？
root-certificate-succession-infobar-primary-button =
  .label = 立即更新
  .accesskey = U
root-certificate-succession-infobar-secondary-button =
  .label = 稍后更新
  .accesskey = L

## Root Certificate Succession Windows Background Notification

root-certificate-windows-background-notification-title = 您错过了一次重要的 { -brand-short-name } 更新
root-certificate-windows-background-notification-subtitle = 如果您不更新，浏览器的部分功能将很快停止工作。现在是获取我们最新保护和功能的最佳时机。
root-certificate-windows-background-notification-learn-more-button = 了解更多
root-certificate-windows-background-notification-update-button = 更新 { -brand-short-name }

## FxA Menu Message variants

fxa-menu-message-close-button =
    .title = 关闭
    .aria-label = 关闭

fxa-menu-message-sign-up-button = 注册
fxa-menu-message-sign-in-button = 登录
fxa-menu-message-sync-button = 开始同步

fxa-menu-message-sync-devices-primary-text = 同步您的所有设备
fxa-menu-message-sync-devices-secondary-text = 在您使用 { -brand-short-name } 的任何位置，即时获取您的信息（例如书签和密码）。
fxa-menu-message-sync-devices-secondary-text2 = 在您登录 { -brand-short-name } 的任何位置，即时获取您的书签、密码及更多内容。
fxa-menu-message-sync-devices-collapsed-text = 同步您的所有设备

fxa-menu-message-backup-data-primary-text = 备份您的浏览器数据
fxa-menu-message-backup-data-secondary-text = 自动保护您所有设备上的书签、密码及其他信息。
fxa-menu-message-backup-data-collapsed-text = 备份浏览器数据

fxa-menu-message-backup-sync-primary-text = 确保您的数据安全且同步
fxa-menu-message-backup-sync-secondary-text = 同步会备份您的大部分数据，以便您在每次使用 { -brand-short-name } 时均可访问这些数据。
fxa-menu-message-backup-sync-collapsed-text = 同步并备份数据

fxa-menu-message-mobile-primary-text = 将选项卡发送至您的手机
fxa-menu-message-mobile-secondary-text = 当您将选项卡与移动设备同步时，可即时从上次中断的位置继续操作。
fxa-menu-message-mobile-collapsed-text = 与您的手机同步

## Multi-CTA Fox Doodle Spotlight

multi-cta-fox-doodle-title = 欢迎您回来

multi-cta-fox-doodle-set-default-checkbox = 将 { -brand-short-name } 设置为默认
multi-cta-fox-doodle-pin-startmenu-checkbox = 将 { -brand-short-name } 固定到“开始”菜单
multi-cta-fox-doodle-pin-checkbox  = { PLATFORM() ->
    [macos] 将 { -brand-short-name } 保留在程序坞中
   *[other] 将 { -brand-short-name } 固定到任务栏
}
multi-cta-fox-doodle-start-browsing-primary-button-label = 启动浏览
multi-cta-fox-doodle-main-browser-primary-button-label = 将 { -brand-short-name } 设置为主浏览器

multi-cta-fox-doodle-quick-reminder-subtitle = 此为您提供一项快速提醒：您可保持您所钟爱的、注重隐私的浏览器仅一步之遥。
multi-cta-fox-doodle-privacy-focused-subtitle  = { PLATFORM() ->
    [macos] 请您保持您所钟爱的、注重隐私的浏览器仅一步之遥。请将 { -brand-short-name } 设置为用于打开链接的默认浏览器，并将其保留在您的 Dock 中。
   *[other] 请您保持您所钟爱的、注重隐私的浏览器仅一步之遥。请将 { -brand-short-name } 设置为用于打开链接的默认浏览器，并将其固定到您的任务栏。
}
multi-cta-fox-doodle-msix-privacy-focused-subtitle = 请您保持您所钟爱的、注重隐私的浏览器仅一步之遥。请将 { -brand-short-name } 设置为用于打开链接的默认浏览器，并将其固定到您的任务栏和“开始”菜单。

## Windows 10 EoS Sync messages group 1 spotlight

windows-10-eos-sync-spotlight-title = 您是否即将从 10 Windows 进行升级？
windows-10-eos-sync-spotlight-subtitle = 请您备份您的密码和书签，以便您准备好跃迁至任何设备。
windows-10-eos-sync-spotlight-primary-label = 备份您的 { -brand-short-name }

## Windows 10 EoS Sync messages group 1 toast notification

windows-10-eos-sync-toast-title = 您是否正在升级至 11 Windows？请勿丢失书签和密码。
windows-10-eos-sync-toast-subtitle = 请您备份您的数据，以便 { -brand-short-name } 随时准备就绪，无论是在此 PC 上还是下一台 PC 上。
windows-10-eos-sync-toast-primary-label = 开始
windows-10-eos-sync-toast-secondary-label = 稍后提醒我

## Windows 10 EoS sync messages group 2 feature callouts

windows-10-eos-challenger-callout-title = { -brand-product-name } 并未像其他大型科技公司的浏览器那样被预装。这正是其意义所在。
windows-10-eos-challenger-sync-callout-subtitle = 当您备份您的 { -brand-product-name } 书签和密码时，将您所选择的浏览器带到您的下一台设备将变得更加容易。
windows-10-eos-challenger-pin-callout-subtitle = 请将 { -brand-shorter-name } 固定到您的任务栏，以便您所选择的浏览器在您需要时始终可用。
windows-10-eos-challenger-sync-primary-button = 备份 { -brand-shorter-name }
windows-10-eos-challenger-pin-primary-button = 固定 { -brand-shorter-name }

windows-10-eos-sync-callout-privacy-screen-1-title = { -brand-product-name } 可阻止加密货币挖矿程序、社交媒体跟踪器以及指纹识别器。
windows-10-eos-sync-callout-privacy-screen-1-subtitle = 跟踪器无法识别您的设备，也无法在网络上跟踪您——因为我们不允许它们这样做。
windows-10-eos-sync-callout-privacy-screen-2-title = 请为您的下一台设备保护您的密码和书签。
windows-10-eos-sync-callout-privacy-screen-2-subtitle = 备份 { -brand-shorter-name } 可让您轻松地将您的数据和隐私设置一并携带。
windows-10-eos-sync-callout-privacy-info-button = 查看已被阻止的内容

windows-10-eos-callout-addons-title = 请尝试附加组件：简单的升级，巨大的影响
windows-10-eos-callout-addons-subtitle = 这些扩展程序是经过挑选的，旨在帮助您保持高效、受到保护且不受干扰。
windows-10-eos-callout-addons-primary-button = 查看我们的精选

windows-10-eos-sync-callout-addons-title = 当您从 10 Windows 升级时，请勿丢失您的附加组件。
windows-10-eos-sync-callout-addons-subtitle = 请立即同步，以便您的 { -brand-product-name } 附加组件始终可用，即使在设备更换之后也是如此。

windows-10-eos-sync-callout-next-button = 下一步
windows-10-eos-sync-callout-get-started-button = 开始

## Windows 10 EoS Sync messages group 2 toast notification

windows-10-eos-feature-toast-title = 垂直标签页和标签页分组现已推出！

# In English, "dropped" is a colloquial form for released.
windows-10-eos-feature-toast-subtitle = 应广大用户的请求，{ -brand-product-name } 刚刚推出了新功能，以保持您的浏览体验精简而专注。
windows-10-eos-feature-toast-whats-new-button = 查看新增内容
windows-10-eos-feature-toast-dismiss-button = 关闭

## Windows 10 EoS Global Infobar

windows-10-eos-global-infobar-title = <strong>巨硬已不再支持 10 Windows。</strong> 请您备份您的信息，以便 { -brand-product-name } 为 11 Windows 做好准备。
windows-10-eos-global-infobar-primary-button = 启用备份
  .accesskey = T
windows-10-eos-global-infobar-learn-more-link = 了解更多
  .accessKey = L

## ETP (Enhanced Tracking Protection) Strict exceptions infobar
##
## These strings are displayed in an infobar notification that appears when
## Enhanced Tracking Protection's Strict mode is causing website functionality
## issues. The infobar offers users the option to apply automatic exceptions
## to fix common site breakage by unblocking essential elements.

etp-strict-exceptions-infobar-message = <strong>严格跟踪保护可能导致网站无法正常运作。</strong> 请您通过解除对可能包含跟踪器的关键元素的阻止，来修复常见问题。
etp-strict-exceptions-infobar-learn-more = 了解更多
etp-strict-exceptions-infobar-button = 应用修复
  .accesskey = A
etp-strict-exceptions-infobar-not-now = 暂不
  .accesskey = N

## 'Set to default' messaging displayed within the App menu

set-default-menu-message-simple-layout-title = { -brand-short-name } 不是您的默认浏览器
set-default-menu-message-simple-layout-title-variant = { -brand-short-name } 不是您的主浏览器

set-default-menu-message-row-layout-title = 将 { -brand-short-name } 设置为您的主浏览器
set-default-menu-message-row-layout-title-variant = 将 { -brand-short-name } 设置为您的默认浏览器

set-default-menu-message-row-layout-subtitle = 在您每次浏览时，均可获得速度、安全和隐私。
set-default-menu-message-row-layout-subtitle-variant = { PLATFORM() ->
    [macos] 请您将 { -brand-short-name } 置于您的指尖——将其设置为默认浏览器，并将其保留在您的 Dock 中。
   *[other] 请您将 { -brand-short-name } 置于您的指尖——将其设置为默认浏览器，并将其保留在您的任务栏中。
}

set-default-menu-message-primary-button = 设置为默认
set-default-menu-message-primary-button-variant = 设置为主浏览器

## Firefox Relay 50 Masks Announcement

# "on us" in this context means "for free" or "at no cost"
relay-50-masks-announcement-title = 50 个电子邮件掩码，由我们承担
relay-50-masks-announcement-subtitle = 现在您可获得 50 个免费掩码（原为 5 个）。请为每个账户使用一个掩码，以保持您的真实电子邮件地址的私密性。
relay-50-masks-announcement-primary-button = 前往 { -relay-brand-name }
  .accesskey = G
relay-50-masks-announcement-secondary-button = 关闭
  .accesskey = D

## Nova Early Access Infobar

nova-early-access-infobar-title = <strong>{ -brand-product-name } 正在获得全新的外观。</strong> 您正在预览一个早期、未完善的版本，该版本将在今年晚些时候正式发布之前提供。

nova-early-access-share-feedback-link = 分享反馈
  .accesskey = S

nova-early-access-infobar-primary-button = 已了解
  .accesskey = G
