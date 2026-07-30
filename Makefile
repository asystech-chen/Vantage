docker_targets=docker-build-image docker-run-build-job docker-remove-image
woodpecker_targets=fetch-upstream-woodpecker check-patchfail-woodpecker
testing_targets=full-test test test-linux test-macos test-windows
.PHONY : help moztree check all clean veryclean distclean patches dir bootstrap fetch build package package-all package-deb package-rpm package-appimage package-tar package-msix checksum run update setup-wasi check-patchfail check-fuzz fixfuzz $(docker_targets) $(woodpecker_targets) $(testing_targets)

# Include ~/.local/bin for tools like appimagetool
export PATH := $(HOME)/.local/bin:$(PATH)

version:=$(shell cat ./version)
release:=$(shell cat ./release)
GPG_KEY_ID:=907587D2812D7F8C

FF_BASE_URL ?= https://archive.mozilla.org/pub/firefox/releases
FF_CHANNEL ?= releases
FF_BUILD ?= build1

# beta minor suffix (e.g "b9")
FF_BETA_SUFFIX ?=

# Set FF_ESR=1 to use Firefox ESR source instead of Release
FF_ESR ?= 0
ifeq ($(FF_ESR),1)
ff_esr_suffix := esr
else
ff_esr_suffix :=
endif

ff_source_tarball := firefox-$(version)$(ff_esr_suffix)$(FF_BETA_SUFFIX).source.tar.xz

ifeq ($(FF_CHANNEL),candidates)
ff_source_url := https://archive.mozilla.org/pub/firefox/candidates/$(version)-candidates/$(FF_BUILD)/source/$(ff_source_tarball)
else ifeq ($(FF_CHANNEL),beta)
ff_source_url := https://archive.mozilla.org/pub/firefox/candidates/$(version)$(FF_BETA_SUFFIX)-candidates/$(FF_BUILD)/source/$(ff_source_tarball)
else
ff_source_url := $(FF_BASE_URL)/$(version)$(ff_esr_suffix)/source/$(ff_source_tarball)
endif

## simplistic archive format selection

#archive_create=tar cfJ
#ext=.tar.xz
archive_create:=tar cfz
ext:=.tar.gz

ff_source_dir:=firefox-$(version)
ff_source_tarball:=firefox-$(version)$(ff_esr_suffix).source.tar.xz

lw_source_dir:=librewolf-$(version)-$(release)
lw_source_tarball:=librewolf-$(version)-$(release).source$(ext)

help :

	@echo "use: $(MAKE) [all] [check] [clean] [veryclean] [bootstrap] [build] [package] [run]"
	@echo ""
	@echo "  all         - Make LibreWolf source archive ${version}-${release}."
	@echo ""
	@echo "  check       - Check if there is a new version of Firefox."
	@echo "  update      - Update the git submodules."
	@echo ""
	@echo "  clean       - Clean everything except the upstream firefox tarball."
	@echo "  veryclean   - Clean everything including the firefox tarball."
	@echo ""
	@echo "  bootstrap   - Bootstrap the build environment."
	@echo "  setup-wasi  - Setup WASM sandbox libraries (required on Linux)."
	@echo ""
	@echo "  fetch       - fetch Firefox source archive."
	@echo "  dir         - extract Firefox and apply the patches, creating a"
	@echo "                ready to build librewolf folder."
	@echo "  build       - Build LibreWolf (requires bootstrapped build environment)."
	@echo "  package     - Package LibreWolf (requires build)."
	@echo "  package-all - Package as deb/rpm/AppImage/tar.gz (Linux only)."
	@echo "  checksum    - Generate sha256sums for all packages."
	@echo "  run         - Run LibreWolf (requires build)."
	@echo ""
	@echo "  check-patchfail - check patches for errors."
	@echo "  check-fuzz      - check patches for fuzz."
	@echo "  fixfuz          - fix the fuzz."
	@echo ""
	@echo ""
	@echo "docker:" $(docker_targets)
	@echo ""
	@echo ""
	@echo "Maintainer commands:"
	@echo ""
	@echo "  patches   - Just make the LibreWolf source directory (download, extract, patch)"
	@echo "  all       - build LW tarball"
	@echo ""
	@echo "  clean     - remove all cruft except LW source tree"
	@echo "  veryclean - remove all except download FF tarball"
	@echo "  distclean - remove all including downloads"
	@echo ""
	@echo "  moztree   - show LW source tree"
	@echo "  check     - checking for new versions of FF"
	@echo "  update    - update settings submodule"
	@echo ""


moztree :

	(cd $(lw_source_dir) && ../scripts/moztree )

patches :

	make veryclean
	make dir


# building...

all : $(lw_source_tarball)


# cleaning up..

clean :
	rm -rf *~ public_key.asc $(ff_source_dir) $(lw_source_tarball) $(lw_source_tarball).sha256sum $(lw_source_tarball).sha512sum firefox-$(version) patchfail.out patchfail-fuzz.out 

veryclean : clean
	rm -rf $(lw_source_dir) 

distclean : veryclean
	rm -f $(ff_source_tarball) $(ff_source_tarball).asc


# checking for new versions...


check :
	-bash -c ./scripts/update-settings-module.sh
	python3 scripts/update-version.py
	cut -f1 version > version.tmp
	mv -vf version.tmp version
	@echo ""
	@echo "Firefox version   : " $$(cat version)
	@echo "LibreWolf release : " $$(cat release)
	@echo ""


# update settings submodule...

update :
	-bash -c ./scripts/update-settings-module.sh




#
# The actual build stuff
#

fetch : $(ff_source_tarball)

$(ff_source_tarball) :
	aria2c -q -o public_key.asc "https://keys.openpgp.org/vks/v1/by-fingerprint/14F26682D0916CDD81E37B6D61B7B526D98F0353"
	gpg --import public_key.asc
	rm -f public_key.asc
	aria2c -q -o $(ff_source_tarball).asc "$(ff_source_url).asc"
	aria2c -o $(ff_source_tarball) "$(ff_source_url)"
	gpg --verify $(ff_source_tarball).asc $(ff_source_tarball)

$(lw_source_dir) : $(ff_source_tarball) ./version ./release scripts/librewolf-patches.py assets/mozconfig assets/patches.txt
	rm -rf $(ff_source_dir) $(lw_source_dir)
	tar xf $(ff_source_tarball)
	mv $(ff_source_dir) $(lw_source_dir)
	python3 scripts/librewolf-patches.py $(version) $(release)
	$(MAKE) prepare-sfx-apply

# 将预打补丁的 7zSD.sfx 复制到源码树（修复 Windows 安装包品牌）
prepare-sfx: prepare-sfx-apply

prepare-sfx-apply:
	@if [ -d "$(lw_source_dir)/other-licenses/7zstub/firefox" ]; then \
		echo ">>> [7zSFX] Applying Vantage branding to SFX stubs..."; \
		for arch in Win32 ARM64; do \
			src="assets/7zsfx/7zSD.$${arch}.sfx"; \
			dst="$(lw_source_dir)/other-licenses/7zstub/firefox/7zSD.$${arch}.sfx"; \
			if [ -f "$$src" ] && [ -f "$$dst" ]; then \
				cp "$$src" "$$dst"; \
				echo "    Patched: $$arch"; \
			fi; \
		done; \
	fi

$(lw_source_tarball) : $(lw_source_dir)
	rm -f $(lw_source_tarball)
	tar cf librewolf-$(version)-$(release).source.tar $(lw_source_dir)
	pigz -6 librewolf-$(version)-$(release).source.tar
	touch $(lw_source_dir)
	sha256sum $(lw_source_tarball) > $(lw_source_tarball).sha256sum
	cat $(lw_source_tarball).sha256sum
	sha256sum -c $(lw_source_tarball).sha256sum
	sha512sum $(lw_source_tarball) > $(lw_source_tarball).sha512sum
	cat $(lw_source_tarball).sha512sum
	sha512sum -c $(lw_source_tarball).sha512sum
	if [ -n "$${SIGNING_KEY}" ]; then printf '%s\n' "$${SIGNING_KEY}" | gpg --import && gpg --detach-sign $(lw_source_tarball) && ls -lh $(lw_source_tarball).sig; fi
	ls -lh $(lw_source_tarball)*


debs=python3 python3-dev python3-pip
rpms=python3 python3-devel
bootstrap : $(lw_source_dir)
	(sudo apt-get -y install $(debs); true)
	(sudo rpm -y install $(rpms); true)
	(cd $(lw_source_dir) && MOZBUILD_STATE_PATH=$$HOME/.mozbuild ./mach --no-interactive bootstrap --application-choice=browser)

setup-wasi :
	./scripts/setup-wasi-linux.sh


dir : $(lw_source_dir)

build : $(lw_source_dir)
	(cd $(lw_source_dir) && ./mach build)

# 检测 Windows 编译类型（MSVC / MinGW）- 只对 Windows 构建有效
WIN_VARIANT := $(shell mozcfg="$${MOZCONFIG:-$(lw_source_dir)/mozconfig}"; [ -f "$$mozcfg" ] || mozcfg="$$(pwd)/assets/mozconfig"; grep -qE 'windows-msvc|pc-windows-msvc' "$$mozcfg" 2>/dev/null && echo msvc || (grep -qE 'windows-gnu|pc-mingw32' "$$mozcfg" 2>/dev/null && echo mingw || true))

package :
	@if [ -n "$(WIN_VARIANT)" ]; then \
	  OBJDIR=$$(ls -td $(lw_source_dir)/obj-*pc-windows* 2>/dev/null | head -1); \
	else \
	  OBJDIR=$$(ls -td $(lw_source_dir)/obj-* 2>/dev/null | head -1); \
	fi; \
	if [ -n "$(WIN_VARIANT)" ] && [ -f winupdater/Vantage-WinUpdater.exe ]; then \
	  echo ">>> Injecting WinUpdater into dist for NSIS installer..."; \
	  mkdir -p $$OBJDIR/dist/bin/winupdater && \
	  cp winupdater/Vantage-WinUpdater.exe \
	     winupdater/Vantage-WinUpdater.ico \
	     winupdater/ScheduledTask-Create.ps1 \
	     winupdater/ScheduledTask-Remove.ps1 \
	     $$OBJDIR/dist/bin/winupdater/; \
	  echo "    Done ($$OBJDIR/dist/bin/winupdater/)."; \
	fi
	(cd $(lw_source_dir) && cat browser/locales/shipped-locales | xargs ./mach package-multi-locale --locales)
	@if [ -n "$(WIN_VARIANT)" ]; then \
	  OBJDIR=$$(ls -td $(lw_source_dir)/obj-*pc-windows* 2>/dev/null | head -1); \
	else \
	  OBJDIR=$$(ls -td $(lw_source_dir)/obj-* 2>/dev/null | head -1); \
	fi; \
	ARCH=$$(basename "$$OBJDIR" | grep -oE 'x86_64|aarch64|arm64' | head -1 | sed 's/^arm64$$/aarch64/'); \
	echo ">>> Packaging (arch: $$ARCH)..."; \
	if [ -n "$(WIN_VARIANT)" ]; then \
	  echo ">>> Windows: copying .exe and creating portable zip..."; \
	  find $$OBJDIR/dist/ -maxdepth 1 -name "*.exe" | while read f; do \
	    cp -v "$$f" "$(APP_NAME)-$(version)-$(release).$$ARCH-installer.exe"; \
	  done; \
	  WIN_ZIP=$$(ls -t $$OBJDIR/dist/*.zip 2>/dev/null | head -1); \
	  if [ -n "$$WIN_ZIP" ]; then \
	    mkdir -p $(APP_NAME)-portable/bin $(APP_NAME)-portable/Data; \
	    unzip -q "$$WIN_ZIP" -d $(APP_NAME)-portable/bin; \
	    echo ">>> Bundling VC++ runtime DLLs..."; \
	    ./scripts/bundle-vcrt.sh $(APP_NAME)-portable/bin/$(APP_NAME)/ 2>&1 || true; \
	    echo ">>> Bundling WinUpdater..."; \
	    if [ -f winupdater/Vantage-WinUpdater.exe ]; then \
	      mkdir -p $(APP_NAME)-portable/bin/$(APP_NAME)/winupdater; \
	      cp winupdater/Vantage-WinUpdater.exe $(APP_NAME)-portable/bin/$(APP_NAME)/winupdater/; \
	      cp winupdater/Vantage-WinUpdater.ico $(APP_NAME)-portable/bin/$(APP_NAME)/winupdater/; \
	      cp winupdater/ScheduledTask-Create.ps1 $(APP_NAME)-portable/bin/$(APP_NAME)/winupdater/; \
	      cp winupdater/ScheduledTask-Remove.ps1 $(APP_NAME)-portable/bin/$(APP_NAME)/winupdater/; \
	      echo "    WinUpdater files bundled in portable package."; \
	    else \
	      echo "    (WinUpdater .exe not found, skipping)"; \
	    fi; \
	    printf '@echo off\r\n' > $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    printf 'set "APPDATA=%%~dp0Data"\r\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    printf 'set "LOCALAPPDATA=%%~dp0Data"\r\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    printf 'if not exist "%%~dp0Data" mkdir "%%~dp0Data"\r\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    printf 'start "" "%%~dp0bin\\$(APP_NAME)\\$(APP_NAME).exe" %%*\r\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    zip -qr $(APP_NAME)-$(version)-$(release).win-$$ARCH.portable.zip $(APP_NAME)-portable; \
	    rm -rf $(APP_NAME)-portable; \
	    echo ">>> [WIN-PORTABLE] $(APP_NAME)-$(version)-$(release).win-$$ARCH.portable.zip"; \
	  fi; \
	else \
	  echo ">>> Linux: copying and renaming .tar.xz and .tar.gz..."; \
	  for f in $$OBJDIR/dist/*.tar.xz; do \
	    dest=$$(basename "$$f" | sed 's/.en-US//'); \
	    cp -v "$$f" "./$$dest"; \
	  done; \
	  find $$OBJDIR/dist/ -maxdepth 1 -name "*.tar.gz" -exec cp -v {} . \;; \
	fi; \
	echo ""

# 计算所有打包产物的 SHA256 校验和，写入单个 sha256sums 文件
# PE-SFX: 已禁用（注释掉），不再打包自解压 exe
#
# package-pe-sfx :
# 	... (disabled)
#

# MSIX: 将 Windows 包重新打包为 MSIX (Microsoft Store 格式)
# 依赖: package 必须先完成
# 签发给 Store 前，修改 PUBLISHER 为 Partner Center 注册的 CN
MSIX_PUBLISHER ?= CN=Vantage, O=Vantage, L=Beijing, C=CN
MSIX_PUBLISHER_DISPLAY ?= Vantage Browser
MSIX_IDENTITY ?= Vantage.VantageBrowser

package-msix :
	@OBJDIR=$$(ls -td $(lw_source_dir)/obj-*pc-windows* 2>/dev/null | head -1); \
	WIN_ZIP=$$(ls -t $$OBJDIR/dist/*.zip 2>/dev/null | grep -v xpt_artifacts | head -1); \
	if [ -z "$$WIN_ZIP" ]; then \
	  echo "错误: 找不到 Windows dist .zip，请先运行 'make package'"; \
	  exit 1; \
	fi; \
	ARCH="$$(echo $$OBJDIR | grep -oE 'x86_64|aarch64' | head -1)"; \
	ABS_ZIP="$$(realpath "$$WIN_ZIP")"; \
	ABS_OUT="$$(realpath .)/$(APP_NAME)-$(version)-$(release).$$ARCH.msix"; \
	PREPKG_ZIP="$$(realpath .)/$(APP_NAME)-$(version)-$(release).$$ARCH.msix-prepackage.zip"; \
	echo ">>> [MSIX] 输入: $$ABS_ZIP ($$ARCH)"; \
	echo "    Publisher: $(MSIX_PUBLISHER)"; \
	echo "    Identity:  $(MSIX_IDENTITY)"; \
	MKX="$$(realpath scripts/wine-makeappx)"; \
	cd $(lw_source_dir) && ./mach repackage msix \
	    --input "$$ABS_ZIP" \
	    --channel unofficial \
	    --vendor Vantage \
	    --identity-name "$(MSIX_IDENTITY)" \
	    --publisher "$(MSIX_PUBLISHER)" \
	    --publisher-display-name "$(MSIX_PUBLISHER_DISPLAY)" \
	    --arch $$ARCH \
	    --unsigned \
	    --makeappx "$$MKX" \
	    --output "$$ABS_OUT" 2>&1 || true; \
	MSIX_DIR=$$(ls -td $$HOME/.mozbuild/cache/mach-msix/msix-temp-* 2>/dev/null | head -1); \
	if [ -z "$$MSIX_DIR" ]; then \
	  echo ">>> [MSIX] 预打包目录未生成"; exit 1; \
	fi; \
	cd "$$(dirname "$$MSIX_DIR")" && zip -0qr "$$PREPKG_ZIP" "$$(basename "$$MSIX_DIR")" && cd - >/dev/null; \
	ls -lh "$$PREPKG_ZIP"; \
	if [ -f "$$ABS_OUT" ]; then \
	  echo ">>> [MSIX] ✅ MSIX 包已生成: $$ABS_OUT"; \
	else \
	  echo ""; \
	  echo "================================================"; \
	  echo "  📦 MSIX 预打包: $$PREPKG_ZIP"; \
	  echo "  ▶ 在 Windows 上完成最终打包:"; \
	  echo "    1. 解压此 zip"; \
	  echo "    2. makeappx pack /d <解压目录> /p vantage.msix /overwrite"; \
	  echo "================================================"; \
	fi
checksum :
	@echo ">>> [CHECKSUM] Generating SHA256SUMS..."
	@rm -f SHA256SUMS SHA256SUMS.asc
	@count=0; \
	for f in $(APP_NAME)*$(version)*.tar.xz \
	         $(APP_NAME)*$(version)*.tar.gz \
	         $(APP_NAME)*$(version)*.portable.zip \
	         $(APP_NAME)*$(version)*.exe \
	         $(APP_NAME)*$(version)*.dmg \
	         $(APP_NAME)_$(version)*.deb \
	         $(APP_NAME)-$(version)*.rpm \
	         $(APP_NAME)-$(version)*.AppImage \
	         $(APP_NAME)*$(version)*.msix; do \
	  if [ -f "$$f" ]; then \
	    sha256sum "$$f" >> SHA256SUMS; \
	    echo "  $$f"; \
	    count=$$((count + 1)); \
	  fi; \
	done; \
	if [ $$count -eq 0 ]; then \
	  echo ">>> [CHECKSUM] No packages found to checksum"; \
	else \
	  echo ">>> [CHECKSUM] $$count packages hashed"; \
	  echo ""; \
	  cat SHA256SUMS; \
	  echo ""; \
	  echo ">>> [CHECKSUM] Signing SHA256SUMS with GPG..."; \
	  gpg --batch --yes --detach-sign --armor -u $(GPG_KEY_ID) SHA256SUMS 2>/dev/null && \
	    echo "  ✅ SHA256SUMS.asc created" || \
	    echo "  ⚠️  GPG signing skipped (key not available)"; \
	fi
	@echo ">>> [CHECKSUM] Done"

run :
	(cd $(lw_source_dir) && ./mach run)


check-patchfail:
	sh -c "./scripts/check-patchfail.sh" > patchfail.out



check-fuzz:
	-sh -c "./scripts/check-patchfail.sh --fuzz=0" > patchfail-fuzz.out
fixfuzz :
	sh -c "./scripts/fuzzfail.sh"






#
# docker
#


build_image=librewolf-build-image

docker-build-image :
	docker build --no-cache -t $(build_image) - < assets/Dockerfile

docker-run-build-job :
	docker run -v $$(pwd):/output --rm $(build_image) sh -c "git pull && make fetch && make build package && cp -v ./*.xz /output"

docker-remove-image :
	docker rmi $(build_image)

setup-debian :
	apt-get -y install mercurial python3 python3-dev python3-pip curl wget dpkg-sig  libssl-dev zstd libxml2-dev

setup-fedora :
	dnf -y install python3 curl wget zstd python3-devel python3-pip mercurial openssl-devel libxml2-devel






#
# for .woodpecker.yml
#

check-patchfail-woodpecker :

	( sh -c "./scripts/check-patchfail.sh" > patchfail.out ; exit_code=$$? ; \
		cat patchfail.out ; rm -f patchfail.out ; exit $$exit_code )

fetch-upstream-woodpecker : fetch


#
# testing_targets=full-test test
#

test : full-test

# full-test: produce the xz artifact using bsys6 from scratch
full-test : $(lw_source_tarball)
	${MAKE} -f assets/testing.mk bsys6_x86_64_linux_xz_artifact

test-linux : full-test

test-candidate :
	$(MAKE) FF_CHANNEL=candidates FF_BUILD=$(FF_BUILD) test-linux

test-beta :
	$(MAKE) FF_CHANNEL=beta FF_BUILD=$(FF_BUILD) FF_BETA_SUFFIX=$(FF_BETA_SUFFIX) test-linux

test-macos : $(lw_source_tarball)
	${MAKE} -f assets/testing.mk bsys6_x86_64_macos_dmg_artifact

test-windows : $(lw_source_tarball)
	${MAKE} -f assets/testing.mk bsys6_x86_64_windows_zip_artifact

# ==========================================
# 本地打包为多种格式的目标
# ==========================================

# 架构自动检测（按优先级）：
#   1. 命令行显式传入：  make package-all PKG_ARCH=aarch64
#   2. MOZCONFIG 文件里的 --target= 值（aarch64 / arm64 / x86_64）
#   3. $(lw_source_dir)/.mozconfig（mach configure 后的 mozconfig 副本）
#   4. 最新 Linux obj 目录内的 .mozconfig（排除 win/darwin）
#   5. $(lw_source_dir)/obj-*-linux-* 目录名（取最新修改的）
#   6. 兜底 x86_64
PKG_ARCH ?= $(shell \
  mozcfg="$(MOZCONFIG)"; \
  srcdir="$(lw_source_dir)"; \
  arch=""; \
  [ -z "$$mozcfg" -o ! -f "$$mozcfg" ] && mozcfg="$$srcdir/.mozconfig"; \
  [ -z "$$mozcfg" -o ! -f "$$mozcfg" ] && { newest_obj=$$(ls -td "$$srcdir"/obj-*-linux-* 2>/dev/null | head -1); [ -n "$$newest_obj" ] && mozcfg="$$newest_obj/.mozconfig"; }; \
  [ -f "$$mozcfg" ] && arch=$$(grep -oE 'target=[^ \t]*' "$$mozcfg" 2>/dev/null | grep -oE '(aarch64|arm64|loongarch64|x86_64)' | head -1 | sed 's/arm64/aarch64/'); \
  [ -z "$$arch" ] && arch=$$(ls -td "$$srcdir"/obj-*-linux-* 2>/dev/null | head -1 | grep -oE '(x86_64|aarch64|loongarch64)'); \
  echo "$${arch:-x86_64}")

# 架构名映射
ifeq ($(PKG_ARCH),loongarch64)
DEB_ARCH := loong64
RPM_ARCH := loongarch64
else ifeq ($(PKG_ARCH),aarch64)
DEB_ARCH := arm64
RPM_ARCH := aarch64
else
DEB_ARCH := amd64
RPM_ARCH := x86_64
endif

# 查找匹配架构的二进制 tarball（优先匹配指定架构）
BINARY_TARBALL ?= $(shell ls -t *$(PKG_ARCH)*.tar.xz 2>/dev/null | grep -v source | head -n 1)

# 图标路径
LW_ICON := themes/browser/branding/vantage/default128.png

# 软件名称配置
APP_NAME := vantage
APP_DISPLAY_NAME := Vantage

# 通用清理
clean-packaging :
	@rm -rf deb_build rpm_build AppDir

# 打包为 .deb (Debian/Ubuntu/Mint)
package-deb : clean-packaging
	@if [ -z "$(BINARY_TARBALL)" ]; then echo "Error: No binary tarball found."; exit 1; fi
	@echo ">>> [DEB] Creating package from $(BINARY_TARBALL)..."
	@mkdir -p deb_build/opt/$(APP_NAME)
	@mkdir -p deb_build/DEBIAN
	@mkdir -p deb_build/usr/share/icons/hicolor/128x128/apps
	@mkdir -p deb_build/usr/share/applications
	@tar -xf $(BINARY_TARBALL) -C deb_build/opt/$(APP_NAME) --strip-components=1
	@echo "Package: $(APP_NAME)" > deb_build/DEBIAN/control
	@echo "Version: $(version)-$(release)" >> deb_build/DEBIAN/control
	@echo "Section: web" >> deb_build/DEBIAN/control
	@echo "Priority: optional" >> deb_build/DEBIAN/control
	@echo "Architecture: $(DEB_ARCH)" >> deb_build/DEBIAN/control
	@echo "Maintainer: Vantage Build" >> deb_build/DEBIAN/control
	@echo "Description: $(APP_DISPLAY_NAME) Browser" >> deb_build/DEBIAN/control
	@echo "Depends: libgtk-3-0, libdbus-glib-1-2, libxtst6, libxss1, libasound2" >> deb_build/DEBIAN/control
	@echo '#!/bin/sh' > deb_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@echo 'exec /opt/$(APP_NAME)/$(APP_NAME) "$$@"' >> deb_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@chmod +x deb_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@if [ -f "$(LW_ICON)" ]; then cp "$(LW_ICON)" deb_build/usr/share/icons/hicolor/128x128/apps/$(APP_NAME).png; fi
	@echo '[Desktop Entry]' > deb_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Name=$(APP_DISPLAY_NAME)' >> deb_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Exec=/opt/$(APP_NAME)/$(APP_NAME).sh' >> deb_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Icon=$(APP_NAME)' >> deb_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Type=Application' >> deb_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Categories=Network;WebBrowser;' >> deb_build/usr/share/applications/$(APP_NAME).desktop
	@echo ">>> [DEB] Building .deb file..."
	@dpkg-deb --build deb_build $(APP_NAME)_$(version)-$(release)_$(DEB_ARCH).deb
	@echo ">>> [DEB] Done: $(APP_NAME)_$(version)-$(release)_$(DEB_ARCH).deb"
	@rm -rf deb_build

# 打包为 .rpm (Fedora/CentOS/openSUSE) - 需要 fpm
package-rpm : clean-packaging
	@if [ -z "$(BINARY_TARBALL)" ]; then echo "Error: No binary tarball found."; exit 1; fi
	@echo ">>> [RPM] Creating package from $(BINARY_TARBALL)..."
	@if ! command -v fpm >/dev/null 2>&1; then \
		echo "Error: fpm not found. Install with: gem install fpm"; \
		exit 1; \
	fi
	@mkdir -p rpm_build/opt/$(APP_NAME)
	@tar -xf $(BINARY_TARBALL) -C rpm_build/opt/$(APP_NAME) --strip-components=1
	@fpm --force -s dir -t rpm -n $(APP_NAME) -v $(version) --iteration $(release) \
		--rpm-os linux \
		--rpm-compression xzmt \
		--architecture $(RPM_ARCH) \
		--description "$(APP_DISPLAY_NAME) Web Browser" \
		--maintainer "Vantage Build" \
		--url "https://vantage.local" \
		-p $(APP_NAME)-$(version)-$(release).$(RPM_ARCH).rpm \
		-C rpm_build \
		opt/$(APP_NAME)
	@echo ">>> [RPM] Done: $(APP_NAME)-$(version)-$(release).$(RPM_ARCH).rpm"
	@rm -rf rpm_build

# AppImage runtime 文件（用于离线构建）
APPIMAGE_RUNTIME_x86_64 := $(CURDIR)/assets/appimage-runtime/runtime-x86_64
APPIMAGE_RUNTIME_aarch64 := $(CURDIR)/assets/appimage-runtime/runtime-aarch64

# 打包为 .AppImage (通用)
package-appimage : clean-packaging
ifeq ($(PKG_ARCH),loongarch64)
	@echo ">>> [APPIMAGE] Skipped: no loongarch64 runtime (use .deb or .tar.gz)"
else
	@if [ -z "$(BINARY_TARBALL)" ]; then echo "Error: No binary tarball found."; exit 1; fi
	@echo ">>> [APPIMAGE] Creating package from $(BINARY_TARBALL)..."
	@if ! command -v appimagetool >/dev/null 2>&1; then \
	echo "Error: appimagetool not found."; \
	exit 1; \
	fi
	@mkdir -p AppDir/usr/bin
	@mkdir -p AppDir/usr/share/icons/hicolor/128x128/apps
	@mkdir -p AppDir/usr/share/applications
	@tar -xf $(BINARY_TARBALL) -C AppDir/usr/bin --strip-components=1
	@if [ -f "$(LW_ICON)" ]; then \
	cp "$(LW_ICON)" AppDir/usr/share/icons/hicolor/128x128/apps/$(APP_NAME).png; \
	cp "$(LW_ICON)" AppDir/$(APP_NAME).png; \
	fi
	@printf '#!/bin/sh\n' > AppDir/AppRun
	@printf 'HERE="$$(dirname "$$(readlink -f "$$0")")"\n' >> AppDir/AppRun
	@printf 'exec "$$HERE/usr/bin/$(APP_NAME)" "$$@"\n' >> AppDir/AppRun
	@chmod +x AppDir/AppRun
	@echo '[Desktop Entry]' > AppDir/$(APP_NAME).desktop
	@echo 'Name=$(APP_DISPLAY_NAME)' >> AppDir/$(APP_NAME).desktop
	@echo 'Exec=$(APP_NAME)' >> AppDir/$(APP_NAME).desktop
	@echo 'Icon=$(APP_NAME)' >> AppDir/$(APP_NAME).desktop
	@echo 'Type=Application' >> AppDir/$(APP_NAME).desktop
	@echo 'Categories=Network;WebBrowser;' >> AppDir/$(APP_NAME).desktop
	@cp AppDir/$(APP_NAME).desktop AppDir/usr/share/applications/
	@echo ">>> [APPIMAGE] Running appimagetool..."
	@runtime_opt=""; \
	if [ "$(PKG_ARCH)" = "x86_64" ] && [ -f "$(APPIMAGE_RUNTIME_x86_64)" ]; then \
		runtime_opt="--runtime-file=$(APPIMAGE_RUNTIME_x86_64)"; \
		echo ">>> Using cached runtime: $(APPIMAGE_RUNTIME_x86_64)"; \
	elif [ "$(PKG_ARCH)" = "aarch64" ] && [ -f "$(APPIMAGE_RUNTIME_aarch64)" ]; then \
		runtime_opt="--runtime-file=$(APPIMAGE_RUNTIME_aarch64)"; \
		echo ">>> Using cached runtime: $(APPIMAGE_RUNTIME_aarch64)"; \
	fi; \
	ARCH=$(PKG_ARCH) appimagetool --no-appstream $$runtime_opt AppDir $(APP_NAME)-$(version)-$(release).$(PKG_ARCH).AppImage
	@echo ">>> [APPIMAGE] Done: $(APP_NAME)-$(version)-$(release).$(PKG_ARCH).AppImage"
	@rm -rf AppDir
endif

# 打包为 .tar.gz (Arch/Gentoo/通用)
package-tar : clean-packaging
	@if [ -z "$(BINARY_TARBALL)" ]; then echo "Error: No binary tarball found."; exit 1; fi
	@echo ">>> [TAR] Creating portable tar.gz..."
	@mkdir -p $(APP_NAME)-portable/bin
	@mkdir -p $(APP_NAME)-portable/Data
	@tar -xf $(BINARY_TARBALL) -C $(APP_NAME)-portable/bin --strip-components=1
	@printf '#!/bin/sh\n' > $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'HERE="$$(cd "$$(dirname "$$0")" && pwd)"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'export HOME="$$HERE/Data"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'mkdir -p "$$HOME"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'exec "$$HERE/bin/$(APP_NAME)" "$$@"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@chmod +x $(APP_NAME)-portable/$(APP_NAME)-portable
	@tar -czf $(APP_NAME)-$(version)-$(release).$(PKG_ARCH).portable.tar.gz $(APP_NAME)-portable
	@echo ">>> [TAR] Done: $(APP_NAME)-$(version)-$(release).$(PKG_ARCH).portable.tar.gz"
	@rm -rf $(APP_NAME)-portable

# 快捷目标：一次性生成所有格式（生成后自动签名）
package-all : package-deb package-appimage package-tar package-rpm
	@echo ">>> [SIGN] Signing packages..."
	@# debsigs embedded signature for .deb (like rpmsign)
	@debfile=$(APP_NAME)_$(version)-$(release)_$(DEB_ARCH).deb; \
	if [ -f "$$debfile" ]; then \
	  debsigs --sign=origin --default-key=$(GPG_KEY_ID) "$$debfile" 2>/dev/null && echo "  DEBSIGS: $$debfile"; \
	fi || true
	@# GPG detached signatures for .AppImage, .tar.gz (skip if already signed)
	@for f in $(APP_NAME)-$(version)-$(release).$(PKG_ARCH).AppImage \
	          $(APP_NAME)-$(version)-$(release).$(PKG_ARCH).portable.tar.gz; do \
	  if [ -f "$$f" ] && [ ! -f "$$f.asc" ]; then \
	    gpg --batch --yes --detach-sign --armor "$$f" 2>/dev/null && echo "  GPG: $$f"; \
	  fi; \
	done || true
	@# rpmsign embedded signature for .rpm
	@rpmfile=$(APP_NAME)-$(version)-$(release).$(RPM_ARCH).rpm; \
	if [ -f "$$rpmfile" ]; then \
	  rpmsign --addsign "$$rpmfile" 2>/dev/null && echo "  RPMSIGN: $$rpmfile" || true; \
	fi
	@echo ">>> All packages generated and signed (arch: $(PKG_ARCH))."
	@ls -lh $(APP_NAME)*$(version)* 2>/dev/null | grep -E '\.(deb|AppImage|tar\.gz|rpm)$$' || true
	@echo ""
