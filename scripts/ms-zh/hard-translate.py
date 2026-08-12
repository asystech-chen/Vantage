#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
zh-MS 硬翻引擎 v0.1（prototype）
================================
桶哥钦定风格：词对词直译 + 保持英文语序 + 不本地化（跑偏机翻）
例：Vantage Browser → 优势浏览器

流程：保护 Fluent 占位符 → 分词 → 逐词查 ECDICT 词典（取第一释义）
     → 按原语序拼接（删英文词间空格，中文连写）

用法：
    python3 hard-translate.py "Vantage Browser"
    python3 hard-translate.py --file aboutDialog.ftl   # 翻译整个文件（prototype 只试文本）
"""

import csv
import re
import sys
from pathlib import Path

DICT_PATH = Path(__file__).resolve().parent / "dict" / "ecdict.csv"

# ---------- 词典 ----------
def load_dict():
    d = {}
    with open(DICT_PATH, encoding="utf-8") as f:
        reader = csv.reader(f)
        next(reader)  # header
        for row in reader:
            if len(row) < 4:
                continue
            word = row[0].strip().lower()
            translation = row[3].strip()
            if not word or not translation or "," in word:
                continue
            d[word] = translation
    return d


def first_def(translation: str) -> str:
    """取释义：优先 [计]（计算机）段，否则第一词性段的第一释义"""
    segs = [s.strip() for s in translation.split("\\n") if s.strip()]
    for s in segs:
        if s.startswith("[计]"):
            s2 = re.sub(r"^\[[^\]]*\]\s*", "", s)
            return re.split(r"[,;，；]", s2)[0].strip()
    if segs:
        s = re.sub(r"^(\[[^\]]*\]\s*)?([a-z]+\.\s*)+", "", segs[0])
        return re.split(r"[,;，；]", s)[0].strip()
    return ""


# ---------- 词性感知取义 ----------
# 前置词 → 推断后一个词的词性（保证词性正确，选词可乱）
POS_VERB_BEFORE = {"to", "can", "will", "would", "could", "should", "may", "might", "must",
                   "do", "does", "did", "please", "not"}
POS_VERB_BEFORE_PRONOUN = {"i", "you", "we", "they", "he", "she", "it"}
POS_NOUN_BEFORE = {"the", "a", "an", "this", "that", "these", "those", "my", "your",
                   "our", "their", "its", "his", "her", "of", "in", "on", "at",
                   "for", "with", "from", "by", "as", "into", "after", "before",
                   "between", "all", "some", "any", "no", "every", "each"}
POS_TAG_RE = re.compile(r"^((?:[a-z]+\.\s*)+)(.*)$")


def parse_segments(translation: str):
    """解析词典翻译段 → [(词性/领域标签列表, 释义文本), ...]
    支持 [计] 等领域标签段和 n./vt. 等词性段"""
    segs = []
    for s in translation.split("\\n"):
        s = s.strip()
        if not s:
            continue
        # 领域标签段：[计] xxx / [医] xxx（可多个标签）
        m = re.match(r"^(\[[^\]]*\]\s*)+(.*)$", s)
        if m and m.group(1).strip():
            tags = [t.strip() for t in re.findall(r"\[[^\]]*\]", m.group(1))]
            segs.append((tags, m.group(2).strip()))
            continue
        # 词性段：n. xxx / vt. xxx
        m = POS_TAG_RE.match(s)
        if m:
            tags = [t.rstrip(".") for t in m.group(1).split()]
            segs.append((tags, m.group(2).strip()))
        else:
            segs.append(([], s))
    return segs
def _clean_def(s: str) -> str:
    """清理释义中的领域标签（如 n. [计]xxx 内嵌的 [计]）"""
    return re.sub(r"\[[^\]]*\]", "", s).strip()


def pick_def(translation: str, pos: str | None) -> str:
    """按词性选释义；pos: 'verb' / 'noun' / None（默认第一段）"""
    segs = parse_segments(translation)
    # [计] 段优先（UI 术语语境）——但 DOS 命令段跳过
    for tags, text in segs:
        if tags and tags[0] == "[计]" and "DOS" not in text:
            return _clean_def(re.split(r"[,;，；]", text)[0])
    if pos == "verb":
        for tags, text in segs:
            if any(t in ("vt", "vi", "v") for t in tags) and "DOS" not in text:
                return _clean_def(re.split(r"[,;，；]", text)[0])
    elif pos == "noun":
        for tags, text in segs:
            if "n" in tags:
                return _clean_def(re.split(r"[,;，；]", text)[0])
    # fallback：第一段
    if segs:
        return _clean_def(re.split(r"[,;，；]", segs[0][1])[0])
    return ""


def pos_hint(tokens: list, i: int) -> str | None:
    """根据前一个词推断当前词词性"""
    if i == 0:
        return None
    prev = tokens[i - 1].lower() if tokens[i - 1].isalpha() else ""
    if prev in POS_VERB_BEFORE or prev in POS_VERB_BEFORE_PRONOUN:
        return "verb"
    if prev in POS_NOUN_BEFORE:
        return "noun"
    return None


DICT = load_dict()
print(f"📖 词典加载: {len(DICT)} 词条", file=sys.stderr)

# ---------- 覆盖词表（优先于词典）----------
OVERRIDES = {
    # 品牌/核心词
    "microsoft": "巨硬",
    "vantage": "优势",
    "browser": "浏览器",
    "computer": "计算机",
    "firefox": "火狐",
    "mozilla": "摩斯拉",
    # 经典烂梗（桶哥钦定：直接用梗，不走词典）
    "power": "功率",
    "edge": "边缘",
    "windows": "窗",
    "roll": "滚",
    "head": "头",
    "sit": "坐",
    "relax": "放宽",
    "heads": "头", "ups": "抬起", "back": "回", "rolls": "滚",
    # 高频虚词（词典释义太抽象，固定成硬翻常用义）
    "a": "一个", "an": "一个",
    "is": "是", "are": "是", "was": "曾是", "were": "曾是", "be": "是",
    "at": "在", "for": "为了", "of": "的", "in": "在",
    "the": "那", "and": "和", "to": "到", "with": "与", "by": "由",
    "from": "从", "on": "在", "your": "你的", "you": "你",
    "this": "这", "that": "那", "it": "它", "we": "我们", "our": "我们的",
    "as": "作为", "mode": "模式", "open": "打开", "save": "保存",
    "close": "关闭", "delete": "删除", "update": "更新", "download": "下载",
    "settings": "设置", "options": "选项", "search": "搜索", "privacy": "隐私",
    "security": "安全", "password": "密码", "bookmark": "书签", "tab": "标签页",
    "about": "关于", "support": "支持",
    # 高频动词（固定准确词义）
    "want": "想要", "apply": "应用", "change": "更改", "action": "操作",
    "run": "运行", "install": "安装", "create": "创建", "print": "打印",
    "ask": "询问", "remember": "记住", "trust": "信任", "use": "使用",
    "allow": "允许", "block": "阻止", "enable": "启用", "disable": "禁用",
    "cancel": "取消", "confirm": "确认", "continue": "继续", "restart": "重新启动",
    "start": "启动", "stop": "停止", "view": "查看", "show": "显示",
    "manage": "管理", "edit": "编辑", "copy": "复制", "move": "移动",
    "add": "添加", "remove": "移除", "clear": "清除", "select": "选择",
    "enter": "输入", "submit": "提交", "accept": "接受", "deny": "拒绝",
    "keep": "保持", "provide": "提供", "recommend": "推荐", "notice": "注意",
    "use": "使用", "get": "获得", "make": "使", "take": "采取",
    # 情态动词（句子骨架，必须准确）
    "can": "能", "will": "将", "would": "会", "could": "能够", "should": "应该",
    "must": "必须", "may": "可以", "might": "可能", "shall": "将",
    # 疑问词
    "what": "什么", "when": "何时", "where": "哪里", "why": "为什么",
    "how": "如何", "who": "谁", "which": "哪个", "whose": "谁的",
    # 否定/高频功能词
    "not": "不", "no": "无", "never": "从不", "always": "总是",
    "only": "仅", "just": "只是", "also": "也", "already": "已经",
    "still": "仍然", "please": "请", "please": "请",
    "they": "他们", "them": "他们", "their": "他们的", "those": "那些",
    "these": "这些", "there": "那里", "here": "这里",
    "don't": "不要", "doesn't": "不", "can't": "不能", "won't": "将不", "it's": "它是",
    # DOS 命令污染词（词典 [计] 段是 DOS 命令）
    "time": "时间", "include": "包含", "more": "更多", "shift": "移动", "home": "主页",
    "pause": "暂停", "vol": "卷", "echo": "回声", "if": "如果",
    "country": "国家", "date": "日期", "load": "加载", "break": "中断",
    "fix": "修复", "fixes": "修复", "fixed": "修复",
}

# ---------- 经典烂梗固定词组（优先于一切，整词匹配）----------
MEME_PHRASES = [
    ("heads up", "头抬起"),
    ("head up", "头抬起"),
    ("sit and relax", "坐和放宽"),
    ("sit back and relax", "坐和放宽"),
    ("roll back", "滚回"),
    ("rolls back", "滚回"),
    ("rolled back", "滚回"),
    ("microsoft edge", "巨硬边缘"),
    ("windows 11", "窗11"),
    ("windows 10", "窗10"),
]

# ---------- 词形还原（变形词 → 原形，保证词性/词义正确）----------
IRREGULAR = {
    "is": "be", "are": "be", "was": "be", "were": "be", "been": "be",
    "has": "have", "had": "have", "does": "do", "did": "do",
    "went": "go", "gone": "go", "made": "make", "took": "take", "taken": "take",
    "got": "get", "came": "come", "ran": "run", "saw": "see", "seen": "see",
    "gave": "give", "found": "find", "told": "tell", "said": "say",
    "used": "use", "written": "write", "wrote": "write", "bought": "buy",
    "built": "build", "sent": "send", "left": "leave", "kept": "keep",
    "held": "hold", "met": "meet", "lost": "lose", "paid": "pay",
    "shown": "show", "spent": "spend", "thought": "think", "tried": "try",
    "tries": "try", "running": "run", "runs": "run", "saving": "save",
    "saved": "save", "saves": "save", "changed": "change", "changes": "change",
    "changing": "change", "websites": "website", "files": "file", "tabs": "tab",
    "pages": "page", "bookmarks": "bookmark", "updates": "update",
    "downloads": "download", "extensions": "extension", "cookies": "cookie",
    "buttons": "button", "menus": "menu", "links": "link", "items": "item",
    "options": "option", "profiles": "profile", "sessions": "session",
    "permissions": "permission", "features": "feature", "folders": "folder",
    "searches": "search", "results": "result", "messages": "message",
    "settings": "setting", "windows": "window", "trying": "try",
    "browsing": "browse", "browsed": "browse", "applied": "apply",
    "applies": "apply", "installing": "install", "installed": "install",
    "created": "create", "creating": "create", "closed": "close", "closing": "close",
    "deleted": "delete", "deleting": "delete", "enabled": "enable",
    "disabled": "disable", "allowed": "allow", "blocked": "block",
    "restarted": "restart", "restarting": "restart", "started": "start",
    "stopped": "stop", "opened": "open", "opening": "open", "sure": "sure",
    "wants": "want", "needs": "need", "uses": "use", "allows": "allow",
    "requires": "require", "provides": "provide", "shows": "show",
    "opens": "open", "closes": "close", "saves": "save", "deletes": "delete",
    "blocks": "block", "enables": "enable", "disables": "disable",
    "installs": "install", "starts": "start", "stops": "stop", "keeps": "keep",
    "makes": "make", "takes": "take", "gets": "get", "knows": "know",
    "asks": "ask", "remembers": "remember", "trusts": "trust",
    "continues": "continue", "creates": "create", "applies": "apply",
    "works": "work", "means": "mean", "contains": "contain", "includes": "include",
}


def lemmatize(word: str) -> str:
    """变形词还原为原形（不规则表 + 保守规则）"""
    w = word.lower()
    if w in IRREGULAR:
        return IRREGULAR[w]
    # 保守规则：第三人称单数 / 复数去 s/es（排除常见误伤）
    if len(w) > 4:
        if w.endswith("ies") and w not in ("ties", "movies"):
            return w[:-3] + "y"
        if w.endswith("es") and not w.endswith(("ss", "zz", "us", "is", "sh", "ch", "x", "o")):
            return w[:-2]
        if w.endswith("s") and not w.endswith(("ss", "us", "is", "as", "os")):
            return w[:-1]
    return w

# ---------- 词组表（长文本专用：常用词组 → 正常中文）----------
# 长段落先做最长匹配词组替换，剩余单词再词典硬翻
# 效果：正常词组 + 硬翻单词 = 第一眼不知所云、细看能懂
PHRASES = [
    ("working together", "共同努力"),
    ("keep the web open", "保持万维网开放"),
    ("global community", "全球社区"),
    ("accessible to", "对...可访问"),
    ("due to", "由于"),
    ("check for updates", "检查更新"),
    ("internal error", "内部错误"),
    ("by default", "默认情况下"),
    ("is designed by", "由...设计"),
    ("update available", "有可用更新"),
    ("new version", "新版本"),
    ("enhanced tracking protection", "增强跟踪保护"),
    ("tracking protection", "跟踪保护"),
    ("in strict mode", "在严格模式下"),
    ("state partitioning", "状态分区"),
    ("do not recommend", "不推荐"),
    ("one of the most", "最重要的"),
    ("in the browser", "在浏览器中"),
    ("privacy features", "隐私功能"),
    ("visit the official site", "访问官方网站"),
    ("official site", "官方网站"),
    ("restart to update", "重启以更新"),
    ("is made by", "由...制作"),
    ("open, public and accessible", "开放、公开和可访问"),
    ("to all", "对所有人"),
    ("a different mode", "不同的模式"),
    # 中等句子常用结构（确认框/简短描述）
    ("are you sure", "你确定"),
    ("you want", "你想要"),
    ("close all tabs", "关闭所有标签页"),
    ("this action", "此操作"),
    ("cannot be undone", "无法撤销"),
    ("do you want", "你是否想要"),
    ("save the changes", "保存更改"),
    ("delete all", "删除所有"),
    ("site data", "站点数据"),
    ("cookies and site data", "Cookie 和站点数据"),
    ("will restart", "将重启"),
    ("apply your changes", "应用你的更改"),
    ("to apply", "以应用"),
    ("create a new profile", "创建新配置文件"),
    ("this will close", "这将关闭"),
    ("the current session", "当前会话"),
    ("with your permission", "经你许可"),
    ("only with", "仅经"),
    ("up to date", "已是最新"),
    ("you are running", "你正在运行"),
    ("the latest version", "最新版本"),
    ("make sure", "确保"),
    ("before continuing", "继续之前"),
    ("open a new window", "打开新窗口"),
    ("always ask", "始终询问"),
    ("never remember", "从不记住"),
    ("browsing history", "浏览历史"),
    ("this site", "此站点"),
    ("you trust", "你信任"),
    ("in your browser", "在你的浏览器中"),
    ("when firefox starts", "当 Firefox 启动时"),
    ("is trying to", "正尝试"),
    ("install an add-on", "安装附加组件"),
    ("the current", "当前"),
]

# ---------- 保护 ----------
# Fluent 占位符 { $var }、术语 { -brand }、函数 { DATETIME(...) }、HTML 标签、
# 以及裸变量引用 $var / 术语引用 -brand-name
PROTECT_RE = re.compile(
    r"\{[^{}]*\}|<[^>]*>|[A-Za-z_]+\('[^)]*\)|"
    r"add-on\b|min-width\b|max-width\b|\.[a-z]{2,4}\b|"
    r"\b(?:Ctrl|Control|Shift|Alt|Esc|Cmd|Option|Meta|Tab|Enter|Return|Backspace|Delete|PageUp|PageDown|Arrow|⌘|⌃|⇧|⌥)\b(?:\+[A-Za-z0-9+ ]*)?|"
    r"\b[A-Z]{2,}\b|"
    r"\$[a-zA-Z][a-zA-Z0-9]*|-[a-z][a-z0-9-]*(?=[\s.}，。；：！？)])"
)
def hard_translate(text: str, phrase_mode: bool = False) -> str:
    text = text.replace("\u2019", "'").replace("\u2018", "'")  # 弯引号归一化（Don\u2019t → Don't）
    parts = []

    # 经典烂梗整串替换（优先，任意长度文本都生效）
    for ph, cn in MEME_PHRASES:
        text = re.sub(
            rf"(?<!\w){re.escape(ph)}(?!\w)", f"\x02{cn}\x02", text, flags=re.I
        )

    # 词组替换（仅长文本模式）：\x02中文\x02 哨兵保护
    if phrase_mode:
        for ph, cn in sorted(PHRASES, key=lambda x: -len(x[0].split())):
            text = re.sub(
                rf"(?<!\w){re.escape(ph)}(?!\w)", f"\x02{cn}\x02", text, flags=re.I
            )

    def repl(m):
        parts.append(m.group(0))
        return f"\x01{len(parts)-1}\x01"

    text2 = PROTECT_RE.sub(repl, text)

    # 分词：词组哨兵 / 保护哨兵 / 英文单词 / 其他（标点、空格）
    tokens = re.findall(r"\x02[^\x02]*\x02|\x01\d+\x01|[A-Za-z\x27]+|[^A-Za-z\x27]", text2)

    # 纯英文 token 列表（用于词性推断，跳过哨兵）
    alpha_idx = [i for i, t in enumerate(tokens) if re.fullmatch(r"[A-Za-z']+", t)]

    out = []
    for i, t in enumerate(tokens):
        if t.startswith("\x02") and t.endswith("\x02"):
            out.append(t[1:-1])  # 词组结果
        elif t.startswith("\x01") and t.endswith("\x01"):
            out.append(parts[int(t[1:-1])])
        elif re.fullmatch(r"[A-Za-z']+", t):
            w = OVERRIDES.get(t.lower())
            if w is None:
                stem = lemmatize(t)
                w = OVERRIDES.get(stem)  # 还原后查 override（wants→want→想要）
                if w is None:
                    d = DICT.get(stem) or DICT.get(t.lower())
                    if d:
                        # 词性推断：取当前词在 alpha 序列中的前一个
                        ai = alpha_idx.index(i)
                        prev = tokens[alpha_idx[ai - 1]] if ai > 0 else None
                        pos = pos_hint([prev or ""], 1) if prev else None
                        w = pick_def(d, pos)
                    else:
                        w = None
            out.append(w if w else t)  # 未登录词保留原文
        else:
            out.append(t)  # 标点/空格

    result = "".join(out)
    # 删除词间空格（中文连写）：空格前后都是非 ASCII 时删除
    result = re.sub(r"(?<=[^\x00-\x7f])\s+(?=[^\x00-\x7f])", "", result)
    return result


def translate(text: str) -> str:
    """自动模式：>4 词走词组+硬翻混合（更可懂），短文本纯硬翻（跑偏）"""
    word_count = len(re.findall(r"[A-Za-z]+", text))
    return hard_translate(text, phrase_mode=word_count > 4)


# ---------- main ----------
if __name__ == "__main__":
    if len(sys.argv) > 2 and sys.argv[1] == "--file":
        p = Path(sys.argv[2])
        print(f"📄 翻译文件: {p}", file=sys.stderr)
        print(hard_translate(p.read_text(encoding="utf-8")))
    elif len(sys.argv) > 1:
        for s in sys.argv[1:]:
            print(f"EN: {s}")
            print(f"硬: {hard_translate(s)}")
            print()
    else:
        # 内置测试
        tests = [
            "Vantage Browser",
            "Please restart your computer",
            "Heads up",
            "Sit and relax",
            "Are you sure you want to delete this file?",
            "Update available. Visit the official site to download.",
            "Settings",
            "Privacy and security",
            "Search",
        ]
        for s in tests:
            print(f"EN: {s}")
            print(f"硬: {hard_translate(s)}")
            print()
