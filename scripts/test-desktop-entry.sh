#!/bin/bash
#
# test-desktop-entry.sh - Linux 桌面项 (.desktop) 与 WM_CLASS 一致性测试
#
# 背景（GXDE/DDE 系启动器图标问题）:
#   DDE/GXDE 桌面通过 "<WM_CLASS instanceName>.desktop" 将运行中的窗口
#   关联到桌面项；关联失败时任务栏/启动器显示通用图标。
#   Firefox 系浏览器的 WM_CLASS instanceName = MOZ_APP_REMOTINGNAME:
#     - 未设置 --enable-update-channel 时默认通道为 "default"，
#       RemotingName = "<app-name>-default"（vantage-default），
#       与 vantage.desktop 不匹配 → 图标异常
#     - release 通道时 RemotingName = "<app-name>"（vantage）→ 匹配
#   （推导规则见 firefox 源码 toolkit/moz.configure moz_app_remotingname）
#
# 本脚本不依赖 make / python / dpkg-deb，直接从 Makefile 提取三种包
# (deb / rpm / AppImage) 的 .desktop 生成命令并在临时目录执行，验证:
#   1. 各 Linux mozconfig 均设置 --enable-update-channel=release
#   2. 由 mozconfig 推导的 RemotingName（WM_CLASS）== APP_NAME
#   3. 打包图标资源存在
#   4. 生成的 .desktop 键完整、无重复，StartupWMClass 与 WM_CLASS 一致，
#      文件基名与 WM_CLASS 一致
#
# 用法: ./scripts/test-desktop-entry.sh
# 退出码: 0 = 全部通过; 1 = 存在失败项

set -u
cd "$(dirname "$0")/.."

PASS=0
FAIL=0
TESTS_RUN=0

ok()   { TESTS_RUN=$((TESTS_RUN+1)); PASS=$((PASS+1)); printf 'ok %d - %s\n' "$TESTS_RUN" "$1"; }
fail() { TESTS_RUN=$((TESTS_RUN+1)); FAIL=$((FAIL+1)); printf 'not ok %d - %s\n' "$TESTS_RUN" "$1"; if [ $# -gt 1 ]; then printf '    # %s\n' "$2"; fi; }
assert_eq() { # <描述> <期望值> <实际值>
	if [ "$2" = "$3" ]; then ok "$1"; else fail "$1" "期望 [$2] 实际 [$3]"; fi
}
assert_file() { # <描述> <路径>
	if [ -f "$2" ]; then ok "$1"; else fail "$1" "缺少文件: $2"; fi
}

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# ---- Makefile 打包变量 ----
APP_NAME="$(sed -nE 's/^APP_NAME := (.+)$/\1/p' Makefile | head -1)"
APP_DISPLAY_NAME="$(sed -nE 's/^APP_DISPLAY_NAME := (.+)$/\1/p' Makefile | head -1)"
LW_ICON="$(sed -nE 's/^LW_ICON := (.+)$/\1/p' Makefile | head -1)"

if [ -z "$APP_NAME" ] || [ -z "$APP_DISPLAY_NAME" ] || [ -z "$LW_ICON" ]; then
	echo "Bail out! 无法从 Makefile 解析 APP_NAME / APP_DISPLAY_NAME / LW_ICON"
	exit 1
fi

# ---- 1. Linux mozconfig: release 通道（决定 RemotingName/WM_CLASS） ----
# 与 firefox toolkit/moz.configure 的 moz_app_remotingname 逻辑一致:
#   未设置/为空 → <app>-default；release → <app>；其他 → <app>-<channel>
expected_wmclass() { # <mozconfig>
	local cfg="$1" app chan
	app="$(sed -nE 's/.*--with-app-name=([A-Za-z0-9._-]+).*/\1/p' "$cfg" | head -1)"
	chan="$(sed -nE 's/.*--enable-update-channel=([A-Za-z0-9._-]+).*/\1/p' "$cfg" | head -1)"
	if [ -z "$chan" ] || [ "$chan" = "default" ]; then
		printf '%s-default\n' "$app"
	elif [ "$chan" = "release" ]; then
		printf '%s\n' "$app"
	else
		printf '%s-%s\n' "$app" "$chan"
	fi
}

LINUX_MOZCONFIGS="assets/mozconfig.new assets/mozconfig.new.without-bootstrap assets/mozconfig.linux-arm64 assets/mozconfig.linux-loong64 assets/mozconfig.linux-x64-dev"

for cfg in $LINUX_MOZCONFIGS; do
	assert_file "mozconfig 存在: $cfg" "$cfg"
	[ -f "$cfg" ] || continue
	if grep -qE -- '^ac_add_options --enable-update-channel=release$' "$cfg"; then
		ok "$cfg 设置 --enable-update-channel=release"
	else
		fail "$cfg 设置 --enable-update-channel=release" "RemotingName 将为 <app>-default，WM_CLASS 无法匹配 ${APP_NAME}.desktop（GXDE/DDE 启动器图标异常）"
	fi
done

WM_CLASS="$(expected_wmclass assets/mozconfig.new)"
assert_eq "mozconfig.new 推导的 WM_CLASS instanceName (RemotingName) == APP_NAME" "$APP_NAME" "$WM_CLASS"

# ---- 2. 打包图标资源 ----
assert_file "打包图标资源存在 (LW_ICON=$LW_ICON)" "$LW_ICON"

# ---- 3. 从 Makefile 提取 .desktop 生成命令并执行 ----
gen_entries() { # <Makefile 中的目标目录前缀> <临时输出目录>
	local prefix="$1" outdir="$2" line cmd
	local pname='$(APP_NAME)' pdname='$(APP_DISPLAY_NAME)'
	mkdir -p "$outdir"
	grep -F -- "> ${prefix}/${pname}.desktop" Makefile | while IFS= read -r line; do
		cmd="${line#"${line%%[![:space:]]*}"}" # 去掉行首空白（Makefile 配方缩进）
		cmd="${cmd#@}"
		cmd="${cmd//"$pdname"/$APP_DISPLAY_NAME}"
		cmd="${cmd//"$pname"/$APP_NAME}"
		cmd="${cmd//"$prefix"/$outdir}"
		eval "$cmd"
	done
}

gen_entries "deb_build/usr/share/applications" "$TMP/deb"
gen_entries "rpm_build/usr/share/applications" "$TMP/rpm"
gen_entries "AppDir" "$TMP/appimage"

desktop_key() { # <file> <key> → 输出值（键不存在则为空）
	sed -nE "s/^$2=(.*)$/\1/p" "$1" | head -1
}

check_desktop() { # <组名> <文件>
	local g="$1" f="$2" k v dups
	if [ ! -f "$f" ]; then
		fail "[$g] 生成 .desktop" "未生成 $f（Makefile 提取或执行失败）"
		return
	fi
	ok "[$g] 生成 .desktop: $(basename "$f")"

	assert_eq "[$g] 首行为 [Desktop Entry]" "[Desktop Entry]" "$(head -1 "$f")"
	assert_eq "[$g] 文件基名 == WM_CLASS（DDE/GXDE 按 <instanceName>.desktop 关联窗口）" \
		"$WM_CLASS" "$(basename "$f" .desktop)"

	for k in Name Type Icon Categories Terminal StartupNotify StartupWMClass Exec; do
		v="$(desktop_key "$f" "$k")"
		if [ -n "$v" ]; then ok "[$g] 包含键 $k=$v"; else fail "[$g] 包含键 $k" "缺失或值为空"; fi
	done

	assert_eq "[$g] Name == APP_DISPLAY_NAME" "$APP_DISPLAY_NAME" "$(desktop_key "$f" Name)"
	assert_eq "[$g] Icon == APP_NAME" "$APP_NAME" "$(desktop_key "$f" Icon)"
	assert_eq "[$g] Type == Application" "Application" "$(desktop_key "$f" Type)"
	assert_eq "[$g] Terminal == false" "false" "$(desktop_key "$f" Terminal)"
	assert_eq "[$g] StartupNotify == true" "true" "$(desktop_key "$f" StartupNotify)"
	assert_eq "[$g] StartupWMClass == WM_CLASS instanceName" "$WM_CLASS" "$(desktop_key "$f" StartupWMClass)"

	case ";$(desktop_key "$f" Categories)" in
		*";Network;"*) ok "[$g] Categories 包含 Network" ;;
		*) fail "[$g] Categories 包含 Network" "实际: $(desktop_key "$f" Categories)" ;;
	esac

	dups="$(grep -E '^[A-Za-z][A-Za-z0-9-]*=' "$f" | cut -d= -f1 | sort | uniq -d | tr '\n' ' ')"
	if [ -z "$dups" ]; then ok "[$g] 无重复键"; else fail "[$g] 无重复键" "重复: $dups"; fi
}

check_desktop "deb" "$TMP/deb/${APP_NAME}.desktop"
check_desktop "rpm" "$TMP/rpm/${APP_NAME}.desktop"
check_desktop "appimage" "$TMP/appimage/${APP_NAME}.desktop"

# ---- 汇总 ----
printf '\n# tests %d, pass %d, fail %d\n' "$TESTS_RUN" "$PASS" "$FAIL"
if [ "$FAIL" -eq 0 ]; then
	echo "PASS: 桌面项与 WM_CLASS 配置一致"
	exit 0
fi
echo "FAIL: $FAIL 项检查未通过"
exit 1
