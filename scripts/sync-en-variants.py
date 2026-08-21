#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
sync-en-variants.py — Vantage 英文语言变体同步脚本

用法：
    python3 scripts/sync-en-variants.py            # 同步生成 en-GB / en-CA
    python3 scripts/sync-en-variants.py --check    # 只检查差异，不写文件

作用：
    桶哥只维护 l10n/en-US/ 一处英文定制文案，本脚本自动为 en-GB（英式）
    和 en-CA（加拿大式）生成对应文件，并应用拼写转换。

路径映射：
    en-US/browser/browser/xxx.inc.ftl     → en-GB/browser/browser/xxx.inc.ftl（.inc 追加文件同路径）
    en-US/browser/newtab/newtab.ftl       → en-GB/browser/browser/newtab/newtab.inc.ftl
                                            （⚠️ 特判：Mozilla 构建源在双层 browser/browser/newtab/，
                                            必须用 .inc 追加模式，否则会覆盖 Mozilla 完整翻译）
    en-US/toolkit/toolkit/branding/xxx.ftl → en-GB/toolkit/toolkit/branding/xxx.ftl（覆盖文件同路径）

拼写转换（en-GB 与 en-CA 目前共用同一规则表）：
    - behavior → behaviour（Mozilla en-GB/en-CA 官方惯例 -our）
    - color    → colour
    - timezone → time zone（英式两词）
    - 保留 -ize（customize/customization/personalized 等）：Mozilla en-GB 主流用 -ize
      （实测 firefox-l10n en-GB customize 62 次 vs customise 7 次），en-CA 全部 -ize

注意事项：
    - 输出文件保证以 \n 结尾（桶哥铁习惯）
    - 幂等：重复运行结果一致
    - 未来 en-US 新增定制文件，本脚本自动为两个变体生成
"""

import argparse
import pathlib
import re
import sys

L10N_DIR = pathlib.Path(__file__).resolve().parent.parent / "l10n"
VARIANTS = ["en-GB", "en-CA"]

# 美式 → 英式/加式 精确词映射（含大小写变体）
WORD_MAP = {
    # behavior → behaviour
    "Behavior": "Behaviour", "behavior": "behaviour", "BEHAVIOR": "BEHAVIOUR",
    "Behaviors": "Behaviours", "behaviors": "behaviours", "BEHAVIORS": "BEHAVIOURS",
    # color → colour
    "Color": "Colour", "color": "colour", "COLOR": "COLOUR",
    "Colors": "Colours", "colors": "colours", "COLORS": "COLOURS",
    # timezone → time zone
    "Timezone": "Time zone", "timezone": "time zone", "TIMEZONE": "TIME ZONE",
}

_WORD_RE = re.compile(r"\b(?:%s)\b" % "|".join(map(re.escape, WORD_MAP)))


def convert_spelling(text: str) -> str:
    """应用拼写转换（美式 → 英式/加式）。"""
    return _WORD_RE.sub(lambda m: WORD_MAP[m.group(0)], text)


def map_path(rel: pathlib.Path) -> pathlib.Path:
    """把 en-US 相对路径映射到变体语言的相对路径。"""
    parts = rel.parts
    # 特判：单层 browser/newtab/newtab.ftl → 双层 browser/browser/newtab/newtab.inc.ftl
    # （LibreWolf 上游历史 bug：单层路径是旁路，从未生效；真正构建源是双层）
    if len(parts) >= 3 and parts[0] == "browser" and parts[1] == "newtab" and parts[-1] == "newtab.ftl":
        return pathlib.Path("browser", "browser", "newtab", "newtab.inc.ftl")
    return rel


def process(loc: str, en_us: pathlib.Path) -> list:
    """为变体语言生成文件，返回 (写入路径, 是否更新) 列表。"""
    src_dir = en_us
    dst_dir = L10N_DIR / loc
    results = []
    for src in sorted(src_dir.rglob("*.ftl")):
        rel = src.relative_to(src_dir)
        rel = map_path(rel)
        dst = dst_dir / rel
        new_text = convert_spelling(src.read_text())
        if not new_text.endswith("\n"):
            new_text += "\n"
        changed = True
        if dst.exists():
            changed = dst.read_text() != new_text
        results.append((dst, changed))
        if not args.check:
            dst.parent.mkdir(parents=True, exist_ok=True)
            dst.write_text(new_text)
    return results


def main() -> int:
    global args
    parser = argparse.ArgumentParser(description="Vantage 英文语言变体同步脚本")
    parser.add_argument("--check", action="store_true", help="只检查差异，不写文件")
    args = parser.parse_args()

    en_us = L10N_DIR / "en-US"
    if not en_us.is_dir():
        print(f"错误：找不到 {en_us}", file=sys.stderr)
        return 1

    all_ok = True
    for loc in VARIANTS:
        results = process(loc, en_us)
        if args.check:
            dirty = [str(d) for d, c in results if c]
            if dirty:
                print(f"⚠️  {loc}: {len(dirty)} 个文件与 en-US 不同步（缺文件或有差异）:")
                for d in dirty:
                    print(f"      {d}")
                all_ok = False
            else:
                print(f"✅ {loc}: 与 en-US 完全同步")
        else:
            written = [str(d) for d, c in results if c]
            print(f"✅ {loc}: 已同步 {len(results)} 个文件（更新 {len(written)} 个）")
            for d in written:
                print(f"      {d}")
    return 0 if all_ok else 1


if __name__ == "__main__":
    sys.exit(main())
