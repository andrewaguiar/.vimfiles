#!/usr/bin/env bash
#
# deps: git, vim
# usage: install.sh

cd $HOME
git clone git@github.com:andrewaguiar/.vimfiles.git

# create backups
cp .vimrc .vimrc.bkp
cp -R .vim .vim.bkp

# create sym links
ln -s .vimfiles/.vimrc .vimrc
ln -s .vimfiles/.vim .vim
