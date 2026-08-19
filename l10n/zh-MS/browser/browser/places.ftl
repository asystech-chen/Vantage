# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.

places-open =
  .label = 打开
  .accesskey = O
places-open-in-tab =
  .label = 打开在新的 Tab
  .accesskey = w
places-open-in-container-tab =
  .label = 打开在新的容器 Tab
  .accesskey = i
places-open-all-bookmarks =
  .label = 打开所有的书签
  .accesskey = O
places-open-all-in-tabs =
  .label = 打开所有的在标签页
  .accesskey = O
places-open-in-window =
  .label = 打开在新的窗口
  .accesskey = N
places-open-in-private-window =
  .label = 打开在新的私人的窗口
  .accesskey = P

places-empty-bookmarks-folder =
  .label = (空)

places-add-bookmark =
  .label = 添加书签…
  .accesskey = B
places-add-folder-contextmenu =
  .label = 添加文件夹…
  .accesskey = F
places-add-folder =
  .label = 添加文件夹…
  .accesskey = o
places-add-separator =
  .label = 添加分隔符
  .accesskey = S

places-view =
  .label = 查看
  .accesskey = w
places-by-date =
  .label = 由日期
  .accesskey = D
places-by-site =
  .label = 由位置
  .accesskey = S
places-by-most-visited =
  .label = 由最多拜访
  .accesskey = V
places-by-last-visited =
  .label = 由最后拜访
  .accesskey = L
places-by-day-and-site =
  .label = 由日期和位置
  .accesskey = t

places-history-search =
  .placeholder = 搜索历史记录
places-history =
  .aria-label = 历史记录
places-bookmarks-search =
  .placeholder = 搜索书签

places-forget-domain-data =
  .label = 忘记关于这位置…
  .accesskey = F
places-sortby-name =
  .label = 种类由名称
  .accesskey = r
# places-edit-bookmark and places-edit-generic will show one or the other and can have the same access key.
places-edit-bookmark =
  .label = 编辑书签…
  .accesskey = E
places-edit-generic =
  .label = 编辑…
  .accesskey = E
places-edit-folder2 =
  .label = 编辑文件夹…
  .accesskey = E
# Variables
#   $count (number) - Number of folders to delete
places-delete-folder =
  .label =
      { $count ->
          [1] 删除文件夹
         *[other] 删除文件夹
      }
  .accesskey = D
# Variables:
#   $count (number) - The number of pages selected for removal.
places-delete-page =
  .label =
      { $count ->
          [1] 删除页
         *[other] 删除页
      }
  .accesskey = D

# Managed bookmarks are created by enterprise policy and cannot be changed by the user.
managed-bookmarks =
  .label = 与中央化计划及管制有关的书签
# This label is used when a managed bookmarks folder doesn't have a name.
managed-bookmarks-subfolder =
  .label = 子文件夹

# This label is used for the "Other Bookmarks" folder that appears in the bookmarks toolbar.
other-bookmarks-folder =
  .label = 其他的书签

places-show-in-folder =
  .label = 显示在文件夹
  .accesskey = F

# Variables:
# $count (number) - The number of elements being selected for removal.
places-delete-bookmark =
  .label =
      { $count ->
          [1] 删除书签
         *[other] 删除书签
      }
  .accesskey = D

# Variables:
#   $count (number) - The number of bookmarks being added.
places-create-bookmark =
  .label =
      { $count ->
          [1] 书签页…
         *[other] 书签页…
      }
  .accesskey = B

places-untag-bookmark =
  .label = 移除标记
  .accesskey = R

places-manage-bookmarks =
  .label = 管理书签
  .accesskey = M

places-library3 =
  .title = 库

places-organize-button =
  .label = 组织
  .tooltiptext = 组织你的书签
  .accesskey = O

places-file-close =
  .label = 关闭
  .accesskey = C

places-cmd-close =
  .key = w

places-view-button =
  .label = 查看
  .tooltiptext = 更改你的查看
  .accesskey = V

places-view-menu-columns =
  .label = 显示列
  .accesskey = C

places-view-menu-sort =
  .label = 种类
  .accesskey = S

places-view-sort-unsorted =
  .label = 未排序的
  .accesskey = U

places-view-sort-ascending =
  .label = 一个 > 阻抗种类顺序
  .accesskey = A

places-view-sort-descending =
  .label = 阻抗 > 一个种类顺序
  .accesskey = Z

places-maintenance-button =
  .label = 引入和倒车
  .tooltiptext = 引入和倒车你的书签
  .accesskey = I

places-cmd-backup =
  .label = 倒车…
  .accesskey = B

places-cmd-restore =
  .label = 回复
  .accesskey = R

places-cmd-restore-from-file =
  .label = 选取文件…
  .accesskey = C

places-import-bookmarks-from-html =
  .label = 引入书签从 HTML…
  .accesskey = I

places-export-bookmarks-to-html =
  .label = 导出书签到 HTML…
  .accesskey = E

places-import-other-browser =
  .label = 引入论据从另外的浏览器…
  .accesskey = A

places-view-sort-col-name =
  .label = 名称

places-view-sort-col-tags =
  .label = 标记

places-view-sort-col-url =
  .label = 位置

places-view-sort-col-most-recent-visit =
  .label = 最多最近的拜访

places-view-sort-col-visit-count =
  .label = 拜访计数

places-view-sort-col-date-added =
  .label = 额外的

places-view-sort-col-last-modified =
  .label = 最后的改良的

places-view-sortby-name =
  .label = 种类由名称
  .accesskey = N
places-view-sortby-url =
  .label = 种类由位置
  .accesskey = L
places-view-sortby-date =
  .label = 种类由最多最近的拜访
  .accesskey = V
places-view-sortby-visit-count =
  .label = 种类由拜访计数
  .accesskey = C
places-view-sortby-date-added =
  .label = 种类由额外的
  .accesskey = e
places-view-sortby-last-modified =
  .label = 种类由最后改良的
  .accesskey = M
places-view-sortby-tags =
  .label = 种类由标记
  .accesskey = T

places-cmd-find-key =
  .key = f

places-back-button =
  .tooltiptext = 去回

places-forward-button =
  .tooltiptext = 去前推

places-details-pane-select-an-item-description = 选择一个项到查看和编辑它的属性

places-details-pane-no-items =
  .value = 无项
# Variables:
#   $count (Number): number of items
places-details-pane-items-count =
  .value =
      { $count ->
          [one] 一(个) 项
         *[other] { $count } 项
      }

## Strings used as a placeholder in the Library search field. For example,
## "Search History" stands for "Search through the browser's history".

places-search-bookmarks =
    .placeholder = 搜索书签
places-search-history =
    .placeholder = 搜索历史记录
places-search-downloads =
    .placeholder = 搜索下载

##

places-locked-prompt = 那书签和历史记录系统将不是功能的因为一(个) 的 { -brand-short-name }'s 文件是在使用由另外的应用. 一些安全软设备能引起这问题.

# Share is a verb here. Meaning to "Share" the bookmark "Folder"
# .badge used to promote the sharing menu item; keep it as short as possible.
places-share-folder2 =
  .label = 部分文件夹
  .badge = 新的
