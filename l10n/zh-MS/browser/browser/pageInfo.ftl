# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/. --

page-info-window =
    .style = 宽度: 600专用小交换机; 部长-高度: 550专用小交换机;

copy =
    .key = C
menu-copy =
    .label = 复制
    .accesskey = C

select-all =
    .key = A
menu-select-all =
    .label = 选择所有的
    .accesskey = A

close-dialog =
    .key = w

general-tab =
    .label = 常规
    .accesskey = G
general-title =
    .value = 标题:
general-url =
    .value = 地址:
general-type =
    .value = 类型:
general-mode =
    .value = 回报模式:
general-size =
    .value = 大小:
general-referrer =
    .value = 谈及 URL:
general-modified =
    .value = 改良的:
general-encoding =
    .value = 电文编码:
general-meta-name =
    .label = 名称
general-meta-content =
    .label = 内容

media-tab =
    .label = 媒质
    .accesskey = M
media-location =
    .value = 位置:
media-text =
    .value = 关联的电文:
media-alt-header =
    .label = 交替的电文
media-address =
    .label = 地址
media-type =
    .label = 类型
media-size =
    .label = 大小
media-count =
    .label = 计数
media-dimension =
    .value = 尺寸:
media-long-desc =
    .value = 长描述:
media-select-all =
    .label = 选择所有的
    .accesskey = e
media-save-as =
    .label = 保存作为…
    .accesskey = A
media-save-image-as =
    .label = 保存作为…
    .accesskey = v

perm-tab =
    .label = 许可
    .accesskey = P
permissions-for =
    .value = 许可为了:

security-tab =
    .label = 安全
    .accesskey = S
security-view =
    .label = 查看证书
    .accesskey = V
security-view-unknown = 不知道的
    .value = 不知道的
security-view-identity =
    .value = 网站（全球资讯网的主机站） (打)标记
security-view-identity-owner =
    .value = 拥有者:
security-view-identity-domain =
    .value = 网站（全球资讯网的主机站）:
security-view-identity-verifier =
    .value = 已查清的由:
security-view-identity-validity =
    .value = 期满在:
security-view-privacy =
    .value = 隐私 & 历史记录
security-view-qwac =
    .label = 查看有资格的证书
    .accesskey = Q

security-view-privacy-history-value = 有电流拜访这网站（全球资讯网的主机站）更重要的到今天?
security-view-privacy-sitedata-value = 是这网站（全球资讯网的主机站）储存信息在我的计算机?

security-view-privacy-clearsitedata =
    .label = 清除 Cookie 和站点数据
    .accesskey = C

security-view-privacy-passwords-value = 有电流保存任何的密码为了这网站（全球资讯网的主机站）?

security-view-privacy-viewpasswords =
    .label = 查看保存密码
    .accesskey = w
security-view-technical =
    .value = 技术上的详细数据

help-button =
    .label = 帮忙

## These strings are used to tell the user if the website is storing cookies
## and data on the users computer in the security tab of pageInfo
## Variables:
##   $value (number) - Amount of data being stored
##   $unit (string) - The unit of data being stored (Usually KB)

security-site-data-cookies = 是, 饼干和 { $value } { $unit } 的站点数据
security-site-data-only = 是, { $value } { $unit } 的站点数据

security-site-data-cookies-only = 是, 饼干
security-site-data-no = 无

##

image-size-unknown = 不知道的
page-info-not-specified =
    .value = 不规定的
not-set-alternative-text = 不规定的
not-set-date = 不规定的
media-img = 图象
media-bg-img = 背景
media-border-img = 边框
media-list-img = 子弹
media-cursor = 光标
media-object = 对象
media-embed = 嵌入
media-link = 像标
media-input = 输入
media-video = 影像
media-audio = 音频的
saved-passwords-yes = 是
saved-passwords-no = 无

no-page-title =
    .value = 无称号的页:
general-quirks-mode =
    .value = 古怪举动模式
general-strict-mode =
    .value = 标准遵从模式
page-info-security-no-owner =
    .value = 这网站（全球资讯网的主机站）做不补给所有权信息.
media-select-folder = 选择一个文件夹到保存那图象
media-unknown-not-cached =
    .value = 不知道的 (不贮藏起来)
permissions-use-default =
    .label = 使用默认

# This string is used to display the number of meta tags
# in the General Tab
# Variables:
#   $tags (number) - The number of meta tags
general-meta-tags =
    .value =
        { $tags ->
             [one] Meta (1 标记)
            *[other] Meta ({ $tags } 标记)
        }

# This string is used to display the number of times
# the user has visited the website prior
# Variables:
#   $visits (number) - The number of previous visits
security-visits-number =
    { $visits ->
         [0] 无
         [one] 是, 一次
        *[other] 是, { $visits } 时间
    }

# This string is used to display the size of a media file
# Variables:
#   $kb (number) - The size of an image in Kilobytes
#   $bytes (number) - The size of an image in Bytes
properties-general-size =
    .value = { $bytes ->
         [one] { $kb } KB ({ $bytes } 字节)
        *[other] { $kb } KB ({ $bytes } 字节)
    }

# This string is used to display the type and number
# of frames of a animated image
# Variables:
#   $type (string) - The type of a animated image
#   $frames (number) - The number of frames in an animated image
media-animated-image-type =
    .value = { $frames ->
         [one] { $type } 图象 (活生生的, { $frames } 框架)
        *[other] { $type } 图象 (活生生的, { $frames } 框架)
    }

# This string is used to display the type of
# an image
# Variables:
#   $type (string) - The type of an image
media-image-type =
    .value = { $type } 图象

# This string is used to display the size of a scaled image
# in both scaled and unscaled pixels
# Variables:
#   $dimx (number) - The horizontal size of an image
#   $dimy (number) - The vertical size of an image
#   $scaledx (number) - The scaled horizontal size of an image
#   $scaledy (number) - The scaled vertical size of an image
media-dimensions-scaled =
    .value = { $dimx }专用小交换机× { $dimy }专用小交换机 (有鳞(斑)的到 { $scaledx }专用小交换机× { $scaledy }专用小交换机)

# This string is used to display the size of an image in pixels
# Variables:
#   $dimx (number) - The horizontal size of an image
#   $dimy (number) - The vertical size of an image
media-dimensions =
    .value = { $dimx }专用小交换机× { $dimy }专用小交换机

# This string is used to display the size of a media
# file in kilobytes
# Variables:
#   $size (number) - The size of the media file in kilobytes
media-file-size = { $size } KB

## Variables:
##   $website (string) — The url of the website pageInfo is getting info for

# This string is used to display the URL of the website on top of the
# pageInfo dialog box
page-info-page =
    .title = 页信息— { $website }
page-info-frame =
    .title = 框架信息— { $website }
