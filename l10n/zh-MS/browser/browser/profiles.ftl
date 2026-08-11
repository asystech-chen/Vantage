# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

profile-window-title-2 = { -brand-short-name } - 正在选择配置文件

profile-window-logo =
    .alt = { -brand-short-name } 徽标
profile-window-heading = 正在选择 { -brand-short-name } 配置文件
profile-window-body = 建议您将工作浏览与个人浏览，包括密码和书签等项目，保持完全分离。或者为使用此设备的每位用户创建相应配置文件。
# This checkbox appears in the Choose profile window that appears when the browser is opened. "Show this" refers to this window, which is displayed when the checkbox is enabled.
profile-window-checkbox-label-2 =
    .label = 在 { -brand-short-name } 启动时选择配置文件
# This subcopy appears below the checkbox when it is unchecked
profile-window-checkbox-subcopy = { -brand-short-name } 将启动至您最近使用的配置文件。
profile-window-create-profile = 正在创建配置文件
profile-card-edit-button =
    .title = 正在编辑配置文件
    .aria-label = 正在编辑配置文件
profile-card-delete-button =
    .title = 正在删除配置文件
    .aria-label = 正在删除配置文件

# Variables
#   $profileName (string) - The name of the profile
profile-card =
    .title = 正在启动 { $profileName }
    .aria-label = 正在启动 { $profileName }

# Variables
#   $number (number) - The number of the profile
default-profile-name = 配置文件 { $number }

# The word 'original' is used in the sense that it is the initial or starting profile when you install Firefox.
original-profile-name = 原始配置文件

default-desktop-shortcut-name = { -brand-short-name }

edit-profile-page-title = 正在编辑配置文件
edit-profile-page-header = 正在编辑您的配置文件
edit-profile-page-profile-name-label = 配置文件名称
edit-profile-page-theme-header-2 =
    .label = 主题
edit-profile-page-explore-themes = 正在探索更多主题
edit-profile-page-desktop-shortcut-header = 正在创建桌面快捷方式
edit-profile-page-desktop-shortcut-toggle =
    .aria-label = 正在创建桌面快捷方式
edit-profile-page-avatar-header-2 =
    .label = 头像
edit-profile-page-delete-button =
    .label = 正在删除

edit-profile-page-avatar-selector-opener-link = 正在编辑
avatar-selector-icon-tab = 图标
avatar-selector-custom-tab = 自定义
avatar-selector-cancel-button =
  .label = 正在取消
avatar-selector-save-button =
  .label = 正在保存
avatar-selector-upload-file = 正在上传文件
avatar-selector-drag-file = 或将文件拖拽至此处
avatar-selector-add-image = 正在添加图像
avatar-selector-crop = 正在裁剪

edit-profile-page-no-name = 请为您此配置文件命名，以便日后查找。您可在任意时间重命名。
edit-profile-page-duplicate-name = 配置文件名称已被使用。请尝试新名称。

edit-profile-page-profile-saved = 已保存

new-profile-page-title = 新建配置文件
new-profile-page-header = 正在自定义您的新配置文件
new-profile-page-header-description = 每个配置文件会将其独特的浏览历史记录和设置与您的其他配置文件保持分离。此外，{ -brand-short-name } 的强大隐私保护功能在默认情况下处于启用状态。
new-profile-page-learn-more = 正在了解更多信息
new-profile-page-input-placeholder =
    .placeholder = 请选择类似“工作”或“个人”的名称
new-profile-page-done-button =
    .label = 编辑已完成

# Variables
#   $profilename (String) - The name of the copied profile.
copied-profile-page-header-2 = 您所复制的“{ $profilename }”已准备好进行自定义
copied-profile-page-header-description = 我们已将您的数据和设置复制到新配置文件中。现在请为其命名、选择外观，并使其成为您专属的配置文件。

restored-profile-page-header = 正在自定义您恢复的配置文件
restored-profile-page-header-description = 每个配置文件会将其独特的浏览历史记录和设置与您的其他配置文件保持分离。此外，{ -brand-short-name } 的强大隐私保护功能在默认情况下处于启用状态。
restored-profile-page-learn-more = 正在了解更多信息

## Delete profile dialogue that allows users to review what they will lose if they choose to delete their profile. Each item (open windows, etc.) is displayed in a table, followed by a column with the number of items.

# Variables
#   $profilename (String) - The name of the profile.
delete-profile-page-title-2 = 正在删除“{ $profilename }”配置文件

# Variables
#   $profilename (String) - The name of the profile.
delete-profile-header = 是否正在删除 { $profilename } 配置文件？
delete-profile-description = { -brand-short-name } 将永久删除此设备上的以下数据：
# Open is an adjective, as in "browser windows currently open".
delete-profile-windows = 打开的窗口
# Open is an adjective, as in "browser tabs currently open".
delete-profile-tabs = 打开的标签页
delete-profile-bookmarks = 书签
delete-profile-history = 历史记录（访问过的页面、Cookie、站点数据）
delete-profile-autofill = 自动填充数据（地址、支付方式）
delete-profile-logins = 密码

##

# Button label
delete-profile-cancel = 正在取消
# Button label
delete-profile-confirm = 正在删除

## These strings are color themes available to select from the profile selection screen. Theme names should be localized.

profiles-gray-theme = 灰色
profiles-gray-theme-title =
    .title = 正在应用灰色主题
profiles-yellow-theme = 黄色
profiles-yellow-theme-title =
    .title = 将主题颜色更改为黄色
profiles-orange-theme = 橙色
profiles-orange-theme-title =
    .title = 将主题颜色更改为橙色
profiles-red-theme = 红色
profiles-red-theme-title =
    .title = 将主题颜色更改为红色
profiles-pink-theme = 粉色
profiles-pink-theme-title =
    .title = 将主题颜色更改为粉色
profiles-purple-theme = 紫色
profiles-purple-theme-title =
    .title = 将主题颜色更改为紫色
profiles-violet-theme = 紫罗兰色
profiles-violet-theme-title =
    .title = 将主题颜色更改为紫罗兰色
profiles-blue-theme = 蓝色
profiles-blue-theme-title =
    .title = 将主题颜色更改为蓝色
profiles-green-theme = 绿色
profiles-green-theme-title =
    .title = 将主题颜色更改为绿色
profiles-cyan-theme = 青色
profiles-cyan-theme-title =
    .title = 将主题颜色更改为青色
profiles-custom-theme-title =
    .title = 将自定义主题应用于您的浏览器

# The default system theme
profiles-system-theme = 系统
profiles-system-theme-title =
    .title = 将系统主题应用于您的浏览器

## Data collection settings changed (multi-profile)

# Full infobar message with inline bold title followed by body text
multiprofile-data-collection-message = <strong>数据收集设置已更改。</strong> 在另一个配置文件中所做的更改将应用于此设备上的所有配置文件。

# Primary button label to open the Data collection section in Settings
multiprofile-data-collection-view-settings = 查看设置

# Secondary button label to dismiss the infobar without action
multiprofile-data-collection-dismiss = 关闭

## Alternative text for default profile icons

barbell-avatar-alt =
    .alt = 杠铃
bike-avatar-alt =
    .alt = 自行车
book-avatar-alt =
    .alt = 书本
briefcase-avatar-alt =
    .alt = 公文包
picture-avatar-alt =
    .alt = 图片
# Craft refers to hobby arts and crafts, represented by a button/fastener commonly found on clothing like shirts
craft-avatar-alt =
    .alt = 手工
custom-avatar-alt =
    .alt = 自定义头像
# Globe refers to the generic globe/world icon that appears in browser tabs when a website doesn't have its own favicon.
globe-avatar-alt =
    .alt = 地球
# Diamond refers to the precious stone, not the geometric shape
diamond-avatar-alt =
    .alt = 钻石
flower-avatar-alt =
    .alt = 花朵
folder-avatar-alt =
    .alt = 文件夹
hammer-avatar-alt =
    .alt = 锤子
heart-avatar-alt =
    .alt = 心形
heart-rate-avatar-alt =
    .alt = 心率
clock-avatar-alt =
    .alt = 时钟
leaf-avatar-alt =
    .alt = 叶子
lightbulb-avatar-alt =
    .alt = 灯泡
makeup-avatar-alt =
    .alt = 化妆
# Message refers to a text message, not a traditional letter/envelope message
message-avatar-alt =
    .alt = 消息
musical-note-avatar-alt =
    .alt = 音符
palette-avatar-alt =
    .alt = 调色板
paw-print-avatar-alt =
    .alt = 爪印
plane-avatar-alt =
    .alt = 飞机
# Present refers to a gift box, not the current time period
present-avatar-alt =
    .alt = 礼物
shopping-avatar-alt =
    .alt = 购物车
soccer-ball-avatar-alt =
    .alt = 足球
sparkle-single-avatar-alt =
    .alt = 闪光
star-avatar-alt =
    .alt = 星星
video-game-controller-avatar-alt =
    .alt = 游戏手柄

## Labels for default avatar icons

barbell-avatar = 杠铃
bike-avatar = 自行车
book-avatar = 书本
briefcase-avatar = 公文包
clock-avatar = 时钟
# Craft refers to hobby arts and crafts, represented by a button/fastener commonly found on clothing like shirts
craft-avatar = 手工
custom-avatar = 自定义头像
# Diamond refers to the precious stone, not the geometric shape
diamond-avatar = Diamond
flower-avatar = Flower
folder-avatar = Folder
# Globe refers to the generic globe/world icon that appears in browser tabs when a website doesn't have its own favicon.
globe-avatar = Globe
hammer-avatar = Hammer
heart-avatar = Heart
heart-rate-avatar = Heart rate
leaf-avatar = Leaf
lightbulb-avatar = Lightbulb
makeup-avatar = Makeup
# Message refers to a text message, not a traditional letter/envelope message
message-avatar = Message
musical-note-avatar = Musical note
palette-avatar = Palette
paw-print-avatar = Paw print
picture-avatar = Picture
plane-avatar = Plane
# Present refers to a gift box, not the current time period
present-avatar = Present
shopping-avatar = Shopping cart
soccer-ball-avatar = Soccer ball
sparkle-single-avatar = Sparkle
star-avatar = Star
video-game-controller-avatar = Video game controller

## Tooltips for default avatar icons

barbell-avatar-tooltip =
    .tooltiptext = 应用杠铃头像
bike-avatar-tooltip =
    .tooltiptext = 应用自行车头像
book-avatar-tooltip =
    .tooltiptext = 应用书籍头像
briefcase-avatar-tooltip =
    .tooltiptext = 应用公文包头像
picture-avatar-tooltip =
    .tooltiptext = 应用图片头像
# Craft refers to hobby arts and crafts, represented by a button/fastener commonly found on clothing like shirts
craft-avatar-tooltip =
    .tooltiptext = 应用工艺头像
# Globe refers to the generic globe/world icon that appears in browser tabs when a website doesn't have its own favicon.
globe-avatar-tooltip =
    .tooltiptext = 应用地球头像
diamond-avatar-tooltip =
    .tooltiptext = 应用钻石头像
flower-avatar-tooltip =
    .tooltiptext = 应用花朵头像
folder-avatar-tooltip =
    .tooltiptext = 应用文件夹头像
hammer-avatar-tooltip =
    .tooltiptext = 应用锤子头像
heart-avatar-tooltip =
    .tooltiptext = 应用心形头像
heart-rate-avatar-tooltip =
    .tooltiptext = 应用心率头像
clock-avatar-tooltip =
    .tooltiptext = 应用时钟头像
leaf-avatar-tooltip =
    .tooltiptext = 应用叶子头像
lightbulb-avatar-tooltip =
    .tooltiptext = 应用灯泡头像
makeup-avatar-tooltip =
    .tooltiptext = 应用化妆头像
# Message refers to a text message, not a traditional letter/envelope message
message-avatar-tooltip =
    .tooltiptext = 应用消息头像
musical-note-avatar-tooltip =
    .tooltiptext = 应用音符头像
palette-avatar-tooltip =
    .tooltiptext = 应用调色板头像
paw-print-avatar-tooltip =
    .tooltiptext = 应用爪印头像
plane-avatar-tooltip =
    .tooltiptext = 应用飞机头像
# Present refers to a gift box, not the current time period
present-avatar-tooltip =
    .tooltiptext = 应用礼物头像
shopping-avatar-tooltip =
    .tooltiptext = 应用购物车头像
soccer-ball-avatar-tooltip =
    .tooltiptext = 应用足球头像
sparkle-single-avatar-tooltip =
    .tooltiptext = 应用闪光头像
star-avatar-tooltip =
    .tooltiptext = 应用星星头像
video-game-controller-avatar-tooltip =
    .tooltiptext = 应用视频游戏控制器头像


custom-avatar-crop-back-button =
  .aria-label = 返回
custom-avatar-crop-view =
  .aria-label = 裁剪图像视图
custom-avatar-crop-area =
  .aria-label = 调整裁剪区域
custom-avatar-drag-handle =
  .aria-label = 调整裁剪区域大小

profiles-appmenu-callout-tour-title = 您的新配置文件已准备就绪，可以投入使用
# "Spin up another" means creating another profile, “Hop between your digital lives" is referring to switching between different profiles such as work, personal, etc.
profiles-appmenu-callout-tour-subtitle = 在 ☰ 菜单中，请单击您的配置文件名称以启动另一个配置文件、编辑此配置文件，或在您的数字生活之间进行切换。
profiles-appmenu-callout-tour-primary-button = 请向您展示操作方法