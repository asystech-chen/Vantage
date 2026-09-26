#!/usr/bin/env bash
# Linux FFmpeg 依赖修复的静态回归测试：
# 校验 deb/rpm 打包声明了 FFmpeg 依赖、README/CHANGELOG 有对应文档，
# 并在 make 可用时做 dry-run 展开校验。
set -u

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MAKEFILE="$REPO_ROOT/Makefile"
README="$REPO_ROOT/README.md"
CHANGELOG="$REPO_ROOT/CHANGELOG.md"

pass=0
fail=0

check() {
  local desc="$1"; shift
  if "$@" >/dev/null 2>&1; then
    echo "  ok   - $desc"
    pass=$((pass + 1))
  else
    echo "  FAIL - $desc"
    fail=$((fail + 1))
  fi
}

echo "== Makefile: deb 包声明 FFmpeg 依赖 =="
check "deb control 的 Depends 包含 ffmpeg" \
  grep -F 'Depends: libgtk-3-0, libdbus-glib-1-2, libxtst6, libxss1, libasound2, ffmpeg' "$MAKEFILE"

echo "== Makefile: rpm 包以弱依赖建议安装 FFmpeg =="
check "fpm 调用包含 --rpm-tag \"Recommends: ffmpeg\"" \
  grep -F -- '--rpm-tag "Recommends: ffmpeg"' "$MAKEFILE"

echo "== README: Linux 依赖说明与 FAQ =="
check "系统要求提及 FFmpeg" \
  grep -F '播放哔哩哔哩等网站的 H.264/AAC 视频还需要系统 FFmpeg' "$README"
check "FAQ 包含 apt install ffmpeg" grep -F 'sudo apt install ffmpeg' "$README"
check "FAQ 包含 pacman -S ffmpeg" grep -F 'sudo pacman -S ffmpeg' "$README"
check "FAQ 包含 dnf install ffmpeg" grep -F 'sudo dnf install ffmpeg' "$README"
check "FAQ 包含 zypper install ffmpeg" grep -F 'sudo zypper install ffmpeg' "$README"

echo "== CHANGELOG: 修复条目 =="
check "更新日志包含 Linux FFmpeg 修复条目" \
  grep -F 'Linux 下哔哩哔哩等视频站无法播放' "$CHANGELOG"

echo "== librewolf.cfg: 启动检测小节 =="
check "存在 BEGIN 标记" \
  grep -F '__VANTAGE_LINUX_FFMPEG_HINT_BEGIN__' "$REPO_ROOT/settings/librewolf.cfg"
check "存在 END 标记" \
  grep -F '__VANTAGE_LINUX_FFMPEG_HINT_END__' "$REPO_ROOT/settings/librewolf.cfg"
check "声明 dismissed pref" \
  grep -F 'defaultPref("vantage.linux.ffmpegHint.dismissed"' "$REPO_ROOT/settings/librewolf.cfg"
check "声明 helpUrl pref" \
  grep -F 'defaultPref("vantage.linux.ffmpegHint.helpUrl"' "$REPO_ROOT/settings/librewolf.cfg"

echo "== make dry-run（可选，make 不存在时跳过） =="
if command -v make >/dev/null 2>&1; then
  deb_out="$(make -C "$REPO_ROOT" -n package-deb BINARY_TARBALL=dummy.tar.xz 2>/dev/null || true)"
  rpm_out="$(make -C "$REPO_ROOT" -n package-rpm BINARY_TARBALL=dummy.tar.xz 2>/dev/null || true)"
  if printf '%s' "$deb_out" | grep -qF 'libasound2, ffmpeg'; then
    echo "  ok   - make -n package-deb 展开后 Depends 含 ffmpeg"
    pass=$((pass + 1))
  else
    echo "  FAIL - make -n package-deb 展开后 Depends 含 ffmpeg"
    fail=$((fail + 1))
  fi
  if printf '%s' "$rpm_out" | grep -qF 'Recommends: ffmpeg'; then
    echo "  ok   - make -n package-rpm 展开后含 Recommends: ffmpeg"
    pass=$((pass + 1))
  else
    echo "  FAIL - make -n package-rpm 展开后含 Recommends: ffmpeg"
    fail=$((fail + 1))
  fi
else
  echo "  skip - 环境无 make，跳过 dry-run（静态检查已覆盖）"
fi

echo
echo "passed: $pass, failed: $fail"
[ "$fail" -eq 0 ]
