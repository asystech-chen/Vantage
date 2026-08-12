# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## The address and credit card autofill management dialog in browser preferences

autofill-manage-addresses-title = 已保存的地址
autofill-manage-addresses-list-header = 地址

autofill-manage-payment-methods-title = 已保存的付款方式
autofill-manage-cards-list-header = 卡片

autofill-manage-dialog =
    .style = 最小宽度：560像素
autofill-manage-remove-button = 移除
autofill-manage-add-button = 添加…
autofill-manage-edit-button = 编辑…

## The address capture doorhanger

address-capture-save-doorhanger-header = 保存地址？
address-capture-save-doorhanger-description = 将信息保存到 { -brand-short-name }，以便您能够快速填写表单。
address-capture-update-doorhanger-header = 更新地址？
address-capture-edit-doorhanger-header = 编辑地址

address-capture-save-button =
    .label = 保存
    .accessKey = S
address-capture-not-now-button =
    .label = 暂不
    .accessKey = N
address-capture-cancel-button =
    .label = 取消
    .accessKey = C
address-capture-update-button =
    .label = 更新
    .accessKey = U
address-capture-manage-address-button =
    .label = 地址设置
address-capture-learn-more-button =
    .label = 了解更多
address-capture-open-menu-button =
    .aria-label = 打开菜单
address-capture-edit-address-link = 编辑地址
    .aria-label = 编辑地址


# The dialog title for creating addresses in browser preferences.
autofill-add-address-title = 添加地址
# The dialog title for editing addresses in browser preferences.
autofill-edit-address-title = 编辑地址

## Labels for address fields (e.g. for a mailing address) used as part of the form
## autofill feature. For more information on the address structure (e.g. levels),
## see also https://developers.google.com/maps/documentation/javascript/geocoding

autofill-address-name = 姓名
autofill-address-organization = 组织
autofill-address-street-address = 街道地址

autofill-address-street = 街道地址

# Used in Iran (IR), Mexico (MX) as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-neighborhood = 邻里
# Used in Malaysia (MY) as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-village-township = 村庄或乡镇
autofill-address-island = 岛屿
# Used in Ireland (IE) as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-townland = 城镇用地

autofill-address-city = 城市
# Used in Hong Kong (HK), Sudan (SD), Syria (SY), Türkiye (TR) as as secondary address information (2 levels below the country level).
# Used in Korea as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-district = 区
# Used in United Kingdom (GB), Norway (NO), Sweden (SE) as as secondary address information (2 levels below the country level).
autofill-address-post-town = 邮政城镇
# Used in Australia (AU) as as secondary address information (below the country level).
# Used for international addresses as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-suburb = 郊区

autofill-address-province = 省
autofill-address-state = 州
autofill-address-county = 县
# Used in Barbados (BB), Jamaica (JM) as primary address information (1 level below the country level).
autofill-address-parish = 教区
# Used in Japan (JP) as primary address information (1 level below the country level).
autofill-address-prefecture = 府县
# Used in Honk Kong (HK) as primary address information (1 level below the country level).
autofill-address-area = 区域
# Used in Korea (KO) as primary address information (1 level below the country level).
autofill-address-do-si = 道/市
# Used in Nicaragua (NI), Colombia (CO) as primary address information (1 level below the country level).
autofill-address-department = 部门
# Used in United Arab Emirates (AE) as primary address information (1 level below the country level).
autofill-address-emirate = 酋长国
# Used in Russia (RU), Ukraine (UA) as primary address information (1 level below the country level).
autofill-address-oblast = 州

# Postal code field used in India (IN).
autofill-address-pin = 邮政索引号
autofill-address-postal-code = 邮政编码
# Postal code field.
autofill-address-zip = ZIP 码
# Postal code field used in Ireland (IE).
autofill-address-eircode = Eircode

autofill-address-country = 国家或地区
autofill-address-country-only = 国家

##

autofill-address-tel = 电话
autofill-address-email = 电子邮件

autofill-cancel-button = 取消
autofill-save-button = 保存
autofill-country-warning-message = 表单自动填充功能目前仅适用于某些国家/地区。
autofill-message-tooltip = 查看有关自动填充的消息

# The dialog title for creating credit cards in browser preferences.
autofill-add-card-title = 添加银行卡
# The dialog title for editing credit cards in browser preferences.
autofill-edit-card-title2 = 编辑银行卡

autofill-card-number = 银行卡号码
autofill-card-invalid-number = 请输入有效的银行卡号码
autofill-card-name-on-card = 卡上姓名
autofill-card-expires-month = 过期月份
autofill-card-expires-year = 过期年份
autofill-card-billing-address = 账单地址
autofill-card-network = 银行卡类型

# This string is never actually displayed, but is used to make it easier to
# find the payment methods section of about:settings via the search input. It's
# simply a comma separated list of additional search keywords for the payment
# methods section. Localizers should choose terms that make sense for payment
# methods in their region.
autofill-card-search-term-credit-cards = credit cards, credit, cards, debit cards, debit, wallet, checkout
