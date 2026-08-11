# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.

places-open =
  .label = 启动
  .accesskey = O
places-open-in-tab =
  .label = 在新选项卡中启动
  .accesskey = w
places-open-in-container-tab =
  .label = 在新容器选项卡中启动
  .accesskey = i
places-open-all-bookmarks =
  .label = 启动所有书签
  .accesskey = O
places-open-all-in-tabs =
  .label = 在选项卡中全部启动
  .accesskey = O
places-open-in-window =
  .label = 在新窗口中启动
  .accesskey = N
places-open-in-private-window =
  .label = 在新隐私窗口中启动
  .accesskey = P

places-empty-bookmarks-folder =
  .label = （空）

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
  .label = 按日期
  .accesskey = D
places-by-site =
  .label = 按站点
  .accesskey = S
places-by-most-visited =
  .label = 按最多访问
  .accesskey = V
places-by-last-visited =
  .label = 按最后访问
  .accesskey = L
places-by-day-and-site =
  .label = 按日期和站点
  .accesskey = t

places-history-search =
  .placeholder = 搜索历史记录
places-history =
  .aria-label = 历史记录
places-bookmarks-search =
  .placeholder = 搜索书签

places-forget-domain-data =
  .label = 遗忘此站点的数据…
  .accesskey = F
places-sortby-name =
  .label = 按名称排序
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
          [1] 删除页面
         *[other] 删除页面
      }
  .accesskey = D

# Managed bookmarks are created by enterprise policy and cannot be changed by the user.
managed-bookmarks =
  .label = 受管书签
# This label is used when a managed bookmarks folder doesn't have a name.
managed-bookmarks-subfolder =
  .label = 子文件夹

# This label is used for the "Other Bookmarks" folder that appears in the bookmarks toolbar.
other-bookmarks-folder =
  .label = 其他书签

places-show-in-folder =
  .label = 在文件夹中显示
  .accesskey = F

# Variables:
# $count (number) - The number of elements being selected for removal.
places-delete-bookmark =
  .label =
      { $count ->
          [1] 删除书签
         *[other] 删除多个书签
      }
  .accesskey = D

# Variables:
#   $count (number) - The number of bookmarks being added.
places-create-bookmark =
  .label =
      { $count ->
          [1] 书签此页面…
         *[other] 书签多个页面…
      }
  .accesskey = B

places-untag-bookmark =
  .label = 移除标签
  .accesskey = R

places-manage-bookmarks =
  .label = 管理书签
  .accesskey = M

places-library3 =
  .title = 库

places-organize-button =
  .label = 组织
  .tooltiptext = 组织您的书签
  .accesskey = O

places-file-close =
  .label = 关闭
  .accesskey = C

places-cmd-close =
  .key = w

places-view-button =
  .label = 视图
  .tooltiptext = 更改您的视图
  .accesskey = V

places-view-menu-columns =
  .label = 显示列
  .accesskey = C

places-view-menu-sort =
  .label = 排序
  .accesskey = S

places-view-sort-unsorted =
  .label = 未排序
  .accesskey = U

places-view-sort-ascending =
  .label = A > Z 排序顺序
  .accesskey = A

places-view-sort-descending =
  .label = Z > A 排序顺序
  .accesskey = Z

places-maintenance-button =
  .label = 导入和备份
  .tooltiptext = 导入和备份您的书签
  .accesskey = I

places-cmd-backup =
  .label = 备份…
  .accesskey = B

places-cmd-restore =
  .label = 恢复
  .accesskey = R

places-cmd-restore-from-file =
  .label = 选择文件…
  .accesskey = C

places-import-bookmarks-from-html =
  .label = 从 HTML 导入书签…
  .accesskey = I

places-export-bookmarks-to-html =
  .label = 将书签导出到 HTML…
  .accesskey = E

places-import-other-browser =
  .label = 从另一浏览器导入数据…
  .accesskey = A

places-view-sort-col-name =
  .label = 名称

places-view-sort-col-tags =
  .label = 标签

places-view-sort-col-url =
  .label = 位置

places-view-sort-col-most-recent-visit =
  .label = 最近访问

places-view-sort-col-visit-count =
  .label = 访问次数

places-view-sort-col-date-added =
  .label = 添加时间

places-view-sort-col-last-modified =
  .label = 最后修改

places-view-sortby-name =
  .label = 按名称排序
  .accesskey = N
places-view-sortby-url =
  .label = 按位置排序
  .accesskey = 位
places-view-sortby-date =
  .label = 按最近访问时间排序
  .accesskey = 访
places-view-sortby-visit-count =
  .label = 按访问次数排序
  .accesskey = 次
places-view-sortby-date-added =
  .label = 按添加时间排序
  .accesskey = 添
places-view-sortby-last-modified =
  .label = 按最后修改时间排序
  .accesskey = 修
places-view-sortby-tags =
  .label = 按标签排序
  .accesskey = 标

places-cmd-find-key =
  .key = f

places-back-button =
  .tooltiptext = 返回

places-forward-button =
  .tooltiptext = 前进

places-details-pane-select-an-item-description = 请选择一项以查看和编辑其属性

places-details-pane-no-items =
  .value = 无项目
# Variables:
#   $count (Number): number of items
places-details-pane-items-count =
  .value =
      { $count ->
          [one] 一项
         *[other] { $count } 项
      }

## Strings used as a placeholder in the Library search field. For example,
## "Search History" stands for "Search through the browser's history".

places-search-bookmarks =
    .placeholder = 搜索书签
places-search-history =
    .placeholder = 搜索历史记录
places-search-downloads =
    .placeholder = 搜索下载记录

##

places-locked-prompt = 书签和歴史记录系统将无法正常工作，因为 { -brand-short-name } 的某个文件正被另一应用程序使用。某些安全软件可能导致此问题。

# Share is a verb here. Meaning to "Share" the bookmark "Folder"
# .badge used to promote the sharing menu item; keep it as short as possible.
places-share-folder2 =
  .label = 共享文件夹
  .badge = 新