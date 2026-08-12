# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

contextual-manager-filter-input =
  .placeholder = 搜索密码
  .key = F
  .aria-label = 搜索密码

contextual-manager-menu-more-options-button =
  .title = 更多选项

contextual-manager-more-options-popup =
  .aria-label = 更多选项

## Passwords

contextual-manager-passwords-title = 密码
contextual-manager-passwords-command-create = 添加密码
contextual-manager-passwords-command-import-from-browser = 引入从另外的浏览器…
contextual-manager-passwords-command-import = 引入从一个文件…
contextual-manager-passwords-command-export = 导出密码
contextual-manager-passwords-command-remove-all = 移除所有的密码
contextual-manager-passwords-command-options = 选项
contextual-manager-passwords-command-help = 帮忙

contextual-manager-passwords-os-auth-dialog-caption = { -brand-full-name }

# This message can be seen when attempting to export a password in about:logins on Windows.
contextual-manager-passwords-export-os-auth-dialog-message-win = 到导出你的密码, 输入你的窗口注册(程序) 国书. 这帮忙防卫那安全的你的帐户.
# This message can be seen when attempting to export a password in about:logins
# The macOS strings are preceded by the operating system with "Firefox is trying to "
# and includes subtitle of "Enter password for the user "xxx" to allow this." These
# notes are only valid for English. only provide the reason that account verification is needed. Do not put a complete sentence here.
contextual-manager-passwords-export-os-auth-dialog-message-macosx = 导出保存密码

# This message can be seen when attempting to reveal a password in contextual password manager on Windows
contextual-manager-passwords-reveal-password-os-auth-dialog-message-win = 到查看你的密码, 输入你的窗口注册(程序) 国书. 这帮忙防卫那安全的你的帐户.
# The MacOS string is preceded by the operating system with "Firefox is trying to ".
# Only provide the reason that account verification is needed. Do not put a complete sentence here.
contextual-manager-passwords-reveal-password-os-auth-dialog-message-macosx = 露出那保存密码


# This message can be seen when attempting to edit a login in contextual password manager on Windows.
contextual-manager-passwords-edit-password-os-auth-dialog-message-win = 到编辑你的密码, 输入你的窗口注册(程序) 国书. 这帮忙防卫那安全的你的帐户.
# The MacOS string is preceded by the operating system with "Firefox is trying to ".
# On MacOS, only provide the reason that account verification is needed. Do not put a complete sentence here.
contextual-manager-passwords-edit-password-os-auth-dialog-message-macosx = 编辑那保存密码


# This message can be seen when attempting to copy a password in contextual password manager on Windows.
contextual-manager-passwords-copy-password-os-auth-dialog-message-win = 到复制你的密码, 输入你的窗口注册(程序) 国书. 这帮忙防卫那安全的你的帐户.
# The MacOS string is preceded by the operating system with "Firefox is trying to ".
# Only provide the reason that account verification is needed. Do not put a complete sentence here.
contextual-manager-passwords-copy-password-os-auth-dialog-message-macosx = 复制那保存密码

contextual-manager-passwords-import-file-picker-title = 引入密码
contextual-manager-passwords-import-file-picker-import-button = 引入

# A description for the .csv file format that may be shown as the file type
# filter by the operating system.
contextual-manager-passwords-import-file-picker-csv-filter-title =
  { PLATFORM() ->
      [macos] CSV 文档
     *[other] CSV 文件
  }
# A description for the .tsv file format that may be shown as the file type
# filter by the operating system. TSV is short for 'tab separated values'.
contextual-manager-passwords-import-file-picker-tsv-filter-title =
  { PLATFORM() ->
      [macos] TSV 文档
     *[other] TSV 文件
  }

contextual-manager-passwords-import-success-heading =
  .heading = 密码输入

# Variables
#   $added (number) - Number of added passwords
#   $modified (number) - Number of modified passwords
#   $no_change (number) - Number of duplicate passwords
#   $error (number) - Number of invalid passwords
contextual-manager-passwords-import-success-message-2 = 新的: { $added }, 更新的: { $modified }, 完全一样的东西: { $no_change }, 错误: { $error }

contextual-manager-passwords-import-detailed-report = 查看详细的报告
contextual-manager-passwords-import-success-button = 完成了的

contextual-manager-passwords-import-error-heading-and-message =
  .heading = (=could not)不能引入密码
  .message = 确保你的文件包含一个列为了网站（全球资讯网的主机站）, usernames, 和密码.
contextual-manager-passwords-import-error-button-try-again = 尝试再一次
contextual-manager-passwords-import-error-button-cancel = 取消
contextual-manager-passwords-import-learn-more = 学习关于导入密码

contextual-manager-passwords-export-success-heading =
  .heading = 密码出口
contextual-manager-passwords-export-success-button = 完成了的

# Export passwords to file dialog
contextual-manager-export-passwords-dialog-title = 导出密码到文件?
# This string recommends to the user that they delete the exported password file that is saved on their local machine.
contextual-manager-export-passwords-dialog-message = 在...之后你导出, 我们推荐删除它如此其他的谁可以使用这装置不能看见你的密码.
contextual-manager-export-passwords-dialog-confirm-button = 继续与导出

# Title of the file picker dialog
contextual-manager-passwords-export-file-picker-title = 导出密码从 { -brand-short-name }
# The default file name shown in the file picker when exporting saved logins.
# The resultant filename will end in .csv (added in code).
contextual-manager-passwords-export-file-picker-default-filename = 密码
contextual-manager-passwords-export-file-picker-export-button = 导出
# A description for the .csv file format that may be shown as the file type
# filter by the operating system.
contextual-manager-passwords-export-file-picker-csv-filter-title =
  { PLATFORM() ->
      [macos] CSV 文档
     *[other] CSV 文件
  }

# Confirm the removal of all saved passwords
#   $total (number) - Total number of passwords
contextual-manager-passwords-remove-all-title =
  { $total ->
     [1] 移除密码?
    *[other] 移除所有的 { $total } 密码?
  }

# Checkbox label to confirm the removal of saved passwords
#   $total (number) - Total number of passwords
contextual-manager-passwords-remove-all-confirm =
  { $total ->
     [1] 是, 移除密码
    *[other] 是, 移除密码
  }

# Button label to confirm removal of saved passwords
#   $total (number) - Total number of passwords
contextual-manager-passwords-remove-all-confirm-button =
  { $total ->
     [1] 移除
    *[other] 移除所有的
  }

# Message to confirm the removal of all saved passwords when user DOES NOT HAVE SYNC
#   $total (number) - Total number of passwords
contextual-manager-passwords-remove-all-message =
  { $total ->
     [1] 这将移除你的密码保存到 { -brand-short-name } 和任何的裂口警觉的. 你无法撤消此操作.
    *[other] 这将移除那密码保存到 { -brand-short-name } 和任何的裂口警觉的. 你无法撤消此操作.
  }

# Message for modal to confirm the removal of all saved passwords when user HAS SYNC
#   $total (number) - Total number of passwords
contextual-manager-passwords-remove-all-message-sync =
  { $total ->
     [1] 这将移除那密码保存到 { -brand-short-name } 在全部你的 synchronization 的缩略词德维克（男子名、姓氏）和移除任何的裂口警觉的. 你无法撤消此操作.
    *[other] 这将移除所有的密码保存到 { -brand-short-name } 在全部你的 synchronization 的缩略词德维克（男子名、姓氏）和移除任何的裂口警觉的. 你无法撤消此操作.
  }

contextual-manager-passwords-origin-label = 网站（全球资讯网的主机站）
# The attribute .data-after describes the text that should be displayed for the ::after pseudo-selector
contextual-manager-passwords-username-label = 由字母或数字组成的用户名称
  .data-after = 已复制的
# The attribute .data-after describes the text that should be displayed for the ::after pseudo-selector
contextual-manager-passwords-password-label = 密码
  .data-after = 已复制的

contextual-manager-passwords-radiogroup-label =
  .aria-label = 过滤器密码

# Variables
#   $url (string) - The url associated with the new login
contextual-manager-passwords-add-password-success-heading =
  .heading = 密码额外的为了 { $url }
contextual-manager-passwords-add-password-success-button = 查看

# Variables
#   $url (string) - The url associated with the existing login
contextual-manager-passwords-password-already-exists-error-heading =
  .heading = 一个密码和由字母或数字组成的用户名称为了 { $url } 已经存在
contextual-manager-passwords-password-already-exists-error-button = 去到密码

contextual-manager-passwords-update-password-success-heading =
  .heading = 密码保存
contextual-manager-passwords-update-password-success-button = 完成了的

contextual-manager-passwords-update-username-success-heading-3 =
  .heading = 由字母或数字组成的用户名称保存

# Message to confirm successful removal of a password/passwords.
#   $total (number) - Total number of passwords
contextual-manager-passwords-delete-password-success-heading =
  .heading =
    { $total ->
      [1] 密码离开的
      *[other] 密码离开的
    }
contextual-manager-passwords-delete-password-success-button = 完成了的
#
# Radiobutton label to display total number of passwords
#   $total (number) - Total number of passwords
contextual-manager-passwords-radiobutton-all = 所有的 ({ $total })

# Radiobutton label to display total number of alerts
#   $total (number) - Total number of alerts
contextual-manager-passwords-radiobutton-alerts = 警觉的 ({ $total })

# This message is displayed to make sure that a user wants to delete an existing login.
contextual-manager-passwords-remove-login-card-title = 移除密码?
# This message warns the user that deleting a login is permanent.
contextual-manager-passwords-remove-login-card-message = 你不能撤消这.
# This message gives the user an option to go back to the edit login form.
contextual-manager-passwords-remove-login-card-back-message = 后面的
# This message confirms that the user wants to remove an existing login.
contextual-manager-passwords-remove-login-card-remove-button = 移除
# This message gives the user the option to cancel their attempt to remove a login.
contextual-manager-passwords-remove-login-card-cancel-button = 取消

contextual-manager-passwords-alert-card =
  .aria-label = 密码警觉的
contextual-manager-passwords-alert-back-button =
  .label = 后面的
contextual-manager-passwords-alert-list =
  .aria-label = 警觉的列表

contextual-manager-passwords-breached-origin-heading-and-message =
  .heading = 密码更改被推荐的
  .message = 密码从这网站（全球资讯网的主机站）曾是报告的 steal的过去分词或漏的. 更改你的密码到防卫你的帐户.
contextual-manager-passwords-breached-origin-link-message = 如何做 { -brand-product-name } 知道关于裂口?
contextual-manager-passwords-change-password-button = 更改密码

contextual-manager-passwords-vulnerable-password-heading-and-message =
  .heading = 密码更改被推荐的
  .message = 这密码是容易地可猜测的. 更改你的密码到防卫你的帐户.
contextual-manager-passwords-vulnerable-password-link-message = 如何做 { -brand-product-name } 知道关于不牢固的密码?

contextual-manager-passwords-no-username-heading-and-message =
  .heading = 添加一个由字母或数字组成的用户名称
  .message = 添加一(个) 到正负号在加快.
contextual-manager-passwords-add-username-button = 添加由字母或数字组成的用户名称

## Login Form

contextual-manager-passwords-create-label =
  .label = 添加密码

contextual-manager-passwords-update-label =
  .label = 更新密码
contextual-manager-passwords-remove-label =
  .title = 移除密码
contextual-manager-passwords-origin-tooltip = Enter 那精确的地址哪里 (=you will 正负号在到此站点.
contextual-manager-passwords-username-tooltip = Enter 那由字母或数字组成的用户名称, 电子信函地址, 或帐户数字你使用到正负号在.
contextual-manager-passwords-password-tooltip-2 = Enter 那密码到正负号在到这帐户.

## Password Card

contextual-manager-passwords-list-label =
  .aria-label = 密码

contextual-manager-website-icon =
  .alt = 网站（全球资讯网的主机站）像标
contextual-manager-copy-icon =
  .alt = 复制
contextual-manager-check-icon-username =
  .alt = 已复制的
contextual-manager-check-icon-password =
  .alt = 已复制的
contextual-manager-alert-icon =
  .alt = 警告

# Variables
#   $url (string) - The url associated with the login
contextual-manager-origin-login-line =
  .aria-label = 拜访 { $url }
  .title = 拜访 { $url }
# "(Warning)" indicates that a login's origin field has an alert icon.
# Variables
#   $url (string) - The url associated with the login
contextual-manager-origin-login-line-with-alert =
  .aria-label = 拜访 { $url } (警告)
  .title = 拜访 { $url } (警告)
# Variables
#   $username (string) - The username associated with the login
contextual-manager-username-login-line =
  .aria-label = 复制由字母或数字组成的用户名称 { $username }
  .title = 复制由字母或数字组成的用户名称 { $username }
# "(Warning)" indicates that a login's username field has an alert icon.
# Variables
#   $username (string) - The username associated with the login
contextual-manager-username-login-line-with-alert =
  .aria-label = 复制由字母或数字组成的用户名称 { $username } (警告)
  .title = 复制由字母或数字组成的用户名称 { $username } (警告)
contextual-manager-password-login-line =
  .aria-label = 复制密码
  .title = 复制密码
# "(Warning)" indicates that a login's password field has an alert icon.
contextual-manager-password-login-line-with-alert =
  .aria-label = 复制密码 (警告)
  .title = 复制密码 (警告)
contextual-manager-edit-login-button = 编辑
  .tooltiptext = 编辑密码
# Variables
#   $count (number) - The number of active alerts associated with the login
contextual-manager-view-alert-heading-2 =
  .heading =
    { $count ->
      [1] 查看警觉的
     *[other] 查看警觉的
    }
# Variables
#   $count (number) - The number of active alerts associated with the login
contextual-manager-view-alert-button-2 =
  .tooltiptext =
    { $count ->
      [1] 检讨警觉的
     *[other] 检讨警觉的
    }

contextual-manager-show-password-button =
  .aria-label = 显示密码
  .title = 显示密码
contextual-manager-hide-password-button =
  .aria-label = 隐藏密码
  .title = 隐藏密码

# The message displayed when the search text does not match any of the user's saved logins.
contextual-manager-passwords-no-passwords-found-header =
  .heading = 无密码发现
contextual-manager-passwords-no-passwords-found-message-2 = 尝试一个不同的检索词和搜索再一次.

## When the user has no saved passwords, we display the following messages to inform the user they can save
## their passwords safely and securely in Firefox:

# This string encourages the user to save their passwords in Firefox (the "safe spot").
contextual-manager-passwords-no-passwords-header-2 = 保存你的密码到一个保险箱污点
# This string informs that we (Firefox) store all passwords securely and will notify them of any breaches and alerts their
# passwords may be involved in.
contextual-manager-passwords-no-passwords-message = 所有的密码是加密和 (we shall或 we will 的常用口语形式) 观察外面的为了裂口和警觉的如果 you are 你（你们）是假装的.
# This string encourages the user to save their passwords to Firefox again.
contextual-manager-passwords-no-passwords-get-started-message = 添加他们这里到获得启动.
# This string is displayed in a button. If the user clicks it, they will be taken to a form to create a new password.
contextual-manager-passwords-add-manually = 添加用手

## When the user cancels a login that's currently being edited, we display a message to confirm whether
## or not the user wants to discard their current edits to the login.

contextual-manager-passwords-discard-changes-heading-and-message =
  .heading = 关闭没有保存?
  .message = 你的更改将不是保存.
contextual-manager-passwords-discard-changes-close-button = 关闭
contextual-manager-passwords-discard-changes-go-back-button = 去后面的

#   $total (number) - Total number of passwords
contextual-manager-passwords-remove-all-passwords-checkbox =
  { $total ->
     [1] 是, 移除密码
    *[other] 是, 移除密码
  }

# This string informs the user they need to provide their primary password for FireFox to access their saved passwords in Firefox.
contextual-manager-primary-password-reauth-header = 到看见你的保存密码, 输入你的初等量密码.
# This string informs the user their primary password is used to authenticate and access their passwords
contextual-manager-primary-password-reauth-button = Enter 初等量密码
contextual-manager-primary-password-learn-more-link = 学习更多
