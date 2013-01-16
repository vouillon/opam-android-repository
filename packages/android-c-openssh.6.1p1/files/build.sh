#!/bin/sh -e

PREFIX=$1
ANDROID_NDK=$PREFIX/lib/android-ndk-linux
EXEC_PREFIX=arm-linux-androideabi
TOOLCHAIN=${ANDROID_NDK}/toolchains/${EXEC_PREFIX}-4.7/prebuilt/linux-x86/bin
SYSROOT=$PREFIX/lib/android-ndk-linux/platforms/android-14/arch-arm
INCLUDES=$PREFIX/arm-linux-androideabi/include
LIBS=$PREFIX/arm-linux-androideabi/lib

CPPFLAGS="--sysroot $SYSROOT -I $INCLUDES -L $LIBS"
LDFLAGS=$CPPFLAGS
PATH=$TOOLCHAIN:$PATH
export CPPFLAGS LDFLAGS PATH

./configure  --host=$EXEC_PREFIX --prefix="$PREFIX/arm-linux-androideabi"

patch -p 0 < patch.txt

make ssh

cp ssh $PREFIX/arm-linux-androideabi/bin/