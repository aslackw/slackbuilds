#!/bin/sh

BUILD_DIR=${BUILD_DIR:=/home/installs/mirrors/slackware64-current/extra/google-chrome}

ARCH=${ARCH:=$(uname -m)}
case $ARCH in
    "i?86")
        ARCH=i386
        ;;
    "x86_64")
        ARCH=amd64
        ;;
esac
CHANNEL=${CHANNEL:=stable}

cd $BUILD_DIR
[ -e google-chrome-${CHANNEL}_current_$ARCH.deb ] && rm google-chrome-${CHANNEL}_current_$ARCH.deb
wget -c --no-check-certificate https://dl.google.com/linux/direct/google-chrome-${CHANNEL}_current_$ARCH.deb

RELEASE=$CHANNEL ./google-chrome.SlackBuild

[ "x$1" == "x--install" ] && upgradepkg --install-new /tmp/google-chrome-*-$ARCH-*.txz
