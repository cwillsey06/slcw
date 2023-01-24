#!/bin/sh

sh_dirname() {
    dir=${1:-.}
    dir=${dir%%"${dir##*[!/]}"}
    [ "${dir##*/*}" ] && dir=.
    dir=${dir%/*}
    dir=${dir%%"${dir##*[!/]}"}
    printf '%s\n' "${dir:-/}"
}

for DIR in */ ; do
	cd $DIR
	git clone $(cat src.txt)
	make clean build
done

