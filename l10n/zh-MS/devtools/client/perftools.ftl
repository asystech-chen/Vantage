# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are used in DevTools’ performance-new panel, about:profiling, and
### the remote profiling panel. There are additional profiler strings in the appmenu.ftl
### file that are used for the profiler popup.

perftools-intro-title = 分析器设置
perftools-intro-description =
  录制将在新选项卡中启动 profiler.firefox.com。所有数据均存储在本地，但您可以选择将其上传以进行共享。

## All of the headings for the various sections.

perftools-heading-settings = 完整设置
perftools-heading-buffer = 缓冲区设置
perftools-heading-features = 功能
perftools-heading-features-default = 功能（默认推荐启用）
perftools-heading-features-disabled = 已禁用的功能
perftools-heading-features-experimental = 实验性
perftools-heading-threads = 线程
perftools-heading-threads-jvm = JVM 线程
perftools-heading-local-build = 本地构建

##

perftools-description-intro =
  录制将在新选项卡中启动 <a>profiler.firefox.com</a>。所有数据均存储在本地，但您可以选择将其上传以进行共享。
perftools-description-local-build =
  如果您正在对本机上自行编译的构建进行性能分析，请将您构建的 objdir 添加到以下列表中，以便用于查找符号信息。
perftools-pick-local-build-directory = 选择构建目录

## The controls for the interval at which the profiler samples the code.

perftools-range-interval-label = 采样间隔：
perftools-range-interval-milliseconds = {NUMBER($interval, maxFractionalUnits: 2)} 毫秒

## Generic memory units that can be used in various places, eg for the buffer size.

# Byte
perftools-memory-unit-b = { NUMBER($num, maxFractionalUnits: 2) } B
# Kibibyte
perftools-memory-unit-kib = { NUMBER($num, maxFractionalUnits: 2) } KiB
# Mebibyte
perftools-memory-unit-mib = { NUMBER($num, maxFractionalUnits: 2) } MiB
# Gibibyte
perftools-memory-unit-gib = { NUMBER($num, maxFractionalUnits: 2) } GiB
# Tebibyte
perftools-memory-unit-tib = { NUMBER($num, maxFractionalUnits: 2) } TiB
# Pebibyte
perftools-memory-unit-pib = { NUMBER($num, maxFractionalUnits: 2) } PiB
# Exbibyte
perftools-memory-unit-eib = { NUMBER($num, maxFractionalUnits: 2) } EiB
# Zebibyte
perftools-memory-unit-zib = { NUMBER($num, maxFractionalUnits: 2) } ZiB
# Yobibyte
perftools-memory-unit-yib = { NUMBER($num, maxFractionalUnits: 2) } YiB

##

# The size of the memory buffer used to store things in the profiler.
perftools-range-entries-label = 缓冲区大小：

perftools-custom-threads-label = 按名称添加自定义线程：

perftools-devtools-interval-label = 间隔：
perftools-devtools-threads-label = 线程：
perftools-devtools-settings-label = 设置

## Various statuses that affect the current state of profiling, not typically displayed.

perftools-status-recording-stopped-by-another-tool = 录制已被另一工具停止。
perftools-status-restart-required = 必须重启浏览器才能启用此功能。

## These are shown briefly when the user is waiting for the profiler to respond.

perftools-request-to-stop-profiler = 正在停止录制...
perftools-request-to-get-profile-and-stop-profiler = 正在捕获配置文件...

##

perftools-button-start-recording = 启动录制
perftools-button-capture-recording = 捕获录制
perftools-button-cancel-recording = 取消录制
perftools-button-save-settings = 保存设置并返回
perftools-button-restart = 重新启动
perftools-button-add-directory = 添加目录
perftools-button-remove-directory = 移除所选
perftools-button-edit-settings = 编辑设置...

## More actions menu

perftools-menu-more-actions-button =
  .title = 更多操作
perftools-menu-more-actions-restart-with-profiling = 使用启动时分析功能重新启动 { -brand-shorter-name }
perftools-menu-more-actions-copy-for-startup = 复制用于启动时分析的环境变量
perftools-menu-more-actions-copy-for-perf-tests = 复制用于性能测试的参数

## These messages are descriptions of the threads that can be enabled for the profiler.

perftools-thread-gecko-main =
  .title = 父进程和内容进程的主进程
perftools-thread-compositor =
  .title = 合成页面上不同绘制元素的线程
perftools-thread-dom-worker =
  .title = 处理 Web 工作线程和服务工作线程的线程
perftools-thread-renderer =
  .title = 启用 WebRender 时，执行 OpenGL 调用的线程
perftools-thread-render-backend =
  .title = WebRender RenderBackend 线程
perftools-thread-timer =
  .title = 处理计时器的线程（setTimeout、setInterval、nsITimer）
perftools-thread-style-thread =
  .title = 样式计算被拆分为多个线程
pref-thread-stream-trans =
  .title = 网络流传输
perftools-thread-socket-thread =
  .title = 网络代码在其中运行任何阻塞套接字调用的线程
perftools-thread-img-decoder =
  .title = 图像解码线程
perftools-thread-dns-resolver =
  .title = DNS 解析在此线程上进行
perftools-thread-task-controller =
  .title = TaskController 线程池线程
perftools-thread-jvm-gecko =
  .title = 主要的 Gecko JVM 线程
perftools-thread-jvm-nimbus =
  .title = Nimbus 实验 SDK 的主线程
perftools-thread-jvm-default-dispatcher =
  .title = Kotlin 协程库的默认调度器
perftools-thread-jvm-glean =
  .title = Glean 遥测 SDK 的主线程
perftools-thread-jvm-arch-disk-io =
  .title = Kotlin 协程库的 IO 调度器
perftools-thread-jvm-pool =
  .title = 在未命名线程池中创建的线程

##

perftools-record-all-registered-threads =
  绕过上述选择并记录所有已注册的线程

perftools-tools-threads-input-label =
  .title = 这些线程名称是一个逗号分隔的列表，用于启用分析器中的线程剖析。名称只需与线程名称部分匹配即可包含。它对空白字符敏感。

## Onboarding UI labels. These labels are displayed in the new performance panel UI, when
## devtools.performance.new-panel-onboarding preference is true.

perftools-onboarding-message = <b>新功能</b>：{ -profiler-brand-name } 现已集成到开发者工具中。<a>了解更多</a>关于这一强大的新工具。

perftools-onboarding-close-button =
  .aria-label = 关闭入门消息

## Profiler presets

# Presets and their l10n IDs are defined in the file
# devtools/client/performance-new/shared/background.sys.mjs
# The same labels and descriptions are also defined in appmenu.ftl.

perftools-presets-web-developer-label = Web 开发者
perftools-presets-web-developer-description = 推荐的预设用于大多数 Web 应用调试，开销较低。

perftools-presets-firefox-label = { -brand-shorter-name }
perftools-presets-firefox-description = 推荐的预设用于剖析 { -brand-shorter-name }。

perftools-presets-graphics-label = 图形
perftools-presets-graphics-description = 用于调查 { -brand-shorter-name } 中的图形错误的预设。

perftools-presets-media-label = 媒体
perftools-presets-media-description2 = 用于调查 { -brand-shorter-name } 中的音频和视频错误的预设。

perftools-presets-ml-label = 机器学习
perftools-presets-ml-description2 = 用于调查 { -brand-shorter-name } 中的机器学习错误的预设。

perftools-presets-networking-label = 网络
perftools-presets-networking-description = 用于调查 { -brand-shorter-name } 中的网络错误的预设。

# "Power" is used in the sense of energy (electricity used by the computer).
perftools-presets-power-label = 功率
perftools-presets-power-description = 用于调查 { -brand-shorter-name } 中的功率使用错误的预设，开销较低。

perftools-presets-debug-label = 调试
perftools-presets-debug-description = 用于在 { -brand-shorter-name } 中进行调试的预设。开销较高，请勿用于性能工作，而应专注于理解浏览器行为。

perftools-presets-web-compat-label = Web 兼容性
perftools-presets-web-compat-description = 推荐的预设用于调试网站中的 Web 兼容性问题，而非跟踪性能。

perftools-presets-custom-label = 自定义

##
