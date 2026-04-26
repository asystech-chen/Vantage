#!/bin/bash
# Vantage 安全增强合并验证脚本
# 日期: 2026-04-26

set -e

echo "🔍 Vantage 安全增强合并验证"
echo "================================"
echo ""

# 检查新增的 patches
echo "✓ 检查新增 patches..."
if [ -f "patches/limit-access.patch" ]; then
    echo "  ✓ limit-access.patch 存在 ($(stat -c%s patches/limit-access.patch) bytes)"
else
    echo "  ✗ limit-access.patch 缺失"
    exit 1
fi

if [ -f "patches/rust-build.patch" ]; then
    echo "  ✓ rust-build.patch 存在 ($(stat -c%s patches/rust-build.patch) bytes)"
else
    echo "  ✗ rust-build.patch 缺失"
    exit 1
fi

echo ""

# 检查 patches.txt
echo "✓ 检查 patches.txt..."
if grep -q "patches/limit-access.patch" assets/patches.txt; then
    echo "  ✓ limit-access.patch 已添加到 patches.txt"
else
    echo "  ✗ limit-access.patch 未添加到 patches.txt"
    exit 1
fi

if grep -q "patches/rust-build.patch" assets/patches.txt; then
    echo "  ✓ rust-build.patch 已添加到 patches.txt"
else
    echo "  ✗ rust-build.patch 未添加到 patches.txt"
    exit 1
fi

echo ""

# 检查 settings/librewolf.cfg
echo "✓ 检查 settings/librewolf.cfg 配置..."

check_config() {
    local pref=$1
    local desc=$2
    if grep -q "$pref" settings/librewolf.cfg; then
        echo "  ✓ $desc"
    else
        echo "  ✗ $desc 缺失"
        exit 1
    fi
}

check_config "network.http.prompt-temp-redirect" "HTTP 重定向提示"
check_config "dom.security.https_only_mode.upgrade_local" "本地 HTTPS 升级"
check_config "network.trr.useGET" "DoH POST 方法"
check_config "security.OCSP.enabled" "OCSP 禁用"
check_config "security.enterprise_roots.enabled" "企业根证书禁用"
check_config "network.http.http3.enable_0rtt" "HTTP3 0-RTT 禁用"
check_config "security.ssl3.ecdhe_ecdsa_aes_128_sha" "弱加密套件禁用"

echo ""
echo "================================"
echo "✅ 所有验证通过！"
echo ""
echo "📝 下一步:"
echo "  1. 运行 'make dir' 测试 patches 应用"
echo "  2. 运行 'make build' 测试编译"
echo "  3. 查看 MERGE-150-SECURITY.md 了解详情"
echo ""
