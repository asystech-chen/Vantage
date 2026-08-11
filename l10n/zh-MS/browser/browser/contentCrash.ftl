# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Subframe crash notification

crashed-subframe-message = <strong>此页面的部分内容已崩溃。</strong>为使 { -brand-product-name } 获知此问题并加快修复速度，请您提交一份报告。

# The string for crashed-subframe-title.title should match crashed-subframe-message,
# but without any markup.
crashed-subframe-title =
  .title = 此页面的部分内容已崩溃。为使 { -brand-product-name } 获知此问题并加快修复速度，请您提交一份报告。
crashed-subframe-learnmore-link =
  .value = 了解详情
crashed-subframe-submit =
  .label = 提交报告
  .accesskey = S

## Pending crash reports

# Variables:
#   $reportCount (Number): the number of pending crash reports
pending-crash-reports-message-new =
    { $reportCount ->
        [one] 您有一份最近未发送的崩溃报告
       *[other] 您有 { $reportCount } 份最近未发送的崩溃报告
    }

pending-crash-reports-view-all =
    .label = 查看
pending-crash-reports-send =
    .label = 发送
pending-crash-reports-always-send =
    .label = 始终发送

# Variables:
#   $reportCount (Number): the number of pending crash reports
requested-crash-reports-message-new =
    { $reportCount ->
        [one] 您有一份与被调查崩溃相关的未发送崩溃报告，发送该报告将有助于我们改进 { -brand-product-name }。关闭此通知将忽略此报告。
       *[other] 您有 { $reportCount } 份与被调查崩溃相关的未发送崩溃报告，发送这些报告将有助于我们改进 { -brand-product-name }。关闭此通知将忽略这些报告。
    }

requested-crash-reports-dont-show-again =
    .label = 不再显示
    .accesskey = D