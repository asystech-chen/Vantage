# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

clear-site-data-window2 =
    .title = 清除资料
    .style = min-width: 35媒体用毕符

clear-site-data-description = 清扫所有的 Cookie 和站点数据储存的由 { -brand-short-name } 可以正负号你外面的的网站（全球资讯网的主机站）和移除挂线网内容. 清扫高速缓冲存储器资料将不影响你的注册(程序).

clear-site-data-close-key =
    .key = w

# The parameters in parentheses in this string describe disk usage
# in the format ($amount $unit), e.g. "Cookies and Site Data (24 KB)"
# Variables:
#   $amount (Number) - Amount of site data currently stored on disk
#   $unit (String) - Abbreviation of the unit that $amount is in, e.g. "MB"
clear-site-data-cookies-with-data =
    .label = Cookie 和站点数据 ({ $amount } { $unit })
    .accesskey = S

# This string is a placeholder for while the data used to fill
# clear-site-data-cookies-with-data is loading. This placeholder is usually
# only shown for a very short time (< 1s), so it should be very similar
# or the same as clear-site-data-cookies-with-data (except the amount and unit),
# to avoid flickering.
clear-site-data-cookies-empty =
    .label = 饼干和位置资料
    .accesskey = S

clear-site-data-cookies-info = 你可以获得有符号的外面的的网站（全球资讯网的主机站）如果使干净

# The parameters in parentheses in this string describe disk usage
# in the format ($amount $unit), e.g. "Cached Web Content (24 KB)"
# Variables:
#   $amount (Number) - Amount of cache currently stored on disk
#   $unit (String) - Abbreviation of the unit that $amount is in, e.g. "MB"
clear-site-data-cache-with-data =
    .label = 贮藏起来网内容 ({ $amount } { $unit })
    .accesskey = W

# This string is a placeholder for while the data used to fill
# clear-site-data-cache-with-data is loading. This placeholder is usually
# only shown for a very short time (< 1s), so it should be very similar
# or the same as clear-site-data-cache-with-data (except the amount and unit),
# to avoid flickering.
clear-site-data-cache-empty =
    .label = 贮藏起来网内容
    .accesskey = W

clear-site-data-cache-info = 将需要网站（全球资讯网的主机站）到再装复数虚部和资料

clear-site-data-dialog =
    .buttonlabelaccept = 清除
    .buttonaccesskeyaccept = l
