# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## The title and aria-label attributes are used by screen readers to describe
## the Downloads Panel.

downloads-window =
  .title = 下载
downloads-panel =
  .aria-label = 下载

##

# The style attribute has the width of the Downloads Panel expressed using
# a CSS unit. The longest labels that should fit are usually those of
# in-progress and blocked downloads.
downloads-panel-items =
  .style = 宽度: 35媒体用毕符

downloads-cmd-pause =
    .label = 暂停
    .accesskey = P
downloads-cmd-resume =
    .label = 继续执行
    .accesskey = R
downloads-cmd-cancel =
    .tooltiptext = 取消
downloads-cmd-cancel-panel =
    .aria-label = 取消

downloads-cmd-show-menuitem-2 =
  .label = { PLATFORM() ->
      [macos] 显示在发现者
     *[other] 显示在文件夹
  }
  .accesskey = F

## Displayed in the downloads context menu for files that can be opened.
## Variables:
##   $handler (String) - The name of the mime type's default file handler.
##   Example: "Notepad", "Acrobat Reader DC", "7-Zip File Manager"

downloads-cmd-use-system-default =
  .label = 打开在系统观察者
  .accesskey = I
# This version is shown when the download's mime type has a valid file handler.
downloads-cmd-use-system-default-named =
  .label = 打开在 { $handler }
  .accesskey = I

# We can use the same accesskey as downloads-cmd-always-open-similar-files.
# Both should not be visible in the downloads context menu at the same time.
downloads-cmd-always-use-system-default =
  .label = 总是打开在系统观察者
  .accesskey = w
# We can use the same accesskey as downloads-cmd-always-open-similar-files.
# Both should not be visible in the downloads context menu at the same time.
# This version is shown when the download's mime type has a valid file handler.
downloads-cmd-always-use-system-default-named =
  .label = 总是打开在 { $handler }
  .accesskey = w

##

# We can use the same accesskey as downloads-cmd-always-use-system-default.
# Both should not be visible in the downloads context menu at the same time.
downloads-cmd-always-open-similar-files =
  .label = 总是打开相似的文件
  .accesskey = w

downloads-cmd-show-button-2 =
  .tooltiptext = { PLATFORM() ->
      [macos] 显示在发现者
     *[other] 显示在文件夹
  }

downloads-cmd-show-panel-2 =
  .aria-label = { PLATFORM() ->
      [macos] 显示在发现者
     *[other] 显示在文件夹
  }
downloads-cmd-show-description-2 =
  .value = { PLATFORM() ->
      [macos] 显示在发现者
     *[other] 显示在文件夹
  }

downloads-cmd-retry =
    .tooltiptext = 重发
downloads-cmd-retry-panel =
    .aria-label = 重发
downloads-cmd-go-to-download-page =
    .label = 去到下载页
    .accesskey = G
downloads-cmd-copy-download-link =
    .label = 复制下载连接
    .accesskey = L
downloads-cmd-remove-from-history =
    .label = 移除从历史记录
    .accesskey = e
downloads-cmd-clear-list =
    .label = 清除预览嵌板
    .accesskey = a
downloads-cmd-clear-downloads =
    .label = 清除下载
    .accesskey = C
downloads-cmd-delete-file =
    .label = 删除
    .accesskey = D

# This command is shown in the context menu when downloads are blocked.
downloads-cmd-unblock =
    .label = 允许下载
    .accesskey = o

# This is the tooltip of the action button shown when malware is blocked.
downloads-cmd-remove-file =
    .tooltiptext = 移除文件

downloads-cmd-remove-file-panel =
    .aria-label = 移除文件

# This is the tooltip of the action button shown when potentially unwanted
# downloads are blocked. This opens a dialog where the user can choose
# whether to unblock or remove the download. Removing is the default option.
downloads-cmd-choose-unblock =
    .tooltiptext = 移除文件或允许下载

downloads-cmd-choose-unblock-panel =
    .aria-label = 移除文件或允许下载

# This is the tooltip of the action button shown when uncommon downloads are
# blocked.This opens a dialog where the user can choose whether to open the
# file or remove the download. Opening is the default option.
downloads-cmd-choose-open =
    .tooltiptext = 打开或移除文件

downloads-cmd-choose-open-panel =
    .aria-label = 打开或移除文件

# Displayed when hovering a blocked download, indicates that it's possible to
# show more information for user to take the next action.
downloads-show-more-information =
    .value = 显示更多信息

# Displayed when hovering a complete download, indicates that it's possible to
# open the file using an app available in the system.
downloads-open-file =
    .value = 打开文件

## Displayed when the user clicked on a download in process. Indicates that the
## downloading file will be opened after certain amount of time using an app
## available in the system.
## Variables:
##   $hours (number) - Amount of hours left till the file opens.
##   $seconds (number) - Amount of seconds left till the file opens.
##   $minutes (number) - Amount of minutes till the file opens.

downloading-file-opens-in-hours-and-minutes-2 =
  .value = 打开在 { $hours }硬件 { $minutes }尾数…
downloading-file-opens-in-minutes-2 =
  .value = 打开在 { $minutes }尾数…
downloading-file-opens-in-minutes-and-seconds-2 =
  .value = 打开在 { $minutes }尾数 { $seconds }标量…
downloading-file-opens-in-seconds-2 =
  .value = 打开在 { $seconds }标量…
downloading-file-opens-in-some-time-2 =
  .value = 打开何时完整的…
downloading-file-click-to-open =
  .value = 打开何时完整的

##

# Displayed when hovering a download which is able to be retried by users,
# indicates that it's possible to download this file again.
downloads-retry-download =
    .value = 重发下载

# Displayed when hovering a download which is able to be cancelled by users,
# indicates that it's possible to cancel and stop the download.
downloads-cancel-download =
    .value = 取消下载

# This string is shown at the bottom of the Downloads Panel when all the
# downloads fit in the available space, or when there are no downloads in
# the panel at all.
downloads-history =
    .label = 显示所有的下载
    .accesskey = S

# This string is shown at the top of the download details sub-panel to indicate
# that we are showing the details of a single download.
downloads-details =
    .title = 下载详细数据

## These strings are displayed in the private browsing view of the downloads panel

downloads-private-browsing-details =
  .title = 文件停留在你的装置
downloads-private-browsing-message = 任何人使用这装置能看见下载, 偶数何时你关闭所有的私人的窗.
downloads-private-browsing-delete-button =
  .label = 删除文件自动地
  .accesskey = D
downloads-private-browsing-accept-button =
  .label = 获得它
  .accesskey = G

## Displayed when a site attempts to automatically download many files.
## Variables:
##   $num (number) - Number of blocked downloads.
##   $url (string) - The url of the suspicious site, stripped of http, https and www prefix.

downloads-files-not-downloaded = { $num ->
    [one] 文件不将（程序.
   *[other] {$num} 文件不将（程序.
}
downloads-blocked-from-url = 下载阻止从 { $url }.
downloads-blocked-download-detailed-info = { $url } 企图的到自动地下载倍数文件. 那位置能够是坏掉的或尝试到存储器操作罐头猪肉文件在你的装置.

##

downloads-clear-downloads-button =
    .label = 清除下载
    .tooltiptext = 清除完整的, 取消和失败的下载

# This string is shown when there are no items in the Downloads view, when it
# is displayed inside a browser tab.
downloads-list-empty =
    .value = 那里是无下载.

# This string is shown when there are no items in the Downloads Panel.
downloads-panel-empty =
    .value = 无下载为了这会话.

# This is displayed in an item at the bottom of the Downloads Panel when there
# are more downloads than can fit in the list in the panel.
#   $count (number) - number of files being downloaded that are not shown in the
#                     panel list.
downloads-more-downloading =
    { $count ->
        [one] { $count } 更多文件下装
       *[other] { $count } 更多文件下装
    }

## Download errors

downloads-error-alert-title = 下载错误
# Variables:
#   $extension (String): the name of the blocking extension.
downloads-error-blocked-by = 那下载无法是保存因为它是阻止由 { $extension }.
# Used when the name of the blocking extension is unavailable.
downloads-error-extension = 那下载无法是保存因为它是阻止由一个扩展名.
# Line breaks in this message are meaningful, and should be maintained.
downloads-error-generic =
    那下载无法是保存因为一个未知物错误发生.

    请试再一次.
