# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Variables
#   $shortcut (String) - A keyboard shortcut for the screenshot command.
screenshot-toolbar-button =
  .label = 屏幕捕获
  .tooltiptext = 执行屏幕捕获操作 ({ $shortcut })

screenshot-shortcut =
  .key = S

screenshots-instructions = 请您在页面上拖拽或单击以选择区域。按ESC键以取消操作。
screenshots-cancel-button = 取消
screenshots-save-visible-button = 保存可见区域
screenshots-save-page-button = 保存完整页面

screenshots-meta-key = {
  PLATFORM() ->
    [macos] ⌘
   *[other] Ctrl
}
screenshots-notification-link-copied-title = 链接已复制
screenshots-notification-link-copied-details = 您的捕获链接已复制到剪贴板。请按{screenshots-meta-key}-V以执行粘贴操作。

screenshots-notification-image-copied-title = 捕获已复制
screenshots-notification-image-copied-details = 您的捕获内容已复制到剪贴板。请按{screenshots-meta-key}-V以执行粘贴操作。

screenshots-too-large-error-title = 由于尺寸过大，您的屏幕捕获已被裁剪
screenshots-too-large-error-details = 请您选择最长边小于32,700像素或总面积小于124,900,000像素的区域。

screenshots-component-retry-button =
  .title = 重试屏幕捕获
  .aria-label = 重试屏幕捕获

screenshots-component-cancel-button =
  .title =
    { PLATFORM() ->
      [macos] 取消 (esc)
     *[other] 取消 (Esc)
    }
  .aria-label = 取消

# Variables
#   $shortcut (String) - A keyboard shortcut for copying the screenshot.
screenshots-component-copy-button-2 = 复制
  .title = 复制 ({ $shortcut })
  .aria-label = 复制

# Variables
#   $shortcut (String) - A keyboard shortcut for saving/downloading the screenshot.
screenshots-component-download-button-2 = 下载
  .title = 下载 ({ $shortcut })
  .aria-label = 下载

## The below strings are used to capture keydown events so the strings should
## not be changed unless the keyboard layout in the locale requires it.

screenshots-component-download-key = S
screenshots-component-copy-key = C

##

# This string represents the selection size area
# "×" here represents "by" (i.e 123 by 456)
# Variables:
#   $width (Number) - The width of the selection region in pixels
#   $height (Number) - The height of the selection region in pixels
screenshots-overlay-selection-region-size-3 = { $width } × { $height }

screenshots-overlay-preview-face-label =
  .aria-label = 选择此区域
