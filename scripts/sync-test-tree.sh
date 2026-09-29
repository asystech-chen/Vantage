#!/usr/bin/env bash
# sync-test-tree.sh —— 把 Vantage 源码改动同步进【已打补丁的源码树】，
# 以便用「增量构建」快速验证，而不用重跑 make dir（那会 rm -rf 重建整棵树）。
#
# 背景：make dir 的依赖列表里没有 patches/、l10n/、settings/，
#       所以改了这些文件后 make dir 是空操作、mach build 也不会带上改动。
#
# 用法：
#   ./scripts/sync-test-tree.sh                  # 默认 librewolf-<version>-<release>
#   ./scripts/sync-test-tree.sh librewolf-153.3.0-1
#
# 同步内容：
#   - patches/pref-pane/{librewolf.inc.xhtml,librewolf.js} → 树内 browser/components/preferences/
#   - settings/librewolf.cfg                              → 树内 lw/
#   - l10n/{en-US,zh-CN,zh-TW,zh-MS} 的 preferences 文案   → 增量（改行 + 追加，幂等）
set -euo pipefail
cd "$(dirname "$0")/.."

TREE="${1:-librewolf-$(cat version)-$(cat release)}"
[ -d "$TREE" ] || { echo "❌ 找不到源码树: $TREE"; exit 1; }
echo ">>> 同步到 $TREE"

cp -v patches/pref-pane/librewolf.inc.xhtml "$TREE/browser/components/preferences/librewolf.inc.xhtml"
cp -v patches/pref-pane/librewolf.js        "$TREE/browser/components/preferences/librewolf.js"
cp -v settings/librewolf.cfg                "$TREE/lw/librewolf.cfg"

python3 - "$TREE" <<'PY'
import sys, re, pathlib

tree = pathlib.Path(sys.argv[1])

def overlay(lang):
    for name in ("preferences.inc.ftl", "preferences.ftl"):
        p = pathlib.Path("l10n") / lang / "browser/browser/preferences" / name
        if p.exists():
            return p
    raise SystemExit(f"no l10n overlay for {lang}")

targets = {
    "en-US": tree / "browser/locales/en-US/browser/preferences/preferences.ftl",
    "zh-CN": tree / "lw/l10n/zh-CN/browser/browser/preferences/preferences.ftl",
    "zh-TW": tree / "lw/l10n/zh-TW/browser/browser/preferences/preferences.ftl",
    "zh-MS": tree / "lw/l10n/zh-MS/browser/browser/preferences/preferences.ftl",
}
MARK = "vantage-confirm-ipv6-cancel"

for lang, dst in targets.items():
    src = overlay(lang)
    lines = src.read_text(encoding="utf-8").splitlines()
    xo = next((l for l in lines if l.startswith("librewolf-xorigin-ref-warning1 = ")), None)
    i = next((n for n, l in enumerate(lines)
              if l.startswith("librewolf-webrtc-ip-warning1 = ")), None)
    if xo is None or i is None:
        print(f"⚠️  {src} 缺少待同步内容，跳过 {lang}")
        continue
    if not dst.exists():
        print(f"⚠️  目标不存在，跳过: {dst}")
        continue
    text = dst.read_text(encoding="utf-8")
    if MARK in text:
        print(f"=  已同步过，跳过: {dst}")
        continue
    text, n = re.subn(r"(?m)^librewolf-xorigin-ref-warning1 = .*$",
                      xo.replace("\\", "\\\\"), text, count=1)
    if n != 1:
        raise SystemExit(f"⚠️  未找到 xorigin 文案行: {dst}")
    text = text.rstrip("\n") + "\n\n" + "\n".join(lines[i:]) + "\n"
    dst.write_text(text, encoding="utf-8")
    print(f"+  已更新: {dst}")
PY

echo
echo "✅ 同步完成。接下来（示例，DEV 目标）:"
echo "   cd $TREE"
echo "   MOZCONFIG=\"$PWD/assets/mozconfig.linux-x64-dev\" ./mach build"
echo "   MOZCONFIG=\"$PWD/assets/mozconfig.linux-x64-dev\" ./mach run"
