#!/bin/sh -e

PREFIX=$1

ARCH=`uname | tr A-Z a-z`
ANDROID_NDK=$PREFIX/lib/android-ndk
EXEC_PREFIX=arm-linux-androideabi-
TOOLCHAIN=${ANDROID_NDK}/toolchains/${EXEC_PREFIX}4.7/prebuilt/$ARCH-x86/bin

export CROSS_COMPILE=$TOOLCHAIN/$EXEC_PREFIX

./Configure --prefix="$PREFIX/arm-linux-androideabi" android

export ANDROID_DEV=${ANDROID_NDK}/platforms/android-14/arch-arm/usr
make
make install
