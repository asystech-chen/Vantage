docker_targets=docker-build-image docker-run-build-job docker-remove-image
woodpecker_targets=fetch-upstream-woodpecker check-patchfail-woodpecker
testing_targets=full-test test test-linux test-macos test-windows
.PHONY : help moztree check all clean veryclean distclean patches dir bootstrap fetch build package run update setup-wasi check-patchfail check-fuzz fixfuzz $(docker_targets) $(woodpecker_targets) $(testing_targets)

version:=$(shell cat ./version)
release:=$(shell cat ./release)

FF_BASE_URL ?= https://archive.mozilla.org/pub/firefox/releases
FF_CHANNEL ?= releases
FF_BUILD ?= build1

# beta minor suffix (e.g "b9")
FF_BETA_SUFFIX ?=

ff_source_tarball := firefox-$(version)$(FF_BETA_SUFFIX).source.tar.xz

ifeq ($(FF_CHANNEL),candidates)
ff_source_url := https://archive.mozilla.org/pub/firefox/candidates/$(version)-candidates/$(FF_BUILD)/source/$(ff_source_tarball)
else ifeq ($(FF_CHANNEL),beta)
ff_source_url := https://archive.mozilla.org/pub/firefox/candidates/$(version)$(FF_BETA_SUFFIX)-candidates/$(FF_BUILD)/source/$(ff_source_tarball)
else
ff_source_url := $(FF_BASE_URL)/$(version)/source/$(ff_source_tarball)
endif

## simplistic archive format selection

#archive_create=tar cfJ
#ext=.tar.xz
archive_create:=tar cfz
ext:=.tar.gz

ff_source_dir:=firefox-$(version)
ff_source_tarball:=firefox-$(version).source.tar.xz

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
	wget -qO public_key.asc "https://keys.openpgp.org/vks/v1/by-fingerprint/14F26682D0916CDD81E37B6D61B7B526D98F0353"
	gpg --import public_key.asc
	rm -f public_key.asc
	wget -qO $(ff_source_tarball).asc "$(ff_source_url).asc"
	wget -qO $(ff_source_tarball) "$(ff_source_url)"
	gpg --verify $(ff_source_tarball).asc $(ff_source_tarball)

$(lw_source_dir) : $(ff_source_tarball) ./version ./release scripts/librewolf-patches.py assets/mozconfig assets/patches.txt
	rm -rf $(ff_source_dir) $(lw_source_dir)
	tar xf $(ff_source_tarball)
	mv $(ff_source_dir) $(lw_source_dir)
	python3 scripts/librewolf-patches.py $(version) $(release)

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

package :
	(cd $(lw_source_dir) && cat browser/locales/shipped-locales | xargs ./mach package-multi-locale --locales)
	find $(lw_source_dir)/obj-*/dist/ -name "*.tar.xz" -exec cp -v {} . \;

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
# 新增：本地打包为多种格式的目标
# ==========================================

# 查找最新生成的二进制 tarball（通配符匹配）
BINARY_TARBALL := $(shell ls -t *.tar.xz 2>/dev/null | head -n 1)

# 图标路径
LW_ICON := themes/browser/branding/librewolf/default128.png

# 软件名称配置
APP_NAME := vantage
APP_DISPLAY_NAME := Vantage

# 通用清理
clean-packaging :
	@rm -rf deb_build rpm_build AppDir

# 打包为 .deb (Debian/Ubuntu/Mint)
package-deb : package clean-packaging
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
	@echo "Architecture: amd64" >> deb_build/DEBIAN/control
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
	@dpkg-deb --build deb_build $(APP_NAME)_$(version)-$(release)_amd64.deb
	@echo ">>> [DEB] Done: $(APP_NAME)_$(version)-$(release)_amd64.deb"
	@rm -rf deb_build

# 打包为 .rpm (Fedora/CentOS/openSUSE) - 需要 fpm
package-rpm : package clean-packaging
	@if [ -z "$(BINARY_TARBALL)" ]; then echo "Error: No binary tarball found."; exit 1; fi
	@echo ">>> [RPM] Creating package from $(BINARY_TARBALL)..."
	@if ! command -v fpm >/dev/null 2>&1; then \
		echo "Error: fpm not found. Install with: gem install fpm"; \
		exit 1; \
	fi
	@mkdir -p rpm_build/opt/$(APP_NAME)
	@tar -xf $(BINARY_TARBALL) -C rpm_build/opt/$(APP_NAME) --strip-components=1
	@fpm -s dir -t rpm -n $(APP_NAME) -v $(version)-$(release) \
		--rpm-os linux \
		--description "$(APP_DISPLAY_NAME) Web Browser" \
		--maintainer "Vantage Build" \
		--url "https://vantage.local" \
		-C rpm_build/opt/$(APP_NAME) \
		--prefix /opt/$(APP_NAME)
	@echo ">>> [RPM] Done: $(APP_NAME)-$(version)-$(release).x86_64.rpm"
	@rm -rf rpm_build

# 打包为 .AppImage (通用)
package-appimage : package clean-packaging
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
	@ARCH=x86_64 appimagetool --no-appstream AppDir $(APP_NAME)-$(version)-$(release).x86_64.AppImage
	@echo ">>> [APPIMAGE] Done: $(APP_NAME)-$(version)-$(release).x86_64.AppImage"
	@rm -rf AppDir

# 打包为 .tar.gz (Arch/Gentoo/通用)
package-tar : package clean-packaging
	@if [ -z "$(BINARY_TARBALL)" ]; then echo "Error: No binary tarball found."; exit 1; fi
	@echo ">>> [TAR] Creating portable tar.gz..."
	@mkdir -p $(APP_NAME)-portable
	@tar -xf $(BINARY_TARBALL) -C $(APP_NAME)-portable --strip-components=1
	@tar -czf $(APP_NAME)-$(version)-$(release).portable.tar.gz $(APP_NAME)-portable
	@echo ">>> [TAR] Done: $(APP_NAME)-$(version)-$(release).portable.tar.gz"
	@rm -rf $(APP_NAME)-portable

# ==========================================
# Windows 简体中文安装包目标
# ==========================================
package-zhcn :
	@echo "=== 打包简体中文版本 ==="
	(cd $(lw_source_dir) && ./mach package-multi-locale --locales zh-CN)
	(cd $(lw_source_dir) && ./mach build installers-zh-CN)
	cp -v $(lw_source_dir)/obj-*/dist/librewolf-$(version)-$(release).zh-CN.*.zip . 2>/dev/null || true
	cp -v $(lw_source_dir)/obj-*/dist/librewolf-$(version)-$(release).zh-CN.*.exe . 2>/dev/null || true
	cp -v $(lw_source_dir)/obj-*/dist/librewolf-$(version)-$(release).zh-CN.*.tar.xz . 2>/dev/null || true
	@echo "=== 简体中文打包完成 ==="
	@echo "产物文件:"
	@ls -lh librewolf-$(version)-$(release).zh-CN.* 2>/dev/null || echo "未找到产物文件"
	
	
	
	
# 快捷目标：一次性生成所有格式
package-all : package package-deb package-appimage package-tar
	@echo ">>> All packages generated successfully."
	@ls -lh $(APP_NAME)*.$(version)*
