#!/bin/bash
# Vantage Pref-Pane 修复验证脚本
# 日期: 2026-04-26

set -e

echo "🔍 Vantage Pref-Pane 修复验证"
echo "================================"
echo ""

# 检查修复的代码
echo "✓ 检查 librewolf.js 修复..."

check_pattern() {
    local pattern=$1
    local desc=$2
    if grep -q "$pattern" patches/pref-pane/librewolf.js; then
        echo "  ✓ $desc"
    else
        echo "  ✗ $desc 未找到"
        exit 1
    fi
}

# 检查 IPv6 修复
check_pattern "get: (value) => value.value = !value," "IPv6 get 函数已修复"
check_pattern "set: (value) => value.value = !value," "IPv6 set 函数已修复"

# 检查 WebGL 修复
if grep -A 3 "librewolfWebGL" patches/pref-pane/librewolf.js | grep -q "value.value = !value"; then
    echo "  ✓ WebGL get/set 函数已修复"
else
    echo "  ✗ WebGL 函数未正确修复"
    exit 1
fi

# 检查 Cross-Origin 修复
if grep -A 5 "librewolfCrossOrigin" patches/pref-pane/librewolf.js | grep -q "if (value == 2)"; then
    echo "  ✓ Cross-Origin get 函数已修复"
else
    echo "  ✗ Cross-Origin 函数未正确修复"
    exit 1
fi

echo ""
echo "================================"
echo "✅ 所有修复验证通过！"
echo ""
echo "📝 修复内容:"
echo "  - IPv6 设置: get/set 函数使用 value.value"
echo "  - WebGL 设置: get/set 函数使用 value.value"
echo "  - Cross-Origin: get 函数正确判断 value == 2"
echo ""
echo "📖 详细信息请查看: PREF-PANE-FIX.md"
echo ""
