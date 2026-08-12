# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# This string is used to name the folder that users will save backups to.
# "Restore" is an action and intended for prompting users to select this folder
# when following backup restoration steps. Please only include characters that
# can be used for folders. Invalid characters will be automatically stripped out
# or replaced with underscores.
backup-folder-name = 回复 { -brand-product-name }

# This string is used for the generated file that will be stored within the
# backup-folder-name folder. It will have the profile name and an encoding of
# the backup date appended to it, followed by `.html`. Please only include
# characters that can be used for filenames. Invalid characters will be
# automatically stripped out or replaced with underscores.
#
# This is an example of what the final filename might look like after the
# profile name and backup date are appended to it:
#
# FirefoxBackup_default_20240606-1830.html
backup-file-name = { -brand-product-name }倒车

settings-data-backup-header2 =
    .label = 倒车
    .description = 自动地防卫你的书签, 历史记录, 和其他的资料.
settings-data-backup-toggle = 管理倒车
settings-data-backup-toggle-on2 =
    .label = 转弯在倒车
settings-data-backup-toggle-off2 =
    .label = 转弯关闭倒车
settings-data-backup-trigger-button = 倒车现在
settings-data-backup-in-progress-button = 倒车在进步…
settings-data-backup-in-progress-message =
    .message = 倒车在进步…
settings-data-backup-last-backup-date = 最后的倒车: { DATETIME($date, timeStyle: "short") }, { DATETIME($date, dateStyle: "short") }
settings-data-backup-scheduled-backups-on2 =
    .label = 倒车是 ON
settings-data-backup-scheduled-backups-off2 =
    .label = 倒车是 OFF
# "Location" refers to the folder where backups are being written to.
settings-data-backup-last-backup-location2 =
    .label = 倒车位置
settings-data-backup-last-backup-location-show-in-folder = 显示在文件夹
settings-data-backup-last-backup-location-edit = 编辑…
settings-data-create-backup-error = 那里曾是一个错误创建你的倒车在 { DATETIME($date, timeStyle: "short") }, { DATETIME($date, dateStyle: "short") }

# Variables:
#   $fileName (String) - The file name of the last backup that was created.
settings-data-backup-last-backup-filename = 文件名: { $fileName }

settings-data-backup-restore-scheduled-on =
    .label = 回复你的资料
    .description = 恢复你的 { -brand-product-name } 资料后面的从那最后时间它曾是有背的向上的.

settings-data-backup-restore-scheduled-off =
    .label = 回复你的资料
    .description = 使用一个 { -brand-product-name } 倒车从另外的装置到回复你的资料.

settings-sensitive-data =
    .label = 敏感的资料
settings-sensitive-data-encryption-description = 后面的向上的你的密码和付款方法, 正差保持所有的你的资料保险箱与加密.
settings-data-toggle-encryption-label2 =
    .label = 后面的向上的你的敏感的资料
    .description = 后面的向上的你的密码和付款方法, 正差保持所有的你的资料保险箱与加密.
settings-data-toggle-encryption-support-link = 学习更多

settings-data-change-password2 =
    .label = 更改密码

## These strings are displayed in a modal when users want to turn on scheduled backups.

turn-on-scheduled-backups-header = 转弯在倒车
turn-on-scheduled-backups-description = { -brand-short-name } 将创建一个瞬象的你的资料每一 24 小时. 你能回复它如果 (=there is 一个问题或你获得一个新的装置.
turn-on-scheduled-backups-support-link = 什么将是有背的向上的?

# "Location" refers to the save location or a folder where users want backups stored.
turn-on-scheduled-backups-location-label = 位置
# Variables:
#   $recommendedFolder (String) - Name of the recommended folder for saving backups
turn-on-scheduled-backups-location-default-folder =
    .value = { $recommendedFolder } (被推荐的)
turn-on-scheduled-backups-location-choose-button =
    { PLATFORM() ->
        [macos] 选取…
        *[other] 浏览…
    }

turn-on-scheduled-backups-encryption-label = 后面的向上的你的敏感的资料
turn-on-scheduled-backups-encryption-create-password-label = 密码
# Users will be prompted to re-type a password, to ensure that the password is entered correctly.
turn-on-scheduled-backups-encryption-repeat-password-label = 重复密码

turn-on-scheduled-backups-cancel-button = 取消
turn-on-scheduled-backups-confirm-button = 转弯在倒车

# Tell the user there was an error accessing the user's selected backup
# folder. The folder may be invalid or inaccessible.
turn-on-scheduled-backups-error-file-system = 那里曾是一个问题与你的被选的倒车文件夹. 选取一个不同的文件夹和尝试再一次.
backup-error-file-system = 那里曾是一个问题与你的被选的倒车文件夹一会儿后退向上的 { -brand-short-name }.

## These strings are displayed in a modal when users want to turn off scheduled backups.

turn-off-scheduled-backups-header = 转弯关闭倒车?
turn-off-scheduled-backups-description = 这也删除所有的的你的倒车资料. 它不能是没有做好.
turn-off-scheduled-backups-support-link = 学习更多

turn-off-scheduled-backups-cancel-button = 取消
turn-off-scheduled-backups-confirm-button = 转弯关闭和删除倒车

## These strings are displayed in a modal when users want restore from a backup.

restore-from-backup-header = 回复你的资料
# Variables:
#   $date (string) - Date to be formatted based on locale
restore-from-backup-support-link1 = 什么将是精力充沛的?

restore-from-backup-filepicker-label = 倒车文件
restore-from-backup-filepicker-title = 选取倒车文件:
restore-from-backup-file-choose-button =
    { PLATFORM() ->
        [macos] 选取…
        *[other] 浏览…
    }
restore-from-backup-password-label = 密码
restore-from-backup-password-description = 这解出锁定你的加密倒车.

restore-from-backup-cancel-button = 取消
restore-from-backup-confirm-button = 回复和重新启动
restore-from-backup-restoring-button = 恢复的…

restore-from-backup-type-group-label =
    .label = 代替当前的提问档?
restore-from-backup-type-replace =
    .label = 代替所有的资料与这倒车
restore-from-backup-type-add =
    .label = 保持资料和创建新的提问档
restore-from-backup-profiles-disabled-message = 这将代替所有的你的当前的 { -brand-short-name } 资料与你的倒车.

## These strings are displayed in a small error message bar in the settings
## menu if there was an error when trying to restore a backed up profile

# User is not authorized to restore a particular backup file, usually because
# the backup file is encrypted and the user provided a recovery password that
# was different than the password the user configured for their backup file
backup-service-error-incorrect-password = 不正确的密码. <a data-l10n-name="incorrect-password-support-link">仍然财产问题?</a>

# The backup file (or specific data files within the backup file) could not be
# loaded and parsed correctly, most likely due to data corruption of the
# backup file itself
backup-service-error-corrupt-file =
    .heading = 这文件 (=is not)不是工作
    .message = 那里曾是一个问题与你的倒车文件. 选取一个不同的文件和尝试再一次.

# The backup file cannot be restored. The currently running application may
# be too old and may not support features in the backed up profile.
# Alternatively, the backup file may be too old and some of the feature in
# the backed up profile may no longer be supported.
backup-service-error-unsupported-version =
    .heading = 这文件 (=is not)不是工作
    .message = 那文件你动产 (=is not)不是相容的与这版本的 { -brand-short-name }. 选取一个不同的文件和尝试再一次.

# The backup file cannot be restored. The currently running application is not
# the same application that created the backup file (e.g. Firefox cannot
# restore a Thunderbird profile backup).
backup-service-error-unsupported-application =
    .heading = 这文件 (=is not)不是工作
    .message = 那文件你动产曾是不创建由 { -brand-short-name }. 选取一个不同的文件和尝试再一次.

# Recovery from backup did not succeed. Potential causes could be file system
# errors, internal code errors, decryption errors, etc.
backup-service-error-recovery-failed =
    .heading = { -brand-short-name } (=could not)不能回复
    .message = 重新启动 { -brand-short-name } 和尝试恢复的你的倒车再一次.

# There was some error in the backup service but we don't have a more specific
# idea of what went wrong
backup-service-error-went-wrong2 =
    .heading = 隐马尔可夫模型（Hidden Markov Model）, 那里曾是一个问题后退向上的.
    .message = 尝试再一次在一个少数分钟.

## These strings are displayed in a modal when users want to enable encryption or change the password for an existing backup.

enable-backup-encryption-header = 后面的向上的你的敏感的资料
enable-backup-encryption-support-link = 学习更多

enable-backup-encryption-create-password-label = 密码
# Users will be prompted to re-type a password, to ensure that the password is entered correctly.
enable-backup-encryption-repeat-password-label = 重复密码

enable-backup-encryption-cancel-button = 取消
enable-backup-encryption-confirm-button = 保存

change-backup-encryption-header = 更改倒车密码

## These strings are displayed in a tooltip showing what requirements are met while creating a password.

password-rules-header = 密码需求
password-rules-length-description = 在最少 8 字符
password-rules-email-description = 不你的电子信函地址
password-rules-disclaimer = 停留保险箱—不要再使用密码. 看见更多秘诀到 <a data-l10n-name="password-support-link">创建强壮的密码</a>.
password-validity-has-email = 不能是一个电子信函地址
password-validity-do-not-match = 密码不要比较

## These strings are only used for assistive technologies, like screen readers, in the password requirements tooltip.

password-rules-a11y-success =
    .alt = 成功
password-rules-a11y-warning =
    .alt = 警告

## These strings are displayed in a modal when users want to disable encryption for an existing backup.

disable-backup-encryption-header = 移除密码保护
disable-backup-encryption-description2 = 你的保存密码和付款方法将也无比较久是有背的向上的.
disable-backup-encryption-support-link = 什么将是有背的向上的?

disable-backup-encryption-cancel-button = 取消
disable-backup-encryption-confirm-button = 移除密码

## These strings are used to tell users when errors occur when using
## the backup system

backup-error-password-requirements = 你的密码不会那需求. 请试另外的密码.

# This error message will be shown to the user when something went wrong with
# the backup system but we do not have any more specific idea of what went
# wrong. This message invites the user to try an action again because there
# is a chance that the action will succeed if retried.
backup-error-retry = 某事去错误的. 请试再一次.

## These strings are inserted into the generated single-file backup archive.
## The single-file backup archive is a specially-crafted, static HTML file
## that is placed within a user specified directory (the Documents folder by
## default) within a folder labelled with the "backup-folder-name" string.

backup-file-header = { -brand-short-name } 是预备好的状态到是精力充沛的
backup-file-title = 回复 { -brand-short-name }
backup-file-intro = 获得后面的到浏览和恢复所有的你的书签, 历史记录, 和其他的资料. <a data-l10n-name="backup-file-support-link">学习更多</a>

backup-file-path-label = 倒车文件:

backup-file-encryption-state-label = 加密:
backup-file-encryption-state-value-encrypted = 是
backup-file-encryption-state-value-not-encrypted = 无

backup-file-creation-device-label = 装置:

backup-file-creation-date-label = 创建:
# Variables:
#   $date (Datetime) - The date the backup was created
backup-file-creation-date-value = { DATETIME($date, timeStyle: "short") }, { DATETIME($date, dateStyle: "short") }

backup-file-how-to-restore-header = 如何到回复:

# The ☰ character is intended as a visual icon representing the Firefox
# application menu.
backup-file-moz-browser-restore-step-1 = 打开那应用菜单☰和去到设置 > 同步的
backup-file-moz-browser-restore-step-2-1 = 单击“回复你的资料”和选择这文件
backup-file-moz-browser-restore-step-3 = 重新启动 { -brand-short-name } 何时卖方要价

backup-file-other-browser-restore-step-1 = 下载和安装 { -brand-short-name }
backup-file-download-moz-browser-button = 下载
# The ☰ character is intended as a visual icon representing the Firefox
# application menu.
backup-file-other-browser-restore-step-2 = 启动 { -brand-short-name }, 打开那应用菜单☰和去到设置 > 同步的
backup-file-other-browser-restore-step-3-1 = 单击“回复你的资料”和选择这文件
backup-file-other-browser-restore-step-4 = 重新启动 { -brand-short-name } 何时卖方要价

## These strings are used in the about:restore and about:welcome pages
## These pages guide the user on browser startup to help them restore a backup
## if they have one on their file system.

# Variables:
# $numberOfOtherBackupsFound (number) - The number of backups found other than the displayed default backup
other-backup-files-founds =
    { $numberOfOtherBackupsFound ->
        [one] <b>笔记:</b> { $numberOfOtherBackupsFound } 其他的倒车文件发现
       *[other] <b>笔记:</b> { $numberOfOtherBackupsFound } 其他的倒车文件发现
    }

# Variables:
#   $profileName (String) - The name of the profile that was backed up.
#   $date (Datetime) - The date the backup was created.
#   $machineName (String) - Name of the machine that the backup was created on.
backup-file-creation-metadata2 = <b>{ $profileName }</b> 创建在 { DATETIME($date, year: "numeric", month: "numeric", day: "numeric") } 在 { $machineName }

# Variables:
#   $deviceName (String) - The name of the device from which the backup was created.
#   $date (Number) - The epoch timestamp of the restore.
backup-restored-profile-name = 精力充沛的从 { $deviceName } 在 { DATETIME($date, year: "numeric", month: "numeric", day: "numeric") } 在 { DATETIME($date, hour: "2-digit", minute: "2-digit") }

backup-file-restore-file-validation-error = 这文件 (=is not)不是工作. 尝试掘一个不同的文件. <a data-l10n-name="restore-problems">仍然财产问题?</a>

restore-from-backup-filepicker-input =
    .placeholder = 无文件被选的
