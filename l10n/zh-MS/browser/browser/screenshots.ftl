# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Variables
#   $shortcut (String) - A keyboard shortcut for the screenshot command.
screenshot-toolbar-button =
  .label = 屏幕截图
  .tooltiptext = 采取一个屏幕截图 ({ $shortcut })

screenshot-shortcut =
  .key = S

screenshots-instructions = 拖动或单击在那页到选择一个区. 压 ESC 到取消.
screenshots-cancel-button = 取消
screenshots-save-visible-button = 保存看得见的
screenshots-save-page-button = 保存完整页

screenshots-meta-key = {
  PLATFORM() ->
    [macos] ⌘
   *[other] Ctrl
}
screenshots-notification-link-copied-title = 连接已复制的
screenshots-notification-link-copied-details = 那连接到你的发射有是已复制的到那剪贴板. 压 {screenshots-meta-key}-溢出到粘贴.

screenshots-notification-image-copied-title = 发射已复制的
screenshots-notification-image-copied-details = 你的发射有是已复制的到那剪贴板. 压 {screenshots-meta-key}-溢出到粘贴.

screenshots-too-large-error-title = 你的屏幕截图曾是裁切不正的因为它曾是也大的
screenshots-too-large-error-details = 尝试选择一个区 (=that is)说得更精确些较小比 32,700 象素在它的最长的旁边或 124,900,000 象素全体的区域.

screenshots-component-retry-button =
  .title = 重发屏幕截图
  .aria-label = 重发屏幕截图

screenshots-component-cancel-button =
  .title =
    { PLATFORM() ->
      [macos] 取消 (转义字符)
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
  .aria-label = 选择这区
