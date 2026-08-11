# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# NOTE: New strings should use the about-logins- prefix.

about-logins-page-title-name = 密码

about-logins-login-filter2 =
  .placeholder = 搜索密码
  .key = F

create-login-button =
  .title = 添加密码

fxaccounts-sign-in-text = 在您的其他设备上获取您的密码
fxaccounts-sign-in-sync-button = 登录以同步
fxaccounts-avatar-button =
  .title = 管理账户

## The ⋯ menu that is in the top corner of the page

menu =
  .title = 打开菜单
# This menuitem is only visible on Windows and macOS
about-logins-menu-menuitem-import-from-another-browser = 从其他浏览器导入…
about-logins-menu-menuitem-import-from-a-file = 从文件导入…

about-logins-menu-menuitem-export-logins2 = 导出密码…
about-logins-menu-menuitem-remove-all-logins2 = 移除所有密码…

menu-menuitem-preferences =
  { PLATFORM() ->
      [windows] 选项
     *[other] 首选项
  }
about-logins-menu-menuitem-help = 帮助

## Login List

login-list =
  .aria-label = 与搜索查询匹配的登录信息
# Variables
#   $count (number) - Number of logins
login-list-count2 =
  { $count ->
      [one] { $count } 个密码
     *[other] { $count } 个密码
  }
# Variables
#   $count (number) - Number of filtered logins
#   $total (number) - Total number of logins
login-list-filtered-count2 =
  { $total ->
      [one] { $count } 个（共 { $total } 个）密码
     *[other] { $count } 个（共 { $total } 个）密码
  }
login-list-sort-label-text = 排序方式：
login-list-name-option = 名称（A-Z）
login-list-name-reverse-option = 名称（Z-A）
login-list-username-option = 用户名（A-Z）
login-list-username-reverse-option = 用户名（Z-A）
about-logins-login-list-alerts-option = 警报
login-list-last-changed-option = 上次修改
login-list-last-used-option = 上次使用

login-list-intro-title2 = 未保存密码
login-list-intro-description = 当您在 { -brand-product-name } 中保存密码时，它将显示在此处。

about-logins-login-list-empty-search-title2 = 未找到密码
about-logins-login-list-empty-search-description = 不存在与您的搜索匹配的结果。

login-list-item-title-new-login2 = 添加密码

login-list-item-subtitle-missing-username = （无用户名）
about-logins-list-item-breach-icon =
  .title = 已泄露的网站
about-logins-list-item-vulnerable-password-icon =
  .title = 易受攻击的密码
about-logins-list-section-breach = 已泄露的网站
about-logins-list-section-vulnerable = 易受攻击的密码
about-logins-list-section-nothing = 无警报
about-logins-list-section-today = 今天
about-logins-list-section-yesterday = 昨天
about-logins-list-section-week = 最近 7 天

## Introduction screen

about-logins-login-intro-heading-message = 将您的密码保存到安全位置
login-intro-description2 = 您保存到 { -brand-product-name } 的所有密码均已加密。此外，我们还会监测泄露事件，并在您受影响时向您发出警报。<a data-l10n-name="breach-alert-link">了解更多</a>
login-intro-instructions-fxa2 = 请在保存您的登录信息的设备上创建或登录您的账户。
login-intro-instructions-fxa-settings = 请转到设置 > 同步 > 开启同步… 并选中“登录信息和密码”复选框。
login-intro-instructions-fxa-passwords-help = 请访问<a data-l10n-name="passwords-help-link">密码支持</a>以获取更多帮助。
about-logins-intro-import3 = 请选择上方的加号按钮以立即添加密码。您还可以<a data-l10n-name="import-browser-link">从其他浏览器导入密码</a>或<a data-l10n-name="import-file-link">从文件导入</a>。

## Login

# Header for adding a password
about-logins-login-item-new-login-title = 添加密码
login-item-edit-button = 编辑
about-logins-login-item-remove-button = 移除
login-item-origin-label = 网站地址
about-logins-origin-tooltip2 = 请输入完整地址，并确保它与您登录的网站完全匹配。
# Variables
#   $webTitle (String) - Website title of the password being changed.
about-logins-edit-password-tooltip = 请确保您正在为该网站保存您当前的密码。在此处更改密码不会更改 { $webTitle } 上的密码。
about-logins-add-password-tooltip = 请确保您正在为该网站保存您当前的密码。
login-item-origin =
  .placeholder = https://www.example.com
login-item-username-label = 用户名
about-logins-login-item-username =
  .placeholder = （无用户名）
login-item-copy-username-button-text = 复制
login-item-copied-username-button-text = 已复制！
login-item-password-label = 密码
login-item-password-reveal-checkbox =
  .aria-label = 显示密码
login-item-password-conceal-checkbox =
  .aria-label = 隐藏密码
login-item-copy-password-button-text = 复制
login-item-copied-password-button-text = 已复制！
about-logins-login-item-save-changes-button = 保存
login-item-save-new-button = 保存
login-item-cancel-button = 取消

## The date is displayed in a timeline showing the password evolution.
## A label is displayed under the date to describe the type of change.
## (e.g. updated, created, etc.)

# Variables
#   $datetime (date) - Event date
login-item-timeline-point-date = { DATETIME($datetime, day: "numeric", month: "short", year: "numeric") }
login-item-timeline-action-created = 已创建
login-item-timeline-action-updated = 已更新
login-item-timeline-action-used = 已使用

## OS Authentication dialog

about-logins-os-auth-dialog-caption = { -brand-full-name }

## The macOS strings are preceded by the operating system with "Firefox is trying to "
## and includes subtitle of "Enter password for the user "xxx" to allow this." These
## notes are only valid for English. Please test in your respected locale.

# The macOS strings are preceded by the operating system with "Firefox is trying to ".
# This message can be seen when attempting to disable osauth in about:preferences.
about-logins-os-auth-dialog-message=
  { PLATFORM() ->
    [macos] 更改密码设置
    *[other] { -brand-short-name } 正在尝试更改密码设置。请使用您的设备登录以允许此操作。
  }

# This message can be seen when attempting to edit a login in about:logins on Windows.
about-logins-edit-login-os-auth-dialog-message2-win = 要编辑您的密码，请输入您的 Windows 登录凭据。此操作有助于保护您账户的安全性。
# This message can be seen when attempting to edit a login in about:logins
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
about-logins-edit-login-os-auth-dialog-message2-macosx = 编辑已保存的密码

# This message can be seen when attempting to reveal a password in about:logins on Windows.
about-logins-reveal-password-os-auth-dialog-message-win = 要查看您的密码，请输入您的 Windows 登录凭据。此操作有助于保护您账户的安全性。
# This message can be seen when attempting to reveal a password in about:logins
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
about-logins-reveal-password-os-auth-dialog-message-macosx = 显示已保存的密码

# This message can be seen when attempting to copy a password in about:logins on Windows.
about-logins-copy-password-os-auth-dialog-message-win = 要复制您的密码，请输入您的 Windows 登录凭据。此操作有助于保护您账户的安全性。
# This message can be seen when attempting to copy a password in about:logins
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
about-logins-copy-password-os-auth-dialog-message-macosx = 复制已保存的密码

# This message can be seen when attempting to export a password in about:logins on Windows.
about-logins-export-password-os-auth-dialog-message2-win = 要导出您的密码，请输入您的 Windows 登录凭据。此操作有助于保护您账户的安全性。
# This message can be seen when attempting to export a password in about:logins
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
about-logins-export-password-os-auth-dialog-message2-macosx = 导出已保存的密码

## Primary Password notification

about-logins-primary-password-notification-message = 请输入您的主密码以查看已保存的登录信息与密码
master-password-reload-button =
  .label = 登录
  .accesskey = L

## Dialogs

confirmation-dialog-cancel-button = 取消
confirmation-dialog-dismiss-button =
  .title = 取消

# Title for modal to confirm the removal of one saved password
about-logins-confirm-delete-dialog-title = 移除密码？
# Message for modal to confirm the removal of one saved password
about-logins-confirm-delete-dialog-message = 您无法撤消此操作。
about-logins-confirm-remove-dialog-confirm-button = 移除

## Variables
##   $count (number) - Number of items

about-logins-confirm-remove-all-dialog-confirm-button-label =
  { $count ->
     [1] 移除
    *[other] 全部移除
  }

# Checkbox for modal to confirm the removal of saved passwords
about-logins-confirm-remove-all-dialog-checkbox-label2 =
  { $count ->
     [1] 是，移除密码
    *[other] 是，移除密码
  }

# Title for modal to confirm the removal of all saved passwords when user is NOT synced
about-logins-confirm-remove-all-dialog-title2 =
  { $count ->
     [one] 移除 { $count } 个密码？
    *[other] 移除全部 { $count } 个密码？
  }
# Message for modal to confirm the removal of saved passwords when user is NOT synced
about-logins-confirm-remove-all-dialog-message2 =
  { $count ->
     [1] 此操作将移除已保存至 { -brand-short-name } 的密码及所有泄露警报。您无法撤消此操作。
    *[other] 此操作将移除已保存至 { -brand-short-name } 的所有密码及所有泄露警报。您无法撤消此操作。
  }

# Title for modal to confirm the removal of all saved passwords when user IS SYNCED
about-logins-confirm-remove-all-sync-dialog-title2 =
  { $count ->
     [one] 从所有设备移除 { $count } 个密码？
    *[other] 从所有设备移除全部 { $count } 个密码？
  }

# Message for modal to confirm the removal of saved passwords when user IS synced.
about-logins-confirm-remove-all-sync-dialog-message3 =
  { $count ->
    [1] 此操作将从您所有已同步设备上的 { -brand-short-name } 中移除已保存的密码。此操作还将移除此处显示的所有泄露警报。您无法撤消此操作。
    *[other] 此操作将从您所有已同步设备上的 { -brand-short-name } 中移除所有已保存的密码。此操作还将移除此处显示的所有泄露警报。您无法撤消此操作。
  }

##

about-logins-confirm-export-dialog-title2 = 关于导出密码的注意事项
about-logins-confirm-export-dialog-message2 = 当您执行导出操作时，您的密码将被保存至一个包含可读文本的文件中。
    当您完成对该文件的使用后，建议您删除该文件，以便其他使用此设备的用户无法查看您的密码。
about-logins-confirm-export-dialog-confirm-button2 = 继续执行导出操作

about-logins-alert-import-message = 查看详细的导入摘要

confirm-discard-changes-dialog-title = 是否放弃未保存的更改？
confirm-discard-changes-dialog-message = 所有未保存的更改都将丢失。
confirm-discard-changes-dialog-confirm-button = 放弃更改

## Breach Alert notification

about-logins-breach-alert-title = 网站泄露
breach-alert-text = 自您上次更新登录信息以来，此网站的密码已被泄露或窃取。请更改您的密码以保护您的账户。
about-logins-breach-alert-date = 此泄露事件发生于 { DATETIME($date, day: "numeric", month: "long", year: "numeric") }
# Variables:
#   $hostname (String) - The hostname of the website associated with the login, e.g. "example.com"
about-logins-breach-alert-link = 前往 { $hostname }

## Vulnerable Password notification

about-logins-vulnerable-alert-title = 存在风险的密码
about-logins-vulnerable-alert-text2 = 此密码已用于另一个可能涉及数据泄露的账户。重用凭据将使您的所有账户面临风险。请更改此密码。
# Variables:
#   $hostname (String) - The hostname of the website associated with the login, e.g. "example.com"
about-logins-vulnerable-alert-link = 前往 { $hostname }
about-logins-vulnerable-alert-learn-more-link = 了解更多信息

## Error Messages

# This is an error message that appears when a user attempts to save
# a new login that is identical to an existing saved login.
# Variables:
#   $loginTitle (String) - The title of the website associated with the login.
about-logins-error-message-duplicate-login-with-link = 已存在针对 { $loginTitle } 且具有该用户名的条目。<a data-l10n-name="duplicate-link">是否前往现有条目？</a>

# This is a generic error message.
about-logins-error-message-default = 在尝试保存此密码时发生了错误。

## Login Export Dialog

# Title of the file picker dialog
about-logins-export-file-picker-title2 = 从 { -brand-short-name } 导出密码
# The default file name shown in the file picker when exporting saved logins.
# This must end in .csv
about-logins-export-file-picker-default-filename2 = passwords.csv
about-logins-export-file-picker-export-button = 导出
# A description for the .csv file format that may be shown as the file type
# filter by the operating system.
about-logins-export-file-picker-csv-filter-title =
  { PLATFORM() ->
      [macos] CSV 文档
     *[other] CSV 文件
  }

## Login Import Dialog

# Title of the file picker dialog
about-logins-import-file-picker-title2 = 导入密码至 { -brand-short-name }
about-logins-import-file-picker-import-button = 导入
# A description for the .csv file format that may be shown as the file type
# filter by the operating system.
about-logins-import-file-picker-csv-filter-title =
  { PLATFORM() ->
      [macos] CSV 文档
     *[other] CSV 文件
  }
# A description for the .tsv file format that may be shown as the file type
# filter by the operating system. TSV is short for 'tab separated values'.
about-logins-import-file-picker-tsv-filter-title =
  { PLATFORM() ->
      [macos] TSV 文档
     *[other] TSV 文件
  }

##
## Variables:
##  $count (number) - The number of affected elements

about-logins-import-dialog-title = 导入操作已完成
about-logins-import-dialog-items-added2 =
  { $count ->
     *[other] <span>新增的密码数量：</span> <span data-l10n-name="count">{ $count }</span>
  }

about-logins-import-dialog-items-modified2 =
  { $count ->
     *[other] <span>已更新的现有条目数量：</span> <span data-l10n-name="count">{ $count }</span>
  }

about-logins-import-dialog-items-no-change2 =
  { $count ->
     *[other] <span>发现的重复条目数量：</span> <span data-l10n-name="count">{ $count }</span> <span data-l10n-name="meta">（未导入）</span>
  }
about-logins-import-dialog-items-error =
  { $count ->
      *[other] <span>错误数量：</span> <span data-l10n-name="count">{ $count }</span> <span data-l10n-name="meta">（未导入）</span>
  }
about-logins-import-dialog-done = 完成

about-logins-import-dialog-error-title = 导入错误
about-logins-import-dialog-error-conflicting-values-title = 单个登录条目存在多个冲突值
about-logins-import-dialog-error-conflicting-values-description = 例如：一个登录条目包含多个用户名、密码或URL等。
about-logins-import-dialog-error-file-format-title = 文件格式问题
about-logins-import-dialog-error-file-format-description = 列标题不正确或缺失。请确保文件包含用户名、密码和URL列。
about-logins-import-dialog-error-file-permission-title = 无法读取文件
about-logins-import-dialog-error-file-permission-description = { -brand-short-name } 不具备读取该文件的权限。请尝试更改文件权限。
about-logins-import-dialog-error-unable-to-read-title = 无法解析文件
about-logins-import-dialog-error-unable-to-read-description = 请确保您选择了CSV或TSV格式的文件。
about-logins-import-dialog-error-no-logins-imported = 未导入任何登录信息
about-logins-import-dialog-error-learn-more = 了解更多信息
about-logins-import-dialog-error-try-import-again = 再次尝试导入…
about-logins-import-dialog-error-cancel = 取消

about-logins-import-report-title = 导入摘要
about-logins-import-report-description2 = 已导入至 { -brand-short-name } 的密码。

#
# Variables:
#  $number (number) - The number of the row
about-logins-import-report-row-index = 行 { $number }
about-logins-import-report-row-description-no-change2 = 重复项：与现有条目完全匹配
about-logins-import-report-row-description-modified2 = 现有条目已更新
about-logins-import-report-row-description-added2 = 新密码已添加
about-logins-import-report-row-description-error = 错误：缺少字段

##
## Variables:
##  $field (String) - The name of the field from the CSV file for example url, username or password

about-logins-import-report-row-description-error-multiple-values = 错误：{ $field } 存在多个值
about-logins-import-report-row-description-error-missing-field = 错误：缺少 { $field }

##
## Variables:
##  $count (number) - The number of affected elements

about-logins-import-report-added2 =
  { $count ->
      *[other] <div data-l10n-name="count">{ $count }</div> <div data-l10n-name="details">新密码已添加</div>
  }
about-logins-import-report-modified2 =
  { $count ->
      *[other] <div data-l10n-name="count">{ $count }</div> <div data-l10n-name="details">现有条目已更新</div>
  }
about-logins-import-report-no-change2 =
  { $count ->
      *[other] <div data-l10n-name="count">{ $count }</div> <div data-l10n-name="details">重复条目</div> <div data-l10n-name="not-imported">（未导入）</div>
  }
about-logins-import-report-error =
  { $count ->
      *[other] <div data-l10n-name="count">{ $count }</div> <div data-l10n-name="details">错误</div> <div data-l10n-name="not-imported">（未导入）</div>
  }

## Logins import report page

about-logins-import-report-page-title = 导入摘要报告