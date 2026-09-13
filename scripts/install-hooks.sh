#!/usr/bin/env bash
# install-hooks.sh —— 安装本地 git 钩子（gitleaks 预提交密钥扫描）
#
# 用法:  scripts/install-hooks.sh
#
# 说明:
#   - 钩子是本地配置，不随仓库走；重新 clone 后需重新运行本脚本
#   - 未安装 gitleaks 时钩子会自动跳过（不报错）
#   - gitleaks 安装: https://github.com/gitleaks/gitleaks/releases
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
HOOK="$REPO/.git/hooks/pre-commit"

cat > "$HOOK" <<'HOOKEOF'
#!/usr/bin/env bash
# gitleaks 预提交密钥扫描（未安装则跳过；只扫暂存区）
# 依赖: gitleaks（~/.local/bin 或 PATH）；配置: 仓库根 .gitleaks.toml
GL="$(command -v gitleaks 2>/dev/null || true)"
[ -z "$GL" ] && GL="$HOME/.local/bin/gitleaks"
if [ ! -x "$GL" ]; then
  echo "[pre-commit] gitleaks 未安装 → 跳过密钥扫描（CI 可兜底）"
  exit 0
fi
"$GL" git --staged --redact --config .gitleaks.toml
rc=$?
if [ "$rc" -eq 1 ]; then
  echo "❌ [pre-commit] 检出疑似密钥，提交已阻止。确认无误可用 'git commit --no-verify' 跳过。"
  exit 1
fi
exit 0
HOOKEOF

chmod +x "$HOOK"
echo "✅ 已安装 pre-commit 钩子: $HOOK"

if ! command -v gitleaks >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/gitleaks" ]; then
  echo "⚠️  未检测到 gitleaks → 钩子会跳过扫描。安装见 https://github.com/gitleaks/gitleaks/releases"
fi
