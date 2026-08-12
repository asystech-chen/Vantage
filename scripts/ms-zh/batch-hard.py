#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
zh-MS 批量硬翻器 v1.1
=====================
用硬翻引擎（hard-translate.py）全量生成 zh-MS 语言包：
- Fluent 结构感知：注释/key/属性名/占位符/选择器结构保留，只翻译文本值
- 多行 Fluent 块（选择器/函数调用）：结构保留，块内变体行翻译文本
- 输出到 l10n/zh-MS（先备份旧版，git 历史也可回滚）
- 生成后全量 Fluent 语法校验

用法：
    python3 batch-hard.py                # 全量
    python3 batch-hard.py --limit 3      # 试跑前 3 个文件
    python3 batch-hard.py --check        # 只校验不生成
"""

import argparse
import importlib.util
import re
import shutil
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
EN_DIR = Path(
    "/home/chen/Vantage/librewolf-153.0-6/obj-x86_64-pc-linux-gnu/dist/bin/browser/localization/en-US"
)
# toolkit/crashreporter/services 的 en-US 源（从顶层 omni.ja 提取）
TOOLKIT_EN_DIR = Path(__file__).resolve().parent / "en-toolkit" / "localization" / "en-US"
OUT_DIR = Path("/home/chen/Vantage/l10n/zh-MS")
SKIP_FILES = {"regionNames.ftl"}  # 地名/品牌定义不翻


def map_rel(rel: Path) -> Path:
    """产物 flat 路径 → 仓库/构建 l10n 路径"""
    p0 = rel.parts[0]
    if p0 == "browser":
        return Path("browser") / rel  # browser/xxx → browser/browser/xxx
    if p0 == "branding":
        # branding/brand.ftl → browser/branding/official/brand.ftl
        return Path("browser/branding/official") / Path(*rel.parts[1:])
    return rel


def map_toolkit_rel(rel: Path) -> Path:
    """toolkit 树：flat toolkit/xxx → 仓库 toolkit/toolkit/xxx；crashreporter/xxx → toolkit/crashreporter/xxx"""
    return Path("toolkit") / rel

# fluent.syntax（产物树自带）
_fs = sorted(Path("/home/chen/Vantage").glob("librewolf-*/third_party/python/fluent.syntax"))
if _fs:
    sys.path.insert(0, str(_fs[-1]))

# 加载硬翻引擎
_spec = importlib.util.spec_from_file_location("ht", str(HERE / "hard-translate.py"))
ht = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(ht)

# ---------- 行级 Fluent 翻译 ----------
# key 支持 -术语、.属性（含数字后缀如 .label2）、message 数字后缀
KEY_RE = re.compile(r"^(\s*(?:\.[a-zA-Z][a-zA-Z0-9-]*|-?[a-zA-Z][a-zA-Z0-9-]*)\s*=\s*)(.*)$")
VARIANT_RE = re.compile(r"^(\s*(\[[^\]]*\]|\*\[[^\]]*\])\s*)(.*)$")
SELECTOR_HEAD_RE = re.compile(r"^\s*\{\s*[$A-Za-z-]")


def _brace_delta(line: str) -> int:
    return line.count("{") - line.count("}")


def translate_ftl(text: str) -> str:
    lines = text.split("\n")
    out = []
    i = 0
    while i < len(lines):
        s = lines[i]
        stripped = s.strip()

        # 多行 Fluent 块（选择器/函数调用）：{ 未闭合
        if _brace_delta(s) > 0:
            out.append(s)
            depth = _brace_delta(s)
            i += 1
            while i < len(lines) and depth > 0:
                ls = lines[i]
                depth += _brace_delta(ls)
                if depth <= 0:
                    out.append(ls)  # 闭合行 } 原样
                    i += 1
                    break
                mv = VARIANT_RE.match(ls)
                if mv:
                    if len(mv.group(3).strip()) == 1:
                        out.append(ls)  # accesskey 单字母保留
                    else:
                        out.append(mv.group(1) + ht.translate(mv.group(3)))
                else:
                    out.append(ls)  # 函数参数行等原样保留
                i += 1
            continue

        # 注释 / 空行：原样保留
        if stripped.startswith("#") or stripped == "":
            out.append(s)
            i += 1
            continue

        # key = value / .attr = value：只翻值
        m = KEY_RE.match(s)
        if m:
            prefix, val = m.group(1), m.group(2)
            if val.strip() == "":
                out.append(s)  # 空值（后续是多行属性）
            elif len(val.strip()) == 1:
                out.append(s)  # accesskey 单字母保留（如 .accesskey = O）
            else:
                out.append(prefix + ht.translate(val))
            i += 1
            continue

        # 选择器变体行：[one] text / *[other] text：保留变体，翻文本
        m = VARIANT_RE.match(s)
        if m:
            if len(m.group(3).strip()) == 1:
                out.append(s)  # accesskey 单字母保留
            else:
                out.append(m.group(1) + ht.translate(m.group(3)))
            i += 1
            continue

        # 选择器结构行（{ $x -> / }）：原样保留
        if SELECTOR_HEAD_RE.match(s) or stripped == "}":
            out.append(s)
            i += 1
            continue

        # 其他（多行值文本等）：整行翻译
        out.append(ht.translate(s))
        i += 1
    return "\n".join(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=0, help="只处理前 N 个文件（试跑）")
    ap.add_argument("--check", action="store_true", help="只校验现有 zh-MS 语法")
    ap.add_argument("--toolkit", action="store_true", help="翻译 toolkit/crashreporter/services 树")
    args = ap.parse_args()

    from fluent.syntax import parse
    from fluent.syntax.ast import Junk

    def check_all():
        bad = 0
        total = 0
        for p in sorted(OUT_DIR.rglob("*.ftl")):
            total += 1
            res = parse(p.read_text(encoding="utf-8"))
            junk = [e for e in res.body if isinstance(e, Junk)]
            if junk:
                bad += 1
                a = junk[0].annotations[0]
                print(f"❌ {p.relative_to(OUT_DIR)}: {junk[0].content[:60]!r} {a.code} {a.message}")
        print(f"\n🔍 语法校验: {total-bad}/{total} 通过, {bad} 有 Junk")
        return bad

    if args.check:
        check_all()
        return

    en_dir = TOOLKIT_EN_DIR if args.toolkit else EN_DIR
    rel_map = map_toolkit_rel if args.toolkit else map_rel
    files = sorted(en_dir.rglob("*.ftl"))
    files = [f for f in files if f.name not in SKIP_FILES]
    if args.limit:
        files = files[: args.limit]

    # 备份旧 zh-MS（git 历史也可回滚，双保险）
    if OUT_DIR.exists():
        bak = Path(str(OUT_DIR) + ".bak-硬翻")
        if bak.exists():
            shutil.rmtree(bak)
        shutil.copytree(OUT_DIR, bak)
        print(f"💾 旧版已备份: {bak}")

    print(f"📋 待翻译: {len(files)} 个文件（en-US → zh-MS 硬翻）\n")
    for f in files:
        rel = f.relative_to(en_dir)
        dst = OUT_DIR / rel_map(rel)
        src_text = f.read_text(encoding="utf-8")
        new_text = translate_ftl(src_text)
        if not new_text.endswith("\n"):
            new_text += "\n"  # 桶哥铁习惯：末尾换行
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_text(new_text, encoding="utf-8")
        print(f"  ✅ {rel_map(rel)}")

    print(f"\n📊 完成: {len(files)} 个文件已生成")
    bad = check_all()
    if bad == 0:
        print("🎉 全部通过！")


if __name__ == "__main__":
    main()
