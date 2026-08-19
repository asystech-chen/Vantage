# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Subframe crash notification

crashed-subframe-message = <strong>部分的这页失事的.</strong> 到让 { -brand-product-name } 知道关于这发行和获得它修复加快, 请提交一个报告.

# The string for crashed-subframe-title.title should match crashed-subframe-message,
# but without any markup.
crashed-subframe-title =
  .title = 部分的这页失事的. 到让 { -brand-product-name } 知道关于这发行和获得它修复加快, 请提交一个报告.
crashed-subframe-learnmore-link =
  .value = 学习更多
crashed-subframe-submit =
  .label = 提交报告
  .accesskey = S

## Pending crash reports

# Variables:
#   $reportCount (Number): the number of pending crash reports
pending-crash-reports-message-new =
    { $reportCount ->
        [one] 你有一个最近的未送出(或寄发)的崩溃报告
       *[other] 你有 { $reportCount } 最近的未送出(或寄发)的崩溃报告
    }

pending-crash-reports-view-all =
    .label = 查看
pending-crash-reports-send =
    .label = 发送
pending-crash-reports-always-send =
    .label = 总是发送

# Variables:
#   $reportCount (Number): the number of pending crash reports
requested-crash-reports-message-new =
    { $reportCount ->
        [one] 你有一个未送出(或寄发)的崩溃报告讲述的到崩溃存在调查, 发送它将帮助我们改良 { -brand-product-name }. 关闭这通知将忽略这报告.
       *[other] 你有 { $reportCount } 未送出(或寄发)的崩溃报告讲述的到崩溃存在调查, 发送他们将帮助我们改良 { -brand-product-name }. 关闭这通知将忽略这些报告.
    }

requested-crash-reports-dont-show-again =
    .label = 不要显示再一次
    .accesskey = D
