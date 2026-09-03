#!/usr/bin/env python3

#
# The script that patches the firefox source into the librewolf source.
#


import os
import shutil
import sys
import json
import optparse
import time
import glob as _g
import subprocess
from pathlib import Path
from tempfile import TemporaryDirectory


#
# general functions, skip these, they are not that interesting
#

start_time = time.time()
parser = optparse.OptionParser()
parser.add_option('-n', '--no-execute', dest='no_execute', default=False, action="store_true")
parser.add_option('-P', '--no-settings-pane', dest='settings_pane', default=True, action="store_false")
options, args = parser.parse_args()


def script_exit(statuscode):
    if (time.time() - start_time) > 60:
        # print elapsed time
        elapsed = time.strftime("%H:%M:%S", time.gmtime(time.time() - start_time))
        print("\n\aElapsed time: {elapsed}")
        sys.stdout.flush()

    sys.exit(statuscode)

def exec(cmd, exit_on_fail = True, do_print = True):
    if cmd != '':
        if do_print:
            print(cmd)
            sys.stdout.flush()
        if not options.no_execute:
            retval = os.system(cmd)
            if retval != 0 and exit_on_fail:
                print("fatal error: command '{}' failed".format(cmd))
                sys.stdout.flush()
                script_exit(1)
            return retval
        return None

PATCH_BIN = shutil.which("gpatch") or "patch"


def check_rejects(patchfile):
    """Fails the build when rejected hunks (.rej) are left in the source
    tree.  GNU patch exits 1 both for "already applied" (--forward, safe to
    skip) and for partially failed hunks that were saved as .rej files.
    Only the latter must abort: the build would otherwise "succeed" with
    code silently missing from the final product."""
    cmd = "find . -name '*.rej' -type f 2>/dev/null"
    out = os.popen(cmd).read().strip()
    if out:
        print(
            "fatal error: patch '{}' did not apply cleanly -- rejected".format(patchfile)
            + " hunks (.rej) left in the source tree:\n{}".format(out)
        )
        print(
            "The affected code is missing from the build output. Rebase the"
            + " patch on the new source before building."
        )
        sys.stdout.flush()
        script_exit(1)


def patch(patchfile):
    cmd = "{} --forward --binary -p1 -i {}".format(PATCH_BIN, patchfile)
    print("\n*** -> {}".format(cmd))
    sys.stdout.flush()
    if not options.no_execute:
        proc = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        if proc.stdout:
            print(proc.stdout, end="")
        if proc.stderr:
            print(proc.stderr, end="")
        actual_rc = proc.returncode
        if actual_rc > 1:
            print("fatal error: patch '{}' failed".format(patchfile))
            sys.stdout.flush()
            script_exit(1)
        if actual_rc == 1:
            output = ((proc.stdout or "") + (proc.stderr or "")).lower()
            if "failed" in output:
                # Some hunks did not apply and were saved as .rej files: the
                # build would "succeed" with code missing from the product.
                check_rejects(patchfile)
            else:
                # --forward detected the patch as already applied
                # ("previously applied ... Skipping").  GNU patch still
                # writes .rej files for the skipped hunks; remove those
                # harmless leftovers so later scans stay clean.
                os.system(
                    "find . -name '*.rej' -type f -delete 2>/dev/null"
                )

def enter_srcdir(_dir = None):
    if _dir == None:
        dir = "librewolf-{}-{}".format(version, release)
    else:
        dir = _dir
    print("cd {}".format(dir))
    sys.stdout.flush()
    if not options.no_execute:
        try:
            os.chdir(dir)
        except:
            print("fatal error: can't change to '{}' folder.".format(dir))
            sys.stdout.flush()
            script_exit(1)
        
def leave_srcdir():
    print("cd ..")
    sys.stdout.flush()
    if not options.no_execute:
        os.chdir("..")


        
#
# This is the only interesting function in this script
#


def librewolf_patches():

    enter_srcdir()

    # remove OpenAI integration
    exec('rm -vf toolkit/components/ml/content/backends/OpenAIPipeline.mjs')
    exec('rm -vrf toolkit/components/ml/vendor/openai')
    
    # create the right mozconfig file..
    exec('cp -v ../assets/mozconfig.new mozconfig')

    # copy branding files..
    exec("cp -r ../themes/browser .")

    # copy the right search-config.json file
    exec('cp -v ../assets/search-config.json services/settings/dumps/main/search-config.json')

    # .rc 文件可能来自 Windows 端，转换为 LF 避免 fix-7zsfx-branding 失败
    # (patch --binary 已处理其他文件的 CRLF 兼容)
    print("-> Converting .rc files to LF...")
    exec('find . -name "*.rc" | xargs -r dos2unix -q 2>/dev/null; true')

    # read lines of .txt file into 'patches'
    with open('../assets/patches.txt'.format(version), "r") as f:
        for line in f.readlines():
            patch('../'+line.strip())

    # Fix cargo checksum for rust-build.patch (modifies x_user_defined.rs)

    # Apply Windows NSIS branding fixes
    exec('python3 ../scripts/apply-windows-branding.py .')

    # apply xmas.patch seperately because not all builders use this repo the same way, and
    # we don't want to disturbe those workflows.
    patch('../patches/xmas.patch')


    # vs_pack.py issue... should be temporary
    exec('cp -v ../patches/pack_vs.py build/vs/')


    #
    # Apply most recent `settings` repository files.
    #

    exec('mkdir -p lw')
    enter_srcdir('lw')
    exec('cp -v ../../settings/librewolf.cfg .')
    exec('cp -v ../../settings/distribution/policies.json .')
    exec('cp -v ../../settings/defaults/pref/local-settings.js .')

    # distribution files for Windows installer optional extensions
    exec('mkdir -p optional-extensions')
    exec('cp -v ../../settings/distribution/setup.ini .')
    exec('cp -v ../../settings/distribution/optional-extensions/*.xpi optional-extensions/ 2>/dev/null; true')

    # Window, windows builds use setup.ini for optional extensions,
    # so strip them from policies.json to avoid force-installing duplicates.
    if _g.glob('optional-extensions/*.xpi'):
        print("-> Windows build detected: stripping optional extensions from policies.json")
        _pj = 'policies.json'
        with open(_pj) as f:
            _data = json.load(f)
        _ext = _data['policies']['ExtensionSettings']
        for _id in list(_ext.keys()):
            if _id.startswith('idcac-pub@') or _id.startswith('{9350bc42-') or _id.startswith('{b184d107-'):
                del _ext[_id]
                print(f"   removed: {_id}")
        with open(_pj, 'w') as f:
            json.dump(_data, f, indent=2)
            f.write('\n')

    # Write moz.build to include distribution files in the build
    with open('moz.build', 'w') as f:
        f.write('FINAL_TARGET_FILES += [\n'
                '  "librewolf.cfg",\n'
                ']\n'
                '\n'
                'FINAL_TARGET_FILES.distribution += [\n'
                '  "policies.json",\n'
                '  "setup.ini",\n'
                ']\n'
                '\n'
                'FINAL_TARGET_FILES.defaults.pref += [\n'
                '  "local-settings.js",\n'
                ']\n')
        # Add each XPI individually to distribution
        for xpi in sorted(_g.glob('optional-extensions/*.xpi')):
            f.write(f'FINAL_TARGET_FILES.distribution += ["{xpi}"]\n')

    leave_srcdir();


    
    #
    # pref-pane patches
    #

    # 1) patch it in
    patch('../patches/pref-pane/pref-pane-small.patch')
    # 2) new files
    exec('cp ../patches/pref-pane/category-librewolf.svg browser/themes/shared/preferences/category-librewolf.svg')
    exec('cp ../patches/pref-pane/librewolf.css browser/themes/shared/preferences/librewolf.css')
    exec('cp ../patches/pref-pane/librewolf.inc.xhtml browser/components/preferences/librewolf.inc.xhtml')
    exec('cp ../patches/pref-pane/librewolf.js browser/components/preferences/librewolf.js')
    
    #
    # Vantage AI sidebar: copy brand icons for new providers
    #
    exec('cp -v ../patches/ai-svg/deepseek-color.svg browser/components/genai/assets/brands/deepseek.svg')
    exec('cp -v ../patches/ai-svg/qwen-color.svg browser/components/genai/assets/brands/qwen.svg')
    exec('cp -v ../patches/ai-svg/doubao-color.svg browser/components/genai/assets/brands/doubao.svg')
    exec("cp -v ../browser/components/genai/chat.js browser/components/genai/chat.js")
    exec("cp -v ../browser/components/genai/GenAI.sys.mjs browser/components/genai/GenAI.sys.mjs")
    exec("cp -v ../browser/components/genai/genai.ftl browser/locales/en-US/browser/genai.ftl")

    # provide a script that fetches and bootstraps Nightly and some mozconfigs
    exec('cp -v ../scripts/mozfetch.sh lw/')
    exec('cp -v ../assets/mozconfig.new ../assets/mozconfig.new.without-bootstrap lw/')

    # override the firefox version
    for file in ["browser/config/version.txt", "browser/config/version_display.txt"]:
        with open(file, "w") as f:
            f.write("{}-{}".format(version,release))

    # Cache l10n to avoid re-downloading 200MB+ from GitHub every build
    print("-> Preparing locales from https://github.com/mozilla-l10n/firefox-l10n")
    l10n_cache = Path("..", ".cache", "l10n")
    l10n_cache.mkdir(parents=True, exist_ok=True)

    # Verify cached extraction is complete (key directory must exist with content)
    cache_ok = (l10n_cache / "firefox-l10n-main" / "browser").is_dir()
    if not cache_ok:
        l10n_zip = l10n_cache / "l10n.zip"
        # Verify cached zip integrity with unzip -t
        zip_ok = False
        if l10n_zip.exists():
            ret = os.system(f"unzip -tq {l10n_zip} > /dev/null 2>&1")
            zip_ok = (ret == 0)
            if not zip_ok:
                print("   cached l10n.zip is corrupt, re-downloading...")
                l10n_zip.unlink()
        if not zip_ok:
            print("   downloading l10n.zip (this may take a while on first run)...")
            exec(f"curl -sLo {l10n_zip} 'https://codeload.github.com/mozilla-l10n/firefox-l10n/zip/refs/heads/main'")
        # Clean stale extraction before re-extracting
        stale = l10n_cache / "firefox-l10n-main"
        if stale.exists():
            shutil.rmtree(stale)
        with TemporaryDirectory() as tmpdir:
            exec(f"unzip -qo {l10n_zip} -d {tmpdir}")
            exec(f"mv {tmpdir}/firefox-l10n-main {l10n_cache}/")
    else:
        print("   using cached locales")
    exec(f"cp -r {l10n_cache}/firefox-l10n-main lw/l10n")

    print("-> Patching appstrings.properties")
    # Why is "Firefox" hardcoded there???
    exec("find . -path '*/appstrings.properties' -exec sed -i s/Firefox/Vantage/ {} \\;")

    # Add optional extension distribution files to package manifest
    print("-> Adding optional extensions to package-manifest.in")
    _xpifiles = _g.glob('optional-extensions/*.xpi')
    manifest = 'browser/installer/package-manifest.in'
    with open(manifest, 'a') as f:
        f.write('\n# Vantage optional extensions\n')
        f.write('@RESPATH@/distribution/setup.ini\n')
        if _xpifiles:
            f.write('@RESPATH@/distribution/*.xpi\n')
        else:
            print("   (no XPI files found, skipping distribution/*.xpi)")

    # WinUpdater files for Windows installer auto-update (Windows only)
    # Gated by WIN_VARIANT env (set by Makefile based on mozconfig target)
    if os.environ.get('WIN_VARIANT'):
        print("-> Adding WinUpdater to package-manifest.in")
        with open(manifest, 'a') as f:
            f.write('\n# Vantage WinUpdater\n')
            f.write('@RESPATH@/winupdater/*\n')

    print("-> Applying LibreWolf locales")
    l10n_dir = Path("..", "l10n")
    for source_path in l10n_dir.rglob("*"):
        if source_path.is_dir() or source_path.name.endswith(".md"):
            continue

        rel_path = source_path.relative_to(l10n_dir)
        if rel_path.parts[0] == "en-US":
            target_path = Path(
                rel_path.parts[1],
                "locales", "en-US",
                *rel_path.parts[2:]
            )
        else:
            target_path = Path(
                "lw", "l10n",
                *rel_path.parts
            )
        
        target_path.parent.mkdir(parents=True, exist_ok=True)

        write_mode = "w"
        if ".inc" in target_path.name:
            target_path = target_path.with_name(target_path.name.replace(".inc", ""))
            write_mode = "a"

        print(f"{source_path} {'>' if write_mode == 'w' else '>>'} {target_path}")

        if not target_path.exists() and write_mode == "a":
            print(f"warning: target file {target_path} doesn't exist")
        with open(target_path, write_mode) as target_file:
            with open(source_path, "r") as source_file:
                target_file.write(("\n\n" if write_mode == "a" else "") + source_file.read())

    leave_srcdir()



#
# Main functionality in this script.. which is to call librewolf_patches()
#

if len(args) != 2:
    sys.stderr.write('error: please specify version and release of librewolf source')
    sys.exit(1)
version = args[0]
release = args[1]
srcdir = "librewolf-{}-{}".format(version, release)
if not os.path.exists(srcdir + '/configure.py'):
    sys.stderr.write('error: folder doesn\'t look like a Firefox folder.')
    sys.exit(1)

librewolf_patches()

sys.exit(0) # ensure 0 exit code
