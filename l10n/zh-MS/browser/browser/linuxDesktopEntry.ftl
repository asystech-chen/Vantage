# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# These messages are used by the Firefox ".desktop" file on Linux.
# https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html

# The entry name is the label on the desktop icon, among other things.
desktop-entry-name = { -brand-shortcut-name }
# The comment usually appears as a tooltip when hovering over application menu entry.
desktop-entry-comment-1 = 快速且注重隐私的浏览器
desktop-entry-generic-name = 网络浏览器
# Combine Name and GenericName. This string is specific to GNOME.
desktop-entry-x-gnome-full-name-1 = { -brand-full-name }
# Keywords are search terms used to find this application.
# The string is a list of keywords separated by semicolons:
# - Do NOT replace semicolons with other punctuation signs.
# - The list MUST end with a semicolon.
desktop-entry-keywords = 互联网;万维网;浏览器;网页;探索;

## Actions are visible in a context menu after right clicking the
## taskbar icon, possibly other places depending on the environment.

desktop-action-new-window-name = 启动新窗口
desktop-action-new-private-window-name = 启动新隐私窗口
desktop-action-open-profile-manager = 启动配置文件管理器
