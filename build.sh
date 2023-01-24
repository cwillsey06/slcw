#!/bin/sh

SRC_DIR=$(pwd)

clean() {
	for DIR in */ ; do
		cd $DIR
		printf '%s\n' "removed ${DIR}src"
		rm -rf src/
		cd $SRC_DIR
	done
}

build() {
	for DIR in */ ; do
		cd $DIR
		printf '\n%s\n' "-> build: $DIR"
	
		git clone $(cat src.txt) src/
	
		for DIFF in *.diff ; do
			cd src
			if [ -f "$file" ]; then
				patch -p1 < $DIFF
			fi
			make 
			cd ..
		done
	
		cd $SRC_DIR
	done
}

case $1 in
	"-h")
		printf '%s\n'	"Usage: build.sh [-c|-h]" 
		printf '%s\n'	"With no arguments, clean & perform build task"
		printf '%s\n'	"  -c clean directories"
		printf '%s\n\n'	"  -h display help information";;
	"-c")
		printf '%s\n' "==> cleaning.."
		clean;;
	*)
		printf '%s\n' "==> cleaning.."
		clean
		printf '\n%s' "==> building.."
		build;;
esac

