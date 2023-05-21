#! /bin/sh

echo "$1" | grep -q 'jffs2/target$' || exit 0
echo 'Trimming jffs2 image to the contents of /etc'
find "$1" -mindepth 1 -maxdepth 1 -not -name 'etc' -print0 | xargs -0 rm -rf
mv "$1/etc/"* "$1"
rm -rf "$1/etc"
