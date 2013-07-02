#!/bin/bash

pushd ~

echo "PWD:$PWD for debug"

case $OSTYPE in
    darwin*) OS=macosx;;
    linux*)  OS=ubuntu;;
esac

echo "OS:$OS for debug"

if [ -f .profile ]; then
    rm .profile
fi
ln -s .envsetup.$OS/_profile   .profile
echo "refresh .profile"

if [ -f .vimrc ]; then
    rm .vimrc
fi
ln -s .envsetup.$OS/_vimrc     .vimrc
echo "refresh .vimrc"

if [ -f .gitconfig ]; then
    mv .gitconfig .gitconfig.bak
fi
cp .envsetup.$OS/_gitconfig .gitconfig
echo "refresh .gitconfig"

popd
