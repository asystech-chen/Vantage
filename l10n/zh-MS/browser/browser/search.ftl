# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## These strings are used for errors when installing OpenSearch engines, e.g.
## via "Add Search Engine" on the address bar or search bar.
## Variables
## $location-url (String) - the URL of the OpenSearch engine that was attempted to be installed.

opensearch-error-duplicate-title = 安装错误
opensearch-error-duplicate-desc = { -brand-short-name } 能够不安装那搜索相关插件从“{ $location-url }”因为一个引擎与那相同的名称已经存在.

opensearch-error-format-title = 病人开本
opensearch-error-format-desc = { -brand-short-name } 能够不安装那搜索引擎从: { $location-url }

opensearch-error-download-title = 下载错误
opensearch-error-download-desc =
    { -brand-short-name } could not download the search plugin from: { $location-url }

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

removed-search-engine-message2 = <strong>你的默认搜索引擎有是更改.</strong> { $oldEngine } 是无比较久可利用的作为一个默认搜索引擎在 { -brand-short-name }. { $newEngine } 是现在你的默认搜索引擎. 到更改到另外的默认搜索引擎, 去到设置.
remove-search-engine-button = OK

## Infobar shown when default search engine is reset due to an issue reading the settings file.
## Variables
## $newEngine (String) - the name of the new default search engine.

reset-search-settings-message = 由于一个技术上的发行, 你的默认搜索引擎有是更改后面的到 { $newEngine }. 到更改那默认搜索引擎, 去到设置.
reset-search-settings-button = OK

## Infobar shown when user is prompted to install search engine.
## Variables
## $engineName (String) - the name of the search engine to install.

install-search-engine = 添加 { $engineName } 作为一个搜索引擎?
install-search-engine-add = 添加
install-search-engine-no = 无

## These strings are used for the add engine dialog when adding a custom search engine
## in settings or when adding an HTML form as a search engine.

add-engine-window =
    .title = 添加搜索引擎
    .style = min-width: 32媒体用毕符;

edit-engine-window =
    .title = 编辑搜索引擎
    .style = min-width: 32媒体用毕符;

add-engine-button = 添加定制引擎

## The following strings are used as input labels.

add-engine-name = 搜索引擎名称
add-engine-url2 = URL 与 %标量在地方的搜索检索词
add-engine-keyword2 = 关键字 (可选择的)
# POST and GET refer to the HTTP methods.
add-engine-post-data = POST 资料与 %标量在地方的搜索检索词 (许可空为了 GET)
add-engine-suggest-url = 提议 URL 与 %标量在地方的搜索检索词 (可选择的)

## The following placeholders are shown in the inputs when adding a new engine.

add-engine-name-placeholder =
    .placeholder = 元件.千兆., 摩斯拉显影器网络
add-engine-url-placeholder =
    .placeholder = 元件.千兆., 超文本传输协议://显影器.摩斯拉.com/搜索?质量=%标量
add-engine-keyword-placeholder =
    .placeholder = 元件.千兆., @median 中部

## The following strings are used as error messages.

add-engine-keyword-exists = 那关键字是已经存在使用. 尝试一个不同的一(个).
add-engine-name-exists = 那名称是已经存在使用. 请选取一个不同的一(个).
add-engine-no-name = 请添加一个名称.
add-engine-no-url = 请输入一个 URL.
add-engine-invalid-url = 那 URL 不一看右. 请复选它和尝试再一次.
add-engine-invalid-protocol = 那 URL 不一看右. 使用一个 URL 那启动与超文本传输协议或超文本传输协议.
# This error is shown when the user typed URL is missing %s.
add-engine-missing-terms-url = 尝试包含 %标量在地方的那搜索检索词.
# This error is shown when the user typed post data is missing %s.
add-engine-missing-terms-post-data = 尝试包含 %标量在地方的那搜索检索词.

## The following strings are used as labels for the dialog's buttons.

# buttonlabelextra1 is the label of a button to open the advanced section
# of the dialog.
add-engine-dialog2 =
    .buttonlabelaccept = 添加引擎
    .buttonaccesskeyaccept = A
    .buttonlabelextra1 = 在前的

# buttonlabelextra1 is the label of a button to open the advanced section
# of the dialog.
edit-engine-dialog =
    .buttonlabelaccept = 保存引擎
    .buttonaccesskeyaccept = S
    .buttonlabelextra1 = 在前的
