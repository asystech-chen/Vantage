#!/usr/bin/env bash
# 运行批量翻译器（自动从 ~/.bashrc 提取 DEEPSEEK_API_KEY，不显示 key）
set -e
cd "$(dirname "$0")"

KEY=$(grep -o 'sk-[a-zA-Z0-9]*' ~/.bashrc | head -1)
if [ -z "$KEY" ]; then
    echo "❌ 未在 ~/.bashrc 找到 DEEPSEEK_API_KEY"
    exit 1
fi

export DEEPSEEK_API_KEY="$KEY"
exec python3 batch-translate.py "$@"
