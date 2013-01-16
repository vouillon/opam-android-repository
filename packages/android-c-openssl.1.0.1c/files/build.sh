#!/bin/sh -e

PREFIX=$1
ANDROID_NDK=$PREFIX/lib/android-ndk-linux
EXEC_PREFIX=arm-linux-androideabi-
TOOLCHAIN=${ANDROID_NDK}/toolchains/${EXEC_PREFIX}4.7/prebuilt/linux-x86/bin

export CROSS_COMPILE=$TOOLCHAIN/$EXEC_PREFIX

./Configure --prefix="$PREFIX/arm-linux-androideabi" android

export ANDROID_DEV=${ANDROID_NDK}/platforms/android-14/arch-arm/usr
make
make install
