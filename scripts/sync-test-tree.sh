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
#   - l10n/{en-US,en-CA,en-GB,zh-CN,zh-TW,zh-MS} 文案     → 逐条比对 id，只追加缺失项（幂等）
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
    "en-CA": tree / "lw/l10n/en-CA/browser/browser/preferences/preferences.ftl",
    "en-GB": tree / "lw/l10n/en-GB/browser/browser/preferences/preferences.ftl",
    "zh-CN": tree / "lw/l10n/zh-CN/browser/browser/preferences/preferences.ftl",
    "zh-TW": tree / "lw/l10n/zh-TW/browser/browser/preferences/preferences.ftl",
    "zh-MS": tree / "lw/l10n/zh-MS/browser/browser/preferences/preferences.ftl",
}
# 追加块的起点：本 overlay 里第一行"新增"文案
ANCHOR = "librewolf-webrtc-ip-warning1 = "

def ids(text):
    return set(re.findall(r"(?m)^([A-Za-z][\w-]*)\s*=", text))

for lang, dst in targets.items():
    if not dst.exists():
        print(f"⚠️  目标不存在，跳过: {dst}")
        continue
    src_lines = overlay(lang).read_text(encoding="utf-8").splitlines()
    xo = next((l for l in src_lines if l.startswith("librewolf-xorigin-ref-warning1 = ")), None)
    i = next((n for n, l in enumerate(src_lines) if l.startswith(ANCHOR)), None)
    if xo is None or i is None:
        print(f"⚠️  {lang}: overlay 缺少待同步内容，跳过")
        continue

    text = dst.read_text(encoding="utf-8")
    changed = []

    # 1) 改写单行文案（跨域引用 warning1）
    if xo not in text.splitlines():
        text, n = re.subn(r"(?m)^librewolf-xorigin-ref-warning1 = .*$",
                          lambda m: xo.replace("\\", "\\\\"), text, count=1)
        if n:
            changed.append("xorigin-warning1")

    # 2) 逐条比对 id，只追加目标里还没有的 message（幂等；之前用单一总标记会漏掉后加的串）
    have = ids(text)
    add = []
    for l in src_lines[i:]:
        m = re.match(r"^([A-Za-z][\w-]*)\s*=", l)
        if not l.strip() or l.lstrip().startswith("#"):
            continue
        if m and m.group(1) in have:
            continue
        add.append(l)
        if m:
            have.add(m.group(1))
    if add:
        text = text.rstrip("\n") + "\n\n" + "\n".join(add) + "\n"
        changed.append(f"+{len(add)} 条")

    if changed:
        dst.write_text(text, encoding="utf-8")
        print(f"+  {dst}  [{' / '.join(changed)}]")
    else:
        print(f"=  {dst}  已最新")
PY

echo
echo "✅ 同步完成。接下来（示例，DEV 目标）:"
echo "   cd $TREE"
echo "   MOZCONFIG=\"$PWD/assets/mozconfig.linux-x64-dev\" ./mach build"
echo "   MOZCONFIG=\"$PWD/assets/mozconfig.linux-x64-dev\" ./mach run"
