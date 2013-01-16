#!/bin/sh -e

PREFIX=$1
ANDROID_NDK=$PREFIX/lib/android-ndk-linux
EXEC_PREFIX=arm-linux-androideabi-
TOOLCHAIN=${ANDROID_NDK}/toolchains/${EXEC_PREFIX}4.7/prebuilt/linux-x86/bin
SYSROOT=$PREFIX/lib/android-ndk-linux/platforms/android-14/arch-arm
INCLUDE=$PREFIX/arm-linux-androideabi/include
CC="$TOOLCHAIN/${EXEC_PREFIX}gcc --sysroot $SYSROOT -I $INCLUDE"

./configure OCAMLFIND="$PREFIX/bin/ocamlfind -toolchain android"

make \
  PATH="$PREFIX/arm-linux-androideabi/bin/:$PATH" \
  LIBDIRS=$PREFIX/arm-linux-androideabi/lib"
  CC=$CC
make install
