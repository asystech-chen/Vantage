# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These strings are used for errors when installing OpenSearch engines, e.g.
## via "Add Search Engine" on the address bar or search bar.
## Variables
## $location-url (String) - the URL of the OpenSearch engine that was attempted to be installed.

opensearch-error-duplicate-title = 安装错误
opensearch-error-duplicate-desc = { -brand-short-name } 无法从“{ $location-url }”安装搜索插件，因为已存在同名引擎。

opensearch-error-format-title = 格式无效
opensearch-error-format-desc = { -brand-short-name } 无法从以下位置安装搜索引擎：{ $location-url }

opensearch-error-download-title = 下载错误
opensearch-error-download-desc =
    { -brand-short-name } 无法从以下位置下载搜索插件：{ $location-url }

##

searchbar-submit =
    .tooltiptext = 提交搜索

# This string is displayed in the search box when the input field is empty
searchbar-input =
    .placeholder = 搜索

searchbar-icon =
    .tooltiptext = 搜索

## Infobar shown when search engine is removed and replaced.
## Variables
## $oldEngine (String) - the search engine to be removed.
## $newEngine (String) - the search engine to replace the removed search engine.

removed-search-engine-message2 = <strong>您的默认搜索引擎已被更改。</strong> { $oldEngine } 不再可用作 { -brand-short-name } 中的默认搜索引擎。{ $newEngine } 现在是您的默认搜索引擎。若要更改其他默认搜索引擎，请前往设置。
remove-search-engine-button = 确定

## Infobar shown when default search engine is reset due to an issue reading the settings file.
## Variables
## $newEngine (String) - the name of the new default search engine.

reset-search-settings-message = 由于技术问题，您的默认搜索引擎已恢复为 { $newEngine }。若要更改默认搜索引擎，请前往设置。
reset-search-settings-button = 确定

## Infobar shown when user is prompted to install search engine.
## Variables
## $engineName (String) - the name of the search engine to install.

install-search-engine = 将 { $engineName } 添加为搜索引擎？
install-search-engine-add = 添加
install-search-engine-no = 否

## These strings are used for the add engine dialog when adding a custom search engine
## in settings or when adding an HTML form as a search engine.

add-engine-window =
    .title = 添加搜索引擎
    .style = min-width: 32em;

edit-engine-window =
    .title = 编辑搜索引擎
    .style = min-width: 32em;

add-engine-button = 添加自定义引擎

## The following strings are used as input labels.

add-engine-name = 搜索引擎名称
add-engine-url2 = 使用 %s 代替搜索词的 URL
add-engine-keyword2 = 关键字（可选）
# POST and GET refer to the HTTP methods.
add-engine-post-data = 使用 %s 代替搜索词的 POST 数据（留空以使用 GET）
add-engine-suggest-url = 使用 %s 代替搜索词的建议 URL（可选）

## The following placeholders are shown in the inputs when adding a new engine.

add-engine-name-placeholder =
    .placeholder = 例如：Mozilla 开发者网络
add-engine-url-placeholder =
    .placeholder = 例如：https://developer.mozilla.com/search?q=%s
add-engine-keyword-placeholder =
    .placeholder = 例如：@mdn

## The following strings are used as error messages.

add-engine-keyword-exists = 该关键字已被使用。请尝试其他关键字。
add-engine-name-exists = 该名称已被使用。请选择其他名称。
add-engine-no-name = 请添加名称。
add-engine-no-url = 请输入 URL。
add-engine-invalid-url = 该 URL 似乎不正确。请检查后重试。
add-engine-invalid-protocol = 该 URL 似乎不正确。请使用以 http 或 https 开头的 URL。
# This error is shown when the user typed URL is missing %s.
add-engine-missing-terms-url = 请尝试在 URL 中包含 %s 以代替搜索词。
# This error is shown when the user typed post data is missing %s.
add-engine-missing-terms-post-data = 请尝试在 POST 数据中包含 %s 以代替搜索词。

## The following strings are used as labels for the dialog's buttons.

# buttonlabelextra1 is the label of a button to open the advanced section
# of the dialog.
add-engine-dialog2 =
    .buttonlabelaccept = 添加引擎
    .buttonaccesskeyaccept = A
    .buttonlabelextra1 = 高级

# buttonlabelextra1 is the label of a button to open the advanced section
# of the dialog.
edit-engine-dialog =
    .buttonlabelaccept = 保存引擎
    .buttonaccesskeyaccept = S
    .buttonlabelextra1 = 高级