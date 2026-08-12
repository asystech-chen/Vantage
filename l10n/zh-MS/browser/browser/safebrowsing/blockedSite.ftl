# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

safeb-blocked-phishing-page-title = 前方存在欺骗性站点
safeb-blocked-malware-page-title = 访问此网站可能对您的计算机造成损害
safeb-blocked-unwanted-page-title = 前方站点可能包含有害程序
safeb-blocked-harmful-page-title = 前方站点可能包含恶意软件
safeb-blocked-addon-page-title = 为您的安全起见，站点已被阻止
safeb-blocked-phishing-page-short-desc = { -brand-short-name } 已阻止此页面，因为它可能试图诱使您执行危险操作，例如安装软件或泄露密码或信用卡等个人信息。
safeb-blocked-malware-page-short-desc = { -brand-short-name } 已阻止此页面，因为它可能尝试安装可能窃取或删除您计算机上个人信息的恶意软件。
safeb-blocked-unwanted-page-short-desc = { -brand-short-name } 已阻止此页面，因为它可能试图诱使您安装破坏浏览体验的程序（例如，更改您的主页或在您访问的站点上显示额外广告）。
safeb-blocked-harmful-page-short-desc = { -brand-short-name } 已阻止此页面，因为它可能尝试安装窃取或删除您信息（例如照片、密码、消息和信用卡）的危险应用程序。
safeb-blocked-addon-page-short-desc = { -brand-short-name } 已阻止此页面，因为您的某个附加组件试图将其打开。此站点可能被用于窃取您的信息——如密码或信用卡号。
# Variables:
#   $advisoryname (string) - Name of the advisory entity
safeb-palm-advisory-desc = 咨询由 <a data-l10n-name='advisory_provider'>{ $advisoryname }</a> 提供。
safeb-palm-accept-label = 返回
safeb-palm-see-details-label = 查看详细信息

## Variables
##  $sitename (string) - Domain name for the blocked page

safeb-blocked-phishing-page-error-desc-override = <span data-l10n-name='sitename'>{ $sitename }</span> 已被<a data-l10n-name='error_desc_link'>报告为欺骗性站点</a>。您可以选择<a data-l10n-name='report_detection'>报告检测问题</a>或<a data-l10n-name='ignore_warning_link'>忽略风险</a>并前往此不安全站点。
safeb-blocked-phishing-page-error-desc-no-override = <span data-l10n-name='sitename'>{ $sitename }</span> 已被<a data-l10n-name='error_desc_link'>报告为欺骗性站点</a>。您可以选择<a data-l10n-name='report_detection'>报告检测问题</a>。
safeb-blocked-phishing-page-learn-more = 请在<a data-l10n-name='learn_more_link'>www.antiphishing.org</a>了解更多关于欺骗性站点和网络钓鱼的信息。请在<a data-l10n-name='firefox_support'>support.mozilla.org</a>了解有关 { -brand-short-name } 的网络钓鱼和恶意软件保护的更多信息。

safeb-blocked-malware-page-error-desc-override-sumo = <span data-l10n-name='sitename'>{ $sitename }</span> 已被<a data-l10n-name='error_desc_link'>报告为包含恶意软件</a>。您可以选择<a data-l10n-name='ignore_warning_link'>忽略风险</a>并前往此不安全站点。
safeb-blocked-malware-page-error-desc-no-override-sumo = <span data-l10n-name='sitename'>{ $sitename }</span> 已被<a data-l10n-name='error_desc_link'>报告为包含恶意软件</a>。
safeb-blocked-malware-page-learn-more-sumo = 请在<a data-l10n-name='firefox_support'>support.mozilla.org</a>了解有关 { -brand-short-name } 的网络钓鱼和恶意软件保护的更多信息。

safeb-blocked-unwanted-page-error-desc-override = <span data-l10n-name='sitename'>{ $sitename }</span> 已被<a data-l10n-name='error_desc_link'>报告为包含有害软件</a>。您可以选择<a data-l10n-name='ignore_warning_link'>忽略风险</a>并前往此不安全站点。
safeb-blocked-unwanted-page-error-desc-no-override = <span data-l10n-name='sitename'>{ $sitename }</span> 已被<a data-l10n-name='error_desc_link'>报告为包含有害软件</a>。
safeb-blocked-unwanted-page-learn-more = 请在<a data-l10n-name='learn_more_link'>有害及不需要的软件政策</a>了解更多关于有害和不需要的软件的信息。请在<a data-l10n-name='firefox_support'>support.mozilla.org</a>了解有关 { -brand-short-name } 的网络钓鱼和恶意软件保护的更多信息。

safeb-blocked-harmful-page-error-desc-override = <span data-l10n-name='sitename'>{ $sitename }</span> 已被<a data-l10n-name='error_desc_link'>报告为包含潜在有害应用程序</a>。您可以选择<a data-l10n-name='ignore_warning_link'>忽略风险</a>并前往此不安全站点。
safeb-blocked-harmful-page-error-desc-no-override = <span data-l10n-name='sitename'>{ $sitename }</span> 已被<a data-l10n-name='error_desc_link'>报告为包含潜在有害应用程序</a>。
safeb-blocked-harmful-page-learn-more = 请在<a data-l10n-name='firefox_support'>support.mozilla.org</a>了解有关 { -brand-short-name } 的网络钓鱼和恶意软件保护的更多信息。

## Variables:
##  $addonName (string) - the name of the harmful add-on
##  $sitename (string) - Domain name for the blocked page

safeb-blocked-addon-page-error-desc-override = <strong>此站点为何被阻止？</strong>
safeb-blocked-addon-page-error-desc2-override = <strong>{ $sitename }</strong> 可能与被欺骗性和有害的活动有关联。
safeb-blocked-addon-page-error-desc3-override = <strong>您可以采取什么措施？</strong>
safeb-blocked-addon-page-error-desc4-override = 为防止此类情况再次发生，您可以从 about:addons 中删除或禁用 <strong>{ $addonName }</strong>。
safeb-blocked-addon-page-learn-more3 = <a data-l10n-name='firefox_support_harmful_addons'>了解有关 { -brand-short-name } 的有害附加组件保护的更多信息</a>。
