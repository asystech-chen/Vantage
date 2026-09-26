docker_targets=docker-build-image docker-run-build-job docker-remove-image
woodpecker_targets=fetch-upstream-woodpecker check-patchfail-woodpecker
testing_targets=full-test test test-linux test-macos test-windows
.PHONY : help moztree check all clean veryclean distclean patches dir bootstrap fetch build package package-all package-deb package-rpm package-appimage package-tar package-pe-sfx package-msix checksum run update setup-wasi check-patchfail check-fuzz fixfuzz $(docker_targets) $(woodpecker_targets) $(testing_targets)

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
FF_ESR ?= 1
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
	aria2c -x 16 -s 16 -o $(ff_source_tarball) "$(ff_source_url)"
	gpg --verify $(ff_source_tarball).asc $(ff_source_tarball)

$(lw_source_dir) : $(ff_source_tarball) ./version ./release scripts/librewolf-patches.py assets/mozconfig assets/patches.txt
	rm -rf $(ff_source_dir) $(lw_source_dir)
	tar xf $(ff_source_tarball)
	mv $(ff_source_dir) $(lw_source_dir)
	WIN_VARIANT="$(WIN_VARIANT)" python3 scripts/librewolf-patches.py $(version) $(release)
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
	@if [ -n "$${VANTAGE_JOBS}" ]; then \
	  echo ">>> mach build -j$${VANTAGE_JOBS} (VANTAGE_JOBS 覆盖)"; \
	  (cd $(lw_source_dir) && ./mach build -j$${VANTAGE_JOBS}); \
	else \
	  echo ">>> mach build (并行度由 mozconfig MOZ_PARALLEL_BUILD 决定)"; \
	  (cd $(lw_source_dir) && ./mach build); \
	fi

# 检测 Windows 编译类型（MSVC / MinGW）- 只对 Windows 构建有效。
# 仅当 MOZCONFIG 显式指定或 lw_source_dir/mozconfig 已存在时才检测；
# 否则按 Linux 处理（assets/mozconfig 是 Windows 配置，若在 make dir
# 阶段回退到它会误判 WIN_VARIANT，导致以 Windows 模式跑补丁脚本、
# 污染 Linux 构建树）。
WIN_VARIANT := $(shell mozcfg="$${MOZCONFIG:-$(lw_source_dir)/mozconfig}"; if [ ! -f "$$mozcfg" ]; then mozcfg=""; fi; if [ -n "$$mozcfg" ]; then grep -qE 'windows-msvc|pc-windows-msvc' "$$mozcfg" 2>/dev/null && echo msvc || (grep -qE 'windows-gnu|pc-mingw32' "$$mozcfg" 2>/dev/null && echo mingw || true); fi)

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
	     winupdater/Uninstall.ps1 \
	     $$OBJDIR/dist/bin/winupdater/; \
	  echo ">>> Ensuring WinUpdater entries in package-manifest.in..."; \
	  MF=$(lw_source_dir)/browser/installer/package-manifest.in; \
	  if ! grep -q "@RESPATH@/winupdater" "$$MF"; then \
	    printf '\n# Vantage WinUpdater\n@RESPATH@/winupdater/*\n' >> "$$MF"; \
	    echo "    Appended winupdater entries to $$MF"; \
	  else \
	    echo "    package-manifest.in already has winupdater entries"; \
	  fi; \
	  echo "    Done ($$OBJDIR/dist/bin/winupdater/)."; \
	else \
	  # 多平台共享同一源码目录：非 Windows 打包时移除 winupdater 条目，\
	  # 防止 Windows 平台注入的 manifest 残留污染 Linux/macOS 包。\
	  MF=$(lw_source_dir)/browser/installer/package-manifest.in; \
	  if grep -q "@RESPATH@/winupdater" "$$MF" 2>/dev/null; then \
	    echo ">>> Removing WinUpdater entries from package-manifest.in (non-Windows target)..."; \
	    sed -i '/# Vantage WinUpdater/d; /@RESPATH@\/winupdater/d' "$$MF"; \
	    echo "    Cleaned winupdater entries from $$MF"; \
	  fi; \
	fi
	# Vantage 体积优化：仅打包我们维护的 6 个语言包（回退：恢复下一行注释即可）
	# 原行为: (cd $(lw_source_dir) && cat browser/locales/shipped-locales | xargs ./mach package-multi-locale --locales)
	(cd $(lw_source_dir) && ./mach package-multi-locale --locales en-US en-GB en-CA zh-CN zh-MS zh-TW)
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
	    rm -rf $(APP_NAME)-portable; mkdir -p $(APP_NAME)-portable/$(APP_NAME) $(APP_NAME)-portable/Data; \
	    unzip -q "$$WIN_ZIP" -d $(APP_NAME)-portable; \
	    echo ">>> Bundling VC++ runtime DLLs..."; \
	    ./scripts/bundle-vcrt.sh $(APP_NAME)-portable/$(APP_NAME)/ 2>&1 || true; \
	    echo ">>> Bundling WinUpdater..."; \
	    if [ -f winupdater/Vantage-WinUpdater.exe ]; then \
	      mkdir -p $(APP_NAME)-portable/$(APP_NAME)/winupdater; \
	      cp winupdater/Vantage-WinUpdater.exe $(APP_NAME)-portable/$(APP_NAME)/winupdater/; \
	      cp winupdater/Vantage-WinUpdater.ico $(APP_NAME)-portable/$(APP_NAME)/winupdater/; \
	      cp winupdater/ScheduledTask-Create.ps1 $(APP_NAME)-portable/$(APP_NAME)/winupdater/; \
	      cp winupdater/ScheduledTask-Remove.ps1 $(APP_NAME)-portable/$(APP_NAME)/winupdater/; \
	      cp winupdater/Uninstall.ps1 $(APP_NAME)-portable/$(APP_NAME)/winupdater/; \
	      echo "    WinUpdater files bundled in portable package."; \
	    else \
	      echo "    (WinUpdater .exe not found, skipping)"; \
	    fi; \
	    printf '@echo off\r\n' > $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    printf 'set "HERE=%%~dp0"\r\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    printf 'if not exist "%%HERE%%Data\\profile" mkdir "%%HERE%%Data\\profile"\r\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    printf 'start "" "%%HERE%%$(APP_NAME)\\$(APP_NAME).exe" -profile "%%HERE%%Data\\profile" -no-remote %%*\r\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable.bat; \
	    rm -f $(APP_NAME)-$(version)-$(release).win-$$ARCH.portable.zip; zip -qr $(APP_NAME)-$(version)-$(release).win-$$ARCH.portable.zip $(APP_NAME)-portable; \
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
# PE-SFX: 单文件自解压 exe（WinPE 用；仅 x86_64）。不 portable（不加 -profile）。
# 依赖: 先 'make package' 出 win-x86_64 portable.zip；本目标从中裁剪+压制+组装。
package-pe-sfx :
	@echo ">>> [PE-SFX] 制作 PE 自解压包 (x86_64)..."; \
	PORTABLE_ZIP=$$(ls -t $(APP_NAME)*.win-x86_64.portable.zip 2>/dev/null | head -1); \
	if [ -z "$$PORTABLE_ZIP" ]; then echo "错误: 找不到 win-x86_64 portable.zip，请先 'make package'"; exit 1; fi; \
	echo "    源包: $$PORTABLE_ZIP"; \
	TMPDIR=$$(mktemp -d /tmp/vantage-pe-build.XXXXXX); \
	trap "rm -rf $$TMPDIR" EXIT; \
	unzip -q "$$PORTABLE_ZIP" -d "$$TMPDIR"; \
	echo ">>> [PE-SFX] 裁剪无用文件..."; \
	./scripts/strip-for-pe.sh "$$TMPDIR/$(APP_NAME)-portable"; \
	echo ">>> [PE-SFX] 7z 压缩 (BCJ2+LZMA，同 Firefox 安装器配方)..."; \
	( cd "$$TMPDIR/$(APP_NAME)-portable/$(APP_NAME)" && 7z a -t7z -mx -m0=BCJ2 -m1=LZMA:d25 -m2=LZMA:d19 -m3=LZMA:d19 -mb0:1 -mb0s1:2 -mb0s2:3 "$$TMPDIR/$(APP_NAME)-pe.7z" . >/dev/null ); \
	SFX_STUB="assets/7zsfx/7zSD.x64.sfx"; \
	SFX_CFG="assets/7zsfx/sfx-config-pe.txt"; \
	OUT_EXE="$(APP_NAME)-$(version)-$(release).win-x86_64.pe-sfx.exe"; \
	if [ ! -f "$$SFX_STUB" ]; then echo "错误: 缺少 SFX stub: $$SFX_STUB"; exit 1; fi; \
	cat "$$SFX_STUB" "$$SFX_CFG" "$$TMPDIR/$(APP_NAME)-pe.7z" > "$$OUT_EXE"; \
	ls -lh "$$OUT_EXE"; \
	echo ">>> [PE-SFX] ✅ 完成: $$OUT_EXE"

# MSIX: 将 Windows 包重新打包为 MSIX (Microsoft Store 格式)
# 依赖: package 必须先完成
# 签发给 Store 前，修改 PUBLISHER 为 Partner Center 注册的 CN
MSIX_PUBLISHER ?= CN=3A6B897B-1873-49F2-A0F3-AF6DFDA36245
MSIX_PUBLISHER_DISPLAY ?= ASYS Technology
MSIX_IDENTITY ?= ASYSTechnology.VantageBrowser

# 预打包后是否自动走远程封包（home-nas）。0 = 只留 *.msix-prepackage.zip
MSIX_REMOTE ?= 1
MSIX_REMOTE_HOST ?= home-nas
MSIX_REMOTE_DIR ?= D:/vantage-msix

# MSIX 目标架构：优先命令行 MSIX_ARCH=x86_64|aarch64；
# 否则从 MOZCONFIG 的 --target= 推导（build.sh 会导出 MOZCONFIG）；
# 都没有时回退到"最新修改的 Windows objdir"。
MSIX_ARCH ?= $(shell \
  mozcfg="$(MOZCONFIG)"; \
  [ -z "$$mozcfg" ] && mozcfg="$(lw_source_dir)/.mozconfig"; \
  if [ -f "$$mozcfg" ]; then \
    grep -oE 'target=[^[:space:]]*' "$$mozcfg" 2>/dev/null | grep -oE '(x86_64|aarch64)' | head -1; \
  fi)

# mach 的 MSIX 暂存槽位写死为 msix-temp-<channel>，不区分架构；
# 双架构编译时后完成的会留下残留污染 → 每次打包前先清空该槽位。
MSIX_STAGE_DIR := $$HOME/.mozbuild/cache/mach-msix/msix-temp-unofficial

package-msix :
	@ARCH_T="$(MSIX_ARCH)"; \
	if [ -z "$$ARCH_T" ]; then \
	  OBJDIR=$$(ls -td $(lw_source_dir)/obj-*pc-windows* 2>/dev/null | head -1); \
	  ARCH_T="$$(basename "$$OBJDIR" | grep -oE 'x86_64|aarch64' | head -1)"; \
	  echo ">>> [MSIX] 未指定 MSIX_ARCH，按最新 objdir 推断: $$ARCH_T"; \
	else \
	  OBJDIR="$(lw_source_dir)/obj-$$ARCH_T-pc-windows-msvc"; \
	fi; \
	case "$$ARCH_T" in x86_64|aarch64) ;; *) echo "错误: 无法确定架构 ($$ARCH_T)，请传 MSIX_ARCH=x86_64|aarch64"; exit 1 ;; esac; \
	if [ ! -d "$$OBJDIR" ]; then echo "错误: 找不到 objdir: $$OBJDIR（请先编译该架构）"; exit 1; fi; \
	WIN_ZIP=$$(ls -t $$OBJDIR/dist/*.zip 2>/dev/null | grep -v xpt_artifacts | head -1); \
	if [ -z "$$WIN_ZIP" ]; then \
	  echo "错误: 找不到 $$ARCH_T 的 Windows dist .zip，请先运行 'make package'"; \
	  exit 1; \
	fi; \
	ARCH="$$ARCH_T"; \
	ABS_ZIP="$$(realpath "$$WIN_ZIP")"; \
	ABS_OUT="$$(realpath .)/$(APP_NAME)-$(version)-$(release).$$ARCH.msix"; \
	PREPKG_ZIP="$$(realpath .)/$(APP_NAME)-$(version)-$(release).$$ARCH.msix-prepackage.zip"; \
	echo ">>> [MSIX] 架构: $$ARCH"; \
	echo "    输入: $$ABS_ZIP"; \
	echo "    Publisher: $(MSIX_PUBLISHER)"; \
	echo "    Identity:  $(MSIX_IDENTITY)"; \
	MKX="$$(realpath $(CURDIR)/scripts/msix-stage-shim)"; \
	echo ">>> [MSIX] 清空 mach 暂存槽位（避免上一架构残留混入）..."; \
	rm -rf "$(MSIX_STAGE_DIR)" "$(MSIX_STAGE_DIR)".prev* ; \
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
	    --output "$$ABS_OUT"; \
	MSIX_DIR="$$(ls -td $(MSIX_STAGE_DIR) 2>/dev/null | head -1)"; \
	if [ -z "$$MSIX_DIR" ]; then \
	  echo "错误: mach 预打包目录未生成"; exit 1; \
	fi; \
	rm -f "$$PREPKG_ZIP"; cd "$$(dirname "$$MSIX_DIR")" && zip -0qr "$$PREPKG_ZIP" "$$(basename "$$MSIX_DIR")" && cd - >/dev/null; \
	ls -lh "$$PREPKG_ZIP"; \
	if [ -f "$$ABS_OUT" ]; then \
	  echo ">>> [MSIX] ✅ MSIX 包已生成: $$ABS_OUT"; \
	elif [ "$(MSIX_REMOTE)" = "0" ]; then \
	  echo ""; \
	  echo "================================================"; \
	  echo "  📦 MSIX 预打包完成: $$PREPKG_ZIP"; \
	  echo "  ▶ Linux 无法封包（wine 的 ntdll 缺 makeappx 依赖的 AVL API）"; \
	  echo "    Windows 上: makeappx pack /d <解压>/msix-temp-unofficial /p x.msix /overwrite"; \
	  echo "    或: scripts/msix-remote.sh（自动传到 home-nas 封包并拉回）"; \
	  echo "================================================"; \
	else \
	  $(CURDIR)/scripts/msix-remote.sh --host "$(MSIX_REMOTE_HOST)" --dir "$(MSIX_REMOTE_DIR)" "$$PREPKG_ZIP"; \
	fi

# 把仓库根最新的 *.msix-prepackage.zip 送去打包机封包并拉回（也可单独调用）
package-msix-remote :
	@@PREPKG=$$(ls -t $(APP_NAME)-$(version)-$(release).*.msix-prepackage.zip 2>/dev/null | head -1); \
	if [ -z "$$PREPKG" ]; then echo "错误: 仓库根找不到 *.msix-prepackage.zip，先跑 'make package-msix'"; exit 1; fi; \
	$(CURDIR)/scripts/msix-remote.sh --host "$(MSIX_REMOTE_HOST)" --dir "$(MSIX_REMOTE_DIR)" "$$PREPKG"

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
	@rm -rf deb_build rpm_build AppDir .rpm-post-install.sh .rpm-post-remove.sh

# 打包为 .deb (Debian/Ubuntu/Mint)
package-deb : clean-packaging
	@if [ -z "$(BINARY_TARBALL)" ]; then echo "Error: No binary tarball found."; exit 1; fi
	@echo ">>> [DEB] Creating package from $(BINARY_TARBALL)..."
	@mkdir -p deb_build/opt/$(APP_NAME)
	@mkdir -p deb_build/DEBIAN
	@mkdir -p deb_build/usr/bin
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
	@echo "Depends: libgtk-3-0, libdbus-glib-1-2, libxtst6, libxss1, libasound2, ffmpeg" >> deb_build/DEBIAN/control
	@echo '#!/bin/sh' > deb_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@echo 'exec /opt/$(APP_NAME)/$(APP_NAME) "$$@"' >> deb_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@chmod +x deb_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@ln -sf /opt/$(APP_NAME)/$(APP_NAME) deb_build/usr/bin/$(APP_NAME)
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
	@mkdir -p rpm_build/usr/share/icons/hicolor/128x128/apps
	@mkdir -p rpm_build/usr/share/applications
	@tar -xf $(BINARY_TARBALL) -C rpm_build/opt/$(APP_NAME) --strip-components=1
	@echo '#!/bin/sh' > rpm_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@echo 'exec /opt/$(APP_NAME)/$(APP_NAME) "$$@"' >> rpm_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@chmod +x rpm_build/opt/$(APP_NAME)/$(APP_NAME).sh
	@if [ -f "$(LW_ICON)" ]; then cp "$(LW_ICON)" rpm_build/usr/share/icons/hicolor/128x128/apps/$(APP_NAME).png; fi
	@echo '[Desktop Entry]' > rpm_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Name=$(APP_DISPLAY_NAME)' >> rpm_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Exec=/opt/$(APP_NAME)/$(APP_NAME).sh' >> rpm_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Icon=$(APP_NAME)' >> rpm_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Type=Application' >> rpm_build/usr/share/applications/$(APP_NAME).desktop
	@echo 'Categories=Network;WebBrowser;' >> rpm_build/usr/share/applications/$(APP_NAME).desktop
	@printf '#!/bin/sh\n' > .rpm-post-install.sh
	@printf 'ln -sf /opt/$(APP_NAME)/$(APP_NAME) /usr/bin/$(APP_NAME)\n' >> .rpm-post-install.sh
	@printf 'command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database /usr/share/applications >/dev/null 2>&1 || true\n' >> .rpm-post-install.sh
	@printf 'command -v gtk-update-icon-cache >/dev/null 2>&1 && gtk-update-icon-cache -qtf /usr/share/icons/hicolor >/dev/null 2>&1 || true\n' >> .rpm-post-install.sh
	@printf '#!/bin/sh\n' > .rpm-post-remove.sh
	@printf 'rm -f /usr/bin/$(APP_NAME)\n' >> .rpm-post-remove.sh
	@fpm --force -s dir -t rpm -n $(APP_NAME) -v $(version) --iteration $(release) \
		--rpm-os linux \
		--rpm-compression xzmt \
		--architecture $(RPM_ARCH) \
		--rpm-autoreqprov \
        --rpm-tag "Recommends: ffmpeg" \
		--description "$(APP_DISPLAY_NAME) Web Browser" \
		--maintainer "Vantage Build" \
		--url "https://vantage.local" \
		--after-install .rpm-post-install.sh \
		--after-remove .rpm-post-remove.sh \
		-p $(APP_NAME)-$(version)-$(release).$(RPM_ARCH).rpm \
		-C rpm_build \
		opt/$(APP_NAME) usr/share/applications usr/share/icons
	@rm -f .rpm-post-install.sh .rpm-post-remove.sh
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
	@rm -rf $(APP_NAME)-portable
	@mkdir -p $(APP_NAME)-portable/$(APP_NAME)
	@mkdir -p $(APP_NAME)-portable/Data
	@tar -xf $(BINARY_TARBALL) -C $(APP_NAME)-portable/$(APP_NAME) --strip-components=1
	@printf '#!/bin/sh\n' > $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'HERE="$$(cd "$$(dirname "$$0")" && pwd)"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'export HOME="$$HERE/Data"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'export XDG_CONFIG_HOME="$$HERE/Data/config"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'export XDG_CACHE_HOME="$$HERE/Data/cache"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'export XDG_DATA_HOME="$$HERE/Data/share"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'export XDG_STATE_HOME="$$HERE/Data/state"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'mkdir -p "$$HOME" "$$XDG_CONFIG_HOME" "$$XDG_CACHE_HOME" "$$XDG_DATA_HOME" "$$XDG_STATE_HOME"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
	@printf 'exec "$$HERE/$(APP_NAME)/$(APP_NAME)" "$$@"\n' >> $(APP_NAME)-portable/$(APP_NAME)-portable
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
