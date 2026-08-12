# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### Firefox Home / New Tab strings for about:home / about:newtab.

newtab-page-title = 新选项卡
#  (developer note): @nova-cleanup(remove-string): Remove newtab-customize-panel-icon-button once Nova lands, will be using newtab-customize-panel-label instead
newtab-customize-panel-icon-button =
    .title = 自定义此页面
#  (developer note): @nova-cleanup(remove-string): Remove newtab-customize-panel-icon-button-label once Nova lands, will be using newtab-customize-panel-label instead
newtab-customize-panel-icon-button-label = 自定义
newtab-customize-panel-label =
    .label = 自定义
newtab-settings-dialog-label =
    .aria-label = 设置
newtab-logo-and-wordmark =
    .aria-label = { -brand-full-name }

## Search box component.

# "Search" is a verb/action
newtab-search-box-search-button =
    .title = 搜索
    .aria-label = 搜索

# Variables:
#   $engine (string) - The name of the user's default search engine
newtab-search-box-handoff-text = 使用 { $engine } 进行搜索，或输入地址
newtab-search-box-handoff-text-no-engine = 进行搜索，或输入地址
# Variables:
#   $engine (string) - The name of the user's default search engine
newtab-search-box-handoff-input =
    .placeholder = 使用 { $engine } 进行搜索，或输入地址
    .title = 使用 { $engine } 进行搜索，或输入地址
    .aria-label = 使用 { $engine } 进行搜索，或输入地址
newtab-search-box-handoff-input-no-engine =
    .placeholder = 进行搜索，或输入地址
    .title = 进行搜索，或输入地址
    .aria-label = 进行搜索，或输入地址

newtab-search-box-text = 搜索网络
newtab-search-box-input =
    .placeholder = 搜索网络
    .aria-label = 搜索网络

## Top Sites - General form dialog.

newtab-topsites-add-search-engine-header = 添加搜索引擎
newtab-topsites-add-shortcut-header = 新建快捷方式
newtab-topsites-edit-shortcut-header = 编辑快捷方式
newtab-topsites-add-shortcut-label = 添加快捷方式
newtab-topsites-add-shortcut-title =
    .title = 添加快捷方式
    .aria-label = 添加快捷方式
newtab-topsites-title-label = 标题
newtab-topsites-title-input =
    .placeholder = 请输入标题

newtab-topsites-url-label = URL
newtab-topsites-url-input =
    .placeholder = 请键入或粘贴 URL
newtab-topsites-url-validation = 需要提供有效的 URL

## Clear text button for the URL and image URL input fields in the Top Sites form.

newtab-topsites-clear-input =
    .aria-label = 清除文本

newtab-topsites-image-url-label = 自定义图像 URL
newtab-topsites-use-image-link = 使用自定义图像…
newtab-topsites-image-validation = 图像未能加载。请尝试使用不同的 URL。

## Top Sites - General form dialog buttons. These are verbs/actions.

newtab-topsites-cancel-button = 取消
newtab-topsites-delete-history-button = 从历史记录中删除
newtab-topsites-save-button = 保存
newtab-topsites-preview-button = 预览
newtab-topsites-add-button = 添加

## Top Sites - Delete history confirmation dialog.

newtab-confirm-delete-history-p1 = 您确定要从您的历史记录中删除此页面的所有实例吗？
# "This action" refers to deleting a page from history.
newtab-confirm-delete-history-p2 = 此操作无法撤销。

## Top Sites - Sponsored label

newtab-topsite-sponsored = 赞助

## Label used by screen readers for pinned top sites

# Variables:
#   $title (string) - The label or hostname of the site.
topsite-label-pinned =
    .aria-label = { $title }（已固定）
    .title = { $title }

## Context Menu - Action Tooltips.

# General tooltip for context menus.
newtab-menu-section-tooltip =
    .title = 打开菜单
    .aria-label = 打开菜单

# This tooltip is for the context menu of Pocket cards or Topsites
# Variables:
#   $title (string) - The label or hostname of the site. This is for screen readers when the context menu button is focused/active.
newtab-menu-content-tooltip =
    .title = 打开菜单
    .aria-label = 为 { $title } 打开上下文菜单

## Context Menu: These strings are displayed in a context menu and are meant as a call to action for a given page.

newtab-menu-edit-topsites = 编辑
newtab-menu-open-new-window = 在新窗口中打开
newtab-menu-open-new-private-window = 在新的私密窗口中打开
newtab-menu-dismiss = 关闭
newtab-menu-pin = 固定
newtab-menu-unpin = 取消固定
newtab-menu-delete-history = 从历史记录中删除
newtab-menu-show-privacy-info = 我们的赞助商与您的隐私
# Report is a verb (i.e. report issue with the content).
newtab-menu-report = 报告
# Context menu option to personalize New Tab recommended stories by blocking a section of stories,
# e.g. "Sports". "Block" is a verb here.
newtab-menu-section-block = 拦截
# "Follow", "unfollow", and "following" are social media terms that refer to subscribing to or unsubscribing from a section of stories.
# e.g. Following the travel section of stories.
newtab-menu-section-unfollow-topic = 取消关注
# Context menu option to open a support page explaining the New Tab personalization features and privacy controls.
newtab-menu-section-learn-more = 了解更多

## Context menu options for sponsored stories and new ad formats on New Tab.

newtab-menu-manage-sponsored-content = 管理赞助内容
newtab-menu-our-sponsors-and-your-privacy = 我们的赞助商与您的隐私
newtab-menu-report-this-ad = 报告此广告

##

# Bookmark is a noun in this case, "Remove bookmark".
newtab-menu-remove-bookmark = 移除书签
# Bookmark is a verb here.
newtab-menu-bookmark = 添加书签

## Context Menu - Downloaded Menu. "Download" in these cases is not a verb,
## it is a noun. As in, "Copy the link that belongs to this downloaded item".

newtab-menu-copy-download-link = 复制下载链接
newtab-menu-go-to-download-page = 前往下载页面
newtab-menu-remove-download = 从历史记录中移除

## Context Menu - Download Menu: These are platform specific strings found in the context menu of an item that has
## been downloaded. The intention behind "this action" is that it will show where the downloaded file exists on the file
## system for each operating system.

newtab-menu-show-file =
    { PLATFORM() ->
        [macos] 在查找器中显示
       *[other] 打开包含文件夹
    }
newtab-menu-open-file = 打开文件

## Card Labels: These labels are associated to pages to give
## context on how the element is related to the user, e.g. type indicates that
## the page is bookmarked, or is currently open on another device.

newtab-label-visited = 已访问
newtab-label-bookmarked = 已添加书签
newtab-label-removed-bookmark = 书签已移除
newtab-label-recommended = 热门趋势
newtab-label-saved = 已保存至 { -pocket-brand-name }
newtab-label-download = 已下载

# This string is used in the story cards to indicate sponsored content
# Variables:
#   $sponsorOrSource (string) - The name of a company or their domain
newtab-label-sponsored = { $sponsorOrSource } · 赞助

# This string is used at the bottom of story cards to indicate sponsored content
# Variables:
#   $sponsor (string) - The name of a sponsor
newtab-label-sponsored-by = 由 { $sponsor } 赞助

# This string is used under the image of story cards to indicate source and time to read
# Variables:
#   $source (string) - The name of a company or their domain
#   $timeToRead (number) - The estimated number of minutes to read this story
newtab-label-source-read-time = { $source } · { $timeToRead } 分钟

# This string is used under fixed size ads to indicate sponsored content
newtab-label-sponsored-fixed = 赞助

## Section Menu: These strings are displayed in the section context menu and are
## meant as a call to action for the given section.

newtab-section-menu-privacy-notice = 隐私声明

## Section Headers.

newtab-section-header-topsites = 热门站点
newtab-section-header-recent-activity = 近期活动
newtab-section-header-stories = 引人深思的故事
# "picks" refers to recommended articles
newtab-section-header-todays-picks = 今日为您精选

## Empty Section States: These show when there are no more items in a section. Ex. When there are no more Pocket story recommendations, in the space where there would have been stories, this is shown instead.

newtab-empty-section-highlights = 开始浏览，我们将在下方显示您最近访问或添加书签的优秀文章、视频及其他页面。

# Ex. When there are no more story recommendations, in the space where there would have been stories, this is shown instead.
newtab-empty-section-topstories-generic = 您已浏览完毕。请稍后返回以查看更多故事。若不愿等待，请选择一个热门主题以发现来自网络更多精彩故事。

## Empty Section (Content Discovery Experience). These show when there are no more stories or when some stories fail to load.

newtab-discovery-empty-section-topstories-header = 您已全部浏览完毕！
newtab-discovery-empty-section-topstories-content = 请稍后返回以查看更多故事。
newtab-discovery-empty-section-topstories-try-again-button = 重试
newtab-discovery-empty-section-topstories-loading = 正在加载…
# Displays when a layout in a section took too long to fetch articles.
newtab-discovery-empty-section-topstories-timed-out = 很抱歉！我们几乎完成了此部分的加载，但未能完全成功。

## Error Fallback Content.
## This message and suggested action link are shown in each section of UI that fails to render.

newtab-error-fallback-info = 很抱歉，加载此内容时出现了问题。
newtab-error-fallback-refresh-link = 刷新页面以重试。

## Customization Menu

#  (developer note): @nova-cleanup(remove-string): Remove old string once Nova lands. The newtab-custom-shortcuts-nova string will take over
newtab-custom-shortcuts-toggle =
  .label = 快捷方式
  .description = 您保存或访问的站点

newtab-custom-shortcuts-nova =
  .label = 快捷方式
newtab-custom-row-description =
  .description = 行数
# Variables
#   $num (number) - Number of rows to display
#  (developer note): @nova-cleanup(remove-string): Remove string once Nova lands. We won't be using "row"/"rows" anymore for the dropdown
newtab-custom-row-selector2 =
        .label = { $num ->
            [one] { $num } 行
           *[other] { $num } 行
        }
#  (developer note): @nova-cleanup(remove-string): Remove string once Nova lands. We won't be having a description under "Recommended stories" anymore
newtab-custom-stories-toggle =
  .label = 推荐故事
  .description = 由 { -brand-product-name } 家族策划的卓越内容
newtab-recommended-stories-toggle =
  .label = 推荐故事
newtab-custom-stories-personalized-toggle =
  .label = 故事
newtab-custom-stories-personalized-checkbox-label = 基于您的活动提供的个性化故事
newtab-custom-weather-toggle =
  .label = 天气
  .description = 一瞥今日预报
newtab-custom-widget-weather-toggle =
  .label = 天气
newtab-custom-widget-lists-toggle =
  .label = 列表
newtab-custom-widget-timer-toggle =
  .label = 计时器
newtab-custom-widget-clock-toggle =
  .label = 时钟
newtab-custom-widget-sports-toggle2 =
  .label = 体育
newtab-custom-widget-section-title = 小部件
newtab-custom-widget-section-toggle =
    .label = 小部件
newtab-widget-manage-title = 小部件
newtab-widget-manage-widget-button =
    .label = 管理小部件

# Tooltip for close button
newtab-custom-close-menu-button =
    .title = 关闭
    .aria-label = 关闭菜单
newtab-custom-settings = 管理更多设置

## New Tab Wallpapers

newtab-wallpaper-title = 壁纸
newtab-wallpaper-reset = 重置为默认设置
#  (developer note): @nova-cleanup(remove-string): Remove old "Upload an image" string once Nova lands. The new "Add an image"  string will take over
newtab-wallpaper-upload-image = 上传图像
newtab-wallpaper-add-an-image = 添加图像
newtab-wallpaper-custom-color = 选择颜色
newtab-wallpaper-toggle-title =
    .label = 壁纸
# Variables
#   $file_size (number) - The number of the maximum image file size (in MB) that may be uploaded
newtab-wallpaper-error-max-file-size = 该图像已超出 { $file_size }MB 的文件大小限制。请您尝试上传较小的文件。
newtab-wallpaper-error-upload-file-type = 我们无法上传您的文件。请您改用图像文件重试。
newtab-wallpaper-light-red-panda = 小熊猫
newtab-wallpaper-light-mountain = 白色的山
newtab-wallpaper-light-sky = 带有紫色和粉色云朵的天空
newtab-wallpaper-light-color = 蓝色、粉色和黄色的形状
newtab-wallpaper-light-landscape = 蓝色薄雾山地景观
newtab-wallpaper-light-beach = 带有棕榈树的海滩
newtab-wallpaper-dark-aurora = 北极光
newtab-wallpaper-dark-color = 红色和蓝色的形状
newtab-wallpaper-dark-panda = 隐藏在森林中的小熊猫
newtab-wallpaper-dark-sky = 带有夜空的城市景观
newtab-wallpaper-dark-mountain = 山地景观
newtab-wallpaper-dark-city = 紫色的城市景观
newtab-wallpaper-dark-fox-anniversary = 森林附近人行道上的狐狸
newtab-wallpaper-light-fox-anniversary = 草地田野中带有薄雾山地景观的狐狸

## Solid Colors

#  (developer note): @nova-cleanup(remove-string): Remove old "Solid colors" string once Nova lands. The simplified "Colors" string will take over
newtab-wallpaper-category-title-colors = 纯色
newtab-wallpaper-colors = 颜色
newtab-wallpaper-blue = 蓝色
newtab-wallpaper-light-blue = 浅蓝色
newtab-wallpaper-light-purple = 浅紫色
newtab-wallpaper-light-green = 浅绿色
newtab-wallpaper-green = 绿色
newtab-wallpaper-beige = 米色
newtab-wallpaper-yellow = 黄色
newtab-wallpaper-orange = 橙色
newtab-wallpaper-pink = 粉色
newtab-wallpaper-light-pink = 浅粉色
newtab-wallpaper-red = 红色
newtab-wallpaper-dark-blue = 深蓝色
newtab-wallpaper-dark-purple = 深紫色
newtab-wallpaper-dark-green = 深绿色
newtab-wallpaper-brown = 棕色

## Abstract

newtab-wallpaper-category-title-abstract = 抽象
newtab-wallpaper-abstract-green = 绿色形状
newtab-wallpaper-abstract-blue = 蓝色形状
newtab-wallpaper-abstract-purple = 紫色形状
newtab-wallpaper-abstract-orange = 橙色形状
newtab-wallpaper-gradient-orange = 橙色与粉色渐变
newtab-wallpaper-abstract-blue-purple = 蓝色和紫色的形状
newtab-wallpaper-abstract-white-curves = 带有阴影曲线的白色
newtab-wallpaper-abstract-purple-green = 紫色和绿色光渐变
newtab-wallpaper-abstract-blue-purple-waves = 蓝色和紫色的波浪状形状
newtab-wallpaper-abstract-black-waves = 黑色波浪状形状

## Photographs

newtab-wallpaper-category-title-photographs = 摄影
newtab-wallpaper-beach-at-sunrise = 日出时的海滩
newtab-wallpaper-beach-at-sunset = 日落时的海滩
newtab-wallpaper-storm-sky = 暴风雨的天空
newtab-wallpaper-sky-with-pink-clouds = 带有粉色云朵的天空
newtab-wallpaper-red-panda-yawns-in-a-tree = 小熊猫在树上打哈欠
newtab-wallpaper-white-mountains = 白色的群山
newtab-wallpaper-hot-air-balloons = 白天各种颜色的热气球
newtab-wallpaper-starry-canyon = 蓝色的星夜
newtab-wallpaper-suspension-bridge = 白天时段的全悬挂桥灰色摄影
newtab-wallpaper-sand-dunes = 白色沙丘
newtab-wallpaper-palm-trees = 金色时刻期间椰子树剪影
newtab-wallpaper-blue-flowers = 蓝色花瓣开花植物的特写摄影

## Celestial

# “Celestial” referring to astronomy; positioned in or relating to the sky,
# or outer space as observed in astronomy.
# Not to be confused with religious definition of the word.
newtab-wallpaper-category-title-celestial = 天体
newtab-wallpaper-celestial-lunar-eclipse = 月食
newtab-wallpaper-celestial-earth-night = 低地球轨道的夜间照片
newtab-wallpaper-celestial-starry-sky = 星空
newtab-wallpaper-celestial-eclipse-time-lapse = 月食延时摄影
newtab-wallpaper-celestial-black-hole = 黑洞星系插画
newtab-wallpaper-celestial-river = 河流的卫星图像

## Firefox

newtab-wallpaper-category-title-firefox = { -brand-product-name }


# Variables
#   $author_string (String) - The name of the creator of the photo.
#   $webpage_string (String) - The name of the webpage where the photo is located.
newtab-wallpaper-attribution = 照片由<a data-l10n-name="name-link">{ $author_string }</a>摄于<a data-l10n-name="webpage-link">{ $webpage_string }</a>
newtab-wallpaper-feature-highlight-header = 请尝试一抹色彩
newtab-wallpaper-feature-highlight-content = 请使用壁纸为您的“新标签页”提供全新的外观。
newtab-wallpaper-feature-highlight-button = 已了解
# Tooltip for dismiss button
feature-highlight-dismiss-button =
    .title = 解除
    .aria-label = 关闭弹窗
feature-highlight-wallpaper =
    .title = { -newtab-wallpaper-feature-highlight-header }
    .aria-label = { -newtab-wallpaper-feature-highlight-content }

## New Tab Weather

# Variables:
#   $provider (string) - Service provider for weather data
newtab-weather-see-forecast-description =
    .title = 在 { $provider } 中查看预报
    .aria-description = { $provider } ∙ 赞助
# Variables:
#   $provider (string) - Service provider for weather data
newtab-weather-sponsored = { $provider } ∙ 赞助
newtab-weather-menu-change-location = 更改位置
newtab-weather-change-location-search-input-placeholder =
    .placeholder = 搜索位置
    .aria-label = 搜索位置
# "Current" refers to the user's physical/geographic location detected via geolocation.
newtab-weather-change-location-search-use-current =
    .label = 使用当前位置
newtab-weather-menu-weather-display = 天气显示
newtab-weather-todays-forecast = 今日预报
newtab-weather-see-full-forecast = 查看完整预报
# Display options are:
# - Simple: Displays a current weather condition icon and the current temperature
# - Detailed: Include simple information plus a short text summary: e.g. "Mostly cloudy"
newtab-weather-menu-weather-display-option-simple = 简单
newtab-weather-menu-change-weather-display-simple = 切换到简单视图
newtab-weather-menu-weather-display-option-detailed = 详细
newtab-weather-menu-change-weather-display-detailed = 切换到详细视图
newtab-weather-menu-temperature-units = 温度单位
newtab-weather-menu-temperature-option-fahrenheit = 华氏度
newtab-weather-menu-temperature-option-celsius = 摄氏度
newtab-weather-menu-change-temperature-units-fahrenheit = 切换到华氏度
newtab-weather-menu-change-temperature-units-celsius = 切换到摄氏度
newtab-weather-menu-learn-more = 了解更多
newtab-weather-menu-detect-my-location = 检测我的位置
# This message is shown if user is working offline
newtab-weather-error-not-available = 当前无法提供天气数据。
newtab-weather-opt-in-see-weather = 您是否希望查看您所在位置的天气？
newtab-weather-opt-in-not-now =
    .label = 暂不
newtab-weather-opt-in-yes =
    .label = 是
newtab-weather-opt-in-headline = 获取您的本地天气预报
newtab-weather-opt-in-use-location =
    .label = 使用位置
newtab-weather-opt-in-choose-location = 选择位置
# We'll be showing static (fake) weather data if the user has not opted in to using their location
newtab-weather-static-city = 纽约市
# "Highest" here refers to the highest temperature of the day
newtab-weather-high =
    .aria-label = 最高
# "Lowest" here refers to the lowest temperature of the day
newtab-weather-low =
    .aria-label = 最低

## Topic Labels

newtab-topic-label-business = 商业
newtab-topic-label-career = 职业
newtab-topic-label-education = 教育
newtab-topic-label-arts = 娱乐
newtab-topic-label-food = 美食
newtab-topic-label-health = 健康
newtab-topic-label-hobbies = 游戏
# ”Money” = “Personal Finance”, refers to articles and stories that help readers better manage
# and understand their personal finances – from saving money to buying a home. See the
# “Curated by our editors“ section at the top of https://getpocket.com/explore/personal-finance for more context
newtab-topic-label-finance = 金钱
newtab-topic-label-society-parenting = 育儿
newtab-topic-label-government = 政治
newtab-topic-label-education-science = 科学
# ”Life Hacks” = “Self Improvement”, refers to articles and stories aimed at helping readers improve various
# aspects of their lives – from mental health to  productivity. See the “Curated by our editors“ section
# at the top of https://getpocket.com/explore/self-improvement for more context.
newtab-topic-label-society = 生活技巧
newtab-topic-label-sports = 体育
newtab-topic-label-tech = 科技
newtab-topic-label-travel = 旅行
newtab-topic-label-home = 家居与园艺

## Topic Selection Modal

# “fine-tune” refers to the process of making small adjustments to something to get
# the best or desired experience or performance.
newtab-topic-selection-title = 请选择主题以精确调整您的信息流
# “tailored” refers to process of (a tailor) making (clothes) to fit individual customers.
# In other words, “Our expert curators prioritize stories to fit your selected interests”
newtab-topic-selection-subtitle = 请您选择两个或多个主题。我们的专家策展人将优先安排符合您兴趣的定制内容。您可随时进行更新。
newtab-topic-selection-save-button = 保存
newtab-topic-selection-cancel-button = 取消
newtab-topic-selection-button-maybe-later = 或许稍后
newtab-topic-selection-privacy-link = 了解我们如何保护和管理数据
newtab-topic-selection-button-update-interests = 更新您的兴趣
newtab-topic-selection-button-pick-interests = 选取您的兴趣

## Content Feed Sections
## "Follow", "unfollow", and "following" are social media terms that refer to subscribing to or unsubscribing from a section of stories.
## e.g. Following the travel section of stories.

newtab-section-follow-button = 关注
# Variables:
#   $topic (string) - Topic that the user can follow
newtab-section-follow-button-label =
    .aria-label = 关注{ $topic }
newtab-section-following-button = 正在关注
newtab-section-unfollow-button = 取消关注
# Variables:
#   $topic (string) - Topic that the user is following and can unfollow
newtab-section-unfollow-button-label =
    .aria-label = 正在关注：取消关注{ $topic }
# A modal may appear next to the Follow button, directing users to try out the feature
newtab-section-follow-highlight-title = 精确调整您的信息流
newtab-section-follow-highlight-subtitle = 关注您的兴趣以查看更多您喜欢的内容。

## Button to block/unblock listed topics
## "Block", "unblocked", and "blocked" are social media terms that refer to hiding a section of stories.
## e.g. Blocked the politics section of stories.

newtab-section-block-button = 阻止
newtab-section-blocked-button = 已阻止
newtab-section-unblock-button = 取消阻止

# Variables:
#   $topic (string) - Name of topic that user is following
newtab-section-follow-topic =
    .aria-label = 关注{ $topic }
# Variables:
#   $topic (string) - Name of topic that user is unfollowing
newtab-section-unfollow-topic =
    .aria-label = 取消关注{ $topic }
# Variables:
#   $topic (string) - Name of topic that user is blocking
newtab-section-block-topic =
    .aria-label = 阻止{ $topic }
# Variables:
#   $topic (string) - Name of topic that user is unblocking
newtab-section-unblock-topic =
    .aria-label = 取消阻止{ $topic }

## Confirmation modal for blocking a section

newtab-section-confirm-block-topic-p1 = 您确定要阻止此主题吗？
newtab-section-confirm-block-topic-p2 = 被阻止的主题将不再出现在您的信息流中。

# Variables:
#   $topic (string) - Name of topic that user is blocking
newtab-section-block-topic-button = 阻止{ $topic }
newtab-section-block-cancel-button = 取消

## Panel in the Customize menu section to manage followed and blocked topics

newtab-section-mangage-topics-title = 主题
newtab-section-manage-topics-button-v2 =
    .label = 管理主题
newtab-section-mangage-topics-followed-topics = 已关注
newtab-section-mangage-topics-followed-topics-empty-state = 您尚未关注任何主题。
newtab-section-mangage-topics-blocked-topics = 已阻止
newtab-section-mangage-topics-blocked-topics-empty-state = 您尚未阻止任何主题。

## Strings for custom wallpaper highlight

newtab-custom-wallpaper-title = 自定义壁纸现已可用
# 'Make firefox yours" means to customize or personalize
newtab-custom-wallpaper-subtitle = 上传您自己的壁纸或选择自定义颜色，以使{ -brand-product-name }成为您的专属。
newtab-custom-wallpaper-cta = 试用

## Strings for new user activation custom wallpaper highlight

newtab-new-user-custom-wallpaper-title = 选择壁纸以使{ -brand-product-name }成为您的专属
newtab-new-user-custom-wallpaper-subtitle = 使用自定义壁纸和颜色，使每个新标签页都带给您如家般的感觉。
newtab-new-user-custom-wallpaper-cta = 立即试用

## Strings for Nova wallpaper feature highlight

newtab-wallpaper-feature-highlight-title = 全新壁纸刚刚上线
newtab-wallpaper-feature-highlight-subtitle = 请选择您的首选，使每个新标签页都带给您如家般的感觉。
newtab-wallpaper-feature-highlight-cta = 选择壁纸

## Strings for download mobile highlight

newtab-download-mobile-highlight-title = 下载{ -brand-product-name }移动版
# "Scan the code" refers to scanning the QR code that appears above the body text that leads to Firefox for mobile download.
newtab-download-mobile-highlight-body-variant-a = 扫描代码，以便在移动中安全浏览。
newtab-download-mobile-highlight-body-variant-b = 当您同步标签页、密码及更多内容后，可从上次中断处继续。
newtab-download-mobile-highlight-body-variant-c = 您是否知道可以随身携带{ -brand-product-name }？同一浏览器。在您的口袋中。
newtab-download-mobile-highlight-image =
    .aria-label = 用于下载{ -brand-product-name }移动版的二维码

## Strings for shortcuts highlight

newtab-shortcuts-highlight-title = 您的收藏尽在指尖
newtab-shortcuts-highlight-subtitle = 添加快捷方式，使您最喜爱的网站保持一次单击即可访问。

## Strings for reporting issues with ads and content

newtab-report-content-why-reporting-this =
  .label = 您为何报告此项内容？
newtab-report-ads-reason-not-interested =
  .label = 我不感兴趣
newtab-report-ads-reason-inappropriate =
  .label = 内容不当
newtab-report-ads-reason-seen-it-too-many-times =
  .label = 我见到它的次数过多
newtab-report-content-wrong-category =
  .label = 错误的类别
newtab-report-content-outdated =
  .label = 过时的
newtab-report-content-inappropriate-offensive =
  .label = 不适当或冒犯性的
newtab-report-content-spam-misleading =
  .label = 垃圾信息或误导性的
newtab-report-content-requires-payment-subscription =
  .label = 需要付费或订阅
newtab-report-content-requires-payment-subscription-learn-more = 了解更多
newtab-report-cancel = 取消
newtab-report-submit = 提交
newtab-toast-thanks-for-reporting =
    .message = 感谢您报告此内容。
newtab-toast-widgets-hidden =
    .message = 选择铅笔图标以随时将小组件添加回来。
# Variables:
#   $topic (string) - Topic that the user has followed
newtab-section-toast-follow =
    .message = 您正在关注 { $topic }。
# Variables:
#   $topic (string) - Topic that the user has unfollowed
newtab-section-toast-unfollow =
    .message = 您不再关注 { $topic }。
# Variables:
#   $topic (string) - Topic that the user has blocked
newtab-section-toast-block =
    .message = 您将不再看到有关 { $topic } 的报道。

## Strings for task / to-do list productivity widget

newtab-widget-section-title = 小组件
newtab-widget-menu-hide = 隐藏小组件
newtab-widget-menu-change-size = 更改大小
# Parent label for a submenu in the widget menu that reorders the widget
# among its siblings. "Left" and "Right" appear as items inside this submenu.
newtab-widget-menu-move = 移动
# Submenu item under "Move"; moves the widget one position to the left.
# RTL locales should translate this as "Right".
newtab-widget-menu-move-left = 左
# Submenu item under "Move"; moves the widget one position to the right.
# RTL locales should translate this as "Left".
newtab-widget-menu-move-right = 右
newtab-widget-size-small = 小
newtab-widget-size-medium = 中
newtab-widget-size-large = 大
# Tooltip for hide all widgets button
newtab-widget-section-hide-all-button =
    .title = 隐藏小组件
    .aria-label = 隐藏所有小组件
newtab-widget-section-maximize =
    .title = 展开小组件
    .aria-label = 将所有小组件展开至完整大小
newtab-widget-section-minimize =
    .title = 最小化小组件
    .aria-label = 将所有小组件折叠至紧凑大小
newtab-widget-section-menu-button =
    .title = 小组件菜单
    .aria-label = 打开小组件菜单
newtab-widget-add-widgets-button =
    .aria-label = 添加小组件
    .title = 添加小组件
newtab-widget-section-menu-manage = 管理小组件
newtab-widget-section-menu-hide-all = 隐藏小组件
newtab-widget-section-menu-learn-more = 了解更多
newtab-widget-section-feedback = 告诉我们您的想法
# Button shown when additional widgets are hidden beyond the
# first row, allowing users to show them.
newtab-widget-section-show-more =
    .label = 显示更多小组件
# Button shown when the widgets row is expanded to multiple rows,
# allowing users to collapse it back to one row.
newtab-widget-section-show-less =
    .label = 显示更少小组件
newtab-widget-lists-name-default = 清单
newtab-widget-lists-name-label-default =
    .label = 任务列表
newtab-widget-lists-name-label-checklist =
    .label = 清单
newtab-widget-lists-name-placeholder-default =
    .placeholder = 任务列表
newtab-widget-lists-name-placeholder-checklist2 =
    .placeholder = 清单
    .aria-label = 编辑列表名称
# The placeholder value of the name field for a newly created list
newtab-widget-lists-name-placeholder-new2 =
    .placeholder = 新列表
    .aria-label = 编辑列表名称

# "Add one" means adding a new task to the list (e.g., "Walk the dog")
newtab-widget-lists-empty-cta = 可能性是无限的。请添加一个。
# A simple label next to the default list name letting users know this is a new / beta feature
newtab-widget-lists-label-new =
    .label = 新增
newtab-widget-lists-label-beta =
    .label = 测试版
# When tasks have been previous marked as complete, they will appear in their own separate list beneath incomplete items
# Variables:
#   $number (number) - Amount of list items marked complete
newtab-widget-lists-completed-list = 已完成（{ $number }）
newtab-widget-lists-celebration-headline = 表现良好
newtab-widget-lists-celebration-subhead = 全部清除
newtab-widget-task-list-menu-copy = 复制
newtab-widget-lists-menu-edit = 编辑列表名称
newtab-widget-lists-menu-edit2 =
    .aria-label = 编辑列表名称
newtab-widget-lists-menu-create = 创建新列表
newtab-widget-lists-menu-delete = 删除此列表
newtab-widget-lists-menu-copy = 将列表复制到剪贴板
newtab-widget-lists-menu-learn-more = 了解更多
newtab-widget-lists-button-add-item = 添加项目
newtab-widget-lists-input-add-an-item2 =
    .placeholder = 添加项目
    .aria-label = 添加项目
newtab-widget-lists-input-error = 请输入文本以添加项目。
newtab-widget-lists-input-menu-open-link = 打开链接
newtab-widget-lists-input-menu-move-up = 上移
newtab-widget-lists-input-menu-move-down = 下移
newtab-widget-lists-input-menu-delete = 删除
newtab-widget-lists-input-menu-edit = 编辑
newtab-widget-lists-input-menu-edit2 =
    .aria-label = 编辑项目
newtab-widget-lists-edit-clear =
    .aria-label = 取消
    .title = 取消

# the + symbol emphasises the functionality of adding a new list
newtab-widget-lists-dropdown-create =
    .label = + 创建新列表

## Strings for timer productivity widget
## When the timer ends, a system notification may be shown. Depending on which mode the timer is in, that message would be shown

newtab-widget-timer-notification-title = 计时器
newtab-widget-timer-notification-focus = 专注时间已结束。操作已成功完成。您是否需要休息？
newtab-widget-timer-notification-break = 您的休息时间已结束。是否准备开始专注？
newtab-widget-timer-notification-warning = 通知已关闭
newtab-widget-timer-mode-focus =
    .label = 专注
newtab-widget-timer-mode-break =
    .label = 休息
newtab-widget-timer-label-play =
    .label = 播放
newtab-widget-timer-label-pause =
    .label = 暂停
newtab-widget-timer-reset =
    .title = 重置
newtab-widget-timer-menu-notifications = 关闭通知
newtab-widget-timer-menu-notifications-on = 启动通知
newtab-widget-timer-menu-learn-more = 了解更多

## Sports widget

newtab-sports-widget-menu-follow-teams = 关注球队
newtab-sports-widget-menu-view-schedule = 查看日程
newtab-sports-widget-menu-view-upcoming = 查看即将进行
newtab-sports-widget-menu-view-results = 查看结果
# Milestone dates (e.g. group stage, semifinals, etc.). Refers to calendar dates.
newtab-sports-widget-menu-key-dates = 关键日期
newtab-sports-widget-menu-learn-more = 了解更多

# “Keep tabs on” is an informal expression meaning to stay updated on, stay informed on, or regularly follow something (in this case, World Cup matches and updates).
newtab-sports-widget-keep-tabs = 持续关注世界杯
newtab-sports-widget-get-updates = 获取实时比赛更新及更多信息。
newtab-sports-widget-view-matches =
    .label = 查看比赛
newtab-sports-widget-follow-teams =
    .label = 关注球队

# Variables:
#   $number (number) - Maximum number of teams a user can choose to follow in the team selection state
newtab-sports-widget-follow-teams-title =
    { $number ->
        *[other] 关注最多 { $number } 支球队
    }
newtab-sports-widget-choose-wallpaper =
    .label = 选择壁纸
newtab-sports-widget-skip = 跳过
newtab-sports-widget-search-country =
    .placeholder = 搜索国家/地区
    .aria-label = 搜索国家/地区
newtab-sports-widget-cancel = 取消
newtab-sports-widget-back-button =
    .aria-label = 返回
newtab-sports-widget-done-button =
    .label = 完成
# Shown in the follow-teams list for a team that has been knocked out of the tournament.
# Variables:
#   $teamName (string) - the localized team name (e.g. "Canada").
newtab-sports-widget-team-name-eliminated = { $teamName }（已淘汰）
newtab-sports-widget-view-all =
    .label = 查看全部
newtab-sports-widget-show-less =
    .label = 显示较少
# Toggle that filters the list of teams the user follows
newtab-sports-widget-followed-only-toggle =
    .label = 仅显示已关注球队

## Sports widget live-games pagination. Shown when 2+ matches are live at the same time

# arrow button that goes to the previous page of live matches.
newtab-sports-widget-pagination-previous =
    .aria-label = 上一页
    .title = 上一页
# arrow button that goes to the next page of live matches.
newtab-sports-widget-pagination-next =
    .aria-label = 下一页
    .title = 下一页
# Dot indicator that jumps directly to a given live match.
# $index (number) - 1-based position of this dot in the list.
# $total (number) - Total number of live matches.
newtab-sports-widget-pagination-dot =
    .aria-label = 实时比赛 { $index }，共 { $total }
    .title = 实时比赛 { $index }，共 { $total }

## Watch live stream dialog
## Shown when the user clicks the “Watch live” button on a live match.
## Lists available streaming services where the match can be watched.

# Watch is a verb (as in watch matches online).
newtab-sports-widget-watch =
    .label = 观看
    .title = 观看直播

# Watch is a verb (as in watch matches online).
newtab-sports-widget-watch-icon =
    .aria-label = 观看直播
    .title = 观看直播

newtab-sports-widget-watch-dialog-close =
    .aria-label = 关闭
    .title = 关闭

# Tag: user can watch without paying (sign-in may still be required).
newtab-sports-widget-watch-stream-free = 免费

# Tag: user can start watching via a trial; continued access may require payment after it ends.
newtab-sports-widget-watch-stream-free-trial = 免费试用
# Tag: provider offers both a no-cost or trial path and a paid path.
newtab-sports-widget-watch-stream-free-paid = 免费和付费

# Tag: user must pay to watch (subscription, TV provider, premium plan, or add-on).
newtab-sports-widget-watch-stream-paid = 付费

# Note: provider only streams some matches, not the full tournament.
newtab-sports-widget-watch-stream-select-games-only = 仅限选定比赛

# Heading for the list of streaming services available in the user’s country/region.
newtab-sports-widget-watch-available-region = 您所在地区可用

# Heading for the list of streaming services available outside the user’s country/region.
newtab-sports-widget-watch-available-other-regions = 其他地区

# Button that opens the provider’s stream page in a new tab.
newtab-sports-widget-watch-play =
    .aria-label = 打开直播
    .title = 打开直播

##

# The "LIVE" string is meant to be uppercase in English, but other languages and locales may vary in how they handle this.
newtab-sports-widget-live = 直播
newtab-custom-widget-live-refresh =
    .title = 刷新比分
    .aria-label = 刷新比分
# Milestone dates (e.g. group stage, semifinals, etc.). Refers to calendar dates.
newtab-sports-widget-key-dates = 关键日期
newtab-sports-widget-upcoming = 即将进行
# Used for a match currently ongoing
newtab-sports-widget-now = 现在
newtab-sports-widget-results = 结果
newtab-sports-widget-round-32 = 32强赛
newtab-sports-widget-round-16 = 16强赛
newtab-sports-widget-quarter-finals = 四分之一决赛
newtab-sports-widget-semi-finals = 半决赛
newtab-sports-widget-bronze-finals = 季军赛
# Final is the final match for 1st place.
newtab-sports-widget-final = 决赛

## Labels for the 12 World Cup group-stage groups (Group A through Group L).
## Each team is assigned to one of these groups during the World Cup tournament group stage.

newtab-sports-widget-group-stage = 小组赛阶段
newtab-sports-widget-group-a = A组
newtab-sports-widget-group-b = B组
newtab-sports-widget-group-c = C组
newtab-sports-widget-group-d = D组
newtab-sports-widget-group-e = E组
newtab-sports-widget-group-f = F组
newtab-sports-widget-group-g = G组
newtab-sports-widget-group-h = H组
newtab-sports-widget-group-i = I组
newtab-sports-widget-group-j = J组
newtab-sports-widget-group-k = K组
newtab-sports-widget-group-l = L组

##

# Variables:
#   $start (Date) - Start date of a tournament stage
#   $end (Date) - End date of a tournament stage
newtab-sports-widget-key-date-range = { DATETIME($start, month: "short", day: "numeric") } – { DATETIME($end, month: "short", day: "numeric") }

# Variables:
#   $date (Date) - Date of a single tournament event
newtab-sports-widget-key-date = { DATETIME($date, month: "short", day: "numeric") }

newtab-sports-widget-delayed = 延迟
newtab-sports-widget-postponed = 推迟
newtab-sports-widget-suspended = 暂停
newtab-sports-widget-cancelled = 取消

newtab-sports-widget-information = 关于比赛的信息
newtab-sports-widget-no-live-data = 实时比赛数据当前未在更新中
newtab-sports-widget-view-results-link = 查看结果

newtab-sports-widget-third-place = 第三名
# Runner-up is the team in 2nd place.
newtab-sports-widget-runner-up = 亚军
newtab-sports-widget-champions = 冠军
newtab-sports-widget-world-cup-champions = 2026世界杯冠军

# Variables:
#   $date (Date) - The match start time
newtab-sports-widget-match-time = { DATETIME($date, hour: "2-digit", minute: "2-digit") }
newtab-sports-widget-match-full-time = 全场结束
newtab-sports-widget-match-halftime = 半场
newtab-sports-widget-match-extra-time = 加时赛
newtab-sports-widget-match-penalties = 点球大战
# Separator shown between two teams in a placeholder match row when no upcoming
# match details are available yet.
newtab-sports-widget-match-vs = 对阵
# Note shown in the Upcoming tab when no match details are available yet.
newtab-sports-widget-no-upcoming-matches = 请持续关注即将进行的比赛详情

## Accessible labels for match rows in the sports widget. These are read by
## screen readers to announce the match details and status.
## Variables shared by all messages in this group:
##   $homeTeam (String) - The full name of the home team (e.g. "Mexico")
##   $awayTeam (String) - The full name of the away team (e.g. "Russia")

# A finished match row (regular full-time result).
# Variables:
#   $homeScore (number) - The home team's regular-time score
#   $awayScore (number) - The away team's regular-time score
newtab-sports-widget-match-aria-label-results =
    .aria-label = { $homeTeam }，{ $homeScore } 对阵 { $awayTeam }，{ $awayScore }

# A finished match row that went to a penalty shootout.
# Parenthesized values are the shootout score.
# Variables:
#   $homeScore (number) - The home team's regular-time score
#   $awayScore (number) - The away team's regular-time score
#   $homePenalty (number) - The home team's penalty shootout score
#   $awayPenalty (number) - The away team's penalty shootout score
newtab-sports-widget-match-aria-label-results-penalties =
    .aria-label = { $homeTeam }，{ $homeScore }（{ $homePenalty }）对阵 { $awayTeam }，{ $awayScore }（{ $awayPenalty }）
# A match that is currently in progress.
# Variables:
#   $homeScore (number) - The home team's current score
#   $awayScore (number) - The away team's current score
newtab-sports-widget-match-aria-label-now =
    .aria-label = 正在直播：{ $homeTeam }，{ $homeScore } 对阵 { $awayTeam }，{ $awayScore }

# An upcoming scheduled match row. Announces kickoff time and date.
# Variables:
#   $date (Date) - The scheduled kickoff date/time
newtab-sports-widget-match-aria-label-upcoming =
    .aria-label = { $homeTeam } 对阵 { $awayTeam }，{ DATETIME($date, hour: "numeric", minute: "numeric") }，{ DATETIME($date, day: "numeric", month: "long") }

# An upcoming match row whose status is "delayed".
newtab-sports-widget-match-aria-label-upcoming-delayed =
    .aria-label = { $homeTeam } 对阵 { $awayTeam }，已延迟

# An upcoming match row whose status is "postponed".
newtab-sports-widget-match-aria-label-upcoming-postponed =
    .aria-label = { $homeTeam } 对阵 { $awayTeam }，已推迟

# An upcoming match row whose status is "suspended".
newtab-sports-widget-match-aria-label-upcoming-suspended =
    .aria-label = { $homeTeam } 对阵 { $awayTeam }，已暂停

# An upcoming match row whose status is "cancelled".
newtab-sports-widget-match-aria-label-upcoming-cancelled =
    .aria-label = { $homeTeam } 对阵 { $awayTeam }，已取消

## Sports widget — team names (FIFA country codes)
## Only includes names not adequately covered by standard country-code
## internationalization tooling.

newtab-sports-widget-team-name-label-bih =
    .label = 波斯尼亚和黑塞哥维那
newtab-sports-widget-team-name-label-civ =
    .label = 科特迪瓦
newtab-sports-widget-team-name-label-cod =
    .label = 刚果民主共和国
newtab-sports-widget-team-name-label-eng =
    .label = 英格兰
newtab-sports-widget-team-name-label-sco =
    .label = 苏格兰

# Placeholder used in a match row's aria-label for an undecided team (shown visually as "--").
newtab-sports-widget-team-tbd = 待确定

## Sports widget OMC messages
## Shown as on-screen messages promoting the Sports widget and World Cup wallpapers.

newtab-sports-widget-message-wallpapers-title = 启动世界杯，配以新壁纸
newtab-sports-widget-message-wallpapers-body = 为您的浏览器带来一些比赛日的活力，以供赛事使用。
newtab-sports-widget-message-wallpapers-cta = 选择壁纸
newtab-sports-widget-message-add-widgets-cta =
    .label = 添加组件
newtab-sports-widget-message-day-in-play-title = 让您的一天保持比赛状态，使用 { -brand-product-name } 组件
newtab-sports-widget-message-day-in-play-body = 关注世界杯、保持任务进度、追踪全球时间，以及更多功能。
newtab-sports-widget-message-explore-widgets-cta =
    .label = 探索组件

## Strings introduced by the Nova redesign of the Timer widget

# Variables:
#   $minutes (number) - The currently selected timer duration in minutes
newtab-widget-timer-start-aria =
    .aria-label =
        { $minutes ->
            *[other] 启动 { $minutes } 分钟计时器
        }
newtab-widget-timer-pause-aria =
    .aria-label = 暂停计时器
# Variables:
#   $minutes (number) - The currently selected timer duration in minutes
newtab-widget-timer-spinbutton-name =
    .aria-label =
        { $minutes ->
            [one] { $minutes } 分钟
            *[other] { $minutes } 分钟
        }
newtab-widget-timer-decrease-min =
    .title = 减少 1 分钟
newtab-widget-timer-increase-min =
    .title = 增加 1 分钟
newtab-widget-timer-mode-group =
    .aria-label = 计时器模式
# Small label shown beneath the live time while the focus timer is running or paused.
newtab-widget-timer-running-focus = 专注
# Small label shown beneath the live time while the break timer is running or paused.
newtab-widget-timer-running-break = 休息
# Context-menu item to hide the Timer widget. Replaces the shared "Hide widget"
# copy with a widget-specific string per the Nova design.
newtab-widget-timer-menu-hide = 隐藏计时器
# Heading shown inside the Timer widget after a focus session ends.
newtab-widget-timer-celebration-heading-focus = 表现良好
# Heading shown inside the Timer widget after a break session ends.
newtab-widget-timer-celebration-heading-break = 您的休息已结束
# Message shown inside the Timer widget after a focus session ends.
newtab-widget-timer-celebration-message-focus = 需要休息吗？
# Message shown inside the Timer widget after a break session ends.
newtab-widget-timer-celebration-message-break = 准备专注？

# Strings for daily briefing card

# The title displays above a set of top news headlines.
newtab-daily-briefing-card-title = 头条新闻
newtab-daily-briefing-card-menu-dismiss = 关闭

# Variables:
#   $minutes (number) - Time since the feed has been refreshed
newtab-daily-briefing-card-timestamp = 已于 { $minutes } 分钟前更新

newtab-widget-message-title = 使用列表和内置计时器保持专注
# to-dos stands for "things to do".
newtab-widget-message-copy = 从快速提醒到日常待办、专注会话到伸展休息——保持任务进度和时间管理。
# One spot refers to a dedicated section on new tab to manage and use widgets
newtab-widget-message-focus-forecasts-title = 一个位置，用于专注、预测，以及更多功能
newtab-widget-message-focus-forecasts-body = 使用 { -brand-product-name } 组件保持您的一天流畅。查看预测、保持任务进度，或跨全球追踪时间。

# Strings for the default promo card
newtab-promo-card-title = 支持 { -brand-product-name }
newtab-promo-card-body = 我们的赞助方支持我们构建更优质互联网的使命
newtab-promo-card-cta = 了解更多

# "Make Firefox yours" refers to about:newtab. The call to action here ("Try it now")
# is to customize the new tab page with a background image or color from
# the built-in wallpaper collection or uploading your own image.
newtab-promo-card-title-addons = 使 { -brand-product-name } 成为您的专属
newtab-promo-card-body-addons = 您可以从我们的收藏中选择壁纸，或创建您自己的壁纸。
newtab-promo-card-cta-addons = 立即试用
newtab-promo-card-dismiss-button =
    .title = 关闭
    .aria-label = 关闭

## Strings for activation window message variants. In certain experiment configurations,
## the strings from these variants may be displayed in a message below the search input
## for the first 48 hours of a new profile's lifetime. Some messages include buttons with
## labels, but not all.

newtab-activation-window-message-dismiss-button =
    .title = 关闭
    .aria-label = 关闭

# "This space" refers to about:newtab. The call to action here ("make it your own")
# is to customize newtab with a background image or colour, or by tweaking the
# existing widgetry that appears on it.
newtab-activation-window-message-customization-focus-header = 使此空间成为您的专属
newtab-activation-window-message-customization-focus-message = 选择全新的壁纸，为您喜爱的站点添加快捷方式，并随时了解您感兴趣的故事。
newtab-activation-window-message-customization-focus-primary-button =
    .label = 开始自定义

# "This space" refers to about:newtab. The sentiment of "plays by your rules" is
# meant to evoke the idea that newtab is malleable and customizable. The call to
# action is to customize newtab with a background image or colour, or by tweaking
# the existing widgetry that appears on it.
newtab-activation-window-message-values-focus-header = 此空间遵循您的规则运作
newtab-activation-window-message-values-focus-message = { -brand-product-name } 让您以自己喜欢的方式浏览，并以更个性化的方式开始您的在线一天。使 { -brand-product-name } 成为您的专属。

## Strings for the Clock widget

# Context menu item: toggle the clock card off.
newtab-clock-widget-menu-hide = 隐藏时钟
newtab-clock-widget-menu-learn-more = 了解更多
newtab-clock-widget-menu-edit = 编辑时钟
newtab-clock-widget-menu-switch-to-12h = 切换至12小时制
newtab-clock-widget-menu-switch-to-24h = 切换至24小时制
newtab-clock-widget-label-your-clocks = 您的时钟
newtab-clock-widget-search-location-input =
    .label = 位置
    .placeholder = 搜索城市
    .aria-label = 搜索城市
# "Nickname (optional)" refers to a custom, user-defined label for a saved location
# (e.g., "Home", "Office", or "School") to make it easier to recognize.
# Not to be translated as a legal name, username, or alias used for identity verification.
newtab-clock-widget-input-nickname =
    .label = 昵称（可选）
    .placeholder = 添加昵称
    .aria-label = 昵称（可选）
# "Add new clock" is an icon-only button in the widget toolbar — the
# attributes are consumed as tooltip/screen-reader label only. The button
# never renders visible text.
newtab-clock-widget-button-add =
    .title = 添加新时钟
    .aria-label = 添加新时钟
newtab-clock-widget-button-add-clock = 添加
newtab-clock-widget-button-cancel = 取消
newtab-clock-widget-button-back =
    .title = 返回
    .aria-label = 返回
newtab-clock-widget-button-edit-clock =
    .title = 编辑时钟
    .aria-label = 编辑时钟
newtab-clock-widget-button-save = 保存
newtab-clock-widget-button-remove-clock =
    .title = 移除时钟
    .aria-label = 移除时钟
# Accessible name for a clock row in the "Your clocks" management panel
# when the row has no user-provided nickname. Read aloud by screen
# readers when focus lands on the row.
# Variables:
#   $city (string) - The city name displayed in the row.
newtab-clock-widget-edit-item =
    .aria-label = { $city }
# Accessible name for a clock row when a user nickname has been set.
# Variables:
#   $city (string) - The city name displayed in the row.
#   $nickname (string) - The user-provided nickname for the row.
newtab-clock-widget-edit-item-with-nickname =
    .aria-label = { $city }，昵称：{ $nickname }
newtab-clock-widget-add-clock-form =
    .aria-label = 添加时钟
newtab-clock-widget-edit-clock-form =
    .aria-label = 编辑时钟
# "Search results" is the accessible label for the listbox dropdown that appears
# below the location search field, listing matching cities as the user types.
# It means "results of the search", not "search within the results".
newtab-clock-widget-search-results =
    .aria-label = 搜索结果
# Shown in place of the search results when the user's query does not match any
# supported city — e.g. typing a misspelled name or a place not in the IANA
# time zone list.
newtab-clock-widget-search-no-results = 无匹配项
# "Open menu for clock" is an icon-only button in the widget toolbar — the
# attributes are consumed as tooltip/screen-reader label only. The button
# never renders visible text.
newtab-clock-widget-menu-button =
    .title = 打开时钟菜单
    .aria-label = 打开时钟菜单
# $nickname (String) - The user-defined nickname for a saved clock location (e.g., "Home", "Office").
newtab-clock-widget-label-nickname-with-value = 昵称：{ $nickname }

##

newtab-card-dismiss-button =
    .title = 关闭
    .aria-label = 关闭

## Strings for "Homepage" and "Firefox Home" sections of about:settings#home.
## Homepage panel
home-homepage-title =
    .label = 主页

home-homepage-new-windows =
    .label = 新窗口

home-homepage-new-tabs =
    .label = 新选项卡

# This option leads to the "Custom Homepage" subpage
home-homepage-custom-homepage-button =
    .label = 选择特定站点

## Custom URLs subpage

# Subheader on the Custom Homepage subpage. Followed by a form to enter URLs and a list of URLs already saved, if any.
home-custom-homepage-card-header =
    .label = 网站地址

home-custom-homepage-address =
    .placeholder = 请输入地址
home-custom-homepage-address-button =
    .label = 添加地址

# Shown when no custom websites/URLs to use as a homepage have been added yet
home-custom-homepage-no-results =
    .label = 尚未添加任何网站。

home-custom-homepage-delete-address-button =
    .aria-label = 删除地址
    .title = 删除地址

# Further options to use when setting the home page. Two action buttons are placed in line with this prompt
# to replace the current home page with a currently open page or bookmark.
home-custom-homepage-replace-with-prompt =
    .label = 替换为

# Button that appears in-line after text "Replace with" (home-custom-homepage-replace-with-prompt)
home-custom-homepage-current-pages-button =
    .label = 当前已打开的页面

# Button that appears in-line after text "Replace with" (home-custom-homepage-replace-with-prompt)
home-custom-homepage-bookmarks-button =
    .label = 书签…

## Firefox Home content

home-prefs-content-header =
    .label = { -firefox-home-brand-name }

home-prefs-search-header2 =
    .label = 搜索

home-prefs-stories-header2 =
    .label = 故事
    .description = 由 { -brand-product-name } 家族精心策划的卓越内容

home-prefs-widgets-header =
    .label = 小部件

# Lists is a widget on New Tab, similar to a to-do widget
home-prefs-lists-header =
    .label = 列表

# Timer is a widget on New Tab, similar to the Pomodoro timer.
home-prefs-timer-header =
    .label = 计时器

# Sports is a widget on New Tab showing sports scores and schedules.
home-prefs-sports-widget-header =
    .label = 体育

# Clock is a widget on New Tab that displays time zones around the world.
home-prefs-clocks-header =
    .label = 时钟

home-prefs-mission-message2 =
    .message = 我们的赞助商支持我们构建更美好网络的使命。

home-prefs-manage-topics-link2 =
    .label = 管理主题

home-prefs-choose-wallpaper-link2 =
    .label = 选择壁纸

home-prefs-firefox-logo-header =
    .label = { -brand-short-name } 徽标

# Informational message bar that appears in the Firefox Home section when the options are disabled.
# The user must select Firefox Home as their homepage for either new tabs or new windows to enable
# the features in settings.
home-prefs-firefox-home-disabled-notice =
    .message = 若需使用这些功能，请您将新选项卡或新窗口设置为 { -firefox-home-brand-name }。

# Variables:
#   $num (number) - Number of rows displayed
home-prefs-sections-rows-option-srd =
    .label =
        { $num ->
            [one] { $num } 行
           *[other] { $num } 行
        }

# Dropdown option shown when an extension replaces the contents of new windows or tabs.
# Variables:
#   $extension (string) - Name of the extension
home-prefs-homepage-extension-option =
    .label = 扩展（{ $extension }）

home-restore-defaults-srd =
    .label = 恢复默认设置
    .accesskey = R

home-mode-choice-default-fx-srd =
    .label = { -firefox-home-brand-name }（默认）

home-mode-choice-custom-srd =
    .label = 自定义 URL…

home-mode-choice-blank-srd =
.label = 空白页

home-prefs-shortcuts-header-srd =
    .label = 快捷方式

home-prefs-shortcuts-select =
    .aria-label = 快捷方式

home-prefs-shortcuts-by-option-sponsored-srd =
    .label = 赞助的快捷方式

home-prefs-recommended-by-option-sponsored-stories-srd =
    .label = 赞助的文章

home-prefs-highlights-option-visited-pages-srd =
    .label = 已访问的页面

home-prefs-highlights-options-bookmarks-srd =
    .label = 书签

home-prefs-highlights-option-most-recent-download-srd =
    .label = 最近的下载

home-prefs-recent-activity-header-srd =
    .label = 最近的活动

home-prefs-recent-activity-select =
    .aria-label = 最近的活动

home-prefs-weather-header-srd =
    .label = 天气

home-prefs-support-firefox-header-srd =
    .label = 支持 { -brand-product-name }

home-prefs-mission-message-learn-more-link-srd = 了解详情
