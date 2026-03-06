tmpdir="tmpdir92"

if [ ! -f version ]; then
    echo "error: 'version' does not exist. Are you in the right folder?"
    exit 1
fi
firefox=firefox-$(cat version).source.tar.xz
if [ ! -f "$firefox" ]; then
    echo "error: '$firefox' does not exist."
    exit 1
fi

failed_patches=

rm -rf $tmpdir
mkdir $tmpdir
cd $tmpdir
tar xf ../$firefox
cd firefox-$(cat ../version)

for curpatch in $(cat ../../assets/patches.txt); do
    patch --fuzz=0 -p1 -i ../../$curpatch > ../patch.tmp

    s=""
    for j in $(grep -n rej$ ../patch.tmp | awk '{ print $(NF); }'); do
        s="$s $j"
    done
    s=$s
    
    if [ ! -z "$s" ]; then
        echo "$curpatch"
        git config --global commit.gpgsign false
        (ff=firefox-$(cat ../../version) && cd ../.. && scripts/git-patchtree.sh $curpatch && cd $ff && git diff $(git rev-list --max-parents=0 HEAD) HEAD > ../$curpatch.nofuzz && cd .. && rm -rf $ff)
        git config --global commit.gpgsign true
    fi
    
    
    rm -f ../patch.tmp
done

cd ../..
rm -rf $tmpdir
