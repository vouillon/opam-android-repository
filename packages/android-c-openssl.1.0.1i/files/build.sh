#!/bin/sh -e

PREFIX=$1

ARCH=`uname | tr A-Z a-z`
ANDROID_NDK=$PREFIX/lib/android-ndk
EXEC_PREFIX=arm-linux-androideabi-
TOOLCHAIN=${ANDROID_NDK}/toolchains/${EXEC_PREFIX}4.8/prebuilt/$ARCH-x86/bin

export CROSS_COMPILE=$TOOLCHAIN/$EXEC_PREFIX

./Configure --prefix="$PREFIX/arm-linux-androideabi" android-armv7 -mfpu=vfpv3-d16 -mhard-float -D_NDK_MATH_NO_SOFTFP=1 -Wl,--fix-cortex-a8 -Wl,--no-warn-mismatch -lm_hard

export ANDROID_DEV=${ANDROID_NDK}/platforms/android-14/arch-arm/usr
make all
make install_sw
