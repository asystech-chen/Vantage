# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Messages used as headers in the main pane

compatibility-selected-element-header = 被选的部分
compatibility-all-elements-header = 所有的发行

## Message used as labels for the type of issue

compatibility-issue-deprecated = (不赞成)
compatibility-issue-experimental = (实验的)
compatibility-issue-prefixneeded = (地区号码需要的)
compatibility-issue-deprecated-experimental = (不赞成, 实验的)
compatibility-issue-deprecated-prefixneeded = (不赞成, 地区号码需要的)
compatibility-issue-experimental-prefixneeded = (实验的, 地区号码需要的)
compatibility-issue-deprecated-experimental-prefixneeded = (不赞成, 实验的, 地区号码需要的)

## Messages used as labels and titles for buttons in the footer

compatibility-settings-button-label = 设置
compatibility-settings-button-title =
    .title = 设置

## Messages used as headers in settings pane

compatibility-settings-header = 设置
compatibility-target-browsers-header = 目标浏览器

##

# Text used as the label for the number of nodes where the issue occurred
# Variables:
#   $number (Number) - The number of nodes where the issue occurred
compatibility-issue-occurrences =
    { $number ->
        [one] { $number } 发生
       *[other] { $number } 发生
    }

compatibility-no-issues-found = 无兼容性发行发现.
compatibility-close-settings-button =
    .title = 关闭设置

# Text used in the element containing the browser icons for a given compatibility issue.
# Line breaks are significant.
# Variables:
#   $browsers (String) - A line-separated list of browser information (e.g. Firefox 98\nChrome 99).
compatibility-issue-browsers-list =
    .title = 兼容性发行在:
    { $browsers }
