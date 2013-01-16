#!/bin/sh -e

PREFIX=$1

make -C tools/extract_args

export PATH=$PREFIX/bin/arm-linux-androideabi:$PATH

./configure -sitelib "$PREFIX/arm-linux-androideabi/lib"

make install-meta

mkdir -p "$PREFIX/lib/findlib.conf.d"
cp android.conf "$PREFIX/lib/findlib.conf.d/"

chmod +x ocamlfind
cp ocamlfind "$PREFIX/bin/arm-linux-androideabi/ocamlfind"
ln -sf "$PREFIX/bin/arm-linux-androideabi/ocamlfind" \
     "$PREFIX/bin/arm-linux-androideabi-ocamlfind"
