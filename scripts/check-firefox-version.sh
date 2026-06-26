#!/bin/bash
# 检查 Firefox Release / ESR 最新版本，仅在版本变化时输出
# 状态文件: /tmp/vantage-version-check/ff-state.json

API="https://product-details.mozilla.org/1.0/firefox_versions.json"
STATE_FILE="/tmp/vantage-version-check/ff-state.json"
mkdir -p "$(dirname "$STATE_FILE")"

DATA=$(curl -s "$API")

RELEASE=$(echo "$DATA" | grep -oP '"LATEST_FIREFOX_VERSION"\s*:\s*"[^"]*"' | grep -oP '[0-9.]+')
ESR=$(echo "$DATA" | grep -oP '"FIREFOX_ESR"\s*:\s*"[^"]*"' | grep -oP '[0-9.]+')
NEXT_REL=$(echo "$DATA" | grep -oP '"NEXT_RELEASE_DATE"\s*:\s*"[^"]*"' | grep -oP '\d{4}-\d{2}-\d{2}')

VANTAGE_VER=$(grep -oP '^version\s*=\s*\K[0-9.]+' ~/Vantage/Makefile 2>/dev/null)

# 读取上次状态
if [ -f "$STATE_FILE" ]; then
  LAST_RELEASE=$(grep -oP '"release"\s*:\s*"\K[^"]*' "$STATE_FILE")
  LAST_ESR=$(grep -oP '"esr"\s*:\s*"\K[^"]*' "$STATE_FILE")
else
  LAST_RELEASE=""
  LAST_ESR=""
fi

# 写新状态
cat > "$STATE_FILE" <<EOF
{
  "checked_at": "$(date -Iseconds)",
  "release": "$RELEASE",
  "esr": "$ESR",
  "next_release_date": "$NEXT_REL",
  "vantage": "$VANTAGE_VER"
}
EOF

# 只在版本变化时输出
CHANGED=false
MSG=""

if [ "$RELEASE" != "$LAST_RELEASE" ] && [ -n "$LAST_RELEASE" ]; then
  CHANGED=true
  MSG="${MSG}🔥 Firefox Release: ${LAST_RELEASE} → ${RELEASE}
"
elif [ -z "$LAST_RELEASE" ]; then
  # 首次运行，也报告
  CHANGED=true
  MSG="${MSG}Firefox Release: ${RELEASE} (首次记录)
"
fi

if [ "$ESR" != "$LAST_ESR" ] && [ -n "$LAST_ESR" ]; then
  CHANGED=true
  MSG="${MSG}🔵 Firefox ESR: ${LAST_ESR} → ${ESR}
"
elif [ -z "$LAST_ESR" ]; then
  MSG="${MSG}Firefox ESR: ${ESR}
"
fi

if $CHANGED; then
  if [ "$RELEASE" != "$VANTAGE_VER" ] && [ -n "$VANTAGE_VER" ]; then
    MSG="${MSG}⚠️ Vantage (${VANTAGE_VER}) 落后 Firefox Release (${RELEASE})
"
  fi
  MSG="${MSG}下次发布: ${NEXT_REL}"
  echo "$MSG"
fi
