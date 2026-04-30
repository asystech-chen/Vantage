#!/usr/bin/env python3
"""
Apply Vantage branding to Windows NSIS installer files.
Called from librewolf-patches.py after patches are applied.
"""
import os
import sys

srcdir = sys.argv[1] if len(sys.argv) > 1 else "."

# 1. Create setup.ico from vantage firefox.ico (for NSIS installer icon)
setup_ico_src = os.path.join(srcdir, "browser/branding/vantage/firefox.ico")
setup_ico_dst = os.path.join(srcdir, "browser/branding/vantage/setup.ico")
if os.path.exists(setup_ico_src):
    import shutil
    shutil.copy2(setup_ico_src, setup_ico_dst)
    print(f">>> Created {setup_ico_dst}")

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

# 3. Add setup.ico to BRANDING_FILES in Makefile.in
makefile_path = os.path.join(srcdir, "browser/installer/windows/Makefile.in")
if os.path.exists(makefile_path):
    with open(makefile_path, "r") as f:
        lines = f.readlines()
    
    already_has_setup = any("setup.ico" in line for line in lines)
    if not already_has_setup:
        for i, line in enumerate(lines):
            if line.strip() == "firefox64.ico \\":
                lines.insert(i + 1, "\tsetup.ico \\\n")
                with open(makefile_path, "w") as f:
                    f.writelines(lines)
                print(">>> Makefile.in: added setup.ico to BRANDING_FILES")
                break
    else:
        print(">>> Makefile.in: setup.ico already in BRANDING_FILES")
else:
    print(f">>> SKIP: {makefile_path} not found")
