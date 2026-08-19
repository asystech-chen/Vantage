
about-processes-title = 进程管理器

about-processes-column-action =
    .title = 操作


about-processes-shutdown-process =
    .title = 卸载标签页和删除进程
about-processes-kill-process =
    .title = 删除进程
about-processes-shutdown-tab =
    .title = 关闭标签页

about-processes-profile-process =
    .title = { $duration ->
   [one] 提问档所有的线索的这进程为了 { $duration } 秒
  *[other] 提问档所有的线索的这进程为了 { $duration } 秒
}


about-processes-column-name = 名称
about-processes-column-memory-resident = 存储器
about-processes-column-cpu-total = CPU


about-processes-browser-process = { -brand-short-name } ({ $pid })
about-processes-web-process = 共享的网进程 ({ $pid })
about-processes-file-process = 文件 ({ $pid })
about-processes-extension-process = 扩展名 ({ $pid })
about-processes-privilegedabout-process = 关于页 ({ $pid })
about-processes-plugin-process = 相关插件 ({ $pid })
about-processes-privilegedmozilla-process = { -vendor-short-name } 位置 ({ $pid })
about-processes-gmp-plugin-process = 壁虎媒质相关插件 ({ $pid })
about-processes-gpu-process = GPU ({ $pid })
about-processes-vr-process = VR ({ $pid })
about-processes-rdd-process = 论据译码器 ({ $pid })
about-processes-socket-process = 网络 ({ $pid })
about-processes-fork-server-process = 派生指令服务器 ({ $pid })
about-processes-preallocated-process = 预分配的 ({ $pid })
about-processes-utility-process = 实用程序 ({ $pid })
about-processes-inference-process = 推论 ({ $pid })

about-processes-unknown-process = 其他的: { $type } ({ $pid })


about-processes-web-isolated-property-private = 私人的
about-processes-web-isolated-property-serviceworker = serviceworker
about-processes-web-isolated-property-jit-disabled = JIT 禁用
about-processes-web-isolated-property-with-coop-coep = 交叉-origin 隔离的


about-processes-web-isolated-process2 = { $origin } ({ $properties })


about-processes-active-threads = { $active ->
   [one] { $active } 活跃的线索外面的的 { $number }: { $list }
  *[other] { $active } 活跃的线索外面的的 { $number }: { $list }
}

about-processes-inactive-threads = { $number ->
   [one] { $number } 非活动的线索
  *[other] { $number } 非活动的线索
}

about-processes-thread-name-and-id = { $name }
    .title = 线索识别: { $tid }

about-processes-tab-name = Tab: { $name }
about-processes-preloaded-tab = 预装入的新的 Tab

about-processes-frame-name-one = 子框架: { $url }

about-processes-frame-name-many = 子框架 ({ $number }): { $shortUrl }


about-processes-utility-actor-unknown = 不知道的男演员
about-processes-utility-actor-audio-decoder-generic = 一般的音频的译码器
about-processes-utility-actor-audio-decoder-applemedia = 苹果媒质音频的译码器
about-processes-utility-actor-audio-decoder-wmf = 窗媒质结构音频的译码器
about-processes-utility-actor-mf-media-engine = 窗媒质基础媒质引擎 CDM
about-processes-utility-actor-js-oracle = Java描述语言（一种程序语言）神谕
about-processes-utility-actor-windows-utils = 窗跑龙套
about-processes-utility-actor-windows-file-dialog = 窗文件对话
about-processes-utility-actor-pkcs11-module = 安全模块帮忙者


about-processes-cpu = { NUMBER($percent, maximumSignificantDigits: 2, style: "percent") }
    .title = 全体的 CPU 时间: { NUMBER($total, maximumFractionDigits: 0) }{ $unit }

about-processes-cpu-user-and-kernel-not-ready = (测量的)

about-processes-cpu-almost-idle = < 0.1%
    .title = 全体的 CPU 时间: { NUMBER($total, maximumFractionDigits: 0) }{ $unit }

about-processes-cpu-fully-idle = 空闲时间
    .title = 全体的 CPU 时间: { NUMBER($total, maximumFractionDigits: 0) }{ $unit }


about-processes-total-memory-size-changed = { NUMBER($total, maximumFractionDigits:0) }{ $totalUnit }
   .title = 进化: { $deltaSign }{ NUMBER($delta, maximumFractionDigits:0) }{ $deltaUnit }

about-processes-total-memory-size-no-change = { NUMBER($total, maximumFractionDigits:0) }{ $totalUnit }


duration-unit-ns = 毫微秒
duration-unit-us = µ标量
duration-unit-ms = 主存储器
duration-unit-s = s
duration-unit-m = m
duration-unit-h = h
duration-unit-d = d


memory-unit-B = B
memory-unit-KB = KB
memory-unit-MB = MB
memory-unit-GB = GB
memory-unit-TB = TB
memory-unit-PB = PB
memory-unit-EB = EB
