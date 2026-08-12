# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## The address and credit card autofill management dialog in browser preferences

autofill-manage-addresses-title = 保存地址
autofill-manage-addresses-list-header = 地址

autofill-manage-payment-methods-title = 保存付款方法
autofill-manage-cards-list-header = 卡片

autofill-manage-dialog =
    .style = min-width: 560专用小交换机（Private Exchange）
autofill-manage-remove-button = 移除
autofill-manage-add-button = 添加…
autofill-manage-edit-button = 编辑…

## The address capture doorhanger

address-capture-save-doorhanger-header = 保存地址?
address-capture-save-doorhanger-description = 保存信息到 { -brand-short-name } 如此你能填充外面的表单很快地.
address-capture-update-doorhanger-header = 更新地址?
address-capture-edit-doorhanger-header = 编辑地址

address-capture-save-button =
    .label = 保存
    .accessKey = S
address-capture-not-now-button =
    .label = 不现在
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
    .label = 学习更多
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

autofill-address-name = 名称
autofill-address-organization = 组织
autofill-address-street-address = 街道地址

autofill-address-street = 街道地址

# Used in Iran (IR), Mexico (MX) as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-neighborhood = 附近
# Used in Malaysia (MY) as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-village-township = 村庄或小镇
autofill-address-island = 岛
# Used in Ireland (IE) as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-townland = (爱尔兰)教区

autofill-address-city = 城市
# Used in Hong Kong (HK), Sudan (SD), Syria (SY), Türkiye (TR) as as secondary address information (2 levels below the country level).
# Used in Korea as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-district = 区域
# Used in United Kingdom (GB), Norway (NO), Sweden (SE) as as secondary address information (2 levels below the country level).
autofill-address-post-town = 记入城镇
# Used in Australia (AU) as as secondary address information (below the country level).
# Used for international addresses as sublocality (civil entity below a locality, e.g. within a city).
autofill-address-suburb = 市郊住宅区

autofill-address-province = 省
autofill-address-state = 状态
autofill-address-county = 县
# Used in Barbados (BB), Jamaica (JM) as primary address information (1 level below the country level).
autofill-address-parish = 教区
# Used in Japan (JP) as primary address information (1 level below the country level).
autofill-address-prefecture = 地方长官的职位(或辖区)
# Used in Honk Kong (HK) as primary address information (1 level below the country level).
autofill-address-area = 区域
# Used in Korea (KO) as primary address information (1 level below the country level).
autofill-address-do-si = 做/国际单位制
# Used in Nicaragua (NI), Colombia (CO) as primary address information (1 level below the country level).
autofill-address-department = 部门
# Used in United Arab Emirates (AE) as primary address information (1 level below the country level).
autofill-address-emirate = 埃米尔的地位
# Used in Russia (RU), Ukraine (UA) as primary address information (1 level below the country level).
autofill-address-oblast = 州(苏联各加盟共和国的行政区划名称)

# Postal code field used in India (IN).
autofill-address-pin = 大头针
autofill-address-postal-code = 邮政的代码
# Postal code field.
autofill-address-zip = ZIP 代码
# Postal code field used in Ireland (IE).
autofill-address-eircode = Eircode

autofill-address-country = 国家或区
autofill-address-country-only = 国家

##

autofill-address-tel = 电话
autofill-address-email = 电子信函

autofill-cancel-button = 取消
autofill-save-button = 保存
autofill-country-warning-message = 表单自动填充是当前可利用的仅为了确定的国家.
autofill-message-tooltip = 查看报文关于自动填充

# The dialog title for creating credit cards in browser preferences.
autofill-add-card-title = 添加卡片
# The dialog title for editing credit cards in browser preferences.
autofill-edit-card-title2 = 编辑卡片

autofill-card-number = 卡片数字
autofill-card-invalid-number = 请输入一个有确实根据的卡片数字
autofill-card-name-on-card = 名称在卡片
autofill-card-expires-month = 经验值. 月
autofill-card-expires-year = 经验值. 年
autofill-card-billing-address = 节目次序地址
autofill-card-network = 卡片类型

# This string is never actually displayed, but is used to make it easier to
# find the payment methods section of about:settings via the search input. It's
# simply a comma separated list of additional search keywords for the payment
# methods section. Localizers should choose terms that make sense for payment
# methods in their region.
autofill-card-search-term-credit-cards = 信用量卡片, 信用量, 卡片, 借方卡片, 借方, 皮夹, 检验
