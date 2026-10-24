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

err()  { errors=$((errors+1)); echo -e "${RED}❌ $*${NC}"; }
warn() { warnings=$((warnings+1)); echo -e "${YELLOW}⚠️  $*${NC}"; }
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
    "patches/installer-multilang.patch"
    "patches/uninstaller-cleanup.patch"
    "patches/installer-winupdater.patch"
    "patches/fix-7zsfx-branding.patch"
    "patches/vantage-ai-sidebar.patch"
    "patches/vantage-privacy-dashboard.patch"
    "patches/vantage-infobar-accent.patch"
    "patches/hide-passwordmgr.patch"
    "patches/gfx-zhms-font.patch"
    "patches/zh-ms-locale.patch"
    "patches/zh-ms-display-name.patch"
    "patches/fullpage-translations.patch"
    "patches/multithread-download.patch"
    "patches/webgl-permission-helper.patch"
    "patches/urlbarprovider-interventions.patch"
    "patches/bootstrap.patch"
    "patches/sed-patches/stop-undesired-requests.patch"
    "patches/ui-patches/firefox-view.patch"
    "patches/ui-patches/handlers.patch"
    "patches/ui-patches/hide-finish-setup-bookmark.patch"
    "patches/ui-patches/neterror.patch"
    "patches/ui-patches/restore-session-button.patch"
    "patches/ui-patches/screenshot-button-toolbar.patch"
    "patches/ui-patches/nova-nav-selected.patch"
    "patches/ui-patches/nova-dom-fullscreen-gap.patch"
    "patches/ui-patches/vantage-findbar-topright.patch"
    "patches/ui-patches/vantage-multithread-download-button.patch"
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
                if echo "$line" | grep -qE "vantage|installer|uninstaller|dmg-fix|zhcn|locale|publisher|winupdater"; then
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

MERGED_CFG=$(mktemp)
trap 'rm -f "$MERGED_CFG"' EXIT

if python3 scripts/cfg-merge.py --check >/dev/null; then
    ok "cfg 块标记完整"
else
    err "cfg 块标记不完整（cfg-merge.py --check）"
fi

if python3 scripts/cfg-merge.py --merge --output "$MERGED_CFG"; then
    ok "librewolf.cfg 拼合成功（$(wc -l < "$MERGED_CFG") 行）"
else
    err "librewolf.cfg 拼合失败"
fi

if grep -q "doUpdateCheck" "$MERGED_CFG"; then
    ok "更新检查代码存在"
else
    err "更新检查代码丢失！"
fi

if grep -q "importESModule.*NetUtil" "$MERGED_CFG"; then
    ok "NetUtil ESM 导入正确"
else
    err "NetUtil 导入丢失（可能是 JSM 旧版）"
fi

if grep -q '\.vantage' "$MERGED_CFG"; then
    ok "overrides 路径指向 .vantage"
else
    err "overrides 路径指向 librewolf！"
fi

if grep -q 'sandbox_enabled", false' settings/defaults/pref/local-settings.js; then
    ok "autoconfig 沙箱保持关闭（Vantage JS 依赖）"
else
    err "local-settings.js 的 sandbox_enabled 不是 false！"
fi

if grep -q '@RESPATH@/winupdater' scripts/librewolf-patches.py; then
    ok "WinUpdater package-manifest 注入代码存在"
else
    err "librewolf-patches.py 中 WinUpdater 注入代码丢失！"
fi

if grep -q 'def check_rejects' scripts/librewolf-patches.py; then
    ok "补丁 .rej 检测代码存在"
else
    err "librewolf-patches.py 中 check_rejects 丢失！"
fi

if [ -f patches/pref-pane/librewolf.js ] && [ -f patches/pref-pane/librewolf.inc.xhtml ] \
   && grep -q 'paneVantage' patches/pref-pane/librewolf.js \
   && grep -q 'paneVantage' patches/pref-pane/pref-pane-small.patch; then
    ok "Vantage pref-pane 文件与 paneVantage 注册存在"
else
    err "pref-pane 文件缺失或 paneVantage 注册丢失！"
fi

# ==========================================
# 4. l10n 品牌文本
# ==========================================
echo ""
echo -e "${BOLD}[4/5] l10n 品牌文本${NC}"

for lang in en-US zh-CN zh-TW; do
    if grep -q "Vantage" "l10n/$lang/browser/browser/aboutDialog.inc.ftl" 2>/dev/null; then
        ok "$lang aboutDialog 品牌文本正确"
    else
        err "$lang aboutDialog 品牌文本丢失"
    fi
done

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

if python3 - <<'PY'
import json, sys
p = "settings/distribution/policies.json"
try:
    d = json.load(open(p, encoding="utf-8"))
except Exception as e:
    print(f"policies.json 解析失败: {e}")
    sys.exit(1)
pol = d.get("policies", {})
ext = pol.get("ExtensionSettings", {})
errs = []
if not str(pol.get("SupportMenu", {}).get("URL", "")).startswith("https://asystech.cn"):
    errs.append("SupportMenu.URL 未指向 asystech.cn")
vd = ext.get("virusdetector@asystech.cn")
if not vd or vd.get("installation_mode") != "blocked":
    errs.append("virusdetector@asystech.cn 未设为 blocked")
if "uBlock0@raymondhill.net" in ext:
    errs.append("uBlock Origin 仍在预装列表")
for e in errs:
    print(e)
sys.exit(1 if errs else 0)
PY
then
    ok "policies.json 关键策略正确（SupportMenu / virusdetector blocked / 无 uBlock 预装）"
else
    err "policies.json 关键策略被上游覆盖或改动"
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

if python3 scripts/check-l10n-duplicates.py >/tmp/vantage-l10n-dups.out 2>&1; then
    ok "l10n 构建产物无重复 Fluent ID"
else
    warn "l10n 构建产物存在重复 Fluent ID（可能是旧构建，重建后复查）"
    sed 's/^/   /' /tmp/vantage-l10n-dups.out
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

if [ "$errors" -gt 0 ]; then
    exit 1
fi
