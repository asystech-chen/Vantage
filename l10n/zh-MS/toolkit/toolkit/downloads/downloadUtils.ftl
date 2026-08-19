

download-utils-short-seconds =
    { $timeValue ->
        [one] s
       *[other] s
    }
download-utils-short-minutes =
    { $timeValue ->
        [one] m
       *[other] m
    }
download-utils-short-hours =
    { $timeValue ->
        [one] h
       *[other] h
    }
download-utils-short-days =
    { $timeValue ->
        [one] d
       *[other] d
    }


download-utils-status = { $timeLeft } — { $transfer } ({ $rate } { $unit }/秒)
download-utils-status-infinite-rate = { $timeLeft } — { $transfer } (实际上快速的)
download-utils-status-no-rate = { $timeLeft } — { $transfer }

download-utils-bytes = 字节
download-utils-kilobyte = KB
download-utils-megabyte = MB
download-utils-gigabyte = GB

download-utils-transfer-same-units = { $progress } 的 { $total } { $totalUnits }
download-utils-transfer-diff-units = { $progress } { $progressUnits } 的 { $total } { $totalUnits }
download-utils-transfer-no-total = { $progress } { $progressUnits }

download-utils-time-pair = { $time }{ $unit }
download-utils-time-left-single = { $time } 许可
download-utils-time-left-double = { $time1 } { $time2 } 许可
download-utils-time-few-seconds = 一个少数秒许可
download-utils-time-unknown = 不知道的时间许可

download-utils-yesterday = 昨天
