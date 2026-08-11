# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# The question portion of the following message should have the <strong> and </strong> tags surrounding it.
default-browser-notification-message = <strong>将 { -brand-short-name } 设置为您的主浏览器？</strong> 在您使用网络时，获取快速、安全且私密的浏览体验。
default-browser-notification-button =
    .label = 设为默认
    .accesskey = S

## These strings are used for the default browser prompt. There are 2 variations
## depending on the operating system (Windows vs other). The checkbox label and
## secondary button are shared between the variants.

default-browser-prompt-title-pin = 将 { -brand-short-name } 设为您的主浏览器？
default-browser-prompt-message-pin = 让 { -brand-short-name } 始终触手可及——请将其设为您的主浏览器，并将其固定到您的任务栏。
default-browser-prompt-message-pin-msix = 让 { -brand-short-name } 始终触手可及——请将其设为您的主浏览器，并将其固定到您的任务栏和开始菜单。
default-browser-prompt-message-pin-mac = 让 { -brand-short-name } 始终触手可及——请将其设为您的主浏览器，并将其保留在您的 Dock 中。
default-browser-prompt-button-primary-set = 设为主浏览器
default-browser-prompt-title-alt = 将 { -brand-short-name } 设为您的主浏览器？
default-browser-prompt-message-alt = 在您每次浏览时，均能获得速度、安全性和隐私保护。
default-browser-prompt-button-primary-alt = 设为主浏览器
default-browser-prompt-checkbox-not-again-label = 请勿再次显示此消息
default-browser-prompt-button-secondary = 暂不执行

## Strings for a Windows native guidance notification when the user is forced to
## use Windows Settings to set the default browser. Instructions differ for
## Windows 10 and 11.

default-browser-guidance-notification-title = 完成将 { -brand-short-name } 设为您的默认浏览器
# Quoted text are keywords to look for in the Windows Settings app.
default-browser-guidance-notification-body-instruction-win10 =
    步骤 1：转到“设置”>“默认应用”
    步骤 2：向下滚动到“Web 浏览器”
    步骤 3：选择并指定 { -brand-short-name }
# Quoted text are keywords to look for in the Windows Settings app.
default-browser-guidance-notification-body-instruction-win11 =
    步骤 1：转到“设置”>“默认应用”
    步骤 2：为 { -brand-short-name } 选择“设为默认”
default-browser-guidance-notification-info-page = 向我显示具体操作
default-browser-guidance-notification-dismiss = 已完成

default-browser-guidance-notification-v2-title = 完成将 { -brand-short-name } 设为您的默认浏览器
default-browser-guidance-notification-v2-body = 在“设置”中，请为 { -brand-short-name } 选择“设为默认”。

default-browser-guidance-notification-v2-title-only = 请在“设置”中完成将 { -brand-short-name } 设为您的默认浏览器