# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# These strings are used inside the Web Console commands
# which can be executed in the Developer Tools, available in the
# Browser Tools sub-menu -> 'Web Developer Tools'

# Usage string for :block command
webconsole-commands-usage-block =
  :block URL_STRING

  开始阻止网络请求

    该命令仅接受一个URL_STRING参数，一个未加引号的字符串，用于阻止所有URL包含此字符串的请求。
    若要撤销此操作，请使用 :unblock 命令或网络监视器请求阻止侧边栏。

# Usage string for :unblock command
webconsole-commands-usage-unblock =
  :unblock URL_STRING

  停止阻止网络请求

    该命令仅接受一个参数，即之前传递给 :block 的完全相同字符串。
