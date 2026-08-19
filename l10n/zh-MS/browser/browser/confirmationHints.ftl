# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Confirmation hints

# Subtle notification shown when Extensions button moves into the application menu.
confirmation-hint-extensions-button-hidden = 移动到菜单
confirmation-hint-password-removed = 密码离开的!
confirmation-hint-page-bookmarked = 保存到书签
confirmation-hint-password-created = 密码保存
confirmation-hint-password-updated = 密码更新的
confirmation-hint-address-created = 地址保存
confirmation-hint-address-updated = 地址更新的
confirmation-hint-credit-card-created = 卡片保存
confirmation-hint-credit-card-updated = 卡片更新的
confirmation-hint-pin-tab = 用针别住!
confirmation-hint-pin-tab-description = 右-click 那标签页到取下...上的别针它.
confirmation-hint-send-to-device = 发送!
confirmation-hint-firefox-relay-mask-created = 新的屏蔽创建!
confirmation-hint-firefox-relay-mask-reused = 现成的屏蔽再生的!
confirmation-hint-screenshot-copied = 屏幕截图已复制的!
# Variables:
#   $tabCount (Number): The number of duplicate tabs closed, at least 1.
confirmation-hint-duplicate-tabs-closed =
  { $tabCount ->
      [one] 关闭 { $tabCount } 标签页
      *[other] 关闭 { $tabCount } 标签页
  }
