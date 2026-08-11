#!/usr/bin/env python3
# 调试：复现 migrationWizard.ftl 块 2 完整翻译
import importlib.util, urllib.request, json, os, re, sys

spec = importlib.util.spec_from_file_location('p', 'ms_prompt.py')
pm = importlib.util.module_from_spec(spec); spec.loader.exec_module(pm)
spec2 = importlib.util.spec_from_file_location('b', 'batch-translate.py')
bm = importlib.util.module_from_spec(spec2); spec2.loader.exec_module(bm)

def get_key():
    try:
        for line in open(os.path.expanduser("~/.bashrc"), encoding="utf-8"):
            m = re.search(r"export DEEPSEEK_API_KEY=(sk-[A-Za-z0-9]+)", line)
            if m:
                return m.group(1)
    except FileNotFoundError:
        pass
    return os.environ.get("DEEPSEEK_API_KEY", "")

key = get_key()
src = open(os.path.expanduser("~/Vantage/librewolf-153.0-5/obj-x86_64-pc-linux-gnu/dist/bin/browser/localization/en-US/browser/migrationWizard.ftl")).read()
chunk = "\n".join(src.split("\n")[120:240])  # 块 2

print("=== 原文块 2（行 121-240）===")
print(chunk[:500], "...\n")

payload = {
    "model": "deepseek-v4-flash",
    "messages": [
        {"role": "system", "content": pm.SYSTEM_PROMPT_EN2ZH},
        {"role": "user", "content": chunk},
    ],
    "thinking": {"type": "disabled"},
    "temperature": 1.0,
    "max_tokens": 8192,
    "stream": False,
}
req = urllib.request.Request("https://api.deepseek.com/chat/completions",
    data=json.dumps(payload).encode(),
    headers={"Content-Type": "application/json", "Authorization": f"Bearer {key}"})
with urllib.request.urlopen(req, timeout=180) as r:
    d = json.loads(r.read())
trans = d["choices"][0]["message"]["content"]
print("=== 校验结果:", bm.validate_chunk(chunk, trans), "===")
if not bm.validate_chunk(chunk, trans):
    orig_sigs = bm.extract_placeholders(chunk)[0]
    trans_sigs = bm.extract_placeholders(trans)[0]
    print("原文签名:", orig_sigs)
    print("译文签名:", trans_sigs)
    # 找差异
    for s in orig_sigs:
        if s not in trans_sigs:
            print(f"  缺失签名: {s}")
print("\n=== 译文输出（前 800 字符）===")
print(trans[:800])
