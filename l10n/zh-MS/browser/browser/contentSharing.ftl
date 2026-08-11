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
        [one] { $count } 个标签页
       *[other] { $count } 个标签页
    }

content-sharing-modal-view-page-2 =
  .label = 预览页面

content-sharing-modal-copy-link =
  .label = 复制链接

content-sharing-modal-generating-page =
  .label = 正在生成页面…

content-sharing-modal-link-copied =
  .label = 链接已复制

content-sharing-modal-sign-in-2 =
  .label = 登录以共享

content-sharing-modal-title-2 = 与任何人共享这些页面

content-sharing-modal-title-signed-in = 您的链接已准备就绪，可供共享

content-sharing-modal-description-2 = 登录以创建一个易于共享的链接页面。该页面不可编辑或删除，并在 7 天后过期。

content-sharing-modal-description-signed-in = 我们已为您创建了一个易于共享的链接页面。该页面不可编辑或删除，并在 7 天后过期。

content-sharing-modal-policy = 通过共享，您同意我们的<a data-l10n-name="aup-link">可接受使用策略</a>

# This is a warning to the user when they try to share more than the maximum
# number of links and that the first N links will be shared.
# The current max is 30.
content-sharing-modal-too-many-links-2 =
  { $count ->
      *[other] 仅包含 { $count } 个链接
  }

content-sharing-modal-no-shareable-links =
  .heading = 未包含可共享的链接
  .message = 仅可共享指向网页内容的链接。

# Variables:
#   $count (Number) - The maximum number of pages a user can share at one time
content-sharing-modal-too-many-pages =
  .heading =
    { $count ->
        [one] 您已共享 { $count } 个页面
       *[other] 您已共享 { $count } 个页面
    }
  .message = 请在您的某个页面过期后重试。

content-sharing-modal-some-invalid-links = 某些链接无法共享。

content-sharing-modal-generic-error-2 =
  .heading = 发生错误
  .message = 无法创建您的共享页面，请稍后重试。