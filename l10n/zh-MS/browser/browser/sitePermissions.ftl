# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# This string is used to display the option to open blocked popup(s) in site permission management panels.
# Variables:
#   $count (String) - Number of blocked pop-ups
site-permissions-open-blocked-popups =
  { $count ->
     [one] 正在启动 { $count } 个被阻止的弹出窗口…
    *[other] 正在启动 { $count } 个被阻止的弹出窗口…
  }

# This string is used to display the option to unblock a third-party redirect.
site-permissions-unblock-redirect = 正在解除对第三方重定向的阻止…
