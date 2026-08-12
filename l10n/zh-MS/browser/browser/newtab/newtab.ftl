# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### Firefox Home / New Tab strings for about:home / about:newtab.

newtab-page-title = 新的 Tab
#  (developer note): @nova-cleanup(remove-string): Remove newtab-customize-panel-icon-button once Nova lands, will be using newtab-customize-panel-label instead
newtab-customize-panel-icon-button =
    .title = 定制这页
#  (developer note): @nova-cleanup(remove-string): Remove newtab-customize-panel-icon-button-label once Nova lands, will be using newtab-customize-panel-label instead
newtab-customize-panel-icon-button-label = 定制
newtab-customize-panel-label =
    .label = 定制
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
newtab-search-box-handoff-text = 搜索与 { $engine } 或输入地址
newtab-search-box-handoff-text-no-engine = 搜索或输入地址
# Variables:
#   $engine (string) - The name of the user's default search engine
newtab-search-box-handoff-input =
    .placeholder = 搜索与 { $engine } 或输入地址
    .title = 搜索与 { $engine } 或输入地址
    .aria-label = 搜索与 { $engine } 或输入地址
newtab-search-box-handoff-input-no-engine =
    .placeholder = 搜索或输入地址
    .title = 搜索或输入地址
    .aria-label = 搜索或输入地址

newtab-search-box-text = 搜索那网
newtab-search-box-input =
    .placeholder = 搜索那网
    .aria-label = 搜索那网

## Top Sites - General form dialog.

newtab-topsites-add-search-engine-header = 添加搜索引擎
newtab-topsites-add-shortcut-header = 新的快捷方式
newtab-topsites-edit-shortcut-header = 编辑快捷方式
newtab-topsites-add-shortcut-label = 添加快捷方式
newtab-topsites-add-shortcut-title =
    .title = 添加快捷方式
    .aria-label = 添加快捷方式
newtab-topsites-title-label = 标题
newtab-topsites-title-input =
    .placeholder = Enter 一个标题

newtab-topsites-url-label = URL
newtab-topsites-url-input =
    .placeholder = 类型或粘贴一个 URL
newtab-topsites-url-validation = 有确实根据的 URL 必需的

## Clear text button for the URL and image URL input fields in the Top Sites form.

newtab-topsites-clear-input =
    .aria-label = 清除电文

newtab-topsites-image-url-label = 定制图象 URL
newtab-topsites-use-image-link = 使用一个定制图象…
newtab-topsites-image-validation = 图象失败的到加载. 尝试一个不同的 URL.

## Top Sites - General form dialog buttons. These are verbs/actions.

newtab-topsites-cancel-button = 取消
newtab-topsites-delete-history-button = Delete 从历史记录
newtab-topsites-save-button = 保存
newtab-topsites-preview-button = 预览
newtab-topsites-add-button = 添加

## Top Sites - Delete history confirmation dialog.

newtab-confirm-delete-history-p1 = 你确定你想要到删除每一建议的这页从你的历史记录?
# "This action" refers to deleting a page from history.
newtab-confirm-delete-history-p2 = 此操作无法撤销.

## Top Sites - Sponsored label

newtab-topsite-sponsored = 赞助( sponsor的过去式和过去分词)

## Label used by screen readers for pinned top sites

# Variables:
#   $title (string) - The label or hostname of the site.
topsite-label-pinned =
    .aria-label = { $title } (用针别住(pin的过去分词))
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
    .aria-label = 打开上下文菜单为了 { $title }

## Context Menu: These strings are displayed in a context menu and are meant as a call to action for a given page.

newtab-menu-edit-topsites = 编辑
newtab-menu-open-new-window = 打开在一个新的窗口
newtab-menu-open-new-private-window = 打开在一个新的私人的窗口
newtab-menu-dismiss = 解散
newtab-menu-pin = 大头针
newtab-menu-unpin = 取下...上的别针
newtab-menu-delete-history = Delete 从历史记录
newtab-menu-show-privacy-info = 我们的保证人 & 你的隐私
# Report is a verb (i.e. report issue with the content).
newtab-menu-report = 报告
# Context menu option to personalize New Tab recommended stories by blocking a section of stories,
# e.g. "Sports". "Block" is a verb here.
newtab-menu-section-block = 阻止
# "Follow", "unfollow", and "following" are social media terms that refer to subscribing to or unsubscribing from a section of stories.
# e.g. Following the travel section of stories.
newtab-menu-section-unfollow-topic = Unfollow
# Context menu option to open a support page explaining the New Tab personalization features and privacy controls.
newtab-menu-section-learn-more = 学习更多

## Context menu options for sponsored stories and new ad formats on New Tab.

newtab-menu-manage-sponsored-content = 管理赞助( sponsor的过去式和过去分词) 内容
newtab-menu-our-sponsors-and-your-privacy = 我们的保证人和你的隐私
newtab-menu-report-this-ad = 报告这地址

##

# Bookmark is a noun in this case, "Remove bookmark".
newtab-menu-remove-bookmark = 移除书签
# Bookmark is a verb here.
newtab-menu-bookmark = 书签

## Context Menu - Downloaded Menu. "Download" in these cases is not a verb,
## it is a noun. As in, "Copy the link that belongs to this downloaded item".

newtab-menu-copy-download-link = 复制下载连接
newtab-menu-go-to-download-page = 去到下载页
newtab-menu-remove-download = 移除从历史记录

## Context Menu - Download Menu: These are platform specific strings found in the context menu of an item that has
## been downloaded. The intention behind "this action" is that it will show where the downloaded file exists on the file
## system for each operating system.

newtab-menu-show-file =
    { PLATFORM() ->
        [macos] 显示在发现者
       *[other] 打开包含文件夹
    }
newtab-menu-open-file = 打开文件

## Card Labels: These labels are associated to pages to give
## context on how the element is related to the user, e.g. type indicates that
## the page is bookmarked, or is currently open on another device.

newtab-label-visited = 拜访
newtab-label-bookmarked = 书签( bookmark的过去式和过去分词 )
newtab-label-removed-bookmark = 书签离开的
newtab-label-recommended = 伸向( trend的现在分词 )
newtab-label-saved = 保存到 { -pocket-brand-name }
newtab-label-download = 将（程序

# This string is used in the story cards to indicate sponsored content
# Variables:
#   $sponsorOrSource (string) - The name of a company or their domain
newtab-label-sponsored = { $sponsorOrSource } ·赞助( sponsor的过去式和过去分词)

# This string is used at the bottom of story cards to indicate sponsored content
# Variables:
#   $sponsor (string) - The name of a sponsor
newtab-label-sponsored-by = 赞助( sponsor的过去式和过去分词) 由 { $sponsor }

# This string is used under the image of story cards to indicate source and time to read
# Variables:
#   $source (string) - The name of a company or their domain
#   $timeToRead (number) - The estimated number of minutes to read this story
newtab-label-source-read-time = { $source } · { $timeToRead } 部长（Minister）

# This string is used under fixed size ads to indicate sponsored content
newtab-label-sponsored-fixed = 赞助( sponsor的过去式和过去分词)

## Section Menu: These strings are displayed in the section context menu and are
## meant as a call to action for the given section.

newtab-section-menu-privacy-notice = 隐私注意

## Section Headers.

newtab-section-header-topsites = TOP协议坐
newtab-section-header-recent-activity = 最近的活动
newtab-section-header-stories = 想-provoking 故事
# "picks" refers to recommended articles
newtab-section-header-todays-picks = Today's 拾取为了你

## Empty Section States: These show when there are no more items in a section. Ex. When there are no more Pocket story recommendations, in the space where there would have been stories, this is shown instead.

newtab-empty-section-highlights = 启动浏览, 和 (we shall或 we will 的常用口语形式) 显示一些的那全部文章, 视频文件, 和其他的页 you have 你（们）已经最近拜访或书签( bookmark的过去式和过去分词 ) 这里.

# Ex. When there are no more story recommendations, in the space where there would have been stories, this is shown instead.
newtab-empty-section-topstories-generic = you have 你（们）已经 catch的过去式和过去分词向上的. 复选后面的以后为了更多故事. 不能等待? 选择一个通俗的主题到发现更多大的故事从包围那网.

## Empty Section (Content Discovery Experience). These show when there are no more stories or when some stories fail to load.

newtab-discovery-empty-section-topstories-header = 你是 catch的过去式和过去分词向上的!
newtab-discovery-empty-section-topstories-content = 复选后面的以后为了更多故事.
newtab-discovery-empty-section-topstories-try-again-button = 尝试再一次
newtab-discovery-empty-section-topstories-loading = 装载…
# Displays when a layout in a section took too long to fetch articles.
newtab-discovery-empty-section-topstories-timed-out = (表示惊讶、沮丧、谢罪等)哎哟! 我们几乎有负载的这扇区, 除了不相当.

## Error Fallback Content.
## This message and suggested action link are shown in each section of UI that fails to render.

newtab-error-fallback-info = (表示惊讶、沮丧、谢罪等)哎哟, 某事去错误的装载这内容.
newtab-error-fallback-refresh-link = 刷新页到试再一次.

## Customization Menu

#  (developer note): @nova-cleanup(remove-string): Remove old string once Nova lands. The newtab-custom-shortcuts-nova string will take over
newtab-custom-shortcuts-toggle =
  .label = 快捷方式
  .description = 坐你保存或拜访

newtab-custom-shortcuts-nova =
  .label = 快捷方式

newtab-custom-row-description =
  .description = 数字的返回引用中的行数
# Variables
#   $num (number) - Number of rows to display
#  (developer note): @nova-cleanup(remove-string): Remove string once Nova lands. We won't be using "row"/"rows" anymore for the dropdown
newtab-custom-row-selector2 =
        .label = { $num ->
            [one] { $num } 行
           *[other] { $num } 返回引用中的行数
        }
#  (developer note): @nova-cleanup(remove-string): Remove string once Nova lands. We won't be having a description under "Recommended stories" anymore
newtab-custom-stories-toggle =
  .label = 被推荐的故事
  .description = 例外的内容 (curate 的过去分词) n. 助理牧师由那 { -brand-product-name } 家庭
newtab-recommended-stories-toggle =
  .label = 被推荐的故事
newtab-custom-stories-personalized-toggle =
  .label = 故事
newtab-custom-stories-personalized-checkbox-label = 个人化的故事立基于在你的活动
newtab-custom-weather-toggle =
  .label = 天气
  .description = Today's 趋势预测在一个一瞥
newtab-custom-widget-weather-toggle =
  .label = 天气
newtab-custom-widget-lists-toggle =
  .label = 列表
newtab-custom-widget-timer-toggle =
  .label = 计时器
newtab-custom-widget-clock-toggle =
  .label = 时钟
newtab-custom-widget-sports-toggle2 =
  .label = 运动
newtab-custom-widget-section-title = 装饰物
newtab-custom-widget-section-toggle =
    .label = 装饰物
newtab-widget-manage-title = 装饰物
newtab-widget-manage-widget-button =
    .label = 管理装饰物

# Tooltip for close button
newtab-custom-close-menu-button =
    .title = 关闭
    .aria-label = 关闭菜单
newtab-custom-settings = 管理更多设置

## New Tab Wallpapers

newtab-wallpaper-title = 壁纸
newtab-wallpaper-reset = 重置到默认
#  (developer note): @nova-cleanup(remove-string): Remove old "Upload an image" string once Nova lands. The new "Add an image"  string will take over
newtab-wallpaper-upload-image = 上装一个图象
newtab-wallpaper-add-an-image = 添加一个图象
newtab-wallpaper-custom-color = 选取一个颜色
newtab-wallpaper-toggle-title =
    .label = 壁纸
# Variables
#   $file_size (number) - The number of the maximum image file size (in MB) that may be uploaded
newtab-wallpaper-error-max-file-size = 那图象非常的那文件大小界限的 { $file_size }MB. 请试上传一个较小文件.
newtab-wallpaper-error-upload-file-type = 我们 (=could not)不能上装你的文件. 请试再一次与一个图象文件.
newtab-wallpaper-light-red-panda = 简化大熊猫
newtab-wallpaper-light-mountain = 白色山
newtab-wallpaper-light-sky = 天空与紫色和粉红色云
newtab-wallpaper-light-color = 蓝色, 粉红色和黄色世鹏科技电子
newtab-wallpaper-light-landscape = 蓝色雾山横向
newtab-wallpaper-light-beach = 海滩与手掌树
newtab-wallpaper-dark-aurora = 曙光北欧化工（公司）
newtab-wallpaper-dark-color = 简化和蓝色世鹏科技电子
newtab-wallpaper-dark-panda = 简化大熊猫隐藏的在森林
newtab-wallpaper-dark-sky = 城市横向与一个夜天空
newtab-wallpaper-dark-mountain = 横向山
newtab-wallpaper-dark-city = 紫色城市横向
newtab-wallpaper-dark-fox-anniversary = 一个狐狸在那路面近的一个森林
newtab-wallpaper-light-fox-anniversary = 一个狐狸在一个草绿色的域与一个有雾的山横向

## Solid Colors

#  (developer note): @nova-cleanup(remove-string): Remove old "Solid colors" string once Nova lands. The simplified "Colors" string will take over
newtab-wallpaper-category-title-colors = 原色颜色
newtab-wallpaper-colors = 颜色
newtab-wallpaper-blue = 蓝色
newtab-wallpaper-light-blue = 光蓝色
newtab-wallpaper-light-purple = 光紫色
newtab-wallpaper-light-green = 光绿色
newtab-wallpaper-green = 绿色
newtab-wallpaper-beige = 淡棕色的
newtab-wallpaper-yellow = 黄色
newtab-wallpaper-orange = 柑橘
newtab-wallpaper-pink = 粉红色
newtab-wallpaper-light-pink = 光粉红色
newtab-wallpaper-red = 简化
newtab-wallpaper-dark-blue = 黑暗蓝色
newtab-wallpaper-dark-purple = 黑暗紫色
newtab-wallpaper-dark-green = 黑暗绿色
newtab-wallpaper-brown = 褐色

## Abstract

newtab-wallpaper-category-title-abstract = 摘录
newtab-wallpaper-abstract-green = 绿色世鹏科技电子
newtab-wallpaper-abstract-blue = 蓝色世鹏科技电子
newtab-wallpaper-abstract-purple = 紫色世鹏科技电子
newtab-wallpaper-abstract-orange = 柑橘世鹏科技电子
newtab-wallpaper-gradient-orange = 倾斜度柑橘和粉红色
newtab-wallpaper-abstract-blue-purple = 蓝色和紫色世鹏科技电子
newtab-wallpaper-abstract-white-curves = 白色与荫蔽的曲线
newtab-wallpaper-abstract-purple-green = 紫色和绿色光倾斜度
newtab-wallpaper-abstract-blue-purple-waves = 蓝色和紫色有波浪的世鹏科技电子
newtab-wallpaper-abstract-black-waves = 黑色有波浪的世鹏科技电子

## Photographs

newtab-wallpaper-category-title-photographs = 相片
newtab-wallpaper-beach-at-sunrise = 海滩在日出
newtab-wallpaper-beach-at-sunset = 海滩在日落
newtab-wallpaper-storm-sky = 暴风雨天空
newtab-wallpaper-sky-with-pink-clouds = 天空与粉红色云
newtab-wallpaper-red-panda-yawns-in-a-tree = 简化大熊猫哈欠在一个树
newtab-wallpaper-white-mountains = 白色山
newtab-wallpaper-hot-air-balloons = 各种各样的颜色的热的空气气球在...的时候白天
newtab-wallpaper-starry-canyon = 蓝色星光照耀的夜
newtab-wallpaper-suspension-bridge = 灰色完整-suspension 桥摄影在...的时候白天
newtab-wallpaper-sand-dunes = 白色沙催促者
newtab-wallpaper-palm-trees = 黑色半身侧面影的椰子手掌高音（等于treble）在...的时候金的小时
newtab-wallpaper-blue-flowers = (电影的)特写镜头摄影的蓝色-petaled 花在花

## Celestial

# “Celestial” referring to astronomy; positioned in or relating to the sky,
# or outer space as observed in astronomy.
# Not to be confused with religious definition of the word.
newtab-wallpaper-category-title-celestial = 天的
newtab-wallpaper-celestial-lunar-eclipse = 阴历的日食
newtab-wallpaper-celestial-earth-night = 夜相片从低点地球轨道
newtab-wallpaper-celestial-starry-sky = 星光照耀的天空
newtab-wallpaper-celestial-eclipse-time-lapse = 阴历的日食时间过失
newtab-wallpaper-celestial-black-hole = 黑色孔银河例证
newtab-wallpaper-celestial-river = 人造卫星图象的河

## Firefox

newtab-wallpaper-category-title-firefox = { -brand-product-name }


# Variables
#   $author_string (String) - The name of the creator of the photo.
#   $webpage_string (String) - The name of the webpage where the photo is located.
newtab-wallpaper-attribution = 相片由 <a data-l10n-name="name-link">{ $author_string }</a> 在 <a data-l10n-name="webpage-link">{ $webpage_string }</a>
newtab-wallpaper-feature-highlight-header = 尝试一个飞溅的颜色
newtab-wallpaper-feature-highlight-content = 弹性你的新的 Tab 一个开始一看与壁纸.
newtab-wallpaper-feature-highlight-button = 获得它
# Tooltip for dismiss button
feature-highlight-dismiss-button =
    .title = 解散
    .aria-label = 关闭跃上型
feature-highlight-wallpaper =
    .title = { -newtab-wallpaper-feature-highlight-header }
    .aria-label = { -newtab-wallpaper-feature-highlight-content }

## New Tab Weather

# Variables:
#   $provider (string) - Service provider for weather data
newtab-weather-see-forecast-description =
    .title = 看见趋势预测在 { $provider }
    .aria-description = { $provider } ∙赞助( sponsor的过去式和过去分词)
# Variables:
#   $provider (string) - Service provider for weather data
newtab-weather-sponsored = { $provider } ∙赞助( sponsor的过去式和过去分词)
newtab-weather-menu-change-location = 更改位置
newtab-weather-change-location-search-input-placeholder =
    .placeholder = 搜索位置
    .aria-label = 搜索位置
# "Current" refers to the user's physical/geographic location detected via geolocation.
newtab-weather-change-location-search-use-current =
    .label = 使用当前的位置
newtab-weather-menu-weather-display = 天气显示器
newtab-weather-todays-forecast = Today's 趋势预测
newtab-weather-see-full-forecast = 看见完整趋势预测
# Display options are:
# - Simple: Displays a current weather condition icon and the current temperature
# - Detailed: Include simple information plus a short text summary: e.g. "Mostly cloudy"
newtab-weather-menu-weather-display-option-simple = 简单的
newtab-weather-menu-change-weather-display-simple = 开关到简单的查看
newtab-weather-menu-weather-display-option-detailed = 详细的
newtab-weather-menu-change-weather-display-detailed = 开关到详细的查看
newtab-weather-menu-temperature-units = 温度单元常数
newtab-weather-menu-temperature-option-fahrenheit = 华氏温度计的
newtab-weather-menu-temperature-option-celsius = 摄氏的
newtab-weather-menu-change-temperature-units-fahrenheit = 开关到华氏温度计的
newtab-weather-menu-change-temperature-units-celsius = 开关到摄氏的
newtab-weather-menu-learn-more = 学习更多
newtab-weather-menu-detect-my-location = 发现我的位置
# This message is shown if user is working offline
newtab-weather-error-not-available = 天气资料是不可利用的右现在.
newtab-weather-opt-in-see-weather = 你是否想要到看见那天气为了你的位置?
newtab-weather-opt-in-not-now =
    .label = 不现在
newtab-weather-opt-in-yes =
    .label = 是
newtab-weather-opt-in-headline = 获得你的本地的天气趋势预测
newtab-weather-opt-in-use-location =
    .label = 使用位置
newtab-weather-opt-in-choose-location = 选取位置
# We'll be showing static (fake) weather data if the user has not opted in to using their location
newtab-weather-static-city = 新的约克郡城市
# "Highest" here refers to the highest temperature of the day
newtab-weather-high =
    .aria-label = 高度
# "Lowest" here refers to the lowest temperature of the day
newtab-weather-low =
    .aria-label = 低点

## Topic Labels

newtab-topic-label-business = 生意
newtab-topic-label-career = 事业
newtab-topic-label-education = 教育
newtab-topic-label-arts = 娱乐
newtab-topic-label-food = 食物
newtab-topic-label-health = 健康
newtab-topic-label-hobbies = 赌博
# ”Money” = “Personal Finance”, refers to articles and stories that help readers better manage
# and understand their personal finances – from saving money to buying a home. See the
# “Curated by our editors“ section at the top of https://getpocket.com/explore/personal-finance for more context
newtab-topic-label-finance = 金钱
newtab-topic-label-society-parenting = 父母对子女的养育
newtab-topic-label-government = 精明的
newtab-topic-label-education-science = 科学
# ”Life Hacks” = “Self Improvement”, refers to articles and stories aimed at helping readers improve various
# aspects of their lives – from mental health to  productivity. See the “Curated by our editors“ section
# at the top of https://getpocket.com/explore/self-improvement for more context.
newtab-topic-label-society = 生活劈
newtab-topic-label-sports = 运动
newtab-topic-label-tech = 技术学院或学校
newtab-topic-label-travel = 旅行
newtab-topic-label-home = 主页 & 花园

## Topic Selection Modal

# “fine-tune” refers to the process of making small adjustments to something to get
# the best or desired experience or performance.
newtab-topic-selection-title = 选择主题到精细-tune 你的送纸
# “tailored” refers to process of (a tailor) making (clothes) to fit individual customers.
# In other words, “Our expert curators prioritize stories to fit your selected interests”
newtab-topic-selection-subtitle = 选取二或更多主题. 我们的高级管理者按优先次序列出故事裁缝做的到你的兴趣. 更新任何时候.
newtab-topic-selection-save-button = 保存
newtab-topic-selection-cancel-button = 取消
newtab-topic-selection-button-maybe-later = 也许以后
newtab-topic-selection-privacy-link = 学习如何我们防卫和管理资料
newtab-topic-selection-button-update-interests = 更新你的兴趣
newtab-topic-selection-button-pick-interests = 拾取你的兴趣

## Content Feed Sections
## "Follow", "unfollow", and "following" are social media terms that refer to subscribing to or unsubscribing from a section of stories.
## e.g. Following the travel section of stories.

newtab-section-follow-button = 跟随
# Variables:
#   $topic (string) - Topic that the user can follow
newtab-section-follow-button-label =
    .aria-label = 跟随 { $topic }
newtab-section-following-button = 下列各项
newtab-section-unfollow-button = Unfollow
# Variables:
#   $topic (string) - Topic that the user is following and can unfollow
newtab-section-unfollow-button-label =
    .aria-label = 下列各项: Unfollow { $topic }
# A modal may appear next to the Follow button, directing users to try out the feature
newtab-section-follow-highlight-title = 精细-tune 你的送纸
newtab-section-follow-highlight-subtitle = 跟随你的兴趣到看见更多的什么你喜欢.

## Button to block/unblock listed topics
## "Block", "unblocked", and "blocked" are social media terms that refer to hiding a section of stories.
## e.g. Blocked the politics section of stories.

newtab-section-block-button = 阻止
newtab-section-blocked-button = 阻止
newtab-section-unblock-button = 解锁

# Variables:
#   $topic (string) - Name of topic that user is following
newtab-section-follow-topic =
    .aria-label = 跟随 { $topic }
# Variables:
#   $topic (string) - Name of topic that user is unfollowing
newtab-section-unfollow-topic =
    .aria-label = Unfollow { $topic }
# Variables:
#   $topic (string) - Name of topic that user is blocking
newtab-section-block-topic =
    .aria-label = 阻止 { $topic }
# Variables:
#   $topic (string) - Name of topic that user is unblocking
newtab-section-unblock-topic =
    .aria-label = 解锁 { $topic }

## Confirmation modal for blocking a section

newtab-section-confirm-block-topic-p1 = 你确定你想要到阻止这主题?
newtab-section-confirm-block-topic-p2 = 阻止主题将无比较久出现在你的送纸.

# Variables:
#   $topic (string) - Name of topic that user is blocking
newtab-section-block-topic-button = 阻止 { $topic }
newtab-section-block-cancel-button = 取消

## Panel in the Customize menu section to manage followed and blocked topics

newtab-section-mangage-topics-title = 主题
newtab-section-manage-topics-button-v2 =
    .label = 管理主题
newtab-section-mangage-topics-followed-topics = 跟随的
newtab-section-mangage-topics-followed-topics-empty-state = 你有不跟随的任何的主题还.
newtab-section-mangage-topics-blocked-topics = 阻止
newtab-section-mangage-topics-blocked-topics-empty-state = 你有不阻止任何的主题还.

## Strings for custom wallpaper highlight

newtab-custom-wallpaper-title = 定制壁纸是这里
# 'Make firefox yours" means to customize or personalize
newtab-custom-wallpaper-subtitle = 上装你的自己的壁纸或拾取一个定制颜色到使 { -brand-product-name } 你的.
newtab-custom-wallpaper-cta = 尝试它

## Strings for new user activation custom wallpaper highlight

newtab-new-user-custom-wallpaper-title = 选取一个壁纸到使 { -brand-product-name } 你的
newtab-new-user-custom-wallpaper-subtitle = 使每一新的标签页感觉相似的主页与定制壁纸和颜色.
newtab-new-user-custom-wallpaper-cta = 尝试它现在

## Strings for Nova wallpaper feature highlight

newtab-wallpaper-feature-highlight-title = 新鲜的新的壁纸只是拥有土地的
newtab-wallpaper-feature-highlight-subtitle = 选取你的喜欢的事物和使每一新的标签页感觉相似的主页.
newtab-wallpaper-feature-highlight-cta = 选取壁纸

## Strings for download mobile highlight

newtab-download-mobile-highlight-title = 下载 { -brand-product-name } 为了活动物体
# "Scan the code" refers to scanning the QR code that appears above the body text that leads to Firefox for mobile download.
newtab-download-mobile-highlight-body-variant-a = 网络软件目录那代码到安全地浏览在那去.
newtab-download-mobile-highlight-body-variant-b = 拾取向上的哪里你离开关闭何时你同步的你的标签页, 密码, 和更多.
newtab-download-mobile-highlight-body-variant-c = 做你知道你能采取 { -brand-product-name } 在那去? 相同的浏览器. 在你的口袋.
newtab-download-mobile-highlight-image =
    .aria-label = QR 代码到下载 { -brand-product-name } 为了活动物体

## Strings for shortcuts highlight

newtab-shortcuts-highlight-title = 你的收藏夹在你的指尖
newtab-shortcuts-highlight-subtitle = 添加一个快捷方式到保持你的喜欢的事物坐一(个) 单击离去.

## Strings for reporting issues with ads and content

newtab-report-content-why-reporting-this =
  .label = 为什么是你报道这?
newtab-report-ads-reason-not-interested =
  .label = 我是（缩写）不感兴趣的
newtab-report-ads-reason-inappropriate =
  .label = 它是不适当的
newtab-report-ads-reason-seen-it-too-many-times =
  .label = （等于I have）看见它也多数蒂姆（男子名）
newtab-report-content-wrong-category =
  .label = 错误的分类
newtab-report-content-outdated =
  .label = 旧式的
newtab-report-content-inappropriate-offensive =
  .label = 不适当的或令人不快的
newtab-report-content-spam-misleading =
  .label = 罐头猪肉或引入歧途的
newtab-report-content-requires-payment-subscription =
  .label = 需要付款或捐献
newtab-report-content-requires-payment-subscription-learn-more = 学习更多
newtab-report-cancel = 取消
newtab-report-submit = 提交
newtab-toast-thanks-for-reporting =
    .message = 谢意你为了报道这.
newtab-toast-widgets-hidden =
    .message = 选择那铅笔像标到添加装饰物后面的任何时候.
# Variables:
#   $topic (string) - Topic that the user has followed
newtab-section-toast-follow =
    .message = you are 你（你们）是现在下列各项 { $topic }.
# Variables:
#   $topic (string) - Topic that the user has unfollowed
newtab-section-toast-unfollow =
    .message = you are 你（你们）是无比较久下列各项 { $topic }.
# Variables:
#   $topic (string) - Topic that the user has blocked
newtab-section-toast-block =
    .message = 你将不看见故事关于 { $topic } 再也不.

## Strings for task / to-do list productivity widget

newtab-widget-section-title = 装饰物
newtab-widget-menu-hide = 隐藏装饰物
newtab-widget-menu-change-size = 更改大小
# Parent label for a submenu in the widget menu that reorders the widget
# among its siblings. "Left" and "Right" appear as items inside this submenu.
newtab-widget-menu-move = 移动
# Submenu item under "Move"; moves the widget one position to the left.
# RTL locales should translate this as "Right".
newtab-widget-menu-move-left = 许可
# Submenu item under "Move"; moves the widget one position to the right.
# RTL locales should translate this as "Left".
newtab-widget-menu-move-right = 右
newtab-widget-size-small = 小的
newtab-widget-size-medium = 媒体
newtab-widget-size-large = 大的
# Tooltip for hide all widgets button
newtab-widget-section-hide-all-button =
    .title = 隐藏装饰物
    .aria-label = 隐藏所有的装饰物
newtab-widget-section-maximize =
    .title = 使膨胀装饰物
    .aria-label = 使膨胀所有的装饰物到完整大小
newtab-widget-section-minimize =
    .title = 最小化装饰物
    .aria-label = 折叠所有的装饰物到使紧密结合大小
newtab-widget-section-menu-button =
    .title = 装饰物菜单
    .aria-label = 打开装饰物菜单
newtab-widget-add-widgets-button =
    .aria-label = 添加装饰物
    .title = 添加装饰物
newtab-widget-section-menu-manage = 管理装饰物
newtab-widget-section-menu-hide-all = 隐藏装饰物
newtab-widget-section-menu-learn-more = 学习更多
newtab-widget-section-feedback = 告诉我们什么你想
# Button shown when additional widgets are hidden beyond the
# first row, allowing users to show them.
newtab-widget-section-show-more =
    .label = 显示更多装饰物
# Button shown when the widgets row is expanded to multiple rows,
# allowing users to collapse it back to one row.
newtab-widget-section-show-less =
    .label = 显示较少的装饰物
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
    .placeholder = 新的列表
    .aria-label = 编辑列表名称

# "Add one" means adding a new task to the list (e.g., "Walk the dog")
newtab-widget-lists-empty-cta = 那可能性是不停的. 添加一(个).
# A simple label next to the default list name letting users know this is a new / beta feature
newtab-widget-lists-label-new =
    .label = 新的
newtab-widget-lists-label-beta =
    .label = 希腊字母表的第二个字母
# When tasks have been previous marked as complete, they will appear in their own separate list beneath incomplete items
# Variables:
#   $number (number) - Amount of list items marked complete
newtab-widget-lists-completed-list = 完整的 ({ $number })
newtab-widget-lists-celebration-headline = 善行工作
newtab-widget-lists-celebration-subhead = 所有的清除
newtab-widget-task-list-menu-copy = 复制
newtab-widget-lists-menu-edit = 编辑列表名称
newtab-widget-lists-menu-edit2 =
    .aria-label = 编辑列表名称
newtab-widget-lists-menu-create = 创建一个新的列表
newtab-widget-lists-menu-delete = Delete 这列表
newtab-widget-lists-menu-copy = 复制列表到剪贴板
newtab-widget-lists-menu-learn-more = 学习更多
newtab-widget-lists-button-add-item = 添加一个项
newtab-widget-lists-input-add-an-item2 =
    .placeholder = 添加一个项
    .aria-label = 添加一个项
newtab-widget-lists-input-error = 请包含电文到添加一个项.
newtab-widget-lists-input-menu-open-link = 打开连接
newtab-widget-lists-input-menu-move-up = 移动向上的
newtab-widget-lists-input-menu-move-down = 移动向下
newtab-widget-lists-input-menu-delete = Delete
newtab-widget-lists-input-menu-edit = 编辑
newtab-widget-lists-input-menu-edit2 =
    .aria-label = 编辑项
newtab-widget-lists-edit-clear =
    .aria-label = 取消
    .title = 取消

# the + symbol emphasises the functionality of adding a new list
newtab-widget-lists-dropdown-create =
    .label = + 创建一个新的列表

## Strings for timer productivity widget
## When the timer ends, a system notification may be shown. Depending on which mode the timer is in, that message would be shown

newtab-widget-timer-notification-title = 计时器
newtab-widget-timer-notification-focus = 焦点时间是向上的. 美好的工作. 需要一个中断?
newtab-widget-timer-notification-break = 你的中断是结束. 预备好的状态到焦点?
newtab-widget-timer-notification-warning = 通知是关闭
newtab-widget-timer-mode-focus =
    .label = 焦点
newtab-widget-timer-mode-break =
    .label = 中断
newtab-widget-timer-label-play =
    .label = 播放
newtab-widget-timer-label-pause =
    .label = 暂停
newtab-widget-timer-reset =
    .title = 重置
newtab-widget-timer-menu-notifications = 转弯关闭通知
newtab-widget-timer-menu-notifications-on = 转弯在通知
newtab-widget-timer-menu-learn-more = 学习更多

## Sports widget

newtab-sports-widget-menu-follow-teams = 跟随队
newtab-sports-widget-menu-view-schedule = 查看时间表
newtab-sports-widget-menu-view-upcoming = 查看即将来临的
newtab-sports-widget-menu-view-results = 查看结果
# Milestone dates (e.g. group stage, semifinals, etc.). Refers to calendar dates.
newtab-sports-widget-menu-key-dates = 键磁盘分配表
newtab-sports-widget-menu-learn-more = 学习更多

# “Keep tabs on” is an informal expression meaning to stay updated on, stay informed on, or regularly follow something (in this case, World Cup matches and updates).
newtab-sports-widget-keep-tabs = 保持标签页在那世界杯子
newtab-sports-widget-get-updates = 获得活的比较更新和更多.
newtab-sports-widget-view-matches =
    .label = 查看比较
newtab-sports-widget-follow-teams =
    .label = 跟随队

# Variables:
#   $number (number) - Maximum number of teams a user can choose to follow in the team selection state
newtab-sports-widget-follow-teams-title =
    { $number ->
        *[other] 跟随向上的到 { $number } 把马(牛)套在同一辆车上
    }
newtab-sports-widget-choose-wallpaper =
    .label = 选取一个壁纸
newtab-sports-widget-skip = 跳过
newtab-sports-widget-search-country =
    .placeholder = 搜索国家
    .aria-label = 搜索国家
newtab-sports-widget-cancel = 取消
newtab-sports-widget-back-button =
    .aria-label = 后面的
newtab-sports-widget-done-button =
    .label = 完成了的
# Shown in the follow-teams list for a team that has been knocked out of the tournament.
# Variables:
#   $teamName (string) - the localized team name (e.g. "Canada").
newtab-sports-widget-team-name-eliminated = { $teamName } (排除( eliminate的过去式和过去分词 ))
newtab-sports-widget-view-all =
    .label = 查看所有的
newtab-sports-widget-show-less =
    .label = 显示最低成本估算与调度法
# Toggle that filters the list of teams the user follows
newtab-sports-widget-followed-only-toggle =
    .label = 仅跟随的队

## Sports widget live-games pagination. Shown when 2+ matches are live at the same time

# arrow button that goes to the previous page of live matches.
newtab-sports-widget-pagination-previous =
    .aria-label = 早先的
    .title = 早先的
# arrow button that goes to the next page of live matches.
newtab-sports-widget-pagination-next =
    .aria-label = 近邻干扰
    .title = 近邻干扰
# Dot indicator that jumps directly to a given live match.
# $index (number) - 1-based position of this dot in the list.
# $total (number) - Total number of live matches.
newtab-sports-widget-pagination-dot =
    .aria-label = 活的比较 { $index } 的 { $total }
    .title = 活的比较 { $index } 的 { $total }

## Watch live stream dialog
## Shown when the user clicks the “Watch live” button on a live match.
## Lists available streaming services where the match can be watched.

# Watch is a verb (as in watch matches online).
newtab-sports-widget-watch =
    .label = 观察
    .title = 观察活的

# Watch is a verb (as in watch matches online).
newtab-sports-widget-watch-icon =
    .aria-label = 观察活的
    .title = 观察活的

newtab-sports-widget-watch-dialog-close =
    .aria-label = 关闭
    .title = 关闭

# Tag: user can watch without paying (sign-in may still be required).
newtab-sports-widget-watch-stream-free = 自由的

# Tag: user can start watching via a trial; continued access may require payment after it ends.
newtab-sports-widget-watch-stream-free-trial = 自由的审判

# Tag: provider offers both a no-cost or trial path and a paid path.
newtab-sports-widget-watch-stream-free-paid = 自由的和薪资

# Tag: user must pay to watch (subscription, TV provider, premium plan, or add-on).
newtab-sports-widget-watch-stream-paid = 薪资

# Note: provider only streams some matches, not the full tournament.
newtab-sports-widget-watch-stream-select-games-only = 选择鲸鱼群仅

# Heading for the list of streaming services available in the user’s country/region.
newtab-sports-widget-watch-available-region = 可利用的在你的区

# Heading for the list of streaming services available outside the user’s country/region.
newtab-sports-widget-watch-available-other-regions = 其他的区

# Button that opens the provider’s stream page in a new tab.
newtab-sports-widget-watch-play =
    .aria-label = 打开流
    .title = 打开流

##

# The "LIVE" string is meant to be uppercase in English, but other languages and locales may vary in how they handle this.
newtab-sports-widget-live = LIVE
newtab-custom-widget-live-refresh =
    .title = 刷新 skin-conductance orienting response 皮肤传导性定向反应
    .aria-label = 刷新 skin-conductance orienting response 皮肤传导性定向反应
# Milestone dates (e.g. group stage, semifinals, etc.). Refers to calendar dates.
newtab-sports-widget-key-dates = 键磁盘分配表
newtab-sports-widget-upcoming = 即将来临的
# Used for a match currently ongoing
newtab-sports-widget-now = 现在
newtab-sports-widget-results = 结果
newtab-sports-widget-round-32 = 圆的 32
newtab-sports-widget-round-16 = 圆的 16
newtab-sports-widget-quarter-finals = 四分之一-期末考试
newtab-sports-widget-semi-finals = 半-期末考试
newtab-sports-widget-bronze-finals = 青铜期末考试
# Final is the final match for 1st place.
newtab-sports-widget-final = 期末考试

## Labels for the 12 World Cup group-stage groups (Group A through Group L).
## Each team is assigned to one of these groups during the World Cup tournament group stage.

newtab-sports-widget-group-stage = 创建组阶段
newtab-sports-widget-group-a = 创建组一个
newtab-sports-widget-group-b = 创建组基地址
newtab-sports-widget-group-c = 创建组调用
newtab-sports-widget-group-d = 创建组数据
newtab-sports-widget-group-e = 创建组元件
newtab-sports-widget-group-f = 创建组故障
newtab-sports-widget-group-g = 创建组千兆
newtab-sports-widget-group-h = 创建组硬件
newtab-sports-widget-group-i = 创建组电流
newtab-sports-widget-group-j = 创建组字母j
newtab-sports-widget-group-k = 创建组键
newtab-sports-widget-group-l = 创建组电感

##

# Variables:
#   $start (Date) - Start date of a tournament stage
#   $end (Date) - End date of a tournament stage
newtab-sports-widget-key-date-range = { DATETIME($start, month: "short", day: "numeric") } – { DATETIME($end, month: "short", day: "numeric") }

# Variables:
#   $date (Date) - Date of a single tournament event
newtab-sports-widget-key-date = { DATETIME($date, month: "short", day: "numeric") }

newtab-sports-widget-delayed = 定时的
newtab-sports-widget-postponed = & vi. 延期
newtab-sports-widget-suspended = 悬浮的
newtab-sports-widget-cancelled = 被取消的

newtab-sports-widget-information = 信息关于那比较
newtab-sports-widget-no-live-data = 活的比较资料 (=is not)不是校正右现在
newtab-sports-widget-view-results-link = 查看结果

newtab-sports-widget-third-place = 第三地方
# Runner-up is the team in 2nd place.
newtab-sports-widget-runner-up = 跑步者-向上的
newtab-sports-widget-champions = 冠军
newtab-sports-widget-world-cup-champions = 2026 世界杯子冠军

# Variables:
#   $date (Date) - The match start time
newtab-sports-widget-match-time = { DATETIME($date, hour: "2-digit", minute: "2-digit") }
newtab-sports-widget-match-full-time = 完整时间
newtab-sports-widget-match-halftime = 中场休息
newtab-sports-widget-match-extra-time = 额外的事物时间
newtab-sports-widget-match-penalties = 处罚
# Separator shown between two teams in a placeholder match row when no upcoming
# match details are available yet.
newtab-sports-widget-match-vs = 对
# Note shown in the Upcoming tab when no match details are available yet.
newtab-sports-widget-no-upcoming-matches = 停留调谐的为了即将来临的比较详细数据

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
    .aria-label = { $homeTeam }, { $homeScore } 对... { $awayTeam }, { $awayScore }

# A finished match row that went to a penalty shootout.
# Parenthesized values are the shootout score.
# Variables:
#   $homeScore (number) - The home team's regular-time score
#   $awayScore (number) - The away team's regular-time score
#   $homePenalty (number) - The home team's penalty shootout score
#   $awayPenalty (number) - The away team's penalty shootout score
newtab-sports-widget-match-aria-label-results-penalties =
    .aria-label = { $homeTeam }, { $homeScore } ({ $homePenalty }) 对... { $awayTeam }, { $awayScore } ({ $awayPenalty })

# A match that is currently in progress.
# Variables:
#   $homeScore (number) - The home team's current score
#   $awayScore (number) - The away team's current score
newtab-sports-widget-match-aria-label-now =
    .aria-label = 活的: { $homeTeam }, { $homeScore } 对... { $awayTeam }, { $awayScore }

# An upcoming scheduled match row. Announces kickoff time and date.
# Variables:
#   $date (Date) - The scheduled kickoff date/time
newtab-sports-widget-match-aria-label-upcoming =
    .aria-label = { $homeTeam } 对. { $awayTeam }, { DATETIME($date, hour: "numeric", minute: "numeric") }, { DATETIME($date, day: "numeric", month: "long") }

# An upcoming match row whose status is "delayed".
newtab-sports-widget-match-aria-label-upcoming-delayed =
    .aria-label = { $homeTeam } 对. { $awayTeam }, 定时的

# An upcoming match row whose status is "postponed".
newtab-sports-widget-match-aria-label-upcoming-postponed =
    .aria-label = { $homeTeam } 对. { $awayTeam }, & vi. 延期

# An upcoming match row whose status is "suspended".
newtab-sports-widget-match-aria-label-upcoming-suspended =
    .aria-label = { $homeTeam } 对. { $awayTeam }, 悬浮的

# An upcoming match row whose status is "cancelled".
newtab-sports-widget-match-aria-label-upcoming-cancelled =
    .aria-label = { $homeTeam } 对. { $awayTeam }, 被取消的

## Sports widget — team names (FIFA country codes)
## Only includes names not adequately covered by standard country-code
## internationalization tooling.

newtab-sports-widget-team-name-label-bih =
    .label = 波斯尼亚和黑塞哥维那
newtab-sports-widget-team-name-label-civ =
    .label = 象牙海岸
newtab-sports-widget-team-name-label-cod =
    .label = DR 刚果
newtab-sports-widget-team-name-label-eng =
    .label = 英格兰
newtab-sports-widget-team-name-label-sco =
    .label = 苏格兰

# Placeholder used in a match row's aria-label for an undecided team (shown visually as "--").
newtab-sports-widget-team-tbd = 到是坚决的

## Sports widget OMC messages
## Shown as on-screen messages promoting the Sports widget and World Cup wallpapers.

newtab-sports-widget-message-wallpapers-title = 踢关闭那世界杯子与新的壁纸
newtab-sports-widget-message-wallpapers-body = 带来一些比较-day 精力到你的浏览器为了那比赛.
newtab-sports-widget-message-wallpapers-cta = 选取壁纸
newtab-sports-widget-message-add-widgets-cta =
    .label = 添加装饰物
newtab-sports-widget-message-day-in-play-title = 保持你的天在播放与 { -brand-product-name } 装饰物
newtab-sports-widget-message-day-in-play-body = 跟随那世界杯子, 停留在任务, 跟踪时间包围那球, 和更多.
newtab-sports-widget-message-explore-widgets-cta =
    .label = 探险装饰物

## Strings introduced by the Nova redesign of the Timer widget

# Variables:
#   $minutes (number) - The currently selected timer duration in minutes
newtab-widget-timer-start-aria =
    .aria-label =
        { $minutes ->
            *[other] 启动 { $minutes }-minute 计时器
        }
newtab-widget-timer-pause-aria =
    .aria-label = 暂停计时器
# Variables:
#   $minutes (number) - The currently selected timer duration in minutes
newtab-widget-timer-spinbutton-name =
    .aria-label =
        { $minutes ->
            [one] { $minutes } 分
            *[other] { $minutes } 分钟
        }
newtab-widget-timer-decrease-min =
    .title = 减少 1 分
newtab-widget-timer-increase-min =
    .title = 增加 1 分
newtab-widget-timer-mode-group =
    .aria-label = 计时器模式
# Small label shown beneath the live time while the focus timer is running or paused.
newtab-widget-timer-running-focus = 焦点
# Small label shown beneath the live time while the break timer is running or paused.
newtab-widget-timer-running-break = 中断
# Context-menu item to hide the Timer widget. Replaces the shared "Hide widget"
# copy with a widget-specific string per the Nova design.
newtab-widget-timer-menu-hide = 隐藏计时器
# Heading shown inside the Timer widget after a focus session ends.
newtab-widget-timer-celebration-heading-focus = 美好的工作
# Heading shown inside the Timer widget after a break session ends.
newtab-widget-timer-celebration-heading-break = 你的中断是结束
# Message shown inside the Timer widget after a focus session ends.
newtab-widget-timer-celebration-message-focus = 需要一个中断?
# Message shown inside the Timer widget after a break session ends.
newtab-widget-timer-celebration-message-break = 预备好的状态到焦点?

# Strings for daily briefing card

# The title displays above a set of top news headlines.
newtab-daily-briefing-card-title = TOP协议大字标题( headline的名词复数 )
newtab-daily-briefing-card-menu-dismiss = 解散

# Variables:
#   $minutes (number) - Time since the feed has been refreshed
newtab-daily-briefing-card-timestamp = 更新的 { $minutes }尾数以前

newtab-widget-message-title = 停留聚焦的与列表和一个构造-in 计时器
# to-dos stands for "things to do".
newtab-widget-message-copy = 从新长出的肉提醒的人到每日的到-磁盘操作系统, 焦点会话到伸展中断—停留在任务和在时间.
# One spot refers to a dedicated section on new tab to manage and use widgets
newtab-widget-message-focus-forecasts-title = 一(个) 污点为了焦点, 趋势预测, 和更多
newtab-widget-message-focus-forecasts-body = 保持你的天流动的与 { -brand-product-name } 装饰物. 复选那趋势预测, 停留在任务, 或跟踪时间越过那球.

# Strings for the default promo card

newtab-promo-card-title = 支持 { -brand-product-name }
newtab-promo-card-body = 我们的保证人支持我们的任务到建立一个较好的网
newtab-promo-card-cta = 学习更多

# "Make Firefox yours" refers to about:newtab. The call to action here ("Try it now")
# is to customize the new tab page with a background image or color from
# the built-in wallpaper collection or uploading your own image.
newtab-promo-card-title-addons = 使 { -brand-product-name } 你的
newtab-promo-card-body-addons = 拾取一个壁纸从我们的收集, 或创建你的自己的.
newtab-promo-card-cta-addons = 尝试它现在
newtab-promo-card-dismiss-button =
    .title = 解散
    .aria-label = 解散

## Strings for activation window message variants. In certain experiment configurations,
## the strings from these variants may be displayed in a message below the search input
## for the first 48 hours of a new profile's lifetime. Some messages include buttons with
## labels, but not all.

newtab-activation-window-message-dismiss-button =
    .title = 解散
    .aria-label = 解散

# "This space" refers to about:newtab. The call to action here ("make it your own")
# is to customize newtab with a background image or colour, or by tweaking the
# existing widgetry that appears on it.
newtab-activation-window-message-customization-focus-header = 使这空白你的自己的
newtab-activation-window-message-customization-focus-message = 选取一个开始壁纸, 添加快捷方式到你的喜欢的事物坐, 和停留向上的-to-date 在故事那兴趣你.
newtab-activation-window-message-customization-focus-primary-button =
    .label = 启动定制

# "This space" refers to about:newtab. The sentiment of "plays by your rules" is
# meant to evoke the idea that newtab is malleable and customizable. The call to
# action is to customize newtab with a background image or colour, or by tweaking
# the existing widgetry that appears on it.
newtab-activation-window-message-values-focus-header = 这空白播放由你的右上外侧
newtab-activation-window-message-values-focus-message = { -brand-product-name } 地方交易系统（Local Exchange Trading System）你浏览那路你喜欢, 与一个更多私人的路到启动你的天联机. 使 { -brand-product-name } 你的自己的.

## Strings for the Clock widget

# Context menu item: toggle the clock card off.
newtab-clock-widget-menu-hide = 隐藏时钟
newtab-clock-widget-menu-learn-more = 学习更多
newtab-clock-widget-menu-edit = 编辑时钟
newtab-clock-widget-menu-switch-to-12h = 开关到 12-hour 格式化
newtab-clock-widget-menu-switch-to-24h = 开关到 24-hour 格式化
newtab-clock-widget-label-your-clocks = 你的时钟
newtab-clock-widget-search-location-input =
    .label = 位置
    .placeholder = 搜索为了一个城市
    .aria-label = 搜索为了一个城市
# "Nickname (optional)" refers to a custom, user-defined label for a saved location
# (e.g., "Home", "Office", or "School") to make it easier to recognize.
# Not to be translated as a legal name, username, or alias used for identity verification.
newtab-clock-widget-input-nickname =
    .label = 绰号 (可选择的)
    .placeholder = 添加一个绰号
    .aria-label = 绰号 (可选择的)
# "Add new clock" is an icon-only button in the widget toolbar — the
# attributes are consumed as tooltip/screen-reader label only. The button
# never renders visible text.
newtab-clock-widget-button-add =
    .title = 添加新的时钟
    .aria-label = 添加新的时钟
newtab-clock-widget-button-add-clock = 添加
newtab-clock-widget-button-cancel = 取消
newtab-clock-widget-button-back =
    .title = 后面的
    .aria-label = 后面的
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
    .aria-label = { $city }, 绰号: { $nickname }
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
newtab-clock-widget-search-no-results = 无比较
# "Open menu for clock" is an icon-only button in the widget toolbar — the
# attributes are consumed as tooltip/screen-reader label only. The button
# never renders visible text.
newtab-clock-widget-menu-button =
    .title = 打开菜单为了时钟
    .aria-label = 打开菜单为了时钟
# $nickname (String) - The user-defined nickname for a saved clock location (e.g., "Home", "Office").
newtab-clock-widget-label-nickname-with-value = 绰号: { $nickname }

##

newtab-card-dismiss-button =
    .title = 解散
    .aria-label = 解散

## Strings for "Homepage" and "Firefox Home" sections of about:settings#home.
## Homepage panel

home-homepage-title =
    .label = 主页

home-homepage-new-windows =
    .label = 新的窗口

home-homepage-new-tabs =
    .label = 新的标签页

# This option leads to the "Custom Homepage" subpage
home-homepage-custom-homepage-button =
    .label = 选取一个特效药位置

## Custom URLs subpage

# Subheader on the Custom Homepage subpage. Followed by a form to enter URLs and a list of URLs already saved, if any.
home-custom-homepage-card-header =
    .label = 网站（全球资讯网的主机站）地址(电子能谱)

home-custom-homepage-address =
    .placeholder = Enter 地址
home-custom-homepage-address-button =
    .label = 添加地址

# Shown when no custom websites/URLs to use as a homepage have been added yet
home-custom-homepage-no-results =
    .label = 无网站（全球资讯网的主机站）额外的还.

home-custom-homepage-delete-address-button =
    .aria-label = Delete 地址
    .title = Delete 地址

# Further options to use when setting the home page. Two action buttons are placed in line with this prompt
# to replace the current home page with a currently open page or bookmark.
home-custom-homepage-replace-with-prompt =
    .label = 代替与

# Button that appears in-line after text "Replace with" (home-custom-homepage-replace-with-prompt)
home-custom-homepage-current-pages-button =
    .label = 当前的打开页

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
    .description = 例外的内容 (curate 的过去分词) n. 助理牧师由那 { -brand-product-name } 家庭

home-prefs-widgets-header =
    .label = 装饰物

# Lists is a widget on New Tab, similar to a to-do widget
home-prefs-lists-header =
    .label = 列表

# Timer is a widget on New Tab, similar to the Pomodoro timer.
home-prefs-timer-header =
    .label = 计时器

# Sports is a widget on New Tab showing sports scores and schedules.
home-prefs-sports-widget-header =
    .label = 运动

# Clock is a widget on New Tab that displays time zones around the world.
home-prefs-clocks-header =
    .label = 时钟

home-prefs-mission-message2 =
    .message = 我们的保证人支持我们的任务到建立一个较好的网.

home-prefs-manage-topics-link2 =
    .label = 管理主题

home-prefs-choose-wallpaper-link2 =
    .label = 选取一个壁纸

home-prefs-firefox-logo-header =
    .label = { -brand-short-name } 徽标

# Informational message bar that appears in the Firefox Home section when the options are disabled.
# The user must select Firefox Home as their homepage for either new tabs or new windows to enable
# the features in settings.
home-prefs-firefox-home-disabled-notice =
    .message = 到使用这些特性, 日落新的标签页或新的窗口到 { -firefox-home-brand-name }.

# Variables:
#   $num (number) - Number of rows displayed
home-prefs-sections-rows-option-srd =
    .label =
        { $num ->
            [one] { $num } 行
           *[other] { $num } 返回引用中的行数
        }

# Dropdown option shown when an extension replaces the contents of new windows or tabs.
# Variables:
#   $extension (string) - Name of the extension
home-prefs-homepage-extension-option =
    .label = 扩展名 ({ $extension })

home-restore-defaults-srd =
    .label = 回复默认
    .accesskey = R

home-mode-choice-default-fx-srd =
    .label = { -firefox-home-brand-name } (默认)

home-mode-choice-custom-srd =
    .label = 定制资源定位符（Uniform Resource Locators）…

home-mode-choice-blank-srd =
    .label = 空白页

home-prefs-shortcuts-header-srd =
    .label = 快捷方式

home-prefs-shortcuts-select =
    .aria-label = 快捷方式

home-prefs-shortcuts-by-option-sponsored-srd =
    .label = 赞助( sponsor的过去式和过去分词) 快捷方式

home-prefs-recommended-by-option-sponsored-stories-srd =
    .label = 赞助( sponsor的过去式和过去分词) 故事

home-prefs-highlights-option-visited-pages-srd =
    .label = 拜访页

home-prefs-highlights-options-bookmarks-srd =
    .label = 书签

home-prefs-highlights-option-most-recent-download-srd =
    .label = 最多最近的下载

home-prefs-recent-activity-header-srd =
    .label = 最近的活动

home-prefs-recent-activity-select =
    .aria-label = 最近的活动

home-prefs-weather-header-srd =
    .label = 天气

home-prefs-support-firefox-header-srd =
    .label = 支持 { -brand-product-name }

home-prefs-mission-message-learn-more-link-srd = 发现外面的如何
