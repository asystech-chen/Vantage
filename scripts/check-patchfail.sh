#!/bin/sh
tmpdir="tmpdir92"

if [ ! -f version ]; then
    echo "error: 'version' does not exist. Are you in the right folder?"
    exit 1
fi

FF_ESR="${FF_ESR:-1}"
if [ "$FF_ESR" = "1" ]; then
    esr_suffix="esr"
else
    esr_suffix=""
fi
firefox="firefox-$(cat version)${esr_suffix}.source.tar.xz"
if [ ! -f "$firefox" ]; then
    # 兼容无 esr 后缀的源码包
    firefox_alt="firefox-$(cat version).source.tar.xz"
    if [ -f "$firefox_alt" ]; then
        firefox="$firefox_alt"
    else
        echo "error: '$firefox' does not exist."
        exit 1
    fi
fi



failed_patches=

echo "Removing '$tmpdir'..."
rm -rf $tmpdir
mkdir $tmpdir
cd $tmpdir
echo "Extracting '$firefox'..."
tar xf ../$firefox
cd firefox-$(cat ../version)

# 与 librewolf-patches.py 保持一致：先把 .rc 转 LF，避免 fix-7zsfx 的假失败
find . -name '*.rc' -type f -exec sed -i 's/\r$//' {} + 2>/dev/null || true

echo ""
echo "Testing patches..."

# 默认零 fuzz：上下文必须精确匹配，避免 patch 静默偏移
fuzz_args="--fuzz=0"
case " $* " in
    *" --fuzz"*) fuzz_args="" ;;
esac

for curpatch in $(cat ../../assets/patches.txt); do
    echo ""
    echo "==> $curpatch:"
    echo ""
    patch $fuzz_args $* -p1 -i ../../$curpatch > ../patch.tmp
    cat ../patch.tmp

    ######################
    s=""
    for j in $(grep -n rej$ ../patch.tmp | awk '{ print $(NF); }'); do
	s="$s $j"
	echo "---[snip]---------- --> $j:"
	cat $j
	echo "---[snip]----------"
    done
    s=$s

    if [ ! -z "$s" ]; then
	failed_patches="$failed_patches [$curpatch]"
    fi
    #######################

    rm -f ../patch.tmp
    #patch -R -p1 -i ../../$i
done

cd ../..
echo ""
echo "Removing '$tmpdir'..."
rm -rf $tmpdir
echo ""

if [ ! -z "$failed_patches" ]; then
    echo $failed_patches
    echo ""
    echo "error: Some patches failed!"
    exit 1
else
    echo "success: All patches where applied successfully."
    exit 0
fi
