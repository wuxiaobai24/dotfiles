#!/bin/bash

MIRROR='mirrors.tuna.tsinghua.edu.cn'

SOURCES=/etc/apt/sources.list
VERSION_CODE=$(cat /etc/os-release | grep VERSION_CODENAME |awk -F'=' '{print $2}')
echo "Systemt version code is $VERSION_CODE"

echo "Back up /etc/apt/sources.list"
sudo mv $SOURCES $SOURCES.bak
echo "Set up apt mirror"
sudo echo "\
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://$MIRROR/ubuntu/ $VERSION_CODE main restricted universe multiverse
# deb-src https://$MIRROR/ubuntu/ $VERSION_CODE main restricted universe multiverse
deb https://$MIRROR/ubuntu/ $VERSION_CODE-updates main restricted universe multiverse
# deb-src https://$MIRROR/ubuntu/ $VERSION_CODE-updates main restricted universe multiverse
deb https://$MIRROR/ubuntu/ $VERSION_CODE-backports main restricted universe multiverse
# deb-src https://$MIRROR/ubuntu/ $VERSION_CODE-backports main restricted universe multiverse
deb https://$MIRROR/ubuntu/ $VERSION_CODE-security main restricted universe multiverse
# deb-src https://$MIRROR/ubuntu/ $VERSION_CODE-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://$MIRROR/ubuntu/ $VERSION_CODE-proposed main restricted universe multiverse
# deb-src https://$MIRROR/ubuntu/ $VERSION_CODE-proposed main restricted universe multiverse
" > $SOURCES
