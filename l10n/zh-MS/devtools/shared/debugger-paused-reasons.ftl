# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

### These strings are used inside the Debugger which is available from the Web
### Developer sub-menu -> 'Debugger', as well as in the "Paused Debugger
### Overlay" that is displayed in the content page when it pauses.

### The correct localization of this file might be to keep it in
### English, or another language commonly spoken among web developers.
### You want to make that choice consistent across the developer tools.
### A good criteria is the language in which you'd find the best
### documentation on web development on the web.

# The text that is displayed in a info block explaining how the debugger is
# currently paused due to a `debugger` statement in the code
whypaused-debugger-statement = 已在调试器语句上暂停

# The text that is displayed in a info block explaining how the debugger is
# currently paused on a breakpoint
whypaused-breakpoint = 已在断点上暂停

# The text that is displayed in a info block explaining how the debugger is
# currently paused on an event breakpoint.
whypaused-event-breakpoint = 已在事件断点上暂停

# The text that is displayed in a info block explaining how the debugger is
# currently paused on an exception
whypaused-exception = 已在异常上暂停

# The text that is displayed in a info block explaining how the debugger is
# currently paused on a DOM mutation breakpoint
whypaused-mutation-breakpoint = 已暂停于DOM变更

# The text that is displayed to describe an added node which triggers a subtree
# modification
whypaused-mutation-breakpoint-added = 已添加：

# The text that is displayed to describe a removed node which triggers a subtree
# modification
whypaused-mutation-breakpoint-removed = 已移除：

# The text that is displayed in a info block explaining how the debugger is
# currently paused at a JS execution
whypaused-interrupted = 已暂停于执行处

# The text that is displayed in a info block explaining how the debugger is
# currently paused while stepping in or out of the stack
whypaused-resume-limit = 正在单步执行时暂停

# The text that is displayed in a info block explaining how the debugger is
# currently paused on a dom event
whypaused-pause-on-dom-events = 已暂停于事件监听器

# The text that is displayed in an info block when evaluating a conditional
# breakpoint throws an error
whypaused-breakpoint-condition-thrown = 条件断点发生错误

# The text that is displayed in a info block explaining how the debugger is
# currently paused on an xml http request
whypaused-xhr = 已暂停于XMLHttpRequest

# The text that is displayed in a info block explaining how the debugger is
# currently paused on a promise rejection
whypaused-promise-rejection = 已暂停于承诺拒绝

# The text that is displayed in a info block explaining how the debugger is
# currently paused at a watchpoint on an object property
whypaused-get-watchpoint = 已暂停于属性获取

# The text that is displayed in an info block explaining how the debugger is
# currently paused at a watchpoint on an object property
whypaused-set-watchpoint = 已暂停于属性设置

# The text that is displayed in a info block explaining how the debugger is
# currently paused on an assert
whypaused-assert = 已暂停于断言

# The text that is displayed in a info block explaining how the debugger is
# currently paused on a debugger statement
whypaused-debug-command = 已暂停于已调试的函数

# The text that is displayed in a info block saying that the debugger is currently paused
# without other precision. This is also used in the overlay we show in the page when
# the page is paused.
whypaused-other = 调试器已暂停