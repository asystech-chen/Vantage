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
  .label = 最佳匹配

# A message that replaces a result when the user dismisses a single suggestion.
firefox-suggest-dismissal-acknowledgment-one = 感谢您的反馈。您将不再看到此建议。

# A message that replaces a result when the user dismisses a single MDN
# suggestion.
firefox-suggest-dismissal-acknowledgment-one-mdn = 感谢您的反馈。您将不再看到此 { -mdn-brand-short-name } 建议。

# A message that replaces a result when the user dismisses all MDN suggestions.
firefox-suggest-dismissal-acknowledgment-all-mdn = 感谢您的反馈。您将不再看到 { -mdn-brand-short-name } 建议。

# A message that replaces a result when the user dismisses a single Yelp
# suggestion.
firefox-suggest-dismissal-acknowledgment-one-yelp = 感谢您的反馈。您将不再看到此 { -yelp-brand-name } 建议。

# A message that replaces a result when the user dismisses all Yelp suggestions.
firefox-suggest-dismissal-acknowledgment-all-yelp = 感谢您的反馈。您将不再看到 { -yelp-brand-name } 建议。

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
firefox-suggest-weather-title = { $city }、{ $region } 的天气

# This string displays the weather summary
# Variables:
#   $currentConditions (String) - The current weather conditions summary
#   $forecast (String) - The forecast weather conditions summary
firefox-suggest-weather-summary-text = { $currentConditions }；{ $forecast }

# This string displays the high and low temperatures
# Variables:
#   $high (number) - The number for the high temperature
#   $unit (String) - The unit for the temperature
#   $low (number) - The number for the low temperature
firefox-suggest-weather-high-low = 高：{ $high }°{ $unit } · 低：{ $low }°{ $unit }

## These strings are used as labels of menu items in the result menu.

firefox-suggest-command-dont-show-this =
  .label = 不显示此内容
firefox-suggest-command-dont-show-mdn =
  .label = 不显示 { -mdn-brand-short-name } 建议
firefox-suggest-command-not-interested =
  .label = 不感兴趣
firefox-suggest-command-dont-show-this-suggestion =
  .label = 不显示此建议
firefox-suggest-command-dont-show-any-suggestions =
  .label = 不显示任何建议
firefox-suggest-command-dont-show-addons =
  .label = 不显示 { -brand-product-name } 扩展建议

## These strings are used for Yelp suggestions in the urlbar.

# This string is shown as the title in Yelp suggestions when the suggestion
# subject is a general service instead of a business name.
# Variables:
#   $service (string) - The title of the service, e.g., "coffee shops".
firefox-suggest-yelp-service-title = 针对 { $service } 的顶级结果

## Used as title on the introduction pane. The text can be formatted to span
## multiple lines as needed (line breaks are significant).

firefox-suggest-onboarding-introduction-title-1 =
  确保您已获得我们最新的
  搜索体验
firefox-suggest-onboarding-introduction-title-2 =
  我们正在构建更好的搜索体验 —
  您可信任的搜索体验
firefox-suggest-onboarding-introduction-title-3 =
  我们正在构建更好的方式来查找
  您在网络上寻找的内容
firefox-suggest-onboarding-introduction-title-4 =
  更快的搜索体验正在进行中
firefox-suggest-onboarding-introduction-title-5 =
  Together, we can create the kind of search
  experience the Internet deserves
firefox-suggest-onboarding-introduction-title-6 =
  认识一下 { -firefox-suggest-brand-name }，下一代
##

firefox-suggest-onboarding-introduction-title-7 =
  发现网络之最佳，速度更快。

## Used as title on the main pane. The text can be formatted to span

firefox-suggest-onboarding-introduction-close-button =
  .title = 关闭

firefox-suggest-onboarding-introduction-next-button-1 = 了解运作方式
firefox-suggest-onboarding-introduction-next-button-2 = 了解更多详情
firefox-suggest-onboarding-introduction-next-button-3 = 展示操作方式

## multiple lines as needed (line breaks are significant).
##

firefox-suggest-onboarding-main-title-1 =
  我们正在构建更丰富的搜索体验
firefox-suggest-onboarding-main-title-2 =
  帮助我们指引通往
  互联网最佳内容的路径
firefox-suggest-onboarding-main-title-3 =
  更丰富且更智能的搜索体验
firefox-suggest-onboarding-main-title-4 =
  发现网络之最佳，速度更快
firefox-suggest-onboarding-main-title-5 =
  我们正在构建更好的搜索体验 —
  您可参与其中
firefox-suggest-onboarding-main-title-6 =
  是时候跳出搜索引擎的框框思考
firefox-suggest-onboarding-main-title-7 =
  我们正在构建更智能的搜索体验 —
  一种您可信任的体验
firefox-suggest-onboarding-main-title-8 =
  发现网络之最佳应当
  更为简单且更为安全。
firefox-suggest-onboarding-main-title-9 =
  发现网络之最佳，速度更快

## Local search mode indicator labels in the urlbar

firefox-suggest-onboarding-main-description-1 = 允许 { -vendor-short-name } 处理您的搜索查询，意味着您正在帮助我们创建更智能、更相关的搜索建议。并且，一如既往，我们将把您的隐私置于首要考量。
firefox-suggest-onboarding-main-description-2 = 当您允许 { -vendor-short-name } 处理您的搜索查询时，您正在帮助为所有人构建更好的 { -firefox-suggest-brand-name }。并且，一如既往，我们将把您的隐私置于首要考量。
firefox-suggest-onboarding-main-description-3 = 如果您的浏览器能帮助您精准定位您实际想要查找的内容，情况会如何？允许 { -vendor-short-name } 处理您的搜索查询，有助于我们创建更相关的搜索建议，同时仍然将您的隐私置于首要考量。
firefox-suggest-onboarding-main-description-4 = 您正试图在网络中前往您要去的地方并继续前行。当您允许 { -vendor-short-name } 处理您的搜索查询时，我们可以帮助您更快地到达目的地——同时将您的隐私置于首要考量。
firefox-suggest-onboarding-main-description-5 = 允许 { -vendor-short-name } 处理您的搜索查询，将帮助我们为所有人创建更相关的建议。并且，一如既往，我们将把您的隐私置于首要考量。
firefox-suggest-onboarding-main-description-6 = 允许 { -vendor-short-name } 处理您的搜索查询，将帮助我们创建更相关的搜索建议。我们正在构建 { -firefox-suggest-brand-name }，以帮助您在互联网中前往您要去的地方，同时将您的隐私铭记于心。
firefox-suggest-onboarding-main-description-7 = 允许 { -vendor-short-name } 处理您的搜索查询，有助于我们创建更相关的搜索建议。
firefox-suggest-onboarding-main-description-8 = 允许 { -vendor-short-name } 处理您的搜索查询，有助于我们提供更相关的搜索建议。我们不会使用此数据在网络中对您进行画像分析。
firefox-suggest-onboarding-main-description-9 =
  我们正在构建更好的搜索体验。当您允许 { -vendor-short-name } 处理您的搜索查询时，我们可以为您创建更相关的搜索建议。
  <a data-l10n-name="learn-more-link">了解更多</a>

firefox-suggest-onboarding-main-privacy-first = 不进行用户画像分析。隐私优先，始终如一。

firefox-suggest-onboarding-main-accept-option-label = 允许。 <a data-l10n-name="learn-more-link">了解更多</a>
firefox-suggest-onboarding-main-accept-option-label-2 = 启用

firefox-suggest-onboarding-main-accept-option-description-1 = 通过更相关的建议帮助改进 { -firefox-suggest-brand-name } 功能。您的搜索查询将被处理。
firefox-suggest-onboarding-main-accept-option-description-2 = 推荐给支持改进 { -firefox-suggest-brand-name } 功能的用户。您的搜索查询将被处理。
firefox-suggest-onboarding-main-accept-option-description-3 = 帮助改进 { -firefox-suggest-brand-name } 体验。您的搜索查询将被处理。

firefox-suggest-onboarding-main-reject-option-label = 不允许。
firefox-suggest-onboarding-main-reject-option-label-2 = 保持禁用

firefox-suggest-onboarding-main-reject-option-description-1 = 保持默认的 { -firefox-suggest-brand-name } 体验，并采用最严格的数据共享控制措施。
firefox-suggest-onboarding-main-reject-option-description-2 = 推荐给偏好最严格数据共享控制措施的用户。保持默认体验。
firefox-suggest-onboarding-main-reject-option-description-3 = 保留默认的 { -firefox-suggest-brand-name } 体验，并采用最严格的数据共享控制措施。

firefox-suggest-onboarding-main-submit-button = 保存偏好设置
firefox-suggest-onboarding-main-skip-link = 暂不处理

urlbar-firefox-suggest-contextual-opt-in-title-1 =
  发现网络之最佳，速度更快
urlbar-firefox-suggest-contextual-opt-in-description-3 =
  我们正在构建更好的搜索体验。当您与 { -vendor-short-name } 共享搜索查询数据时，我们可以从 { -brand-short-name } 及我们的合作伙伴处创建更相关的建议。
  <a data-l10n-name="learn-more-link">了解更多</a>
urlbar-firefox-suggest-contextual-opt-in-allow = 允许显示建议
urlbar-firefox-suggest-contextual-opt-in-dismiss = 暂不处理

## These strings are used for Yelp realtime suggestions in the urlbar.

urlbar-search-mode-bookmarks-en = 书签
urlbar-search-mode-tabs-en = 标签页
urlbar-search-mode-history-en = 历史记录
urlbar-search-mode-actions-en = 操作

## Yelp realtime suggestions shows shops, places information etc nearby.
# This string is shown as title when Yelp realtime suggestion are disabled.

# This string is shown as description when Yelp realtime suggestion are disabled.
urlbar-result-yelp-realtime-opt-in-title = 发现附近的好去处及更多内容

# This string is shown in the result menu.
urlbar-result-yelp-realtime-opt-in-description = 通过与 { -vendor-short-name } 共享搜索查询数据，获取附近地点和服务的建议——以及来自我们合作伙伴的股票、体育比分等更新。 <a data-l10n-name="learn-more-link">了解更多</a>

# A message that replaces a result when the user dismisses Yelp realtime
urlbar-result-menu-dont-show-yelp-realtime =
  .label = 不显示 { -yelp-brand-name } 建议

# suggestions.
urlbar-result-dismissal-acknowledgment-yelp-realtime = 感谢您的反馈。您将不再看到 { -yelp-brand-name } 建议。

# This string is shown as group label for Yelp realtime suggestions.
urlbar-result-yelp-realtime-group-label =
  .label = { -yelp-brand-name } · 赞助内容


# This string is shown as the business hours information in cases where the shop
# is opening.
# e.g. <span>Open</span> until 3pm.
# The <span> is needed to change the text color by the status (open/closed).
# Variables:
urlbar-result-yelp-realtime-business-hours-open =
    <span>营业中</span> 直到 { $timeUntil }
# closed.
# e.g. <span>Closed</span> until 3pm.
# The <span> is needed to change the text color by the status (open/closed).
# Variables:
#   $timeUntil (string) - The time that this state is kept.
urlbar-result-yelp-realtime-business-hours-closed =
    <span>已关闭</span>，直至 { $timeUntil }

# This string is shown as popularity by the rating and the review count.
# Variables:
#   $rating (float) - The rating of this.
#   $review_count (integer) - The review count of this.
urlbar-result-yelp-realtime-popularity = { $rating } ({ $review_count })

# This a11y label is read by screen readers when an item in the row is selected.
urlbar-result-aria-group-yelp-realtime =
  .aria-label = { -yelp-brand-name } 建议

## These strings are used for flight status suggestions in the urlbar.
## The flight status suggestions shows the flight time, origin and destination
## and the status like delayed, etc.

# This string is shown in the result menu.
urlbar-result-menu-dont-show-flight-status =
  .label = 不显示航班状态建议

# A message that replaces a result when the user dismisses flight status
# suggestions.
urlbar-result-dismissal-acknowledgment-flight-status = 感谢您的反馈。您将不再看到航班状态建议。

# This string is shown as the statis of 'On time'.
urlbar-result-flight-status-status-ontime = 准时

# This string is shown as the statis of 'In flight'.
urlbar-result-flight-status-status-inflight = 飞行中

# This string is shown as the statis of 'Arrived'.
urlbar-result-flight-status-status-arrived = 已抵达

# This string is shown as the statis of 'Cancelled'.
urlbar-result-flight-status-status-cancelled = 已取消

# This string is shown as the statis of 'Delayed'.
# This label needs to show the estimated departure time too.
# e.g. Delayed until 5:50pm
# Variables:
#   $departureEstimatedTime (string) - The estimated departure time.
urlbar-result-flight-status-status-delayed =
    延迟至 { $departureEstimatedTime }

# This string is shown as the time remaining in an in-progress flight.
# e.g. 30 min left
# Variables:
#   $timeLeft (string) - Localized duration string, e.g., "1 hr, 30 min"
urlbar-result-flight-status-time-left = 剩余 { $timeLeft }

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
urlbar-result-flight-status-flight-number-with-airline = { $flightNumber }，{ $airlineName }

# This a11y label is read by screen readers when an item in the row is selected.
urlbar-result-aria-group-flight-status =
  .aria-label = 航班状态建议

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
urlbar-result-sports-team-names = { $homeTeam } 对阵 { $awayTeam }

# This string is shown when the game is today, in the near future, or in the
# recent past.
# Variables:
#   $date (string) - Localized date string, e.g., "Today", "Oct 31"
#   $time (string) - Localized time
urlbar-result-sports-game-date-with-time = { $date } 于 { $time }

# This status is shown when the game is in progress.
urlbar-result-sports-status-live = 进行中

# This status is shown when the game is over.
urlbar-result-sports-status-final = 最终

# This string is shown in the result menu.
urlbar-result-menu-dont-show-sports =
  .label = 不显示体育建议

# A message that replaces a result when the user dismisses sports suggestions.
urlbar-result-dismissal-acknowledgment-sports = 感谢您的反馈。您将不再看到体育建议。

# This a11y label is read by screen readers when an item in the row is selected.
urlbar-result-aria-group-sports =
  .aria-label = 体育建议
