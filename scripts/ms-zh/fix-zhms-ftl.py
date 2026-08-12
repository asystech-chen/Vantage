#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
zh-MS 翻译产物修复器（2026-08-12）
==================================
修复批量翻译器产生的 .ftl 文件问题：
1. **末尾换行丢失**（所有文件）：补 POSIX 结尾换行（桶哥铁习惯）
2. **browser.ftl 选择器块损坏**：popup-warning-message 的 [1] variant 被 LLM 吞掉
   → 按 en-US 结构恢复
3. **全量语法校验**：用 fluent.syntax 宽容模式扫 Junk，0 Junk 才算修好

用法：
    python3 fix-zhms-ftl.py                # 修复默认目录 ~/Vantage/l10n/zh-MS
    python3 fix-zhms-ftl.py --check-only   # 只校验不修改
"""

import argparse
import sys
from pathlib import Path

# 产物树自带 fluent.syntax（避免 pip 安装）
HERE = Path(__file__).resolve().parent
VANTAGE = HERE.parent.parent
FLUENT_SYNTAX = VANTAGE / "librewolf-153.0-5" / "third_party" / "python" / "fluent.syntax"
sys.path.insert(0, str(FLUENT_SYNTAX))

from fluent.syntax import parse  # noqa: E402
from fluent.syntax.ast import Junk  # noqa: E402

DEFAULT_DIR = VANTAGE / "l10n" / "zh-MS"

# browser.ftl 专用修复：popup-warning-message 选择器块
# 坏（LLM 吞了 [1] variant 且丢了缩进）：
#     { $popupCount ->
# { -brand-short-name } 已阻止此站点打开弹出窗口。
#        *[other] ...
# 好（参照 en-US）：
#     { $popupCount ->
#         [1] { -brand-short-name } 已阻止此站点打开弹出窗口。
#        *[other] ...
POPUP_BAD = (
    "    { $popupCount ->\n"
    "{ -brand-short-name } 已阻止此站点打开弹出窗口。\n"
    "       *[other]"
)
POPUP_GOOD = (
    "    { $popupCount ->\n"
    "        [1] { -brand-short-name } 已阻止此站点打开弹出窗口。\n"
    "       *[other]"
)


def find_junk(text: str):
    """宽容模式解析，返回 (Junk列表, 首个注解)"""
    res = parse(text)
    junk = [e for e in res.body if isinstance(e, Junk)]
    ann = junk[0].annotations[0] if junk and junk[0].annotations else None
    return junk, ann


def check_file(path: Path) -> str | None:
    """返回错误描述，None 表示通过"""
    text = path.read_text(encoding="utf-8")
    junk, ann = find_junk(text)
    if junk:
        return f"Junk={junk[0].content[:40]!r} {ann.code if ann else '?'} {ann.message if ann else ''}"
    return None


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dir", default=str(DEFAULT_DIR))
    parser.add_argument("--check-only", action="store_true", help="只校验，不修改")
    args = parser.parse_args()

    base = Path(args.dir)
    files = sorted(base.rglob("*.ftl"))
    print(f"📋 扫描 {len(files)} 个 .ftl（{base}）\n")

    fixed_nl = 0
    fixed_popup = 0
    still_bad = []

    for f in files:
        raw = f.read_bytes()

        # 1) 末尾换行
        if not raw.endswith(b"\n"):
            if args.check_only:
                print(f"⚠️  {f.relative_to(base)}: 缺末尾换行")
            else:
                f.write_bytes(raw + b"\n")
                fixed_nl += 1

        if args.check_only:
            continue

        # 2) browser.ftl 选择器块
        if f.name == "browser.ftl":
            text = f.read_text(encoding="utf-8")
            if POPUP_BAD in text:
                f.write_text(text.replace(POPUP_BAD, POPUP_GOOD), encoding="utf-8")
                fixed_popup += 1
                print(f"🔧 {f.relative_to(base)}: 恢复 [1] variant")

    if args.check_only:
        print("\n=== 语法校验 ===")
        bad = 0
        for f in files:
            err = check_file(f)
            if err:
                bad += 1
                print(f"❌ {f.relative_to(base)}: {err}")
        print(f"\n{'✅ 全部通过' if bad == 0 else f'❌ {bad} 个文件仍有问题'}")
        return

    # 3) 修复后全量校验
    print("\n=== 修复后语法校验 ===")
    bad = 0
    for f in files:
        err = check_file(f)
        if err:
            bad += 1
            still_bad.append((f, err))
    if bad == 0:
        print("✅ 全部通过，0 Junk")
    else:
        for f, err in still_bad:
            print(f"❌ {f.relative_to(base)}: {err}")

    print(f"\n📊 修复统计: 补末尾换行 {fixed_nl} 个, 选择器修复 {fixed_popup} 个, 剩余问题 {bad} 个")


if __name__ == "__main__":
    main()
