# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


## XSLT and XPath specific errors.

xslt-parse-failure = 分析 XSLT 样式表单失败。
xpath-parse-failure = 分析 XPath 表达式失败。
xslt-execution-failure = XSLT 转换失败。
xpath-unknown-function = XSLT/XPath 函数无效。
xslt-bad-recursion = XSLT 样式表单 （可能）存在递归。
xslt-bad-value = 属性值在 XSLT 1.0 中非法。
xslt-nodeset-expected = XPath 表达式预期返回一个 NodeSet。
xslt-aborted = XSLT 转换因 <xsl:message> 终止。
xslt-network-error = 加载 XSLT 样式表单时发生网络错误：
xslt-wrong-mime-type = XSLT 样式表未指定 XML mimetype：
xslt-load-recursion = 某个 XSLT 样式表单直接或间接导入或者包含了自身。
xpath-bad-argument-count = 某个XPath 函数调用参数个数错误。
xpath-bad-extension-function = 调用了一个未知的XPath扩展函数。
xpath-paren-expected = XPath 解析失败：缺少 ')' ：
xpath-invalid-axis = XPath 解析失败：非法轴：
xpath-no-node-type-test = XPath 解析失败：缺少 名称 或者 test 节点类型：
xpath-bracket-expected = XPath 解析失败：缺少']'：
xpath-invalid-var-name = XPath 解析失败：非法变量名：
xpath-unexpected-end = XPath 解析失败：不正确的表达式终止：
xpath-operator-expected = XPath 解析失败：缺少操作符：
xpath-unclosed-literal = XPath 解析失败：语义未结束：
xpath-bad-colon = XPath 解析失败：多余的':'：
xpath-bad-bang = XPath 解析失败：多余的'!'，‘非’应为 not()：
xpath-illegal-char = XPath 解析失败：非法字符：
xpath-binary-expected = XPath 解析失败：缺少二进制操作符：
xslt-load-blocked-error = 因安全因素，中止了一个 XSLT 样式表单的加载。
xpath-invalid-expression-evaluated = 执行了无效表达式
xpath-unbalanced-curly-brace = 大括号未成对。
xslt-bad-node-name = 使用无效的 QName 创建元素。
xslt-var-already-set = 变量绑定映射了同一模板内的变量绑定
xslt-call-to-key-not-allowed = 不允许调用 key 函数。
# Other failures, not found in the previous ones.
# Variables:
#   $errorCode (String) - The error code (formatted in hexadecimal)
xslt-unknown-error = 发生未知错误 ({ $errorCode })

## Messages for the XML error page.
##
## Variables:
##   $error (string) - the specific XSLT or XPath error (a translated string
##   from the previous section)

xslt-loading-error = 加载样式表单出错： { $error }
xslt-transform-error = XSLT 转换出错： { $error }
