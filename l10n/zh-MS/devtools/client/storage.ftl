# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are used inside the Storage Inspector.

# Key shortcut used to focus the filter box on top of the data view
storage-filter-key = CmdOrCtrl+故障

# Hint shown when the selected storage host does not contain any data
storage-table-empty-text = 无论据现在为了被选的主机

# Hint shown when the cookies storage type is selected. Clicking the link will open
# https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/cookies/
storage-table-type-cookies-hint = 查看和编辑饼干由选择一个主机. <a data-l10n-name="learn-more-link">学习更多</a>

# Hint shown when the local storage type is selected. Clicking the link will open
# https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/local_storage_session_storage/
storage-table-type-localstorage-hint = 查看和编辑那本地的存放处由选择一个主机. <a data-l10n-name="learn-more-link">学习更多</a>

# Hint shown when the session storage type is selected. Clicking the link will open
# https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/local_storage_session_storage/
storage-table-type-sessionstorage-hint = 查看和编辑那会话存放处由选择一个主机. <a data-l10n-name="learn-more-link">学习更多</a>

# Hint shown when the IndexedDB storage type is selected. Clicking the link will open
# https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/indexeddb/
storage-table-type-indexeddb-hint = 查看和删除 IndexedDB 登录项由选择一个数据库. <a data-l10n-name="learn-more-link">学习更多</a>

# Hint shown when the cache storage type is selected. Clicking the link will open
# https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/cache_storage/
storage-table-type-cache-hint = 查看和删除那高速缓冲存储器存放处登录项由选择一个存放处. <a data-l10n-name="learn-more-link">学习更多</a>

# Hint shown when the extension storage type is selected. Clicking the link will open
# https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/extension_storage/
storage-table-type-extensionstorage-hint = 查看和编辑那扩展名存放处由选择一个主机. <a data-l10n-name="learn-more-link">学习更多</a>

# Placeholder for the searchbox that allows you to filter the table items
storage-search-box =
  .placeholder = 过滤器项

# Placeholder text in the sidebar search box
storage-variable-view-search-box =
  .placeholder = 过滤器计算结果

# Add Item button title
storage-add-button =
  .title = 添加项

storage-delete-all-button =
  .title = 删除所有的

# Refresh button title
storage-refresh-button =
  .title = 刷新项

# Context menu action to delete all storage items
storage-context-menu-delete-all =
  .label = 删除所有的

# Context menu action to delete all session cookies
storage-context-menu-delete-all-session-cookies =
  .label = 删除所有的会话饼干

# Context menu action to copy a storage item
storage-context-menu-copy =
  .label = 复制

# Context menu action to delete storage item
# Variables:
#   $itemName (String) - Name of the storage item that will be deleted
storage-context-menu-delete =
  .label = 删除“{ $itemName }”

# Context menu action to add an item
storage-context-menu-add-item =
  .label = 添加项

# Context menu action to delete all storage items from a given host
# Variables:
#   $host (String) - Host for which we want to delete the items
storage-context-menu-delete-all-from =
  .label = 删除所有的从“{ $host }”

## Header names of the columns in the Storage Table for each type of storage available
## through the Storage Tree to the side.

storage-table-headers-cookies-name = 名称
storage-table-headers-cookies-value = 计算结果
storage-table-headers-cookies-expires = 期满 / 最大-年龄
storage-table-headers-cookies-size = 大小
storage-table-headers-cookies-last-accessed = 最后的接近
storage-table-headers-cookies-creation-time = 创建
storage-table-headers-cookies-update-time = 更新的
storage-table-headers-cache-status = 状态
storage-table-headers-extension-storage-area = 存放处区域

## Labels for Storage type groups present in the Storage Tree, like cookies, local storage etc.

storage-tree-labels-cookies = 饼干
storage-tree-labels-local-storage = 本地的存放处
storage-tree-labels-session-storage = 会话存放处
storage-tree-labels-indexed-db = 编入索引的 DB
storage-tree-labels-cache = 高速缓冲存储器存放处
storage-tree-labels-extension-storage = 扩展名存放处

##

# Tooltip for the button that collapses the right panel in the
# storage UI when the panel is closed.
storage-expand-pane =
  .title = 使膨胀窗格

# Tooltip for the button that collapses the right panel in the
# storage UI when the panel is open.
storage-collapse-pane =
  .title = 折叠窗格

# String displayed in the expires column when the cookie is a Session Cookie
storage-expires-session = 会话

# Heading displayed over the item value in the sidebar
storage-data = 论据

# Heading displayed over the item parsed value in the sidebar
storage-parsed-value = 从语法上描述或分析（词句等）计算结果

# Warning notification when IndexedDB database could not be deleted immediately.
# Variables:
#   $dbName (String) - Name of the database
storage-idb-delete-blocked = 数据库“{ $dbName }”将是删除在...之后全部连接是关闭.

# Error notification when IndexedDB database could not be deleted.
# Variables:
#   $dbName (String) - Name of the database
storage-idb-delete-error = 数据库“{ $dbName }”能够不是删除.

# Error notification when cookie could not be created (e.g. because it's invalid).
# Variables:
#   $errorString (String) - Platform error message
storage-cookie-create-error = 饼干能够不是创建: “{ $errorString }”.

# Error notification when cookie could not be edited (e.g. because it's invalid).
# Variables:
#   $errorString (String) - Platform error message
storage-cookie-edit-error = 饼干能够不是更新的: “{ $errorString }”.
