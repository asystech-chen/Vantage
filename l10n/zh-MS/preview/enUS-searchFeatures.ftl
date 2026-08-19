# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are related to the Firefox Suggest feature. Firefox Suggest
### shows recommended and sponsored third-party results in the address bar
### panel. It also shows headings/labels above different groups of results. For
### example, a "Firefox Suggest" label is shown above bookmarks and history
### results, and an "{ $engine } Suggestions" label may be shown above search
### suggestion results.

## These terms are defined in this file because the feature is en-US only.
## They should be moved to toolkit/branding/brandings.ftl if the feature is
## exposed for localization.

-mdn-brand-short-name = MDN

## These strings are used in the urlbar panel.

# A label shown above the Shortcuts aka Top Sites group in the urlbar results
# if there's another result before that group. This should be consistent with
# addressbar-locbar-shortcuts-option.
urlbar-group-shortcuts =
  .label = 快捷方式

# A label shown above the top pick group in the urlbar results.
urlbar-group-best-match =
  .label = TOP协议拾取

# A message that replaces a result when the user dismisses a single suggestion.
firefox-suggest-dismissal-acknowledgment-one = 谢意为了你的反馈. 你将不看见这提议再一次.

# A message that replaces a result when the user dismisses a single MDN
# suggestion.
firefox-suggest-dismissal-acknowledgment-one-mdn = 谢意为了你的反馈. 你将不看见这 { -mdn-brand-short-name } 提议再一次.

# A message that replaces a result when the user dismisses all MDN suggestions.
firefox-suggest-dismissal-acknowledgment-all-mdn = 谢意为了你的反馈. 你将不看见 { -mdn-brand-short-name } 提议再也不.

# A message that replaces a result when the user dismisses a single Yelp
# suggestion.
firefox-suggest-dismissal-acknowledgment-one-yelp = 谢意为了你的反馈. 你将不看见这 { -yelp-brand-name } 提议再一次.

# A message that replaces a result when the user dismisses all Yelp suggestions.
firefox-suggest-dismissal-acknowledgment-all-yelp = 谢意为了你的反馈. 你将不看见 { -yelp-brand-name } 提议再也不.

## These strings are used for urlbar weather suggestions in the "simpler" and
## "full" weather UIs.

# This string is displayed above the current temperature
firefox-suggest-weather-currently = 当前

# This string displays the current temperature value and unit
# Variables:
#   $value (number) - The temperature value
#   $unit (String) - The unit for the temperature
firefox-suggest-weather-temperature = { $value }°{ $unit }

# This string is the title of the weather summary used for the "full" and
# "simpler" UI treatments.
# Variables:
#   $city (String) - The name of the city the weather data is for
#   $region (String) - The name of the region (e.g., U.S. state)
firefox-suggest-weather-title = 天气为了 { $city }, { $region }

# This string displays the weather summary
# Variables:
#   $currentConditions (String) - The current weather conditions summary
#   $forecast (String) - The forecast weather conditions summary
firefox-suggest-weather-summary-text = { $currentConditions }; { $forecast }

# This string displays the high and low temperatures
# Variables:
#   $high (number) - The number for the high temperature
#   $unit (String) - The unit for the temperature
#   $low (number) - The number for the low temperature
firefox-suggest-weather-high-low = 高度: { $high }°{ $unit } ·低点: { $low }°{ $unit }

## These strings are used as labels of menu items in the result menu.

firefox-suggest-command-dont-show-this =
  .label = 不要显示这
firefox-suggest-command-dont-show-mdn =
  .label = 不要显示 { -mdn-brand-short-name } 提议
firefox-suggest-command-not-interested =
  .label = 不感兴趣的
firefox-suggest-command-dont-show-this-suggestion =
  .label = 不要显示这提议
firefox-suggest-command-dont-show-any-suggestions =
  .label = 不要显示任何的提议
firefox-suggest-command-dont-show-addons =
  .label = 不要显示 { -brand-product-name } 扩展名提议

## These strings are used for Yelp suggestions in the urlbar.

# This string is shown as the title in Yelp suggestions when the suggestion
# subject is a general service instead of a business name.
# Variables:
#   $service (string) - The title of the service, e.g., "coffee shops".
firefox-suggest-yelp-service-title = TOP协议结果为了 { $service }

## Used as title on the introduction pane. The text can be formatted to span
## multiple lines as needed (line breaks are significant).

firefox-suggest-onboarding-introduction-title-1 =
  确保你有获得我们的最近的
  搜索经历
firefox-suggest-onboarding-introduction-title-2 =
  我们是建筑物一个较好的搜索经历—
  一(个) 你能信任
firefox-suggest-onboarding-introduction-title-3 =
  我们是建筑物一个较好的方式到发现什么
  你是有…相貌的为了在那网
firefox-suggest-onboarding-introduction-title-4 =
  一个加快搜索经历是在那工作
firefox-suggest-onboarding-introduction-title-5 =
  一起, 我们能创建那种类的搜索
  经历那因特网该得到
firefox-suggest-onboarding-introduction-title-6 =
  会 { -firefox-suggest-brand-name }, 那近邻干扰
  进化在搜索
firefox-suggest-onboarding-introduction-title-7 =
  发现那最好的人的那网, 加快.

##

firefox-suggest-onboarding-introduction-close-button =
  .title = 关闭

firefox-suggest-onboarding-introduction-next-button-1 = 发现外面的如何
firefox-suggest-onboarding-introduction-next-button-2 = 发现外面的更多
firefox-suggest-onboarding-introduction-next-button-3 = 显示我如何

## Used as title on the main pane. The text can be formatted to span
## multiple lines as needed (line breaks are significant).

firefox-suggest-onboarding-main-title-1 =
  我们是建筑物一个更富有的搜索经历
firefox-suggest-onboarding-main-title-2 =
  帮忙我们辅助线那方式到那
  最好的的那因特网
firefox-suggest-onboarding-main-title-3 =
  一个更富有的, 聪明的搜索经历
firefox-suggest-onboarding-main-title-4 =
  发现那最好的人的那网, 加快
firefox-suggest-onboarding-main-title-5 =
  我们是建筑物一个较好的搜索经历—
  你能帮助
firefox-suggest-onboarding-main-title-6 =
  它是时间到想外面那搜索引擎
firefox-suggest-onboarding-main-title-7 =
  我们是建筑物一个聪明的搜索经历—
  一(个) 你能信任
firefox-suggest-onboarding-main-title-8 =
  发现那最好的人的那网应该是
  药草采集者和更多无虑的.
firefox-suggest-onboarding-main-title-9 =
  发现那最好的人的那网, 加快

##

firefox-suggest-onboarding-main-description-1 = 允许 { -vendor-short-name } 到进程你的搜索查询低劣的你是帮助我们创建聪明的, 更多有关联的搜索提议. 和, 作为总是, 我们将保持你的隐私 TOP协议的思想.
firefox-suggest-onboarding-main-description-2 = 何时你允许 { -vendor-short-name } 到进程你的搜索查询, 你是帮助建立一个较好的 { -firefox-suggest-brand-name } 为了系统中的一个组名. 和, 作为总是, 我们将保持你的隐私 TOP协议的思想.
firefox-suggest-onboarding-main-description-3 = 什么如果你的浏览器帮助你零在在什么你是事实上有…相貌的为了? 允许 { -vendor-short-name } 到进程你的搜索查询帮忙我们创建更多有关联的搜索提议那仍然保持你的隐私 TOP协议的思想.
firefox-suggest-onboarding-main-description-4 = 你是尝试到获得哪里你是去在那网和获得在与它. 何时你允许 { -vendor-short-name } 到进程你的搜索查询, 我们能帮助你获得那里加快—一会儿保管你的隐私 TOP协议的思想.
firefox-suggest-onboarding-main-description-5 = 允许 { -vendor-short-name } 到进程你的搜索查询将帮助我们创建更多有关联的提议为了系统中的一个组名. 和, 作为总是, 我们将保持你的隐私 TOP协议的思想.
firefox-suggest-onboarding-main-description-6 = 允许 { -vendor-short-name } 到进程你的搜索查询将帮助我们创建更多有关联的搜索提议. 我们是建筑物 { -firefox-suggest-brand-name } 到帮助你获得哪里你是去在那因特网一会儿保管你的隐私在思想.
firefox-suggest-onboarding-main-description-7 = 允许 { -vendor-short-name } 到进程你的搜索查询帮忙我们创建更多有关联的搜索提议.
firefox-suggest-onboarding-main-description-8 = 允许 { -vendor-short-name } 到进程你的搜索查询帮忙我们提供更多有关联的搜索提议. 我们不要使用这论据到提问档你在那网.
firefox-suggest-onboarding-main-description-9 =
  我们是建筑物一个较好的搜索经历. 何时你允许 { -vendor-short-name } 到进程你的搜索查询, 我们能创建更多有关联的搜索提议为了你.
  <a data-l10n-name="learn-more-link">学习更多</a>

firefox-suggest-onboarding-main-privacy-first = 无用户靠模机. 隐私-首先, 总是.

firefox-suggest-onboarding-main-accept-option-label = 允许. <a data-l10n-name="learn-more-link">学习更多</a>
firefox-suggest-onboarding-main-accept-option-label-2 = 启用

firefox-suggest-onboarding-main-accept-option-description-1 = 帮忙改良那 { -firefox-suggest-brand-name } 特性与更多有关联的提议. 你的搜索查询将是处理的.
firefox-suggest-onboarding-main-accept-option-description-2 = 被推荐的为了人谁支持有启发的那 { -firefox-suggest-brand-name } 特性. 你的搜索查询将是处理的.
firefox-suggest-onboarding-main-accept-option-description-3 = 帮忙改良那 { -firefox-suggest-brand-name } 经历. 你的搜索查询将是处理的.

firefox-suggest-onboarding-main-reject-option-label = 不要允许.
firefox-suggest-onboarding-main-reject-option-label-2 = 保持禁用

firefox-suggest-onboarding-main-reject-option-description-1 = 保持那默认 { -firefox-suggest-brand-name } 经历与那严格的论据-sharing 控制.
firefox-suggest-onboarding-main-reject-option-description-2 = 被推荐的为了人谁宁可那严格的论据-sharing 控制. 保持那默认经历.
firefox-suggest-onboarding-main-reject-option-description-3 = 许可那默认 { -firefox-suggest-brand-name } 经历与那严格的论据-sharing 控制.

firefox-suggest-onboarding-main-submit-button = 保存首选项
firefox-suggest-onboarding-main-skip-link = 不现在

urlbar-firefox-suggest-contextual-opt-in-title-1 =
  发现那最好的人的那网, 加快
urlbar-firefox-suggest-contextual-opt-in-description-3 =
  我们是建筑物一个较好的搜索经历. 何时你均分搜索查询论据与 { -vendor-short-name }, 我们能创建更多有关联的提议从 { -brand-short-name } 和我们的合伙人.
  <a data-l10n-name="learn-more-link">学习更多</a>
urlbar-firefox-suggest-contextual-opt-in-allow = 允许提议
urlbar-firefox-suggest-contextual-opt-in-dismiss = 不现在

## Local search mode indicator labels in the urlbar

urlbar-search-mode-bookmarks-en = 书签
urlbar-search-mode-tabs-en = 标签页
urlbar-search-mode-history-en = 历史记录
urlbar-search-mode-actions-en = 操作

## These strings are used for Yelp realtime suggestions in the urlbar.
## Yelp realtime suggestions shows shops, places information etc nearby.

# This string is shown as title when Yelp realtime suggestion are disabled.
urlbar-result-yelp-realtime-opt-in-title = 发现大的地方附近的和更多

# This string is shown as description when Yelp realtime suggestion are disabled.
urlbar-result-yelp-realtime-opt-in-description = 获得提议为了附近的地方和服务—正差更新在树干, 运动得分, 和更多从我们的合伙人由共享搜索查询论据与 { -vendor-short-name }. <a data-l10n-name="learn-more-link">学习更多</a>

# This string is shown in the result menu.
urlbar-result-menu-dont-show-yelp-realtime =
  .label = 不要显示 { -yelp-brand-name } 提议

# A message that replaces a result when the user dismisses Yelp realtime
# suggestions.
urlbar-result-dismissal-acknowledgment-yelp-realtime = 谢意为了你的反馈. 你将不看见 { -yelp-brand-name } 提议再也不.

# This string is shown as group label for Yelp realtime suggestions.
urlbar-result-yelp-realtime-group-label =
  .label = { -yelp-brand-name } ·赞助


# This string is shown as the business hours information in cases where the shop
# is opening.
# e.g. <span>Open</span> until 3pm.
# The <span> is needed to change the text color by the status (open/closed).
# Variables:
#   $timeUntil (string) - The time that this state is kept.
urlbar-result-yelp-realtime-business-hours-open =
    <span>打开</span> 直到 { $timeUntil }

# This string is shown as the business hours information in cases where the shop
# is closed.
# closed.
# e.g. <span>Closed</span> until 3pm.
# The <span> is needed to change the text color by the status (open/closed).
# Variables:
#   $timeUntil (string) - The time that this state is kept.
urlbar-result-yelp-realtime-business-hours-closed =
    <span>关闭</span> 直到 { $timeUntil }

# This string is shown as popularity by the rating and the review count.
# Variables:
#   $rating (float) - The rating of this.
#   $review_count (integer) - The review count of this.
urlbar-result-yelp-realtime-popularity = { $rating } ({ $review_count })

# This a11y label is read by screen readers when an item in the row is selected.
urlbar-result-aria-group-yelp-realtime =
  .aria-label = { -yelp-brand-name } 提议

## These strings are used for flight status suggestions in the urlbar.
## The flight status suggestions shows the flight time, origin and destination
## and the status like delayed, etc.

# This string is shown in the result menu.
urlbar-result-menu-dont-show-flight-status =
  .label = 不要显示飞行状态提议

# A message that replaces a result when the user dismisses flight status
# suggestions.
urlbar-result-dismissal-acknowledgment-flight-status = 谢意为了你的反馈. 你将不看见飞行状态提议再也不.

# This string is shown as the statis of 'On time'.
urlbar-result-flight-status-status-ontime = 在时间

# This string is shown as the statis of 'In flight'.
urlbar-result-flight-status-status-inflight = 在飞行

# This string is shown as the statis of 'Arrived'.
urlbar-result-flight-status-status-arrived = 抵达

# This string is shown as the statis of 'Cancelled'.
urlbar-result-flight-status-status-cancelled = 被取消的

# This string is shown as the statis of 'Delayed'.
# This label needs to show the estimated departure time too.
# e.g. Delayed until 5:50pm
# Variables:
#   $departureEstimatedTime (string) - The estimated departure time.
urlbar-result-flight-status-status-delayed =
    定时的直到 { $departureEstimatedTime }

# This string is shown as the time remaining in an in-progress flight.
# e.g. 30 min left
# Variables:
#   $timeLeft (string) - Localized duration string, e.g., "1 hr, 30 min"
urlbar-result-flight-status-time-left = { $timeLeft } 许可

# This string is shown as the airport.
# e.g. Los Angeles (LAX) to New York (JFK)
# Variables:
#   $city (string) - The city of the airport.
#   $code (string) - The code of the airport.
urlbar-result-flight-status-airport = { $city } ({ $code })

# This string is shown as the flight number with the airline name.
# e.g. AC 8170, (Air Canada)
# Variables:
#   $flightNumber (string) - The flight number.
#   $airlineName (string) - The airline name.
urlbar-result-flight-status-flight-number-with-airline = { $flightNumber }, { $airlineName }

# This a11y label is read by screen readers when an item in the row is selected.
urlbar-result-aria-group-flight-status =
  .aria-label = 飞行状态提议

## These strings are used for sports suggestions in the urlbar. Sports
## suggestions show team names, scores, game times, etc.

# This string is shown for a scheduled future game. In English, "Team 1 at Team
# 2" means the game is taking place at Team 2's home venue, and we say Team 1 is
# the "away" team and Team 2 is the "home" team. If your language doesn't have a
# similar phrase, use your equivalent of "vs." or even just "and".

# This string is shown for a scheduled future game. Please list $homeTeam before
# $awayTeam so that the ordering of teams in the string matches the ordering of
# the team icons in the suggestion UI. Without violating the team ordering,
# please use your language's equivalent of "vs". "and" is another option.
# Variables:
#   $homeTeam (string) - Name of the home team.
#   $awayTeam (string) - Name of the visiting team.
urlbar-result-sports-team-names = { $homeTeam } 对 { $awayTeam }

# This string is shown when the game is today, in the near future, or in the
# recent past.
# Variables:
#   $date (string) - Localized date string, e.g., "Today", "Oct 31"
#   $time (string) - Localized time
urlbar-result-sports-game-date-with-time = { $date } 在 { $time }

# This status is shown when the game is in progress.
urlbar-result-sports-status-live = 活的

# This status is shown when the game is over.
urlbar-result-sports-status-final = 期末考试

# This string is shown in the result menu.
urlbar-result-menu-dont-show-sports =
  .label = 不要显示运动提议

# A message that replaces a result when the user dismisses sports suggestions.
urlbar-result-dismissal-acknowledgment-sports = 谢意为了你的反馈. 你将不看见运动提议再也不.

# This a11y label is read by screen readers when an item in the row is selected.
urlbar-result-aria-group-sports =
  .aria-label = 运动提议
