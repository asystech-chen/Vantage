# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are used in DevTools’ performance-new panel, about:profiling, and
### the remote profiling panel. There are additional profiler strings in the appmenu.ftl
### file that are used for the profiler popup.

perftools-intro-title = 靠模工具机设置
perftools-intro-description =
  记录的下水靠模工具机.火狐.com 在一个新的标签页. 所有的资料是储存的
  地方性地, 除了你能选取到上装它为了共享.

## All of the headings for the various sections.

perftools-heading-settings = 完整设置
perftools-heading-buffer = 缓冲区设置
perftools-heading-features = 特性
perftools-heading-features-default = 特性 (被推荐的在默认情况下)
perftools-heading-features-disabled = 禁用特性
perftools-heading-features-experimental = 实验的
perftools-heading-threads = 线索
perftools-heading-threads-jvm = JVM 线索
perftools-heading-local-build = 本地的建立

##

perftools-description-intro =
  记录的下水 <a>靠模工具机.火狐.com</a> 在一个新的标签页. 所有的资料是储存的
  地方性地, 除了你能选取到上装它为了共享.
perftools-description-local-build =
  如果 you are 你（你们）是靠模机一个构造那你有编译的你自己, 在这
  机器, 请添加你的 build's objdir 到那列表在下面如此那
  它能是使用到看向上的符号信息.
perftools-pick-local-build-directory = 拾取建立目录

## The controls for the interval at which the profiler samples the code.

perftools-range-interval-label = 抽样时间间隔:
perftools-range-interval-milliseconds = {NUMBER($interval, maxFractionalUnits: 2)} 主存储器

## Generic memory units that can be used in various places, eg for the buffer size.

# Byte
perftools-memory-unit-b = { NUMBER($num, maxFractionalUnits: 2) } 基地址
# Kibibyte
perftools-memory-unit-kib = { NUMBER($num, maxFractionalUnits: 2) } killed in breach
# Mebibyte
perftools-memory-unit-mib = { NUMBER($num, maxFractionalUnits: 2) } 管理信息库
# Gibibyte
perftools-memory-unit-gib = { NUMBER($num, maxFractionalUnits: 2) } 凹字形楔
# Tebibyte
perftools-memory-unit-tib = { NUMBER($num, maxFractionalUnits: 2) } (Tib)人名
# Pebibyte
perftools-memory-unit-pib = { NUMBER($num, maxFractionalUnits: 2) } power ionosphere beacon 功率电离层信标
# Exbibyte
perftools-memory-unit-eib = { NUMBER($num, maxFractionalUnits: 2) } European Investment Bank 欧洲投资银行
# Zebibyte
perftools-memory-unit-zib = { NUMBER($num, maxFractionalUnits: 2) } Zuse Institute Berlin
# Yobibyte
perftools-memory-unit-yib = { NUMBER($num, maxFractionalUnits: 2) } 业

##

# The size of the memory buffer used to store things in the profiler.
perftools-range-entries-label = 缓冲区大小:

perftools-custom-threads-label = 添加定制线索由名称:

perftools-devtools-interval-label = 时间间隔:
perftools-devtools-threads-label = 线索:
perftools-devtools-settings-label = 设置

## Various statuses that affect the current state of profiling, not typically displayed.

perftools-status-recording-stopped-by-another-tool = 那录音曾是停止由另外的工具.
perftools-status-restart-required = 那浏览器必须是重新启动到启用这特性.

## These are shown briefly when the user is waiting for the profiler to respond.

perftools-request-to-stop-profiler = 停机的记录的
perftools-request-to-get-profile-and-stop-profiler = 捕捉（capture的ing形式）提问档

##

perftools-button-start-recording = 启动记录的
perftools-button-capture-recording = 截获命令记录的
perftools-button-cancel-recording = 取消记录的
perftools-button-save-settings = 保存设置和去后面的
perftools-button-restart = 重新启动
perftools-button-add-directory = 添加一个目录
perftools-button-remove-directory = 移除被选的
perftools-button-edit-settings = 编辑设置…

## More actions menu

perftools-menu-more-actions-button =
  .title = 更多操作
perftools-menu-more-actions-restart-with-profiling = 重新启动 { -brand-shorter-name } 与启动靠模机启用
perftools-menu-more-actions-copy-for-startup = 复制环境变量为了启动靠模机
perftools-menu-more-actions-copy-for-perf-tests = 复制参量为了施行测试

## These messages are descriptions of the threads that can be enabled for the profiler.

perftools-thread-gecko-main =
  .title = 那主群组进程为了两者的那父母进程, 和内容进程
perftools-thread-compositor =
  .title = 合成的一起不同的描画的部分在那页
perftools-thread-dom-worker =
  .title = 这把两者的网工人和服务工人
perftools-thread-renderer =
  .title = 何时 WebRender 是启用, 那线索那执行（法令）( execute的第三人称单数 ) Open Graphics Library一套三维图形处理库呼叫
perftools-thread-render-backend =
  .title = 那 WebRender RenderBackend 线索
perftools-thread-timer =
  .title = 那线索处理计时器 (setTimeout, setInterval, nsITimer)
perftools-thread-style-thread =
  .title = 风格计算是拆分进入...之内倍数线索
pref-thread-stream-trans =
  .title = 网络流传送
perftools-thread-socket-thread =
  .title = 那线索哪里连网代码运行任何的组成块套接字呼叫
perftools-thread-img-decoder =
  .title = 图象译码的线索
perftools-thread-dns-resolver =
  .title = DNS 图形分辨率发生在这线索
perftools-thread-task-controller =
  .title = TaskController 线索池线索
perftools-thread-jvm-gecko =
  .title = 那主群组壁虎 JVM 线索
perftools-thread-jvm-nimbus =
  .title = 那主群组线索为了那幻云实验 SDK
perftools-thread-jvm-default-dispatcher =
  .title = 那默认调度程序为了那 Kotlin 协同程序库
perftools-thread-jvm-glean =
  .title = 那主群组线索为了那拾落穗遥测技术 SDK
perftools-thread-jvm-arch-disk-io =
  .title = 那 IO 调度程序为了那 Kotlin 协同程序库
perftools-thread-jvm-pool =
  .title = 线索创建在一个无名的线索池

##

perftools-record-all-registered-threads =
  旁路选择在上方和录制所有的注册的线索

perftools-tools-threads-input-label =
  .title = 这些线索全国制造商协会(美国) 是一个逗点分居列表那是使用到启用靠模机的那线索在那靠模工具机. 那名称需要到是仅一个分音比较的那线索名称到是包含的. 它是空白敏感的.

## Onboarding UI labels. These labels are displayed in the new performance panel UI, when
## devtools.performance.new-panel-onboarding preference is true.

perftools-onboarding-message = <b>新的</b>: { -profiler-brand-name } 是现在综合的进入...之内显影器工具. <a>学习更多</a> 关于这有力的新的工具.

perftools-onboarding-close-button =
  .aria-label = 关闭那 onboarding 报文

## Profiler presets

# Presets and their l10n IDs are defined in the file
# devtools/client/performance-new/shared/background.sys.mjs
# The same labels and descriptions are also defined in appmenu.ftl.

perftools-presets-web-developer-label = 网显影器
perftools-presets-web-developer-description = 被推荐的边框形式为了最多网应用调试, 与低点总开销.

perftools-presets-firefox-label = { -brand-shorter-name }
perftools-presets-firefox-description = 被推荐的边框形式为了靠模机 { -brand-shorter-name }.

perftools-presets-graphics-label = 图形的
perftools-presets-graphics-description = 边框形式为了调查图形的疯狂的在 { -brand-shorter-name }.

perftools-presets-media-label = 媒质
perftools-presets-media-description2 = 边框形式为了调查音频的和影像疯狂的在 { -brand-shorter-name }.

perftools-presets-ml-label = 机器学习
perftools-presets-ml-description2 = 边框形式为了调查机器学习疯狂的在 { -brand-shorter-name }.

perftools-presets-networking-label = 连网
perftools-presets-networking-description = 边框形式为了调查连网疯狂的在 { -brand-shorter-name }.

# "Power" is used in the sense of energy (electricity used by the computer).
perftools-presets-power-label = 力
perftools-presets-power-description = 边框形式为了调查力使用疯狂的在 { -brand-shorter-name }, 与低点总开销.

perftools-presets-debug-label = 除错
perftools-presets-debug-description = 边框形式为了调试在 { -brand-shorter-name }. 高度总开销, 做不使用为了施行工作除了使用为了调焦在理解浏览器行为.

perftools-presets-web-compat-label = 网兼容
perftools-presets-web-compat-description = 被推荐的边框形式为了调试网兼容性议题在网站（全球资讯网的主机站）, 宁可比跟踪施行.

perftools-presets-custom-label = 定制

##
