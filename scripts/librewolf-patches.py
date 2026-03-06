#!/usr/bin/env python3

#
# The script that patches the firefox source into the librewolf source.
#


import os
import sys
import optparse
import time
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

def patch(patchfile):
    cmd = "patch -p1 -i {}".format(patchfile)
    print("\n*** -> {}".format(cmd))
    sys.stdout.flush()
    if not options.no_execute:
        retval = os.system(cmd)
        if retval != 0:
            print("fatal error: patch '{}' failed".format(patchfile))
            sys.stdout.flush()
            script_exit(1)

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
    
    # create the right mozconfig file..
    exec('cp -v ../assets/mozconfig.new mozconfig')

    # copy branding files..
    exec("cp -r ../themes/browser .")

    # copy the right search-config.json file
    exec('cp -v ../assets/search-config.json services/settings/dumps/main/search-config.json')

    # read lines of .txt file into 'patches'
    with open('../assets/patches.txt'.format(version), "r") as f:
        for line in f.readlines():
            patch('../'+line)

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
    
    # provide a script that fetches and bootstraps Nightly and some mozconfigs
    exec('cp -v ../scripts/mozfetch.sh lw/')
    exec('cp -v ../assets/mozconfig.new ../assets/mozconfig.new.without-bootstrap lw/')

    # override the firefox version
    for file in ["browser/config/version.txt", "browser/config/version_display.txt"]:
        with open(file, "w") as f:
            f.write("{}-{}".format(version,release))

    print("-> Downloading locales from https://github.com/mozilla-l10n/firefox-l10n")
    with TemporaryDirectory() as tmpdir:
        exec(f"wget -qO {tmpdir}/l10n.zip 'https://codeload.github.com/mozilla-l10n/firefox-l10n/zip/refs/heads/main'")
        exec(f"unzip -qo {tmpdir}/l10n.zip -d {tmpdir}/l10n")
        exec(f"mv {tmpdir}/l10n/firefox-l10n-main lw/l10n")

    print("-> Patching appstrings.properties")
    # Why is "Firefox" hardcoded there???
    exec("find . -path '*/appstrings.properties' -exec sed -i s/Firefox/LibreWolf/ {} \\;")

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
                *rel_path.parts[1:]
            )
        else:
            target_path = Path(
                "lw", "l10n",
                *rel_path.parts[0:2],
                *rel_path.parts[1:]
            )
        target_path.parent.mkdir(parents=True, exist_ok=True)

        write_mode = "w"
        if ".inc" in target_path.name:
            target_path = target_path.with_name(target_path.name.replace(".inc", ""))
            write_mode = "a"

        print(f"{source_path} {'>' if write_mode == 'w' else '>>'} {target_path}")

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
