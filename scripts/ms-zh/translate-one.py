#!/usr/bin/env python3
# 一次性翻译 migrationWizard.ftl（完整文件，不分块）
import importlib.util, urllib.request, json, os, re, sys

spec = importlib.util.spec_from_file_location('p', 'ms_prompt.py')
pm = importlib.util.module_from_spec(spec); spec.loader.exec_module(pm)

def get_key():
    try:
        for line in open(os.path.expanduser("~/.bashrc"), encoding="utf-8"):
            if line.strip().startswith("export DEEPSEEK_API_KEY="):
                return line.strip().split("=", 1)[1].strip().strip('"').strip("'")
    except FileNotFoundError:
        pass
    return os.environ.get("DEEPSEEK_API_KEY", "")

key = get_key()
src_path = os.path.expanduser("~/Vantage/librewolf-153.0-5/obj-x86_64-pc-linux-gnu/dist/bin/browser/localization/en-US/browser/migrationWizard.ftl")
chunk = open(src_path).read()
print(f"文件大小: {len(chunk)} 字符")

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
with urllib.request.urlopen(req, timeout=300) as r:
    d = json.loads(r.read())
trans = d["choices"][0]["message"]["content"]
print("finish_reason:", d["choices"][0].get("finish_reason"))
print(f"译文长度: {len(trans)}")

# 写入产物
out_path = os.path.expanduser("~/Vantage/l10n/zh-MS/browser/migrationWizard.ftl")
os.makedirs(os.path.dirname(out_path), exist_ok=True)
open(out_path, "w", encoding="utf-8").write(trans)
print("✅ 已写入:", out_path)
