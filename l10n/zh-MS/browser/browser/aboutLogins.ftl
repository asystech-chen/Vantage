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

fxaccounts-sign-in-text = 获得你的密码在你的其他的德维克（男子名、姓氏）
fxaccounts-sign-in-sync-button = 正负号在到同步的
fxaccounts-avatar-button =
  .title = 管理帐户

## The ⋯ menu that is in the top corner of the page

menu =
  .title = 打开菜单
# This menuitem is only visible on Windows and macOS
about-logins-menu-menuitem-import-from-another-browser = 引入从另外的浏览器…
about-logins-menu-menuitem-import-from-a-file = 引入从一个文件…

about-logins-menu-menuitem-export-logins2 = 导出密码…
about-logins-menu-menuitem-remove-all-logins2 = 移除所有的密码…

menu-menuitem-preferences =
  { PLATFORM() ->
      [windows] 选项
     *[other] 参数选择
  }
about-logins-menu-menuitem-help = 帮忙

## Login List

login-list =
  .aria-label = 注册(程序) 匹配搜索查询
# Variables
#   $count (number) - Number of logins
login-list-count2 =
  { $count ->
      [one] { $count } 密码
     *[other] { $count } 密码
  }
# Variables
#   $count (number) - Number of filtered logins
#   $total (number) - Total number of logins
login-list-filtered-count2 =
  { $total ->
      [one] { $count } 的 { $total } 密码
     *[other] { $count } 的 { $total } 密码
  }
login-list-sort-label-text = 种类由:
login-list-name-option = 名称 (一个-阻抗)
login-list-name-reverse-option = 名称 (阻抗-一个)
login-list-username-option = 由字母或数字组成的用户名称 (一个-阻抗)
login-list-username-reverse-option = 由字母或数字组成的用户名称 (阻抗-一个)
about-logins-login-list-alerts-option = 警觉的
login-list-last-changed-option = 最后的改良的
login-list-last-used-option = 最后的使用

login-list-intro-title2 = 无密码保存
login-list-intro-description = 何时你保存一个密码在 { -brand-product-name }, 它将显示向上的这里.

about-logins-login-list-empty-search-title2 = 无密码发现
about-logins-login-list-empty-search-description = 那里是无结果匹配你的搜索.

login-list-item-title-new-login2 = 添加密码

login-list-item-subtitle-missing-username = (无由字母或数字组成的用户名称)
about-logins-list-item-breach-icon =
  .title = 攻破( breach的现在分词 ) 网站（全球资讯网的主机站）
about-logins-list-item-vulnerable-password-icon =
  .title = 易受伤害的密码
about-logins-list-section-breach = 攻破( breach的现在分词 ) 网站（全球资讯网的主机站）
about-logins-list-section-vulnerable = 易受伤害的密码
about-logins-list-section-nothing = 无警报
about-logins-list-section-today = 今天
about-logins-list-section-yesterday = 昨天
about-logins-list-section-week = 最后的 7 一生

## Introduction screen

about-logins-login-intro-heading-message = 保存你的密码到一个保险箱污点
login-intro-description2 = 所有的密码你保存到 { -brand-product-name } 是加密. 正差, 我们看外面的为了裂口和警觉的你如果 you are 你（你们）是假装的. <a data-l10n-name="breach-alert-link">学习更多</a>
login-intro-instructions-fxa2 = 创建或正负号在到你的帐户在那装置哪里你的注册(程序) 是保存.
login-intro-instructions-fxa-settings = 去到设置 > 同步的 > 转弯在 syncing…选择那注册(程序) 和密码检验栏.
login-intro-instructions-fxa-passwords-help = 拜访 <a data-l10n-name="passwords-help-link">密码支持</a> 为了更多帮忙.
about-logins-intro-import3 = 选择那正差正负号按钮在上方到添加一个密码现在. 你能也 <a data-l10n-name="import-browser-link">引入密码从另外的浏览器</a> 或 <a data-l10n-name="import-file-link">从一个文件</a>.

## Login

# Header for adding a password
about-logins-login-item-new-login-title = 添加密码
login-item-edit-button = 编辑
about-logins-login-item-remove-button = 移除
login-item-origin-label = 网站（全球资讯网的主机站）地址
about-logins-origin-tooltip2 = Enter 那完整地址和确保它是一个精确的比较为了哪里你正负号在.
# Variables
#   $webTitle (String) - Website title of the password being changed.
about-logins-edit-password-tooltip = 确保 you are 你（你们）是保存你的当前的密码为了此站点. 更改那密码这里做不更改它与 { $webTitle }.
about-logins-add-password-tooltip = 确保 you are 你（你们）是保存你的当前的密码为了此站点.
login-item-origin =
  .placeholder = 超文本传输协议://全球信息网.例子.com
login-item-username-label = 由字母或数字组成的用户名称
about-logins-login-item-username =
  .placeholder = (无由字母或数字组成的用户名称)
login-item-copy-username-button-text = 复制
login-item-copied-username-button-text = 已复制的!
login-item-password-label = 密码
login-item-password-reveal-checkbox =
  .aria-label = 显示密码
login-item-password-conceal-checkbox =
  .aria-label = 隐藏密码
login-item-copy-password-button-text = 复制
login-item-copied-password-button-text = 已复制的!
about-logins-login-item-save-changes-button = 保存
login-item-save-new-button = 保存
login-item-cancel-button = 取消

## The date is displayed in a timeline showing the password evolution.
## A label is displayed under the date to describe the type of change.
## (e.g. updated, created, etc.)

# Variables
#   $datetime (date) - Event date
login-item-timeline-point-date = { DATETIME($datetime, day: "numeric", month: "short", year: "numeric") }
login-item-timeline-action-created = 创建
login-item-timeline-action-updated = 更新的
login-item-timeline-action-used = 使用

## OS Authentication dialog

about-logins-os-auth-dialog-caption = { -brand-full-name }

## The macOS strings are preceded by the operating system with "Firefox is trying to "
## and includes subtitle of "Enter password for the user "xxx" to allow this." These
## notes are only valid for English. Please test in your respected locale.

# The macOS strings are preceded by the operating system with "Firefox is trying to ".
# This message can be seen when attempting to disable osauth in about:preferences.
about-logins-os-auth-dialog-message=
  { PLATFORM() ->
    [macos] 更改那设置为了密码
    *[other] { -brand-short-name } 正尝试更改那设置为了密码. 使用你的装置正负号在到允许这.
  }

# This message can be seen when attempting to edit a login in about:logins on Windows.
about-logins-edit-login-os-auth-dialog-message2-win = 到编辑你的密码, 输入你的窗口注册(程序) 国书. 这帮忙防卫那安全的你的帐户.
# This message can be seen when attempting to edit a login in about:logins
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
about-logins-edit-login-os-auth-dialog-message2-macosx = 编辑那保存密码

# This message can be seen when attempting to reveal a password in about:logins on Windows.
about-logins-reveal-password-os-auth-dialog-message-win = 到查看你的密码, 输入你的窗口注册(程序) 国书. 这帮忙防卫那安全的你的帐户.
# This message can be seen when attempting to reveal a password in about:logins
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
about-logins-reveal-password-os-auth-dialog-message-macosx = 露出那保存密码

# This message can be seen when attempting to copy a password in about:logins on Windows.
about-logins-copy-password-os-auth-dialog-message-win = 到复制你的密码, 输入你的窗口注册(程序) 国书. 这帮忙防卫那安全的你的帐户.
# This message can be seen when attempting to copy a password in about:logins
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
about-logins-copy-password-os-auth-dialog-message-macosx = 复制那保存密码

# This message can be seen when attempting to export a password in about:logins on Windows.
about-logins-export-password-os-auth-dialog-message2-win = 到导出你的密码, 输入你的窗口注册(程序) 国书. 这帮忙防卫那安全的你的帐户.
# This message can be seen when attempting to export a password in about:logins
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
about-logins-export-password-os-auth-dialog-message2-macosx = 导出保存密码

## Primary Password notification

about-logins-primary-password-notification-message = 请输入你的初等量密码到查看保存注册(程序) & 密码
master-password-reload-button =
  .label = 日志在
  .accesskey = L

## Dialogs

confirmation-dialog-cancel-button = 取消
confirmation-dialog-dismiss-button =
  .title = 取消

# Title for modal to confirm the removal of one saved password
about-logins-confirm-delete-dialog-title = 移除密码?
# Message for modal to confirm the removal of one saved password
about-logins-confirm-delete-dialog-message = 你无法撤消此操作.
about-logins-confirm-remove-dialog-confirm-button = 移除

## Variables
##   $count (number) - Number of items

about-logins-confirm-remove-all-dialog-confirm-button-label =
  { $count ->
     [1] 移除
    *[other] 移除所有的
  }

# Checkbox for modal to confirm the removal of saved passwords
about-logins-confirm-remove-all-dialog-checkbox-label2 =
  { $count ->
     [1] 是, 移除密码
    *[other] 是, 移除密码
  }

# Title for modal to confirm the removal of all saved passwords when user is NOT synced
about-logins-confirm-remove-all-dialog-title2 =
  { $count ->
     [one] 移除 { $count } 密码?
    *[other] 移除所有的 { $count } 密码?
  }
# Message for modal to confirm the removal of saved passwords when user is NOT synced
about-logins-confirm-remove-all-dialog-message2 =
  { $count ->
     [1] 这将移除那密码保存到 { -brand-short-name } 和任何的裂口警觉的. 你无法撤消此操作.
    *[other] 这将移除那密码保存到 { -brand-short-name } 和任何的裂口警觉的. 你无法撤消此操作.
  }

# Title for modal to confirm the removal of all saved passwords when user IS SYNCED
about-logins-confirm-remove-all-sync-dialog-title2 =
  { $count ->
     [one] 移除 { $count } 密码从全部德维克（男子名、姓氏）?
    *[other] 移除所有的 { $count } 密码从全部德维克（男子名、姓氏）?
  }

# Message for modal to confirm the removal of saved passwords when user IS synced.
about-logins-confirm-remove-all-sync-dialog-message3 =
  { $count ->
    [1] 这将移除那密码保存到 { -brand-short-name } 在全部你的 synchronization 的缩略词德维克（男子名、姓氏）. 这将也移除任何的裂口警觉的那出现这里. 你无法撤消此操作.
    *[other] 这将移除所有的密码保存到 { -brand-short-name } 在全部你的 synchronization 的缩略词德维克（男子名、姓氏）. 这将也移除任何的裂口警觉的那出现这里. 你无法撤消此操作.
  }

##

about-logins-confirm-export-dialog-title2 = 一个笔记关于输出的密码
about-logins-confirm-export-dialog-message2 = 何时你导出, 你的密码是保存到一个文件与值得一读的电文.
    何时 you are 你（你们）是完成了的使用那文件, 我们推荐删除它如此其他的谁使用这装置不能看见你的密码.
about-logins-confirm-export-dialog-confirm-button2 = 继续与导出

about-logins-alert-import-message = 查看详细的引入摘要

confirm-discard-changes-dialog-title = 丢弃未获救的更改?
confirm-discard-changes-dialog-message = 所有的未获救的更改将是遗失.
confirm-discard-changes-dialog-confirm-button = 丢弃

## Breach Alert notification

about-logins-breach-alert-title = 网站（全球资讯网的主机站）裂口
breach-alert-text = 密码曾是漏的或 steal的过去分词从这网站（全球资讯网的主机站）自...以后你持续更新的你的注册(程序) 详细数据. 更改你的密码到防卫你的帐户.
about-logins-breach-alert-date = 这裂口发生（occur的过去分词）在 { DATETIME($date, day: "numeric", month: "long", year: "numeric") }
# Variables:
#   $hostname (String) - The hostname of the website associated with the login, e.g. "example.com"
about-logins-breach-alert-link = 去到 { $hostname }

## Vulnerable Password notification

about-logins-vulnerable-alert-title = 易受伤害的密码
about-logins-vulnerable-alert-text2 = 这密码有是使用在另外的帐户那曾是有可能的在一个资料裂口. 再用国书卖出选择权所有的你的帐户在冒险. 更改这密码.
# Variables:
#   $hostname (String) - The hostname of the website associated with the login, e.g. "example.com"
about-logins-vulnerable-alert-link = 去到 { $hostname }
about-logins-vulnerable-alert-learn-more-link = 学习更多

## Error Messages

# This is an error message that appears when a user attempts to save
# a new login that is identical to an existing saved login.
# Variables:
#   $loginTitle (String) - The title of the website associated with the login.
about-logins-error-message-duplicate-login-with-link = 一个登录项为了 { $loginTitle } 与那由字母或数字组成的用户名称已经存在. <a data-l10n-name="duplicate-link">去到现成的登录项?</a>

# This is a generic error message.
about-logins-error-message-default = 一个错误发生（occur的过去分词）一会儿尝试到保存这密码.

## Login Export Dialog

# Title of the file picker dialog
about-logins-export-file-picker-title2 = 导出密码从 { -brand-short-name }
# The default file name shown in the file picker when exporting saved logins.
# This must end in .csv
about-logins-export-file-picker-default-filename2 = 密码.csv
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
about-logins-import-file-picker-title2 = 引入密码到 { -brand-short-name }
about-logins-import-file-picker-import-button = 引入
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

about-logins-import-dialog-title = 引入完全的
about-logins-import-dialog-items-added2 =
  { $count ->
     *[other] <span>新的密码额外的:</span> <span data-l10n-name="count">{ $count }</span>
  }

about-logins-import-dialog-items-modified2 =
  { $count ->
     *[other] <span>现成的登录项更新的:</span> <span data-l10n-name="count">{ $count }</span>
  }

about-logins-import-dialog-items-no-change2 =
  { $count ->
     *[other] <span>复制登录项发现:</span> <span data-l10n-name="count">{ $count }</span> <span data-l10n-name="meta">(不输入)</span>
  }
about-logins-import-dialog-items-error =
  { $count ->
      *[other] <span>错误:</span> <span data-l10n-name="count">{ $count }</span> <span data-l10n-name="meta">(不输入)</span>
  }
about-logins-import-dialog-done = 完成了的

about-logins-import-dialog-error-title = 引入错误
about-logins-import-dialog-error-conflicting-values-title = 倍数冲突的对价值的看法为了一(个) 注册(程序)
about-logins-import-dialog-error-conflicting-values-description = 为了例子: 倍数 usernames, 密码, 资源定位符（Uniform Resource Locators）, 及其他. 为了一(个) 注册(程序).
about-logins-import-dialog-error-file-format-title = 文件开本发行
about-logins-import-dialog-error-file-format-description = 不正确的或不见的列页眉. 确保那文件包含列为了由字母或数字组成的用户名称, 密码和 URL.
about-logins-import-dialog-error-file-permission-title = 不能的到读取文件
about-logins-import-dialog-error-file-permission-description = { -brand-short-name } 做不有许可到读取那文件. 尝试更改那文件许可.
about-logins-import-dialog-error-unable-to-read-title = 不能的到分列文件
about-logins-import-dialog-error-unable-to-read-description = 确保你被选的一个 CSV 或 TSV 文件.
about-logins-import-dialog-error-no-logins-imported = 无注册(程序) 有是输入
about-logins-import-dialog-error-learn-more = 学习更多
about-logins-import-dialog-error-try-import-again = 尝试引入再一次…
about-logins-import-dialog-error-cancel = 取消

about-logins-import-report-title = 引入摘要
about-logins-import-report-description2 = 密码输入到 { -brand-short-name }.

#
# Variables:
#  $number (number) - The number of the row
about-logins-import-report-row-index = 行 { $number }
about-logins-import-report-row-description-no-change2 = 复制: 精确的比较的现成的登录项
about-logins-import-report-row-description-modified2 = 现成的登录项更新的
about-logins-import-report-row-description-added2 = 新的密码额外的
about-logins-import-report-row-description-error = 错误: 不见的域

##
## Variables:
##  $field (String) - The name of the field from the CSV file for example url, username or password

about-logins-import-report-row-description-error-multiple-values = 错误: 倍数对价值的看法为了 { $field }
about-logins-import-report-row-description-error-missing-field = 错误: 不见的 { $field }

##
## Variables:
##  $count (number) - The number of affected elements

about-logins-import-report-added2 =
  { $count ->
      *[other] <div data-l10n-name="count">{ $count }</div> <div data-l10n-name="details">新的密码额外的</div>
  }
about-logins-import-report-modified2 =
  { $count ->
      *[other] <div data-l10n-name="count">{ $count }</div> <div data-l10n-name="details">现成的登录项更新的</div>
  }
about-logins-import-report-no-change2 =
  { $count ->
      *[other] <div data-l10n-name="count">{ $count }</div> <div data-l10n-name="details">复制登录项</div> <div data-l10n-name="not-imported">(不输入)</div>
  }
about-logins-import-report-error =
  { $count ->
      *[other] <div data-l10n-name="count">{ $count }</div> <div data-l10n-name="details">错误</div> <div data-l10n-name="not-imported">(不输入)</div>
  }

## Logins import report page

about-logins-import-report-page-title = 引入摘要报告
