#!/usr/bin/env bash
# Vantage PE-SFX 裁剪脚本。
# ⚠️ 当前为「不裁剪」（最稳妥）：保留全部文件，避免误删启动依赖
#    （此前误删 InstallationDirLayout.dll 就导致过 "Couldn't load XPCOM"）。
# 如需裁剪，务必在目标 PE 实测通过后再逐条加，且一次只加一条。
set -euo pipefail

D="${1:?用法: strip-for-pe.sh <vantage-portable 目录>}"
[ -d "$D/vantage" ] || { echo "❌ 找不到 $D/vantage"; exit 1; }

echo "ℹ️  PE 裁剪：当前不裁剪任何文件（保留全部）"
