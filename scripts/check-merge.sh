#!/bin/bash
#
# check-merge.sh - 合并 LibreWolf 上游后，检查是否遗漏 Vantage 定制
# 用法: ./scripts/check-merge.sh [旧版本tag]
#   ./scripts/check-merge.sh                 # 只做路径检查
#   ./scripts/check-merge.sh v150.0.2-1      # 还对比 patches.txt diff
#
# 零副作用：只读操作，不修改任何文件

set -euo pipefail
cd "$(dirname "$0")/.."

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BOLD='\033[1m'
NC='\033[0m'

errors=0
warnings=0

err()  { errors=$((errors+1)); echo -e "${RED}❌ $*${NC}"; ((errors++)); }
warn() { warnings=$((warnings+1)); echo -e "${YELLOW}⚠️  $*${NC}"; ((warnings++)); }
ok()   { echo -e "${GREEN}✅ $*${NC}"; }
info() { echo -e "   $*"; }

echo ""
echo -e "${BOLD}=== Vantage 合并检查 ====${NC}"
echo ""

# ==========================================
# 1. 路径类 librewofl 残留检查
# ==========================================
echo -e "${BOLD}[1/5] 路径类 librewolf 残留${NC}"
check_path_file() {
    local file="$1" desc="$2"
    local hits=$(grep -n 'librewolf\|LibreWolf' "$file" 2>/dev/null \
        | grep -v '^[0-9]*:#' \
        | grep -v 'librewolf\.net' \
        | grep -v 'librewolf\.cfg' \
        | grep -v 'librewolf/issues' \
        | grep -v 'librewolf-' \
        | grep -v 'librewolf\.' \
        || true)
    if [ -n "$hits" ]; then
        err "$desc 中有 librewolf 残留:"
        echo "$hits" | while read line; do info "  $line"; done
    else
        ok "$desc 已 rebrand"
    fi
}

check_path_file "patches/moz-configure.patch"     "moz-configure (vendor/profile)"
check_path_file "patches/mozilla_dirs.patch"       "mozilla_dirs (目录路径)"
check_path_file "patches/windows-theming-bug.patch" "windows-theming-bug (manifest)"

# ==========================================
# 2. patches.txt 完整性
# ==========================================
echo ""
echo -e "${BOLD}[2/5] patches.txt 完整性${NC}"

VANTAGE_PATCHES=(
    "patches/installer-zhcn.patch"
    "patches/installer-locale.patch"
    "patches/installer-publisher.patch"
    "patches/uninstaller-cleanup.patch"
    "patches/vantage-ai-sidebar.patch"
    "patches/vantage-privacy-dashboard.patch"
    "patches/dmg-fix-permissions.patch"
    "patches/hide-passwordmgr.patch"
    "patches/fix-7zsfx-branding.patch"
)

for p in "${VANTAGE_PATCHES[@]}"; do
    if grep -qF "$p" assets/patches.txt; then
        ok "$p"
    else
        err "$p —— 不在 patches.txt 中！"
    fi
done

# 如果提供了旧版本 tag，对比 patches.txt diff
if [ $# -ge 1 ]; then
    old_tag="$1"
    echo ""
    info "对比 $old_tag..HEAD 的 patches.txt 变更:"
    if git rev-parse "$old_tag" >/dev/null 2>&1; then
        removed=$(diff <(git show "$old_tag":assets/patches.txt | sort) <(sort assets/patches.txt) 2>/dev/null | grep "^<" | sed 's/^< //' || true)
        if [ -n "$removed" ]; then
            warn "以下 patch 在合并中被移除，请确认是否故意:"
            echo "$removed" | while read line; do
                if echo "$line" | grep -qE "vantage|installer|uninstaller|dmg-fix|zhcn|locale|publisher"; then
                    err "  $line  ← Vantage 独有！"
                else
                    info "  $line (可能是上游废弃)"
                fi
            done
        else
            ok "无 patch 被移除"
        fi
    else
        warn "无效的旧版本 tag: $old_tag"
    fi
fi

# ==========================================
# 3. settings/librewolf.cfg 关键内容
# ==========================================
echo ""
echo -e "${BOLD}[3/5] settings/librewolf.cfg 关键内容${NC}"

if grep -q "doUpdateCheck" settings/librewolf.cfg; then
    ok "更新检查代码存在"
else
    err "更新检查代码丢失！"
fi

if grep -q "importESModule.*NetUtil" settings/librewolf.cfg; then
    ok "NetUtil ESM 导入正确"
else
    err "NetUtil 导入丢失（可能是 JSM 旧版）"
fi

if grep -q '\.vantage' settings/librewolf.cfg; then
    ok "overrides 路径指向 .vantage"
else
    err "overrides 路径指向 librewolf！"
fi

# ==========================================
# 4. l10n 品牌文本
# ==========================================
echo ""
echo -e "${BOLD}[4/5] l10n 品牌文本${NC}"

if grep -q "Vantage" l10n/en-US/browser/browser/aboutDialog.inc.ftl 2>/dev/null; then
    ok "en-US aboutDialog 品牌文本正确"
else
    err "en-US aboutDialog 品牌文本丢失"
fi

if grep -q "Vantage" l10n/en-US/browser/browser/preferences/preferences.inc.ftl 2>/dev/null; then
    ok "en-US preferences 品牌文本正确"
else
    warn "en-US preferences 品牌文本可能丢失"
fi

# ==========================================
# 5. policies.json
# ==========================================
echo ""
echo -e "${BOLD}[5/5] settings/distribution/policies.json${NC}"

if grep -q "asystech.cn" settings/distribution/policies.json 2>/dev/null; then
    ok "uBlock xpi 指向 asystech.cn"
else
    warn "uBlock xpi 地址可能被上游覆盖"
fi

# ==========================================
# 总结
# ==========================================
echo ""
echo -e "${BOLD}[extra] CRLF / LF 行尾检查${NC}"

# 所有 patch 必须是 LF（librewolf-patches.py 会先 dos2unix 源文件）
if file patches/fix-7zsfx-branding.patch | grep -q "CRLF"; then
    err "fix-7zsfx-branding.patch 是 CRLF！应改为 LF（build 脚本会先 dos2unix 源文件）"
fi

# 所有 patch 不能有 CRLF
crlf_count=$(file patches/*.patch patches/ui-patches/*.patch patches/sed-patches/*.patch 2>/dev/null | grep -c "CRLF" || true)
if [ "$crlf_count" -eq 0 ]; then
    ok "所有 patch 为 LF（正确）"
else
    err "发现 $crlf_count 个 CRLF patch，需要 dos2unix："
    file patches/*.patch patches/ui-patches/*.patch patches/sed-patches/*.patch 2>/dev/null | grep "CRLF"
fi

# ==========================================
# 总结
# ==========================================
echo ""
echo -e "${BOLD}=== 检查完成 ====${NC}"
if [ $errors -eq 0 ] && [ $warnings -eq 0 ]; then
    echo -e "${GREEN}${BOLD}全部通过 ✅${NC}"
elif [ $errors -eq 0 ]; then
    echo -e "${YELLOW}${BOLD}$warnings 个警告，无致命错误${NC}"
else
    echo -e "${RED}${BOLD}$errors 个错误, $warnings 个警告 —— 请先修复再编译${NC}"
fi
echo ""
