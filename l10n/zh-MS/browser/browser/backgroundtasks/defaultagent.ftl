# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

default-browser-agent-task-description = 默认浏览器代理任务负责检查默认浏览器何时从 { -brand-short-name } 更改为其他浏览器。若更改发生在可疑情况下，系统将提示用户改回 { -brand-short-name }，且最多不超过两次。此任务由 { -brand-short-name } 自动安装，并在 { -brand-short-name } 更新时重新安装。若要禁用此任务，请在 about:config 页面更新“default-browser-agent.enabled”首选项，或通过 { -brand-short-name } 企业策略设置“DisableDefaultBrowserAgent”。

default-browser-notification-privacy-header-text = 是否保持使用 { -brand-short-name }？
default-browser-notification-privacy-body-text = 您的默认浏览器已更改。建议您返回 { -brand-short-name }，以获得内置的隐私和保护功能。
default-browser-notification-yes-button-text = 是
default-browser-notification-privacy-no-button-text = 不，谢谢