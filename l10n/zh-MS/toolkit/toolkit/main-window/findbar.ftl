

findbar-next =
    .tooltiptext = 发现那近邻干扰发生的那短语
findbar-previous =
    .tooltiptext = 发现那早先的发生的那短语

findbar-find-button-close =
    .tooltiptext = 关闭发现棒形图

findbar-highlight-all2 =
    .label = 突出所有的
    .accesskey = { PLATFORM() ->
        [macos] l
       *[other] a
    }
    .tooltiptext = 突出所有的发生的那短语

findbar-case-sensitive =
    .label = 比较情形
    .accesskey = C
    .tooltiptext = 搜索与情形灵敏度

findbar-match-diacritics =
    .label = 比较可区别的
    .accesskey = i
    .tooltiptext = 区别在...之间带…腔调的字母和他们的基准字母 (为了例子, 何时搜索的为了“继续执行”, “半径é系统实用程序和维护é”将不是相配的)

findbar-entire-word =
    .label = 全部字
    .accesskey = W
    .tooltiptext = 搜索全部字仅

findbar-not-found = 短语不发现

findbar-wrapped-to-top = 到达端的页, 继续的从 TOP协议
findbar-wrapped-to-bottom = 到达 TOP协议的页, 继续的从底部

findbar-normal-find =
    .placeholder = 发现在页
findbar-fast-find =
    .placeholder = 快的发现
findbar-fast-find-links =
    .placeholder = 快的发现 (连接仅)

findbar-case-sensitive-status =
    .value = (情形敏感的)
findbar-match-diacritics-status =
    .value = (匹配可区别的)
findbar-entire-word-status =
    .value = (全部字仅)

findbar-found-matches =
    .value =
        { $total ->
            [one] { $current } 的 { $total } 比较
           *[other] { $current } 的 { $total } 比较
        }

findbar-found-matches-count-limit =
    .value =
        { $limit ->
            [one] 更多比 { $limit } 比较
           *[other] 更多比 { $limit } 比较
        }
