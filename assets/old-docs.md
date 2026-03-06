##


That should be it for this readme, the stuff below is for more internal backward compatibility. So you can safely ignore it.






# CI documentation, wasi, and Docker




To download the latest from a script, use wget/curl like this:
```
wget -O librewolf-__VERSION__-__RELEASE__.source.tar.gz https://gitlab.com/librewolf-community/browser/source/-/jobs/artifacts/main/raw/librewolf-__VERSION__-__RELEASE__.source.tar.gz?job=Build
curl -L -o librewolf-__VERSION__-__RELEASE__.source.tar.gz https://gitlab.com/librewolf-community/browser/source/-/jobs/artifacts/main/raw/librewolf-__VERSION__-__RELEASE__.source.tar.gz?job=Build
```

Next, we create ourselves a build folder and extract the tarball.

```
mkdir build
cd build
tar xf ../librewolf-__VERSION__-__RELEASE__.source.tar.gz
```

### build environment

Next step, if you have not done so already, you must _create the build environment_:
```
./librewolf-__VERSION__/lw/mozfetch.sh
```
This would create a _mozilla-unified_ folder in our 'build' folder, or basically anywhere that is your current working directory. It takes about an hour for me to complete, but it needs to be done only once. This step might fail and cause problems. Hack a bit, and if that fails you can ask on our [Gitter](https://gitter.im/librewolf-community/librewolf)/[Matrix](https://matrix.to/#/#librewolf:matrix.org) channels. There is no need to actually build _mozilla-unified_ (Mozilla Nightly) itself, nor is the folder needed to build LibreWolf. So you can remove it: `rm -rf mozilla-unfied` if you don't plan on using/exploring it.

#### wasi sdk

Since Firefox 95.0, we need to install an additional library, the **'wasi sdk'**. This library sandboxes wasm libraries, which is what we want, but it's still experimental for us to include properly.

A few resources: 
* mozilla.org: [WebAssembly and Back Again: Fine-Grained Sandboxing in Firefox 95](https://hacks.mozilla.org/2021/12/webassembly-and-back-again-fine-grained-sandboxing-in-firefox-95/).
* [Compiling C to WebAssembly using clang/LLVM and WASI](https://00f.net/2019/04/07/compiling-to-webassembly-with-llvm-and-clang/).
* [Firefox 95 on POWER](https://www.talospace.com/2021/12/firefox-95-on-power.html).

To setup the wasi sdk _headers_, you can use _librewolf-__VERSION__/lw/setup-wasi-linux.sh_. Please note that this script is a bit experimental and not all kinks have been worked out, but it should work.
This might not be enough on all systems. Some systems have the wasi-libc library already installed, and some don't. It depends on the installed version of Clang/LLVM it seems, which should be v8 or above. On debian-based systems: `sudo apt install wasi-libc`, on Arch: `https://archlinux.org/packages/community/any/wasi-libc/` (`pacman -Syu wasi-libc`). Instructions for macos/windows and perhaps other Linux distro's will be added here soon.

Or, the other option is to not use these sandbox libraries: In this case we can't use our standard _mozconfig_ symlink from _mozconfig.new_ into _mozconfig.new.without-wasi_. In that case you have to type something along the lines of:
```
cd librewolf-__VERSION__
cp lw/mozconfig.new.without-wasi mozconfig
cd ..
```
### building librewolf

Now we're ready to actually build LibreWolf:
```
cd librewolf-__VERSION__
./mach build
```
Also takes me an hour. Then, we can run it:
```
./mach run
```
Or make a package:
```
./mach package
```

### I want to keep up to date with the latest, but compile myself

1. To first clone the repo:
```
git clone https://gitlab.com/librewolf-community/browser/source.git
cd source
make librewolf
```
2. To keep up-to-date:
```
git pull
make librewolf
```

## [dev info] How to use this repo instead of [Common](https://gitlab.com/librewolf-community/browser/common):

Since the dawn of time, we have used **Common** to get _patches_, _source_files_, including _source_files/{branding}_

This source repo supports all that, because it uses these same things to produce the tarball. As far as I can tell, the mapping from Common to Source would be:

* _[patches](https://gitlab.com/librewolf-community/browser/common/-/tree/master/patches)_ -> _[patches](https://gitlab.com/librewolf-community/browser/source/-/tree/main/patches)_
* _[source\_files](https://gitlab.com/librewolf-community/browser/common/-/tree/master/source_files)/search-config.json_ -> _[assets](https://gitlab.com/librewolf-community/browser/source/-/tree/main/assets)/search-config.json_
* _source\_files/browser/[branding](https://gitlab.com/librewolf-community/browser/common/-/tree/master/source_files/browser/branding)/librewolf_ -> _themes/browser/[branding](https://gitlab.com/librewolf-community/browser/source/-/tree/main/themes/browser/branding)/librewolf_


With this mapping, I hope that other builders that can't use our tarball (afterMozilla project, weird distro's), still use the same source/patches as the builders that do use it.

### Another feature

The file [assets/patches.txt](https://gitlab.com/librewolf-community/browser/source/-/blob/main/assets/patches.txt) defines what patches go in. These are not the only patches a builder will use, weird distro's etc, will use additional patches. those patches can live in the repo of that distro, or in a subfolder here. I hope this gives everybody the freedom to build anyway they please, like in Common, but with the added benefit that we produce a source tarball.

### Implementing a build script the new way:

The repository has a short [example shell script](https://gitlab.com/librewolf-community/browser/source/-/blob/main/scripts/fetch-build.sh) on how to use the new-style tarball approach instead of the older patching-it-yourself approach.

## [dev info] Building the LibreWolf source tarball:

Luckly, you don't need the build environment for this. If you don't have write access, just:
```
git clone https://gitlab.com/librewolf-community/browser/source.git
cd source
make all
```
If you **do** have write access, we're first gonna check for a newer version of Firefox:
```
git clone git@gitlab.com:librewolf-community/browser/source.git
cd source
make check
```
If there is a new version, it's a good time to git commit and trigger a CI build job.
```
git commit -am v$(cat version)-$(cat release) && git push
```
To build the source archive:
```
make all
```
If you have a working build environment, you can build librewolf with:
```
make librewolf
```
This extracts the source, and then tries to `./mach build && ./mach package`.

## FAQ: Common issues when setting up the Mozilla build environment

1. it doesnt find a suitable python.
```
export MACH_USE_SYSTEM_PYTHON=1
make librewolf
```
2. <python-package-1> requires <python-package-2, which is not installed.
```
pip3 install <python-package-2>
```
And retry.
