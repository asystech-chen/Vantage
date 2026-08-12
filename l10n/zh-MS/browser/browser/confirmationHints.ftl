# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Confirmation hints

# Subtle notification shown when Extensions button moves into the application menu.
confirmation-hint-extensions-button-hidden = 已移至菜单中
confirmation-hint-password-removed = 密码已被移除！
confirmation-hint-page-bookmarked = 已保存至书签
confirmation-hint-password-created = 密码已保存
confirmation-hint-password-updated = 密码已更新
confirmation-hint-address-created = 地址已保存
confirmation-hint-address-updated = 地址已更新
confirmation-hint-credit-card-created = 卡片已保存
confirmation-hint-credit-card-updated = 卡片已更新
confirmation-hint-pin-tab = 已固定！
confirmation-hint-pin-tab-description = 右键单击该选项卡可取消固定。
confirmation-hint-send-to-device = 已发送！
confirmation-hint-firefox-relay-mask-created = 已创建新掩码！
confirmation-hint-firefox-relay-mask-reused = 已复用现有掩码！
confirmation-hint-screenshot-copied = 截图已复制！
# Variables:
#   $tabCount (Number): The number of duplicate tabs closed, at least 1.
confirmation-hint-duplicate-tabs-closed =
  { $tabCount ->
      [one] 已关闭 { $tabCount } 个选项卡
      *[other] 已关闭 { $tabCount } 个选项卡
  }
