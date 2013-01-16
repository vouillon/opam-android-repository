#!/bin/sh -e

PREFIX=$1

BINS="ocaml ocamlbuild ocamlbuild.byte ocamlc ocamlcp ocamldebug ocamldep ocamldoc ocamllex ocamlmklib ocamlmktop ocamlobjinfo ocamlopt ocamloptp ocamlprof ocamlrun ocamlyacc"

for b in $BINS; do
  rm -f "$PREFIX/bin/arm-linux-androideabi-$b"
  rm -f "$PREFIX/bin/arm-linux-androideabi/$b"
done
rm -rf "$PREFIX/arm-linux-androideabi/lib/ocaml"
rm -f "$PREFIX/arm-linux-androideabi/bin/ocamlrun"
