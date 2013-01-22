#!/bin/sh -e

PREFIX=$1

ARCH=`uname | tr A-Z a-z`
ANDROID_NDK=$PREFIX/lib/android-ndk
EXEC_PREFIX=arm-linux-androideabi-
TOOLCHAIN=${ANDROID_NDK}/toolchains/${EXEC_PREFIX}4.7/prebuilt/$ARCH-x86/bin
SYSROOT=${ANDROID_NDK}/platforms/android-14/arch-arm
INCLUDE=$PREFIX/arm-linux-androideabi/include
#CC="$TOOLCHAIN/${EXEC_PREFIX}gcc --sysroot $SYSROOT -I $INCLUDE"

CPPFLAGS="--sysroot $SYSROOT -I$PREFIX/arm-linux-androideabi/include"
LDFLAGS=-L$PREFIX/arm-linux-androideabi/lib
PATH="$PREFIX/bin/arm-linux-androideabi:$TOOLCHAIN:$PATH"

export CPPFLAGS LDFLAGS PATH

./configure --host arm-linux-androideabi OCAMLFIND="$PREFIX/bin/ocamlfind -toolchain android" LIBS=-lcrypto

make CLIBS="ssl crypto"
make install
