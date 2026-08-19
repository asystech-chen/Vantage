
download-ui-confirm-title = 取消所有的下载?


download-ui-confirm-quit-cancel-downloads =
    { $downloadsCount ->
        [1] 如果你退出现在, 1 下载将是取消. 你确定你想要到退出?
       *[other] 如果你退出现在, { $downloadsCount } 下载将是取消. 你确定你想要到退出?
    }
download-ui-confirm-quit-cancel-downloads-mac =
    { $downloadsCount ->
        [1] 如果你结束现在, 1 下载将是取消. 你确定你想要到结束?
       *[other] 如果你结束现在, { $downloadsCount } 下载将是取消. 你确定你想要到结束?
    }
download-ui-dont-quit-button =
    { PLATFORM() ->
        [mac] 不要结束
       *[other] 不要出口
    }

download-ui-confirm-offline-cancel-downloads =
    { $downloadsCount ->
        [1] 如果你去挂线现在, 1 下载将是取消. 你确定你想要到去挂线?
       *[other] 如果你去挂线现在, { $downloadsCount } 下载将是取消. 你确定你想要到去挂线?
    }
download-ui-dont-go-offline-button = 停留联机

download-ui-confirm-leave-private-browsing-windows-cancel-downloads =
    { $downloadsCount ->
        [1] 如果你关闭所有的私人的浏览窗现在, 1 下载将是取消. 你确定你想要到离开私人的浏览?
       *[other] 如果你关闭所有的私人的浏览窗现在, { $downloadsCount } 下载将是取消. 你确定你想要到离开私人的浏览?
    }
download-ui-dont-leave-private-browsing-button = 停留在私人的浏览

download-ui-cancel-downloads-ok =
    { $downloadsCount ->
        [1] 取消 1 下载
       *[other] 取消 { $downloadsCount } 下载
    }


download-ui-file-executable-security-warning-title = 打开可执行的文件?
download-ui-file-executable-security-warning = “{ $executable }”是一个可执行的文件. 可执行的文件可以包含病毒或其他的怀恶意的代码那能够伤害你的计算机. 使用警告何时打开这文件. 你确定你想要到使下水“{ $executable }”?
