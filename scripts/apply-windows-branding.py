#!/usr/bin/env python3
"""
Apply Vantage branding to Windows NSIS installer files.
Called from librewolf-patches.py after patches are applied.
"""
import os
import sys

srcdir = sys.argv[1] if len(sys.argv) > 1 else "."

# 1. Overwrite Firefox's original setup.ico with Vantage icon
#    (TOOLKIT_NSIS_FILES copies this to instgen, so branding-dir copy gets overwritten)
setup_ico_src = os.path.join(srcdir, "browser/branding/vantage/firefox.ico")
toolkit_setup_ico = os.path.join(srcdir, "toolkit/mozapps/installer/windows/nsis/setup.ico")
branding_setup_ico = os.path.join(srcdir, "browser/branding/vantage/setup.ico")
if os.path.exists(setup_ico_src):
    import shutil
    shutil.copy2(setup_ico_src, toolkit_setup_ico)
    shutil.copy2(setup_ico_src, branding_setup_ico)
    print(f">>> setup.ico: replaced Firefox icon with Vantage icon")

# 2. Update defines.nsi.in - replace Firefox references with Vantage
defines_path = os.path.join(srcdir, "browser/installer/windows/nsis/defines.nsi.in")
if os.path.exists(defines_path):
    with open(defines_path, "r") as f:
        content = f.read()
    
    replacements = {
        '!define AppName               "Firefox"': '!define AppName               "Vantage"',
        '!define AppRegName            "Firefox"': '!define AppRegName            "Vantage"',
        '!define BrandProductName      "Firefox"': '!define BrandProductName      "Vantage"',
        '!define CERTIFICATE_NAME            "Mozilla Corporation"': '!define CERTIFICATE_NAME            "ASYS Technology"',
        '!define CERTIFICATE_NAME_PREVIOUS   "Mozilla Corporation"': '!define CERTIFICATE_NAME_PREVIOUS   "ASYS Technology"',
    }
    
    changed = False
    for old, new in replacements.items():
        if old in content:
            content = content.replace(old, new)
            print(f">>> defines.nsi.in: replaced {old.split('!define')[1].strip().split()[0]}")
            changed = True
    
    if changed:
        with open(defines_path, "w") as f:
            f.write(content)
    else:
        print(">>> defines.nsi.in: no changes needed (already branded)")
else:
    print(f">>> SKIP: {defines_path} not found")

# 3. Replace Mozilla branding in module.ver (version info for vantage.exe)
module_ver_path = os.path.join(srcdir, "browser/app/module.ver")
if os.path.exists(module_ver_path):
    with open(module_ver_path, "r", encoding="latin-1") as f:
        content = f.read()
    
    changed = False
    replacements = [
        ("WIN32_MODULE_COMPANYNAME=Mozilla Corporation",
         "WIN32_MODULE_COMPANYNAME=ASYS Technology"),
        ("WIN32_MODULE_COPYRIGHT=\xa9Firefox and Mozilla Developers; available under the MPL 2 license.",
         "WIN32_MODULE_COPYRIGHT=\xa9ASYS Technology; available under the MPL 2 license."),
        ("WIN32_MODULE_TRADEMARKS=Firefox is a Trademark of The Mozilla Foundation.",
         "WIN32_MODULE_TRADEMARKS=Vantage is a Trademark of ASYS Technology."),
    ]
    for old, new in replacements:
        if old in content:
            content = content.replace(old, new)
            changed = True
            key = old.split("=")[0]
            print(f">>> module.ver: replaced {key}")
    
    if changed:
        with open(module_ver_path, "w", encoding="latin-1") as f:
            f.write(content)
    else:
        print(">>> module.ver: no changes needed (already branded)")
else:
    print(f">>> SKIP: {module_ver_path} not found")
