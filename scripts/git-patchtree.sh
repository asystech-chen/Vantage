#
# taken from ./scripts/check-patchfail.sh
#
# script: it 1) extract source 2) git init 2) grab filenames from diff and git add them
#


if [ ! -f version ]; then
    echo "error: 'version' does not exist. Are you in the right folder?"
    exit 1
fi
firefox=firefox-$(cat version).source.tar.xz
if [ ! -f "$firefox" ]; then
    echo "error: '$firefox' does not exist."
    exit 1
fi



if [ ! -f "$1" ]; then
    echo "git-patchtree.sh: error, first argument must be a patch file"
    exit 1
fi


echo "Removing previous firefox folder.."
rm -rf firefox-$(cat version)
echo "Extracting '$firefox'..."
tar xf $firefox
echo ""

cd firefox-$(cat version) && \
    git init && \
    git add $(grep '+++' "../$1" | awk '{print $2}' | sed s/^b/./) && \
    git commit -am "original"

patch -p1 -i "../$1"

git add $(grep '+++' "../$1" | awk '{print $2}' | sed s/^b/./) && \
    git commit -am "patch" && \
    echo "" && \
    echo "git-patchtree: Files under git control are: (git ls-tree -r HEAD --name-only)" && \
    git ls-tree -r HEAD --name-only
cd ..
