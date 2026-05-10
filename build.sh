#!/usr/bin/env bash
set -euo pipefail

# ==========================================
# Vantage 多平台自动编译脚本
# 用法:
#   ./build.sh                              # 交互式选择
#   ./build.sh linux-x64                    # 编译单个目标
#   ./build.sh linux-x64 windows-x64 macos-arm64  # 编译多个目标
#
# 可用目标:
#   linux-x64    linux-arm64    linux-loong64
#   windows-x64  windows-arm64
#   macos-x64    macos-arm64
#   也可用简写: lx la ll wx wa mx ma / all
#
# 编译完成后自动执行 make checksum 生成校验和
# ==========================================

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_ROOT"

# ---------- 目标定义 ----------
declare -A TARGETS=(
  ["linux-x64"]="Linux x64|assets/mozconfig.new|linux"
  ["linux-arm64"]="Linux arm64|assets/mozconfig.linux-arm64|linux"
  ["linux-loong64"]="Linux loong64|assets/mozconfig.linux-loong64|linux"
  ["windows-x64"]="Windows x64|assets/mozconfig.win-cross|windows"
  ["windows-arm64"]="Windows arm64|assets/mozconfig.win-cross.arm64|windows"
  ["macos-x64"]="macOS x64|assets/mozconfig.osx-cross|macos"
  ["macos-arm64"]="macOS arm64|assets/mozconfig.osx-cross-arm64|macos"
)

# 简写映射
declare -A ALIASES=(
  ["lx"]="linux-x64"
  ["la"]="linux-arm64"
  ["ll"]="linux-loong64"
  ["wx"]="windows-x64"
  ["wa"]="windows-arm64"
  ["mx"]="macos-x64"
  ["ma"]="macos-arm64"
)

# 全局目标顺序（供菜单和 'all' 共用）
KEY_ORDER=(linux-x64 linux-arm64 linux-loong64 windows-x64 windows-arm64 macos-x64 macos-arm64)

# ---------- 工具函数 ----------
red()    { echo -e "\033[31m$*\033[0m"; }
green()  { echo -e "\033[32m$*\033[0m"; }
yellow() { echo -e "\033[33m$*\033[0m"; }
bold()   { echo -e "\033[1m$*\033[0m"; }

die() {
  red "❌ $*"
  exit 1
}

# ---------- 显示菜单（交互模式） ----------
show_menu() {
  echo ""
  bold "═══════════════════════════════════════"
  bold "  Vantage 多平台自动编译脚本"
  bold "═══════════════════════════════════════"
  echo ""
  echo "  请选择要编译的目标（输入编号，多个以空格分隔）："
  echo "  输入 'all' 选择全部，输入 'q' 退出。"
  echo ""

  local i=1
  for key in "${KEY_ORDER[@]}"; do
    IFS='|' read -r label cfg os <<< "${TARGETS[$key]}"
    printf "  %2d) %s\n" "$i" "$label"
    ((i++))
  done

  echo ""
}

# ---------- 解析参数为 key 列表 ----------
resolve_args() {
  local keys=()
  for arg in "$@"; do
    # 简写
    if [[ -n "${ALIASES[$arg]:-}" ]]; then
      keys+=("${ALIASES[$arg]}")
    elif [[ "$arg" == "all" ]]; then
      keys+=("${KEY_ORDER[@]}")
    elif [[ -n "${TARGETS[$arg]:-}" ]]; then
      keys+=("$arg")
    else
      die "未知目标: '$arg'。可用: linux-x64, linux-arm64, linux-loong64, windows-x64, windows-arm64, macos-x64, macos-arm64 (或简写: lx la ll wx wa mx ma / all)"
    fi
  done
  # 去重并保持顺序
  printf '%s\n' "${keys[@]}" | awk '!seen[$0]++'
}

# ---------- 显示目标列表 ----------
show_targets() {
  echo "" >&2
  bold "═══════════════════════════════════════" >&2
  bold "  可用编译目标" >&2
  bold "═══════════════════════════════════════" >&2
  echo "" >&2
  local i=1
  for key in "${KEY_ORDER[@]}"; do
    IFS='|' read -r label cfg os <<< "${TARGETS[$key]}"
    printf "  %2d) %s\n" "$i" "$label" >&2
    ((i++))
  done
  echo "" >&2
  bold "  输入编号多选（空格分隔），或 'all' 全选，'q' 退出" >&2
  bold "═══════════════════════════════════════" >&2
  echo "" >&2
}

# ---------- 交互式选择 ----------
interactive_select() {
  local input raw_choices choices=()

  while true; do
    # 先显示目标列表（输出到 stderr/终端）
    show_targets

    echo -n "👉 你的选择： " >&2
    read -r input

    if [[ "$input" == "q" ]]; then
      echo "" >&2
      yellow "已取消。" >&2
      exit 0
    fi

    if [[ "$input" == "all" ]]; then
      choices=("${KEY_ORDER[@]}")
      break
    fi

    raw_choices=($input)
    choices=()
    local ok=true
    for c in "${raw_choices[@]}"; do
      if [[ "$c" =~ ^[1-7]$ ]] && [[ "$c" -le "${#KEY_ORDER[@]}" ]]; then
        idx=$((c - 1))
        choices+=("${KEY_ORDER[$idx]}")
      else
        red "  无效选择：$c（请输入 1-7、'all' 或 'q'）" >&2
        ok=false
        break
      fi
    done

    if $ok && [[ ${#choices[@]} -gt 0 ]]; then
      break
    fi
  done

  # 只输出结果到 stdout（供 readarray 捕获）
  printf '%s\n' "${choices[@]}" | awk '!seen[$0]++'
}


# ---------- 单目标编译 ----------
build_target() {
  local key="$1"
  IFS='|' read -r label mozconfig os_type <<< "${TARGETS[$key]}"

  echo ""
  bold "───────────────────────────────────────────"
  bold "  开始编译: $label"
  bold "  mozconfig: $mozconfig"
  bold "───────────────────────────────────────────"
  echo ""

  # Step 1: 导出 mozconfig + 准备源码
  green ">>> [1/3] 导出 MOZCONFIG 并准备源码 (make dir)..."
  export MOZCONFIG="$REPO_ROOT/$mozconfig"
  make dir

  # Step 2: 编译
  green ">>> [2/3] 编译 (make build)..."
  make build || { red "❌ $label 编译失败"; return 1; }

  # Step 3: 打包
  green ">>> [3/3] 打包 (make package)..."
  make package || { red "❌ $label 打包失败"; return 1; }

  # 对 Linux 目标额外执行 package-all (deb/rpm/AppImage/tar.gz)
  if [[ "$os_type" == "linux" ]]; then
    echo ""
    green ">>> Linux 目标：执行 make package-all (deb/rpm/AppImage/tar.gz)..."
    make package-all || red "⚠️  $label package-all 失败（非致命）"
  fi

  # 验证产物
  echo ""
  green ">>> 当前根目录下的打包产物:"
  ls -lh vantage-* 2>/dev/null || yellow "  (未找到 vantage-* 产物)"

  green "✅ $label 编译流程完成"
}

# ---------- 主流程 ----------
main() {
  local selected=() total count=0 failed=() rc

  if [[ $# -gt 0 ]]; then
    # 参数模式：直接解析
    readarray -t selected < <(resolve_args "$@")
  else
    # 交互模式
    readarray -t selected < <(interactive_select)
  fi

  # 确认清单
  echo ""
  bold "═══════════════════════════════════════"
  bold "  确认编译目标"
  bold "═══════════════════════════════════════"
  echo ""
  for key in "${selected[@]}"; do
    IFS='|' read -r label cfg os <<< "${TARGETS[$key]}"
    echo "    • $label"
  done
  echo ""
  bold "═══════════════════════════════════════"
  echo ""
  yellow "⚠️  每个目标的编译耗时可能很长（数小时），"
  yellow "    请确保有足够的磁盘空间和编译工具链。"
  echo ""

  # 参数模式跳过确认，直接开始
  if [[ $# -gt 0 ]]; then
    green "✅ 参数模式，直接开始编译..."
  else
    while true; do
      read -r -p "  👉 确认开始? (yes/no): " confirm
      case "$confirm" in
        yes|YES|y|Y) break ;;
        no|NO|n|N) yellow "已取消。"; exit 0 ;;
        *) red "请输入 yes 或 no" ;;
      esac
    done
    echo ""
  fi

  green "✅ 开始编译..."
  total=${#selected[@]}

  for key in "${selected[@]}"; do
    ((++count))
    echo ""
    bold "═══════════════════════════════════════"
    bold "  进度: $count / $total"
    bold "═══════════════════════════════════════"

    set +e
    build_target "$key"
    rc=$?
    set -e

    if [[ $rc -ne 0 ]]; then
      IFS='|' read -r label cfg os <<< "${TARGETS[$key]}"
      red "❌ $label 编译失败"
      failed+=("$label")
    fi
  done

  # 生成 checksum
  if [[ ${#failed[@]} -eq 0 ]]; then
    echo ""
    bold "═══════════════════════════════════════"
    bold "  生成校验和 (make checksum)"
    bold "═══════════════════════════════════════"
    echo ""
    green ">>> 执行 make checksum..."
    make checksum || red "⚠️  checksum 生成失败"
    echo ""
  fi

  # 最终汇总
  echo ""
  bold "═══════════════════════════════════════"
  bold "  编译任务全部完成"
  bold "═══════════════════════════════════════"

  if [[ ${#failed[@]} -gt 0 ]]; then
    red "  以下目标编译失败:"
    for f in "${failed[@]}"; do
      red "    • $f"
    done
  fi

  echo ""
  green "📦 当前根目录下的所有打包产物:"
  ls -lh vantage-* 2>/dev/null || yellow "  (未找到产物)"
  echo ""
  green "📋 校验和文件:"
  ls -lh *.sha512sum 2>/dev/null || yellow "  (未找到校验和文件)"
  echo ""

  if [[ ${#failed[@]} -eq 0 ]]; then
    green "🎉 所有目标编译成功！"
  fi
}

main "$@"
