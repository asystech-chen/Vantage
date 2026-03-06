.PHONY : bsys6_x86_64_linux_xz_artifact full_build_stage2_linux bsys6_x86_64_macos_dmg_artifact full_build_stage2_macos bsys6_x86_64_windows_zip_artifact full_build_stage2_windows

#
# This makefile just uses bsys6 to build the package
# 
# we implicitly fully test that his source builds
# with the latest version of bsys6.
#
# so we also know that our docker images builds
# will succeed if this test succeeds.
#


bsys6_x86_64_linux_xz_artifact :

	rm -rf bsys6
	git clone "https://codeberg.org/librewolf/bsys6.git"
	(cd bsys6 && ${MAKE} -f ../assets/testing.mk full_build_stage2_linux)
	cp -v bsys6/*.xz .
	cp -v "bsys6/SOURCEDIR/librewolf-$$(cat version)-$$(cat release)/mozconfig" mozconfig.txt
	rm -rf bsys6


full_build_stage2_linux:

	echo "[debug] Starting full_build_stage2_linux"

	echo "VERSION=$$(cat ../version)-$$(cat ../release)" > env.sh
	echo "WORKDIR=$$(pwd)/WORKDIR" >> env.sh
	echo "TARGET=linux" >> env.sh
	echo "ARCH=x86_64" >> env.sh
	echo "SOURCEDIR=$$(pwd)/SOURCEDIR/librewolf-$$(cat ../version)-$$(cat ../release)" >> env.sh
	cat env.sh


	mkdir WORKDIR
	mkdir SOURCEDIR
	(cd SOURCEDIR && tar xf ../../librewolf*.tar.gz)


	TARGET=linux ARCH=x86_64 ./bsys6 prepare
	TARGET=linux ARCH=x86_64 ./bsys6 package

	@echo "[debug] Done full_build_stage2_linux"



#
# This code below is just block-copied from the linux case.
#



bsys6_x86_64_macos_dmg_artifact :

	rm -rf bsys6
	git clone "https://codeberg.org/librewolf/bsys6.git"
	(cd bsys6 && ${MAKE} -f ../assets/testing.mk full_build_stage2_macos)
	cp -v bsys6/*.dmg .
	cp -v "bsys6/SOURCEDIR/librewolf-$$(cat version)-$$(cat release)/mozconfig" mozconfig.txt
	rm -rf bsys6


full_build_stage2_macos:

	echo "[debug] Starting full_build_stage2_macos"

	echo "VERSION=$$(cat ../version)-$$(cat ../release)" > env.sh
	echo "WORKDIR=$$(pwd)/WORKDIR" >> env.sh
	echo "TARGET=macos" >> env.sh
	echo "ARCH=x86_64" >> env.sh
	echo "SOURCEDIR=$$(pwd)/SOURCEDIR/librewolf-$$(cat ../version)-$$(cat ../release)" >> env.sh
	cat env.sh


	mkdir WORKDIR
	mkdir SOURCEDIR
	(cd SOURCEDIR && tar xf ../../librewolf*.tar.gz)


	TARGET=macos ARCH=x86_64 ./bsys6 prepare
	TARGET=macos ARCH=x86_64 ./bsys6 package

	@echo "[debug] Done full_build_stage2_macos"




bsys6_x86_64_windows_zip_artifact :

	rm -rf bsys6
	git clone "https://codeberg.org/librewolf/bsys6.git"
	(cd bsys6 && ${MAKE} -f ../assets/testing.mk full_build_stage2_windows)
	cp -v bsys6/*.zip .
	cp -v "bsys6/SOURCEDIR/librewolf-$$(cat version)-$$(cat release)/mozconfig" mozconfig.txt
	rm -rf bsys6


full_build_stage2_windows:

	echo "[debug] Starting full_build_stage2_windows"

	echo "VERSION=$$(cat ../version)-$$(cat ../release)" > env.sh
	echo "WORKDIR=$$(pwd)/WORKDIR" >> env.sh
	echo "TARGET=windows" >> env.sh
	echo "ARCH=x86_64" >> env.sh
	echo "SOURCEDIR=$$(pwd)/SOURCEDIR/librewolf-$$(cat ../version)-$$(cat ../release)" >> env.sh
	cat env.sh


	mkdir WORKDIR
	mkdir SOURCEDIR
	(cd SOURCEDIR && tar xf ../../librewolf*.tar.gz)


	TARGET=windows ARCH=x86_64 ./bsys6 prepare
	TARGET=windows ARCH=x86_64 ./bsys6 package

	@echo "[debug] Done full_build_stage2_windows"


