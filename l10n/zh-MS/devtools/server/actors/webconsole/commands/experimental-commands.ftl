# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# These strings aren't translated and are meant to be used for experimental commands
# which may frequently update their documentations

# Usage string for :trace command
webconsole-commands-usage-trace3 =
  :trace

  切换 JavaScript 跟踪器。

  跟踪器将显示您页面所调用的所有函数。

    它支持以下参数：
      --logMethod 可设置为 ‘console’ 以记录到网页控制台（默认设置），或 ‘stdout’ 以记录到标准输出。

      --return 可选标志，传递后还会在函数返回时进行记录。

      --values 可选标志，传递后可记录函数调用的参数以及返回值（当启用返回帧时）。

      --on-next-interaction 可选标志，设置后，跟踪器将仅在下一个 mousedown 或 keydown 事件时启动。

      --dom-mutations 可选标志，设置后，跟踪器将记录所有 DOM 突变。
                      传递值时，您可以通过逗号分隔的列表来限制为特定的突变类型：
                       - ‘add’ 将仅跟踪被添加的 DOM 节点，
                       - ‘attributes’ 将仅跟踪属性发生变更的 DOM 节点，
                       - ‘remove’ 将仅跟踪被移除的 DOM 节点。

      --max-depth 可选标志，将把跟踪日志限制为传入参数的指定深度。

      --max-records 可选标志，将在记录了传入数量的顶层帧后自动停止跟踪器。

      --prefix 可选字符串，将记录在所有跟踪日志的前面。

      --help 或 --usage 以显示此消息。