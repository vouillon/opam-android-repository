#!/bin/sh -e

PREFIX=$1

ARCH=`uname | tr A-Z a-z`
ANDROID_NDK=$PREFIX/lib/android-ndk
EXEC_PREFIX=arm-linux-androideabi
TOOLCHAIN=${ANDROID_NDK}/toolchains/${EXEC_PREFIX}-4.8/prebuilt/$ARCH-x86/bin
SYSROOT=${ANDROID_NDK}/platforms/android-14/arch-arm
INCLUDES=$PREFIX/arm-linux-androideabi/include
LIBS=$PREFIX/arm-linux-androideabi/lib

CPPFLAGS="--sysroot $SYSROOT -I $INCLUDES -L $LIBS"
CFLAGS="-march=armv7-a -mfpu=vfpv3-d16 -mhard-float -D_NDK_MATH_NO_SOFTFP=1"
LDFLAGS="$CPPFLAGS -march=armv7-a -Wl,--fix-cortex-a8 -Wl,--no-warn-mismatch"
LIBS=-lm_hard
PATH=$TOOLCHAIN:$PATH
export CPPFLAGS CFLAGS LDFLAGS PATH LIBS

./configure  --host=$EXEC_PREFIX --prefix="$PREFIX/arm-linux-androideabi"

patch -p 0 < compilation.patch
patch -p 0 < home.patch

make ssh

cp ssh $PREFIX/arm-linux-androideabi/bin/
