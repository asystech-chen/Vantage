#!/usr/bin/env python3

import os
import sys
import optparse

parser = optparse.OptionParser()
parser.add_option('-n', '--no-execute', dest='no_execute', default=False, action="store_true")
options, remainder = parser.parse_args()

def exec(cmd, exit_on_fail = True, do_print = True):
    if cmd != '':
        if do_print:
            print(cmd)
        if not options.no_execute:
            retval = os.system(cmd)
            if retval != 0 and exit_on_fail:
                    print("fatal error: command '{}' failed".format(cmd))
                    sys.exit(1)
            return retval
    return None

def get_version_from_file(version_filename = './version'):
    with open(version_filename) as f:
        lines = f.readlines()  
        if len(lines) != 1:
            sys.stderr.write('error: ./version contains too many lines.')
            os.exit(1)
        return lines[0].strip()
    return None

def make_version_string(major,minor,patch):
    if patch == 0:
        return '{}.{}'.format(major,minor)
    else:
        return '{}.{}.{}'.format(major,minor,patch)

def firefox_release_url(ver):
    return 'https://archive.mozilla.org/pub/firefox/releases/{}/source/firefox-{}.source.tar.xz'.format(ver, ver)

def check_url_exists(url):
    i = exec('wget --spider {} 2>/dev/null'.format(url), exit_on_fail=False, do_print=False)
    if i == 0:
        return True
    else:
        return False

#
# main script
#

base_version = get_version_from_file()

# split base_version into major.minor.patch
split_version = base_version.split(sep='.')
if len(split_version) > 3 or len(split_version) < 1:
    sys.stderr.write('error: ./version file contains invalid version number')
    sys.exit(1)
elif len(split_version) == 1:
    major = int(split_version[0])
    minor = 0
    patch = 0
elif len(split_version) == 2:
    major = int(split_version[0])
    minor = int(split_version[1])
    patch = 0
elif len(split_version) == 3:
    major = int(split_version[0])
    minor = int(split_version[1])
    patch = int(split_version[2])

# now check if this version exists with Mozilla
if not check_url_exists(firefox_release_url(make_version_string(major,minor,patch))):
    sys.stderr.write('error: The current version is unavailable.')
    sys.exit(1)

# Check for releases..
s = ''

if check_url_exists(firefox_release_url(make_version_string(major,minor,patch+1))):
    s = ('{}.{}.{}'.format(major,minor,patch+1))
elif check_url_exists(firefox_release_url(make_version_string(major,minor+1,0))):
    s = ('{}.{}'.format(major,minor+1))
elif check_url_exists(firefox_release_url(make_version_string(major+1,0,0))):
    s = ('{}.0'.format(major+1))
else:
    s = base_version
    
if s != base_version:
    print('The wheel has turned, and version {} has been released.'.format(s))

    with open('./version', 'w') as f:
        f.write(s)
    exec('echo 1 > release')
else:
    print('Latest Firefox release is still {}.'.format(base_version))
    
sys.exit(0) # ensure 0 exit code
