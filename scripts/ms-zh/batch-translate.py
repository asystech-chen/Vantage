#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Vantage「中文（巨硬）」批量翻译器
=================================
把 en-US 的 Firefox/Vantage ftl 字符串批量翻译成微软式中文（zh-MS 语言包）。

- 完全本地执行：直接调用 DeepSeek API（OpenAI 兼容），API key 只从环境变量读取
- 分块翻译：大文件按行分块，避免超上下文/输出上限
- 断点续传：输出文件已存在则跳过（失败重试）
- 结构保护：翻译后校验占位符/标签完整性，缺失则重试

用法：
    export DEEPSEEK_API_KEY=sk-xxx
    python3 batch-translate.py                     # 翻译全部文件
    python3 batch-translate.py --files browser.ftl # 只翻译指定文件
    python3 batch-translate.py --limit 3           # 只翻译前 3 个文件（试跑）
    python3 batch-translate.py --model deepseek-chat   # 指定模型
"""

import argparse
import json
import os
import re
import sys
import time
from pathlib import Path

# 允许从任意 cwd 运行
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from ms_prompt import SYSTEM_PROMPT_EN2ZH

# 输入：编译产物的 en-US 语言树
EN_DIR = Path(
    os.environ.get(
        "VANTAGE_EN_DIR",
        str(HERE.parent.parent)
        + "/librewolf-153.0-5/obj-x86_64-pc-linux-gnu/dist/bin/browser/localization/en-US",
    )
)
# 输出：l10n/zh-MS（Vantage 增量覆盖目录）
OUT_DIR = Path(os.environ.get("VANTAGE_OUT_DIR", str(HERE.parent.parent) + "/l10n/zh-MS"))

# 跳过文件（非 UI 文本/无需翻译）
SKIP_FILES = {
    "regionNames.ftl", "brandings.ftl",
}

CHUNK_LINES = 120          # 每个请求的文本行数
MAX_RETRY = 2              # 失败重试次数
RETRY_DELAY = 3            # 重试间隔秒
RATE_LIMIT_DELAY = 0.5     # 请求间隔（防 429）


def load_ftl(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def split_chunks(text: str, max_lines: int = CHUNK_LINES):
    """按行分块，保持行完整性（注释/空行与上下文一起）"""
    lines = text.split("\n")
    chunks = []
    for i in range(0, len(lines), max_lines):
        chunks.append("\n".join(lines[i : i + max_lines]))
    return chunks


def call_api(chunk: str, model: str, api_key: str) -> str:
    """调用 DeepSeek API 翻译一个 chunk，返回翻译后的文本"""
    import urllib.request

    endpoint = "https://api.deepseek.com/chat/completions"
    payload = {
        "model": model,
        "messages": [
            {"role": "system", "content": SYSTEM_PROMPT_EN2ZH},
            # 只发待翻译文本，不加任何额外指令（省 token，规则全在 system 里）
            {"role": "user", "content": chunk},
        ],
        # 关闭思考模式：v4-flash 默认会思考，吃掉全部 max_tokens 导致输出为空
        "thinking": {"type": "disabled"},
        "temperature": 1.0,
        "max_tokens": 8192,
        "stream": False,
    }
    req = urllib.request.Request(
        endpoint,
        data=json.dumps(payload).encode("utf-8"),
        headers={
            "Content-Type": "application/json",
            "Authorization": f"Bearer {api_key}",
        },
    )
    with urllib.request.urlopen(req, timeout=180) as resp:
        data = json.loads(resp.read().decode("utf-8"))
    content = data["choices"][0]["message"]["content"]
    if not content:
        # 诊断：打印响应结构帮助排查
        fin = data.get("usage", {})
        print(f"[空响应] usage={fin} finish={data['choices'][0].get('finish_reason')}")
        return ""
    return content


# ---- 结构保护校验 ----

PLACEHOLDER_RE = re.compile(r"\{[^{}]*\}")
TAG_RE = re.compile(r"</?[a-zA-Z][^>]*>")
ATTR_RE = re.compile(r"^\s*\.[a-zA-Z-]+\s*=")
KEY_RE = re.compile(r"^[a-zA-Z0-9-]+\s*=")


def extract_blocks(text: str):
    """提取所有完整的 {…} 块（括号配对扫描，支持 Fluent 选择器多行嵌套）"""
    blocks = []
    i, n = 0, len(text)
    while i < n:
        if text[i] == "{":
            depth = 1
            j = i + 1
            while j < n and depth > 0:
                if text[j] == "{":
                    depth += 1
                elif text[j] == "}":
                    depth -= 1
                j += 1
            blocks.append(text[i:j])
            i = j
        else:
            i += 1
    return blocks


def block_signature(block: str):
    """块的结构签名：
    - 普通占位符 { $x }：用规范化文本签名（删了/改了会检测到）
    - 选择器块 { $x -> ... }：拆内部叶子变量 + 选择器标记（-> / 变体标签）
    """
    inner = block[1:-1]  # 去掉最外层 { }
    arrows = block.count("->")
    variants = tuple(sorted(re.findall(r"[\[\*]\s*([^\]]+)", block)))
    if arrows == 0:
        # 普通占位符（无选择器）：本身就是叶子
        norm = re.sub(r"\s+", " ", inner).strip()
        return (("P:" + norm,), 0, ())
    # 选择器块：只校验内部叶子变量 + 结构标记（块内文案可翻译）
    leaves = tuple(sorted(PLACEHOLDER_RE.findall(inner)))
    return (leaves, arrows, variants)


def extract_placeholders(text: str):
    """校验用：原文所有块的签名集合 + HTML 标签集合"""
    sigs = [block_signature(b) for b in extract_blocks(text)]
    tags = set(TAG_RE.findall(text))
    return sigs, tags


def restore_comments(original: str, translated: str) -> str:
    """将原文的注释行（# 开头）按顺序覆盖回译文。
    策略：遍历译文行，遇到 # 行时用原文下一个注释行替换。"""
    o_lines = original.split("\n")
    t_lines = translated.split("\n")
    oi = 0
    out = []
    for tl in t_lines:
        if tl.strip().startswith("#"):
            # 找原文下一个注释行
            while oi < len(o_lines) and not o_lines[oi].strip().startswith("#"):
                oi += 1
            if oi < len(o_lines):
                out.append(o_lines[oi])
                oi += 1
            else:
                out.append(tl)  # 原文没有更多注释，保留译文行
        else:
            out.append(tl)
    return "\n".join(out)


def validate_chunk(original: str, translated: str) -> bool:
    """校验占位符/选择器/标签结构完整（注释由 restore_comments 负责）"""
    if not translated.strip():
        print("    ⚠️ 译文为空")
        return False
    orig_sigs, orig_tags = extract_placeholders(original)
    trans_sigs, trans_tags = extract_placeholders(translated)
    # 原文每个块签名必须出现在译文（顺序允许变化，但 Fluent 一般保序）
    missing_sigs = [s for s in orig_sigs if s not in trans_sigs]
    if missing_sigs:
        print(f"    ⚠️ 丢失/改动占位符结构: {missing_sigs[:3]}")
        return False
    # HTML 标签集合必须覆盖原文
    missing_tags = orig_tags - trans_tags
    if missing_tags:
        print(f"    ⚠️ 丢失 HTML 标签: {missing_tags}")
        return False
    # 行数不能差太多（防止 LLM 合并/拆分行导致结构错乱）
    o_lines = [l for l in original.split("\n") if l.strip()]
    t_lines = [l for l in translated.split("\n") if l.strip()]
    if len(t_lines) < len(o_lines) * 0.8:
        print(f"    ⚠️ 行数异常: {len(o_lines)} → {len(t_lines)}")
        return False
    return True


def translate_file(src_path: Path, dst_path: Path, model: str, api_key: str) -> bool:
    """翻译单个文件，返回是否成功"""
    if dst_path.exists():
        print(f"  ⏭️  跳过（已存在）: {dst_path.name}")
        return True

    src_text = load_ftl(src_path)
    chunks = split_chunks(src_text)
    print(f"  📄 {src_path.name}: {len(src_text)} 字符, {len(chunks)} 块")

    out_parts = []
    for i, chunk in enumerate(chunks):
        ok = False
        for attempt in range(MAX_RETRY + 1):
            try:
                print(f"    ⏳ 块 {i+1}/{len(chunks)} (尝试 {attempt+1})...", end=" ", flush=True)
                translated = call_api(chunk, model, api_key)
                if validate_chunk(chunk, translated):
                    # 注释还原（原文 # 行覆盖译文对应行）
                    translated = restore_comments(chunk, translated)
                    out_parts.append(translated)
                    print("✅")
                    ok = True
                    break
                print("❌ 校验失败，重试")
            except Exception as e:
                print(f"❌ {e}")
            time.sleep(RETRY_DELAY * (attempt + 1))
        if not ok:
            print(f"    💥 文件 {src_path.name} 块 {i+1} 翻译失败，跳过")
            return False
        time.sleep(RATE_LIMIT_DELAY)

    # 写入输出（每个 chunk 已做过注释还原）
    dst_path.parent.mkdir(parents=True, exist_ok=True)
    dst_path.write_text("\n".join(out_parts), encoding="utf-8")
    print(f"  ✅ 完成: {dst_path.relative_to(OUT_DIR)}")
    return True


def main():
    parser = argparse.ArgumentParser(description="Vantage zh-MS 批量翻译器")
    parser.add_argument("--files", nargs="*", help="只翻译指定文件名")
    parser.add_argument("--limit", type=int, help="最多翻译 N 个文件（试跑）")
    parser.add_argument("--model", default=os.environ.get("DEEPSEEK_MODEL", "deepseek-v4-flash"))
    parser.add_argument("--en-dir", default=str(EN_DIR))
    parser.add_argument("--out-dir", default=str(OUT_DIR))
    args = parser.parse_args()

    api_key = os.environ.get("DEEPSEEK_API_KEY")
    if not api_key:
        print("❌ 请先设置环境变量 DEEPSEEK_API_KEY")
        sys.exit(1)

    en_dir = Path(args.en_dir)
    out_dir = Path(args.out_dir)
    if not en_dir.is_dir():
        print(f"❌ en-US 目录不存在: {en_dir}")
        sys.exit(1)

    files = sorted(en_dir.rglob("*.ftl"))
    files = [f for f in files if f.name not in SKIP_FILES]
    if args.files:
        wanted = set(args.files)
        files = [f for f in files if f.name in wanted]
    if args.limit:
        files = files[: args.limit]

    print(f"🔑 模型: {args.model}")
    print(f"📥 输入: {en_dir}")
    print(f"📤 输出: {out_dir}")
    print(f"📋 待翻译: {len(files)} 个文件\n")

    ok_count = 0
    fail_count = 0
    for f in files:
        rel = f.relative_to(en_dir)
        dst = out_dir / rel
        try:
            if translate_file(f, dst, args.model, api_key):
                ok_count += 1
            else:
                fail_count += 1
        except KeyboardInterrupt:
            print("\n⏹ 用户中断。已完成的文件保留，可断点续传。")
            sys.exit(130)

    print(f"\n📊 完成: {ok_count} 成功, {fail_count} 失败")
    if fail_count:
        print("💡 重新运行脚本可跳过已完成的文件（断点续传）")


if __name__ == "__main__":
    main()
