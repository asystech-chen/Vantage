# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Variables
##   $count (number) - The number of tabs

content-sharing-modal-more-tabs =
    { $count ->
       *[other] +{ $count } 更多
    }

content-sharing-tabs-title =
    { $count ->
        [one] { $count } 标签页
       *[other] { $count } 标签页
    }

content-sharing-modal-view-page-2 =
  .label = 预览页

content-sharing-modal-copy-link =
  .label = 复制连接

content-sharing-modal-generating-page =
  .label = 生成页…

content-sharing-modal-link-copied =
  .label = 连接已复制的

content-sharing-modal-sign-in-2 =
  .label = 正负号在到均分

content-sharing-modal-title-2 = 部分这些页与任何人

content-sharing-modal-title-signed-in = 你的连接是预备好的状态到均分

content-sharing-modal-description-2 = 正负号在到创建一个容易的到均分页的连接. 它不能是编辑（edit的过去式和过去分词）或删除和期满( expire的第三人称单数 ) 在...之后 7 一生.

content-sharing-modal-description-signed-in = 我们使一个容易的到均分页与你的连接. 它不能是编辑（edit的过去式和过去分词）或删除和期满( expire的第三人称单数 ) 在...之后 7 一生.

content-sharing-modal-policy = 由共享, 你同意到我们的 <a data-l10n-name="aup-link">可接受的使用政策</a>

# This is a warning to the user when they try to share more than the maximum
# number of links and that the first N links will be shared.
# The current max is 30.
content-sharing-modal-too-many-links-2 =
  { $count ->
      *[other] 仅 { $count } 连接将是包含的
  }

content-sharing-modal-no-shareable-links =
  .heading = 无可共享的连接包含的
  .message = 仅连接到结网内容能是共享的.

# Variables:
#   $count (Number) - The maximum number of pages a user can share at one time
content-sharing-modal-too-many-pages =
  .heading =
    { $count ->
        [one] you have 你（们）已经共享的 { $count } 页
       *[other] you have 你（们）已经共享的 { $count } 页
    }
  .message = 尝试再一次在...之后一(个) 的你的页期满( expire的第三人称单数 ).

content-sharing-modal-some-invalid-links = 一些连接不能是共享的.

content-sharing-modal-generic-error-2 =
  .heading = 某事去错误的
  .message = 我们 (=could not)不能创建你的共享的页这时间. 尝试再一次以后.
