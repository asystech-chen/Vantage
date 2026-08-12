# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# This string is used to name the folder that users will save backups to.
# "Restore" is an action and intended for prompting users to select this folder
backup-folder-name = 恢复 { -brand-product-name }

# when following backup restoration steps. Please only include characters that
# can be used for folders. Invalid characters will be automatically stripped out
# or replaced with underscores.
# This string is used for the generated file that will be stored within the
# backup-folder-name folder. It will have the profile name and an encoding of
backup-file-name = { -brand-product-name }备份

settings-data-backup-header2 =
    .label = 备份
    .description = 自动保护您的书签、历史记录和其他数据。
settings-data-backup-toggle = 管理备份
settings-data-backup-toggle-on2 =
    .label = 开启备份
settings-data-backup-toggle-off2 =
    .label = 关闭备份
settings-data-backup-trigger-button = 立即备份
settings-data-backup-in-progress-button = 备份正在进行中…
settings-data-backup-in-progress-message =
    .message = 正在执行备份操作，请稍候…
settings-data-backup-last-backup-date = 上次备份时间：{ DATETIME($date, timeStyle: "short") }，{ DATETIME($date, dateStyle: "short") }
settings-data-backup-scheduled-backups-on2 =
    .label = 备份已处于开启状态
settings-data-backup-scheduled-backups-off2 =
    .label = 备份已处于关闭状态
# the backup date appended to it, followed by `.html`. Please only include
settings-data-backup-last-backup-location2 =
    .label = 备份位置
settings-data-backup-last-backup-location-show-in-folder = 在文件夹中显示
settings-data-backup-last-backup-location-edit = 编辑…
settings-data-create-backup-error = 在 { DATETIME($date, timeStyle: "short") }，{ DATETIME($date, dateStyle: "short") } 创建您的备份时发生错误。

# characters that can be used for filenames. Invalid characters will be
# automatically stripped out or replaced with underscores.
settings-data-backup-last-backup-filename = 文件名：{ $fileName }

settings-data-backup-restore-scheduled-on =
    .label = 恢复您的数据
    .description = 从上一次备份的时间点恢复您的 { -brand-product-name } 数据。

settings-data-backup-restore-scheduled-off =
    .label = 恢复您的数据
    .description = 使用来自另一设备的 { -brand-product-name } 备份来恢复您的数据。

settings-sensitive-data =
    .label = 敏感数据
settings-sensitive-data-encryption-description = 备份您的密码和支付方式，并通过加密保护您的所有数据。
settings-data-toggle-encryption-label2 =
    .label = 备份您的敏感数据
    .description = 备份您的密码和支付方式，并通过加密保护您的所有数据。
settings-data-toggle-encryption-support-link = 了解更多

settings-data-change-password2 =
    .label = 更改密码

#

turn-on-scheduled-backups-header = 开启备份
turn-on-scheduled-backups-description = { -brand-short-name } 将每 24 小时创建一次您的数据快照。如果出现问题或您获得新设备，您可以恢复它。
turn-on-scheduled-backups-support-link = 哪些内容将被备份？

# This is an example of what the final filename might look like after the
turn-on-scheduled-backups-location-label = 位置
# profile name and backup date are appended to it:
#
turn-on-scheduled-backups-location-default-folder =
    .value = { $recommendedFolder }（推荐）
turn-on-scheduled-backups-location-choose-button =
    { PLATFORM() ->
        [macos] 选择…
        *[other] 浏览…
    }

turn-on-scheduled-backups-encryption-label = 备份您的敏感数据
turn-on-scheduled-backups-encryption-create-password-label = 密码
# FirefoxBackup_default_20240606-1830.html
turn-on-scheduled-backups-encryption-repeat-password-label = 重复输入密码

turn-on-scheduled-backups-cancel-button = 取消
turn-on-scheduled-backups-confirm-button = 开启备份

# "Location" refers to the folder where backups are being written to.
turn-on-scheduled-backups-error-file-system = 您所选择的备份文件夹存在问题。请选择其他文件夹并重试。
backup-error-file-system = 在备份 { -brand-short-name } 时，您所选择的备份文件夹存在问题。

# Variables:

turn-off-scheduled-backups-header = 关闭备份？
turn-off-scheduled-backups-description = 此操作还将删除您的所有备份数据。此操作无法撤销。
turn-off-scheduled-backups-support-link = 了解更多

turn-off-scheduled-backups-cancel-button = 取消
turn-off-scheduled-backups-confirm-button = 关闭并删除备份

#   $fileName (String) - The file name of the last backup that was created.

restore-from-backup-header = 恢复您的数据
## These strings are displayed in a modal when users want to turn on scheduled backups.
# "Location" refers to the save location or a folder where users want backups stored.
restore-from-backup-support-link1 = 哪些内容将被恢复？

restore-from-backup-filepicker-label = 备份文件
restore-from-backup-filepicker-title = 选择备份文件：
restore-from-backup-file-choose-button =
    { PLATFORM() ->
        [macos] 选择…
        *[other] 浏览…
    }
restore-from-backup-password-label = 密码
restore-from-backup-password-description = 此操作将解锁您的加密备份。

restore-from-backup-cancel-button = 取消
restore-from-backup-confirm-button = 还原并重新启动
restore-from-backup-restoring-button = 正在还原…

restore-from-backup-type-group-label =
    .label = 是否替换当前配置文件？
restore-from-backup-type-replace =
    .label = 以该备份替换全部数据
restore-from-backup-type-add =
    .label = 保留数据并创建新配置文件
restore-from-backup-profiles-disabled-message = 此操作将以该备份替换您当前的全部 { -brand-short-name } 数据。

## These strings are displayed in a small error message bar in the settings
## menu if there was an error when trying to restore a backed up profile

# User is not authorized to restore a particular backup file, usually because
# the backup file is encrypted and the user provided a recovery password that
# was different than the password the user configured for their backup file
backup-service-error-incorrect-password = 密码不正确。<a data-l10n-name="incorrect-password-support-link">仍然遇到问题？</a>

# The backup file (or specific data files within the backup file) could not be
# loaded and parsed correctly, most likely due to data corruption of the
# backup file itself
backup-service-error-corrupt-file =
    .heading = 此文件无法工作
    .message = 您的备份文件出现问题。请选择其他文件并重试。

# The backup file cannot be restored. The currently running application may
# be too old and may not support features in the backed up profile.
# Alternatively, the backup file may be too old and some of the feature in
# the backed up profile may no longer be supported.
backup-service-error-unsupported-version =
    .heading = 此文件无法工作
    .message = 您选择的文件与当前版本的 { -brand-short-name } 不兼容。请选择其他文件并重试。

# The backup file cannot be restored. The currently running application is not
# the same application that created the backup file (e.g. Firefox cannot
# restore a Thunderbird profile backup).
backup-service-error-unsupported-application =
    .heading = 此文件无法工作
    .message = 您选择的文件并非由 { -brand-short-name } 创建。请选择其他文件并重试。

# Recovery from backup did not succeed. Potential causes could be file system
# errors, internal code errors, decryption errors, etc.
backup-service-error-recovery-failed =
    .heading = { -brand-short-name } 无法还原
    .message = 请重新启动 { -brand-short-name } 并再次尝试还原您的备份。

# There was some error in the backup service but we don't have a more specific
# idea of what went wrong
backup-service-error-went-wrong2 =
    .heading = 嗯，备份过程中出现问题。
    .message = 请在几分钟后重试。

## These strings are displayed in a modal when users want to enable encryption or change the password for an existing backup.

enable-backup-encryption-header = 备份您的敏感数据
enable-backup-encryption-support-link = 了解更多

enable-backup-encryption-create-password-label = 密码
# Users will be prompted to re-type a password, to ensure that the password is entered correctly.
enable-backup-encryption-repeat-password-label = 重复密码

enable-backup-encryption-cancel-button = 取消
enable-backup-encryption-confirm-button = 保存

change-backup-encryption-header = 更改备份密码

## These strings are displayed in a tooltip showing what requirements are met while creating a password.

password-rules-header = 密码要求
password-rules-length-description = 至少 8 个字符
password-rules-email-description = 不能是您的电子邮件地址
password-rules-disclaimer = 保持安全 — 请勿重复使用密码。查看更多 <a data-l10n-name="password-support-link">创建强密码</a> 的技巧。
password-validity-has-email = 不能是电子邮件地址
password-validity-do-not-match = 密码不匹配

## These strings are only used for assistive technologies, like screen readers, in the password requirements tooltip.

password-rules-a11y-success =
    .alt = 成功
password-rules-a11y-warning =
    .alt = 警告

## These strings are displayed in a modal when users want to disable encryption for an existing backup.

disable-backup-encryption-header = 移除密码保护
disable-backup-encryption-description2 = 您保存的密码和付款方式也将不再被备份。
disable-backup-encryption-support-link = 将备份哪些内容？

disable-backup-encryption-cancel-button = 取消
disable-backup-encryption-confirm-button = 移除密码

## These strings are used to tell users when errors occur when using
## the backup system

backup-error-password-requirements = 您的密码不符合要求。请尝试使用其他密码。

# This error message will be shown to the user when something went wrong with
# the backup system but we do not have any more specific idea of what went
# wrong. This message invites the user to try an action again because there
# is a chance that the action will succeed if retried.
backup-error-retry = 发生错误。请重试。

## These strings are inserted into the generated single-file backup archive.
## The single-file backup archive is a specially-crafted, static HTML file
## that is placed within a user specified directory (the Documents folder by
## default) within a folder labelled with the "backup-folder-name" string.

backup-file-header = { -brand-short-name } 已准备好进行还原
backup-file-title = 还原 { -brand-short-name }
backup-file-intro = 恢复浏览并找回您的全部书签、历史记录和其他数据。<a data-l10n-name="backup-file-support-link">了解更多</a>
backup-file-path-label = 备份文件:

backup-file-encryption-state-label = 加密状态:
backup-file-encryption-state-value-encrypted = 是
backup-file-encryption-state-value-not-encrypted = 否

backup-file-creation-device-label = 设备:

backup-file-creation-date-label = 创建日期:
# Variables:
#   $date (Datetime) - The date the backup was created
backup-file-creation-date-value = { DATETIME($date, timeStyle: "short") }, { DATETIME($date, dateStyle: "short") }

backup-file-how-to-restore-header = 如何恢复:

# The ☰ character is intended as a visual icon representing the Firefox
# application menu.
backup-file-moz-browser-restore-step-1 = 请启动应用程序菜单 ☰ 并前往设置 > 同步
backup-file-moz-browser-restore-step-2-1 = 请单击“恢复您的数据”并选择此文件
backup-file-moz-browser-restore-step-3 = 当系统提示时，请重新启动 { -brand-short-name }

backup-file-other-browser-restore-step-1 = 请下载并安装 { -brand-short-name }
backup-file-download-moz-browser-button = 下载
# The ☰ character is intended as a visual icon representing the Firefox
# application menu.
backup-file-other-browser-restore-step-2 = 请启动 { -brand-short-name }，打开应用程序菜单 ☰ 并前往设置 > 同步
backup-file-other-browser-restore-step-3-1 = 请单击“恢复您的数据”并选择此文件
backup-file-other-browser-restore-step-4 = 当系统提示时，请重新启动 { -brand-short-name }

## These strings are used in the about:restore and about:welcome pages
## These pages guide the user on browser startup to help them restore a backup
## if they have one on their file system.

# Variables:
# $numberOfOtherBackupsFound (number) - The number of backups found other than the displayed default backup
other-backup-files-founds =
    { $numberOfOtherBackupsFound ->
        [one] <b>注意：</b> 已找到 { $numberOfOtherBackupsFound } 个其他备份文件
       *[other] <b>注意：</b> 已找到 { $numberOfOtherBackupsFound } 个其他备份文件
    }

# Variables:
#   $profileName (String) - The name of the profile that was backed up.
#   $date (Datetime) - The date the backup was created.
#   $machineName (String) - Name of the machine that the backup was created on.
backup-file-creation-metadata2 = <b>{ $profileName }</b>于{ DATETIME($date, year: "numeric", month: "numeric", day: "numeric") }在{ $machineName }上创建

# Variables:
#   $deviceName (String) - The name of the device from which the backup was created.
#   $date (Number) - The epoch timestamp of the restore.
backup-restored-profile-name = 于{ DATETIME($date, year: "numeric", month: "numeric", day: "numeric") }在{ DATETIME($date, hour: "2-digit", minute: "2-digit") }从{ $deviceName }恢复

backup-file-restore-file-validation-error = 此文件无法正常工作。请尝试选择其他文件。<a data-l10n-name="restore-problems">仍然遇到问题？</a>

restore-from-backup-filepicker-input =
    .placeholder = 未选择文件
