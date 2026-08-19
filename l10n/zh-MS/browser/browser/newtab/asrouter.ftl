# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These messages are used as headings in the recommendation doorhanger

cfr-doorhanger-extension-heading = 被推荐的扩展名
cfr-doorhanger-feature-heading = 被推荐的特性

##

cfr-doorhanger-extension-sumo-link =
  .tooltiptext = 为什么存取管理程序电流视觉这

cfr-doorhanger-extension-cancel-button = 不现在
  .accesskey = N

cfr-doorhanger-extension-ok-button = 添加现在
  .accesskey = A

cfr-doorhanger-extension-manage-settings-button = 管理推荐设置
  .accesskey = M

cfr-doorhanger-extension-never-show-recommendation = 不要显示我这推荐
  .accesskey = S

cfr-doorhanger-extension-learn-more-link = 学习更多

# This string is used on a new line below the add-on name
# Variables:
#   $name (String) - Add-on author name
cfr-doorhanger-extension-author = 由 { $name }

# This is a notification displayed in the address bar.
# When clicked it opens a panel with a message for the user.
cfr-doorhanger-extension-notification = 推荐
# .a11y-announcement is extracted in JS and announced via A11y.announce.
cfr-doorhanger-extension-notification2 = 推荐
  .tooltiptext = 扩展名推荐
  .a11y-announcement = 扩展名推荐可利用的

# This is a notification displayed in the address bar.
# When clicked it opens a panel with a message for the user.
# .a11y-announcement is extracted in JS and announced via A11y.announce.
cfr-doorhanger-feature-notification = 推荐
  .tooltiptext = 特性推荐
  .a11y-announcement = 特性推荐可利用的

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
      [one] { $total } 用户
     *[other] { $total } 用户
  }

## Mozilla Account messages

cfr-doorhanger-bookmark-fxa-header = 同步的你的书签各处.
cfr-doorhanger-bookmark-fxa-body-2 = 大的发现! 现在不要是许可没有这书签在你的活动物体装置. 获得启动与一个帐户.
cfr-doorhanger-bookmark-fxa-link-text = 同步的书签现在…
cfr-doorhanger-bookmark-fxa-close-btn-tooltip =
  .aria-label = 关闭按钮
  .title = 关闭

fxa-adoption-addresses-backup-title = 让我们回向上的你的保存地址
fxa-adoption-addresses-backup-subtitle = 防卫你的保存地址由【电影、电视】他们到你的装置与加密.
fxa-adoption-credit-cards-backup-title = 让我们回向上的你的付款方法
fxa-adoption-credit-cards-backup-subtitle = 防卫你的付款方法由【电影、电视】他们到你的装置与加密.
fxa-adoption-bookmarks-treatment-backup-title = 让我们回向上的你的书签
fxa-adoption-bookmarks-treatment-backup-subtitle = 防卫你的书签由【电影、电视】他们到你的装置与加密.

fxa-adoption-primary-button-label = 正负号向上的

## What's New toolbar button and panel

# This string is used by screen readers to offer a text based alternative for
# the notification icon
cfr-badge-reader-label-newfeature = 新的特性:

cfr-whatsnew-button =
  .label = 什么是新的
  .tooltiptext = 什么是新的

cfr-whatsnew-release-notes-link-text = 读取那版本笔记

## Enhanced Tracking Protection Milestones

# Variables:
#   $blockedCount (Number) - The total count of blocked trackers. This number will always be greater than 1.
#   $date (Datetime) - The date we began recording the count of blocked trackers
cfr-doorhanger-milestone-heading2 =
  { $blockedCount ->
    *[other] { -brand-short-name } 阻止结束 <b>{ $blockedCount }</b> 追踪者自...以后 { DATETIME($date, month: "long", year: "numeric") }!
  }
cfr-doorhanger-milestone-ok-button = 看见所有的
  .accesskey = S
cfr-doorhanger-milestone-close-button = 关闭
  .accesskey = C

## DOH Message

cfr-doorhanger-doh-body = 你的隐私事件. { -brand-short-name } 现在安全地传递你的 DNS 请求每当可能的到一个合伙人服务到防卫你消磨你浏览.
cfr-doorhanger-doh-header = 更多无虑的, 加密 DNS 查找
cfr-doorhanger-doh-primary-button-2 = 好
  .accesskey = O
cfr-doorhanger-doh-secondary-button = 禁用
  .accesskey = D

## Full Video Support CFR message

cfr-doorhanger-video-support-body = 影像在此站点可以不播放对在这版本的 { -brand-short-name }. 为了完整影像支持, 更新 { -brand-short-name } 现在.
cfr-doorhanger-video-support-header = 更新 { -brand-short-name } 到播放影像
cfr-doorhanger-video-support-primary-button = 更新现在
  .accesskey = U

## VPN promotion dialog for public Wi-Fi users
##
## If a user is detected to be on a public Wi-Fi network, they are given a
## bit of info about how to improve their privacy and then offered a button
## to the Mozilla VPN page and a link to dismiss the dialog.

# This header text can be explicitly wrapped.
spotlight-public-wifi-vpn-header = 一看相似的你是使用公众熟铁-格式标识码
spotlight-public-wifi-vpn-body = 到隐藏你的位置和浏览活动, 考虑一个虚拟私人的网络. 它将帮助保持你受保护的何时浏览在公众地方相似的飞机场和咖啡商店.
spotlight-public-wifi-vpn-primary-button = 停留私人的与 { -mozilla-vpn-brand-name }
  .accesskey = S
spotlight-public-wifi-vpn-link = 不现在
  .accesskey = N

## Emotive Continuous Onboarding

spotlight-better-internet-header = 一个较好的因特网启动与你
spotlight-better-internet-body = 何时你使用 { -brand-short-name}, 你是投票为了一个打开和易接近的因特网那是较好的为了系统中的一个组名.
spotlight-peace-mind-header = 我们有获得你隐蔽着的
spotlight-peace-mind-body = 每一月, { -brand-short-name } 阻止一个平均的结束 3,000 追踪者每一用户. 因为无, 尤其隐私讨厌的东西相似的追踪者, 应该站在...之间你和那善行因特网.
spotlight-pin-primary-button = { PLATFORM() ->
    [macos] 保持在码头
   *[other] 大头针到任务栏
}
spotlight-pin-secondary-button = 不现在

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

mr2022-background-update-toast-title = 新的 { -brand-short-name }. 更多私人的. 较少的追踪者. 无妥协.
mr2022-background-update-toast-text = 尝试那最新 { -brand-short-name } 现在, 更新的与我们的最强壮的反对者-跟踪保护还.

# This button label will be fitted into a narrow fixed-width button by
# Windows. Try to not exceed the width of the English text (compare it
# using a variable font like Arial): the button can only fit 1-2
# additional characters, exceeding characters will be truncated.
mr2022-background-update-toast-primary-button-label = 打开 { -brand-shorter-name } 现在

# This button label will be fitted into a narrow fixed-width button by
# Windows. Try to not exceed the width of the English text (compare it using a
# variable font like Arial): the button can only fit 1-2 additional characters,
# exceeding characters will be truncated.
mr2022-background-update-toast-secondary-button-label = 提醒我以后

## Cookie Banner Handling CFR

cookie-banner-blocker-onboarding-header = { -brand-short-name } 只是遭拒绝的一个饼干旗帜为了你
cookie-banner-blocker-onboarding-body = 最低成本估算与调度法娱乐, 最低成本估算与调度法饼干跟踪你在此站点.
cookie-banner-blocker-onboarding-learn-more = 学习更多

## These strings are used in the Fox doodle Pin/set default spotlights

july-jam-headline = 我们有获得你隐蔽着的
july-jam-body = 每一月, { -brand-short-name } 阻止一个平均的 3,000+ 追踪者每一用户, 礼物你保险箱, 快的访问到那善行因特网.
july-jam-set-default-primary = 打开我的连接与 { -brand-short-name }
fox-doodle-pin-headline = 欢迎回

# “indie” is short for the term “independent”.
# In this instance, free from outside influence or control.
fox-doodle-pin-body = 这里是一个新长出的肉提醒的人那你能保持你的喜欢的事物独立制片人浏览器只是一(个) 单击离去.
fox-doodle-pin-primary = 打开我的连接与 { -brand-short-name }
fox-doodle-pin-secondary = 不现在

## These strings are used in the Set Firefox as Default PDF Handler for Existing Users experiment

set-default-pdf-handler-headline = <strong>你的概率分部函数现在打开在 { -brand-short-name }.</strong> 编辑或正负号表单直接的在你的浏览器中. 到更改, 搜索“PDF”在设置.
set-default-pdf-handler-primary = 获得它

## PDF Annotations strings

# “Sign on the dotted line” is an idiomatic English expression about
# where to place your signature.
# If this expression doesn’t have a direct translation, please
# translate this alternative string: "Add your signature anywhere!"
annotations-default-pdf-handler-headline = 正负号在那有点的线路—或无论何处!

# “Go-to” is an idiomatic English expression referring to something that is used often.
annotations-default-pdf-handler-body = 翻牌, 类型, 或上装你的签名附件, 然后地方它确切地哪里你想要. 保存你的去-to 签名附件为了近邻干扰时间.
annotations-make-default-pdf-handler-title = 使 { -brand-short-name } 你的默认 PDF 编辑器?
annotations-make-default-pdf-handler-subtitle = 你将有访问到我们的工具每一时间你打开一个 PDF.
annotations-make-default-pdf-primary-cta-label = 日落作为默认
annotations-make-default-pdf-next-label = 近邻干扰

## FxA sync CFR

fxa-sync-cfr-header = 新的装置在你的未来?
fxa-sync-cfr-body = 确保你的最近的书签, 密码, 和标签页过来与你任何的时间你打开一个新的 { -brand-product-name } 浏览器.
fxa-sync-cfr-primary = 学习更多
  .accesskey = L
fxa-sync-cfr-secondary = 提醒我以后
  .accesskey = R

## Device Migration FxA Spotlight

device-migration-fxa-spotlight-heavy-user-header = 不要忘记到回向上的你的论据
device-migration-fxa-spotlight-heavy-user-body = 确保要点信息—相似的书签和密码—是更新的和受保护的越过所有的你的装置.
device-migration-fxa-spotlight-heavy-user-primary-button = 获得启动

device-migration-fxa-spotlight-older-device-header = 和平的思想, 从 { -brand-product-name }
device-migration-fxa-spotlight-older-device-body = 一个帐户保持你的要点信息更新的和受保护的在任何的装置你连接.
device-migration-fxa-spotlight-older-device-primary-button = 创建一个帐户

device-migration-fxa-spotlight-getting-new-device-header-2 = 新的装置在你的未来?
device-migration-fxa-spotlight-getting-new-device-body-2 = 跟随一个少数简单的步骤到带来你的书签, 历史记录, 和密码与你何时你获得启动在一个新的装置.
device-migration-fxa-spotlight-getting-new-device-primary-button = 如何到回向上的我的论据

device-migration-fxa-spotlight-sync-header = 浏览没有不见的一个拍
device-migration-fxa-spotlight-sync-body = 同步的所有的你的要点信息与加密—相似的书签和密码. 你能拉每件事物向上的无论何处你使用 { -brand-product-name }.
device-migration-fxa-spotlight-sync-primary-button = 获得启动

## Set as Default PDF Reader Infobar

# The question portion of the following message should have the <strong> and </strong> tags surrounding it.
pdf-default-notification-message = <strong>使 { -brand-short-name } 你的默认 PDF 阅读程序?</strong> 使用 { -brand-short-name } 到读取和编辑概率分部函数保存到你的计算机.
pdf-default-notification-set-default-button =
    .label = 日落作为默认
pdf-default-notification-decline-button =
    .label = 不现在

## Launch on login infobar notification

launch-on-login-infobar-message = <strong>打开 { -brand-short-name } 每一时间你重新启动你的计算机?</strong> 现在你能放 { -brand-short-name } 到打开自动地何时你重新启动你的装置.
launch-on-login-learnmore = 学习更多
launch-on-login-infobar-confirm-button = 是, 打开 { -brand-short-name }
  .accesskey = Y
launch-on-login-infobar-reject-button = 不现在
  .accesskey = N

## These string variants are used when the “launch on login” infobar
## notification is displayed for a second time.

launch-on-login-infobar-final-message = <strong>打开 { -brand-short-name } 每一时间你重新启动你的计算机?</strong> 到管理你的启动首选项, 搜索“启动”在设置.
launch-on-login-infobar-final-reject-button = 无谢意
  .accesskey = N

## Launch on login spotlight
##
## Shown as a spotlight message when the user closes the browser, offering to set
## { -brand-short-name } to launch when the computer starts up.

launch-on-login-spotlight-title = 打开 { -brand-short-name } 近邻干扰时间你的计算机启动向上的?
launch-on-login-spotlight-startup-checkbox = 下水 { -brand-short-name } 在启动
launch-on-login-spotlight-pin-taskbar-checkbox = 大头针到任务栏
# This checkbox label intentionally matches “startup-restore-windows-and-tabs”
# in the Settings (preferences.ftl). Localizers can reuse the existing
# translation suggested by translation memory.
launch-on-login-spotlight-restore-checkbox = 打开早先的窗和标签页
launch-on-login-spotlight-primary-button = 保存和关闭 { -brand-short-name }

## Tail Fox Set Default Spotlight

# This title is displayed together with the picture of a running fox with a long tail.
# In English, this is a figure of speech meaning 'stop something from following you'.
# If the localization of this message is challenging, consider using a simplified
# alternative as a reference for translation: 'Keep unwanted trackers away'.
tail-fox-spotlight-title = 保持麻烦的追踪者关闭你的尾部
tail-fox-spotlight-subtitle = 说再见到恼人的地址追踪者和有背长椅进入...之内一个更安全, 快的因特网经历.
tail-fox-spotlight-primary-button = 打开我的连接与 { -brand-short-name }
tail-fox-spotlight-secondary-button = 不现在

## Welcome Back Spotlight and Import

welcome-back-spotlight-title = 跳跃回进入...之内构造-in 隐私
welcome-back-spotlight-subtitle = 欢迎回到那仅主要浏览器有背的由一个非-profit. 我们采取额外的事物步骤到防卫你的论据无论哪里你漫游.
welcome-back-embedded-import-title = 引入你的论据和使 { -brand-short-name } 感觉相似的主页

## Root Certificate Succession Infobar

root-certificate-succession-infobar-january-message = <strong>年长的版本的 { -brand-short-name } 可以启动到有问题在一月 14, 2025.</strong>
root-certificate-succession-infobar-march-message = <strong>更新到保持使用 { -brand-short-name } 在...之后三月 14, 2025.</strong>
root-certificate-succession-infobar-link = 为什么做电流需要到更新?
root-certificate-succession-infobar-primary-button =
  .label = 更新现在
  .accesskey = U
root-certificate-succession-infobar-secondary-button =
  .label = 以后
  .accesskey = L

## Root Certificate Succession Windows Background Notification

root-certificate-windows-background-notification-title = 你投偏一个要点 { -brand-short-name } 更新
root-certificate-windows-background-notification-subtitle = 部分的那浏览器将停止工作不久如果你不要更新. 现在是一个全部时间到获得我们的最近的保护和特性.
root-certificate-windows-background-notification-learn-more-button = 学习更多
root-certificate-windows-background-notification-update-button = 更新 { -brand-short-name }

## FxA Menu Message variants

fxa-menu-message-close-button =
    .title = 关闭
    .aria-label = 关闭

fxa-menu-message-sign-up-button = 正负号向上的
fxa-menu-message-sign-in-button = 正负号在
fxa-menu-message-sync-button = 启动【电影、电视】

fxa-menu-message-sync-devices-primary-text = 同步的所有的你的装置
fxa-menu-message-sync-devices-secondary-text = 立即地获得你的信息—相似的书签和密码—各处你使用 { -brand-short-name }.
fxa-menu-message-sync-devices-secondary-text2 = 立即地获得你的书签, 密码, 和更多—各处你是有符号的在到 { -brand-short-name }.
fxa-menu-message-sync-devices-collapsed-text = 同步的所有的你的装置

fxa-menu-message-backup-data-primary-text = 回向上的你的浏览器论据
fxa-menu-message-backup-data-secondary-text = 自动地防卫书签, 密码, 和其他的信息在全部你的装置.
fxa-menu-message-backup-data-collapsed-text = 回向上的浏览器论据

fxa-menu-message-backup-sync-primary-text = 保持你的论据保险箱和 synchronization 的缩略词
fxa-menu-message-backup-sync-secondary-text = 同步的回向上的最多的你的论据如此你能访问它各处你使用 { -brand-short-name }.
fxa-menu-message-backup-sync-collapsed-text = 同步的和回向上的论据

fxa-menu-message-mobile-primary-text = 发送标签页到你的电话
fxa-menu-message-mobile-secondary-text = 拾取向上的哪里你离开关闭立即地何时你同步的你的标签页与一个活动物体装置.
fxa-menu-message-mobile-collapsed-text = 同步的与你的电话

## Multi-CTA Fox Doodle Spotlight

multi-cta-fox-doodle-title = 欢迎回

multi-cta-fox-doodle-set-default-checkbox = 日落 { -brand-short-name } 到默认
multi-cta-fox-doodle-pin-startmenu-checkbox = 大头针 { -brand-short-name } 到启动菜单
multi-cta-fox-doodle-pin-checkbox  = { PLATFORM() ->
    [macos] 保持 { -brand-short-name } 在码头
   *[other] 大头针 { -brand-short-name } 到任务栏
}
multi-cta-fox-doodle-start-browsing-primary-button-label = 启动浏览
multi-cta-fox-doodle-main-browser-primary-button-label = 使 { -brand-short-name } 我的主群组浏览器

multi-cta-fox-doodle-quick-reminder-subtitle = 这里是一个新长出的肉提醒的人那你能保持你的喜欢的事物隐私-focused 浏览器只是一(个) 单击离去.
multi-cta-fox-doodle-privacy-focused-subtitle  = { PLATFORM() ->
    [macos] 保持你的喜欢的事物隐私-focused 浏览器只是一(个) 单击离去. 日落 { -brand-short-name } 作为你的默认浏览器为了打开连接和保持它在你的码头.
   *[other] 保持你的喜欢的事物隐私-focused 浏览器只是一(个) 单击离去. 日落 { -brand-short-name } 作为你的默认浏览器为了打开连接和大头针它到你的任务栏.
}
multi-cta-fox-doodle-msix-privacy-focused-subtitle = 保持你的喜欢的事物隐私-focused 浏览器只是一(个) 单击离去. 日落 { -brand-short-name } 作为你的默认浏览器为了打开连接和大头针它到你的任务栏和启动菜单.

## Windows 10 EoS Sync messages group 1 spotlight

windows-10-eos-sync-spotlight-title = 升级从窗10 不久?
windows-10-eos-sync-spotlight-subtitle = 回向上的你的密码和书签如此你是预备好的状态到使那跳跃到任何的装置.
windows-10-eos-sync-spotlight-primary-label = 回向上的你的 { -brand-short-name }

## Windows 10 EoS Sync messages group 1 toast notification

windows-10-eos-sync-toast-title = 升级到窗11? 不要遗失书签和密码.
windows-10-eos-sync-toast-subtitle = 回向上的你的论据如此 { -brand-short-name } 是预备好的状态到去任何的时间, 在这 PC 或那近邻干扰一(个).
windows-10-eos-sync-toast-primary-label = 获得启动
windows-10-eos-sync-toast-secondary-label = 提醒我以后

## Windows 10 EoS sync messages group 2 feature callouts

windows-10-eos-challenger-callout-title = { -brand-product-name } 不是预装入的相似的其他的大的技术学院或学校浏览器. 那是那点.
windows-10-eos-challenger-sync-callout-subtitle = 何时你回向上的你的 { -brand-product-name } 书签和密码, 它是更简单到带来那浏览器你动产到你的近邻干扰装置.
windows-10-eos-challenger-pin-callout-subtitle = 大头针 { -brand-shorter-name } 到你的任务栏如此那浏览器你动产是总是那里何时你需要它.
windows-10-eos-challenger-sync-primary-button = 回向上的 { -brand-shorter-name }
windows-10-eos-challenger-pin-primary-button = 大头针 { -brand-shorter-name }

windows-10-eos-sync-callout-privacy-screen-1-title = { -brand-product-name } 阻止 cryptominers, 社会的媒质追踪者, 和 fingerprinters.
windows-10-eos-sync-callout-privacy-screen-1-subtitle = 追踪者不能 ID 你的装置或跟随你越过那网—因为我们不要让他们.
windows-10-eos-sync-callout-privacy-screen-2-title = 无虑的你的密码和书签为了你的近邻干扰装置.
windows-10-eos-sync-callout-privacy-screen-2-subtitle = 后退向上的 { -brand-shorter-name } 使它容易的到带来你的论据和隐私设置与你.
windows-10-eos-sync-callout-privacy-info-button = 看见什么是阻止

windows-10-eos-callout-addons-title = 尝试添加-奥运信息服务: 简单的升级, 大的冲击
windows-10-eos-callout-addons-subtitle = 这些扩展名曾是 chosen 到帮助你制止能生产的, 受保护的, 和娱乐-free.
windows-10-eos-callout-addons-primary-button = 看见我们的拾取

windows-10-eos-sync-callout-addons-title = 不要遗失你的添加-ons 何时你升级从窗10.
windows-10-eos-sync-callout-addons-subtitle = 同步的现在如此你的 { -brand-product-name } 添加-ons 是总是可利用的, 偶数在...之后一个装置更改.

windows-10-eos-sync-callout-next-button = 近邻干扰
windows-10-eos-sync-callout-get-started-button = 获得启动

## Windows 10 EoS Sync messages group 2 toast notification

windows-10-eos-feature-toast-title = 垂直的标签页和标签页创建组是这里!

# In English, "dropped" is a colloquial form for released.
windows-10-eos-feature-toast-subtitle = 由通俗的请求, { -brand-product-name } 只是抛踢球得分的新的特性到保持你的浏览流线的和聚焦的.
windows-10-eos-feature-toast-whats-new-button = 看见什么是新的
windows-10-eos-feature-toast-dismiss-button = 解散

## Windows 10 EoS Global Infobar

windows-10-eos-global-infobar-title = <strong>巨硬是无比较久次要的窗10.</strong> 回向上的你的信息到获得 { -brand-product-name } 预备好的状态为了窗11.
windows-10-eos-global-infobar-primary-button = 转弯在倒车
  .accesskey = T
windows-10-eos-global-infobar-learn-more-link = 学习更多
  .accessKey = L

## ETP (Enhanced Tracking Protection) Strict exceptions infobar
##
## These strings are displayed in an infobar notification that appears when
## Enhanced Tracking Protection's Strict mode is causing website functionality
## issues. The infobar offers users the option to apply automatic exceptions
## to fix common site breakage by unblocking essential elements.

etp-strict-exceptions-infobar-message = <strong>严厉的跟踪保护能引起位置到中断.</strong> 修复公用块发行由块分解本质冒险部分那能够包含追踪者.
etp-strict-exceptions-infobar-learn-more = 学习更多
etp-strict-exceptions-infobar-button = 应用修复
  .accesskey = A
etp-strict-exceptions-infobar-not-now = 不现在
  .accesskey = N

## 'Set to default' messaging displayed within the App menu

set-default-menu-message-simple-layout-title = { -brand-short-name } 是不你的默认浏览器
set-default-menu-message-simple-layout-title-variant = { -brand-short-name } 是不你的初等量浏览器

set-default-menu-message-row-layout-title = 使 { -brand-short-name } 你的初等量浏览器
set-default-menu-message-row-layout-title-variant = 使 { -brand-short-name } 你的默认浏览器

set-default-menu-message-row-layout-subtitle = 获得中央处理机速度设置程序, 安全和隐私每一时间你浏览.
set-default-menu-message-row-layout-subtitle-variant = { PLATFORM() ->
    [macos] 保持 { -brand-short-name } 在你的指尖—使它你的默认和保持它在你的码头.
   *[other] 保持 { -brand-short-name } 在你的指尖—使它你的默认和保持它在你的任务栏.
}

set-default-menu-message-primary-button = 日落作为默认
set-default-menu-message-primary-button-variant = 日落作为初等量浏览器

## Firefox Relay 50 Masks Announcement

# "on us" in this context means "for free" or "at no cost"
relay-50-masks-announcement-title = 50 电子信函屏蔽, 在我们
relay-50-masks-announcement-subtitle = 现在你获得 50 自由的屏蔽 (向上的从 5). 使用一(个) 为了每一帐户到保持你的实数电子信函私人的.
relay-50-masks-announcement-primary-button = 去到 { -relay-brand-name }
  .accesskey = G
relay-50-masks-announcement-secondary-button = 解散
  .accesskey = D

## Nova Early Access Infobar

nova-early-access-infobar-title = <strong>{ -brand-product-name } 是采煤一个新的一看.</strong> 你是预视一个早的, 未磨光的版本在...之前那下水以后这年.

nova-early-access-share-feedback-link = 部分反馈
  .accesskey = S

nova-early-access-infobar-primary-button = 获得它
  .accesskey = G
