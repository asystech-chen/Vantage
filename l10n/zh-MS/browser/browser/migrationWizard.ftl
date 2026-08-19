# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

migration-wizard-selection-header = 引入浏览器论据
migration-wizard-selection-list = 选择那论据你将相似的到引入.

# Shown in the new migration wizard's dropdown selector for choosing the browser
# to import from. This variant is shown when the selected browser doesn't support
# user profiles, and so we only show the browser name.
#
# Variables:
#  $sourceBrowser (String): the name of the browser to import from.
migration-wizard-selection-option-without-profile = { $sourceBrowser }

# Shown in the new migration wizard's dropdown selector for choosing the browser
# and user profile to import from. This variant is shown when the selected browser
# supports user profiles.
#
# Variables:
#  $sourceBrowser (String): the name of the browser to import from.
#  $profileName (String): the name of the user profile to import from.
migration-wizard-selection-option-with-profile = { $sourceBrowser } — { $profileName }

# Each migrator is expected to include a display name string, and that display
# name string should have a key with "migration-wizard-migrator-display-name-"
# as a prefix followed by the unique identification key for the migrator.

migration-wizard-migrator-display-name-brave = 勇敢的
migration-wizard-migrator-display-name-canary = 铬金丝雀
migration-wizard-migrator-display-name-chrome = 铬
migration-wizard-migrator-display-name-chrome-beta = 铬希腊字母表的第二个字母
migration-wizard-migrator-display-name-chrome-dev = 铬发展
migration-wizard-migrator-display-name-chromium = 铬
migration-wizard-migrator-display-name-chromium-360se = 360 无虑的浏览器
migration-wizard-migrator-display-name-chromium-edge = 巨硬边缘
migration-wizard-migrator-display-name-chromium-edge-beta = 巨硬边缘希腊字母表的第二个字母
migration-wizard-migrator-display-name-edge-legacy = 巨硬边缘祖先传下来之物
migration-wizard-migrator-display-name-firefox = 火狐
migration-wizard-migrator-display-name-file-password-csv = 密码从 CSV 文件
migration-wizard-migrator-display-name-file-bookmarks = 书签从 HTML 文件
migration-wizard-migrator-display-name-ie = 巨硬因特网探险家
migration-wizard-migrator-display-name-opera = 歌剧
migration-wizard-migrator-display-name-opera-gx = 歌剧 GX
migration-wizard-migrator-display-name-safari = 旅行
migration-wizard-migrator-display-name-vivaldi = 维瓦尔第（一个作曲家）

migration-source-name-ie = 因特网探险家
migration-source-name-edge = 巨硬边缘
migration-source-name-chrome = 谷歌铬

migration-imported-safari-reading-list = 阅读列表 (从旅行)
migration-imported-edge-reading-list = 阅读列表 (从边缘)

## These strings are shown if the selected browser data directory is unreadable.
## In practice, this tends to only occur on Linux when Firefox
## is installed as a Snap.

migration-no-permissions-message = { -brand-short-name } 做不有访问到其他的 browsers' 提问档安装在这装置.

migration-no-permissions-instructions = 到继续导入论据从另外的浏览器, 授权命令 { -brand-short-name } 访问到它的提问档文件夹.

migration-no-permissions-instructions-step1 = 选择“继续”

# The second step in getting permissions to read data for the selected
# browser type.
#
# Variables:
#  $permissionsPath (String): the file system path that the user will need to grant read permission to.
migration-no-permissions-instructions-step2 = 在那文件啄者, 航行到 <code>{ $permissionsPath }</code> 和选取“选择”

## These strings will be displayed based on how many resources are selected to import

migration-all-available-data-label = 引入所有的可利用的论据
migration-no-selected-data-label = 无论据被选的为了引入
migration-selected-data-label = 引入被选的论据

##

migration-select-all-option-label = 选择所有的
migration-bookmarks-option-label = 书签

# Favorites is used for Bookmarks when importing from Internet Explorer or
# Edge, as this is the terminology for bookmarks on those browsers.
migration-favorites-option-label = 喜欢的事物

migration-passwords-option-label = 保存密码
migration-history-option-label = 浏览历史记录
migration-extensions-option-label = 扩展名
migration-form-autofill-option-label = 表单自动填充论据
migration-payment-methods-option-label = 付款方法
migration-cookies-option-label = 饼干
migration-session-option-label = 窗和标签页
migration-otherdata-option-label = 其他的论据

migration-passwords-from-file-progress-header = 引入密码文件
migration-passwords-from-file-success-header = 密码输入成功
migration-passwords-from-file = 检查的文件为了密码
migration-passwords-new = 新的密码
migration-passwords-updated = 现成的密码
migration-passwords-from-file-no-valid-data = 那文件不包含任何的有确实根据的密码论据. 拾取另外的文件.

migration-passwords-from-file-picker-title = 引入密码文件
# A description for the .csv file format that may be shown as the file type
# filter by the operating system.
migration-passwords-from-file-csv-filter-title =
  { PLATFORM() ->
      [macos] CSV 文档
     *[other] CSV 文件
  }
# A description for the .tsv file format that may be shown as the file type
# filter by the operating system. TSV is short for 'tab separated values'.
migration-passwords-from-file-tsv-filter-title =
  { PLATFORM() ->
      [macos] TSV 文档
     *[other] TSV 文件
  }

# Shown in the migration wizard after importing passwords from a file
# has completed, if new passwords were added.
#
# Variables:
#  $newEntries (Number): the number of new successfully imported passwords
migration-wizard-progress-success-new-passwords =
    { $newEntries ->
        [one] { $newEntries } 额外的
       *[other] { $newEntries } 额外的
    }

# Shown in the migration wizard after importing passwords from a file
# has completed, if existing passwords were updated.
#
# Variables:
#  $updatedEntries (Number): the number of updated passwords
migration-wizard-progress-success-updated-passwords =
    { $updatedEntries ->
        [one] { $updatedEntries } 更新的
       *[other] { $updatedEntries } 更新的
    }

migration-bookmarks-from-file-picker-title = 引入书签文件
migration-bookmarks-from-file-progress-header = 导入书签
migration-bookmarks-from-file = 书签
migration-bookmarks-from-file-success-header = 书签输入成功
migration-bookmarks-from-file-no-valid-data = 那文件不包含任何的书签论据. 拾取另外的文件.

# A description for the .html file format that may be shown as the file type
# filter by the operating system.
migration-bookmarks-from-file-html-filter-title =
  { PLATFORM() ->
      [macos] HTML 文档
     *[other] HTML 文件
  }

# A description for the .json file format that may be shown as the file type
# filter by the operating system.
migration-bookmarks-from-file-json-filter-title = JSON 文件

# Shown in the migration wizard after importing bookmarks from a file
# has completed.
#
# Variables:
#  $newEntries (Number): the number of imported bookmarks.
migration-wizard-progress-success-new-bookmarks =
    { $newEntries ->
        [one] { $newEntries } 书签
       *[other] { $newEntries } 书签
    }

migration-import-button-label = 引入
migration-choose-to-import-from-file-button-label = 引入从文件
migration-import-from-file-button-label = 选择文件
migration-cancel-button-label = 取消
migration-done-button-label = 完成了的
migration-continue-button-label = 继续

migration-wizard-import-browser-no-browsers = { -brand-short-name } 不能发现任何的程序那包含书签, 历史记录或密码论据.
migration-wizard-import-browser-no-resources = 那里曾是一个错误. { -brand-short-name } 不能发现任何的论据到引入从那浏览器提问档.

## These strings will be used to create a dynamic list of items that can be
## imported. The list will be created using Intl.ListFormat(), so it will
## follow each locale's rules, and the first item will be capitalized by code.
## When applicable, the resources should be in their plural form.
## For example, a possible list could be "Bookmarks, passwords and autofill data".

migration-list-bookmark-label = 书签

# “favorites” refers to bookmarks in Edge and Internet Explorer. Use the same terminology
# if the browser is available in your language.
migration-list-favorites-label = 喜欢的事物
migration-list-password-label = 密码
migration-list-history-label = 历史记录
migration-list-extensions-label = 扩展名
migration-list-autofill-label = 自动填充论据
migration-list-payment-methods-label = 付款方法

##

migration-wizard-progress-header = 导入论据

# This header appears in the final page of the migration wizard only if
# all resources were imported successfully.
migration-wizard-progress-done-header = 论据输入成功

# This header appears in the final page of the migration wizard if only
# some of the resources were imported successfully. This is meant to be
# distinct from migration-wizard-progress-done-header, which is only shown
# if all resources were imported successfully.
migration-wizard-progress-done-with-warnings-header = 论据引入完全的

migration-wizard-progress-icon-in-progress =
  .aria-label = 导入…
migration-wizard-progress-icon-completed =
  .aria-label = 完整的

migration-safari-password-import-header = 引入密码从旅行
migration-safari-password-import-steps-header = 到引入旅行密码:
migration-safari-password-import-step1 = 在旅行, 打开“旅行”菜单和去到首选项 > 密码
migration-safari-password-import-step2 = 选择那 <img data-l10n-name="safari-icon-3dots"/> 按钮和选取“导出所有的密码”
migration-safari-password-import-step3 = 保存那密码文件
migration-safari-password-import-step4 = 使用“选择文件”在下面到选取那密码文件你保存

migration-chrome-windows-password-import-header = 如何到引入密码从铬
migration-chrome-windows-password-import-steps-header = 在铬:
migration-chrome-windows-password-import-step1 = 打开那主群组菜单 <img data-l10n-name="chrome-icon-3dots"/> 和去到密码和自动填充 > 谷歌密码管理器.
migration-chrome-windows-password-import-step2 = 选择“设置”从那菜单.
migration-chrome-windows-password-import-step3 = 选取“下载文件”和保存它到你的装置.
migration-chrome-windows-password-import-step4 = Return 这里和“选择文件”到完成引入.

migration-manual-password-import-skip-button = 跳过
migration-manual-password-import-select-button = 选择文件

# Shown in the migration wizard after importing bookmarks from another
# browser has completed.
#
# Variables:
#  $quantity (Number): the number of successfully imported bookmarks
migration-wizard-progress-success-bookmarks =
    { $quantity ->
        [one] { $quantity } 书签
       *[other] { $quantity } 书签
    }

# Shown in the migration wizard after importing bookmarks from either
# Internet Explorer or Edge.
#
# Use the same terminology if the browser is available in your language.
#
# Variables:
#  $quantity (Number): the number of successfully imported bookmarks
migration-wizard-progress-success-favorites =
    { $quantity ->
        [one] { $quantity } 喜欢的事物
       *[other] { $quantity } 喜欢的事物
    }

## The import process identifies extensions installed in other supported
## browsers and installs the corresponding (matching) extensions compatible
## with Firefox, if available.

# Shown in the migration wizard after importing all matched extensions
# from supported browsers.
#
# Variables:
#   $quantity (Number): the number of successfully imported extensions
migration-wizard-progress-success-extensions =
    { $quantity ->
        [one] { $quantity } 扩展名
       *[other] { $quantity } 扩展名
    }

# Shown in the migration wizard after importing a partial amount of
# matched extensions from supported browsers.
#
# Variables:
#   $matched (Number): the number of matched imported extensions
#   $quantity (Number): the number of total extensions found during import
migration-wizard-progress-partial-success-extensions = { $matched } 的 { $quantity } 扩展名

migration-wizard-progress-extensions-support-link = 学习如何 { -brand-product-name } 比较扩展名
# Shown in the migration wizard if there are no matched extensions
# on import from supported browsers.
migration-wizard-progress-no-matched-extensions = 无匹配扩展名

migration-wizard-progress-extensions-addons-link = 浏览扩展名为了 { -brand-short-name }

##

# Shown in the migration wizard after importing passwords from another
# browser has completed.
#
# Variables:
#  $quantity (Number): the number of successfully imported passwords
migration-wizard-progress-success-passwords =
    { $quantity ->
        [one] { $quantity } 密码
       *[other] { $quantity } 密码
    }

# Shown in the migration wizard after importing history from another
# browser has completed.
#
# Variables:
#  $maxAgeInDays (Number): the maximum number of days of history that might be imported.
migration-wizard-progress-success-history =
    { $maxAgeInDays ->
        [one] 从那最后天
       *[other] 从那最后 { $maxAgeInDays } 天
    }

migration-wizard-progress-success-formdata = 表单历史记录

# Shown in the migration wizard after importing payment methods from another
# browser has completed.
#
# Variables:
#  $quantity (Number): the number of successfully imported payment methods
migration-wizard-progress-success-payment-methods =
    { $quantity ->
        [one] { $quantity } 付款方法
       *[other] { $quantity } 付款方法
    }

migration-wizard-safari-permissions-sub-header = 到引入旅行书签和浏览历史:
migration-wizard-safari-instructions-continue = 选择“继续”
migration-wizard-safari-instructions-folder = 选择旅行文件夹在那列表和选取“打开”
