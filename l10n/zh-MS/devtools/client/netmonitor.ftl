# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Strings used in the status bar of the DevTools Network Panel

# Tooltip for the performance button in the status bar
network-menu-summary-tooltip-perf =
    .title = 启动施行分析机
network-menu-summary-tooltip-domcontentloaded =
    .title = 时间何时“DOMContentLoaded”事件发生（occur的过去分词）
network-menu-summary-tooltip-load =
    .title = 时间何时“加载”事件发生（occur的过去分词）
# This label is displayed in the network table footer providing the
# number of requests
# Variables:
#   $requestCount (Number): The total number of requests.
network-menu-summary-requests-count =
    { $requestCount ->
        [0] 无请求
        [one] { $requestCount } 请求
        *[other] { $requestCount } 请求
    }
network-menu-summary-tooltip-requests-count =
    .title = 数字的请求
# This label is displayed in the network table footer providing the
# transferred size.
# Variables:
#   $formattedContentSize (String): The formatted content size.
#   $formattedTransferredSize (String): The formatted transferred size.
network-menu-summary-transferred =
    { $formattedContentSize } / { $formattedTransferredSize } transferred
network-menu-summary-tooltip-transferred =
    .title = 大小/呼叫转移大小的全部请求
# This label is displayed in the network table footer providing the
# transfer time.
# Variables:
#   $formattedTime (String): The formatted transfer time.
network-menu-summary-finish = 完成: { $formattedTime }
network-menu-summary-tooltip-finish =
    .title = 全体的时间需要的到加载所有的请求
