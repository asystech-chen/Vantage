# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# These strings aren't translated and are meant to be used for experimental commands
# which may frequently update their documentations

# Usage string for :trace command
webconsole-commands-usage-trace3 =
  :痕迹

  切换那 Java描述语言（一种程序语言）跟踪程序.

  那跟踪程序将显示器所有的功能存在被呼叫的由你的页.

    它支持那下列各项参数:
      --logMethod 到是日落到 'console' 为了 (木材)采运作业到那网控制台 (那默认), 或 'stdout' 为了 (木材)采运作业到那标准输出.

      --return 可选择的标志到是已被传递的到也日志何时功能返回.

      --values 可选择的标志到是已被传递的到日志功能呼叫参数作为井作为被送回的计算结果 (何时被送回的框架是启用).

      --on-next-interaction 可选择的标志, 何时日落, 那跟踪程序将仅启动在近邻干扰 mousedown 或 keydown 事件.

      --dom-mutations 可选择的标志, 何时日落, 那跟踪程序将日志所有的 DOM 变化.
                      何时通过一个计算结果, 你能限制到一个一项(或条、点) 变化类型经由一个昏迷-separated 列表:
                       - 'add' 将仅跟踪 DOM 节点存在额外的,
                       - 'attributes' 将仅跟踪 DOM 节点谁的属性更改,
                       - 'remove' 将仅跟踪 DOM 节点存在离开的.

      --max-depth 可选择的标志, 将限制 (木材)采运作业痕迹到一个赠予的深度已被传递的作为参数.

      --max-records 可选择的标志, 将自动地停止那跟踪程序在...之后财产笨重的那已被传递的总数的 TOP协议级别框架.

      --prefix 可选择的字符串哪个将是笨重的在前面的全部那痕迹日志.

      --help 或 --usage 到显示这报文.
